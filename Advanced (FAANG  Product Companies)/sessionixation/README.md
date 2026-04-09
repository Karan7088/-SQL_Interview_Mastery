# 🚀 SQL Pairing-Based Session Problem

## 📌 Problem Statement

You are given a table `user_logs` that stores user activity events.

Each record represents:

* `user_id`
* `event_time`

---

## 🎯 Objective

Create sessions by **pairing consecutive events** for each user.

👉 The logic is:

* First event → session start
* Next event → session end
* Then repeat

---

## 🧠 Important Clarification

⚠️ This is **NOT time-gap based sessionization**

There is:

* ❌ No 30-minute rule
* ❌ No gap calculation
* ✅ Only **row pairing logic**

---

## 🧱 Table Schema

```sql
CREATE TABLE user_logs (
    log_id INT PRIMARY KEY,
    user_id INT,
    event_time DATETIME
);
```

---

## 💡 Approach Explanation

### 🔹 Step 1: Order Events Per User

We assign row numbers:

```sql
ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_time)
```

Example:

| user_id | event_time | rn |
| ------- | ---------- | -- |
| 201     | 10:00      | 1  |
| 201     | 10:10      | 2  |
| 201     | 10:40      | 3  |
| 201     | 10:50      | 4  |

---

### 🔹 Step 2: Pair Odd Rows with Next Event

```sql
CASE 
  WHEN rn % 2 != 0 
  THEN LEAD(event_time)
  ELSE 0
END
```

👉 Logic:

* Odd rows (1,3,5…) → session start
* Use `LEAD()` → session end
* Even rows ignored

---

### 🔹 Step 3: Handle NULLs

```sql
IFNULL(..., event_time)
```

👉 If last row has no pair, it becomes:

* session_start = event_time
* session_end = same event_time

---

### 🔹 Step 4: Filter Valid Sessions

```sql
WHERE session_end != 0
```

👉 Removes even rows

---

### 🔹 Step 5: Assign Session IDs

```sql
ROW_NUMBER() OVER (PARTITION BY user_id)
```

---

## 🎯 Final Output

| user_id | session_id | session_start | session_end |
| ------- | ---------- | ------------- | ----------- |
| 201     | 1          | 10:00         | 10:10       |
| 201     | 2          | 10:40         | 10:50       |
| 201     | 3          | 12:00         | 12:20       |
| 202     | 1          | 09:00         | 09:30       |
| 202     | 2          | 10:01         | 10:01       |
| 203     | 1          | 08:00         | 12:00       |
| 204     | 1          | 10:00         | 10:05       |
| 204     | 2          | 10:10         | 10:20       |
| 204     | 3          | 10:25         | 10:25       |
| 205     | 1          | 09:00         | 09:45       |
| 205     | 2          | 10:30         | 11:20       |
| 206     | 1          | 14:00         | 14:20       |
| 206     | 2          | 15:00         | 15:10       |
| 206     | 3          | 16:00         | 16:40       |

---

## ⚠️ Limitations of This Approach

❌ Not real sessionization
❌ Ignores time gaps
❌ Assumes perfect pairing
❌ Breaks if events are missing

---

## 🔥 Key Learning

* Uses `ROW_NUMBER()` + `LEAD()`
* Demonstrates **event pairing pattern**
* Good for:

  * login-logout problems
  * start-end event pairing

---

## 🚀 Interview Twist

Interviewer may ask:

👉 "What if events are not in pairs?"
👉 "How will you use time-gap logic?"
👉 "Can you convert this into real sessionization?"

---

## 💥 Conclusion

This problem tests:

* Window function understanding
* Event pairing logic
* Data sequencing skills

---

⚡ Master this → next step is **real sessionization using LAG()**
