WITH valid_txns AS (
    SELECT 
        txn_id,
        user_id,
        amount,
        txn_time
    FROM transactions
    WHERE amount IS NOT NULL
      AND txn_time IS NOT NULL
      AND amount > 0
),

duplicate_pairs AS (
    SELECT 
        a.user_id,
        a.txn_id,
        a.amount,
        a.txn_time,
        b.txn_time AS prev_time,
        TIMESTAMPDIFF(MINUTE, b.txn_time, a.txn_time) AS diff_minutes
    FROM valid_txns a
    JOIN valid_txns b
        ON a.user_id = b.user_id
       AND a.amount  = b.amount
       AND a.txn_time >= b.txn_time
       AND TIMESTAMPDIFF(MINUTE, b.txn_time, a.txn_time) <= 5
       AND a.txn_id = b.txn_id + 1
)

SELECT *
FROM duplicate_pairs
ORDER BY user_id, txn_time;
