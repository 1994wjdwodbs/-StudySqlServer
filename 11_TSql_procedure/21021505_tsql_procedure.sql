USE sqlDB;
GO

CREATE or ALTER PROCEDURE usp_ifelse
	@userName nvarchar(10)
AS
	DECLARE @birthYear int; -- 출생년도 저장 변수
	SELECT @birthYear = birthYear
	FROM userTBL
	WHERE userName = @userName;

	if (@birthYear >= 1980)
		BEGIN
			PRINT '아직 젊군요...';
		END
	ELSE
		BEGIN
			PRINT '나이가 지긋...';
		END

GO

exec usp_ifelse '김경호';
exec usp_ifelse '이승기';