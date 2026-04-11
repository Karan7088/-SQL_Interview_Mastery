# 💣 Advanced SQL Problem: Customer LTV Calculation with Dirty Data

## 📌 Problem Statement

You are given two tables:

* `customers` → contains customer details
* `orders` → contains transaction-level data

Your task is to calculate the **Lifetime Value (LTV)** of each customer.

---

## ⚠️ Real-World Complexity (Important Rules)

This is NOT a simple SUM problem. The dataset simulates real production issues and contains multiple edge cases:

---

### 🔹 1. Duplicate Orders

Some rows in the `orders` table are exact duplicates
(same `customer_id`, `order_date`, `amount`, `status`)

👉 These must be counted **only once**

---

### 🔹 2. Cancelled Orders

Orders with:

```
status = 'cancelled'
```

👉 These should be **completely ignored** from LTV calculation

---

### 🔹 3. Refunded Orders

Orders with:

```
status = 'refunded'
```

* These typically have **negative amounts**
* They represent money returned to the customer

---

### 🔥 Critical Twist (Most Important Rule)

If a customer has a:

> ❌ **Refund BEFORE any completed order**

👉 Then this customer becomes **invalid for LTV calculation**

This means:

* Even if they later place valid orders
* Their LTV should **NOT be considered normally**

---

### 🔹 4. Valid Customers

A customer is considered **valid** ONLY IF:

* They have at least one `completed` order
* They do NOT have an early refund before any completed order

---

### 🔹 5. Customers With No Orders

* Some customers may not have any orders at all
* These customers must still appear in the final output

👉 Their LTV should be:

```
0
```

---

## 🎯 Goal

For each customer, compute:

```
LTV = Sum of all valid transaction amounts
```

Where:

* Cancelled orders are excluded
* Duplicate orders are removed
* Refund logic is applied carefully
* Invalid customers are handled properly

---

## 🧠 Step-by-Step Solution Approach

---

### 🔹 Step 1: Data Cleaning (Base Layer)

* Remove all `cancelled` orders
* Identify duplicate rows using:

  * `ROW_NUMBER()` over partition of:

    ```
    (customer_id, order_date, amount, status)
    ```
* Keep only the first occurrence (rn = 1)

👉 This ensures we are working with **clean, unique transactions**

---

### 🔹 Step 2: Assign Transaction Priority

Create a flag to classify transaction types:

* `completed` → High priority
* `refunded` → Lower priority

👉 This helps track transaction flow logically

---

### 🔹 Step 3: Sequence Validation (Most Important Logic)

For each customer:

* Look at **previous transactions**
* Check if:

  * A `refunded` transaction occurs
  * BEFORE any `completed` transaction

👉 If YES:

* Mark this as an **invalid pattern**

This is done using:

* Window functions
* Running aggregation over previous rows

---

### 🔹 Step 4: Customer-Level Flagging

* Aggregate the invalid flags at customer level
* If a customer has even ONE invalid sequence

👉 Mark the entire customer as:

```
invalid
```

---

### 🔹 Step 5: LTV Calculation

* Join cleaned orders with customers

* Include ONLY:

  * Valid customers
  * Valid transactions

* Compute:

```
SUM(amount)
```

👉 This gives correct LTV per customer

---

### 🔹 Step 6: Include Missing Customers

Some customers:

* Have no orders
* Or were filtered out completely

👉 These must still appear using:

* LEFT JOIN
* UNION logic

With:

```
LTV = 0
```

---

## ⚡ Key SQL Concepts Used

* Window Functions:

  * `ROW_NUMBER()`
  * `MAX() OVER()`
* Deduplication using partitions
* Conditional logic (`CASE WHEN`)
* Sequential event validation
* CTE-based stepwise transformation
* LEFT JOIN for full coverage
* UNION for missing records

---

## 🚀 Why This Problem is FAANG-Level

This problem tests your ability to:

* Handle **dirty real-world data**
* Remove duplicates correctly
* Understand **event sequencing**
* Apply **business logic on time-series data**
* Break down complex logic using CTEs

👉 It’s not about writing SQL — it’s about **thinking like a data engineer**

---

## 🧩 Final Output Format

| customer_id | customer_name | ltv |
| ----------- | ------------- | --- |

---

## 💡 Common Mistakes

❌ Including cancelled orders
❌ Not removing duplicates
❌ Treating refunds blindly
❌ Ignoring transaction order (sequence)
❌ Dropping customers with no orders

---

## 🧠 Pro Insight

👉 In real-world analytics:

**Order of events matters more than values**

A refund before purchase ≠ refund after purchase

Understanding this difference is what makes this problem **advanced**

---

🔥 This is a perfect example of a real production-level SQL challenge.
