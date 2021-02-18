
use bookrentalshop;
-- 1-1
SELECT LOWER(email), mobile, names, addr
FROM membertbl;

-- 1-2
SELECT names, author, releaseDate, price
FROM bookstbl;

-- 2-1
SELECT TOP 10
	CONCAT(RIGHT(names,2), ',', LEFT(names,1)) AS 변경이름
	, levels
	, LEFT(addr, 2) AS 도시
	, LOWER(email) AS 이메일
FROM membertbl;

-- 2-2
SELECT 
	Idx
	, CONCAT('제목 : ', Names) AS Names
	, CONCAT('저자 > ', Author) AS Author
	, FORMAT(ReleaseDate, 'yyyy년 MM월 dd일') AS 출판일
	, ISBN
	, FORMAT(Price, '#,#원') AS 가격
FROM bookstbl
ORDER BY Idx DESC;


-- 3-1
SELECT 
	b.Idx AS 번호
	, b.Division AS 장르번호
	, d.Names AS 장르
	, b.Names AS 책제목
	, b.Author AS 저자
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
('I002', '자기개발서');

-- 4-2
UPDATE membertbl
SET Addr='부산시 해운대구', Mobile='010-6683-7732'
WHERE Idx=26;

-- 5
SELECT 
	d.Names AS names
	, SUM(b.Price) AS 총합계금액
FROM bookstbl AS b
JOIN divtbl AS d ON (b.Division = d.Division)
GROUP BY ROLLUP(d.Names);