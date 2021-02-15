USE sqlDB;
GO

CREATE OR ALTER PROC usp_return
	@userName nvarchar(10)
AS
	DECLARE @userID char(8);
	SELECT @userID = userID
	FROM userTBL
	WHERE userName = @userName;

	IF (@userID <> '') RETURN 1; -- inline if
	ELSE RETURN 0;
GO

DECLARE @retVal int;
EXEC @retVal = usp_return 'ÀºÁö¿ø';
PRINT @retVal;