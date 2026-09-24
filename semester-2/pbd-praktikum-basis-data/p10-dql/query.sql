--1. Tampilkan data customer yang belum pernah melakukan pembelian!
--2. Tampilkan berapa total order yang sudah dilakukan!
--3. Tampilkan berapa nilai rata-rata order quantity!
--4. Tampilkan data total order dikelompokkan berdasarkan produk-nya (PRODUCT NAME, total_order_quantity) khusus untuk PRODUK yang mengandung kata 'INTEL' atau 'AMD'!
--5. Tampilkan total nilai pesanan tertinggi untuk tiap pelanggan (id_customer, max_order)!
--6. Tampilkan total nilai pesanan tertinggi untuk tiap pelanggan (id_customer, full_name, max_order)!
--7. Tampilkan jumlah order yang terjadi tiap tahun!

SELECT
    EXTRACT(YEAR FROM order_date) order_year,
    COUNT(order_id)               order_count
FROM
    orders
GROUP BY
    EXTRACT(YEAR FROM order_date)
ORDER BY
    order_year;

--8. Tampilkan tahun dengan jumlah order tertinggi!

SELECT
    EXTRACT(YEAR FROM order_date) order_year,
    COUNT(order_id) order_count
FROM orders
GROUP BY
    EXTRACT(YEAR FROM order_date)
ORDER BY
     order_count DESC
FETCH FIRST 1 ROWS ONLY
;

--9. Tampilkan data customer yang telah melakukan order lebih dari 2x!
--10. Tampilkan data produk yang memiliki rata-rata quantity pada pemesanan lebih dari 5!