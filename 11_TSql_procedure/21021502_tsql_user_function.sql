USE sqlDB;
GO

CREATE OR ALTER FUNCTION ufn_getZodiac
(@birthYear int) RETURNS NCHAR(3)
AS
	BEGIN
		DECLARE @result nchar(3);
		SET @result = 
			CASE
				WHEN (@birthYear % 12 = 0) THEN '������'
				WHEN (@birthYear % 12 = 1) THEN '��'
				WHEN (@birthYear % 12 = 2) THEN '��'
				WHEN (@birthYear % 12 = 3) THEN '����'
				WHEN (@birthYear % 12 = 4) THEN '��'
				WHEN (@birthYear % 12 = 5) THEN '��'
				WHEN (@birthYear % 12 = 6) THEN 'ȣ����'
				WHEN (@birthYear % 12 = 7) THEN '�䳢'
				WHEN (@birthYear % 12 = 8) THEN '��'
				WHEN (@birthYear % 12 = 9) THEN '��'
				WHEN (@birthYear % 12 = 10) THEN '��'
				WHEN (@birthYear % 12 = 11) THEN '��'
				ELSE '����'
			END
		RETURN @result;
	END
GO

-- ����� ���� �Լ� ���
SELECT *, dbo.ufn_getAge(birthYear) AS '����', dbo.ufn_getZodiac(birthYear) AS '���� ��'
FROM userTbl;
