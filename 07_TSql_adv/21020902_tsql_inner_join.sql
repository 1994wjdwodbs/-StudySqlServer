USE sqlDB;
go

SELECT * FROM userTbl, buyTbl; -- 10 x 12 = 120개 행 출력

-- INNER JOIN
SELECT * FROM buyTbl INNER JOIN userTbl ON buyTbl.userID = userTbl.userID
WHERE buyTbl.userID='JYP';
SELECT * FROM buyTbl AS b, userTbl AS u
WHERE b.userID=u.userID AND b.userID='JYP';

SELECT 
userTbl.userName, userTbl.addr, 
CONCAT(userTbl.mobile1, '-', LEFT(userTbl.mobile2, 4), '-', RIGHT(userTbl.mobile2, 4)) AS mobile,
buyTbl.prodName, buyTbl.price, buyTbl.amount 
FROM buyTbl INNER JOIN userTbl ON buyTbl.userID = userTbl.userID
WHERE buyTbl.userID='JYP';
SELECT 
u.userName, u.addr, 
CONCAT(u.mobile1, '-', LEFT(u.mobile2, 4), '-', RIGHT(u.mobile2, 4)) AS mobile,
b.prodName, b.price, b.amount
FROM buyTbl AS b, userTbl AS u
WHERE b.userID=u.userID AND b.userID='JYP';


