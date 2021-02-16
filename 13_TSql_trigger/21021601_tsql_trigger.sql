USE sqlDB;
go

ALTER TRIGGER trg_testtbl
on testtbl2
AFTER INSERT, DELETE, UPDATE -- 삭제, 수정할 때 트리거 발생
AS
	PRINT '새로운 트리거 발생';

INSERT INTO testtbl2 VALUES('BTS');
SELECT * FROM testtbl2 WHERE txt='마마무';
UPDATE testtbl2 set txt = '마마무뉴!' WHERE id = 2;