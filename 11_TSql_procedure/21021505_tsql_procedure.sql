USE sqlDB;
GO

CREATE or ALTER PROCEDURE usp_ifelse
	@userName nvarchar(10)
AS
	DECLARE @birthYear int; -- ����⵵ ���� ����
	SELECT @birthYear = birthYear
	FROM userTBL
	WHERE userName = @userName;

	if (@birthYear >= 1980)
		BEGIN
			PRINT '���� ������...';
		END
	ELSE
		BEGIN
			PRINT '���̰� ����...';
		END

GO

exec usp_ifelse '���ȣ';
exec usp_ifelse '�̽±�';