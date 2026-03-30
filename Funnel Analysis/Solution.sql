WITH stage_mapping AS (
    SELECT *,
           CASE 
               WHEN status = 'active' THEN 1 
               WHEN status = 'paused' THEN 2 
               WHEN status = 'resumed' THEN 3
               ELSE 4 
           END AS stage_order
    FROM subscriptions
    WHERE status != "inactive"
),

stage_transitions AS (
    SELECT DISTINCT 
           status,
           CASE 
               WHEN LAG(status) OVER (ORDER BY stage_order) != status 
               THEN CONCAT(LAG(status) OVER (ORDER BY stage_order), '->', status) 
               ELSE status 
           END AS stage,
           ROW_NUMBER() OVER (PARTITION BY status, stage_order) AS rn,
           stage_order
    FROM stage_mapping
    ORDER BY 3
),

user_stage_flow AS (
    SELECT *,
           CASE 
               WHEN LAG(stage_order) OVER (PARTITION BY user_id ORDER BY stage_order) IS NOT NULL 
               THEN CONCAT(LAG(stage_order) OVER (PARTITION BY user_id ORDER BY stage_order), stage_order) 
               ELSE stage_order 
           END AS stage_track
    FROM stage_mapping
    ORDER BY 1
),

unique_stages AS (
    SELECT stage,
           CASE 
               WHEN LAG(stage_order) OVER (ORDER BY stage_order) IS NOT NULL 
               THEN CONCAT(LAG(stage_order) OVER (ORDER BY stage_order), stage_order) 
               ELSE stage_order 
           END AS stage_key
    FROM stage_transitions
    WHERE rn = 1
    ORDER BY 2
),

stage_counts AS (
    SELECT stage,
           (
               SELECT COUNT(DISTINCT user_id) 
               FROM user_stage_flow 
               WHERE unique_stages.stage_key = user_stage_flow.stage_track
           ) AS users
    FROM unique_stages
)

SELECT *,
       IFNULL(LAG(users) OVER(), '-') AS PreviousStageUsers,
       IFNULL(LAG(users) OVER() - users, '-') AS Drop_off_Users,
       IFNULL(((LAG(users) OVER() - users) / LAG(users) OVER()) * 100.0, '-') AS drop_pct
FROM stage_counts;
