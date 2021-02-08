USE bikeStores;
go

-- '테이블명.XX 명칭'으로 이용하면 다른 DB에서 질의 가능
SELECT * FROM BikeStores.sales.order_items;
SELECT * FROM ShopDB.dbo.memberTbl;

-- sale.order_items 테이블 복사
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
);
-- SELECT 내용을 그대로 INSERT에 이용함 (아이디어, 팁)
-- INSERT INTO ~~ SELECT ** FROM ~~; (단, 테이블 만들고 쓰기)
INSERT INTO sales_order_items
SELECT * FROM BikeStores.sales.order_items;

SELECT * FROM sales_order_items;

-- UPDATE
UPDATE testTBL1 
set userName = '성수경',
	age = 30
WHERE id = 6; -- WHERE을 빼면 모두 UPDATE(수정)되므로 조심!

-- DELETE
DELETE FROM testTBL1 -- WHERE을 빼면 모두 DELETE(삭제)되므로 조심!
where id = 6;


SELECT * FROM BikeStores.sales.customers;
SELECT first_name FROM BikeStores.sales.customers 
WHERE last_name like 'S%' AND state='NY' AND phone IS NOT NULL ORDER BY first_name ASC;

