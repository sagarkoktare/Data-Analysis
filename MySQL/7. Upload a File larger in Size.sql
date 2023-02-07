InvoiceNo
StockCode
Description
Quantity
InvoiceDate
UnitPrice
CustomerID
Country

CREATE DATABASE OnlineRetail_DB;
USE OnlineRetail_DB;

DROP TABLE OnlineRetail;

#Creating Table
CREATE TABLE IF NOT EXISTS OnlineRetail(
`InvoiceNo` varchar(30),
`StockCode` varchar(30),
`Description` varchar(100),
`Quantity` integer(30),
`InvoiceDate` varchar(30),
`UnitPrice` varchar(30),
`CustomerID` varchar(30),
`Country` varchar(30));

#Loading a file of 25 MB
LOAD DATA infile
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Online Retail.csv'
INTO TABLE OnlineRetail
FIELDS terminated by ','
enclosed by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

SELECT * FROM OnlineRetail;

#if you are not able to insert records 
set global max_allowed_packet = 47185920
#1048576
