USE TEST

-- CREATING TABLE

CREATE TABLE EmployeeGraphics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeGraphics1
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeGraphics2
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeGraphics3
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int
)

-- INSERTING VALUES INTO TABLES
INSERT INTO EmployeeGraphics VALUES
(1001,'SAGAR','KOKTARE',29,'MALE')

INSERT INTO EmployeeGraphics VALUES
(1002,'DHAWAL','VYAS',28,'MALE'),
(1003,'ABHISHEK','DHANWADKAR',30,'MALE'),
(1004,'MAMATA','BANERGEE',35,'FEMALE')

INSERT INTO EmployeeGraphics1 VALUES
(1001,'SAGAR','KOKTARE',29,'MALE'),
(1002,'DHAWAL','VYAS',28,'MALE'),
(1003,'ABHISHEK','DHANWADKAR',30,'MALE'),
(1004,'MAMATA','BANERGEE',35,'FEMALE')

INSERT INTO EmployeeGraphics3 VALUES
(2001,'JOE','BIDEN',29,'MALE'),
(2002,'VLADIMIR','PUTIN',28,'MALE'),
(2003,'KIM','JONG',30,'MALE'),
(2004,'BENJAMIN','NETANYAHU',35,'MALE'),
(2005,'HILLARY','CLINTON',35,'FEMALE')

INSERT INTO EmployeeSalary VALUES
(1010,'Tech Specialist II',60000),
(1011,'Project Manager',70000),
(1012,'Individual Contributor',65000)

-- SELECT ALL DATA
Select * from EmployeeGraphics

-- SELECT PARTICULAR VARIABLE
Select FirstName from EmployeeGraphics

-- SELECT TOP N ROWS
Select TOP 2 * 
FROM EmployeeGraphics

-- SELECT DISTINCT VALUES
Select DISTINCT(EmployeeID) 
FROM EmployeeGraphics

-- SELECT DISTINCT VALUES
Select DISTINCT(Gender) 
FROM EmployeeGraphics

-- FIND OUT NON-NULL VALUES
Select COUNT(LastName) 
FROM EmployeeGraphics

-- MAX SALARY
Select MAX(Salary) 
FROM EmployeeSalary

-- AVG SALARY
Select AVG(Salary) 
FROM EmployeeSalary

-- MIN SALARY
Select MIN(Salary) 
FROM EmployeeSalary

SELECT * 
FROM TEST.dbo.EmployeeSalary

-- WHERE STATEMENT
Select *
FROM EmployeeGraphics
WHERE FirstName = 'DHAWAL'

Select *
FROM EmployeeGraphics
WHERE FirstName <> 'DHAWAL'

Select *
FROM EmployeeGraphics
WHERE Age < 30

Select *
FROM EmployeeGraphics
WHERE Age < 30 OR Gender = 'MALE'

Select *
FROM EmployeeGraphics
WHERE LastName LIKE '%E'

Select *
FROM EmployeeGraphics
WHERE FirstName LIKE '%A'

Select *
FROM EmployeeGraphics
WHERE FirstName LIKE '%A%G%'

Select *
FROM EmployeeGraphics
WHERE FirstName IN ('SAGAR','MAMATA')

-- GROUP BY AND ORDER BY
Select FirstName,Age,COUNT(FirstName) as 'CountFirstName',SUM(Age) as SumAge
FROM EmployeeGraphics
WHERE Age < 30
GROUP BY FirstName, Age
ORDER BY Age, FirstName DESC

Select FirstName,Age,COUNT(FirstName) as 'CountFirstName',SUM(Age) as SumAge
FROM EmployeeGraphics
WHERE Age < 30
GROUP BY FirstName, Age
ORDER BY Age -- DEFAULT IS ASCENDING

SELECT *
FROM TEST.dbo.EmployeeGraphics1

SELECT *
FROM TEST.dbo.EmployeeSalary

-- INNER JOIN
SELECT *
FROM TEST.dbo.EmployeeGraphics1
INNER JOIN TEST.dbo.EmployeeSalary
ON EmployeeGraphics1.EmployeeID = EmployeeSalary.EmployeeID

-- FULL OUTER JOIN
SELECT *
FROM TEST.dbo.EmployeeGraphics1
FULL OUTER JOIN TEST.dbo.EmployeeSalary
ON EmployeeGraphics1.EmployeeID = EmployeeSalary.EmployeeID

-- LEFT OUTER JOIN
SELECT *
FROM TEST.dbo.EmployeeGraphics1
LEFT OUTER JOIN TEST.dbo.EmployeeSalary
ON EmployeeGraphics1.EmployeeID = EmployeeSalary.EmployeeID

-- RIGHT OUTER JOIN
SELECT *
FROM TEST.dbo.EmployeeGraphics1
RIGHT OUTER JOIN TEST.dbo.EmployeeSalary
ON EmployeeGraphics1.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeGraphics1.EmployeeID,EmployeeGraphics1.FirstName,EmployeeGraphics1.LastName,EmployeeSalary.JobTitle
FROM TEST.dbo.EmployeeGraphics1
LEFT OUTER JOIN TEST.dbo.EmployeeSalary
ON EmployeeGraphics1.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeGraphics1.EmployeeID,EmployeeGraphics1.FirstName,EmployeeGraphics1.LastName,EmployeeSalary.JobTitle
FROM TEST.dbo.EmployeeGraphics1
RIGHT OUTER JOIN TEST.dbo.EmployeeSalary
ON EmployeeGraphics1.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeGraphics1.EmployeeID,EmployeeGraphics1.FirstName,LastName,JobTitle,Salary
FROM TEST.dbo.EmployeeGraphics1
INNER JOIN TEST.dbo.EmployeeSalary
ON EmployeeGraphics1.EmployeeID = EmployeeSalary.EmployeeID
WHERE Salary IS NOT NULL
ORDER BY Salary DESC

SELECT JobTitle,AVG(Salary)
FROM TEST.dbo.EmployeeGraphics1
INNER JOIN TEST.dbo.EmployeeSalary
ON EmployeeGraphics1.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Tech Specialist'
GROUP BY JobTitle

-----------------------
-- UNION, UNION ALL
-----------------------

SELECT *
FROM TEST.dbo.EmployeeGraphics

SELECT *
FROM TEST.dbo.EmployeeGraphics3

-- FULL OUTER JOIN
SELECT *
FROM TEST.dbo.EmployeeGraphics
FULL OUTER JOIN TEST.dbo.EmployeeGraphics3
ON EmployeeGraphics.EmployeeID = EmployeeGraphics3.EmployeeID

SELECT *
FROM TEST.dbo.EmployeeGraphics
UNION
SELECT *
FROM TEST.dbo.EmployeeGraphics3

-- DATA IS NOT COMING PROPER, HOWEVER AS DATA TYPES ARE EXACTLY SIMILAR, THUS GETTING TWO TABLES GETTING MERGED
SELECT EmployeeID,FirstName,Age
FROM TEST.dbo.EmployeeGraphics
UNION
SELECT EmployeeID,JobTitle,Salary
FROM TEST.dbo.EmployeeSalary

-----------------------
-- CASE STATEMENT
-----------------------
SELECT FirstName,LastName,Age,
CASE 
	WHEN AGE > 30 THEN 'OLD'
	WHEN AGE BETWEEN 29 AND 30 THEN 'YOUNG'
	ELSE 'BABY'
END
FROM TEST.dbo.EmployeeGraphics
WHERE Age IS NOT NULL
ORDER BY Age

SELECT FirstName, LastName, JobTitle, Salary,
CASE 
	WHEN JobTitle = 'Lead Programmer' Then Salary + (Salary * 0.10)
	WHEN JobTitle = 'Tech Specialist' Then Salary + (Salary * 0.05)
	ELSE Salary
END AS SalaryAfterRaised
FROM TEST.dbo.EmployeeGraphics
JOIN TEST.dbo.EmployeeSalary
	ON EmployeeGraphics.EmployeeID = EmployeeSalary.EmployeeID

----------------------------------------
-- ALIASING
----------------------------------------
SELECT FirstName Fname
FROM TEST.dbo.EmployeeGraphics

SELECT FirstName AS Fname
FROM TEST.dbo.EmployeeGraphics

SELECT FirstName + ' ' + LastName AS FullName
FROM TEST.dbo.EmployeeGraphics

SELECT AVG(Age) AS AverageAge
FROM TEST.dbo.EmployeeGraphics

SELECT DEMO.FirstName,DEMO.EmployeeID,DEMO.Age,DEMO.Gender,SAL.Salary
FROM TEST.dbo.EmployeeGraphics AS DEMO
JOIN TEST.dbo.EmployeeSalary AS SAL
	ON DEMO.EmployeeID = SAL.EmployeeID

----------------------------------------
-- PARITIION BY 
----------------------------------------
SELECT *
FROM TEST.dbo.EmployeeGraphics

SELECT *
FROM TEST.dbo.EmployeeSalary

SELECT DEMO.EmployeeID,DEMO.Age,DEMO.Gender,SAL.Salary
, COUNT(SAL.Salary) OVER (PARTITION BY SALARY) AS TotalSalary
FROM TEST.dbo.EmployeeGraphics AS DEMO
JOIN TEST.dbo.EmployeeSalary AS SAL
	ON DEMO.EmployeeID = SAL.EmployeeID


SELECT DEMO.EmployeeID,DEMO.Age,DEMO.Gender,SAL.Salary
, COUNT(SAL.Salary)
FROM TEST.dbo.EmployeeGraphics AS DEMO
JOIN TEST.dbo.EmployeeSalary AS SAL
	ON DEMO.EmployeeID = SAL.EmployeeID
GROUP BY DEMO.EmployeeID,DEMO.Age,DEMO.Gender,SAL.Salary

-------------------------------------------
--- HAVING CLAUSE
-------------------------------------------

SELECT SAL.JobTitle,COUNT(SAL.JobTitle)
FROM TEST.dbo.EmployeeGraphics AS DEMO
JOIN TEST.dbo.EmployeeSalary AS SAL
	ON DEMO.EmployeeID = SAL.EmployeeID
-- WHERE COUNT(JobTitle) > 1 -- FAILS WHEN WE USE AGGEGATE FUNCTIONS
 -- THUS USING HAVING CLAUSE
GROUP BY SAL.JobTitle
HAVING COUNT(JobTitle) > 1

SELECT SAL.JobTitle,AVG(SAL.Salary)
FROM TEST.dbo.EmployeeGraphics AS DEMO
JOIN TEST.dbo.EmployeeSalary AS SAL
	ON DEMO.EmployeeID = SAL.EmployeeID
-- WHERE COUNT(JobTitle) > 1 -- FAILS WHEN WE USE AGGEGATE FUNCTIONS
 -- THUS USING HAVING CLAUSE
GROUP BY SAL.JobTitle
HAVING AVG(SAL.Salary) > 30000
ORDER BY AVG(SAL.Salary)

--------------------------------------------------
-- UPDATING DATA/ DELETING DATA IN TABLE
--------------------------------------------------
UPDATE TEST..EmployeeGraphics
SET Age = 29 WHERE FirstName = 'SAGAR'

UPDATE TEST..EmployeeGraphics
SET Age = 29 WHERE EmployeeID = 1002 

SELECT *
FROM TEST..EmployeeGraphics

DELETE FROM EmployeeGraphics
WHERE EmployeeID = 1004

-------------------------------------------
--- CTE - COMMON TABLE EXPRESSION
-------------------------------------------

WITH CTE_EMPLOYEE AS 
(SELECT DEMO.FirstName,DEMO.EmployeeID,DEMO.Age,DEMO.Gender,SAL.Salary
FROM TEST.dbo.EmployeeGraphics AS DEMO
JOIN TEST.dbo.EmployeeSalary AS SAL
	ON DEMO.EmployeeID = SAL.EmployeeID
)
SELECT * 
FROM CTE_EMPLOYEE

-------------------------------------------
--- TEMP TABLES
-------------------------------------------

CREATE TABLE #EmployeeGraphics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

SELECT * FROM #EmployeeGraphics

INSERT INTO #EmployeeGraphics VALUES(
1001,'S','K',28,'MALE')

INSERT INTO #EmployeeGraphics
SELECT * FROM EmployeeGraphics

--------------------------------
-- STING FUNCTION - TRIM, LTRIM, RTRIM, REPLACE,SUBSTRING, UPPER, LOWER
--------------------------------
CREATE TABLE EmployeeErrors(
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

INSERT INTO EmployeeErrors VALUES
(' 1001', 'Sagar', ' Koktare'),
('1002 ', ' Sagar ', 'Koktare '),
(' 1003 ', ' Sagar', ' Koktare ')

INSERT INTO EmployeeErrors VALUES
(' 1003 ', ' S a g a r', ' K o k t a r e ')

SELECT * 
FROM EmployeeErrors

-- USING TRIM, LTRIM, RTRIM, REPLACE, LOWER, UPPER
SELECT EmployeeID,FirstName,LastName
,RTRIM(LTRIM(EmployeeID)) as 'TEmployeeID'
,RTRIM(LTRIM(FirstName)) as 'TFirstName'
,RTRIM(LTRIM(LastName)) as 'TLastName'
,REPLACE(FirstName,' ','') as 'TFirstName'
,REPLACE(LastName,' ','') as 'TLastName'
,UPPER(LastName) as 'ULastName'
,UPPER(FirstName) as 'UFirstName'
,LOWER(LastName) as 'LLastName'
,LOWER(FirstName) as 'LFirstName'
FROM EmployeeErrors

-- USING SUBSTRING
SELECT SUBSTRING(FirstName,2,3)
from EmployeeErrors

-- FUZZY MATCHING
SELECT err.FirstName,demo.FirstName
from EmployeeErrors err
JOIN EmployeeGraphics demo
ON substring(REPLACE(err.FirstName,' ',''),1,3) = substring(demo.FirstName,1,3)

--------------------------------------------
-- STORED PROCEDURES 
--------------------------------------------
ALTER PROCEDURE PROC1
AS 
SELECT *
FROM TEST..EmployeeGraphics

EXEC PROC1

ALTER PROCEDURE PROC3
AS 
CREATE TABLE #EmployeeGraphics2
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50),
Salary int
)

INSERT INTO #EmployeeGraphics2
SELECT FirstName,LastName,Age,Gender,salary
From Test..EmployeeGraphics demo
JOIN Test..EmployeeSalary sal
ON demo.EmployeeID = sal.EmployeeID

SELECT * 
FROM #EmployeeGraphics2

-------------------------------
-- SUB QUERIES
-------------------------------
SELECT *
FROM Test..EmployeeSalary

-- Sub query in select

SELECT a.EmployeeID, Salary
,(Salary/a.TotalSalary) * 100
FROM (SELECT EmployeeID, Salary, AVG(Salary) OVER() as TotalSalary FROM test..EmployeeSalary) a

-- SUBQUERY WHERE
SELECT EmployeeID, Jobtitle,Salary
From Test..EmployeeSalary
	where EmployeeID in (
--	SELECT EmployeeID from TEST..EmployeeGraphics where Age > 29)
	SELECT EmployeeID from TEST..EmployeeGraphics)