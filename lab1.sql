create database lab1; -- creating database lab1

create table users( -- creating table users with fields
    id serial,
    firstname varchar(50),
    lastname varchar(50),
    primary key(id)
);

alter table users
add column isadmin int; -- adding new column

alter table users
alter column isadmin type boolean using users.isadmin::boolean; -- changing type of column from integer to boolean

alter table users
alter column isadmin set default false; -- setting default value false to column

create table tasks( -- creating table tasks with fields
    id serial,
    name varchar(50),
    user_id integer
);

drop table tasks; -- deleting table tasks

drop database lab1; -- deleting database lab1
