use temp2db;
go

CREATE TABLE bankBook
(
	uName NVARCHAR(10),
	uMoney INT,
	CONSTRAINT CK_money
	CHECK (uMoney >= 0)
);
GO

INSERT INTO bankBook VALUES(N'구매자', 1000);
INSERT INTO bankBook VALUES(N'판매자', 0);

--
-- UPDATE bankBook SET uMoney = uMoney + 500 WHERE uName = N'구매자';
-- UPDATE bankBook SET uMoney = uMoney + 500 WHERE uName = N'판매자';
--  아래 트랜잭션이랑 동일한 결과(디폴트)
BEGIN TRAN
	UPDATE bankBook SET uMoney = uMoney - 500 WHERE uName = N'구매자';
COMMIT TRAN
BEGIN TRAN
	UPDATE bankBook SET uMoney = uMoney + 500 WHERE uName = N'판매자';
COMMIT TRAN

-- 구매자 : 500 - 600
-- 판매자 : 500 + 600
-- 잘못된 SQL 구문을 인지하고 처음으로 롤백하는 트랜잭션
BEGIN TRY
	BEGIN TRAN
		UPDATE bankBook SET uMoney = uMoney - 600 WHERE uName = N'구매자';
		UPDATE bankBook SET uMoney = uMoney + 600 WHERE uName = N'판매자';
	COMMIT TRAN
END TRY

BEGIN CATCH
	ROLLBACK TRAN
END CATCH

SELECT * FROM bankBook;