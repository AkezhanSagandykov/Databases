create database lab2;
create table countries(
  country_id serial primary key,
  country_name varchar,
  region_id integer,
  population integer
);
insert into countries values(1, 'UK', 44, 69138192);
insert into countries (country_id, country_name) values(2, 'USA');
insert into countries (country_id, country_name, region_id, population) values(3, 'Netherlands', NULL, 18228742);
insert into countries (country_id, country_name, region_id, population) values(4, 'Japan', 81, 123753041), (5, 'South Korea', 82, 51717590), (6, 'France', 33, 66548530);
alter table countries
  alter column country_name SET DEFAULT 'Kazakhstan';
insert into countries (country_id, country_name, region_id, population) values(7, DEFAULT, 7, 19620000);
insert into countries DEFAULT VALUES ON CONFLICT (country_id) DO NOTHING;
create table countries_new (LIKE countries INCLUDING ALL);
insert into countries_new SELECT * FROM countries;
select country_name, population * 1.1 as new_population from countries;
delete from countries where population < 100000;
delete from countries_new where country_id in ( select country_id from countries) returning *;
delete from countries returning *;