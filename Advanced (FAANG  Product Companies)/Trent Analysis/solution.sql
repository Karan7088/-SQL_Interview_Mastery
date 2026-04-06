WITH trend_flag AS (
    SELECT 
        id,
        sale_date,
        revenue,
        CASE 
            WHEN revenue - LAG(revenue) OVER (ORDER BY sale_date) < 0 
            THEN 1 ELSE 0 
        END AS is_drop
    FROM sales_data
),

drop_groups AS (
    SELECT 
        id,
        sale_date,
        revenue,
        id - ROW_NUMBER() OVER (ORDER BY id) AS grp
    FROM trend_flag
    WHERE is_drop = 1
),

group_start AS (
    SELECT 
        id,
        MIN(sale_date) OVER (PARTITION BY grp) AS sale_date,
        revenue,
        grp
    FROM drop_groups
),

first_drop AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY grp ORDER BY id) AS rn
    FROM group_start
)

SELECT 
    id,
    sale_date,
    revenue
FROM first_drop
WHERE rn = 1;
