EXEC sp_helpdb;
go
-- ���� ����
DECLARE @sql VARCHAR(100);
set @sql = 'SELECT * FROM userTbl where UserID =''EJW''';
exec(@sql);
-- ���� ����