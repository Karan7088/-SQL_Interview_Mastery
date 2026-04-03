# 📊 Median Salary by Department (SQL Server)

## 🧩 Problem Overview
The goal is to calculate the **median salary for each department** from an `employees` dataset.

Instead of using built-in median functions, this solution computes the median manually using **window functions and CTEs**, which is a common expectation in interviews.

---

## 💡 How the Solution Works

The approach is divided into two logical steps using CTEs:

---

### 🔹 1. `base` CTE — Prepare the Data

In this step, we enrich each row with two important pieces of information:

- `rn` (Row Number):  
  Assigns a sequential number to each employee **within their department**, ordered by salary (ascending).

- `cnt` (Count):  
  Total number of employees in each department.

👉 Why this matters:
- `rn` helps us locate the **middle position**
- `cnt` tells us whether the dataset is **odd or even**

---

### 🔹 2. `calc` CTE — Compute Median

Here we calculate the median using a `CASE` expression:

#### ✅ Case 1: Odd number of rows (`cnt % 2 != 0`)
- The median is the **middle value**
- Position = `CEILING(cnt / 2)`
- We fetch the salary at that row number

#### ✅ Case 2: Even number of rows
- The median is the **average of two middle values**
- Positions:
  - `cnt / 2`
  - `(cnt / 2) + 1`
- We fetch both salaries and compute their average

👉 Subqueries are used to pick the exact salary values from the `base` CTE for the same department.

---

### 🔹 Final Step — Aggregate Results

- Each row in a department will have the same computed median
- We use `MAX(med)` to return a **single row per department**

---

## 🧠 Key Concepts Used

- **CTEs (Common Table Expressions)** for step-by-step logic
- **Window Functions**
  - `ROW_NUMBER()` → ranking within partition
  - `COUNT()` → total rows per group
- **CASE Expression** → conditional logic
- **Correlated Subqueries** → fetching exact median values
- **Handling Odd vs Even datasets**

---

## 🚀 Final Query

```sql
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
