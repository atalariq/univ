#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2",

  mata-kuliah: "Praktikum Pemrograman Web Lanjutan",
  kode-mata-kuliah: "PPWL",
  nama-dosen-pengampu: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  no-pertemuan: "2",

  judul-praktikum: "Instalasi Laravel (Tugas Pengayaan)",
)

#set page(
  paper: "a4",
  margin: 2.54cm,
)

#set document(
  title: vars.judul-praktikum,
  author: vars.nama,
)

#set text(
  font: "PT Serif",
  size: 12pt,
)

// #1 Cover
#align(center)[
  #upper(
    text(size: 14pt, weight: "bold")[
      LAPORAN PRAKTIKUM \
      #vars.mata-kuliah  \
      PERTEMUAN #vars.no-pertemuan \
      #vars.judul-praktikum
    ],
  )

  #v(1fr)

  #image(
    "assets/logo-UGM.png",
    width: 6cm,
  )

  #v(1fr)

  Disusun oleh:
  #table(
    columns: 3,
    align: left,
    stroke: none,
    [Nama], [:], [#vars.nama],
    [NIM], [:], [#vars.nim],
    [Kelas], [:], [#vars.kode-mata-kuliah\-#vars.kelas],
    [Dosen Pengampu], [:], [#vars.nama-dosen-pengampu],
  )

  #v(0.5fr)

  #upper(
    text(weight: "bold")[
      PROGRAM STUDI D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK \
      DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA \
      SEKOLAH VOKASI \
      UNIVERSITAS GADJAH MADA \
      YOGYAKARTA \
      2026
    ],
  )
]

#pagebreak()

// #2 Content

= Tujuan Praktikum

+ Mengingat kembali dasar-dasar pemrograman dengan PHP.
+ Mengingat kembali konsep dan implementasi CRUD dengan PHP dan MySQL.
+ Memahami dan mempraktikan langkah-langkah instalasi alat/aplikasi yang diperlukan framework PHP Laravel seperti XAMPP dan Composer.

= Langkah Praktikum

== Instalasi XAMPP

XAMPP adalah paket server lokal yang berisi Apache, MySQL/MariaDB, dan PHP. Dengan XAMPP, kita bisa menjalankan aplikasi web di komputer sendiri tanpa harus menyewa hosting.

+ Kunjungi https://www.apachefriends.org lalu klik *Download* untuk sistem operasi yang digunakan.
+ Buka file installer yang sudah ter-download. Jika muncul pesan peringatan, pilih *Yes*.
+ Pilih komponen yang ingin diinstal (biasanya cukup centang Apache, MySQL, dan PHP), lalu klik *Next >*.
+ Pilih lokasi instalasi (default: `C:\xampp`), klik *Next >*.
+ Centang atau tidak Bitnami sesuai kebutuhan, klik *Next >*, lalu klik *Next >* lagi untuk memulai instalasi.
+ Tunggu hingga instalasi selesai, lalu klik *Finish*.
+ Buka XAMPP Control Panel, klik *Start* pada Apache dan MySQL untuk menjalankan server lokal.
+ Ketik `localhost` di browser untuk memastikan server sudah berjalan.

#image("assets/php-version.png")

== Instalasi Composer

Composer adalah package manager untuk PHP. Laravel diinstal melalui Composer, jadi Composer harus terinstall terlebih dahulu.

+ Kunjungi https://getcomposer.org/download.
+ Klik *Composer-Setup.exe* untuk mengunduh installer.
+ Buka file installer, pilih *Install for all users*, lalu klik *Next >*.
+ Pilih lokasi instalasi Composer, klik *Next >*.
+ Pada pengaturan proxy, biarkan kosong lalu klik *Next >*, kemudian klik *Install*.
+ Tunggu proses instalasi, lalu klik *Finish*.
+ Buka terminal (CMD/PowerShell), ketik `composer --version` untuk memastikan Composer sudah terinstall.
  #image("assets/composer-version.png")

== Instalasi Laravel

+ Buka terminal, buat folder baru untuk proyek:
  ```
  mkdir <nama-proyek>
  cd <nama-proyek>
  ```
+ Jalankan perintah berikut untuk membuat proyek Laravel baru (versi terbaru):
  ```
  composer create-project laravel/laravel:"^12" .
  ```
  #image("assets/laravel-composer-install.png")
+ Tunggu hingga proses instalasi selesai.
  #image("assets/laravel-installed.png")
+ Jalankan server development Laravel:
  ```
  php artisan serve
  ```
  #image("assets/php-artisan-serve.png")
+ Buka browser, ketik `http://127.0.0.1:8000`. Jika muncul halaman default Laravel, instalasi berhasil.
  #image("assets/laravel-web.png")

= Tugas Pengayaan

#let item-counter = counter("item-counter")
#set enum(start: 0)

#show enum: it => {
  if it.start != 0 { return it }
  let args = it.fields()
  let items = args.remove("children")
  context enum(..args, start: item-counter.get().first() + 1, ..items)
  item-counter.update(i => i + it.children.len())
}

== A. Konsep Dasar CRUD

+ Jelaskan apa yang dimaksud dengan CRUD dan sebutkan kepanjangannya!\
  CRUD merupakan singkatan dari empat operasi dasar basis data: *Create* (menambah data baru), *Read* (membaca atau menampilkan data), *Update* (mengubah data yang sudah ada), dan *Delete* (menghapus data). Keempat operasi ini merupakan fondasi dari hampir semua aplikasi web dinamis yang berinteraksi dengan basis data @php_mysqli_connect.

+ Mengapa penting bagi seorang pengembang web memahami CRUD menggunakan PHP native terlebih dahulu sebelum menggunakan framework seperti Laravel?\
  Memahami CRUD dengan PHP native penting karena dua alasan.

  Pertama, developer memahami alur kerja dasar di balik interaksi PHP-MySQL: koneksi basis data, penulisan query, pengolahan input. Tanpa pemahaman ini, debug menjadi sulit ketika framework mengalami error.

  Kedua, Laravel menggunakan Eloquent ORM yang menggantikan penulisan SQL manual. Developer yang tidak pernah menulis query langsung akan kesulitan ketika perlu operasi yang tidak tersedia di ORM.

== B. Koneksi Database

+ Sebutkan dan jelaskan keempat parameter yang digunakan pada fungsi `mysqli_connect()` pada file `koneksi.php`!\
  Keempat parameter utama `mysqli_connect()` adalah:
  - `$servername`: nama host atau alamat IP server MySQL (misalnya `"localhost"`).
  - `$username`: nama pengguna MySQL untuk autentikasi.
  - `$password`: kata sandi MySQL.
  - `$dbname`: nama basis data yang akan digunakan.
  Dua parameter opsional tambahan adalah `$port` (nomor port, default 3306) dan `$socket` (path Unix socket) @php_mysqli_connect.

+ Apa fungsi dari potongan kode `if (!$koneksi) { die("Koneksi gagal: " .mysqli_connect_error()); }` pada koneksi.php, dan kapan bagian di dalamnya akan dijalankan?\
  Potongan kode tersebut berfungsi sebagai *pengecekan koneksi*. Jika `mysqli_connect()` gagal mengembalikan objek koneksi (karena credential salah, server down, atau masalah jaringan), variabel `$koneksi` bernilai `false`. Blok `die()` akan menghentikan eksekusi script dan menampilkan pesan error beserta keterangan error dari `mysqli_connect_error()`. Ini mencegah script berlanjut tanpa koneksi basis data, yang akan menyebabkan error di setiap query berikutnya @php_mysqli_connect.

+ Mengapa file `koneksi.php` di-include pada hampir semua file CRUD lainnya (`index.php`, `proses_tambah.php`, `edit.php`, dan seterusnya)?\
  File `koneksi.php` di-include di setiap file karena berisi satu-satunya koneksi basis data yang dibutuhkan. Tanpa include ini, setiap file tidak bisa menjalankan query SQL.   Pendekatan ini menghindari duplikasi kode, karena credentials dan logika koneksi ditulis sekali di satu tempat, lalu digunakan kembali di mana pun diperlukan @php_mysqli_connect.

== C. Create (Menambah Data)

+ Jelaskan mengapa proses Create pada praktikum ini dipisah menjadi dua file, yaitu `tambah.php` dan `proses_tambah.php`!|
  Pemisahan `tambah.php` (form HTML untuk input) dan `proses_tambah.php` (logika PHP untuk memproses input) mengikuti pola *separation of concerns*.   Form hanya menampilkan antarmuka input, sedangkan pemrosesan data, yaitu validasi, sanitasi, INSERT ke database, dilakukan di file terpisah. Pola ini juga memungkinkan redirect yang bersih setelah data tersimpan dan memisahkan logika presentasi dari logika bisnis @php_mysqli_connect.

+ Tuliskan query SQL `INSERT` untuk menambahkan data buku baru dengan `judul` "Bumi Manusia", `penulis` "Pramoedya Ananta Toer", `harga` 95000, dan `tgl_terbit` "1980-08-10"!\
  Query SQL INSERT:
  ```sql
  INSERT INTO buku (judul, penulis, harga, tgl_terbit)
  VALUES ('Bumi Manusia', 'Pramoedya Ananta Toer', 95000, '1980-08-10');
  ```

+ Apa fungsi perintah `header("Location: index.php");` pada bagian akhir file `proses_tambah.php`?\
  `header("Location: index.php")` mengirim HTTP *redirect* ke browser. Browser akan secara otomatis memuat ulang halaman `index.php` setelah data berhasil ditambahkan. Tanpa redirect ini, browser akan tetap menampilkan `proses_tambah.php` yang kosong (tanpa output HTML), atau pengguna harus menekan tombol "Back" secara manual @php_mysqli_connect.

== D. Read (Menampilkan Data)

+ Jelaskan fungsi dari `mysqli_fetch_assoc()` dan mengapa perintah tersebut diletakkan di dalam perulangan while pada file `index.php`!\
  `mysqli_fetch_assoc()` mengambil satu baris dari result set dan mengembalikannya sebagai *associative array*, di mana setiap kolom diakses dengan nama kolomnya (misal `$row["judul"]`). Fungsi ini diletakkan di dalam `while` karena satu query SELECT bisa mengembalikan banyak baris. Setiap iterasi `while` memanggil `fetch_assoc()` sekali, mengambil baris berikutnya, hingga tidak ada baris lagi (mengembalikan `null`) dan loop berhenti @php_mysqli_fetch_assoc.

+ Tuliskan query SQL untuk menampilkan seluruh data pada tabel buku, diurutkan berdasarkan kolom harga dari yang termahal ke termurah!\
  Query SQL:
  ```sql
  SELECT * FROM buku ORDER BY harga DESC;
  ```

+ Jika hasil satu baris data pada perulangan while disimpan pada variabel `$buku`, bagaimana cara menampilkan nilai dari kolom judul pada baris tersebut?\
  Cara menampilkan kolom judul:
  ```php
  echo $buku["judul"];
  ```

== E. Update (Mengubah Data)

+ Jelaskan mengapa file `edit.php` perlu mengambil data lama dari database `(SELECT ... WHERE id = ...)` sebelum form ditampilkan kepada pengguna!\
  Data lama perlu diambil terlebih dahulu agar form edit terisi dengan nilai-nilai yang sudah ada. Tanpa `SELECT ... WHERE id = ...`, form akan muncul kosong, dan pengguna harus mengetik ulang seluruh data , termasuk field yang tidak ingin diubah. Pengambilan data ini memungkinkan pengguna hanya mengubah kolom tertentu sementara sisanya tetap sama @php_mysqli_connect.

+ Tuliskan query SQL UPDATE untuk mengubah harga buku dengan `id = 3` menjadi `120000`!\
  Query SQL UPDATE:
  ```sql
  UPDATE buku SET harga = 120000 WHERE id = 3;
  ```
+ Pada form edit.php terdapat baris `<input type="hidden" name="id" value="<?php echo $data['id']; ?>">`. Jelaskan fungsi input tersembunyi (hidden input) tersebut!\
  Input tersembunyi (`type="hidden"`) menyimpan nilai `id` tanpa menampilkannya ke pengguna. Saat form disubmit, nilai `id` ikut terkirim ke server melalui `$_POST["id"]`. Ini penting karena `UPDATE` membutuhkan `WHERE id = ...` untuk menentukan baris mana yang akan diubah. Tanpa hidden input ini, server tidak tahu record mana yang harus diperbarui @php_mysqli_connect.

== F. Delete (Menghapus Data)

+ Apa yang akan terjadi apabila klausa `WHERE` pada query `DELETE FROM buku WHERE id = '$id'` tidak dituliskan? Jelaskan risikonya!\
  Tanpa klausa `WHERE`, query menjadi `DELETE FROM buku`. MySQL akan menghapus *seluruh baris* di tabel buku. Semua data hilang tanpa bisa dikembalikan. Dalam production database, ini bisa menghapus ribuan atau jutaan record sekaligus . Kerugiannya tidak terbantahkan.@php_mysqli_connect.

+ Tuliskan query SQL untuk menghapus data buku dengan `id = 7`!\
  Query SQL DELETE:
  ```sql
  DELETE FROM buku WHERE id = 7;
  ```

== G. Pengayaan Lanjutan (Keamanan & Best Practice)

+ Kode pada praktikum ini memasukkan nilai dari `$_POST`/`$_GET` langsung ke dalam query SQL, seperti pada "`... WHERE id = '$id'`". Kerentanan keamanan apa yang mungkin timbul dari cara penulisan seperti ini?\
  Kerentanan utamanya adalah *SQL Injection*. Ketika nilai `$_POST` atau `$_GET` dimasukkan langsung ke query tanpa sanitasi, penyerang bisa memanipulasi input untuk menjalankan query yang tidak diinginkan. Contoh klasik: jika form login menerima `username` berupa `' OR '1'='1`, query berubah menjadi `SELECT * FROM users WHERE username = '' OR '1'='1'` yang mengembalikan semua baris. Penyerang juga bisa menambahkan `DROP TABLE`, `UNION SELECT`, atau membypass autentikasi sepenuhnya @php_sql_injection @owasp_xss.

+ Jelaskan secara singkat bagaimana teknik prepared statement (`mysqli_prepare()` dan `bind_param()`) dapat digunakan untuk mengatasi kerentanan pada soal sebelumnya!\
  Prepared statement memisahkan struktur query dari nilai parameter. Dengan `mysqli_prepare()`, query dikirim ke MySQL terlebih dahulu dengan placeholder (`?`). Kemudian `bind_param()` mengikat nilai aktual ke placeholder tersebut. MySQL membedakan mana SQL command dan mana data, sehingga input seperti `' OR '1'='1'` diperlakukan sebagai string literal biasa, bukan bagian dari struktur query. Dokumentasi PHP menyatakan bahwa "bound parameters do not need to be escaped as they are never substituted into the query string directly" @php_prepared_statements @php_mysqli_prepare.

+ Selain SQL Injection, sebutkan minimal satu risiko lain apabila data input dari form tidak divalidasi terlebih dahulu sebelum disimpan ke database!\
  Tanpa validasi input, data yang tersimpan ke database bisa menyebabkan masalah seperti:
  - *Cross-Site Scripting (XSS)*: input berupa `<script>alert('XSS')</script>` yang tersimpan dan ditampilkan tanpa encoding akan dieksekusi di browser pengguna lain. OWASP mencatat bahwa XSS terjadi "anywhere a web application uses input from a user within the output it generates without validating or encoding it" @owasp_xss @owasp_xss_prevention.
  - *Data corruption*: input yang tidak sesuai tipe data (misal string di kolom INTEGER) menyebabkan error atau data tidak valid.
  - *Business logic errors*: field harga yang menerima nilai negatif, atau email tanpa validasi format, menghasilkan data yang secara logika tidak benar.

#pagebreak()

// #3 Bibliography/References

// Make the title center
#show bibliography: it => {
  show heading: set align(center)
  it
}

#bibliography(
  "references.bib",
  title: "Daftar Pustaka",
  style: "institute-of-electrical-and-electronics-engineers",
)
