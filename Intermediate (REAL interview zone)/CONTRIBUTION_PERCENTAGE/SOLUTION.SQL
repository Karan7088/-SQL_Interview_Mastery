select category,
round(sum(amount)/(select sum(amount) from transactions where amount is not null) *100.0,2) as contribution 
from transactions where amount is not null group by 1;
