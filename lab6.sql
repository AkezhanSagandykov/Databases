create database lab6;
create table locations(
 location_id SERIAL PRIMARY KEY,
 street_address VARCHAR(25),
 postal_code VARCHAR(12),
 city VARCHAR(30),
 state_province VARCHAR(12)
);
create table departments(
 department_id SERIAL PRIMARY KEY,
 department_name VARCHAR(50) UNIQUE,
 budget INTEGER,
 location_id INTEGER REFERENCES locations
);
create table employees(
 employee_id SERIAL PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 email VARCHAR(50),
 phone_number VARCHAR(20),
 salary INTEGER,
 department_id INTEGER REFERENCES departments
);
select e.first_name, e.last_name, e.department_id, d.department_name from employees e join departments d on e.department_id = d.department_id;
select e.first_name, e.last_name, e.department_id, d.department_name from employees e join departments d on e.department_id = d.department_id where d.department_id = 40 or d.department_id = 80;
select e.first_name, e.last_name, e.department_id, a.department_name, d.city, d.state_province from employees e join departments a on e.department_id = a.department_id join locations d on d.location_id = a.location_id;
select e.department_id, d.department_name from employees e join departments d on e.department_id = d.department_id;
select e.first_name, e.last_name, e.department_id, d.department_name from employees e join departments d on e.department_id = d.department_id where e.department_id is null and d.department_name is null or e.department_id is not null and d.department_name is not null;