drop table txn;
CREATE TABLE txn (
    txn_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    txn_time DATETIME,
    location VARCHAR(50),
    device_id VARCHAR(50),
    status VARCHAR(20) -- success / failed
);
INSERT INTO txn VALUES
(1, 101, 500,  '2024-01-01 10:00:00', 'Delhi',  'D1', 'success'),
(2, 101, 2000, '2024-01-01 10:02:00', 'Delhi',  'D1', 'success'),
(3, 101, 7000, '2024-01-01 10:04:00', 'Mumbai', 'D2', 'success'),

(4, 102, 100,  '2024-01-01 09:00:00', 'Delhi',  'D3', 'failed'),
(5, 102, 150,  '2024-01-01 09:01:00', 'Delhi',  'D3', 'failed'),
(6, 102, 200,  '2024-01-01 09:02:00', 'Delhi',  'D3', 'success'),

(7, 103, 10000,'2024-01-01 11:00:00', 'Delhi',  'D4', 'success'),
(8, 103, 12000,'2024-01-01 11:05:00', 'Delhi',  'D4', 'success'),

(9, 104, 300,  '2024-01-01 12:00:00', 'Delhi',  'D5', 'success'),
(10,104, 300,  '2024-01-01 12:01:00', 'Delhi',  'D6', 'success'),
(11,104, 300,  '2024-01-01 12:02:00', 'Delhi',  'D7', 'success');
INSERT INTO txn VALUES

-- 🔥 Rapid cross-location fraud (impossible travel)
(12, 105, 800,  '2024-01-01 08:00:00', 'Delhi',     'D8',  'success'),
(13, 105, 900,  '2024-01-01 08:03:00', 'Bangalore', 'D8',  'success'),

-- 🔥 Same user, different devices quickly (device hopping)
(14, 106, 400,  '2024-01-01 07:00:00', 'Delhi', 'D9',  'success'),
(15, 106, 450,  '2024-01-01 07:01:00', 'Delhi', 'D10', 'success'),
(16, 106, 500,  '2024-01-01 07:02:00', 'Delhi', 'D11', 'success'),

-- 🔥 Midnight suspicious activity
(17, 107, 2000, '2024-01-01 02:00:00', 'Delhi', 'D12', 'success'),
(18, 107, 2500, '2024-01-01 02:05:00', 'Delhi', 'D12', 'success'),

-- 🔥 Card testing (many small transactions)
(19, 108, 10,  '2024-01-01 06:00:00', 'Delhi', 'D13', 'success'),
(20, 108, 15,  '2024-01-01 06:01:00', 'Delhi', 'D13', 'success'),
(21, 108, 20,  '2024-01-01 06:02:00', 'Delhi', 'D13', 'success'),
(22, 108, 25,  '2024-01-01 06:03:00', 'Delhi', 'D13', 'success'),

-- 🔥 Sudden huge spike
(23, 109, 200,   '2024-01-01 09:00:00', 'Delhi', 'D14', 'success'),
(24, 109, 300,   '2024-01-01 09:05:00', 'Delhi', 'D14', 'success'),
(25, 109, 15000, '2024-01-01 09:10:00', 'Delhi', 'D14', 'success'),

-- 🔥 Same amount repeated (bot behavior)
(26, 110, 999, '2024-01-01 10:00:00', 'Delhi', 'D15', 'success'),
(27, 110, 999, '2024-01-01 10:01:00', 'Delhi', 'D15', 'success'),
(28, 110, 999, '2024-01-01 10:02:00', 'Delhi', 'D15', 'success'),

-- 🔥 Failed attempts burst
(29, 111, 1000, '2024-01-01 11:00:00', 'Delhi', 'D16', 'failed'),
(30, 111, 1000, '2024-01-01 11:01:00', 'Delhi', 'D16', 'failed'),
(31, 111, 1000, '2024-01-01 11:02:00', 'Delhi', 'D16', 'failed'),
(32, 111, 1000, '2024-01-01 11:03:00', 'Delhi', 'D16', 'success'),

-- 🔥 Same user different cities within minutes
(33, 112, 700, '2024-01-01 13:00:00', 'Mumbai', 'D17', 'success'),
(34, 112, 800, '2024-01-01 13:04:00', 'Chennai','D17', 'success');
