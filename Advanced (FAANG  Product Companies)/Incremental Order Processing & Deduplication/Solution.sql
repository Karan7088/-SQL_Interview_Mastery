WITH base AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY order_id, order_status, updated_at
           ) AS dedup
    FROM orders_source
),

cte AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY order_id
               ORDER BY updated_at
           ) AS rn
    FROM base
    WHERE dedup = 1
),

cte2 AS (
    SELECT *,
           MAX(rn) OVER (
               PARTITION BY order_id
               ORDER BY updated_at
               ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
           ) AS mx
    FROM cte
)

SELECT
    order_id,
    customer_id,
    order_amount,
    order_status,
    updated_at
FROM cte2
WHERE rn = mx;
