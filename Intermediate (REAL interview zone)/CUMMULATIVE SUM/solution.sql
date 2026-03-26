select  user_id,txn_id,amount,txn_time,amount,
sum(amount) over(partition by user_id order by txn_time rows between unbounded preceding and current row) as running_total 
from transactions;
