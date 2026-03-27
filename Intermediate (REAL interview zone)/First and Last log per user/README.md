# 🔍 First and Last Login per User

## 📌 Problem Statement

Given an `events` table containing user activity logs, find:

* The **first login time**
* The **last login time**

for each user.

---

## 🧾 Table Structure

| Column Name | Description                                |
| ----------- | ------------------------------------------ |
| user_id     | Unique user identifier                     |
| event_id    | Unique event identifier                    |
| event_type  | Type of event (login, logout, click, etc.) |
| event_time  | Timestamp of the event                     |

---

## 🎯 Objective

Extract:

* Earliest login timestamp → `first_login`
* Latest login timestamp → `last_login`

for every `user_id`.

---

## 🧠 Approach

1. Filter only `login` events
2. Group data by `user_id`
3. Use:

   * `MIN(event_time)` → first login
   * `MAX(event_time)` → last login

---

## 💻 SQL Query

```sql
SELECT 
    user_id,
    MIN(event_time) AS first_login,
    MAX(event_time) AS last_login
FROM events
WHERE event_type = 'login'
GROUP BY user_id;
```

---

## ✅ Expected Output

| user_id | first_login      | last_login       |
| ------- | ---------------- | ---------------- |
| 1       | 2024-02-01 09:00 | 2024-02-06 10:00 |
| 2       | 2024-02-01 11:00 | 2024-02-01 11:00 |
| 3       | 2024-02-01 09:00 | 2024-02-01 09:10 |
| 9       | 2024-02-03 10:00 | 2024-02-03 10:00 |

---

## 🚀 Key Concepts Used

* Filtering (`WHERE`)
* Aggregation (`MIN`, `MAX`)
* Grouping (`GROUP BY`)

---

## 💡 Interview Insight

> This is a classic aggregation problem used to test understanding of filtering + grouping logic.

---
