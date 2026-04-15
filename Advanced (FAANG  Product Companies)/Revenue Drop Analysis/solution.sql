WITH revenue_analysis AS (
    SELECT 
        id,
        revenue_date,
        revenue AS current_revenue,

        -- Previous day's revenue
        LAG(revenue) OVER (ORDER BY revenue_date) AS prev_revenue,

        -- Percentage change (Day-over-Day)
        (
            (revenue - LAG(revenue) OVER (ORDER BY revenue_date)) 
            / LAG(revenue) OVER (ORDER BY revenue_date)
        ) * 100.0 AS pct_change

    FROM daily_revenue
)

SELECT 
    revenue_date,
    current_revenue,
    prev_revenue,

    -- Convert negative drop to positive for readability
    ABS(ROUND(pct_change, 2)) AS drop_percentage

FROM revenue_analysis

-- Filter only significant drops (≥ 30%)
WHERE pct_change <= -30

ORDER BY revenue_date;
