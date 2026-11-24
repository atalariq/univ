#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web 1",
  course-code: "PPW1",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "9",
  title: "Slicing Design Website",
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

+ Merancang desain _user interface_ halaman web portofolio pribadi
  menggunakan Figma untuk dua ukuran layar, yaitu _desktop_ (1440×1024 px)
  dan _mobile_ (390×844 px).
+ Menganalisis komponen _framework_ Bootstrap 5 yang sesuai untuk setiap
  elemen desain serta mendokumentasikan pemetaan komponen, _grid system_,
  dan nilai CSS yang digunakan.
+ Mengimplementasikan desain Figma menjadi halaman web responsif
  menggunakan HTML5 dan Bootstrap 5 melalui _Content Delivery Network_
  (CDN) tanpa instalasi lokal.
+ Mendokumentasikan proses _slicing_ dari desain ke kode dalam bentuk
  laporan tertulis yang mencakup tangkapan layar setiap tahap pengerjaan.

// ═══════════════════════════════════════════════════════════════════════════════
// DASAR TEORI
// ═══════════════════════════════════════════════════════════════════════════════

= Dasar Teori

== Figma dan Perancangan _User Interface_

Figma adalah perangkat lunak desain antarmuka berbasis vektor yang
beroperasi melalui peramban (_browser-based_) dan mendukung kolaborasi
secara _real-time_. Fitur _frame_ pada Figma memungkinkan perancang untuk
membuat kanvas dengan ukuran _preset_ yang merepresentasikan perangkat
target, seperti _desktop_ 1440×1024 px dan _mobile_ 390×844 px. Setiap
_frame_ dapat diisi dengan elemen-elemen antarmuka seperti bilah navigasi,
bagian utama (_hero section_), kisi kartu, dan catatan kaki (_footer_)
yang disusun menggunakan _auto layout_ untuk menjaga konsistensi jarak
dan perataan @figma-design. Figma juga menyediakan mode _Inspect_ yang
memungkinkan pengembang untuk mengekstrak nilai CSS seperti warna, ukuran,
dan jarak dari elemen desain secara langsung, sehingga mempermudah proses
_slicing_ dari desain ke kode.

== _Grid System_ Bootstrap 5

Bootstrap 5 menyediakan sistem tata letak berbasis _flexbox_ yang terdiri
dari dua belas kolom virtual di setiap baris (_row_). Sistem ini
menggunakan kelas `container`, `row`, dan `col` untuk membagi ruang
halaman secara proporsional. Setiap kelas `col` dapat dikombinasikan
dengan _breakpoint_ yang telah ditentukan, yaitu `sm` (≥576 px), `md`
(≥768 px), `lg` (≥992 px), `xl` (≥1200 px), dan `xxl` (≥1400 px)
@bootstrap-grid. Dengan menuliskan kelas secara berurutan dari
_breakpoint_ terkecil hingga terbesar, misalnya `col-12 col-md-6
col-lg-4`, tata letak halaman akan beradaptasi secara otomatis terhadap
lebar _viewport_ yang digunakan. Pendekatan ini merupakan implementasi
dari filosofi _mobile-first_ yang menjadi dasar desain Bootstrap 5.

== Komponen Bootstrap 5

Bootstrap 5 menyediakan koleksi komponen antarmuka siap pakai yang
dirancang untuk memenuhi kebutuhan umum pengembangan web @bootstrap-components.
Komponen `navbar` menyediakan bilah navigasi responsif yang dapat diperluas
melalui kelas `navbar-expand-lg` dan dipertahankan posisinya di tepi atas
melalui `fixed-top`. Komponen `card` menampung gambar, judul, dan deskripsi
dalam satu kesatuan visual dengan tinggi seragam melalui kelas `h-100`.
Komponen `badge` menampilkan label atau kategori dengan bentuk pil melalui
kelas `rounded-pill` dan warna latar semantik melalui `bg-*`.

== _Responsive Web Design_ dengan Bootstrap

_Responsive Web Design_ (RWD) adalah pendekatan pengembangan web yang
memastikan tampilan halaman beradaptasi secara optimal terhadap berbagai
ukuran perangkat @w3c-mediaqueries. Bootstrap 5 mengadopsi pendekatan
_mobile-first_ yang tercermin dalam penulisan kelas _grid_ seperti
`col-lg-4 col-md-6`, di mana `col-md-6` menghasilkan dua kolom pada
layar _tablet_ dan `col-lg-4` menghasilkan tiga kolom pada layar
_desktop_. Konsep ini memungkinkan satu berkas HTML yang sama untuk
ditampilkan dengan tata letak yang berbeda pada tiga ukuran perangkat
tanpa memerlukan halaman terpisah @mdn-responsive.

== CSS _Custom Properties_

CSS _Custom Properties_, atau yang sering disebut sebagai variabel CSS,
adalah mekanisme untuk mendefinisikan nilai yang dapat digunakan kembali
(_reusable_) di seluruh _stylesheet_ @mdn-custom-props. Variabel
dideklarasikan dengan diawali dua tanda hubung (`--nama-variabel`) pada
selektor `:root` agar bersifat global dan diakses melalui fungsi `var()`.
Pendekatan ini memberikan kemudahan pemeliharaan, konsistensi visual, dan
dukungan terhadap tema dinamis tanpa memerlukan prapemroses seperti Sass
atau Less. Dalam konteks _slicing_ desain, CSS _custom properties_
memungkinkan penerjemahan _color palette_ dari Figma ke kode secara
langsung dan terorganisasi.

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════════
// HASIL DAN PEMBAHASAN
// ═══════════════════════════════════════════════════════════════════════════════

= Hasil dan Pembahasan

Praktikum ini menghasilkan sebuah halaman web portofolio pribadi yang
dibangun melalui tiga tahap: perancangan desain di Figma, analisis dan
dokumentasi komponen, serta implementasi kode menggunakan HTML5 dan
Bootstrap 5. Setiap tahap dijelaskan secara terpisah pada subbab berikut.

== Tugas 1: Desain Figma

Desain _user interface_ halaman web portofolio pribadi dirancang
menggunakan Figma dengan dua _frame_ yang merepresentasikan ukuran
layar _desktop_ (1440×1024 px) dan _mobile_ (390×844 px). Gambar 1
menampilkan hasil desain kedua _frame_ secara berdampingan, menunjukkan
bagaimana tata letak beradaptasi dari dua kolom pada _desktop_ menjadi
satu kolom pada _mobile_.

#img("assets/ss-figma-design.png", caption: [Hasil desain Figma pada dua _frame_: _desktop_ 1440×1024 px (kiri) dengan tata letak dua kolom, serta _mobile_ 390×844 px (kanan) dengan tata letak satu kolom dan bilah navigasi _hamburger_.])

=== Palet Warna

Desain menggunakan tiga warna utama yang diterapkan secara konsisten di
seluruh komponen:

/ _Gold_ (C9963B): Digunakan sebagai warna aksen pada judul _hero_,
  judul kartu, garis dekoratif, dan tautan navigasi. Warna ini
  memberikan kesan premium dan hangat pada tema gelap.
/ _Dark Red_ (9B2335): Digunakan sebagai warna tombol _call-to-action_
  (CTA) pada _hero section_. Warna merah gelap memberikan kontras yang
  kuat terhadap latar belakang gelap.
/ _Dark Gray_ (121212): Digunakan sebagai warna latar belakang utama
  pada _navbar_, _hero_, dan _footer_. Warna ini menciptakan tema gelap
  (_dark theme_) yang elegan dan mengurangi kelelahan mata.

Warna pendukung mencakup _Teal_ (2A6B6B) untuk lencana teknologi,
_Cream_ (F8F5F0) untuk latar belakang seksi konten, dan _Dark Charcoal_
(333333) untuk teks pada latar terang.

=== Perbedaan Tata Letak Desktop dan Mobile

Pada _frame desktop_, bilah navigasi ditampilkan secara horizontal penuh
dengan empat menu (_HOME_, _WORKS_, _ABOUT_, _CONTACT_). _Hero section_
menggunakan tata letak dua kolom di mana teks dan tombol CTA berada di
kiri dan gambar di kanan. Seksi _Works_ menampilkan tiga kartu portofolio
dalam satu baris.

Pada _frame mobile_, bilah navigasi menyusut menjadi ikon _hamburger_
(_toggler_) yang menyembunyikan menu di balik tombol. _Hero section_
berubah menjadi tata letak satu kolom di mana gambar berpindah ke bawah
teks. Seksi _Works_ menampilkan kartu dalam satu kolom penuh sehingga
pengguna dapat menggulir secara vertikal. Perubahan ini memastikan
keterbacaan dan kemudahan navigasi pada layar yang lebih kecil tanpa
menghilangkan konten.

== Tugas 2: Analisis dan Dokumentasi

Analisis desain dilakukan dengan mengidentifikasi komponen Bootstrap
yang sesuai untuk setiap bagian halaman, menentukan kelas _grid system_,
serta mengekstrak nilai CSS dari desain Figma.

=== Pemetaan Komponen Bootstrap

Tabel berikut menunjukkan pemetaan setiap bagian halaman ke komponen
Bootstrap yang digunakan dalam implementasi:

#tbl(
  caption: [Pemetaan komponen Bootstrap untuk setiap bagian halaman.],
  columns: (auto, auto, auto),
  [Bagian Halaman], [Komponen Bootstrap], [Kelas yang Digunakan],
  [Bilah Navigasi], [_Navbar_], [`.navbar`, `.navbar-expand-lg`, `.fixed-top`, `.navbar-toggler`, `.collapse`, `.navbar-nav`],
  [_Hero Section_], [_Grid System_], [`.container`, `.row`, `.col-lg-7`, `.col-lg-5`],
  [Seksi _Works_], [_Card_ + _Grid_], [`.row`, `.col-lg-4`, `.col-md-6`, `.g-4`],
  [Seksi _About_], [_Grid System_], [`.container`, `.row`, `.col-lg-5`, `.col-lg-7`],
  [_Footer_], [_Grid System_], [`.container`, `.row`, `.col-md-6`],
)

=== Grid System per Section

Setiap bagian halaman menggunakan kombinasi kelas _grid_ yang berbeda
untuk menghasilkan tata letak responsif pada tiga ukuran perangkat.
Analisis berikut merangkum perilaku _grid_ pada setiap seksi:

/ _Hero Section_: Menggunakan `.row` dengan dua kolom `.col-lg-7` dan
  `.col-lg-5`. Pada _desktop_ (≥992 px), teks menempati 7 dari 12 kolom
  dan gambar menempati 5 kolom. Pada _tablet_ dan _mobile_, kelas
  `.mb-5.mb-lg-0` memastikan margin bawah pada teks hanya diterapkan
  pada layar di bawah `lg`, sehingga kedua kolom bertumpuk secara
  vertikal.
/ Seksi _Works_: Menggunakan `.row.g-4` dengan setiap kartu diberi kelas
  `.col-lg-4.col-md-6`. Pada _desktop_ (≥992 px), tiga kartu per baris.
  Pada _tablet_ (768--991 px), dua kartu per baris. Pada _mobile_
  (di bawah 768 px), satu kartu per baris dengan jarak 1.5 rem antarkartu.
/ Seksi _About_: Menggunakan pola yang serupa dengan _hero_, yaitu dua
  kolom dengan proporsi `.col-lg-5` (gambar) dan `.col-lg-7` (teks),
  serta `.ps-lg-5` untuk memberikan _padding_ kiri pada teks di layar
  _desktop_.
/ _Footer_: Menggunakan `.row` dengan dua `.col-md-6` untuk hak cipta
  di kiri dan ikon media sosial di kanan. Pada _mobile_, kedua kolom
  bertumpuk vertikal dengan perataan tengah.

=== Nilai CSS dari Desain

Lima nilai CSS utama yang diekstrak dari desain Figma dan
diimplementasikan sebagai _custom properties_ pada `:root`:

/ `--accent-gold`: `C9963B` — warna aksen utama untuk judul dan
  elemen dekoratif.
/ `--accent-red`: `9B2335` — warna tombol _call-to-action_.
/ `--bg-dark`: `121212` — warna latar belakang tema gelap.
/ `--bg-light`: `F8F5F0` — warna latar belakang seksi konten.
/ `--pill-teal`: `2A6B6B` — warna lencana teknologi.

Nilai-nilai ini didefinisikan pada blok `:root` sehingga dapat digunakan
kembali melalui fungsi `var()` di seluruh _stylesheet_ @mdn-custom-props.

=== Struktur HTML

Struktur dokumen HTML disusun dalam lima bagian utama yang masing-masing
menggunakan elemen semantik HTML5: `<nav>` untuk bilah navigasi,
`<section>` untuk _hero_, _works_, dan _about_, serta `<footer>` untuk
catatan kaki. Kode sumber lengkap tercantum pada repositori GitHub di
bagian Lampiran.

== Tugas 3: Implementasi HTML + Bootstrap

Implementasi dilakukan dengan menuliskan kode HTML5 dan CSS kustom yang
mengacu pada desain Figma. Setiap komponen dijelaskan secara terpisah
pada subbab berikut, disertai potongan kode dan tangkapan layar hasil
render.

=== Bilah Navigasi (_Navbar_)

Bilah navigasi diimplementasikan menggunakan komponen `navbar` Bootstrap
dengan kelas `fixed-top` agar tetap berada di tepi atas _viewport_ saat
halaman digulir @bootstrap-components. Kelas `navbar-expand-lg` mengatur
agar menu ditampilkan secara horizontal pada layar _desktop_ (≥992 px)
dan disembunyikan di balik tombol _toggler_ pada layar _tablet_ dan
_mobile_.

#include-code("src/index.html", line-range: (20, 44))

#img("assets/ss-desktop-hero.png", width: 13cm, caption: [Hasil render bilah navigasi pada _desktop_ yang menampilkan merek dan empat menu navigasi dengan latar belakang gelap.])

Pada CSS kustom, kelas `.navbar` diberi efek transisi `background-color`
dan `box-shadow` yang diaktifkan melalui kelas `.scrolled` menggunakan
JavaScript. Saat pengguna menggulir halaman melebihi 50 px, latar
belakang berubah menjadi semi-transparan dengan efek _backdrop-filter:
blur(10px)_, memberikan ilusi kedalaman (_depth_) dan menjaga
keterbacaan tautan terhadap konten di bawahnya. Setiap tautan navigasi
dilengkapi efek garis bawah emas (`::after`) yang melebar dari tengah
saat _hover_, serta tautan yang aktif ditandai dengan garis bawah penuh
dan warna emas.

=== _Hero Section_

_Hero section_ menggunakan _grid system_ Bootstrap dengan dua kolom:
teks dan tombol CTA di kiri (`.col-lg-7`) serta gambar di kanan
(`.col-lg-5`). Judul utama menggunakan elemen `<h1>` dengan kelas
kustom `.hero-title` yang memberikan warna emas, ukuran 4.5 rem, dan
animasi teks bercahaya (_text glow_).

#include-code("src/index.html", line-range: (46, 60))

#img("assets/ss-desktop-hero.png", width: 13cm, caption: [Hasil render _hero section_ pada _desktop_ yang menampilkan judul emas, tombol CTA, dan gambar dengan efek _floating_.])

Tombol CTA menggunakan kelas `.btn-custom-red` dengan warna latar merah
gelap (`--accent-red`) dan efek _hover_ yang mengangkat tombol disertai
bayangan. Animasi CSS pada gambar menerapkan efek mengambang (_floating_)
dengan `@keyframes float` yang berjalan tanpa batas, memberikan kesan
dinamis tanpa memerlukan interaksi pengguna. Sebuah _orb_ gradien emas
ditempatkan di belakang _hero section_ menggunakan _pseudo-element_
`::before` dengan animasi `pulseOrb` yang berdenyut perlahan.

Pada layar _tablet_ dan _mobile_, kedua kolom bertumpuk vertikal berkat
perilaku _default_ Bootstrap yang tidak mendefinisikan kelas `col-*`
untuk _breakpoint_ di bawah `lg`. Lebar judul disesuaikan melalui _media
query_ menjadi 3 rem pada layar di bawah 768 px.

=== Seksi _Works_ (Portofolio)

Seksi portofolio menampilkan tiga proyek dalam bentuk kartu (_card_)
menggunakan _grid_ responsif. Setiap kartu dibungkus dalam `.col-lg-4
.col-md-6` sehingga menghasilkan tiga kartu pada _desktop_, dua pada
_tablet_, dan satu pada _mobile_.

#include-code("src/index.html", line-range: (62, 113))

#img("assets/ss-desktop-works.png", width: 13cm, caption: [Hasil render seksi _Works_ pada _desktop_ yang menampilkan tiga kartu portofolio dalam satu baris dengan judul emas dan lencana teknologi.])

Setiap kartu menggunakan kelas kustom `.work-card` dengan latar belakang
gelap, bingkai emas tipis, dan _padding_ internal. Area gambar
(`.card-img-placeholder`) memiliki efek _zoom_ saat _hover_ dan badan
kartu (`card-body-custom`) menampung judul proyek, deskripsi, serta
lencana teknologi. Lencana menggunakan kelas `.badge-teal` dengan efek
_hover_ yang memperbesar dan memberikan bayangan.

Efek _hover_ pada kartu menggabungkan tiga transformasi: kartu terangkat
10 px ke atas (`translateY`), bayangan bertambah, dan bingkai emas
tambahan muncul melalui _pseudo-element_ `::before`. Animasi gulir
(_scroll reveal_) diterapkan pada setiap kartu dengan penundaan bertahap
(`reveal-delay-1` hingga `reveal-delay-3`) menggunakan Intersection
Observer, sehingga kartu muncul secara berurutan saat pengguna menggulir
halaman.

=== Seksi _About_

Seksi _About_ menampilkan foto diri dan teks deskripsi dalam tata letak
dua kolom. Gambar ditempatkan di kiri (`.col-lg-5`) dan teks di kanan
(`.col-lg-7`) dengan _padding_ tambahan `.ps-lg-5` pada layar _desktop_.

#include-code("src/index.html", line-range: (116, 157))

#img("assets/ss-desktop-about.png", width: 13cm, caption: [Hasil render seksi _About_ pada _desktop_ yang menampilkan foto dengan bingkai emas serta teks deskripsi dan daftar keahlian.])

Daftar keahlian ditampilkan dalam dua kelompok: _TECH STACK_ (JavaScript,
Python, Go, React, Flutter) dan _TOOLS_ (Git, Figma, Docker, CLI, dan
lainnya). Setiap butir menggunakan komponen `badge` Bootstrap dengan
variasi warna: `.badge-teal` untuk _tech stack_ dan `.badge-dark` untuk
alat. Lencana _tech stack_ memiliki efek _hover_ yang memperbesar dan
memberikan bayangan hijau, sedangkan lencana alat memiliki efek angkat
vertikal.

=== _Footer_

_Footer_ menggunakan tata letak dua kolom: teks hak cipta di kiri
(`.col-md-6.text-center`) dan ikon media sosial di kanan (`.col-md-6
.text-end`). Ikon menggunakan _Bootstrap Icons_ yang diimpor melalui CDN.

#include-code("src/index.html", line-range: (161, 175))

#img("assets/ss-desktop-footer.png", width: 13cm, caption: [Hasil render _footer_ pada _desktop_ yang menampilkan teks hak cipta dan tiga ikon media sosial dengan efek _hover_ emas.])

Setiap ikon media sosial memiliki efek _hover_ yang mengubah warna
menjadi emas dan mengangkat ikon sebesar 3 px dengan pembesaran 1.2×.
Pada layar _mobile_, tata letak dua kolom berubah menjadi satu kolom
dengan perataan tengah melalui _media query_ `@media (max-width: 768px)`.

=== CSS Kustom dan Animasi

Lembar gaya kustom (`style.css`) sepanjang 583 baris
mengimplementasikan beberapa penyesuaian di luar _framework_ Bootstrap:

/ _CSS Custom Properties_: Delapan variabel didefinisikan pada `:root`
  sebagai _design token_ yang menerjemahkan palet warna Figma ke kode.

#include-code("src/assets/css/style.css", line-range: (1, 12))

/ _Animasi Gulir_ (_Scroll Reveal_): Elemen dengan kelas `.reveal`
  memiliki `opacity: 0` dan `transform: translateY(40px)` secara
  _default_. Intersection Observer menambahkan kelas `.active` saat
  elemen memasuki _viewport_, memicu transisi `opacity` dan `transform`.

#include-code("src/assets/css/style.css", line-range: (71, 87))

/ _Efek Visual Tambahan_: Mencakup _custom scrollbar_ berwarna emas,
  hamparan _film grain_ semi-transparan (`body::after` dengan SVG
  _noise_), animasi _floating_ pada gambar _hero_, efek _glow_ pada
  judul, serta _reduced motion media query_ yang menonaktifkan seluruh
  animasi bagi pengguna dengan preferensi gerakan rendah.

#include-code("src/assets/css/style.css", line-range: (39, 69))

=== Perilaku Responsif

Pengujian responsivitas dilakukan pada tiga ukuran _viewport_:
_desktop_ (1440 px), _tablet_ (768 px), dan _mobile_ (375 px). Gambar
berikut menampilkan perbandingan tampilan halaman pada ketiga ukuran
tersebut.

#img("assets/full-ss-desktop.png", width: 13cm, caption: [Tampilan halaman penuh pada _desktop_ 1440 px yang menampilkan seluruh seksi dari bilah navigasi hingga _footer_.])

#img("assets/full-ss-tablet.png", width: 13cm, caption: [Tampilan halaman penuh pada _tablet_ 768 px dengan kartu _Works_ dua kolom dan susunan konten yang lebih vertikal.])

#img("assets/full-ss-mobile.png", width: 6cm, caption: [Tampilan halaman penuh pada _mobile_ 375 px dengan bilah navigasi _hamburger_ dan seluruh seksi dalam satu kolom.])

Halaman berhasil beradaptasi pada ketiga ukuran tanpa kerusakan tata
letak (_layout breakage_). Pendekatan _mobile-first_ Bootstrap memastikan
konten tetap terbaca dan navigasi tetap dapat diakses di semua perangkat
@bootstrap-grid.

// ═══════════════════════════════════════════════════════════════════════════════
// KESIMPULAN
// ═══════════════════════════════════════════════════════════════════════════════

= Kesimpulan

+ Desain _user interface_ halaman web portofolio pribadi berhasil
  dirancang menggunakan Figma dengan dua _frame_ yang merepresentasikan
  ukuran _desktop_ (1440×1024 px) dan _mobile_ (390×844 px). Palet
  warna emas, merah gelap, dan abu-abu gelap diterapkan secara konsisten
  di seluruh komponen, dengan perbedaan tata letak yang logis antara
  _desktop_ (dua hingga tiga kolom) dan _mobile_ (satu kolom penuh).
+ Analisis komponen Bootstrap berhasil dilakukan dengan memetakan
  `navbar`, _grid system_, `card`, dan `badge` ke setiap bagian halaman.
  Kombinasi kelas _grid_ seperti `col-lg-4.col-md-6` pada seksi _Works_
  dan `col-lg-7.col-lg-5` pada seksi _Hero_ menghasilkan perilaku
  responsif yang sesuai pada tiga ukuran perangkat.
+ Implementasi HTML5 dan Bootstrap 5 melalui CDN berhasil menghasilkan
  halaman web yang berfungsi dengan baik pada ukuran _desktop_
  (1440 px), _tablet_ (768 px), dan _mobile_ (375 px). CSS kustom
  sepanjang 583 baris menambahkan animasi gulir, efek _hover_, palet
  warna melalui _custom properties_, serta hamparan visual seperti
  _film grain_ dan _scrollbar_ emas sebagai nilai tambah di luar
  persyaratan minimal.
+ Dokumentasi proses _slicing_ dari desain Figma ke kode telah disusun
  dalam laporan ini, mencakup tangkapan layar desain, analisis
  komponen, potongan kode implementasi, serta tangkapan layar hasil
  render pada tiga ukuran perangkat. Kode sumber lengkap tersedia pada
  repositori GitHub yang tercantum di bagian Lampiran.

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════════
// LAMPIRAN
// ═══════════════════════════════════════════════════════════════════════════════

#heading(level: 1, numbering: none, outlined: true)[Lampiran]

#show link: underline

Kode sumber lengkap laporan praktikum ini tersedia di repositori GitHub
berikut:
#link("https://github.com/atalariq/PPW1/tree/main/Pertemuan-9")[https://github.com/atalariq/PPW1/tree/main/Pertemuan-9]
