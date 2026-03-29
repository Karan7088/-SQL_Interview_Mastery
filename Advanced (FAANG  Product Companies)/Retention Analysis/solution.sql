WITH all_activity AS (
    SELECT 
        user_id,
        DATE(event_time) AS dt
    FROM events 
    WHERE event_type != 'logout'

    UNION 

    SELECT 
        user_id,
        DATE(txn_time)
    FROM transactions
),

user_activity AS (
    SELECT 
        DATE(u.signup_date) AS signup_dt,
        all_activity.*
    FROM all_activity 
    INNER JOIN user u 
        ON all_activity.user_id = u.user_id
),

signup_dates AS (
    SELECT DISTINCT 
        signup_date 
    FROM user 
    WHERE signup_date IS NOT NULL
)

SELECT 
    *,

    (
        SELECT COUNT(DISTINCT user_id) 
        FROM user_activity 
        WHERE signup_date = signup_dt
    ) AS day0,

    (
        SELECT COUNT(DISTINCT user_id) 
        FROM user_activity 
        WHERE signup_date = signup_dt 
          AND dt = signup_date + INTERVAL 1 DAY
    ) AS day1,

    (
        SELECT COUNT(DISTINCT user_id) 
        FROM user_activity 
        WHERE signup_date = signup_dt 
          AND dt = signup_date + INTERVAL 6 DAY
    ) AS day7

FROM signup_dates;
