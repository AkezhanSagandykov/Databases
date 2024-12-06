create database lab10;
create table Books (
 book_id integer primary key,
 title varchar(50),
 author varchar(50),
 price decimal,
 quantity integer
);
create table Orders (
 order_id integer primary key,
 book_id integer,
 customer_id integer,
 order_date date,
 quantity integer,
 foreign key(book_id) references Books(book_id)
);
create table Customers (
 customer_id integer primary key,
 name varchar(50),
 email varchar(50)
);
select * from orders;
insert into Books values(1, 'Database 101', 'A Smith', 40.00, 10), (2, 'Learn SQL', 'B Johnson', 35.00, 15), (3, 'Advanced DB', 'C Lee', 50.00, 5);
insert into Customers values(101, 'John Doe', 'johndoe@example.com'), (102, 'Jane Doe', 'janedoe@example.com');
Begin;
 insert into Orders values(1, 1, 101, NULL, 2);
 update Books set quantity = quantity - 2 where book_id = 1;
commit;
Begin;
 insert into Orders values(2, 3, 102, NULL, 10);
 rollback;
commit;
Begin transaction isolation level read committed;
 update Books set price = 50.00 where book_id = 2;
commit;
Begin transaction isolation level read committed;
 select price from Books where book_id = 2;
commit;
Begin;
 update Customers set email = 'johndoe@email.com' where customer_id = 101;
commit;