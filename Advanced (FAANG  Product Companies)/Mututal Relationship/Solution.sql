WITH dedup AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY follower_id, followee_id 
            ORDER BY follow_date DESC
        ) AS rn
    FROM follows
),

pairs AS (
    SELECT 
        rn,
        follow_date,
        CASE 
            WHEN follower_id < followee_id THEN follower_id 
            ELSE followee_id 
        END AS user1,
        CASE 
            WHEN follower_id < followee_id THEN followee_id 
            ELSE follower_id 
        END AS user2
    FROM dedup
    WHERE follower_id != followee_id
)

SELECT 
    user1,
    user2,
    MIN(follow_date) AS first_follow_time,
    MAX(follow_date) AS latest_follow_time,
    COUNT(*) AS interaction_count
FROM pairs
GROUP BY user1, user2
HAVING COUNT(*) > 1;
