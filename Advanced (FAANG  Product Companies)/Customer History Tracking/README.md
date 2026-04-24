# 📊 Slowly Changing Dimension (SCD Type 2) – Customer History Tracking

## 🧠 Problem Overview

This project demonstrates how to track historical changes in customer data over time using the **Slowly Changing Dimension Type 2 (SCD Type 2)** approach.

The dataset captures multiple snapshots of customer records across different dates, where attributes like **city** may change over time. The goal is to preserve history while also identifying the **current active record**.

---

## 🎯 Objective

Convert raw transactional snapshots into a structured historical table that:

- Tracks **when a change starts**
- Tracks **when a change ends**
- Flags the **current active record**
- Avoids duplicate consecutive records

---

## 📂 Dataset Description

Each record represents a snapshot of a customer at a given point in time:

- `customer_id` → Unique identifier
- `customer_name` → Name of the customer
- `city` → Customer’s city (can change over time)
- `updated_at` → Snapshot date

---

## ⚙️ Key Logic Applied

### 1. Detect Changes
- Identify when a customer's **city changes**
- Ignore consecutive duplicate records (same city repeated)

### 2. Define Time Windows
- Assign:
  - **start_date** → When the change begins
  - **end_date** → One day before the next change

### 3. Handle Current Records
- If no future record exists:
  - `end_date = NULL`
  - Mark as **current (Y)**

---

## 🧩 Output Structure

| Column         | Description |
|----------------|------------|
| customer_id    | Unique customer ID |
| customer_name  | Customer name |
| city           | City during that time period |
| start_date     | Start of validity |
| end_date       | End of validity |
| is_current     | Y (current) / N (historical) |

---

## 📌 Example Insight

For a customer who moves:

- Delhi → Gurgaon → Delhi

The output will create **three separate records**, each with proper time boundaries.

---

## 🚀 Use Cases

- Customer address/history tracking  
- Audit trails  
- Data warehousing (Dimension tables)  
- Change data capture (CDC)  
- Business analytics on historical data  

---

## 💡 Key Takeaways

- SCD Type 2 ensures **full history preservation**
- Helps answer:
  - *"Where was the customer at a given time?"*
- Eliminates redundancy while maintaining accuracy
- Widely used in **data engineering and analytics pipelines**

---

## 🛠️ Skills Demonstrated

- Window functions  
- Change detection logic  
- Data transformation  
- Temporal data modeling  
- Real-world data warehousing patterns  

---

## 📎 Conclusion

This implementation provides a clean and efficient way to transform raw snapshot data into a **fully historized dimension table**, making it production-ready for analytics and reporting use cases.
