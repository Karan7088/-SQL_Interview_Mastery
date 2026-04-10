WITH base AS (
    SELECT 
        *,
        
        CASE 
            WHEN event_type = 'pause' 
                 AND LAG(event_type) OVER (
                        PARTITION BY process_id 
                        ORDER BY event_time
                 ) != 'pause'
            THEN 
                TIMESTAMPDIFF(
                    MINUTE,
                    LEAD(event_time) OVER (
                        PARTITION BY process_id 
                        ORDER BY event_time
                    ),
                    event_time
                )
            
            ELSE 
                TIMESTAMPDIFF(
                    MINUTE,
                    event_time,
                    LEAD(event_time) OVER (
                        PARTITION BY process_id 
                        ORDER BY event_time
                    )
                )
        END AS df
        
    FROM process_logs
)

-- SELECT * FROM base;

SELECT 
    process_id,
    SUM(IFNULL(df, 0)) AS active_minutes
FROM base
WHERE df > 0
GROUP BY process_id;
