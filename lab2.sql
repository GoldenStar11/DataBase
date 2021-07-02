create database lab2; -- creating database lab2

create table countries( -- creating table countries with fields
    country_id serial primary key,
    country_name varchar(255),
    region_id int,
    population int
);
-- inserting data to table countries
insert into countries values(default, 'USA', 11, 50000000);
insert into countries(country_id, country_name) values (default,'USA'); -- setting default country_id for USA
insert into countries (region_id) values(NULL); -- inserting null value to region_id
insert into countries values(default, 'Canada', null, 20000000); -- inserting row with value null
insert into countries values(default, 'Brazilia', 20, 1500000), -- inserting 3 rows
                            (default, 'Argentina', 23, 100000),
                            (default, 'Chilie', 42, 10000);
alter table countries
alter column country_name set default 'Kazakhstan'; -- setting default value to country_name
insert into countries(country_name) values(default); -- inserting row with default value to country_name
insert into countries values (default, default, default, default); -- inserting row with default in each column

create table countries_new( -- creating duplicate of table countries by using like
    like countries
);

insert into countries_new select*from countries returning*; -- inserting all rows from table countries
update countries set region_id=1 where region_id is NULL; -- changing id of countries which are null
update countries
set population = population * 1.1 returning country_name, population as "New Population"; -- increasing population of all countries for 10% and returning country_name and updated population

delete from countries where population < 100000; -- deleting countries with population less than 100000
delete from countries_new as c using countries as n where c.country_id = n.country_id returning*; -- deleting all rows from countries_new if it exist in countries
delete from countries returning*; --deleting all rows from countries
select*from countries; -- returning deleted data
