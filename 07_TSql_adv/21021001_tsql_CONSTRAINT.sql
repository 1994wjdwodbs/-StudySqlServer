-- 주의사항 1
use sqlDB;
go

CREATE TABLE testTbl (num int);
DROP TABLE testTbl;

-- 주의사항 2
USE tempdb;
go

DROP database tabledb;
go
CREATE database tabledb;

--
use tabledb;
go
DROP TABLE buyTBL;
DROP TABLE userTBL;
CREATE TABLE userTBL -- 부모 테이블
(
	userID		char(8)			NOT NULL	PRIMARY KEY,	-- 아이디
	userName	nvarchar(10)	NOT NULL,	-- 이름
	birthYear	int				NOT NULL	DEFAULT YEAR(GETDATE()),	-- 출생년도
	addr		nchar(2)		NOT NULL,	-- 지역
	mobile1		char(3)			NULL,		-- 휴대폰 국번
	mobile2		char(8)			NULL,		-- 휴대폰 번호
	height		smallint		NULL,		-- 키
	mDate		date			NULL,		-- 회원가입일
	email		varchar(150)	NOT NULL	UNIQUE, --  이메일 추가 Ex) 210210 14:25
);
CREATE TABLE buyTBL -- 자식 테이블
(
	num			int				NOT NULL	IDENTITY(1, 1)	PRIMARY KEY,	-- 순번(PK)
	userID		char(8)			NOT NULL
	FOREIGN KEY REFERENCES userTBL(userID),	-- 아이디
	prodName	nchar(6)		NOT NULL,	-- 품명
	groupName	nchar(4)		NULL,		-- 분류
	price		int				NOT NULL,	-- 단가
	amount		smallint		NOT NULL	-- 수량
);
