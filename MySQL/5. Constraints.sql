USE DressDetails;
SELECT * FROM DRESS;

# AUTO INCREMENT needs PRIMARY KEY
# PRIMARY KEY CAN'T BE NULL
# IT SHOULD BE UNIQUE

CREATE TABLE IF NOT EXISTS TABLE1(
SERIAL INT auto_increment primary key,
NAME VARCHAR(30),
EMAIL VARCHAR(30),
CITY VARCHAR(30));

SELECT * FROM TABLE1;

insert into table1 values
(1001,'sagar','sagar.koktare7892@gmail.com','Kalyan'),
(1002,'Aakash','a.b7@gmail.com','Combatore'),
(1003,'Arnay','a.b2@gmail.com','Kashi');

CREATE TABLE IF NOT EXISTS TABLE2(
SERIAL INT not null auto_increment,
NAME VARCHAR(30),
EMAIL VARCHAR(30),
CITY VARCHAR(30),
primary key(serial));

SELECT * FROM TABLE2;

insert into table2(Name,EMAIL,CITY) values
('sagar','sagar.koktare7892@gmail.com','Kalyan'),
('Aakash','a.b7@gmail.com','Combatore'),
('Arnay','a.b2@gmail.com','Kashi');

insert into table2 values
(1001,'sagar','sagar.koktare7892@gmail.com','Kalyan'),
(1002,'Aakash','a.b7@gmail.com','Combatore'),
(1003,'Arnay','a.b2@gmail.com','Kashi');

#-----------------------------------------------------------------------------------------
# CHECK CONSTRAINT 
#-----------------------------------------------------------------------------------------
# Check constraint will allow you to insert data when condition gets satisfied

CREATE TABLE IF NOT EXISTS TABLE3(
SERIAL INT,
FIRST_NAME VARCHAR(30),
EMAIL VARCHAR(30),
CITY VARCHAR(30),
SALARY INT CHECK (SALARY > 50000));

SELECT * FROM TABLE3;

#BELOW TABLE HAS SALARY LESS THAN 50K
insert into TABLE3 values
(1001,'sagar','sagar.koktare7892@gmail.com','Kalyan',30000),
(1002,'Aakash','a.b7@gmail.com','Combatore',3000),
(1003,'Arnay','a.b2@gmail.com','Kashi',240000);

insert into TABLE3 values
(1001,'sagar','sagar.koktare7892@gmail.com','Kalyan',50001),
(1002,'Aakash','a.b7@gmail.com','Combatore',300000),
(1003,'Arnay','a.b2@gmail.com','Kashi',240000);

CREATE TABLE IF NOT EXISTS TABLE4(
SERIAL INT,
FIRST_NAME VARCHAR(30),
EMAIL VARCHAR(30),
CITY VARCHAR(30) CHECK (CITY = 'Kalyan'),
SALARY INT CHECK (SALARY > 50000));

ALTER TABLE TABLE4 ADD CHECK (SERIAL > 0);

SELECT * FROM TABLE4;

insert into TABLE4 values
(1004,'sagar','sagar.koktare7892@gmail.com','Kalyan',50001),
(1002,'Aakash','a.b7@gmail.com','Kalyan',300000),
(1003,'Arnay','a.b2@gmail.com','Kalyan',240000);

#-----------------------------------------------------------------------------------------
# NOT NULL
#-----------------------------------------------------------------------------------------
# VALUE SHOULDN'T BE NULL

CREATE TABLE IF NOT EXISTS TABLE5(
SERIAL INT NOT NULL auto_increment,
FIRST_NAME VARCHAR(30),
EMAIL VARCHAR(30),
CITY VARCHAR(30) CHECK (CITY = 'Kalyan'),
SALARY INT CHECK (SALARY > 50000));

# Without serial data
insert into TABLE5 (FIRST_NAME, EMAIL, CITY, SALARY)  values
('sagar','sagar.koktare7892@gmail.com','Kalyan',50001),
('Aakash','a.b7@gmail.com','Kalyan',300000),
('Arnay','a.b2@gmail.com','Kalyan',240000);

insert into TABLE5 (FIRST_NAME, EMAIL, CITY, SALARY)  values
('sagar','sagar.koktare7892@gmail.com','Kalyan',50001),
('Aakash','a.b7@gmail.com','Kalyan',300000),
('Arnay','a.b2@gmail.com','Kalyan',240000);

#Using Auto_increment
CREATE TABLE IF NOT EXISTS TABLE6(
SERIAL INT NOT NULL auto_increment primary key,
FIRST_NAME VARCHAR(30),
EMAIL VARCHAR(30),
CITY VARCHAR(30) CHECK (CITY = 'Kalyan'),
SALARY INT CHECK (SALARY > 50000));

#-----------------------------------------------------------
# Default
#-----------------------------------------------------------
#Using DEFAULT
CREATE TABLE IF NOT EXISTS TABLE7(
SERIAL INT NOT NULL DEFAULT 0,
FIRST_NAME VARCHAR(30),
EMAIL VARCHAR(30),
CITY VARCHAR(30) CHECK (CITY = 'Kalyan'),
SALARY INT CHECK (SALARY > 50000));

SELECT * FROM TABLE7;

insert into TABLE7 (FIRST_NAME, EMAIL, CITY, SALARY)  values
('sagar','sagar.koktare7892@gmail.com','Kalyan',50001),
('Aakash','a.b7@gmail.com','Kalyan',300000),
('Arnay','a.b2@gmail.com','Kalyan',240000);

#---------------------------------------------------------
# UNIQUE
#---------------------------------------------------------

CREATE TABLE IF NOT EXISTS TABLE8(
SERIAL INT NOT NULL DEFAULT 0,
FIRST_NAME VARCHAR(30),
EMAIL VARCHAR(30) UNIQUE,
CITY VARCHAR(30) CHECK (CITY = 'Kalyan'),
SALARY INT CHECK (SALARY > 50000));

insert into TABLE8 (FIRST_NAME, EMAIL, CITY, SALARY)  values
('sagar','sagar.koktare7892@gmail.com','Kalyan',50001),
('Aakash','a.b7@gmail.com','Kalyan',300000),
('Arnay','a.b27@gmail.com','Kalyan',240000);

# Primary key also considers unique values & Unique also considers unique values,
# However, below is the difference :
# Only one column we could set as a primary key
# Unique constraint we could set to multiple columns

#-------------------------------------------------------------------
#-- SUMMARISING ALL CONSTRAINTS INTO ONE TABLE
#-------------------------------------------------------------------
# Including ALL CONSTRAINTS

CREATE TABLE IF NOT EXISTS TABLE9(
SERIAL INT NOT NULL auto_increment,
FIRST_NAME VARCHAR(30) NOT NULL DEFAULT 'Unknown',
EMAIL VARCHAR(30) UNIQUE NOT NULL,
CITY VARCHAR(30) CHECK (CITY = 'Kalyan') NOT NULL,
SALARY INT CHECK (SALARY > 10000) NOT NULL,
primary key(SERIAL));

SELECT * FROM TABLE9;

insert into TABLE9 (FIRST_NAME, EMAIL, CITY, SALARY)  values 
('sagar','sagar.koe@gmail.com','Kalyan',50001),
('Aakash','b.z22273@gmail.com','Kalyan',300000),
('Arnay','d.w22273@gmail.com','Kalyan',240000);
