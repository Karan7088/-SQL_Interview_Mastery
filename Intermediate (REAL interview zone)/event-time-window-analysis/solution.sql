
SELECT 
    a.user_id,
    a.event_id,
    b.user_id AS btime,
    b.event_id AS bid,
    TIMESTAMPDIFF(MINUTE, b.event_time, a.event_time) AS df
FROM events a
INNER JOIN events b 
    ON a.event_time > b.event_time
    AND TIMESTAMPDIFF(MINUTE, b.event_time, a.event_time) <= 5
    AND a.event_id > b.event_id
    AND a.user_id = b.user_id;
```
