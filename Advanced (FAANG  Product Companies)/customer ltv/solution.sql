WITH base AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id, order_date, amount, status
        ) AS rn,
        CASE 
            WHEN status = 'completed' THEN 1 
            ELSE 2 
        END AS st
    FROM orders
    WHERE status != 'cancelled'
),

cte AS (
    SELECT 
        *,
        CASE 
            WHEN MAX(st) OVER (
                    PARTITION BY customer_id 
                    ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
                 ) != 1
                 AND status = 'refunded'
            THEN 1 
            ELSE 0 
        END AS st2
    FROM base
    WHERE rn = 1
),

cte2 AS (
    SELECT 
        *,
        MAX(st2) OVER (PARTITION BY customer_id) AS mx
    FROM cte
),

cte3 AS (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(cte2.amount) AS ltv
    FROM customers c
    LEFT JOIN cte2 
        ON c.customer_id = cte2.customer_id
    WHERE mx != 1
    GROUP BY c.customer_id, c.customer_name
)

SELECT * 
FROM cte3

UNION

SELECT 
    customer_id, 
    customer_name, 
    0 AS ltv
FROM customers 
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id 
    FROM cte3
);
