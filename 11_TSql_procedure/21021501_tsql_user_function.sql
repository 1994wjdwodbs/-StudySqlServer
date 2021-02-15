-- SELECT COUNT(*)
-- FROM userTbl;

-- SELECT SUM(price) FROM buyTbl;

-- SELECT mobile1, AVG(height) FROM userTbl
-- GROUP BY mobile1;

-- 사용자 정의 함수
CREATE OR ALTER FUNCTION ufn_getAge
(@birthYear int) RETURNS int
AS
	BEGIN
		DECLARE @age int;
		SET @age = year(GETDATE()) - @birthYear + 1;

		RETURN @age;
	END

GO

SELECT *, dbo.ufn_getAge(birthYear) AS 나이
FROM userTbl;