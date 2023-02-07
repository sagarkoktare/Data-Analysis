show databases;

use ineuron_fsda;

select * from bank_details;

#DEFINING A PROCEDURE 
DELIMITER &&
CREATE PROCEDURE SELECT_ALL_RECORDS()
BEGIN
select * from bank_details;
END &&

#CALLING A PROCEDURE
CALL SELECT_ALL_RECORDS();

##--------------------
DELIMITER &&
CREATE PROCEDURE SELECT_MAX_BALANCE_DETAILS_RECORDS()
BEGIN
select * from bank_details where balance = (select max(Balance) from bank_details);
END &&

#CALLING A PROCEDURE
CALL SELECT_MAX_BALANCE_DETAILS_RECORDS();

##--------------------
DELIMITER &&
CREATE PROCEDURE SELECT_MAX_BALANCE_DETAILS_RECORDS()
BEGIN
select * from bank_details where balance = (select max(Balance) from bank_details);
END &&

##-- PASSING A PARAMETER ------------------

DELIMITER &&
CREATE PROCEDURE SELECT_JOB_ROLE_WITH_PARAMETER(IN job_role varchar(30))
BEGIN
select avg(balance) from bank_details where job = job_role;
END &&

#Calling PROCEDURE with Parameter
CALL SELECT_JOB_ROLE_WITH_PARAMETER('admin.');
CALL SELECT_JOB_ROLE_WITH_PARAMETER('management');
CALL SELECT_JOB_ROLE_WITH_PARAMETER('unknown');

##-- PASSING TWO PARAMETERS ------------------

DELIMITER &&
CREATE PROCEDURE SELECT_JOB_ROLE_TWO_PARAMETERS(IN job_role varchar(30),IN educ varchar(30))
BEGIN
select * from bank_details where job = job_role and education = educ;
END &&

# Drop a procedure
DROP PROCEDURE SELECT_JOB_ROLE_TWO_PARAMETERS;

#Calling PROCEDURE with two Parameters
CALL SELECT_JOB_ROLE_TWO_PARAMETERS('admin.','primary');
CALL SELECT_JOB_ROLE_TWO_PARAMETERS('management','tertiary');

DELIMITER &&
CREATE PROCEDURE SELECT_JOB_ROLE_MULTIPLE_PARAMETERS(IN Age_ INT(30),IN educ varchar(30))
BEGIN
select * from bank_details where AGE < Age_ and education = educ;
END &&

#Calling PROCEDURE with two Parameters
CALL SELECT_JOB_ROLE_MULTIPLE_PARAMETERS(45,'primary');
CALL SELECT_JOB_ROLE_MULTIPLE_PARAMETERS(45,'secondary');
CALL SELECT_JOB_ROLE_MULTIPLE_PARAMETERS(60,'unknown');

SELECT * FROM BANK_DETAILS;
