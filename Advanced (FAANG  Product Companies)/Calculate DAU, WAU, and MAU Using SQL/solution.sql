 SELECT DISTINCT
    DATE(txn_time) AS datee,

    (
        SELECT COUNT(DISTINCT user_id)
        FROM txn
        WHERE DATE(a.txn_time) = DATE(txn_time)
    ) AS DAU,

    (
        SELECT COUNT(DISTINCT user_id)
        FROM txn
        WHERE DATE(txn_time)
              BETWEEN DATE(a.txn_time) - INTERVAL 6 DAY
                  AND DATE(a.txn_time)
    ) AS WAU,

    (
        SELECT COUNT(DISTINCT user_id)
        FROM txn
        WHERE DATE(txn_time)
              BETWEEN DATE(a.txn_time) - INTERVAL 30 DAY
                  AND DATE(a.txn_time)
    ) AS MAU

FROM txn A
ORDER BY 1;
