

select metric_date,case when avg(revenue) over(rows between 3 preceding and 1 preceding) *1.5< revenue then 'anomaly (spike)'
when avg(revenue) over(rows between 3 preceding and 1 preceding) *1.5> revenue then 'anomaly (drop)' 
else 'NROMAL 37\ZS '
end as anomaly
from daily_metrics 
