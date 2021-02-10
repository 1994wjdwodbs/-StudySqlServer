use sqlDB;
go

------------------------

CREATE VIEW uv_user177
AS
	SELECT * FROM userTbl WHERE height >= 177;
GO

SELECT * FROM uv_user177;

DELETE FROM uv_user177 WHERE height < 180;

BEGIN TRAN; -- Æ®·£Àè¼Ç

DELETE FROM uv_user177;

ROLLBACK; -- ¿ø»óÅÂ º¹±Í

------------------------

CREATE VIEW uv_buyTbl
AS
	SELECT * FROM buyTbl WHERE groupName = 'ÀüÀÚ';
GO

-- DROP VIEW uv_buyTbl;

SELECT * FROM uv_buyTbl;
INSERT INTO uv_buyTbl VALUES ('KBS', '±âÅ¸', '¾Ç±â', 4000, 1);

BEGIN TRAN; -- Æ®·£Àè¼Ç

DELETE FROM uv_buyTbl;

ROLLBACK; -- ¿ø»óÅÂ º¹±Í