create table departments(
dept_no varchar primary key,
	dept_name varchar
);


create table titles(
title_id varchar primary key,
	title varchar not null
);


create table employees(
emp_no int primary key,
	emp_title_id varchar not null,
	birth_date varchar not null,
	first_name varchar not null,
	last_name varchar not null,
	sex varchar not null,
	hire_date varchar not null,
	foreign key (emp_title_id) references titles(title_id)
);


create table dept_emp(
emp_no int not null,
	dept_no varchar not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no)references employees(emp_no),
	foreign key(dept_no)references departments(dept_no)
);


create table salaries(
emp_no int primary key,
	salary int not null,
	foreign key (emp_no) references employees(emp_no)
);


create table dept_manager(
dept_no varchar not null,
	emp_no int not null,
	primary key (dept_no, emp_no),
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

-- List the employee number, last name, first name, sex, and salary of each employee.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries on employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hire in 1986
select first_name, last_name, hire_date
from employees
where hire_date like '%1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
join departments on dept_manager.dept_no = departments.dept_no
join employees on dept_manager.emp_no = employees.emp_no;

--List the department number for each employee along with that employee's employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no;

--List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
select * from departments;

--The department number of Sales department is d007
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_no = 'd007';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select * from departments;
--The department numbers of Sales and Development departments are d007 and d005
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_no = 'd005' or departments.dept_no = 'd007';

--List the frequency counts, in descending order, of all the employee last name (that is, how many employees share each last name).
select last_name, count(last_name) as "Frequency count"
from employees
group by last_name
order by "Frequency count" DESC;

