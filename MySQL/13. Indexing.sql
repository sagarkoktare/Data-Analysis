use operation;

SHOW INDEX from COURSE_Index;

CREATE TABLE IF NOT EXISTS COURSE_Index(
COURSE_ID INT,
COURSE_NAME VARCHAR(40),
COURSE_DESC VARCHAR(40),
COURSE_TAG VARCHAR(40),
index(COURSE_ID)
);

INSERT INTO COURSE_Index VALUES(101, 'fsda','fsda','analytics'),
(102, 'fsds','fsds','analytics'),
(103, 'fsds','fsds','analytics'),
(104, 'big data','fsbd','big data'),
(105, 'mern','web dev','analytics'),
(106, 'block chain','fsbc','block Chain'),
(107, 'java','fsj','java'),
(108, 'testing','fst','testing'),
(109, 'cyber security','fscs','security'),
(110, 'fsda','fsda','analytics'),
(111, 'fsds','fsda','analytics'),
(112, 'mern','web dev','analytics'),
(113, 'c','c','language'),
(114, 'c++','c++','language')

CREATE TABLE IF NOT EXISTS COURSE_Index2(
COURSE_ID INT,
COURSE_NAME VARCHAR(40),
COURSE_DESC VARCHAR(40),
COURSE_TAG VARCHAR(40),
index(COURSE_ID,COURSE_NAME)
);

SHOW INDEX from COURSE_Index2;

INSERT INTO COURSE_Index2 VALUES(101, 'fsda','fsda','analytics'),
(102, 'fsds','fsds','analytics'),
(103, 'fsds','fsds','analytics'),
(104, 'big data','fsbd','big data'),
(105, 'mern','web dev','analytics'),
(106, 'block chain','fsbc','block Chain'),
(107, 'java','fsj','java'),
(108, 'testing','fst','testing'),
(109, 'cyber security','fscs','security'),
(110, 'fsda','fsda','analytics'),
(111, 'fsds','fsda','analytics'),
(112, 'mern','web dev','analytics'),
(113, 'c','c','language'),
(114, 'c++','c++','language')

EXPLAIN select * from COURSE_Index2 where COURSE_ID = 106


CREATE TABLE IF NOT EXISTS COURSE_UNIQUE_Index(
COURSE_ID INT,
COURSE_NAME VARCHAR(40),
COURSE_DESC VARCHAR(40),
COURSE_TAG VARCHAR(40),
UNIQUE INDEX(COURSE_ID,COURSE_NAME)
);

SHOW INDEX from COURSE_UNIQUE_Index;