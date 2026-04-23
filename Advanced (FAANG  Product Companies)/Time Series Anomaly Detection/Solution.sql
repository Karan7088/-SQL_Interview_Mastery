📊 Time Series Anomaly Detection using Moving Average & Z-Score
🚀 Problem Overview

This project focuses on detecting anomalies (unexpected spikes or drops) in a time-series sales dataset across different regions.

The dataset contains daily revenue data, and the goal is to identify unusual behavior such as:

Sudden spikes in revenue
Significant drops in revenue
Normal business fluctuations
📌 Key Idea

Instead of comparing raw values directly, we use a rolling statistical approach:

Moving Average → captures short-term trend
Moving Standard Deviation → measures variability
Z-score → detects how far a value deviates from normal behavior

This helps distinguish real anomalies from normal seasonal or gradual changes.

🧠 Core Concepts Explained
1. Aggregation Level

Data is first standardized to:

Daily revenue per region

This ensures:

No duplicate rows per date-region combination
Clean time-series sequence
2. Rolling Window (3-Day Logic)

We use a sliding window of 3 days:

Current day
Previous 2 days

👉 This window helps capture recent trends, not long-term history.

3. Moving Average (Trend)

Moving average represents the expected revenue based on recent days.

Smooths out short-term fluctuations
Helps establish a baseline

👉 If current revenue deviates a lot from this baseline → possible anomaly

4. Moving Standard Deviation (Volatility)

Standard deviation tells us:

How much variation exists in recent data

👉 Low std dev → stable data
👉 High std dev → volatile data

This is critical because:

A ₹200 change might be huge in stable data
But normal in volatile data
5. Z-Score (Anomaly Signal)

Z-score standardizes deviation:

Measures how far current value is from moving average
Adjusts based on volatility
Interpretation:
Z-score Range	Meaning
Between -2 and +2	Normal
Less than -2	Significant Drop
Greater than +2	Significant Spike
⚠️ Special Handling Rules
1. Insufficient Data

For the first few rows:

Not enough past data to calculate rolling metrics

👉 These are labeled as:

INSUFFICIENT_DATA
2. Zero or NULL Standard Deviation

If all values in window are same:

Standard deviation becomes 0

👉 In such cases:

Z-score is undefined
Data is treated as Normal
3. Region-wise Isolation

All calculations are done:

Independently per region

👉 Ensures:

North and South patterns don’t mix
Accurate anomaly detection per segment
📉 Types of Anomalies Detected
🔻 Drop (Negative Anomaly)
Revenue significantly below expected trend
Example: sudden fall due to system issue, demand crash
🔺 Spike (Positive Anomaly)
Revenue significantly above expected trend
Example: sale event, festival, unexpected surge
✅ Normal
Within expected variation range
No unusual behavior
📊 Why This Approach Works

✔ Handles noise in data
✔ Adapts to local trends
✔ Works well for real-world business metrics
✔ Scales across multiple regions/products

💡 Real-World Use Cases
📦 E-commerce sales monitoring
💳 Fraud detection (transaction spikes)
📈 KPI anomaly alerts
📉 Churn or engagement drop detection
⚙️ System performance monitoring
🏁 Conclusion

This approach provides a robust and scalable method to detect anomalies in time-series data by combining:

Rolling statistics
Standard deviation-based normalization
Clear rule-based classification

It ensures that only statistically significant deviations are flagged, reducing false alarms and improving decision-making.
