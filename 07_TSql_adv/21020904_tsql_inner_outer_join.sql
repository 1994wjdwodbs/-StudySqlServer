-- LEFT JOIN
SELECT * 
FROM stdTbl AS s
LEFT OUTER JOIN ClubRegTbl AS r ON s.id = r.std_id;
-- WHERE r.std_id IS NULL; s - r (차집합)

SELECT * 
FROM stdTbl AS s
LEFT OUTER JOIN ClubRegTbl AS r ON s.id = r.std_id
LEFT OUTER JOIN ClubTbl AS c ON r.club_id = c.id;
-- LEFT JOIN

-- RIGHT JOIN
SELECT * 
FROM stdTbl AS s
RIGHT OUTER JOIN ClubRegTbl AS r ON s.id = r.std_id;

SELECT * 
FROM stdTbl AS s
RIGHT OUTER JOIN ClubRegTbl AS r ON s.id = r.std_id
RIGHT OUTER JOIN ClubTbl AS c ON r.club_id = c.id;
-- RIGHT JOIN

-- 비교 LEFT AND RIGHT, RIGHT AND LEFT, FULL (OUTER 생략 가능)
SELECT * 
FROM stdTbl AS s
LEFT OUTER JOIN ClubRegTbl AS r ON s.id = r.std_id
RIGHT OUTER JOIN ClubTbl AS c ON r.club_id = c.id;

SELECT * 
FROM stdTbl AS s
RIGHT OUTER JOIN ClubRegTbl AS r ON s.id = r.std_id
LEFT OUTER JOIN ClubTbl AS c ON r.club_id = c.id;

SELECT * 
FROM stdTbl AS s
LEFT JOIN ClubRegTbl AS r ON s.id = r.std_id
FULL JOIN ClubTbl AS c ON r.club_id = c.id;
-- 비교 LEFT AND RIGHT, RIGHT AND LEFT, FULL (OUTER 생략 가능)

SELECT * 
FROM stdTbl AS s
JOIN ClubRegTbl AS r ON s.id = r.std_id;

-- CROSS JOIN (무식한 크로스곱)
SELECT *
FROM stdTbl, ClubTbl; -- 6 x 6 = 36개 행 출력
-- CROSS JOIN (무식한 크로스곱)

-- UNION, UNION ALL (단, 속성(Attr, Col) 수가 서로 같아야 한다!)
SELECT stdName, region
FROM stdTbl
UNION
SELECT clubName, buildingNum
FROM ClubTbl;

-- EXCEPT, INTERSECT
SELECT stdName, region
FROM stdTbl
EXCEPT
SELECT stdName, region
FROM stdTbl;

SELECT userName, mobile1+mobile2 AS '전화번호'
FROM userTbl WHERE mobile1 IS NOT NULL;

SELECT userName, mobile1+mobile2 AS '전화번호'
FROM userTbl WHERE mobile1 IS NOT NULL
INTERSECT
SELECT userName, mobile1+mobile2
FROM userTbl
WHERE mobile1 IS NOT NULL;
-- EXCEPT, INTERSECT