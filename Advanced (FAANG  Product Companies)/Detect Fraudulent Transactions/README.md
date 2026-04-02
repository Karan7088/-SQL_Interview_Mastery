# 🚨 Rule-Based Fraud Detection Using SQL

### (Velocity, Location & Amount Anomalies)

---

## 📌 Problem Statement

You are given a **transactions table** containing user transaction data such as:

* `txn_id` → Unique transaction ID
* `user_id` → User identifier
* `amount` → Transaction amount
* `txn_time` → Timestamp of transaction
* `location` → City of transaction
* `device_id` → Device used
* `status` → success / failed

---

## 🎯 Objective

👉 Identify **fraudulent / suspicious transactions** using **rule-based logic (SQL only)**

👉 Output:

* Transaction details
* Fraud reason(s)

---

## 🧠 Approach

Fraud detection is based on **behavioral patterns**, not direct labels.

We define fraud using **3 key rules**:

---

## 🚨 Fraud Rules

### ⚡ 1. Velocity Rule (High Frequency)

> If a user performs **3 or more transactions within 2 minutes**,
> all those transactions are flagged as fraud.

✔ Detects bots / automated activity

---

### 🌍 2. Location Change Rule

> If a user performs transactions from **different locations within 5 minutes**,
> the later transaction is flagged.

✔ Detects **impossible travel scenarios**

---

### 💸 3. Amount Spike Rule

> If a transaction amount is **greater than 3× the user’s average**,
> it is flagged as suspicious.

⚠️ Note:

* This rule can sometimes fail due to average inflation
* Better alternatives: compare with previous transaction (LAG)

---

## 🧩 Key Concepts Used

* `LAG()` → Compare with previous transaction
* `TIMESTAMPDIFF()` → Time difference calculation
* `WINDOW FUNCTIONS` → Running calculations
* `CASE WHEN` → Rule-based classification
* `CTEs (WITH)` → Step-wise logic building

---

## 🏗️ Solution Breakdown

### 1️⃣ Base Layer (`base`)

* Calculate time difference between transactions
* Compute average transaction amount
* Detect location changes

---

### 2️⃣ Velocity Layer (`vel`)

* Identify transactions within **2-minute window**
* Flag users with **≥ 3 transactions**

---

### 3️⃣ Combine Rules (`comb`)

* Merge all fraud signals:

  * Velocity
  * Location change
  * Amount spike

---

### 4️⃣ Final Output (`final_flags`)

* Assign readable fraud reasons:

  * `Velocity`
  * `Location change`
  * `Amount spike`

---

## 📊 Final Output

| txn_id | user_id | txn_time            | fraud_reason    |
| ------ | ------- | ------------------- | --------------- |
| 3      | 101     | 2024-01-01 10:04:00 | Location change |
| 13     | 105     | 2024-01-01 08:03:00 | Location change |
| 34     | 112     | 2024-01-01 13:04:00 | Location change |
| 6      | 102     | 2024-01-01 09:02:00 | Velocity        |
| ...    | ...     | ...                 | Velocity        |

👉 Multiple fraud reasons can also be combined using:

```sql
GROUP_CONCAT(fraud_reason)
```

---

## 🔥 Key Insights

* Fraud detection is **not binary**, it’s **pattern-based**
* A single rule may not be sufficient → combine multiple signals
* Window functions are extremely powerful for behavioral analysis
* Always validate assumptions (e.g., average-based anomalies)

---

## 💣 Interview Takeaways

You can explain your approach like this:

> “I approached fraud detection as a behavioral problem.
> I defined rules for velocity, location inconsistency, and amount anomalies,
> then implemented them using SQL window functions and CTEs.”

---

## 🚀 Possible Enhancements

* Add **fraud scoring system** instead of binary flags
* Use **median instead of average** for anomaly detection
* Incorporate **device change patterns**
* Move to **machine learning models (advanced)**

---

## 📎 Conclusion

This project demonstrates how SQL can be used to build a **rule-based fraud detection system** by translating real-world suspicious behavior into structured queries.

---

⭐ If you found this useful, consider giving it a star!
