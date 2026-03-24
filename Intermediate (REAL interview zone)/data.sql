-- =========================
-- INSERT USERS
-- =========================

INSERT INTO users VALUES
(1, 'Karan', '2024-01-01'),
(2, 'Amit', '2024-01-02'),
(3, 'Riya', '2024-01-03'),
(4, 'Neha', '2024-01-04'),
(5, 'Rahul', '2024-01-05'),
(6, 'Ghost', NULL),              
(7, 'NoActivity', '2024-01-07'), 
(8, 'OnlyTxn', '2024-01-08'),    
(9, 'OnlyEvent', '2024-01-09');

-- =========================
-- INSERT EVENTS
-- =========================

INSERT INTO events VALUES

-- User 1 (consecutive + duplicates + gaps + session edge)
(1,1,'login','2024-02-01 09:00:00'),
(2,1,'login','2024-02-01 09:00:00'), -- exact duplicate
(3,1,'login','2024-02-02 09:00:00'),
(4,1,'login','2024-02-03 09:00:00'),
(5,1,'login','2024-02-05 09:00:00'), -- gap break
(6,1,'click','2024-02-05 09:00:00'),
(7,1,'logout','2024-02-01 08:59:00'), -- out-of-order

-- Session logic (gap-based)
(8,1,'login','2024-02-06 10:00:00'),
(9,1,'click','2024-02-06 10:01:00'),
(10,1,'click','2024-02-06 11:30:00'),

-- User 2 (missing login/logout cases)
(11,2,'login','2024-02-01 11:00:00'),
(12,2,'logout','2024-02-02 12:00:00'),

-- User 3 (rapid + overlapping sessions)
(13,3,'login','2024-02-01 09:00:00'),
(14,3,'click','2024-02-01 09:00:05'),
(15,3,'click','2024-02-01 09:00:06'),
(16,3,'login','2024-02-01 09:10:00'),
(17,3,NULL,'2024-02-01 09:15:00'),

-- User 9 (only events)
(18,9,'login','2024-02-03 10:00:00');

-- =========================
-- INSERT TRANSACTIONS
-- =========================

INSERT INTO transactions VALUES

-- User 1 (duplicates + same timestamp + out-of-order)
(1,1,100,'electronics','2024-02-01 10:00:00'),
(2,1,100,'electronics','2024-02-01 10:01:00'),
(3,1,100,'electronics','2024-02-01 10:01:00'),
(4,1,200,'fashion','2024-02-01 10:01:00'),
(5,1,300,'grocery','2024-01-30 09:00:00'),

-- User 2 (negative, zero, NULL category)
(6,2,-50,'electronics','2024-02-02 11:00:00'),
(7,2,0,'fashion','2024-02-02 11:05:00'),
(8,2,400,NULL,'2024-02-02 11:10:00'),

-- User 8 (only transactions)
(9,8,250,'electronics','2024-02-03 12:00:00'),

-- User 3 (rapid duplicates + overlap)
(10,3,150,'grocery','2024-02-03 12:00:00'),
(11,3,150,'grocery','2024-02-03 12:00:02'),
(12,3,300,'electronics','2024-02-03 12:00:01'),

-- User 4 (NULL amount)
(13,4,NULL,'fashion','2024-02-04 09:00:00');
