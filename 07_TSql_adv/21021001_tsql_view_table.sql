use sqlDB;
go

CREATE VIEW uv_userTBL
AS
	SELECT userID, userName, addr FROM userTBL;
go

SELECT * 
FROM uv_userTBL
WHERE userID = 'LSG';

