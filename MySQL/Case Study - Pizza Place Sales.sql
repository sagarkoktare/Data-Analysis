#------------------------------------------------------------
#----Pizza Place Sales Case Study - Maven Analytics
#------------------------------------------------------------

CREATE DATABASE PizzaSales;
USE PizzaSales;

#CREATE orders TABLE
CREATE TABLE Orders(
order_id int not null,
`date` date,
time time,
primary key(order_id));

#CREATE OrderDetails TABLE
CREATE TABLE OrdersDetails(
order_details_id int not null,
order_id int,
pizza_id varchar(30),
quantity int,
primary key(order_details_id),
foreign key(order_id) references Orders(order_id),
foreign key(pizza_id) references Pizzas(pizza_id));

#CREATE Pizza
CREATE TABLE Pizzas(
pizza_id varchar(30) not null,
pizza_type_id varchar(100),
size varchar(30),
price decimal(4,2),
primary key(pizza_id),
foreign key(pizza_type_id) references Pizza_Types(pizza_type_id));

DROP TABLE Orders;
DROP TABLE OrdersDetails;
DROP TABLE Pizzas;
DROP TABLE Pizza_types;
DROP TABLE Pizzas_types;

#CREATE Pizza_Types
CREATE TABLE Pizza_types(
pizza_type_id varchar(30) not null,
`name` text,
category varchar(30),
ingradients text,
primary key(pizza_type_id));

#----------
#- Insert Data into Tables
#----------

LOAD DATA infile
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pizza_types.csv'
INTO TABLE Pizza_types
FIELDS terminated by ','
enclosed by '"'
ESCAPED BY '\\'
lines terminated by '\r\n'
IGNORE 1 ROWS;

LOAD DATA infile
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/pizzas.csv'
INTO TABLE Pizzas
FIELDS terminated by ','
enclosed by '"'
ESCAPED BY '\\'
lines terminated by '\r\n'
IGNORE 1 ROWS;

LOAD DATA infile
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_details.csv'
INTO TABLE OrdersDetails
FIELDS terminated by ','
enclosed by '"'
ESCAPED BY '\\'
lines terminated by '\r\n'
IGNORE 1 ROWS;

LOAD DATA infile
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
INTO TABLE Orders
FIELDS terminated by ','
enclosed by '"'
ESCAPED BY '\\'
lines terminated by '\r\n'
IGNORE 1 ROWS;
