create database lab4;
create table Warehouses(
  code integer,
  location varchar(255),
  capacity integer
);
create table Boxes(
  code char(4),
  contents varchar(255),
  value real,
  warehouse integer
);
insert into Warehouses values (1, 'Chicago', 3), (2, 'Chicago', 4), (3, 'New York', 7), (4, 'Los Angeles', 2), (5, 'San Francisco', 8);
insert into Boxes values ('0MN7', 'Rocks', 180, 3), ('4H8P', 'Rocks', 250, 1), ('4RT3', 'Scissors', 190, 4), ('7G3H', 'Rocks', 200, 1), ('8JN6', 'Papers', 75, 1), ('8Y6U', 'Papers', 50, 3), ('9J6F', 'Papers', 175, 2), ('LLO8', 'Rocks', 140, 4), ('POH6', 'Scissors', 125, 1), ('P2T6', 'Scissors', 150, 2), ('TU55', 'Papers', 90, 5);
select * from warehouses;
select * from Boxes where value > 150;
select distinct(contents) from Boxes;
select code,  count(warehouse) as number_of_boxes from Boxes GROUP BY code;
select code,  count(warehouse) as number_of_boxes from Boxes GROUP BY code HAVING count(warehouse) > 2;
insert into warehouses values(6, 'New York', 3)
insert into boxes values('H5RT', 'Papers', 200, 2);
update boxes set value = 0.85 * value where value = (select max(value) from boxes where value < (select max(value) from boxes where value < (select max(value) from boxes)));
delete from boxes where value < 150;
delete from boxes where warehouse in (select code from warehouses where location = 'New York') returning *;