USE sqlDB;
GO

-- (저장) 프로시저 생성
-- CREATE PROCEDURE usp_users
-- AS
--	SELECT * FROM userTBL;
-- GO

-- 프로시저 생성 OR 수정
CREATE OR ALTER PROCEDURE usp_users
AS
	SELECT userID, userName, birthYear FROM userTBL;
GO

EXEC usp_users;
DROP PROCEDURE usp_users;