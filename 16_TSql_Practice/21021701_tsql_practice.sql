-- 실제 회원정보 불러오기 (레밸 내림차순, 이름 오름차순) --
SELECT memberID, memberName, levels, mobile, email
FROM memberTBL
WHERE levels != 'S'
ORDER BY levels DESC, memberName ASC;

-- 책 정보 --
SELECT cateIdx, bookName, author, interpreter, company, price 
FROM booksTBL
ORDER BY price DESC;

-- 시스템 함수 사용 쿼리 --
SELECT memberID, 
	   CONCAT(RIGHT(memberName, 2), ', ', LEFT(memberName, 1)) AS '미국식이름', 
	   dbo.unf_getLevel(levels) AS '회원레벨', -- 정의해놓고 쿼리문만 지우기 (SQL문에 CREATE, SELECT 동시에 쓰면 빨간줄 나옴)
	   mobile, 
	   UPPER(email) AS '이메일'
FROM memberTBL
WHERE levels != 'S'
ORDER BY levels, memberName;

-- 책 정보, 시스템 함수, 포맷 함수 쿼리 --
SELECT bookIdx 
     , cateIdx 
     , CONCAT(N'책제목 > ', bookName) AS bookName 
     , author 
     , COALESCE(interpreter, '(역자없음)') AS '번역가'
     , company 
     , FORMAT(releaseDate, 'yyyy년 mm월 dd일') AS '출판일' 
     , FORMAT(price,'#,#원') AS '가격' 
  FROM booksTBL;

-- 책정보 조인 --
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

-- 대여된 책의 정보 쿼리 조인
SELECT  r.rentalIdx 
      , m.memberName 
      --, r.bookIdx 
	  , b.bookName
	  , b.author
	  , FORMAT(r.rentalDt, 'yyyy-MM-dd') AS '대여일'
	  , FORMAT(r.returnDt, 'yyyy-MM-dd') AS '반납일'
	  , dbo.ufn_getState(r.rentalState) AS '대여상태'
  FROM  dbo.rentalTBL AS r
  JOIN booksTBL AS b ON (r.bookIdx = b.bookIdx)
  RIGHT JOIN memberTBL As m ON (r.memberIdx = m.memberIdx)
  WHERE rentalIdx IS NULL;

  -- 우리 책 대여점에 없는 소설 장르
  SELECT c.cateIdx, c.cateName, b.bookName
  FROM cateTBL AS c
  LEFT JOIN booksTBL AS b ON (c.cateIdx = b.cateIdx);