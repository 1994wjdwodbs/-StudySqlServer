
-- 임시 테이블
CREATE TABLE #tempTbl (id int, txt nvarchar(10));
CREATE TABLE ##tempTbl (id int, txt nvarchar(10));

INSERT INTO #tempTbl VALUES(1, '지역임시테이블');
INSERT INTO ##tempTbl VALUES(2, '전역임시테이블');

SELECT * FROM #tempTbl;
SELECT * FROM ##tempTbl; 