
Use sales_Db;
select * from sales limit 5;

#------------------------------------------
#-- If Statements
##-----------------------------------------
##-----------------------------------------
##-----------------------------------------

DELIMITER &&
CREATE FUNCTION ADD_TO_COLUMNS(
a int
)
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE b int;
    set b = a + 10;
    return b;
END &&

##--------------------
#- SQUARE OF NUMBER
##--------------------
DELIMITER &&
CREATE FUNCTION SQUARE_OF_NUMBER(
a int
)
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE b int;
    set b = a * a;
    return b;
END &&

DELIMITER &&
CREATE FUNCTION SQUARE_OF_NUMBER(
a int
)
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE b int;
    set b = a * 100;
    return b;
END &&

DROP FUNCTION FINAL_PROFIT_FUNCTION;

DELIMITER &&
CREATE FUNCTION FINAL_PROFIT_FUNCTION(profit decimal(20,2), discount decimal(20,2), sales decimal(20,2))
RETURNS decimal
DETERMINISTIC
BEGIN
	DECLARE final_profit decimal;
    set final_profit = profit - (discount * sales);
    return final_profit;
END &&

##- INBUILT FUNCTIONS
SELECT MAX(SALES) FROM SALES;

SELECT * FROM SALES;

#CALLING A USER DEFINED FUNCTION
SELECT Sales,ADD_TO_COLUMNS(sales) FROM SALES;

SELECT QUANTITY,SQUARE_OF_NUMBER(QUANTITY) FROM SALES;

SELECT sales,discount,profit,FINAL_PROFIT_FUNCTION(sales,discount,profit) as 'FINAL PROFIT' FROM SALES;

#-------------------------------------------
# ---- CONVERT INT TO STRING ---------------
#-------------------------------------------

DELIMITER &&
CREATE FUNCTION INT_TO_STR(VAR INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE FINAL_VAR VARCHAR(30);
    set FINAL_VAR = VAR;
    return FINAL_VAR;
END &&

SELECT SALES, INT_TO_STR(SALES) AS 'SALES IN VARCHAR' FROM SALES;

#----------------
#- CATEGORIES ---
#----------------

#  1-100 - SUPER AFFORDABLE PRODUCT
#100-300 - AFFORDABLE
#300-600 - MODERATE PRICE
#600+    - EXPENSIVE

DELIMITER &&
CREATE FUNCTION SALES_CATEGORIES(VAR INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE FINAL_VAR VARCHAR(30);
    IF VAR < 100 THEN 
		SET FINAL_VAR = "SUPER AFFORDABLE";
    ELSEIF VAR >= 100 AND VAR <= 300 THEN
		SET FINAL_VAR = "AFFORDABLE";
    ELSEIF VAR >= 300 AND VAR <= 600 THEN
		SET FINAL_VAR = "MODERRATE";
    ELSE 
        SET FINAL_VAR = "EXPENSIVE";
    END IF;
    return FINAL_VAR;
END &&

SELECT SALES, SALES_CATEGORIES(SALES) AS 'CAT' FROM SALES;

#ADDING A COLUMN
ALTER TABLE SALES
ADD COLUMN SALE_CAT VARCHAR(30);

#UPDATING A COLUMN USING FUNCTION
UPDATE SALES SET SALE_CAT = SALES_CATEGORIES(SALES)

# CALLING A FUNCTION
SELECT SALES_CATEGORIES(1000)

SELECT * FROM SALES;

#------------------------------------------------------------------------------------
#----LOOPS
#------------------------------------------------------------------------------------
CREATE TABLE LOOP_TABLE(NUM INT)

DELIMITER $$
CREATE PROCEDURE INSERT_DATA()
BEGIN 
SET @VAR = 10;
GENERATE_DATA : LOOP
INSERT INTO LOOP_TABLE VALUES (@VAR);
SET @VAR = @VAR + 1;
IF @VAR = 100 THEN
	LEAVE GENERATE_DATA;
END IF;
END LOOP GENERATE_DATA;
END $$

#BEFORE CALLING A PROCEDURE | LOOP_TABLE IS BLANK
SELECT * FROM LOOP_TABLE;

CALL INSERT_DATA()

#AFTER CALLING A PROCEDURE
SELECT * FROM LOOP_TABLE;

#ADDING A COLUMN
ALTER TABLE LOOP_TABLE ADD COLUMN EVEN_NUM INT;

#---------------------------------------------------
#--- ADD A EVEN NUMBER WITH THE HELP OF LOOP AND PROCEDURE
#---------------------------------------------------
DROP PROCEDURE EVEN_NUMBER;

DELIMITER $$
CREATE PROCEDURE EVEN_NUMBER()
BEGIN 
SET @VAR = 0;
GENERATE_DATA_EVEN : LOOP
IF @VAR % 2=0 THEN
INSERT INTO LOOP_TABLE(EVEN_NUM) VALUES (@VAR);
SET @VAR = @VAR + 1;
IF @VAR =6 THEN
	LEAVE GENERATE_DATA_EVEN;
END IF;
END IF;
END LOOP GENERATE_DATA_EVEN;
END $$

set global max_allowed_packet=67108864;

#BEFORE CALLING PROCEDURE EVEN_NUM COLUMN IS EMPTY
SELECT * FROM LOOP_TABLE
CALL EVEN_NUMBER();

CREATE DATABASE PROJECT_DB;
USE PROJECT_DB;

#--------- TASKS

#------------------------------------------------------------------------------------
#----LOOPS
#------------------------------------------------------------------------------------

CREATE TABLE SQUARE_TABLE(NUM DOUBLE,SQR DOUBLE)

DELIMITER $$
CREATE PROCEDURE FIND_SQUARE()
BEGIN
SET @VAR = 1;
SET @VAR1 = 1;
GENERATE_DATA : LOOP
INSERT INTO SQUARE_TABLE(NUM,SQR) VALUES (@VAR,@VAR1);
SET @VAR = @VAR + 1;
SET @VAR1 = @VAR * @VAR;
IF @VAR > 101 THEN
	LEAVE GENERATE_DATA;
END IF;
END LOOP GENERATE_DATA;
END $$

#0 rows affected, before calling procedure
SELECT * FROM SQUARE_table;

#CALL A PROCEDURE
CALL FIND_SQUARE;

#AFTER CALLING A PROCEDURE
SELECT * FROM SQUARE_TABLE;

#---------------------------------
#--- Log 10
#----------------------------------
DROP FUNCTION LOG10_

DELIMITER &&
CREATE FUNCTION LOG10_(
a decimal
)
RETURNS DECIMAL
DETERMINISTIC
BEGIN
	DECLARE FINAL_VAR decimal;
    DECLARE FINAL_LOG decimal;
    SET b = a^10;
    SET FINAL_VAR = b^10
    IF FINAL_VAR >= 100000 THEN
		SET FINAL_LOG = FINAL_VAR ^ 100000;
    ELSEIF FINAL_VAR >= 10000 THEN
		SET FINAL_LOG = FINAL_VAR ^ 10000;
    ELSEIF FINAL_VAR >= 1000 THEN
		SET FINAL_LOG = FINAL_VAR ^ 1000;
    ELSEIF FINAL_VAR >= 100 THEN 
		SET FINAL_LOG = FINAL_VAR ^ 100;
    ELSE 
        SET FINAL_LOG = "CAN'T CALCULATE";
    END IF;
    return FINAL_LOG;
END &&

SELECT LOG10_(25)

select len(25)

#---------------------------------
#--- COUNT ROWS
#----------------------------------
DROP FUNCTION COUNTROWS

DELIMITER &&
CREATE FUNCTION COUNTROWS(VAR VARCHAR(30))
RETURNS INT
deterministic
BEGIN
SET @VAR1 = 1;
GENERATE_DATA : LOOP
SELECT @VAR FROM SALES;
IF @VAR IS NOT NULL THEN
	SET @VAR1 = @VAR1 + 1;
    
END IF;
return @var;
END LOOP GENERATE_DATA;
END &&

SELECT COUNTROWS(ORDER_ID) FROM SALES;

USE SALES_DB;

DROP PROCEDURE COUNT_RECORDS

DELIMITER &&
CREATE PROCEDURE COUNT_RECORDS(IN TABLE_NAME_ VARCHAR(40))
BEGIN
	SET @T1 = CONCAT('SELECT COUNT(*) FROM ', TABLE_NAME_);
    PREPARE STMT1 FROM @T1;
    EXECUTE STMT1;
    deallocate prepare STMT1;
END &&

SELECT COUNT(*) FROM SALES;
CALL COUNT_RECORDS('SALES');

#--------------------------------------
#- Date Difference 
#--------------------------------------
DROP FUNCTION DATE_DIFFERENCE_DAYS;

DELIMITER &&
CREATE FUNCTION DATE_DIFFERENCE_DAYS(
ORD_DATE VARCHAR(30),SHI_DATE VARCHAR(30))
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE DiffDays int;

    DECLARE SHIDays int;
    DECLARE OrdDays int;

    DECLARE SHI_YEAR int;
    DECLARE SHI_MONTH int;
    DECLARE SHI_DAY int;

    DECLARE SHI_YEAR_FINAL int;
    DECLARE SHI_MONTH_FINAL int;

    DECLARE ORD_YEAR int;
    DECLARE ORD_MONTH int;
    DECLARE ORD_DAY int;
    
    DECLARE ORD_YEAR_FINAL int;
    DECLARE ORD_MONTH_FINAL int;

    SET SHI_YEAR = YEAR(str_to_date(SHI_DATE,'%m-%d-%Y'));
    SET SHI_MONTH = MONTH(str_to_date(SHI_DATE,'%m-%d-%Y'));
    SET SHI_DAY = DAY(str_to_date(SHI_DATE,'%m-%d-%Y'));

    SET ORD_YEAR = YEAR(str_to_date(ORD_DATE,'%m-%d-%Y'));
    SET ORD_MONTH = MONTH(str_to_date(ORD_DATE,'%m-%d-%Y'));
    SET ORD_DAY = DAY(str_to_date(ORD_DATE,'%m-%d-%Y'));

    #CALCULATE NUMBER OF DAYS OF SHIPPING DATE
	IF SHI_MONTH <= 2 THEN
    SET SHI_MONTH = SHI_MONTH + 12;
    SET SHI_YEAR_FINAL = SHI_YEAR_FINAL - 1;
    SET SHIDays = (146097*SHI_YEAR_FINAL)/400 + (153*SHI_MONTH_FINAL + 8)/5 + SHI_DAY;
    else
    SET SHIDays = (146097*SHI_YEAR_FINAL)/400 + (153*SHI_MONTH_FINAL + 8)/5 + SHI_DAY;
    End if;

    #CALCULATE NUMBER OF DAYS OF ORDER DATE
	IF ORD_MONTH <= 2 THEN
    SET ORD_MONTH = ORD_MONTH + 12;
    SET ORD_YEAR_FINAL = ORD_YEAR_FINAL - 1;
    SET ORDDays = (146097*ORD_YEAR_FINAL)/400 + (153*ORD_MONTH_FINAL + 8)/5 + ORD_DAY;
    else
    SET ORDDays = (146097*ORD_YEAR_FINAL)/400 + (153*ORD_MONTH_FINAL + 8)/5 + ORD_DAY;
    End if;
    
    #CALCULATE DIFFERENCE BETWEEN DATES 
    SET DiffDays = SHIDays - ORDDays;
    return DiffDays;
END &&

#Finding a Date Difference
SELECT ORDER_DATE, SHIP_DATE, DATE_DIFFERENCE_DAYS(ORDER_DATE,ship_DATE) FROM SALES;

#--------------------------------
#-- PROCEDURE TO GET 5TH HIGHEST SALES
#--------------------------------

DROP PROCEDURE MAX_SALES

DELIMITER &&
CREATE PROCEDURE MAX_SALES()
BEGIN
SELECT ORDER_ID, SALES FROM SALES ORDER BY SALES DESC limit 4, 1;
END &&

# CALLING A PROCEDURE 
CALL MAX_SALES

SELECT YEAR(str_to_date(SHI_DATE,'%m-%d-%Y') FROM SALES;
