# 📊 SQL Interview Problem: Longest Inactive Gap Between User Logins

## 🧠 Problem Statement

You are given a dataset that tracks when users log into a system.

Each record contains:
- `user_id`
- `login_date`

Your task is to determine **how long each user stayed inactive between their logins**.

---

## 🎯 Objective

For every user, calculate:

> The **maximum number of days between two consecutive login dates**

---

## 📌 Example to Understand

Consider a user with the following login activity:

| user_id | login_date |
|--------|------------|
| 1      | 2024-01-01 |
| 1      | 2024-01-05 |
| 1      | 2024-01-10 |

👉 Gaps between logins:
- Jan 1 → Jan 5 = **4 days**
- Jan 5 → Jan 10 = **5 days**

✅ Longest inactivity = **5 days**

---

## ⚠️ Edge Cases You Must Handle

### 1. Single Login
If a user logged in only once:

| user_id | login_date |
|--------|------------|
| 3      | 2024-01-15 |

👉 No previous login to compare  
✅ Result = `NULL`

---

### 2. Duplicate Login Dates

| user_id | login_date |
|--------|------------|
| 5      | 2024-01-01 |
| 5      | 2024-01-01 |

👉 Same-day login  
✅ Gap = `0 days`

---

### 3. Unsorted Data

Data may not be ordered:

| user_id | login_date |
|--------|------------|
| 6      | 2024-01-10 |
| 6      | 2024-01-01 |

👉 You must sort before calculating gaps

---

### 4. Continuous Logins

| user_id | login_date |
|--------|------------|
| 4      | 2024-01-01 |
| 4      | 2024-01-02 |
| 4      | 2024-01-03 |

👉 Daily login  
✅ Max gap = `1 day`

---

## 🧩 What You Need to Think About

- How to compare a row with its **previous row**
- How to calculate **date differences**
- How to handle **missing previous values**
- How to extract the **maximum gap per user**

---

## 🏁 Final Expected Output

Your result should contain:

| user_id | longest_inactive_days |
|--------|----------------------|
| ...    | ...                  |

Each row represents the **maximum inactivity period for that user**.

---

## 🚀 Real-World Use Case

This type of problem is used in:

- 📉 **User churn analysis**
- 📊 **Engagement tracking**
- 📅 **Retention metrics**
- 📈 **Product analytics**

---

## 🔥 Interview Insight

Interviewers ask this to test:

- Window function understanding
- Handling real-world messy data
- Edge case thinking
- Analytical problem-solving skills

---
