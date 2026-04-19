📊 Advanced SQL Interview Question: Users with Only Failed Payments but Completed Orders
🧠 Problem Overview

You are given three tables:

users → stores user details
orders → stores order information
payments → stores payment status for each order

The goal is to identify a specific type of user behavior based on order completion and payment outcomes.

🎯 Objective

Find users who have at least one completed order in 2024, but none of their orders have a successful payment.

In simple terms:

Users who placed and completed orders, but never had a successful payment for any of those orders.

🧩 Key Business Logic

To solve this, you need to combine and analyze data across all three tables using joins and aggregation.

✅ Condition 1: Completed Orders in 2024
Only consider orders where:
Order status = 'completed'
Order year = 2024

👉 This ensures we only analyze valid, finalized transactions within the target timeframe.

❌ Condition 2: No Successful Payments
For those users:
None of their payments should have status 'success'

👉 Even one successful payment disqualifies the user.

🔍 Core Concepts Used
1. JOIN (Orders + Payments)
Combine order and payment data using order_id
Helps track payment status for each order
2. GROUP BY (User Level Aggregation)
Group results by user_id
So we can evaluate conditions per user instead of per row
3. Conditional Aggregation

This is the most important part.

✔️ MAX(...) Logic

Used to check if at least one condition is true

If any completed order exists in 2024 → result becomes 1
Otherwise → 0

👉 Meaning: “Did this user ever place a completed order in 2024?”

✔️ MIN(...) Logic

Used to check if all conditions follow a rule

If any payment is 'success' → condition fails
If all payments are non-success (failed, pending) → condition holds

👉 Meaning: “Did this user avoid successful payments entirely?”

⚖️ Why MAX and MIN Together?
Function	Purpose
MAX	Checks existence (at least one valid case)
MIN	Checks strict consistency (no violation allowed)

This combination is a classic SQL interview pattern:

“At least one X AND no Y”

🚫 Important Edge Cases
Users with no payments at all
→ Depends on interpretation (usually excluded unless handled explicitly)
Orders without payments
→ LEFT JOIN ensures these are still considered
Multiple orders per user
→ Aggregation ensures evaluation happens at user level
🧠 Interview Insights

This question tests:

Multi-table joins
Filtering vs aggregation logic
Conditional aggregation (CASE WHEN)
Real-world thinking (not just syntax)
💡 Real-World Use Case

This kind of analysis can be used to:

Detect payment failures across users
Identify problematic payment behavior
Improve payment gateway performance
Flag high-risk or low-conversion users
🔥 Takeaway Pattern

Whenever you see:

“At least one condition AND none of another”

Think:

MAX(...) = 1 → for existence
MIN(...) = 1 → for strict filtering
