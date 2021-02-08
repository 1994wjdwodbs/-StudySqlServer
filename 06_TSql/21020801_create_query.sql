use tempdb;
go

create database sqlDB;
go

--DB생성
use sqlDB;
go

create table userTbl -- 회원테이블
(
	userID CHAR(8) NOT NULL PRIMARY KEY, -- 사용자아이디
	userName NVARCHAR(10) NOT NULL, -- 이름
	birthYear INT NOT NULL, -- 출생년도
	addr NCHAR(2) NOT NULL, -- 지역(경기, 서울, 경남, 부산, ...)
	mobile1 CHAR(3), -- 휴대폰의 국번(011, 016, 017, ...)
	mobile2 CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈'-' 제외)
	height SMALLINT, -- 키
	mDate DATE -- 회원 가입일
);
go

CREATE TABLE buyTbl
(
	num INT IDENTITY NOT NULL PRIMARY KEY, -- 순번(PK)
	userID CHAR(8) NOT NULL-- 아이디(FK)
	FOREIGN KEY REFERENCES userTbl(userID),
	prodName NVARCHAR(20) NOT NULL, -- 물품명
	groupName NCHAR(4), -- 분류
	price INT NOT NULL, -- 단가
	amount SMALLINT NOT NULL -- 수량
);
go
