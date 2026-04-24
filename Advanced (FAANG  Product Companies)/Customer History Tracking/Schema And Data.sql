CREATE TABLE customer_source (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    updated_at DATE
);

INSERT INTO customer_source VALUES
(1,'Aman','Delhi','2024-01-01'),
(2,'Ravi','Mumbai','2024-01-01'),
(3,'Neha','Pune','2024-01-01'),
(4,'Simran','Delhi','2024-01-01'),
(5,'Karan','Chandigarh','2024-01-01'),
(6,'Ankit','Jaipur','2024-01-01'),
(7,'Pooja','Lucknow','2024-01-01'),
(8,'Vikas','Delhi','2024-01-01'),
(9,'Meena','Mumbai','2024-01-01'),
(10,'Rahul','Pune','2024-01-01'),

-- changes start happening
(1,'Aman','Gurgaon','2024-02-01'),
(2,'Ravi','Mumbai','2024-02-01'),
(3,'Neha','Bangalore','2024-02-01'),
(4,'Simran','Delhi','2024-02-01'),
(5,'Karan','Chandigarh','2024-02-01'),
(6,'Ankit','Jaipur','2024-02-01'),
(7,'Pooja','Noida','2024-02-01'),
(8,'Vikas','Delhi','2024-02-01'),
(9,'Meena','Mumbai','2024-02-01'),
(10,'Rahul','Hyderabad','2024-02-01'),

-- more updates
(1,'Aman','Gurgaon','2024-03-01'),
(2,'Ravi','Pune','2024-03-01'),
(3,'Neha','Bangalore','2024-03-01'),
(4,'Simran','Noida','2024-03-01'),
(5,'Karan','Delhi','2024-03-01'),
(6,'Ankit','Jaipur','2024-03-01'),
(7,'Pooja','Noida','2024-03-01'),
(8,'Vikas','Mumbai','2024-03-01'),
(9,'Meena','Mumbai','2024-03-01'),
(10,'Rahul','Hyderabad','2024-03-01'),

-- April updates
(1,'Aman','Delhi','2024-04-01'),
(2,'Ravi','Pune','2024-04-01'),
(3,'Neha','Chennai','2024-04-01'),
(4,'Simran','Noida','2024-04-01'),
(5,'Karan','Delhi','2024-04-01'),
(6,'Ankit','Udaipur','2024-04-01'),
(7,'Pooja','Noida','2024-04-01'),
(8,'Vikas','Mumbai','2024-04-01'),
(9,'Meena','Delhi','2024-04-01'),
(10,'Rahul','Hyderabad','2024-04-01'),

-- May updates
(1,'Aman','Delhi','2024-05-01'),
(2,'Ravi','Bangalore','2024-05-01'),
(3,'Neha','Chennai','2024-05-01'),
(4,'Simran','Gurgaon','2024-05-01'),
(5,'Karan','Delhi','2024-05-01'),
(6,'Ankit','Udaipur','2024-05-01'),
(7,'Pooja','Delhi','2024-05-01'),
(8,'Vikas','Mumbai','2024-05-01'),
(9,'Meena','Delhi','2024-05-01'),
(10,'Rahul','Pune','2024-05-01');
