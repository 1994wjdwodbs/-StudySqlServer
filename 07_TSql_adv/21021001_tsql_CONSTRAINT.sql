-- ���ǻ��� 1
use sqlDB;
go

CREATE TABLE testTbl (num int);
DROP TABLE testTbl;

-- ���ǻ��� 2
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
CREATE TABLE userTBL -- �θ� ���̺�
(
	userID		char(8)			NOT NULL	PRIMARY KEY,	-- ���̵�
	userName	nvarchar(10)	NOT NULL,	-- �̸�
	birthYear	int				NOT NULL	DEFAULT YEAR(GETDATE()),	-- ����⵵
	addr		nchar(2)		NOT NULL,	-- ����
	mobile1		char(3)			NULL,		-- �޴��� ����
	mobile2		char(8)			NULL,		-- �޴��� ��ȣ
	height		smallint		NULL,		-- Ű
	mDate		date			NULL,		-- ȸ��������
	email		varchar(150)	NOT NULL	UNIQUE, --  �̸��� �߰� Ex) 210210 14:25
);
CREATE TABLE buyTBL -- �ڽ� ���̺�
(
	num			int				NOT NULL	IDENTITY(1, 1)	PRIMARY KEY,	-- ����(PK)
	userID		char(8)			NOT NULL
	FOREIGN KEY REFERENCES userTBL(userID),	-- ���̵�
	prodName	nchar(6)		NOT NULL,	-- ǰ��
	groupName	nchar(4)		NULL,		-- �з�
	price		int				NOT NULL,	-- �ܰ�
	amount		smallint		NOT NULL	-- ����
);
