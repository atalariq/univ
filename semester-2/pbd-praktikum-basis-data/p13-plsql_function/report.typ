#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "PL2B2",
  course: "Praktikum Basis Data",
  course-code: "PBD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "13",
  title: "PL/SQL Function",
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
  bib: bibliography("references.bib", style: "ieee"),
)

#set par(justify: true, leading: 0.65em)

#let code = (header: none, numbering: true, it) => code(
  header: header,
  numbering: numbering,
  it,
)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), width: 90%, ..args)

#let col = (a, b) => col(a, b)

#daftar-isi()

= Tujuan Praktikum

+ Memahami konsep dan struktur dasar _PL/SQL function_ pada Oracle Database.
+ Menerapkan sintaks `CREATE OR REPLACE FUNCTION` untuk membuat _function_ yang dapat dipanggil ulang.
+ Membedakan antara _function_ dan _stored procedure_ dalam konteks nilai kembalian.
+ Memanggil _PL/SQL function_ dari blok anonim maupun pernyataan `SELECT`.
+ Mengimplementasikan _function_ untuk kasus penggunaan yang beragam, meliputi agregasi data penjualan, filter data pelanggan berdasarkan tahun, dan klasifikasi status pesanan.

= Dasar Teori

== PL/SQL Function

_PL/SQL function_ merupakan blok kode bernama yang dapat digunakan kembali (_reusable_) dan selalu mengembalikan tepat satu nilai kepada pemanggilnya @feuerstein2014. Berbeda dengan _stored procedure_ yang bersifat opsional dalam mengembalikan nilai, _function_ diwajibkan memiliki klausa `RETURN` pada header dan minimal satu pernyataan `RETURN` pada bagian eksekusi @oracle_plsql_ref.

Sintaks umum pembuatan _PL/SQL function_ adalah sebagai berikut @oracletutorial_func:

```sql
CREATE [OR REPLACE] FUNCTION function_name
  [(parameter_1 [IN | OUT | IN OUT] data_type,
    parameter_2 [IN | OUT | IN OUT] data_type,
    ...)]
RETURN return_data_type
IS
  -- bagian deklarasi (opsional)
BEGIN
  -- bagian eksekusi (wajib)
  RETURN nilai;
EXCEPTION
  -- penanganan eksepsi (opsional)
END [function_name];
/
```

Kata kunci `OR REPLACE` memungkinkan pendefinisian ulang _function_ yang sudah ada tanpa menghapus dan membuat ulang secara manual @feuerstein2014. Kata kunci `IS` dan `AS` bersifat dapat dipertukarkan (_interchangeable_) sebagai penanda awal bagian deklarasi.

== Parameter dan Mode Akses

Terdapat tiga mode parameter yang dapat dideklarasikan pada _PL/SQL function_ @oracle_plsql_ref:

/ `IN`: Parameter hanya dapat dibaca oleh _function_. Nilai dikirim oleh pemanggil dan tidak dapat diubah di dalam _function_. Ini adalah mode default.
/ `OUT`: Parameter digunakan untuk mengirim nilai kembali ke pemanggil. Nilai awal dari sisi pemanggil diabaikan.
/ `IN OUT`: Parameter bertindak sebagai input sekaligus output. _Function_ dapat membaca dan mengubah nilainya.

Untuk _function_ yang dipanggil dari pernyataan SQL (seperti `SELECT`), hanya parameter `IN` yang diperbolehkan, karena SQL tidak dapat memproses parameter `OUT` maupun `IN OUT` @oracle_plsql_ref.

== Cara Pemanggilan Function

_PL/SQL function_ dapat dipanggil dalam tiga konteks utama @oracletutorial_func:

/ Blok anonim: Nilai kembalian ditampung ke variabel, kemudian diproses lebih lanjut.
/ Pernyataan SQL: _Function_ ditempatkan langsung pada `SELECT list`, klausa `WHERE`, atau klausa `HAVING`.
/ Ekspresi PL/SQL: _Function_ digunakan di sisi kanan operasi _assignment_ (`:=`).

Ketiga cara pemanggilan ini menjadikan _function_ lebih fleksibel dibandingkan _procedure_ untuk operasi yang bersifat komputasi murni tanpa efek samping (_side effect_) @feuerstein2014.

== Perbedaan Function dan Procedure

_Function_ dan _procedure_ sama-sama merupakan subprogram PL/SQL, namun terdapat perbedaan mendasar di antara keduanya @feuerstein2014. _Function_ wajib mengembalikan satu nilai dan dapat digunakan sebagai bagian dari ekspresi SQL. _Procedure_ tidak diwajibkan mengembalikan nilai dan tidak dapat ditempatkan langsung di dalam pernyataan `SELECT`. Apabila suatu subprogram hanya perlu menghasilkan satu nilai skalar dan kemungkinan dipanggil dari lapisan SQL, _function_ adalah pilihan yang lebih tepat.

= Hasil dan Pembahasan

== Contoh dari Tutorial: `get_total_sales`

Contoh pertama diambil dari sumber tutorial oracletutorial.com @oracletutorial_func. _Function_ `get_total_sales` menerima parameter tahun dan mengembalikan total penjualan pada tahun tersebut dalam bentuk `NUMBER`.

#code(header: "get_total_sales")[
```sql
CREATE OR REPLACE FUNCTION get_total_sales(
  in_year PLS_INTEGER
)
RETURN NUMBER
IS
  l_total_sales NUMBER := 0;
BEGIN
  SELECT SUM(unit_price * quantity)
  INTO   l_total_sales
  FROM   order_items
  INNER JOIN orders USING (order_id)
  WHERE  status = 'Shipped'
    AND  EXTRACT(YEAR FROM order_date) = in_year;

  RETURN l_total_sales;
END get_total_sales;
/
```
]

Bagian deklarasi menginisialisasi `l_total_sales` dengan nilai `0`. Inisialisasi ini penting karena apabila query `SELECT ... INTO` tidak menghasilkan baris (tidak ada pesanan terkirim pada tahun tersebut), variabel tetap bernilai `0` dan bukan `NULL`, sehingga _function_ tidak mengembalikan nilai ambigu.

Kalkulasi `SUM(unit_price * quantity)` dilakukan langsung di dalam query, bukan di lapisan PL/SQL, agar pemrosesan agregasi diserahkan kepada mesin SQL yang lebih optimal untuk operasi tersebut. Klausa `EXTRACT(YEAR FROM order_date)` digunakan untuk memfilter baris berdasarkan tahun tanpa perlu membandingkan tanggal secara penuh.

_Function_ ini kemudian dapat dipanggil dengan dua cara: dari blok anonim maupun dari `SELECT`.

#col(
  code(header: "Pemanggilan dari blok anonim", numbering: false)[
```sql
DECLARE
  l_sales NUMBER;
BEGIN
  l_sales := get_total_sales(2017);
  IF l_sales > 10000000 THEN
    DBMS_OUTPUT.PUT_LINE(
      'Penjualan 2017 di atas target'
    );
  ELSE
    DBMS_OUTPUT.PUT_LINE(
      'Total: ' || l_sales
    );
  END IF;
END;
/
```
  ],
  code(header: "Pemanggilan dari SELECT", numbering: false)[
```sql
SELECT
  get_total_sales(2017) AS sales_2017
FROM dual;
```
  ]
)

Pemanggilan melalui `SELECT ... FROM dual` memanfaatkan tabel _dummy_ `dual` milik Oracle sebagai wadah saat tidak ada tabel sumber data yang diperlukan. Ini membuktikan bahwa _function_ PL/SQL dapat berperan langsung sebagai ekspresi skalar dalam SQL @oracletutorial_func.

#img(
  "assets/ss-example.png",
  caption: [Hasil eksekusi _function_ `get_total_sales(2017)` pada SQL Developer menampilkan total nilai penjualan tahun 2017]
)

== Function Buatan: `get_avg_items_sold_per_year`

_Function_ pertama buatan sendiri dirancang untuk menghitung rata-rata jumlah item yang terjual per tahun secara keseluruhan, tanpa filter tahun tertentu. Nilai ini berguna sebagai _baseline_ performa penjualan historis.

#code(header: "get_avg_items_sold_per_year")[
```sql
CREATE OR REPLACE FUNCTION get_avg_items_sold_per_year
RETURN NUMBER
IS
  l_avg NUMBER := 0;
BEGIN
  SELECT AVG(yearly_qty)
  INTO   l_avg
  FROM (
    SELECT EXTRACT(YEAR FROM o.order_date) AS yr,
           SUM(oi.quantity)                AS yearly_qty
    FROM   orders o
    JOIN   order_items oi USING (order_id)
    WHERE  o.status = 'Shipped'
    GROUP BY EXTRACT(YEAR FROM o.order_date)
  );

  RETURN ROUND(l_avg, 2);
END get_avg_items_sold_per_year;
/
```
]

Subquery pada bagian `FROM` terlebih dahulu mengagregasi total kuantitas item per tahun melalui `SUM(oi.quantity) GROUP BY tahun`. Hasil agregasi tersebut kemudian menjadi sumber bagi `AVG()` di query luar untuk mendapatkan rata-rata antartahun. Pendekatan dua lapis ini diperlukan karena `AVG(SUM(...))` tidak dapat ditulis secara langsung dalam satu query tanpa subquery atau _window function_ @feuerstein2014.

`ROUND(l_avg, 2)` diterapkan sebelum nilai dikembalikan agar hasil berbentuk angka desimal yang rapi dan mudah dibaca oleh lapisan aplikasi.

#col(
  code(header: "Pemanggilan", numbering: false)[
```sql
DECLARE
  l_result NUMBER;
BEGIN
  l_result :=
    get_avg_items_sold_per_year();
  DBMS_OUTPUT.PUT_LINE(
    'Rata-rata item/tahun: '
    || l_result
  );
END;
/
```
  ],
  code(header: "Alternatif via SELECT", numbering: false)[
```sql
SELECT
  get_avg_items_sold_per_year()
    AS avg_items_per_year
FROM dual;
```
  ]
)

#img(
  "assets/ss-1b.png",
  caption: [Output pemanggilan `get_avg_items_sold_per_year()` dari blok anonim yang menampilkan rata-rata item terjual per tahun]
)

== Function Buatan: `get_customers_by_order_year`

_Function_ kedua mengembalikan daftar nama pelanggan yang pernah melakukan pemesanan pada tahun tertentu. Karena nilai kembaliannya berupa himpunan baris (bukan skalar tunggal), digunakan tipe `SYS_REFCURSOR` sebagai tipe kembalian.

#code(header: "get_customers_by_order_year")[
```sql
CREATE OR REPLACE FUNCTION get_customers_by_order_year(
  in_year IN PLS_INTEGER
)
RETURN SYS_REFCURSOR
IS
  l_cursor SYS_REFCURSOR;
BEGIN
  OPEN l_cursor FOR
    SELECT DISTINCT
           c.customer_id,
           c.name,
           c.address
    FROM   customers c
    JOIN   orders o
           ON c.customer_id = o.customer_id
    WHERE  EXTRACT(YEAR FROM o.order_date) = in_year
    ORDER BY c.name;

  RETURN l_cursor;
END get_customers_by_order_year;
/
```
]

Penggunaan `SYS_REFCURSOR` memungkinkan _function_ mengembalikan _result set_ yang belum dievaluasi sepenuhnya; evaluasi baru terjadi saat _cursor_ di-_fetch_ oleh pemanggil @oracle_plsql_ref. Ini lebih efisien daripada mengumpulkan semua baris ke dalam koleksi PL/SQL terlebih dahulu, terutama untuk data berukuran besar.

Klausa `DISTINCT` pada query mencegah nama pelanggan muncul lebih dari sekali apabila pelanggan tersebut memiliki beberapa pesanan dalam tahun yang sama.

#code(header: "Pemanggilan dan fetch cursor")[
```sql
DECLARE
  l_cur       SYS_REFCURSOR;
  l_id        customers.customer_id%TYPE;
  l_name      customers.name%TYPE;
  l_address   customers.address%TYPE;
BEGIN
  l_cur := get_customers_by_order_year(2017);

  LOOP
    FETCH l_cur INTO l_id, l_name, l_address;
    EXIT WHEN l_cur%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(
      l_id || ' | ' || l_name || ' | ' || l_address
    );
  END LOOP;

  CLOSE l_cur;
END;
/
```
]

_Cursor_ harus ditutup secara eksplisit menggunakan `CLOSE` setelah selesai di-_fetch_. Kegagalan menutup _cursor_ mengakibatkan kebocoran sumber daya (_resource leak_) yang dapat menyebabkan Oracle mencapai batas maksimum _open cursor_ dan menolak koneksi baru @feuerstein2014.

#img(
  "assets/ss-2b.png",
  caption: [Hasil _fetch_ cursor dari `get_customers_by_order_year(2017)` yang menampilkan daftar pelanggan beserta ID dan alamat surel]
)

== Function Buatan: `get_order_status_label`

_Function_ ketiga bersifat utilitas murni: ia menerima kode status pesanan internal dan mengembalikan label status yang ramah pengguna dalam Bahasa Indonesia. Tidak ada akses basis data di dalam _function_ ini; seluruh logika berjalan di memori melalui struktur `CASE`.

#code(header: "get_order_status_label")[
```sql
CREATE OR REPLACE FUNCTION get_order_status_label(
  in_status IN VARCHAR2
)
RETURN VARCHAR2
IS
BEGIN
  RETURN CASE UPPER(TRIM(in_status))
    WHEN 'PENDING'   THEN 'Menunggu Konfirmasi'
    WHEN 'PROCESSING' THEN 'Sedang Diproses'
    WHEN 'SHIPPED'   THEN 'Sudah Dikirim'
    WHEN 'DELIVERED' THEN 'Sudah Diterima'
    WHEN 'CANCELLED' THEN 'Dibatalkan'
    ELSE                  'Status Tidak Dikenal'
  END;
END get_order_status_label;
/
```
]

`UPPER(TRIM(in_status))` diterapkan sebelum pencocokan `CASE` untuk memastikan bahwa perbedaan kapitalisasi atau spasi berlebih pada nilai input tidak menyebabkan _function_ jatuh ke cabang `ELSE`. Normalisasi input di dalam _function_ mengurangi beban validasi pada sisi pemanggil.

Cabang `ELSE` dengan nilai `'Status Tidak Dikenal'` dipilih daripada mengembalikan `NULL`, agar pemanggil selalu mendapatkan nilai string yang dapat langsung ditampilkan tanpa perlu pemeriksaan `NULL` tambahan.

#col(
  code(header: "Pemanggilan tunggal", numbering: false)[
```sql
BEGIN
  DBMS_OUTPUT.PUT_LINE(
    get_order_status_label('shipped')
  );
  -- Output: Sudah Dikirim

  DBMS_OUTPUT.PUT_LINE(
    get_order_status_label('  Pending  ')
  );
  -- Output: Menunggu Konfirmasi
END;
/
```
  ],
  code(header: "Pemanggilan dari SELECT", numbering: false)[
```sql
SELECT
  order_id,
  status,
  get_order_status_label(status)
    AS status_label
FROM orders
WHERE ROWNUM <= 10;
```
  ]
)

Pemanggilan dari `SELECT` pada contoh di atas menunjukkan kelebihan _function_ dibandingkan logika `CASE` yang ditulis langsung di dalam query: kode lebih ringkas, label dapat diubah cukup di satu tempat, dan query yang menggunakannya tidak perlu dimodifikasi.

#img(
  "assets/ss-3c.png",
  caption: [Pengujian `get_order_status_label` dengan berbagai variasi kapitalisasi input yang menunjukkan normalisasi `UPPER(TRIM(...))` bekerja dengan benar]
)

= Kesimpulan

+ _PL/SQL function_ terbukti merupakan blok kode bernama yang wajib mengembalikan satu nilai, dibedakan dari _procedure_ yang bersifat opsional dalam pengembalian nilai dan tidak dapat ditempatkan langsung dalam ekspresi SQL.
+ Sintaks `CREATE OR REPLACE FUNCTION` berhasil diterapkan untuk mendefinisikan _function_ yang dapat dipanggil berulang kali tanpa perlu menghapus definisi lama terlebih dahulu.
+ _Function_ `get_total_sales` dari tutorial berhasil diimplementasikan dan dipanggil dari blok anonim maupun pernyataan `SELECT`, membuktikan fleksibilitas penggunaan _function_ di berbagai konteks PL/SQL.
+ Tiga _function_ buatan sendiri berhasil diimplementasikan dengan kegunaan yang berbeda: `get_avg_items_sold_per_year` untuk agregasi data historis, `get_customers_by_order_year` untuk pemfilteran data pelanggan menggunakan `SYS_REFCURSOR`, dan `get_order_status_label` untuk pemetaan kode status tanpa akses basis data.
+ Analisis kompleksitas menunjukkan bahwa _function_ yang hanya mengandalkan logika PL/SQL murni (tanpa query) berjalan dalam $O(1)$, sementara _function_ yang melibatkan query SQL tergantung pada ukuran data dan strategi pengindeksan yang diterapkan pada tabel terkait.
