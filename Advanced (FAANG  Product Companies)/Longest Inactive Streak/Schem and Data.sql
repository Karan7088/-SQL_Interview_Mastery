CREATE TABLE logins (
    user_id INT,
    login_date DATE
);
INSERT INTO logins (user_id, login_date) VALUES

-- USER 1 (normal gaps)
(1, '2024-01-01'),
(1, '2024-01-05'),
(1, '2024-01-10'),

-- USER 2 (large gap + small gap)
(2, '2024-01-01'),
(2, '2024-01-02'),
(2, '2024-01-10'),

-- USER 3 (single login)
(3, '2024-01-15'),

-- USER 4 (continuous logins, no inactivity)
(4, '2024-01-01'),
(4, '2024-01-02'),
(4, '2024-01-03'),
(4, '2024-01-04'),

-- USER 5 (duplicate dates)
(5, '2024-01-01'),
(5, '2024-01-01'),
(5, '2024-01-10'),

-- USER 6 (unsorted input)
(6, '2024-01-10'),
(6, '2024-01-01'),
(6, '2024-01-20'),

-- USER 7 (multiple large gaps)
(7, '2024-01-01'),
(7, '2024-02-01'),
(7, '2024-03-15'),

-- USER 8 (edge case: same day repeated many times)
(8, '2024-01-01'),
(8, '2024-01-01'),
(8, '2024-01-01'),

-- USER 9 (two equal gaps)
(9, '2024-01-01'),
(9, '2024-01-06'),
(9, '2024-01-11'),

-- USER 10 (long inactivity at end)
(10, '2024-01-01'),
(10, '2024-01-02'),
(10, '2024-01-03');
