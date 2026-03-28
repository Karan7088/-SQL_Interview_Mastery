# ⏱️ Sessionization Using 30-Minute Gap

## 🧠 Problem Statement

Group user events into sessions based on inactivity gaps.
If the time gap between two events is greater than **30 minutes**, start a new session.

---

## 📁 Dataset Overview

### `events`

* `user_id`
* `event_id`
* `event_time`

---

## ⚙️ Approach

1. Sort events per user by time
2. Use `LAG()` to get previous event time
3. Calculate time difference using `TIMESTAMPDIFF`
4. Mark session break when gap > 30 minutes
5. Assign session groups
6. Aggregate session details

---

## 💻 SQL Solution

```sql
WITH cte AS (
    SELECT 
        user_id,
        event_id,
        event_time,

        LAG(event_time) OVER (
            PARTITION BY user_id 
            ORDER BY event_time
        ) AS prev_time,

        TIMESTAMPDIFF(
            MINUTE,
            LAG(event_time) OVER (
                PARTITION BY user_id 
                ORDER BY event_time
            ),
            event_time
        ) AS diff_min,

        CASE 
            WHEN TIMESTAMPDIFF(
                    MINUTE,
                    LAG(event_time) OVER (
                        PARTITION BY user_id 
                        ORDER BY event_time
                    ),
                    event_time
                 ) > 30 
            THEN 1 ELSE 0 
        END AS session_break
    FROM events
),

cte2 AS (
    SELECT *,
           ROW_NUMBER() OVER () AS rn
    FROM cte
    WHERE session_break = 1
),

cte3 AS (
    SELECT 
        cte.*,
        IFNULL(
            IFNULL(
                cte2.rn,
                MAX(cte2.rn) OVER (
                    ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
                )
            ),
            0
        ) AS session_group
    FROM cte2
    RIGHT JOIN cte 
        ON cte.event_id = cte2.event_id
       AND cte.user_id = cte2.user_id
),

cte4 AS (
    SELECT 
        session_group,
        user_id,
        event_id,

        MIN(event_time) OVER (
            PARTITION BY user_id, session_group
        ) AS session_start,

        MAX(event_time) OVER (
            PARTITION BY user_id, session_group
        ) AS session_end,

        COUNT(*) OVER (
            PARTITION BY user_id, session_group
        ) AS total_events,

        ROW_NUMBER() OVER (
            PARTITION BY user_id, session_group
        ) AS rn
    FROM cte3
)

SELECT 
    user_id,
    event_id,

    ROW_NUMBER() OVER (
        PARTITION BY user_id 
        ORDER BY session_start
    ) AS session_id,

    session_start,
    session_end,
    total_events

FROM cte4
WHERE rn = 1;
```

---

## 📊 Output Description

For each session:

* `session_id` → session number per user
* `session_start` → first event time
* `session_end` → last event time
* `total_events` → number of events in session

---

## 💡 Learning

* `LAG()` is key for session detection
* Time gap defines behavioral sessions
* Window functions help avoid complex joins

---

## 🚀 Use Case

* User behavior tracking
* Web/app session analytics
* Funnel and engagement analysis
