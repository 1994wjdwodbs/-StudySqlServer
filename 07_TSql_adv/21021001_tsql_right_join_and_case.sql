
use sqlDB;
go

SELECT userID, SUM(price * amount) AS '총 구매금액'
FROM buyTbl
GROUP BY userID 
ORDER BY '총 구매금액' DESC;

SELECT * FROM userTbl;
SELECT * FROM buyTbl;

-- RIGHT JOIN 테이블 지닌 레코드 양(지식)에 따라 순서를 바꿨을 때 NULL 출력 유무 차이가 생긴다.
SELECT 
u.userID, u.addr, u.userName, 
IIF(SUM(b.price * b.amount) IS NULL, 0, SUM(b.price * b.amount)) AS '총 구매금액'
FROM buyTbl AS b
RIGHT JOIN userTbl AS u
ON b.userID = u.userID
GROUP BY u.userName, u.userID, u.addr
ORDER BY '총 구매금액' DESC;

SELECT IIF(b.userID is NULL, '유령손님', b.userID), u.addr, u.userName, SUM(b.price * b.amount) AS '총 구매금액'
FROM buyTbl AS b
RIGHT JOIN userTbl AS u
ON b.userID = u.userID
GROUP BY u.userName, b.userID, u.addr
ORDER BY '총 구매금액' DESC;
-- RIGHT JOIN 테이블 순서 파악

-- CASE
SELECT 
u.userID, u.addr, u.userName, 
IIF(SUM(b.price * b.amount) IS NULL, 0, SUM(b.price * b.amount)) AS '총 구매금액',
	CASE
		WHEN (SUM(b.price * b.amount) >= 1500) THEN 'VVIP'
		WHEN (SUM(b.price * b.amount) >= 1000) THEN 'VIP'
		WHEN (SUM(b.price * b.amount) >= 1) THEN 'NORMAL'
		ELSE 'GHOST'
	END AS '고객 레밸'
FROM buyTbl AS b
RIGHT JOIN userTbl AS u
ON b.userID = u.userID
GROUP BY u.userName, u.userID, u.addr
ORDER BY '총 구매금액' DESC;
-- CASE