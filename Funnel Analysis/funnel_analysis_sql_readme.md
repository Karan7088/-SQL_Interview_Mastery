# 🚀 Funnel Analysis (SQL) – Complete Guide

This README explains how to solve a **funnel analysis problem** using SQL step by step in simple English.

---

# 🎯 Problem Understanding

We want to analyze how users move through different stages:

**Active → Paused → Resumed → Cancelled**

And calculate:
- Number of users at each stage
- Drop-off between stages
- Drop percentage

---

# 🧠 Key Idea

👉 We track how users move from one status to another using timestamps.

👉 Then we count how many users reach each stage.

👉 Finally, we calculate how many users drop at each step.

---

# 🔄 Step-by-Step Approach

## 1. Assign Order to Stages

We convert text status into numbers:

| Status   | Value |
|----------|------|
| active   | 1    |
| paused   | 2    |
| resumed  | 3    |
| cancelled| 4    |

👉 This helps us track sequence easily.

---

## 2. Create Stage Transitions

We check previous status using `LAG()` and create transitions like:

- active → paused
- paused → resumed

---

## 3. Track User Movement

For each user:
- Sort by time
- Track how they move across stages

---

## 4. Count Users Per Stage

We count distinct users who reached each stage.

---

## 5. Calculate Drop-off

Formula:

- Drop Users = Previous Stage Users - Current Users
- Drop % = (Drop Users / Previous Users) * 100

---

# 📊 Example

### Input (simplified)

| user_id | status   |
|--------|----------|
| 1      | active   |
| 1      | paused   |
| 1      | resumed  |
| 2      | active   |
| 2      | paused   |

---

### Output

| Stage              | Users | Drop |
|--------------------|------|------|
| active             | 2    | -    |
| active → paused    | 2    | 0    |
| paused → resumed   | 1    | 1    |

---

# 🧾 Final SQL Query (Formatted)

```sql
WITH stage_mapping AS (
    SELECT *,
           CASE
               WHEN status = 'active' THEN 1
               WHEN status = 'paused' THEN 2
               WHEN status = 'resumed' THEN 3
               ELSE 4
           END AS stage_order
    FROM subscriptions
    WHERE status != "inactive"
),

stage_transitions AS (
    SELECT DISTINCT
           status,
           CASE
               WHEN LAG(status) OVER (ORDER BY stage_order) != status
               THEN CONCAT(LAG(status) OVER (ORDER BY stage_order), '->', status)
               ELSE status
           END AS stage,
           ROW_NUMBER() OVER (PARTITION BY status, stage_order) AS rn,
           stage_order
    FROM stage_mapping
    ORDER BY 3
),

user_stage_flow AS (
    SELECT *,
           CASE
               WHEN LAG(stage_order) OVER (PARTITION BY user_id ORDER BY stage_order) IS NOT NULL
               THEN CONCAT(LAG(stage_order) OVER (PARTITION BY user_id ORDER BY stage_order), stage_order)
               ELSE stage_order
           END AS stage_track
    FROM stage_mapping
    ORDER BY 1
),

unique_stages AS (
    SELECT stage,
           CASE
               WHEN LAG(stage_order) OVER (ORDER BY stage_order) IS NOT NULL
               THEN CONCAT(LAG(stage_order) OVER (ORDER BY stage_order), stage_order)
               ELSE stage_order
           END AS stage_key
    FROM stage_transitions
    WHERE rn = 1
    ORDER BY 2
),

stage_counts AS (
    SELECT stage,
           (
               SELECT COUNT(DISTINCT user_id)
               FROM user_stage_flow
               WHERE unique_stages.stage_key = user_stage_flow.stage_track
           ) AS users
    FROM unique_stages
)

SELECT *,
       IFNULL(LAG(users) OVER(), '-') AS PreviousStageUsers,
       IFNULL(LAG(users) OVER() - users, '-') AS Drop_off_Users,
       IFNULL(((LAG(users) OVER() - users) / LAG(users) OVER()) * 100.0, '-') AS drop_pct
FROM stage_counts;
```

---

# 🔥 Key Concepts Used

- `CASE WHEN` → assign stage order
- `LAG()` → find previous stage
- `ROW_NUMBER()` → remove duplicates
- `CTE` → break problem into steps
- `COUNT(DISTINCT)` → user counting

---

# ⚠️ Common Mistakes

- Not ordering by time ❌
- Counting duplicate users ❌
- Ignoring stage sequence ❌

---

# 💬 Final Interview Line

> "I break funnel analysis into stages, track user transitions using window functions, and compute drop-offs between consecutive stages."

---

# 🚀 Conclusion

This problem tests:
- Funnel thinking
- Event sequencing
- SQL window functions

If you understand this, you are **interview-ready for product/data roles** 💯

