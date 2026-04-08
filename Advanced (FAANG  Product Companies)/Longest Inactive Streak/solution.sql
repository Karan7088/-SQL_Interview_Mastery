WITH cte AS (
    SELECT 
        *,
        CASE 
            WHEN COUNT(*) OVER (PARTITION BY user_id) > 1 
            THEN IFNULL(
                DATEDIFF(
                    login_date,
                    LAG(login_date) OVER (PARTITION BY user_id ORDER BY login_date)
                ), 
            0)
            ELSE NULL 
        END AS df
    FROM logins
)
SELECT 
    user_id,
    MAX(df) AS longest_inactive_days
FROM cte
GROUP BY user_id;
