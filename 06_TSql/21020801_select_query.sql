use sqlDB;

-- 이름이 김경호인 사람을 조회
SELECT * FROM userTbl
WHERE userName = '김경호';

-- 1970년 이후 출생이고 키 182 이상인 사람들의 아이디, 이름, 출생, 키를 조회
SELECT userID, userName, birthYear, height FROM userTbl
WHERE birthYear >= 1970 AND height >= 182;
-- AND userName like '성%';
-- 1970년 이후 출생이거나 키가 182이상인 사람들의 아이디,이름, 출생, 키를 조회
SELECT userID, userName, birthYear, height FROM userTbl
WHERE birthYear >= 1970 OR height >= 182;

-- 키가 180~183 사이인 사람만 조회 (BETWEEN)
SELECT userID, userName, height FROM userTbl
WHERE height BETWEEN 180 AND 183;
-- 지역이 경남, 전남, 경북 (IN)
SELECT userID, userName, addr FROM userTbl
WHERE addr IN ('경남', '전남', '경북');
-- LIKE
SELECT userID, userName, addr FROM userTbl
WHERE userName like '김%';

SELECT userID, userName, addr FROM userTbl
WHERE userName like '_종신';

-- SUBQUERY, ALL/ANY
SELECT userName, height FROM userTBL
WHERE height > 177;
SELECT userName, height FROM userTBL
WHERE height > (SELECT height FROM userTbl WHERE userName like '김경호');
SELECT userName, height FROM userTBL
WHERE height >= ALL (SELECT height from userTBL where addr = '경남');
SELECT userName, height FROM userTBL
WHERE height >= ANY (SELECT height from userTBL where addr = '경남');

-- ORDER BY, ASC(default)/DESC
SELECT userName, mDate FROM userTbl ORDER BY mDate  ASC;
SELECT userName, mDate FROM userTbl ORDER BY mDate DESC;

-- DISTINCT(중복 방지)
SELECT addr FROM userTbl;
SELECT DISTINCT addr FROM userTbl;

-- ETC
SELECT TOP(5) * FROM userTbl ORDER BY mDate DESC;

-- SELECT INTO(복사, 단 복사본은 키 설정이 없음)
SELECT * INTO buyTbl2 FROM buyTbl;
SELECT userID, prodName INTO buyTbl3 FROM buyTbl;

-- GROUP BY(집계 함수)
SELECT userID, amount FROM buyTbl ORDER BY userID;
SELECT userID, SUM(amount) AS Total_Amount FROM buyTbl GROUP BY userID;

-- 서브 쿼리와 GROUP BY 예제
-- 잘못된 방법
SELECT userID, MIN(height) as '작은키', MAX(height) as '큰키' FROM userTbl GROUP BY userID;
-- 정상적인 방법
SELECT userID, height FROM userTbl
WHERE height = (SELECT MAX(height) FROM userTbl) 
   OR height = (SELECT MIN(height) FROM userTbl);
   
-- 데이터 카운트
SELECT COUNT(*) FROM userTbl;
SELECT COUNT(*) FROM buyTbl;
SELECT COUNT(mobile1) AS '핸드폰 보유자' FROM userTbl;
