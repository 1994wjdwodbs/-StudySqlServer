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

INSERT INTO bankBook VALUES(N'������', 1000);
INSERT INTO bankBook VALUES(N'�Ǹ���', 0);

--
-- UPDATE bankBook SET uMoney = uMoney + 500 WHERE uName = N'������';
-- UPDATE bankBook SET uMoney = uMoney + 500 WHERE uName = N'�Ǹ���';
--  �Ʒ� Ʈ������̶� ������ ���(����Ʈ)
BEGIN TRAN
	UPDATE bankBook SET uMoney = uMoney - 500 WHERE uName = N'������';
COMMIT TRAN
BEGIN TRAN
	UPDATE bankBook SET uMoney = uMoney + 500 WHERE uName = N'�Ǹ���';
COMMIT TRAN

-- ������ : 500 - 600
-- �Ǹ��� : 500 + 600
-- �߸��� SQL ������ �����ϰ� ó������ �ѹ��ϴ� Ʈ�����
BEGIN TRY
	BEGIN TRAN
		UPDATE bankBook SET uMoney = uMoney - 600 WHERE uName = N'������';
		UPDATE bankBook SET uMoney = uMoney + 600 WHERE uName = N'�Ǹ���';
	COMMIT TRAN
END TRY

BEGIN CATCH
	ROLLBACK TRAN
END CATCH

SELECT * FROM bankBook;