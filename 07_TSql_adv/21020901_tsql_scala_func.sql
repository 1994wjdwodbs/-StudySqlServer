USE sqlDB;
go

-- ROW_NUMBER & OVER
SELECT ROW_NUMBER() OVER(ORDER BY height DESC) AS 'Űū����', userName, addr, height FROM userTBL;
SELECT ROW_NUMBER() OVER(ORDER BY height DESC, userName ASC) AS 'Űū����', userName, addr, height FROM userTBL;
SELECT ROW_NUMBER() OVER(ORDER BY height DESC, userName DESC) AS 'Űū����', userName, addr, height FROM userTBL;
SELECT ROW_NUMBER() OVER(ORDER BY userName ASC, height DESC) AS '�̸�����', userName, addr, height FROM userTBL;

-- RANK
SELECT RANK() OVER(ORDER BY height DESC) AS 'Űū����', * FROM userTbl;
SELECT DENSE_RANK() OVER(ORDER BY height DESC) AS 'Űū����', * FROM userTbl;

-- PARTITION BY
SELECT ROW_NUMBER() OVER(PARTITION BY addr ORDER BY height DESC, userName ASC) AS 'Űū����'
, userName, addr, height FROM userTbl;
SELECT RANK() OVER(PARTITION BY addr ORDER BY height DESC) AS 'Űū����'
, * FROM  userTbl;

-- PIVOT�� ���̺�
CREATE TABLE pivotTbl
(
	userName varchar(10),
	season nvarchar(2),
	amount int
);
INSERT into pivotTbl VALUES ('�����', '�ܿ�', 10),
							('������', '����', 15),
							('�����', '����', 25),
							('�����', '��', 3),
							('�����', '��', 37),
							('������', '�ܿ�', 40),
							('�����', '����', 14),
							('�����', '�ܿ�', 22),
							('������', '����', 64);
-- SELECT * FROM pivotTbl;
-- DROP TABLE pivotTbl;

-- PIVOT
SELECT * FROM pivotTbl
PIVOT (SUM(amount) FOR season IN([��], [����], [����], [�ܿ�])) AS result;

-- JSON
SELECT userID, userName, height FROM userTbl WHERE height > 180
FOR JSON auto;