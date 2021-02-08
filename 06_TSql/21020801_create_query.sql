use tempdb;
go

create database sqlDB;
go

--DB����
use sqlDB;
go

create table userTbl -- ȸ�����̺�
(
	userID CHAR(8) NOT NULL PRIMARY KEY, -- ����ھ��̵�
	userName NVARCHAR(10) NOT NULL, -- �̸�
	birthYear INT NOT NULL, -- ����⵵
	addr NCHAR(2) NOT NULL, -- ����(���, ����, �泲, �λ�, ...)
	mobile1 CHAR(3), -- �޴����� ����(011, 016, 017, ...)
	mobile2 CHAR(8), -- �޴����� ������ ��ȭ��ȣ(������'-' ����)
	height SMALLINT, -- Ű
	mDate DATE -- ȸ�� ������
);
go

CREATE TABLE buyTbl
(
	num INT IDENTITY NOT NULL PRIMARY KEY, -- ����(PK)
	userID CHAR(8) NOT NULL-- ���̵�(FK)
	FOREIGN KEY REFERENCES userTbl(userID),
	prodName NVARCHAR(20) NOT NULL, -- ��ǰ��
	groupName NCHAR(4), -- �з�
	price INT NOT NULL, -- �ܰ�
	amount SMALLINT NOT NULL -- ����
);
go
