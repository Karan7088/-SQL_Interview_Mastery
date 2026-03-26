# 🔥 SQL Interview Problem – Percentage Contribution per Category

## 🚀 Problem Statement

Given a `transactions` table, calculate the **percentage contribution of each category** to the total revenue.

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

For each category:

- Calculate total revenue  
- Divide it by overall revenue  
- Multiply by 100 to get percentage contribution  

---

## 💡 Formula

```sql
(SUM(category_amount) / TOTAL_AMOUNT) * 100
