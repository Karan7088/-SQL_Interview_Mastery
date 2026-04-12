# 📊 Daily Active Users (DAU) with Deduplication – SQL Problem

## 🧠 Problem Statement

You are given a table that stores user activity events from an application. Each row represents a user performing an action at a specific timestamp on a given platform (web/app).

Your task is to calculate **Daily Active Users (DAU)**.

---

## 💡 What is DAU?

**Daily Active Users (DAU)** =  
👉 Number of **unique users active on a given day**

---

## ⚠️ Real-World Challenges in This Dataset

This is not a simple count problem. The dataset contains multiple edge cases:

### 1. Duplicate Activity
- A user can perform multiple actions on the same day
- Example: User `101` has multiple events on `2023-01-02`
- ❌ Counting all rows → WRONG  
- ✅ Count user only once per day

---

### 2. Multi-Platform Usage
- Same user can use:
  - Web
  - App
- Still counts as **1 active user per day**

---

### 3. High-Frequency Users
- Some users appear almost every day (e.g., user `101`, `102`)
- Must not inflate DAU

---

### 4. New Users Every Day
- New users keep joining daily
- DAU should reflect both:
  - Returning users
  - New users

---

## 🎯 Goal

For each date:

👉 Count **distinct users** active on that date

---

## 🧩 Expected Output Format

| activity_date | daily_active_users |
|--------------|-------------------|
| 2023-01-01   | 3                 |
| 2023-01-02   | 4                 |
| 2023-01-03   | 5                 |
| ...          | ...               |

---

## 🧠 Step-by-Step Logic (Simple English)

### Step 1: Extract Date
- Ignore time part
- Convert timestamp → date

---

### Step 2: Remove Duplicates
- Same user can appear multiple times per day
- Keep only **one record per user per day**

---

### Step 3: Count Users
- Count unique users per day

---

## 🔥 Key Insight

👉 This problem is NOT about counting rows  
👉 It is about counting **unique users per day**

---

## ❌ Common Mistakes (Interview Traps)

1. Counting total rows instead of users  
2. Not removing same-day duplicates  
3. Ignoring multi-platform duplication  
4. Using `COUNT(*)` instead of `COUNT(DISTINCT user_id)`  

---

## 💥 Why This is Important (FAANG Level)

This pattern is used in:

- User engagement analysis  
- Product growth tracking  
- Retention metrics  
- Funnel analysis  

---

## 🚀 Follow-Up Questions (Very Common)

1. Calculate **7-day rolling active users**
2. Find **new vs returning users**
3. Convert DAU → **WAU / MAU**
4. Platform-wise DAU split
5. Retention (Day 1, Day 7)

---

## 🧠 Final One-Line Summary

👉 **DAU = Count of unique users active on each day after removing duplicates.**
