use sqlDB;
go

------------------------

CREATE VIEW uv_user177
AS
	SELECT * FROM userTbl WHERE height >= 177;
GO

SELECT * FROM uv_user177;

DELETE FROM uv_user177 WHERE height < 180;

BEGIN TRAN; -- Ʈ�����

DELETE FROM uv_user177;

ROLLBACK; -- ������ ����

------------------------

CREATE VIEW uv_buyTbl
AS
	SELECT * FROM buyTbl WHERE groupName = '����';
GO

-- DROP VIEW uv_buyTbl;

SELECT * FROM uv_buyTbl;
INSERT INTO uv_buyTbl VALUES ('KBS', '��Ÿ', '�Ǳ�', 4000, 1);

BEGIN TRAN; -- Ʈ�����

DELETE FROM uv_buyTbl;

ROLLBACK; -- ������ ����