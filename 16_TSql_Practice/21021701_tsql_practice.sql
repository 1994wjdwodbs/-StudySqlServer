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
      , r.memberIdx 
      , r.bookIdx 
      , r.rentalDt 
      , r.returnDt 
      , r.rentalState 
  FROM  dbo.rentalTBL AS r;