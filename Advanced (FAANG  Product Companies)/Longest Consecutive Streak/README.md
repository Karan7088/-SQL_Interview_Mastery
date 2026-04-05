# 🔥 SQL Extreme Challenge: Longest Consecutive Streak with Conditions

## 📌 Problem Statement

You are given a transactions table:

```
txn(cid, tdate, amt)
```

### 🎯 Objective

For each customer (`cid`), find:

* ✅ Longest **consecutive daily streak**
* ✅ Only consider transactions where `amt >= 200`
* ✅ Handle multiple transactions per day
* ✅ Return:

  * `start_date`
  * `end_date`
  * `streak_len`

---

## ⚠️ Important Rules

* A streak means **continuous activity on consecutive days**
* If **even 1 day is missing → streak breaks**
* Ignore transactions where `amt < 200`
* If multiple streaks have same length:

  * 👉 Pick the **most recent streak** (latest `end_date`)

---

## 🧠 Approach

### Step 1: Filter Valid Transactions

Only keep rows where:

```
amt >= 200
```

---

### Step 2: Remove Duplicate Same-Day Activity

Multiple transactions on the same day should count as **1 day**

---

### Step 3: Assign Row Numbers

Use `ROW_NUMBER()` per user ordered by date

---

### Step 4: Identify Streak Groups (Gaps & Islands)

Use the trick:

```
tdate - row_number()
```

This creates a **constant group key for consecutive days**

---

### Step 5: Build Streaks

Group by:

* `cid`
* `grp_key`

Then calculate:

* `MIN(tdate)` → start_date
* `MAX(tdate)` → end_date
* `COUNT(*)` → streak_len

---

### Step 6: Pick Best Streak per User

Use ranking:

* Order by `streak_len DESC`
* Tie-break → `end_date DESC`

---

## 🚀 SQL Solution

```sql
WITH filtered AS (
    SELECT DISTINCT cid, tdate
    FROM txn
    WHERE amt >= 200
),
seq AS (
    SELECT 
        cid,
        tdate,
        ROW_NUMBER() OVER (PARTITION BY cid ORDER BY tdate) AS rn
    FROM filtered
),
grp AS (
    SELECT 
        cid,
        tdate,
        DATE_SUB(tdate, INTERVAL rn DAY) AS grp_key
    FROM seq
),
streaks AS (
    SELECT 
        cid,
        MIN(tdate) AS start_date,
        MAX(tdate) AS end_date,
        COUNT(*) AS streak_len
    FROM grp
    GROUP BY cid, grp_key
),
ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY cid 
               ORDER BY streak_len DESC, end_date DESC
           ) AS rnk
    FROM streaks
)
SELECT 
    cid,
    start_date,
    end_date,
    streak_len
FROM ranked
WHERE rnk = 1
ORDER BY cid;
```

---

## 📊 Expected Output

```
+------+------------+------------+------------+
| cid  | start_date | end_date   | streak_len |
+------+------------+------------+------------+
| 2    | 2023-02-10 | 2023-02-11 | 2          |
| 3    | 2023-03-01 | 2023-03-04 | 4          |
| 4    | 2023-01-06 | 2023-01-06 | 1          |
| 5    | 2023-04-10 | 2023-04-14 | 5          |
| 6    | 2023-05-05 | 2023-05-06 | 2          |
| 7    | 2023-06-20 | 2023-06-22 | 3          |
| 8    | 2023-07-01 | 2023-07-01 | 1          |
| 9    | 2023-08-15 | 2023-08-18 | 4          |
| 10   | 2023-09-01 | 2023-09-02 | 2          |
+------+------------+------------+------------+
```

---

## ❌ Excluded Users

* `cid = 1` → No transactions with `amt >= 200`

---

## 🔥 Key Concepts Covered

* Window Functions (`ROW_NUMBER`)
* Gaps & Islands Problem
* Deduplication (`DISTINCT`)
* Conditional Filtering
* Ranking with Tie-Break
* Real-world Streak Analysis

---

## 💡 Interview Tips

👉 Always clarify:

* “Is streak based on **consecutive days or transactions**?”

👉 Always handle:

* Duplicate dates
* Tie-breaking logic

---

## 🧨 Follow-up Questions (Advanced)

* Return **current active streak**
* Allow **1-day gap tolerance**
* Find **top 3 users with longest streaks**
* Combine with **cohort analysis**

---

## 🔗 Practice More

Check out more advanced SQL problems in this repo 🚀

---
