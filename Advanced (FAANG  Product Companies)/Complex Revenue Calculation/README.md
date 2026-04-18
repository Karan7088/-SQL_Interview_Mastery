# 📊 Advanced SQL Problem – Revenue Calculation with Real-World Constraints

## 🧠 Problem Overview

You are given a simplified e-commerce dataset with four tables:

* **users** → customer details
* **orders** → order-level information
* **products** → product catalog
* **order_items** → item-level transaction data

Your task is to compute **total revenue per user and country**, but this is **not a straightforward sum**. The dataset includes **duplicates, inactive users, cancelled orders, and irrelevant categories**, which must be handled carefully.

---

## ⚠️ Challenges in the Data

This problem is designed to simulate real-world messy data. Here are the key complications:

### 1. Duplicate Records

Some order items appear multiple times with the same:

* order
* product
* price

👉 These duplicates should be counted **only once**, otherwise revenue will be inflated.

---

### 2. Irrelevant Product Categories

Not all products should be included.

👉 Only include:

* **Electronics category**

👉 Ignore:

* Fashion, Accessories, etc.

---

### 3. Cancelled Orders

Some orders were never completed.

👉 Only include:

* Orders with status = **completed**

👉 Ignore:

* Cancelled orders

---

### 4. Inactive Users

Some users are no longer active.

👉 Only include:

* Users with status = **active**

👉 Ignore:

* Inactive users

---

### 5. Time Constraint

You are only interested in a specific time period.

👉 Only include:

* Orders from **year 2024**

👉 Ignore:

* Any orders from previous years

---

## 🧩 What Needs to Be Calculated?

For each **user and their country**, calculate:

👉 Total revenue generated from:

* Valid (non-duplicate) order items
* Electronics products
* Completed orders
* Active users
* Orders placed in 2024

---

## 🪜 Step-by-Step Thinking Approach

### Step 1: Remove Duplicate Items

Identify repeated rows in order items and keep only one instance.

✔ This ensures:

* Revenue is not double-counted

---

### Step 2: Filter Relevant Products

Keep only items that belong to the **Electronics category**.

✔ This ensures:

* Only targeted business segment is analyzed

---

### Step 3: Calculate Order-Level Revenue

For each order:

* Add up all valid item prices

✔ Important:

* Even if an order has multiple items, it should contribute **only once per order total**

---

### Step 4: Filter Valid Orders

Apply conditions:

* Order must be **completed**
* Order must belong to **year 2024**

---

### Step 5: Filter Active Users

Join with users table and keep:

* Only users with **active status**

---

### Step 6: Aggregate Final Result

Group by:

* User
* Country

Then calculate:

* Total revenue per group

---

## 🧠 Key Concepts Tested

This problem is designed to test advanced SQL thinking:

* Handling **duplicate data**
* Applying **multi-level filtering**
* Understanding **business rules**
* Performing **window-based aggregations**
* Avoiding **double counting**
* Working with **real-world messy datasets**

---

## 🚨 Common Mistakes to Avoid

* ❌ Counting duplicate order items
* ❌ Including cancelled orders
* ❌ Including inactive users
* ❌ Forgetting to filter by year
* ❌ Mixing categories (including non-electronics)
* ❌ Summing at wrong level (item vs order)

---

## 🎯 Final Insight

This is not just a SQL problem — it's a **data cleaning + business logic problem**.

In real-world analytics:

* Data is rarely clean
* Business rules matter more than raw queries
* Correct filtering = correct insights

---

## 💡 Takeaway

To solve problems like this:

> Always think in layers — clean → filter → aggregate → validate

If you can handle this cleanly, you're already thinking at a **FAANG-level data engineer mindset** 🚀
