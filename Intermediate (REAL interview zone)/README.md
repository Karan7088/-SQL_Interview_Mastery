# 💀 Advanced SQL Problem Set (Edge Case Driven)

## 🚀 Overview

This repository contains a collection of **real-world, interview-level SQL problems** designed to test deep understanding of:

- Window Functions
- Joins & Anti-Joins
- Time-based Analysis
- Gaps & Islands
- Sessionization
- Data Cleaning & Edge Case Handling

Unlike basic SQL questions, these problems are built on a **single interconnected dataset** with **brutal edge cases**, simulating real production data.

---

## 📊 Dataset Context

The dataset represents a simplified **user activity + transaction system**, consisting of:

- `users` → user information  
- `events` → login & activity logs  
- `transactions` → financial activity  

It includes real-world complexities like:

- Duplicate records  
- NULL values  
- Missing data  
- Out-of-order timestamps  
- Overlapping events  
- Users with partial/no activity  

---

## 🔥 Problem Statements

### 1️⃣ Find Consecutive Login Days
Identify continuous login streaks per user.

👉 Concepts:
- Gaps & Islands
- `ROW_NUMBER()`
- Date transformations

---

### 2️⃣ Detect Duplicate Transactions Within X Minutes
Find transactions that occur within a short time window for the same user.

👉 Concepts:
- `LAG()`
- Time difference calculations
- Duplicate detection logic

---

### 3️⃣ Running Total / Cumulative Sum
Calculate cumulative transaction amount per user over time.

👉 Concepts:
- Window functions (`SUM() OVER`)
- Ordering with timestamps

---

### 4️⃣ Percentage Contribution per Category
Calculate how much each category contributes to total revenue.

👉 Concepts:
- Aggregations
- Window functions for percentages
- NULL handling

---

### 5️⃣ Find Users Who Didn’t Perform an Action
Identify users who never logged in or never performed a specific event.

👉 Concepts:
- Anti-joins
- `LEFT JOIN` + `IS NULL`

---

### 6️⃣ Inner vs Left Join (Unmatched Records)
Find users who exist in one table but not in another.

👉 Concepts:
- Join behavior differences
- Data completeness analysis

---

### 7️⃣ Detect Overlapping Time Ranges
Identify overlapping transactions or events.

👉 Concepts:
- Self joins
- Time interval comparisons

---

### 8️⃣ First & Last Purchase per User
Find the earliest and latest transaction for each user.

👉 Concepts:
- `MIN()` / `MAX()`
- Window functions alternative

---

### 9️⃣ Sessionization (User Activity Grouping)
Group user activity into sessions based on inactivity gaps.

👉 Concepts:
- `LAG()`
- Time difference thresholds
- Session grouping logic

---

## 💀 Why This is Different

This is NOT a basic SQL set.

Each problem includes edge cases like:

- Multiple events at same timestamp  
- Duplicate records  
- Missing login/logout  
- Negative & zero transactions  
- NULL values in critical fields  
- Users with only partial data  

👉 The goal is to build **production-ready SQL thinking**, not just pass simple queries.

---

## 🧠 Skills You Will Master

- Writing robust SQL for messy real-world data  
- Handling edge cases confidently  
- Thinking like a Data Engineer / Analyst  
- Optimizing queries using window functions  
- Debugging incorrect assumptions in datasets  

---

## 🎯 Ideal For

- Data Analyst Interviews  
- Data Engineer Preparation  
- SQL Practice Beyond Basics  
- Portfolio Projects (GitHub / LinkedIn)  

---

## 🚀 How to Use

1. Load the dataset (provided SQL scripts)
2. Solve each problem independently
3. Try handling all edge cases
4. Optimize your queries
5. Compare multiple approaches

---

## 🔥 Final Note

If you can solve all problems **correctly and efficiently**,  
you are operating at:

👉 **Strong Intermediate → Advanced SQL Level (8.5+/10)**

---

## ⭐ Contribute / Improve

Feel free to:
- Add more edge cases  
- Optimize queries  
- Share alternative solutions  

---

💡 *"Real SQL skill is not writing queries — it's handling broken data."*
