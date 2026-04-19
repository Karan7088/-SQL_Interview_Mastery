CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    status VARCHAR(20)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount INT,
    status VARCHAR(20)
);
INSERT INTO users VALUES
(1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E'),
(6,'F'),(7,'G'),(8,'H'),(9,'I'),(10,'J'),
(11,'K'),(12,'L'),(13,'M'),(14,'N'),(15,'O');
INSERT INTO orders VALUES
(101,1,'2024-01-01','completed'),
(102,1,'2024-01-05','completed'),

(103,2,'2024-02-01','completed'),

(104,3,'2024-02-10','completed'),
(105,3,'2024-02-15','completed'),

(106,4,'2024-03-01','completed'),

(107,5,'2024-03-10','completed'),

(108,6,'2024-04-01','completed'),

(109,7,'2024-04-10','completed'),

(110,8,'2024-05-01','completed'),

(111,9,'2024-05-10','completed'),

(112,10,'2024-06-01','completed'),

(113,11,'2024-06-10','completed'),

(114,12,'2024-07-01','completed'),

(115,13,'2024-07-10','completed'),

(116,14,'2024-08-01','completed'),

(117,15,'2024-08-10','completed');
INSERT INTO payments VALUES
(1,101,500,'success'),
(2,102,600,'failed'),

(3,103,400,'failed'),

(4,104,700,'success'),
(5,105,800,'success'),

(6,106,500,'pending'),

(7,107,300,'failed'),

(8,108,900,'success'),

(9,109,200,'failed'),

(10,110,1000,'success'),

(11,111,400,'failed'),

(12,112,1200,'success'),

(13,113,300,'pending'),

(14,114,600,'failed'),

(15,115,700,'success'),

(16,116,800,'failed'),

(17,117,500,'failed');

