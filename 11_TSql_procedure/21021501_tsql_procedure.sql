USE sqlDB;
GO

-- (����) ���ν��� ����
-- CREATE PROCEDURE usp_users
-- AS
--	SELECT * FROM userTBL;
-- GO

-- ���ν��� ���� OR ����
CREATE OR ALTER PROCEDURE usp_users
AS
	SELECT userID, userName, birthYear FROM userTBL;
GO

EXEC usp_users;
DROP PROCEDURE usp_users;