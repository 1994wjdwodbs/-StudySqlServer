USE sqlDB;
GO

CREATE OR ALTER PROCEDURE plusNew
	@p1 int,
	@p2 int,
	@pout int output
AS
	SELECT @pout = @p1 + @p2;
GO

DECLARE @newResult int;
SET @newResult = 0;
EXEC plusNew 3, 4, @newResult output;

PRINT @newResult;