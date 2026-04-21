WITH RECURSIVE CTE AS (
    SELECT 
        EMP_ID,
        EMP_NAME,
        MANAGER_ID,
        1 AS lvl,
        EMP_NAME AS path
    FROM employees

    UNION

    SELECT  
        a.EMP_ID,
        a.EMP_NAME,
        a.MANAGER_ID,
        lvl + 1,
        CONCAT(path, "-> ", a.EMP_NAME) AS path
    FROM CTE
    INNER JOIN employees a
        ON a.MANAGER_ID = CTE.EMP_ID
),

cte2 AS (
    SELECT 
        *,
        MAX(lvl) OVER (PARTITION BY emp_id) AS mx
    FROM CTE
    ORDER BY 2
)

-- SELECT * FROM cte2;

SELECT 
    emp_id,
    emp_name,
    manager_id,
    path
FROM cte2
WHERE mx = lvl
ORDER BY 1;
