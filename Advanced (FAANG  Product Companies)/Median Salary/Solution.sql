WITH base AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary) AS rn,
           COUNT(*) OVER (PARTITION BY department) AS cnt
    FROM employees
),
calc AS (
    SELECT *,
           CASE 
               WHEN cnt % 2 != 0 THEN 
                   (SELECT salary 
                    FROM base 
                    WHERE rn = CEILING(cnt / 2.0) 
                      AND department = a.department)
               ELSE 
                   ROUND((
                        (SELECT salary 
                         FROM base 
                         WHERE rn = (cnt / 2) 
                           AND department = a.department)
                        +
                        (SELECT salary 
                         FROM base 
                         WHERE rn = (cnt / 2) + 1 
                           AND department = a.department)
                   ) / 2.0, 0)
           END AS med
    FROM base a
)
SELECT 
    department,
    MAX(med) AS MedianSalary
FROM calc
GROUP BY department;
