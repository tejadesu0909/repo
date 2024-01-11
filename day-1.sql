use hr;
select * from employees;
-- select avg(salary) from employees;


delimiter $
create procedure sales_Emp()
begin 
select * from employees
limit 5;
end $

delimiter ;

DROP PROCEDURE sales_Emp;

call sales_Emp();




create view sales_View as (select * from employees limit 10);

select * from sales_View;

-- creating temporary tables:

create temporary table emp_temp
as 
(select * from employees);

select * from emp_temp;


create temporary table teja_marks(
name varchar(120),
subject varchar(120),
sub_Marks int 
);

select * from teja_marks;



insert into teja_marks (name, subject, sub_Marks)
values ("Teja", "PDS", 85), ("Desu", "apds", 95);

select * from employees;

select first_name, last_name, salary, row_number() over (order by salary ) as row_Num
from employees;

select first_name, last_name,salary, rank() over (order by salary) as ranking 
from employees;

select first_name, last_name,salary, dense_rank() over (order by salary) as ranking_no_skipping 
from employees;	

select * from employees;

select first_name, last_name, salary, 
		avg(salary) over (order by salary desc 
						rows between current row and 4 following) as last_5_avg
from employees;


select first_name, last_name, salary,
		avg(salary) over (order by salary desc
							rows between 4 preceding and current row) as last_5_avg
from employees;


with recursive numbers_sequence as 
(select 1 as numbr
union 
select numbr + 1 
from numbers_sequence
where numbr < 101)
select * from numbers_sequence; 