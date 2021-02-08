USE bikeStores;
go

-- '���̺��.XX ��Ī'���� �̿��ϸ� �ٸ� DB���� ���� ����
SELECT * FROM BikeStores.sales.order_items;
SELECT * FROM ShopDB.dbo.memberTbl;

-- sale.order_items ���̺� ����
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL
);
-- SELECT ������ �״�� INSERT�� �̿��� (���̵��, ��)
-- INSERT INTO ~~ SELECT ** FROM ~~; (��, ���̺� ����� ����)
INSERT INTO sales_order_items
SELECT * FROM BikeStores.sales.order_items;

SELECT * FROM sales_order_items;

-- UPDATE
UPDATE testTBL1 
set userName = '������',
	age = 30
WHERE id = 6; -- WHERE�� ���� ��� UPDATE(����)�ǹǷ� ����!

-- DELETE
DELETE FROM testTBL1 -- WHERE�� ���� ��� DELETE(����)�ǹǷ� ����!
where id = 6;


SELECT * FROM BikeStores.sales.customers;
SELECT first_name FROM BikeStores.sales.customers 
WHERE last_name like 'S%' AND state='NY' AND phone IS NOT NULL ORDER BY first_name ASC;

