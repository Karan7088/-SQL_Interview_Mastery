-- View source data
SELECT *
FROM customer_source
ORDER BY 1, 4;

WITH base AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id, city 
            ORDER BY updated_at
        ) AS rn,
        
        IFNULL(
            LEAD(city) OVER (
                PARTITION BY customer_id 
                ORDER BY updated_at
            ),
            city
        ) AS ld
    FROM customer_source
),

cte2 AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id, city, ld 
            ORDER BY updated_at ASC
        ) AS rn2
    FROM base
    ORDER BY 1, 4
),

cte3 AS (
    SELECT 
        customer_id,
        customer_name,
        city,
        updated_at AS start_date,

        CASE 
            WHEN LEAD(updated_at) OVER (
                    PARTITION BY customer_id 
                    ORDER BY updated_at
                 ) IS NOT NULL 
            THEN DATE_SUB(
                    LEAD(updated_at) OVER (
                        PARTITION BY customer_id 
                        ORDER BY updated_at
                    ),
                    INTERVAL 1 DAY
                 )
            ELSE NULL 
        END AS end_date

    FROM cte2
    WHERE 
        (rn2 = 1 AND rn = 1) 
        OR 
        (rn2 = 1 AND city = ld)
)

SELECT 
    customer_id,
    customer_name,
    city,
    start_date,
    end_date,
    
    CASE 
        WHEN end_date IS NOT NULL THEN 'N' 
        ELSE 'Y' 
    END AS is_current

FROM cte3;
