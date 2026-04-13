WITH base AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY DATE_FORMAT(order_date,"%Y-%m")) AS rn,
           DATE_FORMAT(order_date,"%Y-%m") AS ym
    FROM orders
    WHERE status = "completed"
),

cte2 AS (
    SELECT *,
           MIN(ym) OVER (PARTITION BY user_id) AS first_mn,
           SUM(amount) OVER (PARTITION BY user_id, ym) AS total,
           ROW_NUMBER() OVER (PARTITION BY user_id, ym) AS rn2
    FROM base
),

cte3 AS (
    SELECT DISTINCT ym AS cohort_month
    FROM base
),

cte4 AS (
    SELECT a.cohort_month,
           b.cohort_month AS activity_month
    FROM cte3 a
    CROSS JOIN cte3 b
    ORDER BY 1,2
)

SELECT cte4.*,
       SUM(total) AS total_revenue
FROM cte4
INNER JOIN cte2
    ON cohort_month = first_mn
   AND ym = activity_month
   AND rn2 = 1
GROUP BY 1,2
ORDER BY 1,2;
