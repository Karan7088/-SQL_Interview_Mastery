drop table users;
drop table transactions;
drop table events;
-- =========================
-- USERS TABLE
-- =========================
CREATE TABLE user (
    user_id INT,
    name VARCHAR(50),
    signup_date DATE
);

INSERT INTO user VALUES
(1, 'Karan', '2024-01-01'),
(2, 'Amit', '2024-01-02'),
(3, 'Riya', '2024-01-03'),
(4, 'Neha', '2024-01-04'),
(5, 'Rahul', '2024-01-05'),
(6, 'Ghost', NULL),                 -- NULL signup
(7, 'Inactive', '2024-01-07'),      -- churn candidate
(8, 'OnlyTxn', '2024-01-08'),       
(9, 'OnlyEvent', '2024-01-09'),
(10, 'RepeatUser', '2024-01-10');

-- =========================
-- EVENTS TABLE
-- =========================
CREATE TABLE events (
    event_id INT,
    user_id INT,
    event_type VARCHAR(20),
    event_time DATETIME
);

INSERT INTO events VALUES

-- User 1 (sessions + gaps + duplicates)
(1,1,'login','2024-01-01 09:00:00'),
(2,1,'click','2024-01-01 09:05:00'),
(3,1,'click','2024-01-01 09:05:00'), -- duplicate
(4,1,'logout','2024-01-01 09:40:00'), -- session break
(5,1,'login','2024-01-01 10:30:00'),

-- User 2 (funnel: signup → purchase)
(6,2,'login','2024-01-02 10:00:00'),
(7,2,'click','2024-01-02 10:05:00'),

-- User 3 (rapid events)
(8,3,'login','2024-01-03 09:00:00'),
(9,3,'click','2024-01-03 09:00:02'),
(10,3,'click','2024-01-03 09:00:03'),

-- User 4 (event stream states)
(11,4,'start','2024-01-04 08:00:00'),
(12,4,'pause','2024-01-04 08:10:00'),
(13,4,'resume','2024-01-04 08:20:00'),
(14,4,'cancel','2024-01-04 08:30:00'),

-- User 9 (only events)
(15,9,'login','2024-01-09 11:00:00'),

-- User 10 (repeat usage)
(16,10,'login','2024-01-10 09:00:00'),
(17,10,'login','2024-01-11 09:00:00'), -- Day 1 retention
(18,10,'login','2024-01-17 09:00:00'); -- Day 7 retention

-- =========================
-- TRANSACTIONS TABLE
-- =========================
CREATE TABLE transactions (
    txn_id INT,
    user_id INT,
    amount INT,
    category VARCHAR(20),
    txn_time DATETIME
);

INSERT INTO transactions VALUES

-- User 1 (duplicates + fraud pattern)
(1,1,100,'electronics','2024-01-01 10:00:00'),
(2,1,100,'electronics','2024-01-01 10:00:05'), -- rapid duplicate
(3,1,5000,'electronics','2024-01-01 10:01:00'), -- high value

-- User 2 (funnel purchase)
(4,2,200,'fashion','2024-01-02 10:10:00'),

-- User 3 (overlapping timestamps)
(5,3,150,'grocery','2024-01-03 12:00:00'),
(6,3,150,'grocery','2024-01-03 12:00:01'),

-- User 8 (only txn)
(7,8,300,'electronics','2024-01-08 12:00:00'),

-- User 10 (repeat purchase)
(8,10,400,'fashion','2024-01-10 10:00:00'),
(9,10,500,'fashion','2024-01-15 10:00:00'),

-- NULL / edge
(10,4,NULL,'fashion','2024-01-04 09:00:00');

-- =========================
-- SALARY TABLE (Median)
-- =========================
CREATE TABLE salaries (
    emp_id INT,
    salary INT
);

INSERT INTO salaries VALUES
(1,30000),
(2,40000),
(3,50000),
(4,60000),
(5,70000),
(6,70000); -- even count + duplicate

-- =========================
-- SUBSCRIPTIONS (CHURN / EVENT STREAM)
-- =========================
CREATE TABLE subscriptions (
    user_id INT,
    status VARCHAR(20),
    status_time DATETIME
);

INSERT INTO subscriptions VALUES
(1,'active','2024-01-01'),
(1,'cancelled','2024-02-01'),

(2,'active','2024-01-02'),

(3,'active','2024-01-03'),
(3,'inactive','2024-01-20'),

(4,'active','2024-01-04'),
(4,'paused','2024-01-05'),
(4,'resumed','2024-01-06'),
(4,'cancelled','2024-01-07'),

(7,'active','2024-01-07'); -- churn (no activity later)

