# 📉 Detect Significant Revenue Drops (SQL Problem)

## 🧠 Problem Statement

You are given a dataset that tracks **daily revenue** for a business. Each record represents the revenue generated on a specific date.

Your task is to identify **days where the revenue dropped significantly compared to the previous day**.

---

## 🎯 Objective

Find all dates where:

* Revenue has **decreased compared to the previous day**, and
* The **percentage drop is 30% or more**

---

## 🔍 Key Concepts Involved

### 1. Day-over-Day Comparison

To analyze trends, we compare each day's revenue with the **previous day's revenue**.

Example:

| Date  | Revenue |
| ----- | ------- |
| Jan 5 | 1400    |
| Jan 6 | 900     |

Here, Jan 6 revenue is compared with Jan 5.

---

### 2. Percentage Drop Calculation

To measure how big the drop is, we use:

[
\text{Drop %} = \frac{\text{Current Revenue} - \text{Previous Revenue}}{\text{Previous Revenue}} \times 100
]

* If the result is **negative**, it indicates a drop
* We are only interested in drops of **30% or more**

---

### 3. Absolute Value for Readability

Since percentage drops are negative values, we often convert them into **positive numbers** (absolute value) for easier interpretation.

Example:

* Actual: `-35%`
* Displayed: `35% drop`

---

## 📊 Example Walkthrough

### Sample Data

| Date  | Revenue |
| ----- | ------- |
| Jan 5 | 1400    |
| Jan 6 | 900     |

### Step-by-Step Calculation

* Previous Revenue = 1400
* Current Revenue = 900

[
\text{Drop %} = \frac{900 - 1400}{1400} \times 100 = -35.71%
]

👉 Since the drop is greater than 30%, this date **should be included in the result**.

---

## ✅ Expected Output Columns

The final result should include:

* **revenue_date** → The date of the drop
* **current_revenue** → Revenue on that day
* **prev_revenue** → Revenue from previous day
* **drop_percentage** → Percentage drop (positive value for readability)

---

## ⚠️ Important Notes

* The **first row** will not have a previous day → ignore it
* Only consider rows where:

  * Revenue decreased (negative change)
  * Drop ≥ 30%
* Ensure calculations are done in **decimal/float** to avoid rounding errors

---

## 💡 Real-World Use Case

This type of analysis is widely used in:

* 📊 Business performance monitoring
* 🚨 Detecting anomalies in sales
* 📉 Identifying sudden revenue drops
* 📈 Building alert systems for stakeholders

---

## 🧩 Summary

* Compare each day's revenue with the previous day
* Calculate percentage change
* Filter only significant drops (≥ 30%)
* Present results in a clean, readable format

---

This is a classic **window function + analytical SQL problem**, commonly asked in **data analyst and product-based company interviews**.
