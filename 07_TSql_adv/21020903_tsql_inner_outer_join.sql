SELECT * FROM stdTbl;
SELECT * FROM clubTbl;
SELECT * FROM clubRegTbl;

SELECT * 
FROM stdTbl as s, clubRegTbl as r 
WHERE s.id=r.std_id;

-- INNER JOIN 약식
SELECT * 
FROM clubRegTbl AS r 
INNER JOIN StdTbl AS s ON s.id=r.std_id
INNER JOIN clubTbl AS c ON c.id=r.club_id;

-- INNER JOIN 약식
SELECT * 
FROM clubRegTbl AS r, StdTbl As s, clubTbl As c
WHERE r.std_id=s.id AND r.club_id=c.id;

-- OUTER JOIN
SELECT * 
FROM StdTbl AS s
LEFT OUTER JOIN clubRegTbl AS r ON s.id=r.std_id
LEFT OUTER JOIN clubTbl AS c ON c.id=r.club_id;

-- INNER (산 사람) VS OUTER (안 산 사람까지)
SELECT u.userName, u.addr, b.prodName, b.price
FROM userTbl AS u
INNER JOIN buyTbl AS b ON u.userID = b.userID;
SELECT u.userName, u.addr, b.prodName, b.price
FROM userTbl AS u
LEFT JOIN buyTbl AS b ON u.userID = b.userID;
SELECT u.userName, u.addr, b.prodName, b.price
FROM userTbl AS u
RIGHT JOIN buyTbl AS b ON u.userID = b.userID;
SELECT u.userName, u.addr, b.prodName, b.price
FROM userTbl AS u
FULL JOIN buyTbl AS b ON u.userID = b.userID;
-- LEFT/RIGHT (OUTER) JOIN 