CREATE TABLE friendships (
    user1 VARCHAR(10),
    user2 VARCHAR(10)
);

INSERT INTO friendships (user1, user2) VALUES
-- Component 1
('A','B'),
('B','C'),
('C','D'),
('D','E'),
('E','F'),
('F','A'),

-- Component 2
('G','H'),
('H','I'),
('I','J'),
('J','G'),

-- Component 3
('K','L'),
('L','M'),
('M','N'),
('N','O'),
('O','K'),

-- Component 4
('P','Q'),
('Q','R'),

-- Extra cross edges inside components
('A','C'),
('B','D'),
('G','I'),
('K','M'),
('L','O'),
('P','R');
