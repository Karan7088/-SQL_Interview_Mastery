# 🔍 Detect Events Within 5-Minute Window (Self Join)

## 📌 Problem Statement

Given an `events` table, identify pairs of events for the **same user** where:

* One event happens **after another**
* The time difference between them is **≤ 5 minutes**

---

## 🧾 Table Structure

| Column Name | Description             |
| ----------- | ----------------------- |
| user_id     | Unique user identifier  |
| event_id    | Unique event identifier |
| event_type  | Type of event           |
| event_time  | Timestamp of the event  |

---

## 🎯 Objective

Find:

* Pairs of events (`a` and `b`)
* Where:

  * `a` happens after `b`
  * Time difference ≤ 5 minutes
  * Same user

---

## 🧠 Approach

We use a **self join**:

1. Treat table as:

   * `a` → current event
   * `b` → previous event

2. Join conditions:

   * Same user
   * `a.event_time > b.event_time`
   * `a.event_id > b.event_id` (avoid duplicates)
   * Time difference ≤ 5 minutes

3. Calculate difference using:

   * `TIMESTAMPDIFF(MINUTE, b.event_time, a.event_time)`

---

## 💻 SQL Query

```sql
SELECT 
    a.user_id,
    a.event_id,
    b.user_id AS btime,
    b.event_id AS bid,
    TIMESTAMPDIFF(MINUTE, b.event_time, a.event_time) AS df
FROM events a
INNER JOIN events b 
    ON a.user_id = b.user_id
    AND a.event_time > b.event_time
    AND a.event_id > b.event_id
    AND TIMESTAMPDIFF(MINUTE, b.event_time, a.event_time) <= 5;
```

---

## ✅ Expected Output (Sample)

| user_id | event_id | btime | bid | df (minutes)       |
| ------- | -------- | ----- | --- | ------------------ |
| 1       | 2        | 1     | 1   | 0                  |
| 3       | 14       | 3     | 13  | 0                  |
| 3       | 15       | 3     | 14  | 0                  |
| 3       | 16       | 3     | 15  | 9 (excluded if >5) |

---

## 🚀 Key Concepts Used

* Self Join
* Time-based comparison
* `TIMESTAMPDIFF`
* Filtering duplicate pairs

---

## ⚠️ Important Notes

* `a.event_id > b.event_id` prevents reverse duplicates
* Time condition ensures only **close events** are captured
* Works well for:

  * Fraud detection
  * Rapid activity tracking
  * Session pre-processing

---

## 💡 Interview Insight

> This pattern is widely used for detecting **temporal relationships between events** using self joins.

---

## 🔥 Optimization Tip

For large datasets:

* Replace self join with **LAG() window function** for better performance

---
