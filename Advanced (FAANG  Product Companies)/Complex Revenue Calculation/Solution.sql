WITH dedup AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY order_id, product_id, price
           ) AS rn
    FROM order_items
),

agg AS (
    SELECT 
        o.*,
        SUM(price) OVER (
            PARTITION BY order_id
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS total,
        ROW_NUMBER() OVER (PARTITION BY order_id) AS rn2,
        product_name
    FROM dedup o
    LEFT JOIN products p 
        ON p.product_id = o.product_id
    WHERE rn = 1
      AND p.category = 'electronics'
)

SELECT 
    SUM(agg.total) AS total_revenue,
    o.user_id,
    u.country
FROM agg
INNER JOIN orders o 
    ON agg.order_id = o.order_id
INNER JOIN users u 
    ON u.user_id = o.user_id
WHERE rn2 = 1
  AND o.status = "completed"
  AND YEAR(o.order_date) = 2024
  AND u.status = "active"
GROUP BY 2, 3;
