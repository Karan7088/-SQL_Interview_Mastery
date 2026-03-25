# 🔥 SQL Problem – Duplicate Transactions Within X Minutes

## 🚀 Problem Statement

Given a `transactions` table, identify transactions made by the same user with the **same amount** within a short time window (e.g., 5 minutes).

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

A transaction is considered a duplicate if:

- Same `user_id`
- Same `amount`
- Time difference ≤ 5 minutes
- Compared with **immediate previous transaction**

---

## 💀 Edge Cases Covered

- Duplicate transactions at same timestamp  
- Transactions within seconds  
- NULL values in amount/time  
- Negative or zero amounts (excluded)  
- Multiple duplicate chains  

---

## 🧩 Approach 1 – Self Join (Used Here)

We compare each transaction with its **previous transaction** using a self join.

### Key Conditions:

```sql
a.user_id = b.user_id
a.amount = b.amount
a.txn_time >= b.txn_time
TIMESTAMPDIFF(MINUTE, b.txn_time, a.txn_time) <= 5
a.txn_id = b.txn_id + 1
