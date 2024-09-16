create database lab1;

create table users(
   id integer,
   firstname varchar(50),
   lastname varchar(50)
)

alter table users
 add column isadmin integer;




alter table users
 alter column isadmin TYPE boolean USING isadmin::boolean;

alter table users
 alter column isadmin SET DEFAULT False;

alter table users
 add primary key (id);

create table tasks(
 id serial,
 name varchar(50),
 user_id integer
)

drop table tasks;

drop database lab1;