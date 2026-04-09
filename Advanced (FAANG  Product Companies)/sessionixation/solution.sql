with cte as(select user_id,event_time as session_start,ifnull(case when row_number()  over(partition by user_id order by event_time)%2!=0 then lead(event_time)
over(partition by user_id order by event_time) else 0 end,event_time)
as session_end from user_logs )
select user_id,row_number() over(partition by user_id ) session_id ,
session_start,session_end
from cte where session_end!=0;
