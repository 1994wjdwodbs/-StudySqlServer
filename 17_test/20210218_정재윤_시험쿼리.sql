
use bookrentalshop;
-- 1-1
SELECT LOWER(email), mobile, names, addr
FROM membertbl;

-- 1-2
SELECT names, author, releaseDate, price
FROM bookstbl;

-- 2-1
SELECT TOP 10
	CONCAT(RIGHT(names,2), ',', LEFT(names,1)) AS �����̸�
	, levels
	, LEFT(addr, 2) AS ����
	, LOWER(email) AS �̸���
FROM membertbl;

-- 2-2
SELECT 
	Idx
	, CONCAT('���� : ', Names) AS Names
	, CONCAT('���� > ', Author) AS Author
	, FORMAT(ReleaseDate, 'yyyy�� MM�� dd��') AS ������
	, ISBN
	, FORMAT(Price, '#,#��') AS ����
FROM bookstbl
ORDER BY Idx DESC;


-- 3-1
SELECT 
	b.Idx AS ��ȣ
	, b.Division AS �帣��ȣ
	, d.Names AS �帣
	, b.Names AS å����
	, b.Author AS ����
FROM bookstbl AS b
JOIN divtbl AS d on (b.Division = d.Division)
WHERE b.Division = 'B002';

-- 3-2
SELECT
	m.Names
	, m.Levels
	, m.Addr
	, r.rentalDate
FROM membertbl AS m
LEFT JOIN rentaltbl AS r ON (m.Idx = r.memberIdx)
WHERE r.rentalDate IS NULL;

-- 4-1
INSERT INTO divtbl
(Division, Names)
VALUES
('I002', '�ڱⰳ�߼�');

-- 4-2
UPDATE membertbl
SET Addr='�λ�� �ؿ�뱸', Mobile='010-6683-7732'
WHERE Idx=26;

-- 5
SELECT 
	d.Names AS names
	, SUM(b.Price) AS ���հ�ݾ�
FROM bookstbl AS b
JOIN divtbl AS d ON (b.Division = d.Division)
GROUP BY ROLLUP(d.Names);