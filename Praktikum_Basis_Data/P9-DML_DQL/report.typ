#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Basis Data",
  course-code: "PBD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "9",
  title: "Data Manipulation dan Query",
)

#show: report.with(
  ..metadata,
  association: (
    program: "D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK",
    department: "DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA",
    faculty: "SEKOLAH VOKASI",
    university: "UNIVERSITAS GADJAH MADA",
    city: "YOGYAKARTA",
    logo: image("assets/logo.png", width: 6cm),
  ),
  year: 2026,
  use-cover: true,
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
  bib: bibliography("references.bib"),
)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), width: 80%, ..args)

#daftar-isi()

#daftar-gambar()

= Tujuan Praktikum

Tujuan dilaksanakannya praktikum ini adalah sebagai berikut.
+ Memahami konsep dan peran _Data Manipulation Language_ (DML) dalam sistem manajemen basis data relasional Oracle, mencakup perintah INSERT, UPDATE, dan DELETE.
+ Menerapkan perintah INSERT untuk menambahkan data baru ke dalam tabel, baik dengan mengisi seluruh kolom maupun kolom tertentu saja.
+ Menerapkan perintah UPDATE untuk mengubah data yang sudah tersimpan dalam tabel, termasuk pembaruan lebih dari satu kolom dalam satu pernyataan.
+ Menerapkan perintah DELETE untuk menghapus data dari tabel dengan klausa WHERE yang tepat.
+ Memahami dan menerapkan perintah SELECT dengan klausa JOIN, WHERE, dan fungsi agregat untuk mengambil data dari satu atau lebih tabel sesuai kriteria yang ditentukan.

= Dasar Teori

== Data Manipulation Language (DML)

Dalam sistem manajemen basis data relasional, perintah SQL dikelompokkan berdasarkan fungsinya. _Data Manipulation Language_ (DML) adalah subkelompok yang mencakup perintah-perintah untuk memanipulasi data yang tersimpan di dalam tabel, yaitu INSERT, UPDATE, dan DELETE @silberschatz2019. Berbeda dengan _Data Definition Language_ (DDL) yang beroperasi pada level skema, DML beroperasi pada level data, yaitu pada baris-baris tupel yang tersimpan di dalam tabel yang sudah ada @elmasri2016.

Perbedaan paling fundamental antara DML dan DDL dalam konteks Oracle adalah sifat transaksinya. Perintah DDL bersifat _auto-commit_, sedangkan perintah DML tidak @oracle-concepts. Setiap perubahan yang dilakukan melalui DML merupakan bagian dari sebuah transaksi yang belum tersimpan secara permanen hingga perintah `COMMIT` dieksekusi secara eksplisit. Sebaliknya, selama transaksi belum di-_commit_, perubahan tersebut masih dapat dibatalkan menggunakan perintah `ROLLBACK`. Properti ini memberikan kontrol penuh kepada pengguna atas konsistensi data sebelum perubahan bersifat permanen @oracle-concepts.

== Perintah INSERT

Perintah `INSERT` digunakan untuk menambahkan satu baris data baru ke dalam tabel @oracle-insert. Oracle mendukung dua varian sintaks INSERT yang berbeda dalam hal cakupan kolom yang diisi.

Varian pertama mengisi seluruh kolom tabel secara berurutan tanpa menyebutkan nama kolom secara eksplisit. Varian ini mensyaratkan bahwa jumlah dan urutan nilai yang diberikan harus persis sama dengan definisi kolom pada tabel @oracle-insert. Varian kedua menyebutkan daftar kolom secara eksplisit, sehingga hanya kolom-kolom tersebut yang diisi nilainya. Kolom yang tidak disebutkan akan diisi dengan nilai `DEFAULT` jika didefinisikan, atau `NULL` jika kolom tersebut mengizinkan nilai _null_ @melton2016. Kolom yang bersifat `NOT NULL` tanpa nilai _default_ wajib disertakan dalam daftar kolom, jika tidak Oracle akan menolak operasi dengan _error constraint violation_ @oracle-insert.

#code(```sql
-- Varian 1: mengisi seluruh kolom secara berurutan
INSERT INTO customers
VALUES (700, 'Albertos Inc.', 'Yogyakarta', 'albertos.com', 100000);

-- Varian 2: menyebutkan kolom secara eksplisit
INSERT INTO customers(customer_id, name)
VALUES (708, 'Avengers Inc.');
```)

== Perintah UPDATE

Perintah `UPDATE` digunakan untuk mengubah nilai satu atau lebih kolom pada baris yang sudah ada dalam tabel @oracle-update. Perubahan nilai ditentukan melalui klausa `SET` yang menerima satu atau lebih pasangan `kolom = nilai` yang dipisahkan oleh koma.

Klausa `WHERE` pada `UPDATE` bersifat opsional secara sintaks, namun kritis secara semantik. Tanpa klausa `WHERE`, perintah `UPDATE` akan memodifikasi seluruh baris dalam tabel tanpa terkecuali @oracle-update. Oleh karena itu, verifikasi kondisi `WHERE` sebelum eksekusi merupakan praktik yang sangat dianjurkan, misalnya dengan menjalankan `SELECT` menggunakan kondisi yang sama terlebih dahulu untuk memastikan baris yang akan terpengaruh sudah sesuai @melton2016.

#code(```sql
-- Mengubah satu kolom
UPDATE customers
SET name = 'Avengers'
WHERE customer_id = 708;

-- Mengubah lebih dari satu kolom sekaligus
UPDATE customers
SET name = 'Avengers', address = 'New York'
WHERE customer_id = 708;
```)

== Perintah DELETE

Perintah `DELETE` digunakan untuk menghapus satu atau lebih baris dari tabel @oracle-delete. Sama seperti `UPDATE`, klausa `WHERE` pada `DELETE` bersifat opsional secara sintaks namun wajib diperhatikan secara semantik. Tanpa klausa `WHERE`, seluruh baris dalam tabel akan dihapus sekaligus, yang pada umumnya bukan perilaku yang diinginkan @oracle-delete.

Hal penting lainnya adalah interaksi antara `DELETE` dan _constraint_ FOREIGN KEY. Jika baris yang hendak dihapus dirujuk oleh baris lain melalui FOREIGN KEY tanpa klausul `ON DELETE CASCADE`, Oracle akan menolak operasi penghapusan tersebut dengan _error_ integritas referensial @elmasri2016. Kondisi ini harus diperhitungkan saat merancang urutan operasi DELETE pada basis data yang memiliki relasi antartabel.

#code(```sql
-- Menghapus satu baris berdasarkan kondisi WHERE
DELETE FROM customers
WHERE customer_id = 708;

-- Tanpa WHERE: menghapus SEMUA baris dalam tabel
DELETE FROM customers;
```)

== Data Query Language dan Perintah SELECT

_Data Query Language_ (DQL) merujuk pada subkelompok SQL yang berfungsi untuk mengambil data dari basis data tanpa mengubah isinya @silberschatz2019. Dalam praktiknya, DQL identik dengan perintah `SELECT` beserta seluruh klausulnya.

Bentuk paling dasar `SELECT` terdiri atas daftar kolom yang ingin ditampilkan dan klausa `FROM` yang menentukan tabel sumbernya @oracle-select. Klausa `WHERE` dapat ditambahkan untuk memfilter baris berdasarkan kondisi tertentu. Klausa `ORDER BY` digunakan untuk mengurutkan hasil berdasarkan satu atau lebih kolom, baik secara _ascending_ (ASC, default) maupun _descending_ (DESC) @oracle-select.

Kata kunci `DISTINCT` dapat ditempatkan setelah `SELECT` untuk memastikan bahwa baris-baris duplikat pada hasil _query_ dieliminasi, sehingga setiap baris yang dikembalikan bersifat unik berdasarkan kombinasi nilai kolom yang dipilih @oracle-select.

#code(```sql
-- Bentuk dasar SELECT
SELECT * FROM customers;

-- SELECT dengan filter WHERE dan pengurutan ORDER BY
SELECT * FROM customers
WHERE customer_id < 10
ORDER BY name;

-- SELECT dengan DISTINCT untuk menghilangkan duplikasi
SELECT DISTINCT name FROM customers;
```)

== JOIN dalam SQL

`JOIN` adalah operasi yang digunakan untuk menggabungkan baris dari dua tabel atau lebih berdasarkan kondisi tertentu, biasanya kesamaan nilai pada kolom yang berelasi @elmasri2016. Jenis JOIN yang paling umum digunakan adalah `INNER JOIN`, yang hanya mengembalikan baris-baris di mana kondisi penggabungan terpenuhi di kedua tabel sekaligus @silberschatz2019. Baris yang tidak memiliki pasangan di tabel lain tidak akan muncul dalam hasil `INNER JOIN`.

Dalam konteks OT Schema, relasi antartabel didefinisikan melalui FOREIGN KEY. Kolom FOREIGN KEY inilah yang umumnya menjadi dasar kondisi JOIN, misalnya `ON customers.customer_id = orders.customer_id` @oracle-select. Pada _query_ yang melibatkan tiga tabel atau lebih, klausa `INNER JOIN` dapat dirantai secara berurutan, di mana setiap JOIN menambahkan satu tabel baru ke dalam _result set_ yang sedang dibangun @melton2016.

Penggunaan alias tabel, misalnya `FROM customers c`, dianjurkan dalam _query_ multi-tabel untuk memperjelas asal kolom dan mempersingkat penulisan kondisi JOIN @oracle-select.

#code(```sql
-- INNER JOIN dua tabel
SELECT c.name, o.status
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- INNER JOIN tiga tabel (dirantai)
SELECT p.product_name
FROM inventories i
INNER JOIN products p   ON i.product_id   = p.product_id
INNER JOIN warehouses w ON i.warehouse_id = w.warehouse_id
WHERE w.warehouse_name = 'Toronto';
```)

== Fungsi Agregat dan GROUP BY

Fungsi agregat adalah fungsi yang menerima sekumpulan nilai dari beberapa baris dan mengembalikan satu nilai tunggal sebagai hasil kalkulasi @oracle-aggregate. Fungsi-fungsi agregat yang tersedia di Oracle antara lain sebagai berikut.

/ COUNT: Menghitung jumlah baris yang memenuhi kondisi. `COUNT(*)` menghitung semua baris termasuk yang memiliki nilai `NULL`, sedangkan `COUNT(kolom)` hanya menghitung baris di mana kolom tersebut tidak `NULL` @oracle-aggregate.
/ SUM: Menjumlahkan seluruh nilai numerik pada kolom yang ditentukan @oracle-aggregate.
/ MAX dan MIN: Mengembalikan nilai terbesar dan terkecil dari kolom yang ditentukan @oracle-aggregate.
/ AVG: Menghitung rata-rata nilai numerik pada kolom yang ditentukan, dengan mengabaikan nilai `NULL` secara otomatis @oracle-aggregate.

Klausa `GROUP BY` digunakan bersama fungsi agregat untuk membagi baris-baris hasil _query_ ke dalam kelompok-kelompok berdasarkan nilai kolom tertentu, kemudian menerapkan fungsi agregat secara terpisah pada setiap kelompok @silberschatz2019. Klausa `ORDER BY` dapat dikombinasikan dengan `GROUP BY` untuk mengurutkan kelompok-kelompok hasil agregasi berdasarkan nilai agregat maupun kolom lainnya @oracle-aggregate.

#code(```sql
-- COUNT: menghitung jumlah baris
SELECT COUNT(*) FROM customers;

-- MAX: nilai tertinggi dari kolom
SELECT max(list_price) FROM products;

-- SUM dengan GROUP BY: total per kelompok
SELECT order_id, sum(quantity)
FROM order_items
GROUP BY order_id;

-- SUM dengan GROUP BY dan ORDER BY: total per kelompok, diurutkan
SELECT order_id, sum(quantity)
FROM order_items
GROUP BY order_id
ORDER BY sum(quantity);
```)

#pagebreak()

= Hasil dan Pembahasan

== Tugas 1: Menampilkan Nama Customer dengan Status Order Pending

Tugas pertama meminta nama-nama customer yang memiliki minimal satu order berstatus `'Pending'`. Data customer tersimpan di tabel `customers`, sedangkan data status order tersimpan di tabel `orders`. Struktur kedua tabel diperiksa terlebih dahulu menggunakan `DESCRIBE` untuk memastikan nama kolom yang akan digunakan dalam JOIN dan filter.

#img("assets/describe-orders.png", caption: [Struktur tabel `orders` yang menampilkan kolom `customer_id` sebagai _foreign key_ dan kolom `status` sebagai dasar filter])
#img("assets/describe-customers.png", caption: [Struktur tabel `customers` yang menampilkan kolom `customer_id` sebagai _primary key_ dan kolom `name` sebagai kolom yang akan ditampilkan])

_Query_ yang digunakan menggabungkan kedua tabel melalui `INNER JOIN` pada kolom `customer_id`, kemudian memfilter baris dengan kondisi `orders.status = 'Pending'`. Kata kunci `DISTINCT` ditambahkan untuk memastikan nama customer yang muncul tidak terduplikasi meskipun customer tersebut memiliki lebih dari satu order berstatus _pending_ @oracle-select.

#code(```sql
SELECT DISTINCT name
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
WHERE orders.status = 'Pending';
```)

#img("assets/select-customer-pending.png", caption: [Hasil _query_ yang menampilkan nama-nama customer dengan status order `'Pending'` tanpa duplikasi])

== Tugas 2: Menampilkan Jumlah Customer di Database

Tugas kedua meminta jumlah total customer yang terdaftar dalam basis data. Karena tidak diperlukan filter maupun JOIN, _query_ ini hanya menggunakan fungsi agregat `COUNT(*)` langsung pada tabel `customers` @oracle-aggregate.

#code(```sql
SELECT COUNT(*) FROM customers;
```)

#img("assets/select-count-customers.png", caption: [Hasil _query_ `COUNT(*)` yang menampilkan jumlah total baris pada tabel `customers`])

`COUNT(*)` menghitung seluruh baris dalam tabel tanpa terkecuali, termasuk baris yang memiliki nilai `NULL` pada kolom tertentu. Hasilnya merupakan jumlah keseluruhan customer yang terdaftar di basis data @oracle-aggregate.

== Tugas 3: Menampilkan Nama Produk di Kategori CPU

Tugas ketiga meminta nama-nama produk yang termasuk dalam kategori `'CPU'`. Informasi nama produk tersimpan di tabel `products`, sedangkan nama kategori tersimpan di tabel `product_categories`. Kedua tabel dihubungkan melalui kolom `category_id`. Struktur kedua tabel diperiksa terlebih dahulu untuk memastikan kolom relasi yang tepat.

#img("assets/describe-products.png", caption: [Struktur tabel `products` yang menampilkan kolom `category_id` sebagai _foreign key_ dan kolom `product_name` sebagai kolom yang akan ditampilkan])
#img("assets/describe-product_categories.png", caption: [Struktur tabel `product_categories` yang menampilkan kolom `category_id` sebagai _primary key_ dan kolom `category_name` sebagai dasar filter])

#code(```sql
SELECT DISTINCT product_name
FROM products
INNER JOIN product_categories ON products.category_id = product_categories.category_id
WHERE category_name = 'CPU';
```)

#img("assets/select-product-in-cpu-category.png", caption: [Hasil _query_ yang menampilkan nama-nama produk dalam kategori `'CPU'`])

Penggunaan `DISTINCT` pada _query_ ini bersifat preventif. Meskipun secara logika relasi antara produk dan kategori bersifat _many-to-one_ sehingga duplikasi tidak seharusnya terjadi, `DISTINCT` memastikan hasil tetap bersih jika terdapat anomali data @oracle-select.

== Tugas 4: Menampilkan Jumlah Produk di Kategori CPU

Tugas keempat adalah kelanjutan logis dari Tugas 3, yaitu menghitung jumlah produk dalam kategori `'CPU'` menggunakan fungsi agregat `COUNT(*)` dikombinasikan dengan `INNER JOIN` dan `WHERE` yang sama @oracle-aggregate.

#code(```sql
SELECT COUNT(*)
FROM products
INNER JOIN product_categories ON products.category_id = product_categories.category_id
WHERE category_name = 'CPU';
```)

#img("assets/select-count-cpu-products.png", caption: [Hasil _query_ `COUNT(*)` yang menampilkan jumlah produk dalam kategori `'CPU'`])

Perbedaan antara Tugas 3 dan Tugas 4 hanya terletak pada kolom yang dipilih: Tugas 3 memilih `product_name` untuk menampilkan daftar nama, sedangkan Tugas 4 mengganti pilihan tersebut dengan `COUNT(*)` untuk mendapatkan jumlah totalnya.

== Tugas 5: Menampilkan Nama Kota dan Nama Gudang

Tugas kelima meminta pasangan nama kota dan nama gudang yang berada di kota tersebut. Data gudang tersimpan di tabel `warehouses` dan data lokasi tersimpan di tabel `locations`. Tabel `countries` dan `regions` juga diperiksa strukturnya sebagai bagian dari eksplorasi skema OT, meskipun keduanya tidak diperlukan dalam _query_ akhir karena kolom `city` sudah tersedia langsung di tabel `locations`.

#img("assets/describe-warehouses.png", caption: [Struktur tabel `warehouses` yang menampilkan kolom `location_id` sebagai _foreign key_ dan kolom `warehouse_name` sebagai kolom yang akan ditampilkan])
#img("assets/describe-locations.png", caption: [Struktur tabel `locations` yang menampilkan kolom `location_id` sebagai _primary key_ dan kolom `city` sebagai kolom yang akan ditampilkan])
#img("assets/describe-countries.png", caption: [Struktur tabel `countries` sebagai bagian dari eksplorasi hierarki lokasi OT Schema])
#img("assets/describe-regions.png", caption: [Struktur tabel `regions` sebagai bagian dari eksplorasi hierarki lokasi OT Schema])

#code(```sql
SELECT city, warehouse_name
FROM warehouses w
INNER JOIN locations l ON w.location_id = l.location_id;
```)

#img("assets/select-werehouses.png", caption: [Hasil _query_ yang menampilkan pasangan nama kota dan nama gudang yang berlokasi di kota tersebut])

_Query_ ini tidak memerlukan klausa `WHERE` karena seluruh pasangan kota dan gudang diminta ditampilkan tanpa filter tertentu. JOIN dilakukan pada kolom `location_id` yang menjadi penghubung antara tabel `warehouses` dan `locations` @oracle-select.

== Tugas 6: Menampilkan Nama Produk yang Tersedia di Gudang Toronto

Tugas keenam melibatkan tiga tabel sekaligus: `inventories` sebagai tabel penghubung antara produk dan gudang, `products` untuk nama produk, dan `warehouses` untuk nama gudang. Struktur tabel `inventories` diperiksa terlebih dahulu untuk mengidentifikasi kolom _foreign key_ yang menghubungkan ketiga tabel tersebut.

#img("assets/describe-inventories.png", caption: [Struktur tabel `inventories` yang menampilkan kolom `product_id` dan `warehouse_id` sebagai _foreign key_ yang menghubungkan tabel `products` dan `warehouses`])

#code(```sql
SELECT product_name
FROM inventories i
INNER JOIN products p ON i.product_id = p.product_id
INNER JOIN warehouses w ON i.warehouse_id = w.warehouse_id
WHERE warehouse_name = 'Toronto';
```)

#img("assets/select-toronto_warehouse-product.png", caption: [Hasil _query_ yang menampilkan nama-nama produk yang tersedia di gudang `'Toronto'`])

_Query_ ini menggunakan pola _three-table join_ di mana tabel `inventories` berperan sebagai tabel jembatan (_junction table_) yang menghubungkan `products` dan `warehouses`. Setiap JOIN dirantai secara berurutan, dan filter `WHERE` kemudian diterapkan pada kolom `warehouse_name` dari tabel `warehouses` yang sudah masuk ke dalam _result set_ @melton2016.

== Tugas 7: Menampilkan Jumlah Order yang Dilayani Blake Cooper

Tugas ketujuh meminta jumlah order yang ditangani oleh karyawan bernama Blake Cooper. Data order tersimpan di tabel `orders` dengan kolom `salesman_id` sebagai referensi ke karyawan yang menangani, sedangkan data karyawan tersimpan di tabel `employees`. Struktur kedua tabel diperiksa terlebih dahulu.

#img("assets/describe-employees.png", caption: [Struktur tabel `employees` yang menampilkan kolom `employee_id` sebagai _primary key_ dan kolom `first_name`, `last_name` sebagai dasar filter nama])
#img("assets/describe-orders-2.png", caption: [Struktur tabel `orders` yang menampilkan kolom `salesman_id` sebagai _foreign key_ ke tabel `employees`])

#code(```sql
SELECT COUNT(*)
FROM orders o
INNER JOIN employees e ON o.salesman_id = e.employee_id
WHERE e.first_name = 'Blake' AND e.last_name = 'Cooper';
```)

#img("assets/select-count_order.png", caption: [Hasil _query_ menampilkan nilai `0`, yang berarti Blake Cooper tidak tercatat sebagai _salesman_ pada satu pun order di tabel `orders`])

Hasil _query_ mengembalikan nilai `0`. Ini bukan _error_, melainkan fakta data yang valid: Blake Cooper terdaftar sebagai karyawan di tabel `employees`, namun jabatannya adalah manajer, bukan _salesman_. Kolom `salesman_id` pada tabel `orders` hanya diisi oleh karyawan yang berperan sebagai tenaga penjualan. Karena tidak ada baris di tabel `orders` yang memiliki `salesman_id` yang sesuai dengan `employee_id` milik Blake Cooper, `INNER JOIN` tidak menghasilkan baris yang cocok, dan `COUNT(*)` mengembalikan `0` @oracle-aggregate.

#pagebreak()

= Kesimpulan

Berdasarkan praktikum yang telah dilaksanakan, disimpulkan hal-hal berikut.
+ _Data Manipulation Language_ (DML) adalah subkelompok SQL yang mencakup perintah INSERT, UPDATE, dan DELETE untuk memanipulasi data pada level baris. Berbeda dengan DDL, perintah DML tidak bersifat _auto-commit_ sehingga setiap perubahan dapat dibatalkan menggunakan `ROLLBACK` selama belum di-_commit_.
+ Perintah INSERT berhasil diterapkan dalam dua varian: INSERT tanpa daftar kolom eksplisit yang mengharuskan urutan nilai sesuai definisi tabel, dan INSERT dengan daftar kolom eksplisit yang memungkinkan pengisian kolom secara selektif.
+ Perintah UPDATE berhasil diterapkan untuk mengubah satu maupun lebih dari satu kolom dalam satu pernyataan melalui klausa `SET`. Klausa `WHERE` terbukti kritis untuk membatasi baris yang dimodifikasi agar tidak terjadi perubahan massal yang tidak diinginkan.
+ Perintah DELETE berhasil diterapkan dengan klausa `WHERE` untuk menghapus baris secara selektif. Dipahami bahwa DELETE tanpa klausa `WHERE` akan menghapus seluruh isi tabel, dan bahwa _constraint_ FOREIGN KEY dapat mencegah penghapusan baris yang masih dirujuk oleh tabel lain.
+ Perintah SELECT berhasil diterapkan dengan berbagai kombinasi klausa: `INNER JOIN` untuk menggabungkan dua hingga tiga tabel berdasarkan kolom relasi, `WHERE` untuk memfilter baris, `DISTINCT` untuk mengeliminasi duplikasi, dan `COUNT(*)` sebagai fungsi agregat. Pada Tugas 7, hasil `COUNT(*)` bernilai `0` karena Blake Cooper berperan sebagai manajer, bukan _salesman_, sehingga tidak ada baris di tabel `orders` yang merujuk `employee_id`-nya melalui kolom `salesman_id`.
