CREATE TABLE sales_data (
    id INT PRIMARY KEY,
    sale_date DATE,
    revenue INT
);
INSERT INTO sales_data (id, sale_date, revenue) VALUES
(1, '2024-01-01', 100),
(2, '2024-01-02', 120),
(3, '2024-01-03', 140),
(4, '2024-01-04', 160), -- increasing

(5, '2024-01-05', 150),
(6, '2024-01-06', 130),
(7, '2024-01-07', 110), -- decreasing 🔻 (trend change here)

(8, '2024-01-08', 115),
(9, '2024-01-09', 130),
(10, '2024-01-10', 150), -- increasing 🔺

(11, '2024-01-11', 140),
(12, '2024-01-12', 120), -- decreasing 🔻

(13, '2024-01-13', 125),
(14, '2024-01-14', 140),
(15, '2024-01-15', 160), -- increasing 🔺

(16, '2024-01-16', 155),
(17, '2024-01-17', 140); -- decreasing 🔻
