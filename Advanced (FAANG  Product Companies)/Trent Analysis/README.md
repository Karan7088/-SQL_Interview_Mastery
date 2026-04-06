# 📈 SQL Problem: Detect Trend Change (Increase → Decrease)

## 🧩 Problem Statement

You are given a table containing daily revenue data.
Your task is to identify the points where the revenue trend changes from **increasing to decreasing**.

---

## 📊 Table Structure

```sql
CREATE TABLE sales_data (
    id INT PRIMARY KEY,
    sale_date DATE,
    revenue INT
);
```

---

## 💾 Sample Data

```sql
INSERT INTO sales_data (id, sale_date, revenue) VALUES
(1, '2024-01-01', 100),
(2, '2024-01-02', 120),
(3, '2024-01-03', 140),
(4, '2024-01-04', 160),

(5, '2024-01-05', 150),
(6, '2024-01-06', 130),
(7, '2024-01-07', 110),

(8, '2024-01-08', 115),
(9, '2024-01-09', 130),
(10, '2024-01-10', 150),

(11, '2024-01-11', 140),
(12, '2024-01-12', 120),

(13, '2024-01-13', 125),
(14, '2024-01-14', 140),
(15, '2024-01-15', 160),

(16, '2024-01-16', 155),
(17, '2024-01-17', 140);
```

---

## 🎯 Objective

Identify rows where:

* Revenue was **increasing before**
* Revenue **starts decreasing at current row**

### 🔍 In simple terms:

Find the transition point:

```
INCREASING → DECREASING
```

---

## 🧠 Key Concept

To solve this problem:

1. Compare current revenue with previous revenue
2. Label trend as:

   * `INCREASING`
   * `DECREASING`
3. Detect where:

   * Previous trend = `INCREASING`
   * Current trend = `DECREASING`

---

## 📌 Expected Output

| id | sale_date  | revenue |
| -- | ---------- | ------- |
| 5  | 2024-01-05 | 150     |
| 11 | 2024-01-11 | 140     |
| 16 | 2024-01-16 | 155     |

---

## 🔥 Explanation

These rows represent **trend reversal points (peaks)**:

* Revenue was increasing up to the previous row
* Then starts decreasing at the current row

---

## ⚠️ Important Notes

* Do **NOT** return all decreasing rows
* Do **NOT** return valleys (decreasing → increasing)
* Focus only on **increase → decrease transitions**

---

## 🧠 Interview Insight

This problem is commonly used to test:

* Window functions (`LAG`, `LEAD`)
* Trend analysis
* Time-series reasoning
* Identifying **local maxima (peaks)**

---

## 🚀 Bonus Challenge

* Detect **valleys (decreasing → increasing)**
* Detect **continuous increasing streaks**
* Return **actual peak value instead of drop point**

---

## 💡 Tags

`SQL` `Window Functions` `Time Series` `Trend Analysis` `Advanced SQL`
