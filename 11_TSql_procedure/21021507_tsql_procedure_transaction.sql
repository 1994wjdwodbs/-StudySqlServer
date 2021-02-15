USE sqlDB;
GO

CREATE or ALTER PROCEDURE usp_error
	@userID char(8),
	@userName nvarchar(10),
	@birthYear int = 1900,
	@addr nchar(2) = '����',
	@mobile1 char(3) = NULL,
	@mobile2 char(8) = NULL,
	@height smallint = 170,
	@mDate date = '2021-02-15'
AS
	DECLARE @err int;
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO userTbl VALUES
			(@userID
			,@userName
			,@birthYear
			,@addr
			,@mobile1
			,@mobile2
			,@height
			,@mDate);
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT @err = ERROR_NUMBER();
		ROLLBACK
	END CATCH

	IF @err != 0
		BEGIN
			PRINT '###' + @userName + '=> INSERT�� �����߽��ϴ�.';
		END	

		PRINT CONCAT('������ȣ : ', @err);

	RETURN @err; -- ���� ��ȣ ������
GO

EXEC usp_error 'WDT', '�����', 1988, '�λ�', '019', '99990024', 190, '2021-02-14';
