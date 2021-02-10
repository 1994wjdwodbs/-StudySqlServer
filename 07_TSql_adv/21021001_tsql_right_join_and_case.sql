
use sqlDB;
go

SELECT userID, SUM(price * amount) AS '�� ���űݾ�'
FROM buyTbl
GROUP BY userID 
ORDER BY '�� ���űݾ�' DESC;

SELECT * FROM userTbl;
SELECT * FROM buyTbl;

-- RIGHT JOIN ���̺� ���� ���ڵ� ��(����)�� ���� ������ �ٲ��� �� NULL ��� ���� ���̰� �����.
SELECT 
u.userID, u.addr, u.userName, 
IIF(SUM(b.price * b.amount) IS NULL, 0, SUM(b.price * b.amount)) AS '�� ���űݾ�'
FROM buyTbl AS b
RIGHT JOIN userTbl AS u
ON b.userID = u.userID
GROUP BY u.userName, u.userID, u.addr
ORDER BY '�� ���űݾ�' DESC;

SELECT IIF(b.userID is NULL, '���ɼմ�', b.userID), u.addr, u.userName, SUM(b.price * b.amount) AS '�� ���űݾ�'
FROM buyTbl AS b
RIGHT JOIN userTbl AS u
ON b.userID = u.userID
GROUP BY u.userName, b.userID, u.addr
ORDER BY '�� ���űݾ�' DESC;
-- RIGHT JOIN ���̺� ���� �ľ�

-- CASE
SELECT 
u.userID, u.addr, u.userName, 
IIF(SUM(b.price * b.amount) IS NULL, 0, SUM(b.price * b.amount)) AS '�� ���űݾ�',
	CASE
		WHEN (SUM(b.price * b.amount) >= 1500) THEN 'VVIP'
		WHEN (SUM(b.price * b.amount) >= 1000) THEN 'VIP'
		WHEN (SUM(b.price * b.amount) >= 1) THEN 'NORMAL'
		ELSE 'GHOST'
	END AS '�� ����'
FROM buyTbl AS b
RIGHT JOIN userTbl AS u
ON b.userID = u.userID
GROUP BY u.userName, u.userID, u.addr
ORDER BY '�� ���űݾ�' DESC;
-- CASE