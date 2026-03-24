# 🔥 Find Consecutive Login Days (Gaps & Islands)

## 🚀 Problem Statement

Given a table of user events, identify **consecutive login streaks** for each user.

A streak is defined as a sequence of **continuous days** where a user has at least one `login` event.

---

## 📊 Table: `events`

| Column      | Type      |
|------------|----------|
| event_id   | INT      |
| user_id    | INT      |
| event_type | VARCHAR  |
| event_time | DATETIME |

---

## 🧠 Key Rules

- ✅ Only consider `event_type = 'login'`
- ✅ Multiple logins on the same day = **1 login day**
- ❌ Other events (`click`, `logout`, NULL) are ignored
- ❌ Missing a day breaks the streak

---

## 💀 Edge Cases Covered

- Duplicate logins on same timestamp  
- Multiple logins on same day  
- Out-of-order timestamps  
- Missing days (gaps)  
- Users with single login  
- Users with no login  

---

## 🧩 Approach (Gaps & Islands)

This is a classic **Gaps & Islands** problem.

### Steps:
1. Extract only login events  
2. Convert timestamp → date  
3. Remove duplicates (same user, same date)  
4. Assign row numbers per user  
5. Create a grouping key using:

WITH login_dedup AS (
    SELECT 
        user_id,
        DATE(event_time) AS login_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id, DATE(event_time)
            ORDER BY event_time
        ) AS rn
    FROM events
    WHERE event_type = 'login'
),

login_clean AS (
    SELECT 
        user_id,
        login_date,
        DATE_SUB(
            login_date,
            INTERVAL ROW_NUMBER() OVER (
                PARTITION BY user_id 
                ORDER BY login_date
            ) DAY
        ) AS grp_key
    FROM login_dedup
    WHERE rn = 1
)

SELECT 
    user_id,
    MIN(login_date) AS streak_start,
    MAX(login_date) AS streak_end,
    COUNT(*) AS consecutive_days
FROM login_clean
GROUP BY user_id, grp_key
ORDER BY user_id, streak_start;
