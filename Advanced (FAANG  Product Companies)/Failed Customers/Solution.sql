SELECT 
    O.user_id
FROM 
    orders O
LEFT JOIN 
    payments P 
    ON O.order_id = P.order_id
GROUP BY 
    O.user_id
HAVING 
    MAX(
        CASE 
            WHEN YEAR(O.order_date) = 2024 
                 AND O.status = 'completed' 
            THEN 1 
            ELSE 0 
        END
    ) = 1
    AND
    MIN(
        CASE 
            WHEN P.status != 'success' 
            THEN 1 
            ELSE 0 
        END
    ) = 1;
