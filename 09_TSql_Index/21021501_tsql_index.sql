use sqlDB;
go

CREATE TABLE indexTBL (
	a int NOT NULL PRIMARY KEY,
	b int UNIQUE,
	c int NOT NULL UNIQUE,
	d int
);

CREATE TABLE indexTBL2 (
	a int NOT NULL UNIQUE,
	b int UNIQUE,
	c int NOT NULL UNIQUE,
	d int
);