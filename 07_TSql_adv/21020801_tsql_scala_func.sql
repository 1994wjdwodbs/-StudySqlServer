USE sqlDB;
go

-- ROW_NUMBER & OVER
SELECT ROW_NUMBER() OVER(ORDER BY height DESC) AS '키큰순위', userName, addr, height FROM userTBL;
SELECT ROW_NUMBER() OVER(ORDER BY height DESC, userName ASC) AS '키큰순위', userName, addr, height FROM userTBL;
SELECT ROW_NUMBER() OVER(ORDER BY height DESC, userName DESC) AS '키큰순위', userName, addr, height FROM userTBL;
SELECT ROW_NUMBER() OVER(ORDER BY userName ASC, height DESC) AS '이름순위', userName, addr, height FROM userTBL;

-- RANK
SELECT RANK() OVER(ORDER BY height DESC) AS '키큰순위', * FROM userTbl;
SELECT DENSE_RANK() OVER(ORDER BY height DESC) AS '키큰순위', * FROM userTbl;

-- PARTITION BY
SELECT ROW_NUMBER() OVER(PARTITION BY addr ORDER BY height DESC, userName ASC) AS '키큰순위'
, userName, addr, height FROM userTbl;
SELECT RANK() OVER(PARTITION BY addr ORDER BY height DESC) AS '키큰순위'
, * FROM  userTbl;

-- PIVOT용 테이블
CREATE TABLE pivotTbl
(
	userName varchar(10),
	season nvarchar(2),
	amount int
);
INSERT into pivotTbl VALUES ('김범수', '겨울', 10),
							('윤종신', '여름', 15),
							('김범수', '가을', 25),
							('김범수', '봄', 3),
							('김범수', '봄', 37),
							('윤종신', '겨울', 40),
							('김범수', '여름', 14),
							('김범수', '겨울', 22),
							('윤종신', '여름', 64);
-- SELECT * FROM pivotTbl;
-- DROP TABLE pivotTbl;

-- PIVOT
SELECT * FROM pivotTbl
PIVOT (SUM(amount) FOR season IN([봄], [여름], [가을], [겨울])) AS result;

-- JSON
SELECT userID, userName, height FROM userTbl WHERE height > 180
FOR JSON auto;