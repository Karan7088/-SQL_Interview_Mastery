📊 Incremental Order Processing & Deduplication (SQL)
🧩 Problem Statement

We are given a raw transactional table orders_source that captures order lifecycle events over multiple days.

This dataset is intentionally messy and real-world-like, containing:

Duplicate records
Late-arriving data
Status updates and reversals
Null and invalid values
Multiple updates within the same day

The goal is to build logic that returns the latest correct snapshot of each order.

⚠️ Challenges in the Data

Before solving, understand what makes this dataset tricky:

1. Duplicate Records
Same order_id, order_status, updated_at

Example:

(1,101,500,'DELIVERED','2024-01-04 08:00:00')
(1,101,500,'DELIVERED','2024-01-04 08:05:00')
2. Late Arriving Data
Older timestamps arriving later in ingestion

Example:

(3,103,300,'CREATED','2024-01-01 09:00:00')
3. Incremental Updates
Same order updated over time

Example:

CREATED → SHIPPED → DELIVERED → RETURNED
4. Status Reversals (Reopens)
Business edge case where order goes backward

Example:

CANCELLED → CREATED
5. Data Quality Issues
NULL values → (10,110,NULL,...)
Zero values → (12,112,0,...)
Negative values → (22,122,-100,...)
6. Multiple Updates Same Day
Need to pick the latest timestamp, not just the day
🎯 Objective

Return the final/latest state of each order_id, ensuring:

No duplicates
Correct chronological ordering
Latest valid update is selected
🧠 Rules to Consider Before Solving

These are critical interview-level considerations:

✅ Rule 1: Remove Exact Duplicates
Same order_id, order_status, updated_at
Keep only one record
✅ Rule 2: Use Timestamp, Not Load Order
Always rely on updated_at
Never assume insert order is correct
✅ Rule 3: Handle Late Arriving Data
Older records should NOT override newer ones
✅ Rule 4: Pick Latest Record per Order
Use ROW_NUMBER() ordered by updated_at DESC
✅ Rule 5: Preserve Full History Until Final Step
Don’t filter too early
First clean → then rank → then pick latest
✅ Rule 6: Be Careful with Edge Cases
Null / negative / zero values may need business rules (optional handling)
🛠️ Solution Approach
Step 1: Deduplicate Data
WITH base AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY order_id, order_status, updated_at
           ) AS dedup
    FROM orders_source
)

👉 Removes exact duplicate rows.

Step 2: Assign Order Timeline
, cte AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY order_id
               ORDER BY updated_at
           ) AS rn
    FROM base
    WHERE dedup = 1
)

👉 Creates a sequence of events per order.

Step 3: Identify Latest Record
, cte2 AS (
    SELECT *,
           MAX(rn) OVER (
               PARTITION BY order_id
           ) AS mx
    FROM cte
)

👉 Finds the last event for each order.

Step 4: Final Output
SELECT order_id,
       customer_id,
       order_amount,
       order_status,
       updated_at
FROM cte2
WHERE rn = mx;
📦 Final Output Meaning

For each order_id, we get:

The latest status
The latest amount
The correct timestamp
🧪 Example Outcomes
order_id	final_status	notes
1	RETURNED	full lifecycle handled
2	DELIVERED	updated amount considered
3	DELIVERED	late data ignored
5	CREATED	reopened after cancel
10	UPDATED	null corrected later
22	CREATED	negative value retained (edge case)
💡 Key Learnings
Real-world data is messy — SQL must handle it
Window functions are essential for:
Deduplication
Sequencing
Latest record extraction
