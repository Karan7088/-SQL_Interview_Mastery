with cte as(select a.emp_id,a.emp_name,b.emp_name as manager,c.emp_name senior_manager from emp a left join emp b on a.manager_id=b.emp_id left join emp c 
on b.manager_id=c.emp_id
)
select * from cte 
