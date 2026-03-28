WITH cte AS (
    SELECT 
        user_id,
        event_id,
        event_time,

        LAG(event_time) OVER (
            PARTITION BY user_id 
            ORDER BY event_time
        ) AS lg,

        TIMESTAMPDIFF(
            MINUTE,
            LAG(event_time) OVER (
                PARTITION BY user_id 
                ORDER BY event_time
            ),
            event_time
        ) AS df,

        CASE 
            WHEN TIMESTAMPDIFF(
                    MINUTE,
                    LAG(event_time) OVER (
                        PARTITION BY user_id 
                        ORDER BY event_time
                    ),
                    event_time
                 ) > 30 
            THEN 1 
            ELSE 0 
        END AS st

    FROM events
),

cte2 AS (
    SELECT 
        *,
        ROW_NUMBER() OVER () AS rn
    FROM cte 
    WHERE st = 1
),

cte3 AS (
    SELECT 
        cte.*,

        IFNULL(
            IFNULL(
                cte2.rn,
                MAX(cte2.rn) OVER (
                    ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
                )
            ),
            0
        ) AS rn

    FROM cte2 
    RIGHT JOIN cte 
        ON cte.event_id = cte2.event_id 
       AND cte.user_id = cte2.user_id
),

cte4 AS (
    SELECT 
        rn,
        user_id,
        event_id,

        MIN(event_time) OVER (
            PARTITION BY user_id, rn
        ) AS session_start,

        MAX(event_time) OVER (
            PARTITION BY user_id, rn
        ) AS session_end,

        COUNT(*) OVER (
            PARTITION BY user_id, rn
        ) AS total_events,

        ROW_NUMBER() OVER (
            PARTITION BY user_id, rn
        ) AS rn2

    FROM cte3
)

SELECT 
    user_id, 
    event_id,

    ROW_NUMBER() OVER (
        PARTITION BY user_id 
        ORDER BY session_start ASC
    ) AS session_id,

    session_start,
    session_end,
    total_events

FROM cte4 
WHERE rn2 = 1;
















