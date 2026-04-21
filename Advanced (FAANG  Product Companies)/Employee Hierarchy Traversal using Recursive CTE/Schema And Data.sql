CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name varCHAR(1000),
    manager_id INT
);
drop table employees;

INSERT INTO employees (emp_id, emp_name, manager_id) VALUES
(1, 'Amit', NULL),

-- Level 1
(2, 'Neha', 1),
(3, 'Raj', 1),
(4, 'Ankit', 1),

-- Level 2
(5, 'Simran', 2),
(6, 'Karan', 2),
(7, 'Pooja', 3),
(8, 'Vikas', 3),
(9, 'Rohit', 4),
(10, 'Meena', 4),

-- Level 3
(11, 'Sneha', 5),
(12, 'Arjun', 5),
(13, 'Nisha', 6),
(14, 'Aman', 6),
(15, 'Riya', 7),
(16, 'Kabir', 7),
(17, 'Tina', 8),
(18, 'Dev', 8),
(19, 'Isha', 9),
(20, 'Manav', 9),
(21, 'Zoya', 10),
(22, 'Yash', 10),

-- Level 4
(23, 'A1', 11),
(24, 'A2', 11),
(25, 'B1', 12),
(26, 'B2', 12),
(27, 'C1', 13),
(28, 'C2', 13),
(29, 'D1', 14),
(30, 'D2', 14),
(31, 'E1', 15),
(32, 'E2', 15),
(33, 'F1', 16),
(34, 'F2', 16),
(35, 'G1', 17),
(36, 'G2', 17),
(37, 'H1', 18),
(38, 'H2', 18),
(39, 'I1', 19),
(40, 'I2', 19),

-- Level 5 (deep recursion test)
(41, 'J1', 23),
(42, 'J2', 23),
(43, 'K1', 24),
(44, 'K2', 24),
(45, 'L1', 25),
(46, 'L2', 25),
(47, 'M1', 26),
(48, 'M2', 26),
(49, 'N1', 27),
(50, 'N2', 27),
(51, 'O1', 28),
(52, 'O2', 28),
(53, 'P1', 29),
(54, 'P2', 29),
(55, 'Q1', 30),
(56, 'Q2', 30),

-- Level 6 (extra deep)
(57, 'R1', 41),
(58, 'R2', 42),
(59, 'S1', 43),
(60, 'S2', 44);
