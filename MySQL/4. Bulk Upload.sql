#https://drive.google.com/drive/folders/1IJegqCDv7TOd8ULgfq7DRzOeC-za1-H0?usp=sharing

CREATE DATABASE DressDetails;
USE DressDetails;

#DROP TABLE DRESS;

CREATE TABLE IF NOT EXISTS DRESS(
`Dress_ID` integer(30),
`Style` varchar(30),
`Price` varchar(30),
`Rating` integer(30),
`Size` varchar(30),
`Season` varchar(30),
`NeckLine` varchar(30),
`SleeveLength` varchar(30),
`waiseline` varchar(30),
`Material` varchar(30),
`FabricType` varchar(30),
`Decoration` varchar(30),
`Pattern Type` varchar(30),
`Recommendation` integer(30));

SELECT * FROM DRESS;

#'C:/Users/harsh/OneDrive/Desktop/Ineuron-SQL/AttributeDataSet.csv'

#'C:/Users/harsh/OneDrive/Desktop/Ineuron-SQL/AttributeDataSet.csv'
#'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/AttributeDataSet.csv'
LOAD DATA local infile
'C:/Users/harsh/OneDrive/Desktop/Ineuron-SQL/AttributeDataSet.csv'
INTO TABLE DRESS
FIELDS terminated by ','
enclosed by '"'
lines terminated by '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';


#ERROR
#secure-file-priv

# At Below path :
# C:\ProgramData\MySQL\MySQL Server 8.0
# my.ini
#
# secure-file-priv="C:/ProgramData/MySQL/MySQL Server 8.0/Uploads"
