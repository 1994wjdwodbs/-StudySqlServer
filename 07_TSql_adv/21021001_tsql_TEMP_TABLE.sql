
-- �ӽ� ���̺�
CREATE TABLE #tempTbl (id int, txt nvarchar(10));
CREATE TABLE ##tempTbl (id int, txt nvarchar(10));

INSERT INTO #tempTbl VALUES(1, '�����ӽ����̺�');
INSERT INTO ##tempTbl VALUES(2, '�����ӽ����̺�');

SELECT * FROM #tempTbl;
SELECT * FROM ##tempTbl; 