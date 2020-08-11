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

--1)
--List the following details of each employee: 
--employee number, last name, first name, sex, and salary
select employees.emp_no,
  employees.last_name,
  employees.first_name,
  employees.sex,
  salaries.salary
from salaries
inner join employees on
salaries.emp_no = employees.emp_no;

--2)
--List first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name, hire_date
from employees
where hire_date like '%1986'

--3)
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
select dept_manager.dept_no, 
	departments.dept_name, 
	dept_manager.emp_no, 
	employees.last_name,
	employees.first_name
from employees
inner join dept_manager on
dept_manager.emp_no = employees.emp_no
inner join departments on
departments.dept_no = dept_manager.dept_no;

--4)
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
inner join dept_emp on
dept_emp.emp_no = employees.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no;

--5)
--List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'

--6)
--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
inner join dept_emp on
dept_emp.emp_no = employees.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no
where dept_name = 'Sales'

--7)
--List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
select employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
from employees
inner join dept_emp on
dept_emp.emp_no = employees.emp_no
inner join departments on
departments.dept_no = dept_emp.dept_no
where dept_name in ('Sales','Development')

--8)
--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
select last_name, count (*)
from employees
group by last_name
order by count desc;