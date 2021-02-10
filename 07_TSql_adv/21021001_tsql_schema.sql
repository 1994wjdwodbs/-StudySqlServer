-- CREATE SCHEMA
use tempdb;
go

CREATE DATABASE schemaDB;
go
USE schemaDB;
go

CREATE SCHEMA users;
go
CREATE SCHEMA sales;
go
-- CREATE SCHEMA

-- SCHEMA -> CREATE TABLE
CREATE TABLE users.userTBL (id int NOT NULL);
go
CREATE TABLE sales.buyTBL (id int NOT NULL);
go
CREATE TABLE sales.prodTBL (pid int);
go

CREATE TABLE normalTBL (nid int NOT NULL);
go
-- SCHEMA -> CREATE TABLE

SELECT * FROM users.userTBL;
SELECT * FROM sales.buyTBL;
SELECT * FROM dbo.normalTBL;