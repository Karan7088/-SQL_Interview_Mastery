WITH base AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY user_id, DATE(event_time) 
            ORDER BY event_time DESC
        ) AS dup
    FROM user_events
    ORDER BY 1
),

cte2 AS (
    SELECT 
        *,
        MIN(DATE(event_time)) OVER (PARTITION BY user_id) AS mn,
        ROW_NUMBER() OVER (
            PARTITION BY user_id 
            ORDER BY event_time
        ) AS rn
    FROM base 
    WHERE dup = 1
),

cte3 AS (
    SELECT DISTINCT 
        DATE(event_time) AS event_date 
    FROM cte2 
    WHERE rn = 1
)

SELECT 
    event_date,

    (
        SELECT COUNT(DISTINCT user_id) 
        FROM cte2 
        WHERE mn = event_date
    ) AS new_users,

    (
        SELECT COUNT(DISTINCT user_id) 
        FROM cte2 
        WHERE DATE(event_time) = event_date 
          AND rn > 1
    ) AS repeat_users

FROM cte3;
