
# 📊 DAU, WAU, MAU Calculation Using SQL

## 🧠 Problem Statement
Given a `txn` table containing:

- `user_id`
- `txn_time`

We need to calculate:

- **DAU (Daily Active Users)**
- **WAU (Weekly Active Users - last 7 days)**
- **MAU (Monthly Active Users - last 30 days)**

for each date.

---

## 🧱 Approach

### 1. Extract Date
We first convert `txn_time` into a date using:

```sql
DATE(txn_time)
````

This ensures grouping at day level.

---

### 2. DAU (Daily Active Users)

We count distinct users for the same date:

```sql
SELECT COUNT(DISTINCT user_id)
FROM txn
WHERE DATE(a.txn_time) = DATE(txn_time)
```

---

### 3. WAU (Weekly Active Users)

We calculate users active in the last **7 days (including current day):**

```sql
WHERE DATE(txn_time)
      BETWEEN DATE(a.txn_time) - INTERVAL 6 DAY
          AND DATE(a.txn_time)
```

---

### 4. MAU (Monthly Active Users)

We calculate users active in the last **30 days (including current day):**

```sql
WHERE DATE(txn_time)
      BETWEEN DATE(a.txn_time) - INTERVAL 30 DAY
          AND DATE(a.txn_time)
```

---

## ⚙️ Key Concept

We use **correlated subqueries**:

* Each row (date) is treated independently
* Subqueries reference the outer query alias `A`

---

## 📈 Output Example

| datee      | DAU | WAU | MAU |
| ---------- | --- | --- | --- |
| 2024-01-01 | 10  | 25  | 80  |
| 2024-01-02 | 12  | 30  | 90  |

---

## 🚀 Interview Tip

This is a **very common product analytics question** asked in:

* Data Analyst interviews
* Product-based companies
* Growth analytics roles

Follow-up questions may include:

* Optimize using window functions
* Convert into cohort retention
* Handle large-scale datasets

---

## 🏁 Summary

* DAU → Same day users
* WAU → Last 7 days users
* MAU → Last 30 days users
* Uses correlated subqueries + date filtering

---

⭐ If you found this useful, consider starring the repo!

```
```
