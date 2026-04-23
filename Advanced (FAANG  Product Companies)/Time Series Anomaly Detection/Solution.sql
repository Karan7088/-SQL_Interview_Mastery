WITH base AS (
    SELECT 
        id, 
        sale_date,
        region,
        SUM(revenue) OVER (PARTITION BY sale_date, region) AS rev,
        ROW_NUMBER() OVER (PARTITION BY sale_date, region) AS rn
    FROM sales_timeseries
),

cte2 AS (
    SELECT 
        *,
        ROUND(
            AVG(rev) OVER (
                PARTITION BY region 
                ORDER BY sale_date 
                ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
            ), 2
        ) AS mov_avg,

        ROUND(
            STDDEV_SAMP(rev) OVER (
                PARTITION BY region 
                ORDER BY sale_date 
                ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
            ), 2
        ) AS mov_std,

        ROW_NUMBER() OVER (
            PARTITION BY region 
            ORDER BY sale_date
        ) AS rn2

    FROM base 
    WHERE rn = 1
)

SELECT 
    *,
    rev - mov_avg AS Dev,

    CASE 
        WHEN mov_std IS NULL OR mov_std = 0 THEN NULL
        ELSE (rev - mov_avg) / mov_std
    END AS z,

    CASE 
        WHEN rn2 <= 2 THEN 'INSUFFICIENT_DATA'
        WHEN mov_std IS NULL OR mov_std = 0 THEN "Normal"
        WHEN (rev - mov_avg) / mov_std < -2 THEN "Drop"
        WHEN (rev - mov_avg) / mov_std > 2 THEN "Spike"
        ELSE "Normal"
    END AS Flag

FROM cte2;
