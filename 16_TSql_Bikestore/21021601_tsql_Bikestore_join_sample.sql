USE bikeStores;
GO

SELECT p.product_id, p.product_name, /*p.brand_id*/ b.brand_name, 
	 /*p.category_id,*/ ct.category_name, 
	   p.model_year, FORMAT(p.list_price, '$#,#.00') AS list_price
FROM production.products AS p
JOIN production.categories AS ct ON (p.category_id = ct.category_id)
JOIN production.brands AS b ON (p.brand_id = b.brand_id);

SELECT od.order_id, CONCAT(ct.first_name, ' ', ct.last_name) AS full_name,
	   CASE od.order_status
		WHEN 1 THEN '�ֹ��Ϸ�'
		WHEN 2 THEN '�����Ϸ�'
		WHEN 3 THEN '�����'
		WHEN 4 THEN '��ۿϷ�'
		ELSE '�̻����'
	   END AS '�ֹ��ܰ�', 
	   od.order_status, 
	   od.order_date, od.required_date, od.shipped_date, od.store_id, sr.store_name, od.staff_id,
	   CONCAT(st.first_name, ' ', st.last_name) AS staff_name
FROM sales.orders AS od
JOIN sales.customers AS ct ON (od.customer_id = ct.customer_id)
JOIN sales.staffs AS st ON (od.staff_id = st.staff_id)
JOIN sales.stores AS sr ON (od.store_id = sr.store_id);