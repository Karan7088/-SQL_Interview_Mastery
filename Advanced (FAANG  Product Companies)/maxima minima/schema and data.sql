CREATE TABLE numbers (
    id INT PRIMARY KEY,
    value INT
);
INSERT INTO numbers (id, value) VALUES
-- increasing start (no minima at beginning)
(1, 10),
(2, 20),

-- simple peak
(3, 15),

-- plateau case (equal values)
(4, 25),
(5, 25),
(6, 20),

-- valley
(7, 5),

-- multiple fluctuations
(8, 30),
(9, 10),
(10, 35),
(11, 5),

-- flat region
(12, 5),
(13, 5),

-- another peak
(14, 40),

-- decreasing tail
(15, 30),
(16, 20),

-- edge peak
(17, 50),

-- drop again
(18, 10);
