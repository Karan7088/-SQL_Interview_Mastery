# 🧠 SQL Interview Problem: Mutual Relationships in a Noisy Social Graph

## 📌 Problem Statement

You are given a `follows` table that represents user interactions in a social platform.  
Each record indicates that one user followed another at a specific point in time.

Your task is to identify **mutual relationships** — where:

> User A follows User B **and** User B follows User A

---

## 🎯 Objective

For every valid mutual pair, return:

- `user1` (smaller user id)
- `user2` (larger user id)
- `first_follow_time` → earliest interaction between the pair
- `latest_follow_time` → most recent interaction
- `interaction_count` → total number of interactions between both users

---

## 🧩 Why This Problem is Challenging

This is not a simple lookup problem. The dataset simulates **real-world production logs**, which include:

- Duplicate follow events  
- Multiple interactions over time  
- One-way relationships  
- Cycles and indirect connections  
- Self-follow edge cases  

You are required to extract **clean, meaningful relationships** from messy data.

---

## 🏗️ Data Understanding

Each row represents:


follower_id → followee_id at a specific timestamp


Examples:

- `(1 → 2)` means user 1 followed user 2  
- `(2 → 1)` means user 2 followed user 1  

When both exist → **mutual relationship**

---

## ⚠️ Important Rules & Edge Cases

### 1. Mutual Relationship Definition
A pair is considered mutual only if:

- A follows B  
- AND B follows A  

---

### 2. Normalize User Pairs
To avoid duplication:

- Always represent pair as `(smaller_id, larger_id)`
- So `(1,2)` and `(2,1)` are treated as the same pair

---

### 3. Ignore Self-Follows
Cases like:


(35 → 35)


Should be ignored — a user cannot form a mutual relationship with themselves.

---

### 4. Handle Duplicate Records
Real systems often log multiple follow actions:


(21 → 22)
(21 → 22)
(22 → 21)
(22 → 21)


These are **not errors**, but repeated interactions.

👉 You must:
- Keep them  
- Use them to calculate interaction count  

---

### 5. Time-Based Aggregation
Each relationship is not static — it evolves over time.

For every valid pair:

- Find the **first time they interacted**
- Find the **latest interaction**
- Count total interactions

---

### 6. Ignore One-Way Relationships
Examples:


(11 → 12)


If reverse does not exist → ❌ Not mutual

---

### 7. Ignore Cycles (Indirect Relationships)
Example:


41 → 42
42 → 43
43 → 41


This forms a cycle but **not a direct mutual pair**

---

## 🧠 How to Think About the Problem

Break it into steps:

1. Clean the data (remove self-follow noise)  
2. Normalize pairs to avoid duplication  
3. Combine both directions into a single pair  
4. Aggregate interactions across time  
5. Filter only true mutual relationships  

---

## 💡 Key Concepts Tested

- Window Functions (handling duplicates & latest records)  
- Conditional logic for pair normalization  
- Grouping and aggregation  
- Handling messy real-world data  
- Graph-like relationship reasoning  

---

## 🚀 Real-World Relevance

This problem directly maps to:

- Social media (followers / connections)  
- Friendship detection systems  
- Recommendation engines  
- Network graph analysis  

---

## 🔥 Interview-Level Insights

- This is **not just SQL**, it’s **data reasoning**
- The hardest part is not writing queries, but:
  - Understanding relationships  
  - Handling noisy data  
- Many candidates fail by:
  - Not normalizing pairs  
  - Double counting relationships  
  - Ignoring edge cases  

---

## 🏁 Final Takeaway

If you can solve this correctly, you demonstrate:

✅ Strong SQL fundamentals  
✅ Ability to handle real-world messy data  
✅ Understanding of graph-like relationships  
✅ FAANG-level problem-solving skills  

---
