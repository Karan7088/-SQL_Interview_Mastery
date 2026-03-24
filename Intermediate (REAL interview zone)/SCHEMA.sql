-- =========================
-- DROP (optional reset)
-- =========================
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS users;

-- =========================
-- CREATE TABLES
-- =========================

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    signup_date DATE
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    user_id INT,
    event_type VARCHAR(20),
    event_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE transactions (
    txn_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    category VARCHAR(50),
    txn_time DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

