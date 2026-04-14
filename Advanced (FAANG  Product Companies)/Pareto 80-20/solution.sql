WITH user_revenue AS (
    SELECT 
        user_id,
        SUM(amount) OVER (PARTITION BY user_id) AS total_by_user,
        ROW_NUMBER() OVER (PARTITION BY user_id) AS dup_user
    FROM trns 
    WHERE status = "completed"
),

cumulative_calc AS (
    SELECT 
        *,
        SUM(total_by_user) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumsum,
        SUM(total_by_user) OVER () AS total
    FROM user_revenue 
    WHERE dup_user = 1 
    ORDER BY total_by_user DESC
),

pareto_flagging AS (
    SELECT 
        user_id,
        total_by_user,
        cumsum,
        ROW_NUMBER() OVER (ORDER BY cumsum) AS rn2,
        CONCAT(ROUND(cumsum / total * 100.0, 2), "%") AS contribution_pct,
        CASE 
            WHEN cumsum / total * 100.0 >= 80 THEN 1 
            ELSE 0 
        END AS st
    FROM cumulative_calc
)

SELECT 
    user_id,
    total_by_user,
    cumsum,
    contribution_pct 
FROM pareto_flagging 
WHERE rn2 <= (
    SELECT MIN(rn2) 
    FROM pareto_flagging 
    WHERE st = 1
);
