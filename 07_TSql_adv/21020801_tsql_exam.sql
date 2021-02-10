use sqlDB;
go

DECLARE @myVar1 int;
DECLARE @myVar2 smallint, @myVar3 decimal(3, 2);
DECLARE @myVar4 char(20);
SELECT @@VERSION;

-- CONVERT : 형 변환 함수
SELECT CONVERT(float, amount) FROM buyTbl;
SELECT AVG(CONVERT(float, amount)) AS '평균구매대수' FROM buyTbl;

SELECT price, amount, (price/amount) AS '[단가/수량]' FROM buyTbl;
SELECT price, amount, TRY_CONVERT(float, (price/amount)) AS '[단가/수량]' FROM buyTbl;

-- PARSE : 문자열 변환 함수
SELECT '2021년 2월9일';
SELECT CONVERT(date, '2021년 2월 9일');

SELECT PARSE('2021년 2월 9일' as date); 
SELECT TRY_PARSE('2021년 2월 49일' as date); -- 오류 시 NULL로 반환

-- PARSE vs CONVERT
-- SELECT PARSE('123.45' AS int);
-- SELECT TRY_PARSE('123.45' AS int);
SELECT CONVERT(float, '123.45');
SELECT PARSE('123.45' AS float);

-- CAST : 형 변환 함수
SELECT CAST('123.45' AS float);

-- 암시적 형 변환
DECLARE @myVar5 tinyint;

-- 스칼라 함수 (단일 리턴 함수)
SELECT GETDATE() AS '현재 날짜';
SELECT YEAR(GETDATE()) AS '금년', MONTH(GETDATE()) AS '이번달', DAY(GETDATE()) AS '오늘일';

SELECT ABS(-100);

SELECT ROUND(3.1415, 3);
SELECT ROUND(1236.5678, -1);

SELECT CAST((RAND() * 100) AS int);

SELECT IIF(20 < 10, '참', '거짓');

-- 문자열 함수
SELECT ASCII('a'), ASCII('A');
SELECT CHAR(98), CHAR(66);
SELECT UNICODE('난');
SELECT UNICODE('ㄴ'), UNICODE('ㅏ'), UNICODE('ㄴ');
SELECT NCHAR(45212);

-- 활용도 높은 예시
SELECT CONCAT('SQL', ' SERVER ', 2019);
-- 문자열 시작위치 리턴(DB INDEX : 1부터 시작)
SELECT CHARINDEX('Server', 'SQL Server 2019');
-- LEFT, RIGHT
SELECT LEFT('SQL Server 2019', 3), RIGHT('SQL Server 2019', 4);
-- SUBSTRING
SELECT SUBSTRING('Hello World', 7, 5);
SELECT SUBSTRING('안녕하세요, SQL서버입니다!', 11, 2);
-- LEN
SELECT LEN('안녕하세요'), LEN('Hello World!');
-- LOWER, UPPER
SELECT LOWER('abcDEF'), UPPER('hijKLM');
-- LTRIM, RTRIM
SELECT LEN(LTRIM('   Hello World!   ')),
	   LEN(RTRIM('   Hello World!   ')),
	   LEN(TRIM('   Hello World!   '));

SELECT REPLACE('SQL Server 2016', '2016', '2019');

-- FORMAT, 많이 쓰는 함수
SELECT FORMAT(GETDATE(), '');
SELECT FORMAT(GETDATE(), 'dd/MM/yyyy'); -- 일/월/년
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd hh:mm:ss:ms');
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd');
SELECT FORMAT(GETDATE(), 'hh:mm:ss');

-- JSON 형식 {'key':'value'}
-- USE sqlDB; 
-- go
SELECT userName, height FROM userTbl
WHERE height >= 180
FOR JSON AUTO;

DECLARE @JSON VARCHAR(MAX);
SET @JSON=N' {"userTbl":
						 [
						  {"userName":"임재범","height":182},
						  {"userName":"이승기","height":182},
						  {"userName":"성시경","height":186}
						 ]
			 }'; 
SELECT ISJSON(@json);
SELECT JSON_QUERY(@json, '$.userTbl[0]');
SELECT JSON_VALUE(@json, '$.userTbl[0].name');
SELECT * FROM OPENJSON(@json, '$.userTbl');
SELECT * FROM OPENJSON(@json, '$.userTbl')
WITH (
		userName NCHAR(8) '$.userName',
		height INT '$.height' );