USE sqlDB;
GO

CREATE OR ALTER PROCEDURE usp_buyproduct
	@userID char(8)
AS
	SELECT num, userID, prodName, (price * amount) AS '���űݾ�'
	FROM buyTbl
	WHERE userID = @userID;
GO

exec usp_buyproduct 'BBK';