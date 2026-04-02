WITH base AS (
    SELECT *,
        TIMESTAMPDIFF(
            MINUTE,
            LAG(txn_time) OVER (PARTITION BY user_id ORDER BY txn_time),
            txn_time
        ) AS df,

        ROUND(AVG(amount) OVER (PARTITION BY user_id), 2) AS av,

        CASE 
            WHEN TIMESTAMPDIFF(
                    MINUTE,
                    LAG(txn_time) OVER (PARTITION BY user_id ORDER BY txn_time),
                    txn_time
                 ) <= 5
             AND LAG(location) OVER (PARTITION BY user_id) IS NOT NULL
             AND LAG(location) OVER (PARTITION BY user_id) <> location 
            THEN 1 ELSE 0 
        END AS loc_change,

        CASE 
            WHEN (ROUND(AVG(amount) OVER (
                    PARTITION BY user_id 
                    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
                 ), 2) * 3) < amount 
            THEN 2 ELSE 0 
        END AS 3x_avg

    FROM txn
),

vel AS (
    SELECT *,
        CASE 
            WHEN SUM(IFNULL(df, 0)) OVER (
                    PARTITION BY user_id 
                    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                 ) <= 2
             AND COUNT(*) OVER (
                    PARTITION BY user_id 
                    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
                 ) >= 3 
            THEN 3 ELSE 0 
        END AS 3_and_more_trns

    FROM base
),

comb AS (
    SELECT user_id, MAX(txn_id) txn_id, MAX(txn_time) txn_time,
           MAX(3_and_more_trns) AS fraud_reason
    FROM vel 
    GROUP BY 1

    UNION

    SELECT user_id, MAX(txn_id), MAX(txn_time),
           MAX(3x_avg)
    FROM vel 
    GROUP BY 1

    UNION

    SELECT user_id, MAX(txn_id), MAX(txn_time),
           MAX(loc_change)
    FROM vel 
    GROUP BY 1
),

final_flags AS (
    SELECT user_id, txn_id, txn_time,
        CASE 
            WHEN fraud_reason = 1 THEN 'location change'
            WHEN fraud_reason = 2 THEN 'amount spike'
            ELSE 'velocity'
        END AS fraud_reason
    FROM comb
    WHERE fraud_reason > 0
)

-- SELECT * 
-- FROM final_flags

-- Aggregated Output
SELECT 
    txn_id,
    user_id,
    MAX(txn_time) AS txn_time,
    GROUP_CONCAT(fraud_reason ORDER BY fraud_reason, ',') AS fraud_reason
FROM final_flags
GROUP BY 1,2
ORDER BY 1;
