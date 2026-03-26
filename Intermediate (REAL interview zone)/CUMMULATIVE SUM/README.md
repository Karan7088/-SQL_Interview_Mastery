# 🔥 SQL Interview Problem – Running Total / Cumulative Sum

## 🚀 Problem Statement

Given a `transactions` table, calculate the **running total (cumulative sum)** of transaction amounts for each user over time.

---

## 📊 Table: `transactions`

| Column    | Type      |
|----------|----------|
| txn_id   | INT      |
| user_id  | INT      |
| amount   | DECIMAL  |
| category | VARCHAR  |
| txn_time | DATETIME |

---

## 🧠 Business Logic

For each user:

- Sort transactions by time  
- At each row, compute the **total amount up to that point**  

👉 This is called a **running total / cumulative sum**

---

## 💡 Example

### Input

| user_id | amount |
|--------|--------|
| 1 | 100 |
| 1 | 200 |
| 1 | 50  |

### Output

| user_id | amount | running_total |
|--------|--------|---------------|
| 1 | 100 | 100 |
| 1 | 200 | 300 |
| 1 | 50  | 350 |

---

## 🔥 Approach

Use a **window function**:

- `SUM()` → to accumulate values  
- `OVER()` → to define window  
- `PARTITION BY` → per user  
- `ORDER BY` → maintain sequence  

---

## ✅ SQL Solution

```sql
SELECT 
    user_id,
    txn_id,
    amount,
    txn_time,
    SUM(amount) OVER (
        PARTITION BY user_id
        ORDER BY txn_time, txn_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM transactions
WHERE amount IS NOT NULL;
