# 🔥 Find Consecutive Login Days (Gaps & Islands)

## 🚀 Problem Statement

Given a table of user events, identify **consecutive login streaks** for each user.

A streak is defined as a sequence of **continuous days** where a user has at least one `login` event.

---

## 📊 Table: `events`

| Column      | Type      |
|------------|----------|
| event_id   | INT      |
| user_id    | INT      |
| event_type | VARCHAR  |
| event_time | DATETIME |

---

## 🧠 Key Rules

- ✅ Only consider `event_type = 'login'`
- ✅ Multiple logins on the same day = **1 login day**
- ❌ Other events (`click`, `logout`, NULL) are ignored
- ❌ Missing a day breaks the streak

---

## 💀 Edge Cases Covered

- Duplicate logins on same timestamp  
- Multiple logins on same day  
- Out-of-order timestamps  
- Missing days (gaps)  
- Users with single login  
- Users with no login  

---

## 🧩 Approach (Gaps & Islands)

This is a classic **Gaps & Islands** problem.

### Steps:
1. Extract only login events  
2. Convert timestamp → date  
3. Remove duplicates (same user, same date)  
4. Assign row numbers per user  
5. Create a grouping key using:

