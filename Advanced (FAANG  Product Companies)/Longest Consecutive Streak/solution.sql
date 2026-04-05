WITH cte AS (
    SELECT 
        cid,
        tdate,
        DATE_SUB(
            tdate, 
            INTERVAL ROW_NUMBER() OVER (
                PARTITION BY cid 
                ORDER BY tdate
            ) DAY
        ) AS df
    FROM txn
    WHERE amt >= 200
    ORDER BY cid, tdate
),

cte2 AS (
    SELECT 
        cid,
        COUNT(*) AS streak_len,
        MIN(tdate) AS start_date,
        MAX(tdate) AS end_date
    FROM cte
    GROUP BY cid, df
),

cte3 AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY cid 
            ORDER BY streak_len DESC, end_date DESC
        ) AS rn
    FROM cte2
)

SELECT 
    cid,
    start_date,
    end_date,
    streak_len
FROM cte3
WHERE rn = 1;
