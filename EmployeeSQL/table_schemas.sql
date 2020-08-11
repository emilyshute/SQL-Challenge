create table employees (
emp_no int,
emp_title_id varchar,
birth_date Date, 
first_name varchar,
last_name varchar,
sex varchar,
hire_date Date
);

create table departments (
dept_no varchar,
dept_name varchar
);

create table dept_emp (
emp_no int,
dept_no varchar
);

create table dept_manager (
dept_no varchar,
emp_no int
);

create table salaries (
emp_no int,
salary int
);

create table titles (
title_id varchar,
title varchar
);

select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;