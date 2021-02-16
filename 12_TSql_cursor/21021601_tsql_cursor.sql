USE sqlDB;
GO

-- 커서(CURSOR) --
DECLARE cur_usertbl CURSOR GLOBAL
FOR SELECT height FROM usertbl;

OPEN cur_usertbl;

DECLARE @height smallint; -- 회원 키 담는 변수
DECLARE @cnt int = 0; -- 회원 수(읽은 행(레코드 or 튜플) 수)
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
PRINT concat('회원 키 평균 : ', @totalHeight / @cnt);

-- 동일 SQL 구문 --
SELECT SUM(height)/COUNT(*) AS '회원 키 평균'
FROM userTbl
WHERE height IS NOT NULL;