WITH login_dedup AS (
    SELECT 
        user_id,
        DATE(event_time) AS login_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id, DATE(event_time)
            ORDER BY event_time
        ) AS rn
    FROM events
    WHERE event_type = 'login'
),

login_clean AS (
    SELECT 
        user_id,
        login_date,
        DATE_SUB(
            login_date,
            INTERVAL ROW_NUMBER() OVER (
                PARTITION BY user_id 
                ORDER BY login_date
            ) DAY
        ) AS grp_key
    FROM login_dedup
    WHERE rn = 1
)

SELECT 
    user_id,
    MIN(login_date) AS streak_start,
    MAX(login_date) AS streak_end,
    COUNT(*) AS consecutive_days
FROM login_clean
GROUP BY user_id, grp_key
ORDER BY user_id, streak_start;
