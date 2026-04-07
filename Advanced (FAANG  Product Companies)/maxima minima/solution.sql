with cte as(select *,case when value>lag(value) over() and value>lead(value) over() then "local maxima" 
when value<lag(value) over() and value<lead(value) over() then "local minima" else "equal" end as type 
from numbers)
select * from cte where type!="equal"
;
