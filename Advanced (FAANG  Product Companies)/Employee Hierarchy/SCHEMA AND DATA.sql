drop table emp;
CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    department VARCHAR(50),
    salary INT
);
INSERT INTO emp VALUES
(1, 'Amit', NULL, 'Executive', 300000),
(2, 'Neha', 1, 'Executive', 250000),
(3, 'Raj', 1, 'Finance', 220000),
(4, 'Simran', 2, 'HR', 180000),
(5, 'Karan', 2, 'HR', 170000),
(6, 'Vikas', 3, 'Finance', 160000),
(7, 'Pooja', 3, 'Finance', 150000),
(8, 'Rohit', 4, 'HR', 140000),
(9, 'Sneha', 4, 'HR', 130000),
(10, 'Arjun', 5, 'HR', 120000),
(11, 'Meena', 5, 'HR', 110000),
(12, 'Ankit', 6, 'Finance', 105000),
(13, 'Priya', 6, 'Finance', 102000),
(14, 'Varun', 7, 'Finance', 101000),
(15, 'Nisha', 7, 'Finance', 99000),

(16, 'Dev', 8, 'HR', 95000),
(17, 'Riya', 8, 'HR', 93000),
(18, 'Manish', 9, 'HR', 92000),
(19, 'Kriti', 9, 'HR', 91000),
(20, 'Sahil', 10, 'HR', 90000),
(21, 'Tina', 10, 'HR', 88000),
(22, 'Ajay', 11, 'HR', 87000),
(23, 'Payal', 11, 'HR', 86000),

(24, 'Deepak', 12, 'Finance', 85000),
(25, 'Ramesh', 12, 'Finance', 84000),
(26, 'Alok', 13, 'Finance', 83000),
(27, 'Sunita', 13, 'Finance', 82000),
(28, 'Gaurav', 14, 'Finance', 81000),
(29, 'Divya', 14, 'Finance', 80000),
(30, 'Nitin', 15, 'Finance', 79000),
(31, 'Rekha', 15, 'Finance', 78000),

(32, 'Yash', 16, 'HR', 77000),
(33, 'Komal', 16, 'HR', 76000),
(34, 'Mohit', 17, 'HR', 75000),
(35, 'Shreya', 17, 'HR', 74000),

(36, 'Zoya', 18, 'HR', 73000),
(37, 'Aakash', 18, 'HR', 72000),
(38, 'Farhan', 19, 'HR', 71000),
(39, 'Iqra', 19, 'HR', 70000),

(40, 'Rahul', 20, 'HR', 69000),
(41, 'Preeti', 20, 'HR', 68000),
(42, 'Anu', 21, 'HR', 67000),
(43, 'Tarun', 21, 'HR', 66000),

(44, 'Vineet', 22, 'HR', 65000),
(45, 'Kavya', 22, 'HR', 64000),
(46, 'Suresh', 23, 'HR', 63000),
(47, 'Bhavna', 23, 'HR', 62000),

-- Edge case: invalid manager
(48, 'Ghost1', 999, 'IT', 60000),

-- Another top-level employee
(49, 'CEO2', NULL, 'Executive', 310000),

-- Deep hierarchy extension
(50, 'Intern1', 47, 'HR', 30000),
(51, 'Intern2', 50, 'HR', 28000);
