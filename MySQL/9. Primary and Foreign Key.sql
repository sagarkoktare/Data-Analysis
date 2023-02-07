#CREATE DATABSE
CREATE DATABASE KEY_PF;
USE KEY_PF;

#CREATE TABLE
CREATE TABLE DimMainTable(
serial_id int not null,
name varchar(50),
status_ varchar(50),
number_of_childrens int,
primary key(serial_id));

#CREATE TABLE
CREATE TABLE DimChildTable(
Student_id int not null,
serial_id int,
school_name varchar(50),
gender varchar(50),
age int,
primary key (Student_id),
foreign key(serial_id) references DimMainTable(serial_id));

SELECT * FROM DimMainTable;
SELECT * FROM DimChildTable;

INSERT INTO DimMainTable VALUES (1001,"SAGAR","ACTIVE",1);
INSERT INTO DimMainTable VALUES (1002,"SAGARIKA","INACTIVE",0);
INSERT INTO DimMainTable VALUES (1003,"SURESH","INACTIVE",0);
INSERT INTO DimMainTable VALUES (1004,"JAYESH","INACTIVE",0);
INSERT INTO DimMainTable VALUES (1005,"RAVI","ACTIVE",4);

INSERT INTO DimChildTable VALUES (1,1001,"CBSE","MALE",7);
INSERT INTO DimChildTable VALUES (2,1002,"ICSE","FEMALE",7);

#AS 1003 IS NOT AVAILABLE IN DimMainTable, WE COULDN'T INSERT DATA FOR BELOW STATEMENT 
INSERT INTO DimChildTable VALUES (3,1003,"ICSE","FEMALE",15);
INSERT INTO DimChildTable VALUES (23,1004,"SSC","MALE",25);
INSERT INTO DimChildTable VALUES (27,1005,"HSC","FEMALE",30);

#------------------------------------

CREATE TABLE DimPlaceDetails(
Student_id int not null,
place_id int,
location varchar(30),
distance decimal(4,2));

alter table dimPlaceDetails add constraint P1 primary key(student_id,place_id);

CREATE TABLE parent(
id int,
primary key (id));

CREATE TABLE CHILD(
id int,
parent_id int,
primary key (id),
foreign key(parent_id) references parent(id) on delete cascade on update cascade);

insert into parent values(1);
insert into parent values(2);
insert into parent values(3);
insert into parent values(4);

alter table parent add constraint condtr id NOT NULL;

select * from parent;
