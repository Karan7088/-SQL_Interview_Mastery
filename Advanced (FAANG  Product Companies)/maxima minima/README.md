# 🔥 SQL Interview Problem: Identify Local Maxima & Minima

## 🧠 Problem Statement

Given a table containing a sequence of numeric values ordered by an `id`, identify all **local maxima** and **local minima**.

* A **Local Maxima** is a value greater than both its previous and next values.
* A **Local Minima** is a value smaller than both its previous and next values.

---

## 🏗️ Table Schema

```sql
CREATE TABLE numbers (
    id INT PRIMARY KEY,
    value INT
);
```

---

## 💣 Test Data (Brutal Dataset)

```sql
INSERT INTO numbers (id, value) VALUES
-- increasing start (no minima at beginning)
(1, 10),
(2, 20),

-- simple peak
(3, 15),

-- plateau case (equal values)
(4, 25),
(5, 25),
(6, 20),

-- valley
(7, 5),

-- multiple fluctuations
(8, 30),
(9, 10),
(10, 35),
(11, 5),

-- flat region
(12, 5),
(13, 5),

-- another peak
(14, 40),

-- decreasing tail
(15, 30),
(16, 20),

-- edge peak
(17, 50),

-- drop again
(18, 10);
```

---

## 🔍 Approach

We use **window functions**:

* `LAG()` → to get previous value
* `LEAD()` → to get next value

Then compare current value with both neighbors.

---

## 💻 SQL Solution

```sql
WITH cte AS (
    SELECT *,
        CASE 
            WHEN value > LAG(value) OVER() 
             AND value > LEAD(value) OVER() 
                THEN 'local maxima'
            WHEN value < LAG(value) OVER() 
             AND value < LEAD(value) OVER() 
                THEN 'local minima'
            ELSE 'equal'
        END AS type
    FROM numbers
)
SELECT *
FROM cte
WHERE type != 'equal';
```

---

## 🎯 Expected Output

```sql
id | value | type
------------------------
2  | 20    | local maxima
3  | 15    | local minima
7  | 5     | local minima
8  | 30    | local maxima
9  | 10    | local minima
10 | 35    | local maxima
14 | 40    | local maxima
16 | 20    | local minima
17 | 50    | local maxima
```

---

## ⚠️ Important Edge Cases Covered

* ✅ Plateau values (25,25 and 5,5,5) → ignored
* ✅ First & last rows → automatically excluded
* ✅ Multiple fluctuations
* ✅ Strict comparison (`>` / `<`)
* ✅ Real-world noisy data

---

## 💡 Key Insights

* Always use **strict comparison** to avoid plateau misclassification
* Window functions simplify sequential analysis
* This is a classic **“peaks & valleys” problem**

---

## 🚀 Interview Follow-ups

* Handle **plateaus as peaks/minima**
* Find **peak ranges instead of points**
* Extend to **time-series anomaly detection**
* Use **window frames instead of lag/lead**

---

## 🏁 Conclusion

This problem tests:

* Window functions mastery
* Sequential pattern recognition
* Edge case handling

A simple-looking problem that can easily become **advanced** with slight twists.

---
