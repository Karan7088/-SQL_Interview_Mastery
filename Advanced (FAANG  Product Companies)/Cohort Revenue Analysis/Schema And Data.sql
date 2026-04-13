 CREATE TABLE orders (
    order_id INT,
    user_id INT,
    order_date DATE,
    amount INT,
    status VARCHAR(20)
);
 
INSERT INTO orders VALUES
-- User 1 (repeat + gaps)
(1,1,'2023-01-05',100,'completed'),
(2,1,'2023-01-05',100,'completed'), -- duplicate
(3,1,'2023-02-10',200,'completed'),
(4,1,'2023-04-15',300,'completed'),

-- User 2 (same month heavy)
(5,2,'2023-01-07',150,'completed'),
(6,2,'2023-01-20',200,'completed'),
(7,2,'2023-03-05',250,'completed'),

-- User 3 (cancelled noise)
(8,3,'2023-02-01',500,'cancelled'),
(9,3,'2023-02-02',400,'completed'),
(10,3,'2023-03-01',300,'completed'),

-- User 4 (single purchase)
(11,4,'2023-03-15',600,'completed'),

-- User 5 (late comeback)
(12,5,'2023-01-01',100,'completed'),
(13,5,'2023-06-01',700,'completed'),

-- User 6 (dense activity)
(14,6,'2023-02-10',200,'completed'),
(15,6,'2023-02-11',300,'completed'),
(16,6,'2023-03-12',400,'completed'),
(17,6,'2023-04-13',500,'completed'),

-- User 7 (duplicates + cancel)
(18,7,'2023-03-01',100,'completed'),
(19,7,'2023-03-01',100,'completed'),
(20,7,'2023-04-01',200,'cancelled'),

-- User 8 (gap user)
(21,8,'2023-01-10',150,'completed'),
(22,8,'2023-05-10',350,'completed'),

-- User 9
(23,9,'2023-02-14',220,'completed'),
(24,9,'2023-03-18',180,'completed'),

-- User 10
(25,10,'2023-03-20',500,'completed'),

-- Add more users to reach 50+
(26,11,'2023-01-03',120,'completed'),
(27,11,'2023-02-03',220,'completed'),
(28,12,'2023-02-05',300,'completed'),
(29,12,'2023-02-06',200,'completed'),
(30,13,'2023-03-08',150,'completed'),
(31,13,'2023-04-09',250,'completed'),
(32,14,'2023-04-10',350,'completed'),
(33,15,'2023-05-11',400,'completed'),
(34,15,'2023-06-12',500,'completed'),
(35,16,'2023-01-01',600,'completed'),
(36,16,'2023-01-02',700,'completed'),
(37,17,'2023-02-01',800,'completed'),
(38,18,'2023-03-01',900,'completed'),
(39,18,'2023-04-01',1000,'completed'),
(40,19,'2023-05-01',1100,'completed'),
(41,20,'2023-06-01',1200,'completed'),
(42,21,'2023-01-15',130,'completed'),
(43,21,'2023-02-16',230,'completed'),
(44,22,'2023-02-20',330,'completed'),
(45,22,'2023-03-21',430,'completed'),
(46,23,'2023-03-25',530,'completed'),
(47,24,'2023-04-26',630,'completed'),
(48,25,'2023-05-27',730,'completed'),
(49,25,'2023-06-28',830,'completed'),
(50,26,'2023-06-30',930,'completed');
