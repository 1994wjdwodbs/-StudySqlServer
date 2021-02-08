use sqlDB;

-- �̸��� ���ȣ�� ����� ��ȸ
SELECT * FROM userTbl
WHERE userName = '���ȣ';

-- 1970�� ���� ����̰� Ű 182 �̻��� ������� ���̵�, �̸�, ���, Ű�� ��ȸ
SELECT userID, userName, birthYear, height FROM userTbl
WHERE birthYear >= 1970 AND height >= 182;
-- AND userName like '��%';
-- 1970�� ���� ����̰ų� Ű�� 182�̻��� ������� ���̵�,�̸�, ���, Ű�� ��ȸ
SELECT userID, userName, birthYear, height FROM userTbl
WHERE birthYear >= 1970 OR height >= 182;

-- Ű�� 180~183 ������ ����� ��ȸ (BETWEEN)
SELECT userID, userName, height FROM userTbl
WHERE height BETWEEN 180 AND 183;
-- ������ �泲, ����, ��� (IN)
SELECT userID, userName, addr FROM userTbl
WHERE addr IN ('�泲', '����', '���');
-- LIKE
SELECT userID, userName, addr FROM userTbl
WHERE userName like '��%';

SELECT userID, userName, addr FROM userTbl
WHERE userName like '_����';

-- SUBQUERY, ALL/ANY
SELECT userName, height FROM userTBL
WHERE height > 177;
SELECT userName, height FROM userTBL
WHERE height > (SELECT height FROM userTbl WHERE userName like '���ȣ');
SELECT userName, height FROM userTBL
WHERE height >= ALL (SELECT height from userTBL where addr = '�泲');
SELECT userName, height FROM userTBL
WHERE height >= ANY (SELECT height from userTBL where addr = '�泲');

-- ORDER BY, ASC(default)/DESC
SELECT userName, mDate FROM userTbl ORDER BY mDate  ASC;
SELECT userName, mDate FROM userTbl ORDER BY mDate DESC;

-- DISTINCT(�ߺ� ����)
SELECT addr FROM userTbl;
SELECT DISTINCT addr FROM userTbl;

-- ETC
SELECT TOP(5) * FROM userTbl ORDER BY mDate DESC;

-- SELECT INTO(����, �� ���纻�� Ű ������ ����)
SELECT * INTO buyTbl2 FROM buyTbl;
SELECT userID, prodName INTO buyTbl3 FROM buyTbl;

-- GROUP BY(���� �Լ�)
SELECT userID, amount FROM buyTbl ORDER BY userID;
SELECT userID, SUM(amount) AS Total_Amount FROM buyTbl GROUP BY userID;

-- ���� ������ GROUP BY ����
-- �߸��� ���
SELECT userID, MIN(height) as '����Ű', MAX(height) as 'ūŰ' FROM userTbl GROUP BY userID;
-- �������� ���
SELECT userID, height FROM userTbl
WHERE height = (SELECT MAX(height) FROM userTbl) 
   OR height = (SELECT MIN(height) FROM userTbl);
   
-- ������ ī��Ʈ
SELECT COUNT(*) FROM userTbl;
SELECT COUNT(*) FROM buyTbl;
SELECT COUNT(mobile1) AS '�ڵ��� ������' FROM userTbl;
