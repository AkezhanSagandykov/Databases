create database lab8;
create table salesman (
 salesman_id integer,
 name varchar(50),
 city varchar (50),
 comission real
);
insert into salesman values (5001, 'James Hoog', 'New York', 0.15), (5002, 'Nail Knite', 'Paris', 0.13), (5005, 'Pit Alex', 'London', 0.11), (5006, 'Mc Lyon', 'Paris', 0.14), (5003, 'Lauson Hen', Null, 0.12), (5007, 'Paul Adam', 'Rome', 0.13);
create role junior_dev LOGIN;
create view view_salesman as 
  select * from salesman where city = 'New York';
select * from view_salesman;
create view view_salesman_customer as
  select e.ord_no, k.name, m.cust_name from orders e join salesman k on e.salesman_id = k.salesman_id join customers m on e.customer_id = m.customer_id;
select * from view_salesman_customer;
grant all privileges on view_salesman_customer to junior_dev;
create view view_customer_highest_grade as
 select customer_id, cust_name from customers where grade = (select max(grade) from customers);
select * from view_customer_highest_grade;
grant select on view_customer_highest_grade to junior_dev;
create view view_number_salesman as
 select count(salesman_id), city from salesman group by city;
select * from view_number_salesman;
create view view_number_customer as
 select e.salesman_id from salesman e join customers k on e.salesman_id = k.salesman_id group by e.salesman_id, k.customer_id having count(customer_id) > 1;
select * from view_number_customer;
create role intern;
grant all privileges on database lab8 to intern;