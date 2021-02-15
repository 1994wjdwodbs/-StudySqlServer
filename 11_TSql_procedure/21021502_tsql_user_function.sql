USE sqlDB;
GO

CREATE OR ALTER FUNCTION ufn_getZodiac
(@birthYear int) RETURNS NCHAR(3)
AS
	BEGIN
		DECLARE @result nchar(3);
		SET @result = 
			CASE
				WHEN (@birthYear % 12 = 0) THEN '원숭이'
				WHEN (@birthYear % 12 = 1) THEN '닭'
				WHEN (@birthYear % 12 = 2) THEN '개'
				WHEN (@birthYear % 12 = 3) THEN '돼지'
				WHEN (@birthYear % 12 = 4) THEN '쥐'
				WHEN (@birthYear % 12 = 5) THEN '소'
				WHEN (@birthYear % 12 = 6) THEN '호랑이'
				WHEN (@birthYear % 12 = 7) THEN '토끼'
				WHEN (@birthYear % 12 = 8) THEN '용'
				WHEN (@birthYear % 12 = 9) THEN '뱀'
				WHEN (@birthYear % 12 = 10) THEN '말'
				WHEN (@birthYear % 12 = 11) THEN '양'
				ELSE '오류'
			END
		RETURN @result;
	END
GO

-- 사용자 정의 함수 사용
SELECT *, dbo.ufn_getAge(birthYear) AS '나이', dbo.ufn_getZodiac(birthYear) AS '생년 띠'
FROM userTbl;
