drop table orders;
drop table customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    signup_date DATE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20) -- completed, cancelled, refunded
);

-- Customers
INSERT INTO customers VALUES
(1, 'Alice', '2021-01-01'),
(2, 'Bob', '2021-02-15'),
(3, 'Charlie', '2021-03-10'),
(4, 'David', '2021-04-05'),
(5, 'Eve', '2021-05-20'),
(6, 'Frank', '2021-06-25'),
(7, 'Grace', '2021-07-30'),
(8, 'Hank', '2021-08-18');

-- Orders (BRUTAL DATA)
INSERT INTO orders VALUES
(101, 1, '2021-01-05', 100.00, 'completed'),
(102, 1, '2021-01-10', 150.00, 'completed'),
(103, 1, '2021-01-10', 150.00, 'completed'), -- duplicate
(104, 1, '2021-01-15', -50.00, 'refunded'),

(105, 2, '2021-02-20', 200.00, 'completed'),
(106, 2, '2021-02-25', 300.00, 'cancelled'),
(107, 2, '2021-03-01', 250.00, 'completed'),

(108, 3, '2021-03-15', 400.00, 'completed'),
(109, 3, '2021-03-20', -100.00, 'refunded'),
(110, 3, '2021-03-25', 200.00, 'completed'),

(111, 4, '2021-04-10', 500.00, 'completed'),
(112, 4, '2021-04-15', 700.00, 'completed'),

(113, 5, '2021-05-25', 1000.00, 'cancelled'),

-- Customer 6 → no orders

(114, 7, '2021-08-01', 50.00, 'completed'),
(115, 7, '2021-08-02', 60.00, 'completed'),
(116, 7, '2021-08-03', 70.00, 'completed'),
(117, 7, '2021-08-04', -30.00, 'refunded'),

(118, 8, '2021-08-20', 5000.00, 'completed'),
(119, 8, '2021-08-21', -1000.00, 'refunded'),
(120, 8, '2021-08-22', 2000.00, 'completed'),
(121, 8, '2021-08-23', 3000.00, 'cancelled');
