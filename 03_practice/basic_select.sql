/*
SELECT memberId, memberName FROM memberTbl
WHERE memberId like 'h%';
*/

USE BikeStores;

SELECT * FROM sales.customers;
SELECT * FROM production.products;
 
-- DB 조회
exec sp_helpdb;
-- TABLE 조회
exec sp_tables @table_type = "'table'";
-- 열이름 조회
exec sp_columns  @table_name = 'stocks'
				,@table_owner = 'production';