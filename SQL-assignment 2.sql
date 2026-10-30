use employee;
-- distinct(salary) --
select distinct(salary) from employees;

-- Alias (AS) --
select age as employee_age, salary as employee_salary from employees;

-- Where Clause & Operators --
select employee_name, salary, hire_date from employees where salary > 50000 and hire_date <'2016-01-01';

select employee_name, designation from employees where designation is null;
set sql_safe_updates=0;
update employees set designation = 'data scientist' where designation is null;

select employee_name , designation from employees where employee_name='kiara malhotra';

-- order by --
select employee_name, department_id, salary from employees order by department_id asc, salary desc;

-- LIMIT --
select employee_id, employee_name, hire_date from employees where hire_date between '2018-01-01' and '2018-12-31' 
order by hire_date asc limit 5;

-- Aggregate Functions --
select  sum(e.salary) finance_total_salary from employees e
inner join
departments d
on e.department_id=d.department_id
where d.department_name='finance';

select min(age) from employees;

-- GROUP BY --
select l.location location_name ,max(e.salary) maximum_salary from employees e
inner join
location l 
on e.location_id=l.location_id
group by l.location order by maximum_salary desc;

select designation, round(avg(salary),2) average_salary from employees 
where designation like '%analyst%' group by designation;

-- HAVING --
select d.department_name, count(e.employee_id) number_of_employees from departments as d
left join 
employees as e
on d.department_id=e.department_id
group by d.department_name having number_of_employees < 3;

select l.location, e.gender, round(avg(e.age),0) average_age from location as l
inner join
employees as e
on l.location_id = e.location_id 
where e.gender='f'
group by l.location having average_age < 30;

-- INNER JOIN --
select e.employee_name, e.designation, d.department_name from employees as e
inner join
departments as d
on e.department_id= d.department_id;

-- left join --
select d.department_name, count(e.employee_id) number_of_employees from departments as d
left join 
employees as e
 on d.department_id = e.department_id
 group by d.department_name;

-- right join --
select l.location, e.employee_name from employees as e
right join
location as l
on l.location_id = e.employee_id;



