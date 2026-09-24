#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "PL2B2",
  course: "Praktikum Pemrograman Web 1",
  course-code: "PPW1",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "12",
  title: "PHP CRUD",
)

#show: report.with(
  ..metadata,
  association: (
    program: "Teknologi Rekayasa Perangkat Lunak",
    department: "Teknik Elektro dan Informatika",
    faculty: "Sekolah Vokasi",
    university: "Universitas Gadjah Mada",
    city: "Yogyakarta",
    logo: image("assets/logo.png", width: 6cm),
  ),
  year: 2026,
  use-cover: true,
  bib: bibliography("references.bib", style: "ieee"),
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
)

#set par(justify: true, first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

#let include-code(path, ..args) = code-from-file(
  read(path),
  lang: path.split(".").at(-1),
  header: [#path.split("/").at(-1)],
  ..args,
)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), ..args)

#daftar-isi()

// ── Tujuan Praktikum ────────────────────────────────────────────────────────

= Tujuan Praktikum

+ Memahami penggunaan PHP PDO (_PHP Data Objects_) untuk berinteraksi dengan basis data menggunakan _prepared statements_ yang aman dari injeksi SQL.
+ Memahami implementasi operasi CRUD (_Create, Read, Update, Delete_) pada tabel basis data relasional menggunakan PHP dan Bootstrap 5 sebagai _framework_ antarmuka.
+ Memahami penggunaan kueri SQL `LEFT JOIN` dan fungsi agregasi untuk menampilkan data gabungan dari beberapa tabel secara dinamis.
+ Memahami penerapan mekanisme keamanan web, yaitu pencegahan _Cross-Site Scripting_ (XSS) dan _Cross-Site Request Forgery_ (CSRF) pada formulir PHP.
+ Memahami konversi nilai angka menjadi huruf mutu serta penghitungan predikat kelulusan berdasarkan IPK menggunakan logika kondisional PHP.

// ── Dasar Teori ─────────────────────────────────────────────────────────────

= Dasar Teori

== PHP dan PDO (_PHP Data Objects_)

PDO (_PHP Data Objects_) adalah ekstensi PHP yang menyediakan lapisan abstraksi untuk berinteraksi dengan berbagai sistem manajemen basis data tanpa perlu mengubah kode aplikasi ketika berpindah _database_ @php-pdo. Dibandingkan dengan ekstensi `mysql_*` yang sudah tidak didukung, PDO mendukung _prepared statements_ yang secara inheren mencegah injeksi SQL dengan memisahkan instruksi SQL dari data pengguna - parameter dikirim secara terpisah dan tidak pernah diinterpretasikan sebagai kode SQL @php-pdo-prepared. Koneksi dibuat melalui objek `PDO` dengan _Data Source Name_ (DSN), nama pengguna, dan kata sandi; kueri selanjutnya dieksekusi melalui metode `prepare()` dan `execute()` dengan nilai parameter yang diikat secara aman melalui _positional placeholder_ (`?`).

== Operasi CRUD

CRUD merupakan akronim dari empat operasi dasar pengelolaan data persisten: _Create_ (menyimpan data baru), _Read_ (membaca dan menampilkan data), _Update_ (memperbarui data yang ada), dan _Delete_ (menghapus data). Dalam aplikasi web berbasis PHP dan MySQL, keempat operasi ini berkorespondensi langsung dengan pernyataan SQL `INSERT`, `SELECT`, `UPDATE`, dan `DELETE`. Pola umum implementasinya adalah memisahkan setiap operasi ke dalam berkas PHP tersendiri sehingga tanggung jawab kode lebih jelas dan mudah dikelola; _redirect_ setelah operasi tulis (_Post-Redirect-Get_ pattern) juga diterapkan untuk mencegah pengiriman formulir ganda ketika pengguna me-_refresh_ halaman.

== Bootstrap 5

Bootstrap 5 adalah _framework_ CSS _open-source_ yang dikembangkan oleh tim Twitter, dirancang untuk mempercepat pembangunan antarmuka web yang responsif dan konsisten di berbagai ukuran layar @bootstrap5-docs. Bootstrap menyediakan sistem kisi (_grid system_) 12 kolom berbasis _flexbox_, komponen UI siap pakai seperti _card_, tabel, _badge_, _alert_, dan ikon (_Bootstrap Icons_), serta kelas utilitas untuk memanipulasi tata letak tanpa menulis CSS kustom. Validasi formulir sisi klien dapat divisualisasikan menggunakan kelas `is-valid` dan `is-invalid` yang merender umpan balik visual berwarna secara otomatis, memberikan informasi langsung kepada pengguna mengenai kebenaran isian @bootstrap5-forms.

== SQL: _LEFT JOIN_ dan Fungsi Agregasi

`LEFT JOIN` adalah jenis penggabungan tabel yang mengembalikan seluruh baris dari tabel kiri meskipun tidak ditemukan baris yang cocok di tabel kanan - baris tanpa pasangan akan diisi nilai `NULL` pada kolom tabel kanan @mysql-join. Teknik ini penting pada relasi satu-ke-banyak agar data entitas induk tidak hilang dari tampilan ketika rekaman referensinya dihapus dari tabel lain. Fungsi agregasi seperti `COUNT()` dan `AVG()` digunakan untuk menghitung jumlah baris dan nilai rata-rata suatu kolom secara langsung di tingkat kueri SQL, sehingga statistik ringkas dapat diperoleh tanpa perlu memanipulasi data di sisi PHP @mysql-aggregate.

== Keamanan Web: XSS dan CSRF

_Cross-Site Scripting_ (XSS) adalah kerentanan keamanan yang memungkinkan penyerang menyuntikkan skrip berbahaya ke dalam konten halaman web yang dilihat oleh pengguna lain, misalnya untuk mencuri _cookie_ sesi @owasp-xss. Pencegahannya dilakukan dengan fungsi `htmlspecialchars()` yang mengonversi karakter khusus HTML seperti `<`, `>`, `"`, dan `&` menjadi entitas HTML sebelum nilai ditampilkan ke peramban. _Cross-Site Request Forgery_ (CSRF) adalah serangan yang memanfaatkan sesi pengguna yang telah terautentikasi untuk mengirimkan permintaan palsu ke server tanpa sepengetahuan pengguna @owasp-csrf. Mitigasinya dilakukan dengan menyertakan _token_ CSRF unik yang tidak dapat ditebak pada setiap formulir, kemudian memverifikasi keberadaan dan validitas _token_ tersebut di sisi server sebelum permintaan diproses.

// ── Hasil dan Pembahasan ────────────────────────────────────────────────────

#pagebreak()

= Hasil dan Pembahasan

== Tugas 1: Sistem CRUD Data Mahasiswa

Tugas ini mengimplementasikan sistem manajemen data mahasiswa dengan operasi _Create_, _Read_, _Update_, dan _Delete_ menggunakan PHP PDO dan basis data MySQL. Sistem dirancang dengan dua tabel relasional - `mahasiswa` dan `prodi` - yang dihubungkan melalui _foreign key_, serta antarmuka berbasis Bootstrap 5 yang responsif.

=== Skema Database

Struktur basis data didefinisikan dalam berkas `schema.sql`. Terdapat dua tabel: tabel `prodi` menyimpan daftar program studi, dan tabel `mahasiswa` menyimpan data mahasiswa dengan kolom `prodi_id` sebagai _foreign key_ yang mereferensikan tabel `prodi`. Kolom `nim` pada tabel `mahasiswa` diberi _constraint_ `UNIQUE` untuk menjamin tidak ada NIM yang terdaftar ganda di tingkat basis data, sehingga integritas data terjaga secara absolut tanpa bergantung pada logika aplikasi semata.

#include-code("schema.sql", line-range: (10, 25))

#img(
  "assets/1-tabel-mahasiswa-pma.png",
  caption: [Struktur tabel `mahasiswa` pada phpMyAdmin dengan _constraint_ `UNIQUE` pada kolom `nim` dan _foreign key_ ke tabel `prodi`.],
)

#img(
  "assets/2-tabel-prodi-pma.png",
  caption: [Struktur tabel `prodi` pada phpMyAdmin sebagai tabel referensi program studi.],
)

=== Read - Halaman Daftar Mahasiswa

Halaman utama (`index.php`) menjalankan dua kueri sebelum merender tampilan. Kueri pertama menggunakan fungsi agregasi `COUNT()` dan `AVG()` untuk menghitung total mahasiswa dan rata-rata IPK secara langsung di sisi _database_, menghasilkan nilai statistik yang ditampilkan pada _stat card_ di bagian atas halaman. Kueri kedua menggunakan `LEFT JOIN` antara tabel `mahasiswa` dan `prodi` agar seluruh data mahasiswa tetap muncul di tabel meskipun rekaman prodi yang dirujuk telah dihapus - nilai kolom prodi untuk baris tersebut akan ditampilkan sebagai `'Tidak diketahui'` sebagai _fallback_.

#include-code("src/index.php", line-range: (13, 24))

Setiap baris tabel menampilkan nilai IPK dalam komponen _badge_ Bootstrap dengan warna yang dikondisikan secara dinamis: hijau (`bg-success`) untuk IPK 3.00 ke atas, kuning (`bg-warning`) untuk 2.00–2.99, dan merah (`bg-danger`) untuk di bawah 2.00. Warna ini memberikan umpan balik visual instan tanpa memerlukan interaksi tambahan.

#include-code("src/index.php", line-range: (92, 95))

#img(
  "assets/3-halaman-index.png",
  caption: [Halaman index menampilkan _stat card_ total mahasiswa dan rata-rata IPK serta tabel data dengan _badge_ IPK berwarna dinamis.],
)

=== Create - Form Tambah Mahasiswa

Berkas `create.php` menerapkan validasi _backend_ berlapis sebelum data disimpan ke basis data. Setiap _field_ melalui pemeriksaan eksistensi, tipe data, dan rentang nilai: IPK harus berupa angka antara 0.00–4.00, semester harus bilangan bulat antara 1–14. Khusus untuk NIM, validasi dilakukan dengan kueri `SELECT` terlebih dahulu guna memberi pesan kesalahan lebih awal sebelum eksekusi `INSERT`.

#include-code("src/create.php", line-range: (14, 52))

Setelah semua validasi lulus, sistem menentukan predikat kelulusan berdasarkan nilai IPK menggunakan rantai `if-elseif`. Proses penyimpanan kemudian dibungkus dalam blok `try-catch` untuk menangkap `PDOException` berkode `23000` (_Integrity Constraint Violation_). Teknik ini menangani _race condition_ di mana dua permintaan simultan berhasil melewati validasi `SELECT` awal secara bersamaan - kesalahan _constraint_ basis data ditangkap dan diubah menjadi pesan validasi yang ramah pengguna, bukan halaman galat.

#include-code("src/create.php", line-range: (53, 85))

#img(
  "assets/4-halaman-create.png",
  caption: [Form tambah mahasiswa dengan _dropdown_ prodi yang terisi secara dinamis dari tabel `prodi`.],
)

#img(
  "assets/5-halaman-create-invalid.png",
  caption: [Umpan balik validasi `is-invalid` pada form tambah ketika _field_ tidak memenuhi aturan yang ditetapkan.],
)

#img(
  "assets/6-create-flash-berhasil.png",
  caption: [_Flash message_ sukses disertai predikat kelulusan yang tampil di halaman index setelah data berhasil disimpan.],
)

=== Update - Form Edit Mahasiswa

Berkas `edit.php` mengambil data lama mahasiswa dari basis data berdasarkan `id` dari parameter URL, lalu mengisi ulang (_repopulate_) seluruh _field_ formulir dengan nilai tersebut. Ini memungkinkan pengguna melihat data yang ada dan memodifikasi hanya bagian yang diperlukan.

#include-code("src/edit.php", line-range: (26, 33))

Validasi NIM pada operasi _update_ dirancang untuk mengecualikan rekaman yang sedang diedit. Klausa `WHERE nim = ? AND id != ?` memastikan pengguna tetap dapat menyimpan data tanpa mengubah NIM, sekaligus memblokir pengguna lain yang mencoba mendaftarkan NIM yang sama. Setelah validasi lulus, kueri `UPDATE` dieksekusi dengan _prepared statement_ dan sistem mengalihkan pengguna ke halaman utama dengan _flash message_ sukses.

#include-code("src/edit.php", line-range: (50, 87))

#img(
  "assets/7-halaman-edit.png",
  caption: [Form edit dengan seluruh _field_ terepopulasi dari data mahasiswa yang tersimpan di basis data.],
)

#img(
  "assets/8-flash-edit-berhasil.png",
  caption: [_Flash message_ konfirmasi setelah data mahasiswa berhasil diperbarui.],
)

=== Delete - Hapus Data Mahasiswa

Berkas `delete.php` dirancang dengan dua lapisan pengamanan. Pertama, halaman hanya merespons permintaan HTTP `POST` - akses langsung via URL (_GET_) akan dialihkan kembali ke halaman utama. Kedua, _token_ CSRF diverifikasi sebelum kueri apa pun dijalankan, sehingga permintaan penghapusan dari sumber eksternal yang tidak memiliki _token_ valid akan ditolak. Hasil `$stmt->rowCount()` diperiksa untuk memastikan _feedback_ yang akurat: pesan sukses hanya muncul jika baris benar-benar terhapus; jika baris tidak ditemukan (misalnya akibat penghapusan ganda), sistem memberikan pesan peringatan.

#include-code("src/delete.php", line-range: (1, 28))

#img(
  "assets/9-dialog-hapus-data.png",
  caption: [Dialog konfirmasi penghapusan yang muncul sebelum permintaan `DELETE` dikirim ke server.],
)

#img(
  "assets/10-flash-delete-berhasil.png",
  caption: [_Flash message_ sukses setelah baris data mahasiswa berhasil dihapus dari basis data.],
)

#pagebreak()

== Tugas 2: Ekspor Database

Basis data diekspor dari phpMyAdmin dalam format berkas `.sql` dan disimpan di dalam folder proyek sebagai `schema.sql` dan `seed.sql`. Berkas `schema.sql` memuat pernyataan DDL (_Data Definition Language_) untuk membuat tabel `prodi` dan `mahasiswa` beserta seluruh _constraint_-nya, sementara `seed.sql` memuat data awal program studi. Kedua berkas ini memungkinkan replikasi struktur dan isian basis data secara konsisten di lingkungan manapun cukup dengan menjalankan kedua berkas secara berurutan.

#img(
  "assets/11-export-pma.png",
  caption: [Antarmuka ekspor basis data di phpMyAdmin dengan format SQL dipilih.],
)

#img(
  "assets/12-export-downloaded.png",
  caption: [Berkas hasil ekspor basis data yang telah tersimpan di dalam folder proyek.],
)

#pagebreak()

== Tugas 3.1: Konversi Nilai

Berkas `grade.php` mengimplementasikan konversi nilai angka (0–100) menjadi huruf mutu (A–E) beserta keterangannya. Logika konversi menggunakan rantai `if-elseif` yang mengevaluasi nilai secara sekuensial dari ambang tertinggi ke terendah: nilai 80 ke atas menghasilkan Grade A (_Sangat Baik_), 70–79 menghasilkan Grade B (_Baik_), 60–69 Grade C (_Cukup_), 50–59 Grade D (_Kurang_), dan di bawah 50 menghasilkan Grade E (_Tidak Lulus_). Setiap _branch_ mengisi variabel `$result` dengan _array_ yang memuat kunci `grade`, `desc`, `bg`, dan `style` - kunci terakhir digunakan sebagai _inline style_ untuk Grade D yang tidak memiliki padanan kelas Bootstrap bawaan.

#include-code("src/grade.php", line-range: (9, 30))

Antarmuka hasil konversi menggunakan komponen _card_ Bootstrap yang warnanya berubah secara dinamis (_reactive UI_) berdasarkan nilai `$result['bg']`. Kelas `text-bg-{warna}` diterapkan pada _card_ sehingga warna latar dan teks menyesuaikan setiap grade - hijau untuk A, biru untuk B, kuning untuk C, oranye untuk D, dan merah untuk E. Tabel konversi referensi juga ditampilkan di sebelah kanan formulir sebagai panduan pengguna.

#include-code("src/grade.php", line-range: (60, 95))

#img(
  "assets/13-grade-A.png",
  caption: [Hasil konversi nilai 80 ke atas menampilkan Grade A dengan _card_ berwarna hijau.],
)

#img(
  "assets/14-grade-E.png",
  caption: [Hasil konversi nilai di bawah 50 menampilkan Grade E dengan _card_ berwarna merah.],
)

#pagebreak()

== Tugas 3.2: Form Pendataan Mahasiswa

Form pendataan mahasiswa pada `create.php` memiliki lima _field_ wajib: Nama, NIM, Program Studi (_dropdown_ dinamis dari tabel `prodi`), IPK, dan Semester. Setiap _field_ menerapkan mekanisme _value retention_ - nilai yang telah diisi pengguna dipertahankan di dalam atribut `value` setelah formulir dikirim dengan mengambilnya dari `$input[...]` yang telah diinisialisasi di awal. Seluruh nilai yang disisipkan ke dalam atribut HTML dibungkus dengan `htmlspecialchars()` untuk mencegah XSS: karakter seperti `"` dan `<` di dalam input pengguna diubah menjadi entitas HTML sehingga tidak dapat dieksekusi sebagai kode di peramban.

#include-code("src/create.php", line-range: (102, 133))

Umpan balik validasi ditampilkan secara kontekstual menggunakan komponen _validation feedback_ Bootstrap. Apabila sebuah _field_ gagal validasi _backend_, kelas `is-invalid` ditambahkan ke elemen `<input>` atau `<select>` yang bersangkutan, dan elemen `<div class="invalid-feedback">` yang berisi pesan kesalahan spesifik dirender tepat di bawah _field_ tersebut. Pendekatan ini memberikan umpan balik yang presisi tanpa mengosongkan _field_ yang sudah diisi dengan benar.

#include-code("src/create.php", line-range: (102, 117))

Setelah seluruh validasi lulus, sistem menentukan predikat kelulusan berdasarkan IPK menggunakan rantai kondisional: IPK ≥ 3.51 → _Cumlaude_, ≥ 3.01 → _Sangat Memuaskan_, ≥ 2.76 → _Memuaskan_, ≥ 2.00 → _Cukup_, dan di bawah 2.00 → _Tidak Lulus_. Predikat ini disertakan dalam _flash message_ yang ditampilkan di halaman utama setelah _redirect_ berhasil, memberikan konfirmasi langsung kepada pengguna mengenai status akademik yang tersimpan.

#include-code("src/create.php", line-range: (53, 60))

#img(
  "assets/15-form-error.png",
  caption: [Umpan balik `is-invalid` Bootstrap menampilkan pesan kesalahan spesifik per _field_ dengan nilai sebelumnya tetap dipertahankan.],
)

#img(
  "assets/6-create-flash-berhasil.png",
  caption: [_Flash message_ predikat kelulusan di halaman index yang muncul setelah data pendataan berhasil tersimpan.],
)

// ── Kesimpulan ──────────────────────────────────────────────────────────────

#pagebreak()

= Kesimpulan

+ PHP PDO (_PHP Data Objects_) dengan _prepared statements_ menyediakan cara yang aman dan fleksibel untuk berinteraksi dengan basis data, mencegah injeksi SQL secara inheren melalui pemisahan instruksi SQL dari data pengguna.
+ Sistem CRUD yang dibangun menggunakan dua tabel relasional dengan `LEFT JOIN` dan fungsi agregasi SQL memungkinkan pengambilan dan penampilan data yang lengkap, termasuk statistik dinamis, tanpa manipulasi data di sisi PHP.
+ Bootstrap 5 mempercepat pembangunan antarmuka web yang responsif dan konsisten melalui komponen siap pakai seperti _card_, _badge_, tabel, dan _validation feedback_ yang terintegrasi langsung dengan logika validasi _backend_.
+ Penerapan `htmlspecialchars()` untuk pencegahan XSS dan _token_ CSRF untuk melindungi operasi _write_ merupakan dua lapisan keamanan dasar yang wajib diterapkan pada setiap formulir PHP yang berinteraksi dengan basis data.
+ Logika kondisional `if-elseif` PHP terbukti efektif untuk mengimplementasikan aturan bisnis seperti konversi nilai angka menjadi huruf mutu dan penentuan predikat kelulusan berdasarkan rentang IPK.

// ── Lampiran ────────────────────────────────────────────────────────────────

#pagebreak()
#heading(level: 1, numbering: none)[Lampiran]
#show link: underline

Kode sumber seluruh tugas pada praktikum ini dapat diakses melalui repositori GitHub melalui tautan berikut: #link("https://github.com/atalariq/PPW1-PHP")
