# 💀 SQL Interview Prep – Basic but Tricky Questions

This folder contains a set of **high-frequency SQL interview questions** that look simple but are **designed to test deep understanding**.

These are the exact type of problems asked in:

* Product-based companies
* Data Analyst / Data Engineer roles
* Real interview rounds

---

# 🧠 What Makes This Set Special?

This is NOT just basic SQL.

Each problem is intentionally designed with real-world complexity:

* Duplicates
* NULL values
* Missing IDs
* Ties in ranking
* Messy, imperfect data

👉 Exactly what interviewers test.

---

# 🧱 Dataset Used

The dataset simulates an `employees` table with:

* Multiple departments
* Duplicate records
* NULL salaries
* Gaps in `emp_id`
* Same salaries across employees

👉 This helps you practice real-world scenarios instead of ideal data.

---

# 🔥 Problems Covered

## 🧾 1. Find 2nd Highest Salary

* Tests subquery logic and handling duplicates

---

## 🧾 2. Find Nth Highest Salary

* Dynamic ranking logic
* OFFSET / window functions

---

## 🧾 3. Remove Duplicate Rows

* Real-world data cleaning
* Requires `ROW_NUMBER()` and careful deletion

---

## 🧾 4. Employees with Same Salary

* Aggregation + filtering
* NULL handling

---

## 🧾 5. Last Record per Department

* Window functions (`ROW_NUMBER`)
* Partitioning logic

---

## 🧾 6. Find Missing IDs / Gaps

* Sequence analysis
* Using `LEAD()`

---

## 🧾 7. Count per Department

* GROUP BY fundamentals
* Useful for reporting & dashboards

---

## 🧾 8. Top 3 Salaries per Department

* `DENSE_RANK()` usage
* Handling ties correctly

---

# ⚠️ Key Concepts Tested

* Window Functions (`ROW_NUMBER`, `DENSE_RANK`, `LEAD`)
* Aggregations (`COUNT`, `GROUP BY`, `HAVING`)
* Subqueries
* Deduplication logic
* NULL handling
* SQL Order of Execution

---

# 🚨 Common Mistakes (Interview Traps)

* Using `ROW_NUMBER` instead of `DENSE_RANK` for ranking ❌
* Ignoring NULL values ❌
* Deleting all duplicates instead of keeping one ❌
* Incorrect grouping logic ❌
* Misunderstanding execution order ❌

---

# 🧬 What You’ll Learn

After solving these problems, you will:

* Handle messy real-world datasets
* Write clean and efficient SQL queries
* Understand edge cases deeply
* Build strong interview confidence

---

# 🚀 How to Use This Folder

1. Try solving each question on your own
2. Think about edge cases
3. Compare with solutions
4. Optimize your queries

---

# 💀 Reality Check

If you can confidently solve all these:

👉 You are already ahead of **80–90% SQL candidates**

---

🔥 *“Basic SQL is easy. Handling edge cases is what gets you hired.”*

