EXEC sp_helpdb;
go
-- 悼利 孽府
DECLARE @sql VARCHAR(100);
set @sql = 'SELECT * FROM userTbl where UserID =''EJW''';
exec(@sql);
-- 悼利 孽府