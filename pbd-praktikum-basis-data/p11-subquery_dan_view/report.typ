#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#show: report.with(
  use-cover: false,
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: none)

#let img(path, ..args) = image-wrapper(read(path, encoding: none), ..args)

== Subquery

=== Nomor 1

Ditampilkan data barang yang memiliki harga paling minimal dari tabel `products`. _Subquery_ pada klausa `WHERE` digunakan untuk mendapatkan nilai minimum kolom `list_price`, yang kemudian dijadikan kondisi penyaring pada _query_ utama.

#code(```sql
SELECT * FROM products
WHERE list_price = (SELECT MIN(list_price) FROM products);
```)

#img("assets/1.1.png", caption: [Hasil _query_ menampilkan data barang dengan harga paling minimal pada tabel `products`.])

Fungsi agregat `MIN()` mengembalikan satu nilai skalar sehingga operator perbandingan `=` dapat digunakan secara langsung. Seluruh baris pada tabel `products` yang nilai `list_price`-nya sama dengan nilai minimum tersebut ditampilkan sebagai hasil.

=== Nomor 2

Ditampilkan data pembelian yang memiliki jumlah item di atas rata-rata. _Subquery_ bertingkat digunakan: lapisan terdalam menghitung rata-rata jumlah item per order, lapisan tengah menyaring `order_id` yang melampaui rata-rata tersebut, dan _query_ luar mengambil data dari tabel `orders`.

#code(```sql
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
```)

#img("assets/1.2.png", caption: [Hasil _query_ menampilkan data pembelian dengan jumlah item di atas rata-rata.])

Penggunaan `AVG(COUNT(...))` sebagai _scalar subquery_ merupakan agregasi berlapis yang didukung Oracle. Klausa `HAVING` membandingkan jumlah item tiap order terhadap nilai rata-rata tersebut, sehingga hanya order dengan jumlah item di atas rata-rata yang lolos.

=== Nomor 3

Ditampilkan data pembelian yang mengandung barang dengan harga tertinggi. _Subquery_ tiga lapis digunakan: lapisan terdalam mendapatkan `MAX(list_price)`, lapisan kedua mencari `product_id` yang sesuai, lapisan ketiga mengambil `order_id` dari `order_items`, dan _query_ luar mengambil data order.

#code(```sql
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
```)

#img("assets/1.3.png", caption: [Hasil _query_ menampilkan data pembelian yang memuat barang dengan harga paling maksimal.])

Operator `IN` digunakan pada lapisan kedua (bukan `=`) untuk mengantisipasi kemungkinan lebih dari satu produk memiliki harga yang sama-sama maksimal, sehingga tidak ada data yang terlewat.

=== Nomor 4

Ditampilkan data pembelian untuk barang berkategori 'CPU'. _Subquery_ empat lapis digunakan: dimulai dari pencarian `category_id` berdasarkan nama kategori, kemudian `product_id` yang termasuk kategori tersebut, lalu `order_id` terkait, hingga akhirnya data order ditampilkan.

#code(```sql
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
```)

#img("assets/1.4.png", caption: [Hasil _query_ menampilkan data pembelian untuk barang dengan kategori 'CPU'.])

Pendekatan ini menelusuri relasi antar tabel secara bertingkat menggunakan _nested subquery_ tanpa perlu `JOIN`. Setiap lapisan menyempurnakan filter hingga diperoleh `order_id` yang relevan.

=== Nomor 5

Ditampilkan data barang yang pernah dibeli lebih dari satu kali. _Subquery_ mengelompokkan data pada tabel `order_items` berdasarkan `product_id`, kemudian menyaring produk yang muncul di lebih dari satu baris order menggunakan klausa `HAVING`.

#code(```sql
SELECT * FROM products
WHERE
    product_id IN (
        SELECT product_id FROM order_items
        GROUP BY product_id
        HAVING COUNT(order_id) > 1
    )
ORDER BY product_id;
```)

#img("assets/1.5.png", caption: [Hasil _query_ menampilkan data barang yang pernah dibeli lebih dari satu kali.])

`COUNT(order_id)` menghitung berapa kali suatu produk muncul dalam tabel `order_items`. Nilai lebih dari 1 berarti produk tersebut pernah muncul di setidaknya dua transaksi yang berbeda.

== View

=== Nomor 1

==== 1a. Pembuatan VIEW Sederhana

Dibuat sebuah _view_ sederhana bernama `v_products` yang hanya memuat kolom `product_id`, `product_name`, dan `category_name` sebagai representasi satuan barang. _View_ ini melibatkan _join_ implisit antara tabel `products` dan `product_categories`.

#code(```sql
CREATE OR REPLACE VIEW v_products AS
SELECT
    p.product_id,
    p.product_name,
    pc.category_name product_category
FROM products p, product_categories pc
WHERE p.category_id = pc.category_id;
```)

#img("assets/2.1a.png", caption: [_View_ `v_products` berhasil dibuat dengan kolom `product_id`, `product_name`, dan `category_name`.])

Sintaks `CREATE OR REPLACE VIEW` memastikan _view_ dapat dibuat ulang tanpa perlu menghapusnya terlebih dahulu. Kolom `category_name` dari tabel `product_categories` digunakan sebagai proxy "satuan barang" karena tidak terdapat kolom satuan eksplisit pada tabel `products`.

==== 1b. Penggunaan VIEW Sederhana

Data kode barang, nama barang, dan satuan ditampilkan dengan melakukan `SELECT` langsung pada _view_ `v_products`.

#code(```sql
SELECT * FROM v_products;
```)

#img("assets/2.1b.png", caption: [Hasil _query_ terhadap _view_ `v_products` menampilkan kode barang, nama barang, dan kategori barang.])

_View_ berfungsi sebagai abstraksi tabel virtual. Pengguna tidak perlu mengetahui detail relasi antar tabel yang mendasari; cukup melakukan `SELECT` pada _view_ layaknya tabel biasa.

=== Nomor 2

==== 2a. Pembuatan VIEW Kompleks

Dibuat _view_ kompleks bernama `v_order_summary` yang menggabungkan informasi dari empat tabel (`orders`, `customers`, `employees`, `order_items`) dan menyertakan agregasi berupa total item dan total nilai order.

#code(```sql
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
```)

#img("assets/2.2a.png", caption: [_View_ `v_order_summary` berhasil dibuat, memuat ringkasan order beserta informasi pelanggan, _salesman_, dan agregasi nilai transaksi.])

_View_ ini menyederhanakan akses terhadap informasi yang sering dibutuhkan dalam analisis transaksi. Penggunaan `JOIN` eksplisit dan `GROUP BY` menjadikannya _view_ kompleks yang tidak dapat diperbarui secara langsung melalui DML.

==== 2b. Penggunaan VIEW Kompleks

_View_ `v_order_summary` digunakan untuk menampilkan dua informasi berbeda: daftar order berstatus 'Pending' beserta total nilainya, dan peringkat lima _salesman_ teratas berdasarkan total _revenue_.

#code(```sql
-- Informasi 1: order berstatus 'Pending' beserta total nilainya
SELECT order_id, order_date, customer_name, salesman_name, total_amount
FROM v_order_summary
WHERE status = 'Pending'
ORDER BY total_amount DESC;
```)

#img("assets/2.2b.1.png", caption: [Hasil _query_ pertama terhadap `v_order_summary` menampilkan daftar order dengan status 'Pending', diurutkan berdasarkan total nilai transaksi secara menurun.])

#code(```sql
-- Informasi 2: top 5 salesman berdasarkan total revenue
SELECT
    salesman_name,
    COUNT(order_id)      AS total_orders,
    SUM(total_amount)    AS total_revenue
FROM v_order_summary
GROUP BY salesman_name
ORDER BY total_revenue DESC
FETCH FIRST 5 ROWS ONLY;
```)

#img("assets/2.2b.2.png", caption: [Hasil _query_ kedua terhadap `v_order_summary` menampilkan lima _salesman_ dengan total _revenue_ tertinggi.])

Kedua _query_ menggunakan _view_ yang sama namun dengan filter dan agregasi berbeda, membuktikan bahwa _view_ kompleks dapat dijadikan sumber data yang fleksibel untuk berbagai kebutuhan pelaporan tanpa mengulang logika `JOIN` dan `GROUP BY` setiap kali.

=== Nomor 3

==== 3a. Penambahan Batasan WITH READ ONLY

_View_ `v_low_stock` dibuat untuk menampilkan produk dengan stok di bawah 20 unit, dilengkapi batasan `WITH READ ONLY` agar data pada _view_ tidak dapat dimodifikasi maupun dihapus.

#code(```sql
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
```)

#img("assets/2.3a.png", caption: [_View_ `v_low_stock` berhasil dibuat dengan batasan `WITH READ ONLY`, menampilkan produk yang memiliki stok di bawah 20 unit.])

Klausa `WITH READ ONLY` mendaftarkan _view_ sebagai hanya-baca pada level Oracle, sehingga semua operasi DML (`INSERT`, `UPDATE`, `DELETE`) akan ditolak oleh _database engine_ terlepas dari apakah _view_ tersebut secara teknis bersifat _updatable_ atau tidak.

==== 3b. Verifikasi Batasan READ ONLY

Dibuktikan bahwa batasan `WITH READ ONLY` aktif dengan mencoba operasi `INSERT` dan `UPDATE` pada _view_ `v_low_stock`. Kedua operasi menghasilkan galat `ORA-42399`.

#code(```sql
-- Percobaan INSERT
INSERT INTO v_low_stock (product_id, warehouse_name, quantity)
VALUES (999, 'Test Warehouse', 5);

-- Percobaan UPDATE
UPDATE v_low_stock SET quantity = 100 WHERE product_id = 1;
```)

#img("assets/2.3b.1.png", caption: [Percobaan `INSERT` pada _view_ `v_low_stock` ditolak oleh Oracle dengan galat `ORA-42399: cannot perform a DML operation on a read-only view`.])

#img("assets/2.3b.2.png", caption: [Percobaan `UPDATE` pada _view_ `v_low_stock` juga ditolak dengan galat yang sama, membuktikan bahwa batasan `WITH READ ONLY` berfungsi dengan benar.])

Galat `ORA-42399` yang muncul pada kedua percobaan membuktikan bahwa batasan _read-only_ berhasil diterapkan. Data pada _view_ hanya dapat dibaca melalui `SELECT` dan tidak dapat dimanipulasi melalui operasi DML apapun.
