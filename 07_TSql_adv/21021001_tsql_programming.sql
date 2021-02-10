-- SQL Programming

-- IF...ELSE
DECLARE @var1 int;
SET @var1 = 100;

IF @var1 = 100
	BEGIN
		PRINT '@var(Val) is 100';
	END
ELSE
	BEGIN
		PRINT '@var(Val) is not 100';
	END

DECLARE @year int;
SET @year = 1980;

IF @year >= 1980
	BEGIN
		SELECT * 
		FROM userTbl 
		WHERE birthYear >= @year;
	END
ELSE
	BEGIN
		PRINT 'Can''t Search!';
	END
-- IF...ELSE

-- CASE
DECLARE @point int, @credit char(1);
SET @point = 99; -- 99점

SET @credit =
	CASE
		WHEN (@point >= 90) THEN 'A'
		WHEN (@point >= 90) THEN 'B'
		WHEN (@point >= 90) THEN 'C'
		WHEN (@point >= 90) THEN 'D'
		ELSE 'F'
	END

PRINT N'취득점수 : ' + CAST(@point AS CHAR(2))
PRINT N'학점     : ' + @credit
-- CASE