# 📊 Retention Analysis (Day 1 & Day 7)

## 🧠 Problem Statement

Analyze user retention based on signup date and user activity.
Calculate how many users return on:

* **Day 1** (next day after signup)
* **Day 7** (7 days after signup)

---

## 📁 Dataset Overview

### `users`

* `user_id`
* `name`
* `signup_date`

### `events`

* `event_id`
* `user_id`
* `event_type`
* `event_time`

### `transactions`

* `txn_id`
* `user_id`
* `amount`
* `category`
* `txn_time`

---

## ⚙️ Approach

1. Combine all activity sources:

   * Events
   * Transactions

2. Convert timestamps to dates.

3. Compare activity date with signup date:

   * `DATEDIFF = 1` → Day 1 retention
   * `DATEDIFF = 7` → Day 7 retention

4. Aggregate per signup date.

---

## 💻 SQL Solution

```sql
WITH activity AS (
    SELECT user_id, DATE(event_time) AS activity_date
    FROM events

    UNION

    SELECT user_id, DATE(txn_time)
    FROM transactions
),

base AS (
    SELECT 
        u.user_id,
        DATE(u.signup_date) AS signup_date,
        a.activity_date
    FROM users u
    LEFT JOIN activity a 
        ON u.user_id = a.user_id
    WHERE u.signup_date IS NOT NULL
)

SELECT 
    signup_date,
    COUNT(DISTINCT user_id) AS total_users,

    COUNT(DISTINCT CASE 
        WHEN activity_date = signup_date + INTERVAL 1 DAY 
        THEN user_id END) AS day_1_retained,

    COUNT(DISTINCT CASE 
        WHEN activity_date = signup_date + INTERVAL 7 DAY 
        THEN user_id END) AS day_7_retained

FROM base
GROUP BY signup_date
ORDER BY signup_date;
```

---

## 📊 Key Insight

* All users signed up in **January**
* All activity occurred in **February**

👉 Result:
**Day 1 Retention = 0**
**Day 7 Retention = 0**

---

## 💡 Learning

* Retention depends on **exact date difference**, not just activity
* Always combine **all activity sources**
* Misaligned data windows → misleading retention

---

## 🚀 Use Case

* Product analytics
* User engagement tracking
* Growth analysis
