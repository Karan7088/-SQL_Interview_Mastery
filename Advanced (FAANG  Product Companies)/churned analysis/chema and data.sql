CREATE TABLE subs(
    user_id INT,
    status VARCHAR(20),
    status_time DATETIME;

INSERT INTO subs VALUES
(1,'active','2026-03-01'),
(1,'cancelled','2026-03-05'),

(2,'active','2026-03-05'),

(3,'active','2026-03-10'),
(3,'inactive','2026-03-20'),

(4,'active','2026-03-15'),
(4,'paused','2026-03-16'),
(4,'resumed','2026-03-17'),

(7,'active','2026-03-20');

INSERT INTO subs VALUES

-- User 5 (direct cancel, no pause)
(5,'active','2026-03-18'),
(5,'cancelled','2026-03-19'),

-- User 6 (NULL signup but active + inactive)
(6,'active','2026-03-21'),
(6,'inactive','2026-03-25'),

-- User 8 (pause without active first - bad sequence)
(8,'paused','2026-03-22'),
(8,'active','2026-03-23'),

-- User 9 (duplicate states same time)
(9,'active','2026-03-25'),
(9,'active','2026-03-25'),

-- User 10 (multiple cancels + reactivation loop)
(10,'active','2026-03-27'),
(10,'cancelled','2026-03-28'),
(10,'active','2026-03-29'),
(10,'cancelled','2026-03-30'),

-- User 11 (already exists → more noise)
(11,'paused','2026-03-29'),
(11,'resumed','2026-03-29'), -- same timestamp conflict

-- User 12 (out-of-order timestamps)
(12,'cancelled','2026-03-10'),
(12,'active','2026-03-02'),

-- User 13 (new user full messy journey)
(13,'active','2026-03-01'),
(13,'paused','2026-03-02'),
(13,'resumed','2026-03-03'),
(13,'paused','2026-03-04'), -- loop
(13,'cancelled','2026-03-05'),

-- User 14 (instant churn)
(14,'active','2026-03-10'),
(14,'cancelled','2026-03-10'),

-- User 15 (inactive → active again)
(15,'inactive','2026-03-12'),
(15,'active','2026-03-20');

select * from subs;

CREATE TABLE rev (
    rev_id INT,
    user_id INT,
    revenue INT,
    revenue_type VARCHAR(20),  -- recurring / upgrade / refund
    rev_time DATETIME
);

INSERT INTO rev VALUES

-- User 1 (churned, steady revenue)
(1,1,100,'recurring','2026-03-01'),
(2,1,100,'recurring','2026-03-02'),
(3,1,100,'recurring','2026-03-03'),

-- User 2 (active user)
(4,2,200,'recurring','2026-03-26'),

-- User 3 (inactive)
(5,3,150,'recurring','2026-03-15'),
(6,3,-50,'refund','2026-03-18'),

-- User 4 (paused/resumed lifecycle)
(7,4,300,'recurring','2026-03-16'),
(8,4,200,'upgrade','2026-03-17'),

-- User 5 (quick churn)
(9,5,100,'recurring','2026-03-18'),

-- User 6 (inactive, low revenue)
(10,6,50,'recurring','2026-03-22'),

-- User 8 (only revenue, no proper lifecycle)
(11,8,400,'recurring','2026-03-27'),

-- User 9 (event only → no revenue)

-- User 10 (power user, high revenue)
(12,10,500,'recurring','2026-03-28'),
(13,10,700,'upgrade','2026-03-29'),

-- User 11 (reactivation case 🔥)
(14,11,100,'recurring','2026-03-02'),
(15,11,900,'upgrade','2026-03-29'),

-- User 12 (fraud / abnormal)
(16,12,10000,'recurring','2026-03-02'),
(17,12,-500,'refund','2026-03-02'),

-- User 13 (loop lifecycle)
(18,13,200,'recurring','2026-03-03'),

-- User 14 (instant churn)
(19,14,150,'recurring','2026-03-10'),

-- User 15 (reactivated)
(20,15,250,'recurring','2026-03-20');
