USE [sqlDB]
GO

BEGIN TRY
	BEGIN TRAN

	INSERT INTO [dbo].[userTbl]
			   ([userID]
			   ,[userName]
			   ,[birthYear]
			   ,[addr]
			   ,[mobile1]
			   ,[mobile2]
			   ,[height]
			   ,[mDate])
		 VALUES
			   ('GJY'
			   ,'������'
			   ,1988
			   ,'����'
			   ,'010'
			   ,'98989898'
			   ,175
			   ,GETDATE());

	INSERT INTO [dbo].[buyTbl]
			   ([userID]
			   ,[prodName]
			   ,[groupName]
			   ,[price]
			   ,[amount])
		 VALUES
			   ('GGY'
			   ,'���۶�'
			   ,NULL
			   ,80000000
			   ,1);

	-- ROLLBACK
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN
END CATCH

GO


