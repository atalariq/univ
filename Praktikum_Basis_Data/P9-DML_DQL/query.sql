--1. Tampilkan nama customer yang status ordernya pending!

DESCRIBE orders;
DESCRIBE customers;

SELECT DISTINCT name
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.status = 'Pending';

--2. Tampilkan jumlah customer yang ada di database!
SELECT COUNT(*) FROM customers;


--3. Tampilkan nama-nama produk yang ada di kategori CPU!

DESCRIBE products;
DESCRIBE product_categories;

SELECT DISTINCT product_name
FROM products
INNER JOIN product_categories ON products.category_id = product_categories.category_id
WHERE category_name = 'CPU';


--4. Tampilkan jumlah produk yang ada di kategori CPU!

SELECT COUNT(*)
FROM products
INNER JOIN product_categories ON products.category_id = product_categories.category_id
WHERE category_name = 'CPU';


--5. Tampilkan nama kota dan nama gudang yang ada di kota tersebut!

DESCRIBE warehouses;
DESCRIBE locations;
DESCRIBE countries;
DESCRIBE regions;

SELECT city, warehouse_name
FROM warehouses w
INNER JOIN locations l ON w.location_id = l.location_id;

--6. Tampilkan nama produk yang tersedia di gudang Toronto!

DESCRIBE inventories;

SELECT product_name
FROM inventories i
INNER JOIN products p ON i.product_id = p.product_id
INNER JOIN warehouses w ON i.warehouse_id = w.warehouse_id
WHERE warehouse_name = 'Toronto';

--7. Tampilkan jumlah orderan yang sudah dilayani Blake Cooper!

DESCRIBE employees;
DESCRIBE orders;

SELECT COUNT(*)
FROM orders o
INNER JOIN employees e ON o.salesman_id = e.employee_id
WHERE e.first_name = 'Blake' AND e.last_name = 'Cooper';




















