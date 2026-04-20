📊 Daily Metrics Anomaly Detection
🚀 Overview

This project focuses on identifying unusual patterns (anomalies) in daily business metrics such as revenue, orders, and users.

In real-world analytics, detecting sudden spikes or drops is critical for:

Monitoring business health
Catching fraud or system issues
Identifying marketing impacts
Understanding unexpected user behavior
📁 Dataset Description

The dataset represents daily aggregated metrics with the following fields:

metric_date → Date of record
revenue → Total revenue for the day
orders → Number of orders placed
users → Number of active users

The data includes:

Normal gradual growth trends
Sudden spikes (positive anomalies)
Sharp drops (negative anomalies)
Minor fluctuations (acceptable variations)
🎯 Objective

The goal is to detect anomalies in time-series data by comparing current values with historical trends.

We classify each day into:

Normal
Anomaly (Spike)
Anomaly (Drop)
🧠 Anomaly Detection Logic

The approach is based on a rolling average comparison using past data.

Key Idea:

Each day’s value is compared against the average of previous days to determine if it deviates significantly.

📏 Rules for Detection
1. Rolling Window
Use the previous 3 days
Exclude the current day from calculation
Ensures comparison is based only on past behavior
2. Spike Detection 🚀

A day is considered a spike anomaly if:

Current value is significantly higher than recent trend
Typically when it exceeds a defined multiplier of the recent average

👉 Indicates:

Viral growth
Campaign success
Data issue or duplication
3. Drop Detection 📉

A day is considered a drop anomaly if:

Current value is significantly lower than recent trend

👉 Indicates:

System failure
Payment issues
Demand crash
4. Normal Behavior ✅

A day is classified as normal when:

It falls within an acceptable range of recent values
Small fluctuations are allowed
⚙️ Important Considerations
✔️ Window Size Selection
Small window (3 days) → More sensitive
Large window → More stable but slower detection
✔️ Threshold Sensitivity
Higher threshold → Fewer anomalies
Lower threshold → More anomalies (including noise)
✔️ Excluding Current Day
Prevents bias in anomaly detection
Ensures fair comparison with historical data
✔️ Handling Edge Cases
Initial days may not have enough history
These can be:
Ignored
Marked as insufficient data
📊 Types of Anomalies in Dataset

The dataset includes:

📈 Sudden spikes (e.g., unexpected revenue surge)
📉 Sharp drops (e.g., system downtime impact)
🔁 Recovery patterns after anomalies
📊 Gradual growth trends
💡 Real-World Applications
E-commerce dashboards → Monitor revenue dips/spikes
Fintech systems → Detect fraudulent transactions
Product analytics → Identify feature impact
Marketing analytics → Track campaign performance
🛠️ Possible Improvements
Use Z-score for statistical anomaly detection
Apply Machine Learning models (Isolation Forest, Prophet)
Add seasonality adjustments (weekends, holidays)
Visualize anomalies using dashboards
📌 Conclusion

Anomaly detection using rolling averages is:

Simple
Effective
Widely used in industry

It provides quick insights into unusual patterns and helps businesses react faster to unexpected changes.
