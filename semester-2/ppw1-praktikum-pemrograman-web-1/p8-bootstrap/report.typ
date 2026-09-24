#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web 1",
  course-code: "PPW1",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "8",
  title: "Bootstrap",
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

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), header: [#path.split("/").at(-1)], ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), width: 13cm, ..args)

#daftar-isi()
// #daftar-gambar()
// #daftar-tabel()

// ═══════════════════════════════════════════════════════════════════════════════
// TUJUAN PRAKTIKUM
// ═══════════════════════════════════════════════════════════════════════════════

= Tujuan Praktikum

+ Memahami dan mengimplementasikan _grid system_ Bootstrap untuk menyusun tata
  letak halaman yang responsif pada berbagai ukuran perangkat.
+ Mampu membangun formulir pendaftaran dengan validasi visual menggunakan
  komponen _form_ dan kelas _utility_ Bootstrap.
+ Mengimplementasikan halaman _dashboard_ yang menampilkan data nilai mahasiswa
  dalam bentuk tabel responsif, kartu statistik, dan jendela _modal_ detail.

// ═══════════════════════════════════════════════════════════════════════════════
// DASAR TEORI
// ═══════════════════════════════════════════════════════════════════════════════

= Dasar Teori

== Bootstrap 5 Grid System

Bootstrap 5 menyediakan sistem tata letak berbasis _flexbox_ yang terdiri dari
dua belas kolom virtual di setiap baris (_row_). Sistem ini menggunakan kelas
`container`, `row`, dan `col` untuk membagi ruang halaman secara proporsional.
Setiap kelas `col` dapat dikombinasikan dengan _breakpoint_ yang telah
ditentukan, yaitu `sm` (≥576 px), `md` (≥768 px), `lg` (≥992 px), `xl`
(≥1200 px), dan `xxl` (≥1400 px) @bootstrap-grid. Dengan menuliskan kelas
secara berurutan dari _breakpoint_ terkecil hingga terbesar, misalnya
`col-12 col-md-6 col-lg-4`, tata letak halaman akan beradaptasi secara otomatis
terhadap lebar _viewport_ yang digunakan.

== Komponen Bootstrap

Bootstrap 5 menyediakan koleksi komponen antarmuka siap pakai yang dirancang
untuk memenuhi kebutuhan umum pengembangan web. Beberapa komponen yang
digunakan dalam praktikum ini meliputi @bootstrap-components:

/ `navbar`: Bilah navigasi yang dapat diperluas (_expandable_) dan bersifat
  responsif. Kelas `navbar-expand-lg` mengontrol pada _breakpoint_ mana bilah
  navigasi berubah dari tampilan vertikal (_toggler_) menjadi horizontal.
/ `card`: Kontainer fleksibel yang menampung gambar, judul, deskripsi, dan
  tombol dalam satu kesatuan visual. Kelas `h-100` memastikan seluruh _card_
  dalam satu baris memiliki tinggi yang seragam.
/ `form`: Komponen formulir dengan kelas `form-control`, `form-select`, dan
  `form-label` yang menyediakan gaya bawaan (_default styling_) konsisten
  lintas peramban.
/ `table`: Tabel responsif dengan kelas `table-striped` dan `table-hover`
  untuk meningkatkan keterbacaan data.
/ `modal`: Jendela dialog yang muncul di atas halaman utama, digunakan untuk
  menampilkan informasi detail tanpa meninggalkan halaman saat ini.
/ `alert`: Komponen pemberitahuan yang dapat ditutup (_dismissible_) untuk
  menampilkan pesan sukses, peringatan, atau kesalahan.

== Utility Classes Bootstrap

Bootstrap 5 menyertakan ratusan kelas _utility_ yang dirancang untuk
menerapkan properti CSS secara cepat tanpa menulis lembar gaya kustom.
Beberapa kelas yang digunakan dalam praktikum ini antara lain @bootstrap-components:

/ `d-flex` dan `gap`: Menerapkan _flex container_ dan mengatur jarak antar
  elemen anak, menggantikan penggunaan `margin` individual.
/ `text-center` dan `text-muted`: Mengatur perataan teks dan warna teks
  sekunder.
/ `shadow-sm`: Memberikan efek bayangan halus pada _card_ dan kontainer.
/ `bg-success`, `bg-primary`, `bg-warning`, `bg-danger`: Kelas warna latar
  yang digunakan pada _badge_ untuk mengkategorikan nilai huruf mahasiswa.
/ `flex-fill`: Membuat elemen mengisi sisa ruang yang tersedia dalam
  kontainer _flex_, digunakan pada tombol agar memiliki lebar yang seragam.

== Responsive Web Design dengan Bootstrap

_Responsive Web Design_ (RWD) adalah pendekatan pengembangan web yang
memastikan tampilan halaman beradaptasi secara optimal terhadap berbagai
ukuran perangkat @w3c-mediaqueries. Bootstrap 5 mengadopsi pendekatan
_mobile-first_, yaitu gaya (_style_) dasar ditulis untuk perangkat dengan
ukuran layar terkecil terlebih dahulu, kemudian ditimpa (_override_) melalui
_media query_ untuk layar yang lebih lebar @bootstrap-grid. Konsep ini
tercermin dalam penulisan kelas _grid_ seperti `col-12 col-md-6 col-lg-4`,
di mana `col-12` berlaku secara _default_ (layar kecil), `col-md-6` berlaku
mulai _breakpoint_ `md`, dan `col-lg-4` berlaku mulai _breakpoint_ `lg`.

// ═══════════════════════════════════════════════════════════════════════════════
// HASIL DAN PEMBAHASAN
// ═══════════════════════════════════════════════════════════════════════════════

= Hasil dan Pembahasan

Praktikum ini menghasilkan tiga halaman web yang mendemonstrasikan
penerapan komponen _framework_ Bootstrap 5 secara terisolasi: _grid system_
pada Tugas 1, komponen _form_ pada Tugas 2, serta _dashboard_ dengan tabel
responsif dan jendela _modal_ pada Tugas 3.

#pagebreak()

== Tugas 1: Eksplorasi Grid System

Halaman pertama mengimplementasikan tata letak _grid_ responsif untuk
menampilkan enam kartu informasi dalam satu halaman bertema sejarah. Tiga
komponen utama yang digunakan adalah bilah navigasi (_navbar_), kisi kartu
(_card grid_), dan catatan kaki (_footer_) @bootstrap-components.

=== Navigasi

Bilah navigasi menggunakan kelas `navbar navbar-expand-lg navbar-dark
bg-dark` yang menghasilkan latar gelap dengan teks putih. Kelas
`sticky-top` mempertahankan posisi bilah navigasi di tepi atas _viewport_
saat halaman digulir. Empat tautan menu (Beranda, Arsip, Sumber, Kontak)
ditempatkan di sisi kanan melalui kelas `ms-auto` @bootstrap-components.

#include-code("src/tugas1.html", line-range: (13, 31))

=== Grid Responsif

Kisi kartu disusun menggunakan kelas `col-12 col-md-6 col-lg-4` pada setiap
kolom. Kombinasi ini menghasilkan tiga tata letak yang berbeda sesuai
ukuran perangkat @bootstrap-grid:

/ Layar kecil (`sm`, ≤767 px): `col-12` menghasilkan satu kartu penuh per
  baris.
/ Layar sedang (`md`, 768–991 px): `col-md-6` menghasilkan dua kartu per
  baris.
/ Layar besar (`lg`, ≥992 px): `col-lg-4` menghasilkan tiga kartu per
  baris.

Kelas `row g-4` pada kontainer baris memberikan jarak (_gap_) antarkartu
sebesar 1.5 rem (16 px × 1.5) secara konsisten tanpa perlu properti
`margin` individual.

#include-code("src/tugas1.html", line-range: (32, 139))

Setiap kartu (_card_) menggunakan kelas `card h-100 shadow-sm` sehingga
seluruh kartu dalam satu baris memiliki tinggi yang seragam (`h-100`) dan
bayangan halus (`shadow-sm`). Gambar ditempatkan di bagian atas kartu
melalui `card-img-top`, sedangkan `card-body d-flex flex-column`
memastikan tombol selalu berada di bagian bawah kartu melalui `mt-auto`
@bootstrap-components.

#img("assets/tugas1-desktop.png", caption: [Hasil render Tugas 1 pada ukuran layar _desktop_ (≥992 px) yang menampilkan tiga kartu dalam satu baris.])

#img("assets/tugas1-tablet.png", caption: [Hasil render Tugas 1 pada ukuran layar _tablet_ (768–991 px) yang menampilkan dua kartu dalam satu baris.])

#img("assets/tugas1-mobile.png", width: 6cm, caption: [Hasil render Tugas 1 pada ukuran layar _mobile_ (≤767 px) yang menampilkan satu kartu penuh dalam satu baris.])

=== Footer

_Footer_ menggunakan kelas `bg-dark text-white text-center py-4` yang
menghasilkan latar gelap, teks putih, serta perataan tengah dengan
_padding_ vertikal 1.5 rem.

#include-code("src/tugas1.html", line-range: (140, 146))

#pagebreak()

== Tugas 2: Formulir Pendaftaran Mahasiswa Baru

Halaman kedua mengimplementasikan formulir pendaftaran dengan tata letak
dua kolom pada beberapa baris _field_ serta validasi visual menggunakan
kelas `is-valid` dan `is-invalid` dari Bootstrap @bootstrap-components.

=== Form Layout

Formulir ditempatkan dalam kontainer `card p-4 shadow-sm` yang dibungkus
oleh `container > row > col-lg-8` untuk memusatkan lebar konten. Baris
pertama (Nama Lengkap dan NIM) menggunakan `row` dengan dua `col-md-6`,
sehingga kedua _field_ berdampingan pada layar `md` ke atas dan bertumpuk
pada layar yang lebih kecil.

=== Validasi Visual

Dua _field_ telah diberi umpan balik validasi visual:

/ `is-valid`: Diterapkan pada _input_ Nama Lengkap dan NIM yang telah
  diisi dengan nilai contoh, menampilkan warna hijau dan ikon centang.
/ `is-invalid`: Diterapkan pada _textarea_ Alamat yang belum diisi,
  menampilkan warna merah dan ikon peringatan.

#include-code("src/tugas2.html", line-range: (25, 38))

#include-code("src/tugas2.html", line-range: (79, 85))

=== _Field_ Lainnya

_Field_ Email menggunakan tipe `email` dengan placeholder validasi
sederhana. Dua elemen `select` (Program Studi dan Semester) menyediakan
beberapa opsi pilihan. _Input_ file untuk Foto Profil menerima format
gambar melalui atribut `accept="image/*"`.

#include-code("src/tugas2.html", line-range: (39, 78))

=== Button

Tombol Simpan dan Reset ditempatkan dalam satu baris menggunakan kelas
`d-flex gap-2` dengan `flex-fill` pada masing-masing tombol sehingga
keduanya memiliki lebar yang sama dan mengisi seluruh ruang horizontal
@bootstrap-components.

#include-code("src/tugas2.html", line-range: (86, 91))

=== Alert

_Alert_ sukses dideklarasikan dengan kelas `alert alert-success
alert-dismissible fade d-none` sehingga tersembunyi secara _default_.
Kelas `btn-close` pada tombol tutup memungkinkan pengguna menutup
pemberitahuan setelah muncul.

#include-code("src/tugas2.html", line-range: (17, 22))

#img("assets/tugas2.png", caption: [Hasil render Tugas 2 yang menampilkan formulir pendaftaran dengan _field_ Nama dan NIM, tombol Simpan dan Reset, serta validasi visual `is-valid` pada Nama dan NIM.])

#pagebreak()

== Tugas 3: Dashboard Nilai Mahasiswa

Halaman ketiga mengimplementasikan _dashboard_ yang menampilkan ringkasan
statistik akademik dan daftar nilai mahasiswa dalam dua semester.

=== Profile Card

Bagian atas halaman menampilkan kartu profil yang terdiri dari foto
bundar (`rounded-circle border`), nama, NIM, program studi, dan lencana
status "Aktif" (`badge bg-success`). Tata letak menggunakan Flexbox
(`d-flex align-items-center gap-3`) sehingga foto dan teks sejajar secara
vertikal @bootstrap-components.

#include-code("src/dashboard.html", line-range: (14, 27))

=== Ringkasan Statistik

Tiga kartu statistik menampilkan ringkasan data akademik gabungan Semester
1 dan 2, yaitu Total SKS (40), IPK (3.63), dan Mata Kuliah Lulus (20).
Setiap kartu menggunakan kelas `card text-center border-0 shadow-sm h-100`
dengan tata letak tiga kolom (`col-md-4`) @bootstrap-components.

#img("assets/tugas3.png", caption: [Hasil render Tugas 3 yang menampilkan kartu profil mahasiswa, tiga kartu statistik, dan dua tabel daftar nilai Semester 1 dan Semester 2.])

=== Tabel Responsif dan Tombol Detail

==== Tabel Nilai Semester 1

Tabel Semester 1 berisi sepuluh mata kuliah dari semester pertama dengan
seluruh nilai berada pada rentang A hingga A- (lulus sempurna). Setiap
baris menampilkan Kode MK, nama mata kuliah, SKS, Nilai Huruf (_badge_
berwarna), Nilai Angka, dan tombol Detail yang membuka jendela _modal_.

==== Tabel Nilai Semester 2

Tabel Semester 2 menampilkan sepuluh mata kuliah semester kedua dengan
variasi nilai huruf yang lebih beragam. Nilai A dan A+ menggunakan
`badge bg-success` (hijau) pada Bahasa Inggris 2, Praktikum Basis Data,
Aljabar Vektor, Basis Data, Praktikum PPW1, dan Praktikum PBO. Nilai B
menggunakan `badge bg-primary` (biru) pada Praktikum Struktur Data dan
Pemrograman Berorientasi Objek. Nilai C menggunakan `badge bg-warning
text-dark` (kuning) pada Analisis Algoritma dan Struktur Data. Nilai D
menggunakan `badge bg-danger` (merah) pada Statistika.

#include-code("src/dashboard.html", line-range: (209, 314))

Setiap baris dilengkapi tombol Detail yang membuka jendela _modal_
(`#modalDetail`) berisi informasi lengkap mata kuliah, yaitu Kode MK,
nama, SKS, Nilai Huruf, dan Nilai Angka. Jendela _modal_ bersifat
`fade` dengan efek transisi dan dapat ditutup melalui tombol Tutup atau
tombol silang di sudut kanan atas @bootstrap-components.

#img("assets/tugas3-modal.png", caption: [Tampilan jendela _modal_ detail mata kuliah yang muncul setelah tombol Detail diklik, menampilkan informasi Kode MK, nama mata kuliah, SKS, Nilai Huruf, dan Nilai Angka.])

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════════
// KESIMPULAN
// ═══════════════════════════════════════════════════════════════════════════════

= Kesimpulan

+ _Grid system_ Bootstrap 5 berhasil diimplementasikan untuk menyusun tata
  letak halaman yang responsif terhadap tiga ukuran perangkat (_desktop_,
  _tablet_, _mobile_) menggunakan kombinasi kelas `col-12 col-md-6 col-lg-4`.
+ Formulir pendaftaran dengan validasi visual (`is-valid` dan
  `is-invalid`) berhasil dibangun menggunakan komponen _form_ Bootstrap,
  dengan tata letak dua kolom pada baris data diri serta tombol aksi yang
  tersusun menggunakan kelas _utility_ `d-flex` dan `gap`.
+ Halaman _dashboard_ nilai berhasil diimplementasikan dengan tabel
  responsif yang menampilkan dua semester, kartu statistik ringkasan, dan
  jendela _modal_ untuk detail mata kuliah, serta variasi _badge_ warna
  sesuai kategori nilai huruf (A hijau, B biru, C kuning, D merah).

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════════
// LAMPIRAN
// ═══════════════════════════════════════════════════════════════════════════════
= Lampiran

#show link: underline

Kode sumber lengkap laporan praktikum ini tersedia di repositori GitHub berikut:
#link("https://github.com/atalariq/PPW1/tree/main/Pertemuan-8")[https://github.com/atalariq/PPW1/tree/main/Pertemuan-8]
