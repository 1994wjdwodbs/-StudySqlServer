USE sqlDB;
go

ALTER TRIGGER trg_testtbl
on testtbl2
AFTER INSERT, DELETE, UPDATE -- ����, ������ �� Ʈ���� �߻�
AS
	PRINT '���ο� Ʈ���� �߻�';

INSERT INTO testtbl2 VALUES('BTS');
SELECT * FROM testtbl2 WHERE txt='������';
UPDATE testtbl2 set txt = '��������!' WHERE id = 2;