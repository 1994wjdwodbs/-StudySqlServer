-- LEFT JOIN
SELECT * 
FROM stdTbl AS s
LEFT OUTER JOIN ClubRegTbl AS r ON s.id = r.std_id;
-- WHERE r.std_id IS NULL; s - r (������)

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

-- �� LEFT AND RIGHT, RIGHT AND LEFT, FULL (OUTER ���� ����)
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
-- �� LEFT AND RIGHT, RIGHT AND LEFT, FULL (OUTER ���� ����)

SELECT * 
FROM stdTbl AS s
JOIN ClubRegTbl AS r ON s.id = r.std_id;

-- CROSS JOIN (������ ũ�ν���)
SELECT *
FROM stdTbl, ClubTbl; -- 6 x 6 = 36�� �� ���
-- CROSS JOIN (������ ũ�ν���)

-- UNION, UNION ALL (��, �Ӽ�(Attr, Col) ���� ���� ���ƾ� �Ѵ�!)
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

SELECT userName, mobile1+mobile2 AS '��ȭ��ȣ'
FROM userTbl WHERE mobile1 IS NOT NULL;

SELECT userName, mobile1+mobile2 AS '��ȭ��ȣ'
FROM userTbl WHERE mobile1 IS NOT NULL
INTERSECT
SELECT userName, mobile1+mobile2
FROM userTbl
WHERE mobile1 IS NOT NULL;
-- EXCEPT, INTERSECT