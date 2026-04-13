👇

📊 Cohort Revenue Analysis (Advanced SQL)
🚀 Problem Overview

In this problem, we analyze user purchasing behavior over time using cohort analysis.

The goal is to group users based on their first purchase month (cohort month) and then track how much revenue they generate in subsequent months (activity months).

This type of analysis is widely used in product analytics, growth teams, and FAANG-level interviews to understand:

Customer retention 💡
Revenue patterns 📈
User lifecycle behavior 🔁
🎯 Objective

For each cohort month, calculate the total revenue generated in every activity month.

Output should answer:

“Users who made their first purchase in Month X generated how much revenue in Month Y?”

🧠 Key Concepts Involved
Cohort Analysis
Window Functions
Monthly Bucketing
De-duplication Logic
Revenue Aggregation
Cross Join for full matrix generation
⚠️ Rules & Constraints (VERY IMPORTANT)

Before solving this problem, you must carefully handle the following real-world complexities:

1️⃣ Only Valid Transactions
Consider only completed orders
Ignore all other statuses (e.g., cancelled)

👉 Ensures revenue accuracy

2️⃣ Monthly Granularity
Convert order dates into Year-Month format (YYYY-MM)
All calculations must happen at the monthly level, not daily
3️⃣ Define Cohort Month
For each user, identify their first purchase month
This becomes the user’s cohort

👉 A user belongs to only one cohort

4️⃣ Activity Month
Any month in which the user made a purchase is an activity month
5️⃣ Handle Duplicate Orders
A user may place multiple orders in the same month
These should be:
Aggregated into a single monthly revenue
Not treated as separate rows in final cohort mapping
6️⃣ One Record per User per Month

Ensure:

One user contributes only once per month in cohort calculations

👉 Prevents double counting

7️⃣ Revenue Aggregation Rule
For each (user_id, month):
Sum all order amounts → Monthly Revenue
8️⃣ Cohort vs Activity Mapping
Only include rows where:
cohort_month = user's first purchase month
activity_month = month of revenue
9️⃣ Full Cohort Matrix Requirement
Generate all combinations of:
Cohort Month × Activity Month

👉 Even if revenue = 0 (important for visualization)

🔟 Time Progression Logic
Activity months should be:
Same as or after cohort month
(No backward time analysis)
📈 Expected Output Format
cohort_month	activity_month	total_revenue
2023-01	2023-01	XXXX
2023-01	2023-02	XXXX
2023-01	2023-03	XXXX
...	...	...
💡 Key Insights You Should Derive
Which cohorts generate the highest revenue over time
How quickly users drop off or retain
Revenue concentration across months
Behavior of high-value vs low-value users
🧩 Why This Problem is Important

This is a real-world production-level analytics problem frequently asked in:

FAANG Interviews 🏆
Product-Based Companies
Data Analyst / Data Scientist Roles

It tests your ability to:

Handle messy real-world data
Apply window functions effectively
Think in terms of business metrics
🔥 Final Thoughts

This problem is not just about SQL — it's about:

Turning raw transactional data into meaningful business insights.

Mastering this concept will significantly improve your:

Analytical thinking
SQL problem-solving skills
Interview performance
