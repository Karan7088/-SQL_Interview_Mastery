 DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    status VARCHAR(20)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    status VARCHAR(20)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    price INT
);

INSERT INTO users VALUES
(1,'A','India','active'),
(2,'B','India','inactive'),
(3,'C','US','active'),
(4,'D','US','active'),
(5,'E','UK','inactive'),
(6,'F','UK','active'),
(7,'G','India','active'),
(8,'H','India','active'),
(9,'I','US','inactive'),
(10,'J','UK','active');


INSERT INTO products VALUES
(1,'iPhone','Electronics'),
(2,'TV','Electronics'),
(3,'Laptop','Electronics'),
(4,'Shoes','Fashion'),
(5,'Shirt','Fashion'),
(6,'Tablet','Electronics'),
(7,'Watch','Accessories'),
(8,'Camera','Electronics');

INSERT INTO orders VALUES
(101,1,'2024-01-10','completed'),
(102,1,'2023-12-10','completed'),
(103,2,'2024-02-11','completed'),
(104,3,'2024-03-12','cancelled'),
(105,3,'2024-03-15','completed'),
(106,4,'2024-04-01','completed'),
(107,5,'2024-04-02','completed'),
(108,6,'2024-05-01','completed'),
(109,7,'2024-05-05','completed'),
(110,8,'2024-06-01','completed'),
(111,9,'2024-06-10','completed'),
(112,10,'2024-07-01','completed'),
(113,1,'2024-07-05','completed'),
(114,3,'2024-07-06','completed'),
(115,4,'2024-08-01','completed');
INSERT INTO order_items VALUES
(1,101,1,500),
(2,101,1,500), -- duplicate
(3,101,2,800),
(4,102,1,500), -- old year
(5,103,3,900), -- inactive user
(6,104,1,500), -- cancelled order
(7,105,3,1000),
(8,105,4,200), -- non-electronics
(9,106,2,1200),
(10,106,2,1200), -- duplicate
(11,107,1,500), -- inactive user
(12,108,6,700),
(13,108,6,700), -- duplicate
(14,109,8,1500),
(15,110,3,1100),
(16,111,1,500), -- inactive user
(17,112,2,1300),
(18,113,3,900),
(19,113,3,900), -- duplicate
(20,114,1,600),
(21,115,2,1400);
