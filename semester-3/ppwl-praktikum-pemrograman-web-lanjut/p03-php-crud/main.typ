#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2",

  mata-kuliah: "Praktikum Pemrograman Web Lanjutan",
  kode-mata-kuliah: "PPWL",
  nama-dosen-pengampu: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  no-pertemuan: "3",

  judul-praktikum: "Review PHP CRUD",
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

#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

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
// + Memahami konsep dasar PHP, MySQL, dan HTTP methods sebagai fondasi pengembangan web.
+ Memahami dan mempraktikan instalasi XAMPP sebagai lingkungan pengembangan lokal.

// = Dasar Teori
//
// == PHP
//
// PHP (*PHP: Hypertext Preprocessor*) adalah bahasa scripting server-side. Kode PHP dieksekusi di server, lalu hasilnya dikirim ke browser sebagai HTML @php_manual. Sintaksnya mirip dengan C dan Java, sehingga pengembang yang mengenal kedua bahasa itu lebih mudah beradaptasi. PHP berjalan di Windows, Linux, dan macOS; umumnya digunakan bersama MySQL/MariaDB untuk penyimpanan data.
//
// #figure(
//   image("assets/php-architecture.png"),
//   caption: [Arsitektur dasar PHP: request masuk ke server, dieksekusi oleh modul PHP, lalu menghasilkan HTML yang dikembalikan ke browser.],
// )
//
// == MySQL/MariaDB
//
// MySQL adalah sistem manajemen basis data relasional (RDBMS) yang menggunakan SQL (*Structured Query Language*) sebagai antarmuka utamanya @mysql_docs. MySQL mendukung tabel, indeks, *foreign key*, dan operasi transaksi. MariaDB adalah *fork* dari MySQL yang dikembangkan oleh komunitas setelah MySQL diakuisisi oleh Oracle @mariadb_kb. Keduanya memiliki sintaks SQL yang kompatibel secara luas.
//
// #figure(
//   image("assets/mysql-logo.png"),
//   caption: [Logo MySQL (kiri) dan MariaDB (kanan).],
// )
//
// == phpMyAdmin
//
// phpMyAdmin adalah aplikasi berbasis web untuk mengelola server MySQL/MariaDB @phpmyadmin_docs. Melalui phpMyAdmin, pengguna dapat membuat database dan tabel, menjalankan query SQL secara manual, mengimpor/ekspor data, dan mengelola hak akses pengguna dengan antarmuka grafis, tanpa harus menulis perintah di terminal.
//
// #figure(
//   image("assets/phpmyadmin-screenshot.png"),
//   caption: [Tampilan utama phpMyAdmin: panel kiri menampilkan daftar database, panel kanan menampilkan informasi server.],
// )
//
// == CRUD
//
// CRUD merupakan singkatan dari empat operasi dasar basis data: *Create* (menambah data baru), *Read* (membaca atau menampilkan data), *Update* (mengubah data yang sudah ada), dan *Delete* (menghapus data). Keempat operasi ini merupakan fondasi dari hampir semua aplikasi web dinamis yang berinteraksi dengan basis data.
//
// #figure(
//   image("assets/crud-diagram.png"),
//   caption: [Diagram alur operasi CRUD: Create menambah baris baru, Read mengambil baris, Update mengubah baris, Delete menghapus baris.],
// )
//
// == HTTP Methods
//
// HTTP (*Hypertext Transfer Protocol*) mendefinisikan metode-metode permintaan antara klien (browser) dan server @mdn_http. Dua metode yang paling relevan untuk aplikasi PHP adalah:
//
// - *GET*: mengirim data melalui URL sebagai query string (misal `?id=5`), biasanya untuk permintaan pembacaan data.
// - *POST*: mengirim data melalui body request, untuk pengiriman form input, unggahan file, atau data yang tidak boleh terlihat di URL.
//
// Form HTML dengan `method="post"` mengirimkan data input ke file PHP pemroses di sisi server, lalu file tersebut membaca nilai dari `$_POST` untuk diproses.
//
// #figure(
//   image("assets/http-methods.png"),
//   caption: [Perbandingan alur kerja HTTP GET dan POST dalam konteks form PHP.],
// )

= Persiapan Lingkungan

== Instalasi XAMPP

XAMPP adalah paket server lokal berisi Apache, MySQL/MariaDB, dan PHP yang memungkinkan kita menjalankan aplikasi web di komputer sendiri.

+ Kunjungi https://www.apachefriends.org lalu klik *Download* untuk sistem operasi yang digunakan.
+ Buka file installer yang sudah ter-download. Jika muncul pesan peringatan, pilih *Yes*.
+ Pilih komponen yang ingin diinstal (biasanya cukup centang Apache, MySQL, dan PHP), lalu klik *Next >*.
+ Pilih lokasi instalasi (default: `C:\xampp`), klik *Next >*.
+ Centang atau tidak Bitnami sesuai kebutuhan, klik *Next >*, lalu klik *Next >* lagi untuk memulai instalasi.
+ Tunggu hingga instalasi selesai, lalu klik *Finish*.
+ Buka XAMPP Control Panel, klik *Start* pada Apache dan MySQL untuk menjalankan server lokal.
+ Ketik `localhost` di browser untuk memastikan server sudah berjalan.

#image("assets/php-version.png")

= PHP CRUD: Studi Kasus Toko Buku

Praktikum ini membuat aplikasi CRUD (*Create*, *Read*, *Update*, *Delete*) sederhana untuk mengelola data buku.

== Menyiapkan Database

Basis data disiapkan melalui *phpMyAdmin* yang sudah tersedia di XAMPP, sebelum kode PHP ditulis.

+ Buka `http://localhost/phpmyadmin` di browser.
+ Pada kolom *Create database*, ketik nama database `toko_buku`, pilih *utf8mb4_general_ci* pada dropdown *collation*, lalu klik *Create*.
  #image("assets/pma-create-db.png")
+ Setelah database terbuat, buat tabel dengan nama `buku` yang berisi 5 kolom sebagai berikut:
  #table(
    columns: (auto, auto, auto, auto),
    inset: 6pt,
    [Kolom], [Tipe Data], [Atribut], [Keterangan],
    [`id`], [`INT`], [`AUTO_INCREMENT`, *Primary Key*], [Nomor urut otomatis],
    [`judul`], [`VARCHAR(100)`], [], [Judul buku],
    [`penulis`], [`VARCHAR(100)`], [], [Nama penulis],
    [`harga`], [`INT`], [], [Harga buku dalam rupiah],
    [`tgl_terbit`], [`DATE`], [], [Tanggal terbit buku],
  )
  #image("assets/pma-create-table.png")

== Koneksi Database

Semua file CRUD membutuhkan koneksi ke database. Agar kode tidak ditulis berulang-ulang, koneksi dibuat di file khusus `koneksi.php` yang kemudian di-*include* pada file lainnya.

`koneksi.php`:
```php
<?php
$koneksi = mysqli_connect("localhost", "root", "", "toko_buku");
// echo "<pre>";
// var_dump($koneksi);
// echo "</pre>";
```

Fungsi `mysqli_connect()` menerima empat parameter: `servername` (host MySQL, yaitu `localhost`), `username` (`root`), `password` (kosong, sesuai default XAMPP), dan `dbname` (`toko_buku`). Hasil koneksi disimpan pada variabel `$koneksi`, yang dipakai sebagai argumen kedua `mysqli_query()` di setiap file PHP.

== Create (Menambah Data Buku)

Operasi *create* dipisah menjadi dua file: `tambah.php` berisi form input, dan `proses_tambah.php` berisi logika penyimpanan data ke database.

`tambah.php` (form input data buku):
```php
<h2>Tambah Buku</h2>
<form action="proses_tambah.php" method="post">
    <label for="judul">Judul</label>
    <input type="text" name="judul" id="judul">
    <br>
    <label for="penulis">Penulis</label>
    <input type="text" name="penulis" id="penulis">
    <br>
    <label for="harga">Harga</label>
    <input type="text" name="harga" id="harga">
    <br>
    <label for="tgl_terbit">Tanggal Terbit</label>
    <input type="date" name="tgl_terbit" id="tgl_terbit">
    <br>
    <input type="submit" value="Simpan">
</form>
```

Atribut `action="proses_tambah.php" method="post"` membuat browser memuat `proses_tambah.php` dan mengirim data `judul`, `penulis`, `harga`, dan `tgl_terbit` saat tombol *Simpan* diklik.

`proses_tambah.php` (memproses data dari form):
```php
<?php
include 'koneksi.php';

$judul = $_POST['judul'];
$penulis = $_POST['penulis'];
$harga = $_POST['harga'];
$tgl_terbit = $_POST['tgl_terbit'];

$sql = "INSERT INTO buku (judul, penulis, harga, tgl_terbit)
VALUES ('$judul', '$penulis', '$harga', '$tgl_terbit')";

if(mysqli_query($koneksi, $sql)) {
    header("Location: index.php");
} else {
    echo "Gagal Menyimpan" . mysqli_error($koneksi);
}
```

Nilai `$_POST` ditampung ke variabel masing-masing, lalu disusun menjadi query `INSERT`. `mysqli_query($koneksi, $sql)` mengeksekusi query; jika berhasil, `header("Location: index.php")` mengarahkan pengguna kembali ke halaman daftar buku. Jika gagal, `mysqli_error()` menampilkan pesan error.

Form dan hasil penambahan data:

#image("assets/page-tambah-1.png")
#image("assets/page-tambah-2.png")

== Read (Menampilkan Data Buku)

Data buku yang sudah tersimpan di database ditampilkan pada halaman `index.php`. File ini mengambil seluruh data dari tabel `buku` dengan query `SELECT`, lalu menampilkannya satu per satu di dalam tabel HTML.

`index.php`:
```php
<?php
include "koneksi.php";

$sql = "SELECT * FROM buku ORDER BY id DESC";
$hasil = mysqli_query($koneksi, $sql);
?>

<h2>Data Buku</h2>
<a href="tambah.php">Tambah Buku</a>
<table border="1" frame="void" cellpadding="8">
    <tr>
        <th>No.</th>
        <th>Judul Buku</th>
        <th>Penulis</th>
        <th>Harga</th>
        <th>Tanggal Terbit</th>
        <th>Aksi</th>
    </tr>
<?php $no = 1; while($buku = mysqli_fetch_assoc($hasil)) { ?>
    <tr>
        <td><?= $no++ ?></td>
        <td><?= $buku['judul'] ?></td>
        <td><?= $buku['penulis'] ?></td>
        <td><?= $buku['harga'] ?></td>
        <td><?= $buku['tgl_terbit'] ?></td>
        <td>
            <a href="edit.php?id=<?= $buku['id']?>">Edit</a>
            <a href="proses_hapus.php?id=<?= $buku['id']?>">Hapus</a>
        </td>
    </tr>
<?php } ?>
</table>
```

Query `SELECT * FROM buku ORDER BY id DESC` mengambil semua baris tabel `buku`, diurutkan dari `id` terbesar, sehingga buku yang baru ditambahkan tampil paling atas. `mysqli_query()` mengembalikan *result set*, lalu perulangan `while` memanggil `mysqli_fetch_assoc($hasil)` untuk mengambil satu baris per iterasi sebagai array asosiatif; nilai kolom diakses lewat nama kolomnya, misalnya `$buku['judul']`. Nomor urut dihitung dari variabel `$no`. Tautan *Edit* dan *Hapus* di kolom *Aksi* membawa `id` buku lewat query string (`?id=...`).

Tampilan halaman daftar buku:

#image("assets/page-index-1.png")
#image("assets/page-index-2.png")

== Update (Mengubah Data Buku)

Operasi *update* terdiri dari tiga langkah: mengambil data lama berdasarkan `id`, menampilkannya dalam form yang sudah terisi, lalu menyimpan perubahan.

`edit.php` (mengambil data lama dan menampilkan form edit):
```php
<?php
include "koneksi.php";

$id = $_GET['id'];
$sql = "SELECT * FROM buku WHERE id = '$id'";
$data = mysqli_fetch_assoc(mysqli_query($koneksi, $sql));
?>

<h2>Edit Buku</h2>
<form action="proses_edit.php" method="post">
    <input type="hidden" name="id" id="id" value="<?= $data['id'] ?>">
    <br>
    <label for="judul">Judul</label>
    <input type="text" name="judul" id="judul" value="<?= $data['judul'] ?>">
    <br>
    <label for="penulis">Penulis</label>
    <input type="text" name="penulis" id="penulis" value="<?= $data['penulis'] ?>">
    <br>
    <label for="harga">Harga</label>
    <input type="text" name="harga" id="harga" value="<?= $data['harga'] ?>">
    <br>
    <label for="tgl_terbit">Tanggal Terbit</label>
    <input type="date" name="tgl_terbit" id="tgl_terbit" value="<?= $data['tgl_terbit'] ?>">
    <br>
    <input type="submit" value="Update">
</form>
```

`id` dibaca dari URL melalui `$_GET['id']`. Query `SELECT * FROM buku WHERE id = '$id'` mengambil data buku lama, yang disimpan ke `$data` agar atribut `value` tiap input terisi nilai yang sudah ada. Input tersembunyi (`type="hidden"`) dengan `name="id"` memastikan `id` ikut terkirim saat form dikirim, sehingga server tahu baris mana yang diperbarui.

`proses_edit.php` (menyimpan hasil perubahan):
```php
<?php
include 'koneksi.php';

$id = $_POST['id'];
$judul = $_POST['judul'];
$penulis = $_POST['penulis'];
$harga = $_POST['harga'];
$tgl_terbit = $_POST['tgl_terbit'];

$sql = "UPDATE buku SET
            judul='$judul',
            penulis='$penulis',
            harga='$harga',
            tgl_terbit='$tgl_terbit'
        WHERE id = '$id'";

if(mysqli_query($koneksi, $sql)) {
    header("Location: index.php");
} else {
    echo "Gagal Update:" . mysqli_error($koneksi);
}
```

Semua nilai form, termasuk `id`, diterima melalui `$_POST`. Query `UPDATE ... WHERE id = '$id'` mengubah kolom yang diinginkan hanya pada baris yang sesuai dengan `id` tersebut. Jika berhasil, pengguna diarahkan kembali ke `index.php`.

Tampilan halaman edit:

#image("assets/page-edit.png")

== Delete (Menghapus Data Buku)

Operasi *delete* cukup sederhana karena hanya memerlukan `id` buku yang akan dihapus.

`proses_hapus.php`:
```php
<?php
include 'koneksi.php';

$id = $_GET['id'];
$sql = "DELETE FROM buku WHERE id = '$id'";

if(mysqli_query($koneksi, $sql)) {
    header("Location: index.php");
} else {
    echo "Gagal Menghapus:" . mysqli_error($koneksi);
}
```

Tautan *Hapus* pada `index.php` mengarah ke `proses_hapus.php?id=<id_buku>`, sehingga `id` dapat dibaca dari `$_GET['id']`. Query `DELETE FROM buku WHERE id = '$id'` menghapus hanya baris dengan `id` tersebut, lalu pengguna diarahkan kembali ke daftar buku.

Keadaan daftar buku sebelum dan sesudah penghapusan:

#image("assets/page-delete-before.png")
#image("assets/page-delete-after.png")

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
  Penting karena dua alasan.

  Pertama, pengembang memahami alur kerja di balik interaksi PHP-MySQL: koneksi basis data, penulisan query, dan pengolahan input. Tanpa pemahaman ini, debugging menjadi sulit ketika framework mengalami error.

  Kedua, Laravel menggunakan Eloquent ORM yang menangani penulisan SQL secara otomatis. Pengembang yang belum pernah menulis query langsung akan kesulitan saat butuh operasi yang tidak tersedia di ORM.

== B. Koneksi Database

+ Sebutkan dan jelaskan keempat parameter yang digunakan pada fungsi `mysqli_connect()` pada file `koneksi.php`!\
  Keempat parameter utama `mysqli_connect()` adalah:
  - `$servername`: nama host atau alamat IP server MySQL (misalnya `"localhost"`).
  - `$username`: nama pengguna MySQL untuk autentikasi.
  - `$password`: kata sandi MySQL.
  - `$dbname`: nama basis data yang akan digunakan.
  Dua parameter opsional tambahan adalah `$port` (nomor port, default 3306) dan `$socket` (path Unix socket) @php_mysqli_connect.

+ Apa fungsi dari potongan kode `if (!$koneksi) { die("Koneksi gagal: " .mysqli_connect_error()); }` pada koneksi.php, dan kapan bagian di dalamnya akan dijalankan?\
  `if (!$koneksi)` mengecek hasil koneksi. Jika `mysqli_connect()` gagal mengembalikan objek koneksi karena kredensial salah, server tidak aktif, atau masalah jaringan, `$koneksi` bernilai `false` dan blok `die()` dijalankan: eksekusi script berhenti sambil menampilkan pesan dari `mysqli_connect_error()`. Tanpa pengecekan ini, script tetap berjalan tanpa koneksi basis data dan setiap query berikutnya ikut gagal @php_mysqli_connect.

+ Mengapa file `koneksi.php` di-include pada hampir semua file CRUD lainnya (`index.php`, `proses_tambah.php`, `edit.php`, dan seterusnya)?\
  `koneksi.php` di-include karena merupakan satu-satunya tempat koneksi basis data dibuat; tanpa include, setiap file tidak bisa menjalankan query SQL. Ini juga menerapkan prinsip *Don't Repeat Yourself (DRY)*: kredensial dan logika koneksi ditulis sekali, lalu dipakai ulang di semua file sehingga perubahan konfigurasi cukup dilakukan di satu tempat @php_mysqli_connect.

== C. Create (Menambah Data)

+ Jelaskan mengapa proses Create pada praktikum ini dipisah menjadi dua file, yaitu `tambah.php` dan `proses_tambah.php`!\
  `tambah.php` hanya menampilkan form input, sedangkan `proses_tambah.php` memproses data: validasi, sanitasi, dan `INSERT` ke database. Pemisahan ini mengikuti pola *separation of concerns*, memisahkan logika presentasi dari logika bisnis; redirection setelah data tersimpan pun tetap bersih @php_mysqli_connect.

+ Tuliskan query SQL `INSERT` untuk menambahkan data buku baru dengan `judul` "Bumi Manusia", `penulis` "Pramoedya Ananta Toer", `harga` 95000, dan `tgl_terbit` "1980-08-10"!\
  Query SQL INSERT:
  ```sql
  INSERT INTO buku (judul, penulis, harga, tgl_terbit)
  VALUES ('Bumi Manusia', 'Pramoedya Ananta Toer', 95000, '1980-08-10');
  ```

+ Apa fungsi perintah `header("Location: index.php");` pada bagian akhir file `proses_tambah.php`?\
  `header("Location: index.php")` mengirim HTTP *redirect*, sehingga browser memuat ulang halaman `index.php` setelah data tersimpan. Tanpa redirect, browser tetap menampilkan `proses_tambah.php` yang kosong (tanpa output HTML), atau pengguna harus menekan tombol *Back* secara manual @php_mysqli_connect.

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
  Data lama diambil sebelum form ditampilkan agar tiap input terisi nilai yang sudah ada. Tanpa `SELECT ... WHERE id = ...`, form muncul kosong dan pengguna harus mengetik ulang seluruh data, termasuk field yang tidak diubah. Dengan data lama, pengguna cukup mengubah kolom tertentu sementara sisanya tetap sama @php_mysqli_connect.

+ Tuliskan query SQL UPDATE untuk mengubah harga buku dengan `id = 3` menjadi `120000`!\
  Query SQL UPDATE:
  ```sql
  UPDATE buku SET harga = 120000 WHERE id = 3;
  ```
+ Pada form edit.php terdapat baris `<input type="hidden" name="id" value="<?php echo $data['id']; ?>">`. Jelaskan fungsi input tersembunyi (hidden input) tersebut!\
  Input tersembunyi (`type="hidden"`) menyimpan `id` tanpa menampilkannya ke pengguna. Nilai `id` ikut terkirim ke server lewat `$_POST["id"]` saat form disubmit. `UPDATE` membutuhkan `WHERE id = ...` untuk menentukan baris yang diubah; tanpa hidden input, server tidak tahu record mana yang diperbarui @php_mysqli_connect.

== F. Delete (Menghapus Data)

+ Apa yang akan terjadi apabila klausa `WHERE` pada query `DELETE FROM buku WHERE id = '$id'` tidak dituliskan? Jelaskan risikonya!\
  Tanpa klausa `WHERE`, query menjadi `DELETE FROM buku` yang menghapus seluruh baris tabel. Data hilang tanpa bisa dikembalikan; pada database production, hal ini bisa menghapus ribuan hingga jutaan record sekaligus @php_mysqli_connect.

+ Tuliskan query SQL untuk menghapus data buku dengan `id = 7`!\
  Query SQL DELETE:
  ```sql
  DELETE FROM buku WHERE id = 7;
  ```

== G. Pengayaan Lanjutan (Keamanan & Best Practice)

+ Kode pada praktikum ini memasukkan nilai dari `$_POST`/`$_GET` langsung ke dalam query SQL, seperti pada "`... WHERE id = '$id'`". Kerentanan keamanan apa yang mungkin timbul dari cara penulisan seperti ini?\
  Kerentanan utamanya adalah *SQL Injection*. Ketika nilai `$_POST` atau `$_GET` dimasukkan langsung ke query tanpa sanitasi, penyerang bisa memanipulasi input untuk menjalankan query yang tidak diinginkan. Contoh klasik: jika form login menerima `username` berupa `' OR '1'='1`, query berubah menjadi `SELECT * FROM users WHERE username = '' OR '1'='1'` yang mengembalikan semua baris. Penyerang juga bisa menambahkan `DROP TABLE`, `UNION SELECT`, atau membypass autentikasi sepenuhnya @php_sql_injection @owasp_xss.

+ Jelaskan secara singkat bagaimana teknik prepared statement (`mysqli_prepare()` dan `bind_param()`) dapat digunakan untuk mengatasi kerentanan pada soal sebelumnya!\
  Prepared statement memisahkan struktur query dari nilai parameter. `mysqli_prepare()` mengirim query ke MySQL terlebih dahulu dengan placeholder (`?`), lalu `bind_param()` mengikat nilai aktual ke placeholder tersebut. Karena struktur query dan nilai terpisah, input seperti `' OR '1'='1'` diperlakukan sebagai string literal biasa, bukan bagian dari query. Dokumentasi PHP menyatakan bahwa "bound parameters do not need to be escaped as they are never substituted into the query string directly" @php_prepared_statements @php_mysqli_prepare.

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
