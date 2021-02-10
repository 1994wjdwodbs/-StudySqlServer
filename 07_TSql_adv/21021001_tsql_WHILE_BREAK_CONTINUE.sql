USE sqlDB;
go

-- WHILE, CONTINUE, BREAK
DECLARE @i int = 1, @hap bigint = 0;

IF @i IS NULL
	BEGIN
		PRINT '@i is NULL';
	END

WHILE (@i <= 100)
BEGIN
	IF (@i % 7 = 0)
		BEGIN
			PRINT CONCAT('7ÀÇ ¹è¼ö :', @i);
		END

	SET @hap = @hap + @i;
	IF(@HAP > 1000) 
		BEGIN 
			BREAK; 
		END
	SET @i = @i + 1;
END

PRINT @hap;