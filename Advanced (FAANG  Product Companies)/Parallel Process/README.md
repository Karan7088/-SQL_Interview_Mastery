# 🧠 Advanced SQL Problem: Calculate Active Process Time with Pauses

## 📌 Problem Statement

You are given a table `process_logs` that tracks the lifecycle of multiple processes. Each process generates a sequence of events over time.

Each row represents a state change in a process.

Your task is to compute the **total active running time (in minutes)** for each process.

---

## 📊 Table Description

### `process_logs`

| Column       | Description |
|-------------|------------|
| process_id  | Unique identifier for each process |
| event_type  | Type of event (`START`, `PAUSE`, `RESUME`, `END`) |
| event_time  | Timestamp when the event occurred |

---

## 🎯 Objective

Calculate the **total active time (in minutes)** for each process.

### ✅ Active Time Definition:
> Active time is the duration when the process is actively running — excluding all paused durations.

---

## ⚠️ Event Semantics (VERY IMPORTANT)

Each process follows a timeline of events:

- `START` → Process begins
- `PAUSE` → Process temporarily stops
- `RESUME` → Process continues after pause
- `END` → Process finishes

---

## 🧠 Key Concept

You need to:
- Track time intervals between consecutive events
- Include only intervals where the process is **actively running**
- Exclude intervals where the process is **paused**

---

## 🔍 How the Timeline Works

A process timeline can look like:


This creates multiple **active segments**:

- START → PAUSE  ✅ active
- PAUSE → RESUME ❌ inactive
- RESUME → PAUSE ✅ active
- PAUSE → RESUME ❌ inactive
- RESUME → END   ✅ active

---

## 🧨 Edge Cases & Scenarios to Handle

### 1. Multiple Pauses & Resumes
A process can pause and resume multiple times. You must correctly accumulate only active intervals.

---

### 2. No Pause Scenario
Some processes may have only:

👉 Entire duration is active

---

### 3. Consecutive Events
Invalid or tricky sequences may appear like:

👉 Should not double-count or break logic

---

### 4. Missing Events
Real-world logs might have:
- Missing `RESUME` after `PAUSE`
- Missing `END`

👉 Your logic should be robust or assumptions should be clearly defined

---

### 5. Overlapping Processes
Multiple processes run in parallel:

👉 Each process must be calculated independently

---

### 6. Event Ordering
Events must be processed in chronological order per process

👉 Sorting is critical

---

### 7. Negative or Zero Durations
Bad data may cause:
- Same timestamps
- Out-of-order events

👉 These should not produce incorrect negative durations

---

### 8. Last Event Handling
Final event (`END`) has no next event

👉 Needs special handling when calculating time differences

---

## 🧠 Approach Thinking (What Interviewer Expects)

To solve this problem, you should:

1. Order events per process by time
2. Compare each event with the **next event**
3. Calculate time difference between consecutive events
4. Decide whether that interval is:
   - Active ✅
   - Paused ❌
5. Sum only active intervals per process

---

👉 Each process must be calculated independently

---

### 6. Event Ordering
Events must be processed in chronological order per process

👉 Sorting is critical

---

### 7. Negative or Zero Durations
Bad data may cause:
- Same timestamps
- Out-of-order events

👉 These should not produce incorrect negative durations

---

### 8. Last Event Handling
Final event (`END`) has no next event

👉 Needs special handling when calculating time differences

---

## 🧠 Approach Thinking (What Interviewer Expects)

To solve this problem, you should:

1. Order events per process by time
2. Compare each event with the **next event**
3. Calculate time difference between consecutive events
4. Decide whether that interval is:
   - Active ✅
   - Paused ❌
5. Sum only active intervals per process

---

## 💡 Core Insight

> The problem is essentially about converting **event logs → time intervals → filtering valid intervals → aggregation**

---

## 🚀 Skills Tested

This problem evaluates:

- Window functions (`LAG`, `LEAD`)
- Time calculations
- Conditional logic
- Handling messy real-world event streams
- Analytical thinking (not just SQL syntax)

---

## 🔥 Interview Follow-ups

You may be asked to extend this problem:

- Find **average active time**
- Detect **longest running process**
- Identify **processes stuck in pause**
- Calculate **utilization % (active vs total time)**
- Handle **real-time streaming logs**

---

## 🧠 One-Line Summary

> Convert event-based logs into time intervals and sum only those intervals where the process is actively running.

---


## 💡 Core Insight

> The problem is essentially about converting **event logs → time intervals → filtering valid intervals → aggregation**

---

## 🚀 Skills Tested

This problem evaluates:

- Window functions (`LAG`, `LEAD`)
- Time calculations
- Conditional logic
- Handling messy real-world event streams
- Analytical thinking (not just SQL syntax)

---

## 🔥 Interview Follow-ups

You may be asked to extend this problem:

- Find **average active time**
- Detect **longest running process**
- Identify **processes stuck in pause**
- Calculate **utilization % (active vs total time)**
- Handle **real-time streaming logs**

---

## 🧠 One-Line Summary

> Convert event-based logs into time intervals and sum only those intervals where the process is actively running.

---

