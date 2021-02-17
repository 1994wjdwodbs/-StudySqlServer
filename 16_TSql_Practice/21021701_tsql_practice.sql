-- ���� ȸ������ �ҷ����� (���� ��������, �̸� ��������) --
SELECT memberID, memberName, levels, mobile, email
FROM memberTBL
WHERE levels != 'S'
ORDER BY levels DESC, memberName ASC;

-- å ���� --
SELECT cateIdx, bookName, author, interpreter, company, price 
FROM booksTBL
ORDER BY price DESC;

-- �ý��� �Լ� ��� ���� --
SELECT memberID, 
	   CONCAT(RIGHT(memberName, 2), ', ', LEFT(memberName, 1)) AS '�̱����̸�', 
	   dbo.unf_getLevel(levels) AS 'ȸ������', -- �����س��� �������� ����� (SQL���� CREATE, SELECT ���ÿ� ���� ������ ����)
	   mobile, 
	   UPPER(email) AS '�̸���'
FROM memberTBL
WHERE levels != 'S'
ORDER BY levels, memberName;

-- å ����, �ý��� �Լ�, ���� �Լ� ���� --
SELECT bookIdx 
     , cateIdx 
     , CONCAT(N'å���� > ', bookName) AS bookName 
     , author 
     , COALESCE(interpreter, '(���ھ���)') AS '������'
     , company 
     , FORMAT(releaseDate, 'yyyy�� mm�� dd��') AS '������' 
     , FORMAT(price,'#,#��') AS '����' 
  FROM booksTBL;

-- å���� ���� --
SELECT  b.bookIdx 
      --, b.cateIdx 
	  , c.cateName
      , b.bookName 
      , b.author 
      , b.interpreter 
      , b.company 
  FROM  dbo . booksTBL AS b
  JOIN cateTBL AS c ON (b.cateIdx = c.cateIdx)
  ;

-- �뿩�� å�� ���� ���� ����
SELECT  r.rentalIdx 
      , m.memberName 
      --, r.bookIdx 
	  , b.bookName
	  , b.author
	  , FORMAT(r.rentalDt, 'yyyy-MM-dd') AS '�뿩��'
	  , FORMAT(r.returnDt, 'yyyy-MM-dd') AS '�ݳ���'
	  , dbo.ufn_getState(r.rentalState) AS '�뿩����'
  FROM  dbo.rentalTBL AS r
  JOIN booksTBL AS b ON (r.bookIdx = b.bookIdx)
  RIGHT JOIN memberTBL As m ON (r.memberIdx = m.memberIdx)
  WHERE rentalIdx IS NULL;

  -- �츮 å �뿩���� ���� �Ҽ� �帣
  SELECT c.cateIdx, c.cateName, b.bookName
  FROM cateTBL AS c
  LEFT JOIN booksTBL AS b ON (c.cateIdx = b.cateIdx);