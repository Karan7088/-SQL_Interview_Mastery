# 🧾 Query 1 — First & Last Login per User

```sql
SELECT 
    user_id,
    MIN(event_time) AS first_login,
    MAX(event_time) AS last_login
FROM events
WHERE event_type = 'login'
GROUP BY user_id;
```
