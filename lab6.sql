CREATE DATABASE lab6

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    manager_id integer references employees,
    department_id integer references departments
);

CREATE TABLE job_grades (
    grade char(1),
    lowest_salary integer,
    highest_salary integer
);

select e.first_name, d.department_id, l.city, l.state_province from employees e inner join departments  d using (department_id) inner join locations l using(location_id) where e.last_name like '%b%';

select d.department_name,l.city,l.state_province From  departments  d inner join  locations l  using (location_id);

select e.first_name ,e2.first_name from employees e full outer join employees e2 on e.employee_id = e2.manager_id;


select j.grade , avg(e.salary) from employees e inner join job_grades j on(salary between lowest_salary and highest_salary) group by grade;

select e.first_name,e.last_name from employees e join departments d using (department_id) join locations l using (location_id) where city like 'London';