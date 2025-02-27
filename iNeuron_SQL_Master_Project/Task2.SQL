#--------------------------------------------------------------
#-- Example 1
#--------------------------------------------------------------

#CREATE DATABASE
CREATE DATABASE ABC_DB;

#CALLING DATABASE
USE ABC_DB;

#CREATE A TABLE
CREATE TABLE IF NOT EXISTS PHONES(
NAME_ VARCHAR NOT NULL unique,
PHONE_NUMBER INTEGER NOT NULL unique);

#CREATE A TABLE calls
CREATE TABLE IF NOT EXISTS CALLS(
ID INTEGER NOT NULL,
CALLER INTEGER NOT NULL,
CALLEE INTEGER NOT NULL,
DURATION INTEGER NOT NULL,
unique(ID));

#INSERTING DATA INTO TABLE
INSERT INTO PHONES (NAME_, PHONE_NUMBER) VALUES 
('Jack',1234),
('Lena',3333),
('Mark',9999),
('Anna',7582);

#INSERTING DATA INTO CALLS
INSERT INTO CALLS (ID, CALLER, CALLEE, DURATION) VALUES 
(25,1234,7582,8),
(7,9999,7582,1),
(18,9999,3333,4),
(2,7582,3333,3),
(3,3333,1234,1),
(21,3333,1234,1);


SELECT * FROM PHONES;

ALTER TABLE CALLS ADD PRIMARY KEY (ID);
ALTER TABLE CALLS ADD FOREIGN KEY (CALLER) references PHONES(PHONE_NUMBER);
ALTER TABLE CALLS ADD FOREIGN KEY (CALLEE) references PHONES(PHONE_NUMBER);

WITH CALL_DURATION_FINAL AS (
WITH CALL_DURATION AS (
SELECT P.NAME_, P.PHONE_NUMBER, SUM(C.DURATION) as DURATION FROM PHONES P
LEFT JOIN
CALLS C ON P.PHONE_NUMBER = C.CALLER
group by P.NAME_, P.PHONE_NUMBER, DURATION
UNION
SELECT P.NAME_, P.PHONE_NUMBER, SUM(C.DURATION) as DURATION FROM PHONES P
LEFT JOIN
CALLS C ON P.PHONE_NUMBER = C.CALLEE
group by P.NAME_, P.PHONE_NUMBER, DURATION)
select NAME_, SUM(DURATION) AS TOTAL_DURATION FROM  CALL_DURATION GROUP BY NAME_)
SELECT NAME_ FROM CALL_DURATION_FINAL WHERE TOTAL_DURATION >=10 ORDER BY NAME_ ASC;

#--------------------------------------------------------------
#-- Example 2
#--------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PHONES_2(
NAME_ VARCHAR NOT NULL unique,
PHONE_NUMBER INTEGER NOT NULL unique);

#CREATE A TABLE calls
CREATE TABLE IF NOT EXISTS CALLS_2(
ID INTEGER NOT NULL,
CALLER INTEGER NOT NULL,
CALLEE INTEGER NOT NULL,
DURATION INTEGER NOT NULL,
unique(ID));

#INSERTING DATA INTO TABLE
INSERT INTO PHONES_2 (NAME_, PHONE_NUMBER) VALUES 
('John',6356),
('Addison',4315),
('Kate',8003),
('Ginny',9831);

#INSERTING DATA INTO CALLS
INSERT INTO CALLS_2 (ID, CALLER, CALLEE, DURATION) VALUES 
(65,8003,9831,7),
(100,9831,8003,3),
(145,4315,9831,18);

ALTER TABLE PHONES_2 ADD PRIMARY KEY (PHONE_NUMBER);
ALTER TABLE CALLS_2 ADD PRIMARY KEY (ID);
ALTER TABLE CALLS_2 ADD FOREIGN KEY (CALLER) references PHONES(PHONE_NUMBER);
ALTER TABLE CALLS_2 ADD FOREIGN KEY (CALLEE) references PHONES(PHONE_NUMBER);

WITH CALL_DURATION_FINAL AS (
WITH CALL_DURATION AS (
SELECT P.NAME_, P.PHONE_NUMBER, SUM(C.DURATION) as DURATION FROM PHONES_2 P
LEFT JOIN
CALLS_2 C ON P.PHONE_NUMBER = C.CALLER
group by P.NAME_, P.PHONE_NUMBER, DURATION
UNION
SELECT P.NAME_, P.PHONE_NUMBER, SUM(C.DURATION) as DURATION FROM PHONES_2 P
LEFT JOIN
CALLS_2 C ON P.PHONE_NUMBER = C.CALLEE
group by P.NAME_, P.PHONE_NUMBER, DURATION)
select NAME_, SUM(DURATION) AS TOTAL_DURATION FROM CALL_DURATION GROUP BY NAME_)
SELECT NAME_ FROM CALL_DURATION_FINAL WHERE TOTAL_DURATION >=10 ORDER BY NAME_ ASC;

