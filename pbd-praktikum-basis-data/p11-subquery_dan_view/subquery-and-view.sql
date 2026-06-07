--Gunakan subquery untuk menampilkan data-data berikut (database CUSTOMERS ORDER):
--1. Tampilkan data barang yang memiliki harga paling minimal!
SELECT * FROM products
WHERE list_price = (SELECT MIN(list_price) FROM products);

--2. Tampilkan data pembelian yang memiliki jumlah pembelian diatas rata-rata!
SELECT * FROM orders
WHERE
    order_id IN (
        SELECT order_id FROM order_items
        GROUP BY order_id
        HAVING
            COUNT(item_id) > (
                SELECT AVG(COUNT(item_id)) FROM order_items
                GROUP BY order_id
            )
    )
ORDER BY order_id;

--3. Tampilkan data pembelian untuk data barang yang memiliki harga paling maksimal (paling tinggi)!
SELECT * FROM orders
WHERE
    order_id IN (
        SELECT order_id FROM order_items
        WHERE
            product_id IN (
                SELECT product_id FROM products
                WHERE list_price = (SELECT MAX(list_price) FROM products)
            )
    )
ORDER BY order_id;

--4. Tampilkan data pembelian untuk barang yang kategorinya 'CPU'!
SELECT *
FROM orders
WHERE
    order_id IN (
        SELECT order_id FROM order_items
        WHERE
            product_id IN (
                SELECT product_id FROM products
                WHERE
                    category_id = (
                        SELECT category_id FROM product_categories
                        WHERE category_name = 'CPU'
                    )
            )
    )
ORDER BY order_id;


--5. Tampilkan data barang yang pernah dibeli lebih dari satu kali!
SELECT * FROM products
WHERE
    product_id IN (
        SELECT product_id FROM order_items
        GROUP BY product_id
        HAVING COUNT(order_id) > 1
    )
ORDER BY product_id;









--Kerjakan perintah berikut:
--1a. Buatlah VIEW sederhana untuk data barang yang hanya berisi data kode barang, nama barang, dan satuan barang!
CREATE OR REPLACE VIEW v_products AS
SELECT
    p.product_id,
    p.product_name,
    pc.category_name product_category
FROM products p, product_categories pc
WHERE p.category_id = pc.category_id;

--1b. Gunakan VIEW yang sudah dibuat untuk menampilkan data kode barang, nama, dan satuan!
SELECT * FROM v_products;










--2a. Buatlah VIEW kompleks untuk mempermudah akses terhadap informasi yang sering diakses!
CREATE VIEW v_order_summary AS
SELECT
    o.order_id,
    o.order_date,
    o.status,
    c.name                                    AS customer_name,
    e.first_name || ' ' || e.last_name        AS salesman_name,
    COUNT(oi.item_id)                         AS total_items,
    SUM(oi.quantity * oi.unit_price)          AS total_amount
FROM
    orders o
    JOIN customers   c  ON o.customer_id  = c.customer_id
    JOIN employees   e  ON o.salesman_id  = e.employee_id
    JOIN order_items oi ON o.order_id     = oi.order_id
GROUP BY
    o.order_id, o.order_date, o.status,
    c.name,
    e.first_name, e.last_name;

--2b. Gunakan VIEW yang telah dibuat untuk menampilkan 2 informasi yang berbeda!
-- Informasi 1: order dengan status 'Pending' beserta total nilainya
SELECT order_id, order_date, customer_name, salesman_name, total_amount
FROM v_order_summary
WHERE status = 'Pending'
ORDER BY total_amount DESC;

-- Informasi 2: top 5 salesman berdasarkan total revenue
SELECT
    salesman_name,
    COUNT(order_id)      AS total_orders,
    SUM(total_amount)    AS total_revenue
FROM v_order_summary
GROUP BY salesman_name
ORDER BY total_revenue DESC
FETCH FIRST 5 ROWS ONLY;



--3a. Ubah VIEW dengan menambahkan batasan sehingga data pada view hanya dapatdilihat dan tidak dapat diubah atau dihapus! Fungsinya bebas. Contohnya dapat menunjukkan data barang yang stoknya kurang dari 20, menunjukkan data pegawai yang menangani order, dst
CREATE OR REPLACE VIEW v_low_stock AS
SELECT
    p.product_id,
    p.product_name,
    w.warehouse_name,
    i.quantity
FROM
    inventories i
    JOIN products   p ON i.product_id   = p.product_id
    JOIN warehouses w ON i.warehouse_id = w.warehouse_id
WHERE i.quantity < 20
WITH READ ONLY;



--3b. Tunjukkan bahwa batasan yang diberikan berhasil!
-- Percobaan INSERT
INSERT INTO v_low_stock (product_id, warehouse_name, quantity)
VALUES (999, 'Test Warehouse', 5);

-- Percobaan UPDATE
UPDATE v_low_stock SET quantity = 100 WHERE product_id = 1;









