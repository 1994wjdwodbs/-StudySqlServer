use sqlDB;
go

DECLARE @myVar1 int;
DECLARE @myVar2 smallint, @myVar3 decimal(3, 2);
DECLARE @myVar4 char(20);

SET @myVar1 = 154234521;
SET @myVar2 = 32767;
SET @myVar3 = 3.14;
SET @myVar4 = '���� �̸�==>';

SELECT @myVar1;
SELECT @myVar2;
SELECT @myVar3 + @myVar2;
SELECT @myVar4 AS '�ӽ�', userName FROM userTbl WHERE height > 180;

DECLARE @myVar5 tinyint;
SET @myVar5 = 3;
SELECT TOP(@myVar5) userName, height FROM userTbl ORDER BY height DESC;