USE sqlDB;
GO

-- Ŀ��(CURSOR) --
DECLARE cur_usertbl CURSOR GLOBAL
FOR SELECT height FROM usertbl;

OPEN cur_usertbl;

DECLARE @height smallint; -- ȸ�� Ű ��� ����
DECLARE @cnt int = 0; -- ȸ�� ��(���� ��(���ڵ� or Ʃ��) ��)
DECLARE @totalHeight int = 0;

FETCH NEXT FROM cur_usertbl INTO @height;
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @height
	IF @height <> ' ' -- NULL
		BEGIN
			SET @cnt += 1;
			SET @totalHeight += @height;
		END	
	ELSE
		BEGIN
			PRINT 'ELSE'
		END
	FETCH NEXT FROM cur_usertbl INTO @height;
	PRINT @@FETCH_STATUS;
END

CLOSE cur_usertbl;
PRINT @totalHeight;
print @cnt;
PRINT concat('ȸ�� Ű ��� : ', @totalHeight / @cnt);

-- ���� SQL ���� --
SELECT SUM(height)/COUNT(*) AS 'ȸ�� Ű ���'
FROM userTbl
WHERE height IS NOT NULL;