USE sqlDB;
GO

CREATE TRIGGER trg_backupUsertbl
ON userTBL
AFTER UPDATE, DELETE
AS
	DECLARE @modType nchar(2);
	if (COLUMNS_UPDATED() > 0) -- 업데이트
		BEGIN
			SET @modType = '수정';
		END
	ELSE
		BEGIN
			SET @modType = '수정';
		END

	INSERT INTO backup_usertbl
	SELECT [userID]
      ,[userName]
      ,[birthYear]
      ,[addr]
      ,[mobile1]
      ,[mobile2]
      ,[height]
      ,[mDate]
	  ,@modType
	  ,GETDATE()
	  ,USER_NAME()
	  FROM DELETED;

GO