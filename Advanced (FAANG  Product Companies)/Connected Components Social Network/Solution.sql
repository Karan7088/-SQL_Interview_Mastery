WITH RECURSIVE cte AS (
    SELECT 
        user1 AS st,
        user2
    FROM friendships

    UNION 

    SELECT 
        st,
        f.user2
    FROM cte 
    INNER JOIN friendships f 
        ON cte.user2 = f.user1
),

cte2 AS (
    SELECT 
        *,
        DENSE_RANK() OVER (ORDER BY st) rn 
    FROM cte  
    ORDER BY 1
),

cte3 AS (
    SELECT 
        st,
        user2,
        CASE 
            WHEN st NOT IN (
                SELECT user2 
                FROM cte2 
                WHERE rn < a.rn
            ) 
            THEN 1 
            ELSE 0 
        END AS sts 
    FROM cte2 a
)

SELECT 
    st AS component_id,
    GROUP_CONCAT(DISTINCT user2 SEPARATOR ',') AS component 
FROM cte3 
WHERE sts = 1 
GROUP BY 1;
