#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web 1",
  course-code: "PPW1",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "7",
  title: "CSS Position, Flexbox, Transition, Animation, dan Variables",
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

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), header: [#path.split("/").at(-1)], ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), ..args)

#daftar-isi()
#daftar-gambar()

// ═══════════════════════════════════════════════════════════════════════════════
// TUJUAN PRAKTIKUM
// ═══════════════════════════════════════════════════════════════════════════════

= Tujuan Praktikum

+ Memahami mekanisme penempatan elemen pada halaman web menggunakan properti CSS Position.
+ Memahami dan mengimplementasikan tata letak halaman menggunakan CSS Flexbox.
+ Memahami dan mengimplementasikan efek interaktif pada komponen antarmuka menggunakan CSS Transition, CSS Animation, dan CSS Variables.

// ═══════════════════════════════════════════════════════════════════════════════
// DASAR TEORI
// ═══════════════════════════════════════════════════════════════════════════════

= Dasar Teori

== CSS Position

Properti `position` pada CSS menentukan mekanisme penempatan
(_positioning_) suatu elemen dalam dokumen HTML. Terdapat lima nilai yang
dapat digunakan, masing-masing dengan karakteristik perilaku yang berbeda
terhadap aliran normal dokumen (_normal flow_) @mdn-position.

/ `static`: Nilai _default_ yang menempatkan elemen sesuai aliran normal
  dokumen. Properti `top`, `right`, `bottom`, dan `left` tidak
  berpengaruh pada posisi elemen dengan nilai ini.

/ `relative`: Elemen ditempatkan sesuai aliran normal, kemudian
  digeser (_offset_) dari posisi asalnya menggunakan `top`, `right`,
  `bottom`, atau `left`. Ruang yang semula ditempati elemen tetap
  dipertahankan dalam tata letak.

/ `absolute`: Elemen dikeluarkan dari aliran normal dokumen dan
  ditempatkan relatif terhadap leluhur (_ancestor_) terdekat yang
  memiliki nilai `position` selain `static`. Jika tidak ditemukan,
  elemen ditempatkan relatif terhadap _viewport_ awal (_initial
  containing block_).

/ `fixed`: Elemen dikeluarkan dari aliran normal dan ditempatkan
  relatif terhadap _viewport_, sehingga tetap berada pada posisi yang
  sama meskipun halaman digulir (_scroll_).

/ `sticky`: Elemen diperlakukan sebagai `relative` hingga mencapai
  ambang batas (_threshold_) tertentu saat pengguliran, kemudian
  berperilaku seperti `fixed` dalam batas kontainer induknya.

Properti `z-index` mengatur urutan tumpukan (_stacking order_) elemen
yang saling bertumpuk. Nilai `z-index` hanya berlaku pada elemen dengan
`position` selain `static`. Setiap elemen dengan `position` non-`static`
dan `z-index` selain `auto` membentuk konteks tumpukan (_stacking
context_) baru yang membatasi pengaruh `z-index` terhadap elemen di luar
konteks tersebut @mdn-position.

== CSS Flexbox

CSS _Flexible Box Layout_ (Flexbox) adalah modul tata letak satu dimensi
yang dirancang untuk mendistribusikan ruang di sepanjang satu sumbu
(_axis_) dan menyelaraskan (_align_) elemen-elemen di dalam suatu
kontainer @w3c-flexbox.

Flexbox diaktifkan dengan mendeklarasikan `display: flex` pada elemen
induk (_flex container_), yang mengubah seluruh anak langsungnya menjadi
_flex items_. Model ini memperkenalkan dua sumbu utama:

/ _Main axis_: Sumbu utama yang arahnya ditentukan oleh properti
  `flex-direction`. Nilai _default_-nya adalah `row` (horizontal dari
  kiri ke kanan).

/ _Cross axis_: Sumbu tegak lurus terhadap _main axis_. Jika
  `flex-direction` bernilai `row`, maka _cross axis_ berarah vertikal.

Properti-properti kunci yang mengatur distribusi dan penyelarasan
_flex items_ @mdn-flexbox:

/ `justify-content`: Menyelaraskan _flex items_ di sepanjang _main axis_.
  Nilai `space-between` mendistribusikan ruang kosong secara merata di
  antara item.

/ `align-items`: Menyelaraskan _flex items_ di sepanjang _cross axis_.
  Nilai `center` memusatkan item secara vertikal.

/ `flex-wrap`: Mengatur apakah _flex items_ diizinkan untuk membungkus
  (_wrap_) ke baris berikutnya saat ruang tidak mencukupi. Nilai `wrap`
  memungkinkan tata letak multi-baris.

/ `gap`: Mengatur jarak antar _flex items_ tanpa memerlukan _margin_
  tambahan pada masing-masing item.

Properti singkat `flex` pada _flex item_ mengombinasikan `flex-grow`,
`flex-shrink`, dan `flex-basis`. Nilai `flex: 1 1 280px` menyatakan
bahwa item dapat tumbuh (`grow`) dan menyusut (`shrink`) secara
proporsional, dengan ukuran dasar (`basis`) sebesar 280px.

== CSS Transition

CSS _Transition_ menyediakan mekanisme untuk mengubah nilai properti CSS
secara bertahap (_interpolasi_) dalam rentang waktu tertentu, sehingga
menciptakan perubahan visual yang halus tanpa memerlukan JavaScript
@mdn-transition.

Empat properti yang mengendalikan transisi:

/ `transition-property`: Menentukan properti CSS mana yang akan
  ditransisikan. Nilai `all` (atau tanpa spesifikasi) menerapkan
  transisi pada seluruh properti yang berubah.

/ `transition-duration`: Menentukan durasi transisi dalam satuan detik
  (`s`) atau milidetik (`ms`). Durasi yang terlalu pendek menghasilkan
  perubahan yang nyaris tidak terlihat, sedangkan durasi yang terlalu
  panjang memberikan kesan lamban.

/ `transition-timing-function`: Menentukan kurva percepatan transisi.
  Nilai `ease` (nilai _default_) memberikan perubahan yang dimulai
  lambat, dipercepat di tengah, dan melambat di akhir.

/ `transition-delay`: Menunda dimulainya transisi setelah _trigger_
  (misalnya `:hover`) diaktifkan.

Transisi bersifat implisit, artinya hanya terjadi ketika nilai properti
berubah akibat perubahan _state_ (seperti `:hover` atau `:focus`). Tidak
seperti animasi, transisi tidak memiliki kemampuan iterasi atau
_keyframe_ terpisah @mdn-transition.

== CSS Animation

CSS _Animation_ memungkinkan perubahan properti CSS secara bertahap
melalui serangkaian _keyframe_ yang didefinisikan secara eksplisit.
Berbeda dengan transisi yang bersifat implisit dan bergantung pada
perubahan _state_, animasi dapat berjalan secara otomatis, berulang,
dan melalui beberapa tahap (_keyframe_) tanpa memerlukan pemicu
eksternal @mdn-animation.

Animasi didefinisikan melalui dua komponen utama:

/ Aturan `@keyframes`: Mendeskripsikan tahapan animasi dalam bentuk
  persentase (dari `0%` hingga `100%`, atau kata kunci `from` dan `to`).
  Setiap tahap menentukan nilai properti CSS pada titik tersebut.

/ Properti `animation-*`: Mengendalikan perilaku animasi, mencakup
  `animation-name` (nama _keyframe_), `animation-duration`,
  `animation-timing-function`, `animation-iteration-count` (jumlah
  pengulangan; `infinite` untuk berulang terus), `animation-direction`,
  dan `animation-fill-mode`.

Properti `animation-fill-mode` dengan nilai `forwards` mempertahankan
nilai properti pada _keyframe_ terakhir setelah animasi selesai,
sehingga elemen tidak kembali ke keadaan semula. Kombinasi
`animation: spin 1s linear infinite` mendeklarasikan animasi bernama
`spin` dengan durasi satu detik, kecepatan konstan, dan pengulangan
tanpa batas @mdn-animation.

== CSS Variables

CSS _Variables_, atau secara resmi disebut _CSS Custom Properties_,
adalah mekanisme untuk mendefinisikan nilai yang dapat digunakan kembali
(_reusable_) di seluruh _stylesheet_ @mdn-variables. Variabel
dideklarasikan dengan diawali dua tanda hubung (`--nama-variabel`) dan
diakses melalui fungsi `var()`.

Variabel umumnya didefinisikan pada _pseudo-class_ `:root`, yang
merepresentasikan elemen akar dokumen (`<html>`), sehingga bersifat
global dan dapat diwariskan (_inherited_) ke seluruh elemen turunan
melalui mekanisme _cascade_ CSS.

```css
:root {
  --color-primary: #3498db;
  --radius: 8px;
}
```

Fungsi `var()` menerima dua argumen: nama variabel dan nilai _fallback_
opsional yang digunakan jika variabel tidak terdefinisi. Contoh
penggunaan:

```css
.btn {
  background-color: var(--color-primary, #007bff);
  border-radius: var(--radius);
}
```

Keunggulan CSS Variables dibandingkan nilai _hard-coded_ mencakup:
kemudahan pemeliharaan (_maintainability_), konsistensi visual, dan
dukungan terhadap tema dinamis (_dynamic theming_) tanpa memerlukan
prapemroses seperti Sass atau Less @mdn-variables.

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════════
// HASIL DAN PEMBAHASAN
// ═══════════════════════════════════════════════════════════════════════════════

= Hasil dan Pembahasan

Praktikum ini menghasilkan tiga halaman web yang masing-masing
mendemonstrasikan penerapan konsep _stylesheet_ lanjutan secara
terisolasi: CSS Position pada Tugas 1, CSS Flexbox pada Tugas 2, serta
CSS Animation, Transition, dan CSS Variables pada Tugas 3.

== Tugas 1: CSS Position

Halaman pertama mendemonstrasikan tiga mekanisme `position` yang berbeda
dalam satu tampilan: `sticky` pada bilah navigasi, `absolute` pada lencana
status, dan `fixed` pada tombol kembali-ke-atas. Ketiga mekanisme ini
bekerja secara independen namun saling melengkapi dalam membentuk hierarki
visual dan interaksi pengguliran (_scrolling_) halaman.

Struktur dasar halaman diawali dengan aturan _reset_ menggunakan
_universal selector_ `*` (baris 1--6) untuk menyeragamkan `margin` dan
`padding` ke nol serta mengaktifkan `box-sizing: border-box` pada seluruh
elemen. Aturan ini mencegah inkonsistensi ukuran antar peramban
(_browser_) yang disebabkan oleh nilai _default_ yang berbeda
@mdn-position. Elemen `body` (baris 8--11) diberi `font-family: Inter,
system-ui, sans-serif` sebagai _font stack_ modern dan `min-height: 200vh`
untuk menyediakan ruang gulir yang cukup, sehingga perilaku `position:
sticky` dan `position: fixed` dapat diamati secara visual.

=== Navigasi Sticky

Elemen `<nav class="navbar">` pada HTML hanya memuat satu judul `<h1>`,
berfungsi sebagai bilah navigasi sederhana.

#include-code("src/tugas-1.html", line-range: (11, 14))

Pada CSS, kelas `.navbar` (baris 14--22) menggunakan `position: sticky`
dengan `top: 0` untuk mempertahankan posisinya di tepi atas _viewport_
saat pengguna menggulir halaman ke bawah @mdn-position. Perilaku _sticky_
dipilih karena memberikan navigasi yang persisten tanpa mengorbankan ruang
di aliran normal dokumen, berbeda dengan `position: fixed` yang akan
menutupi konten di belakangnya secara permanen. Properti `z-index: 1000`
memastikan bilah navigasi selalu berada di atas elemen lain. Warna latar
`royalblue` dan teks putih memberikan kontras visual yang jelas terhadap
konten di bawahnya.

#include-code("src/tugas-1.css", line-range: (14, 23))

=== Badge Status Absolut

Lencana status `<span class="status">Online</span>` ditempatkan sebagai
anak langsung dari kartu profil, sehingga mewarisi konteks penempatan
relatif dari induknya.

#include-code("src/tugas-1.html", line-range: (15, 24))

Pada CSS, kelas `.profile-card` (baris 34--47) diberi `position: relative`
sebagai jangkar (_anchor_) bagi elemen anak yang menggunakan `position:
absolute`. Selain itu, `.profile-card` menggunakan Flexbox (`display:
flex`, `flex-direction: column`) untuk menata konten kartu secara
vertikal, dengan `border-radius: 12px` dan `box-shadow` untuk memberikan
kesan elevasi (_elevation_).

#include-code("src/tugas-1.css", line-range: (34, 48))

Lencana `.status` (baris 76--87) menggunakan `position: absolute` dengan
`top: 16px` dan `right: 16px` untuk ditempatkan di pojok kanan atas kartu
@mdn-position. Pola _relative parent_ + _absolute child_ ini adalah idiom
standar CSS untuk menempatkan elemen dekoratif di dalam kontainer tanpa
memengaruhi tata letak elemen lain. Properti `z-index: 10` memastikan
lencana berada di atas konten kartu namun tetap di bawah bilah navigasi
(`z-index: 1000`). Warna latar `limegreen`, `border-radius: 20px`, dan
`font-size: 0.75rem` memberikan tampilan lencana berbentuk pil (_pill
badge_).

#include-code("src/tugas-1.css", line-range: (76, 88))

Komponen pendukung lainnya mencakup kelas `.avatar` (baris 49--61) yang
membentuk inisial pengguna dalam lingkaran biru (`border-radius: 50%`)
menggunakan Flexbox untuk pemusatan, serta selektor `.profile-card h2`
dan `.profile-card .role` (baris 63--73) yang mengatur tipografi nama
dan peran pengguna.

=== Tombol Back-to-Top

Tombol `<button class="back-to-top">` menggunakan ikon panah `↑` dan
atribut `onclick` untuk menggulir halaman kembali ke atas.

#include-code("src/tugas-1.html", line-range: (25, 26))

Kelas `.back-to-top` (baris 90--108) menggunakan `position: fixed` dengan
`bottom: 24px` dan `right: 24px` agar selalu terlihat di pojok kanan bawah
_viewport_ @mdn-position. Properti `z-index: 999` menempatkan tombol satu
tingkat di bawah bilah navigasi (`z-index: 1000`), sehingga tetap dapat
diakses tanpa menutupi navigasi. Tombol dibentuk sebagai lingkaran melalui
`border-radius: 50%` dengan `width` dan `height` 48px. Pseudo-class
`:hover` (baris 106--108) mengubah warna latar dari `orangered` ke
`indianred` sebagai umpan balik visual.

#include-code("src/tugas-1.css", line-range: (90, 109))

#img("assets/output-tugas-1.png", caption: [Hasil render Tugas 1 yang menampilkan bilah navigasi _sticky_, kartu profil dengan lencana status _absolute_, dan tombol kembali-ke-atas _fixed_.])

== Tugas 2: CSS Flexbox

Halaman kedua mengimplementasikan tata letak _landing page_ menggunakan
CSS Flexbox. Empat komponen, yaitu bilah navigasi, _hero section_, kisi
kartu fitur, dan _footer_, masing-masing memanfaatkan properti Flexbox
yang berbeda @w3c-flexbox.

Aturan _reset_ pada `*` (baris 1--6) dan `body` (baris 8--10) mengikuti
pola yang sama seperti Tugas 1, yaitu menyeragamkan `margin`, `padding`,
`box-sizing`, serta menetapkan _font family_ `Inter, system-ui, sans-serif`.

=== Navigasi Flexbox

Elemen `<nav class="navbar">` memuat logo dalam `<div class="logo">` dan
daftar tautan dalam `<ul class="nav-links">` dengan tiga item menu.

#include-code("src/tugas-2.html", line-range: (13, 21))

Kelas `.navbar` (baris 13--20) menggunakan `display: flex` dengan
`justify-content: space-between` dan `align-items: center`. Kombinasi ini
mendistribusikan logo ke kiri dan daftar tautan ke kanan @mdn-flexbox.
Warna latar `#343331` dan teks `#FEFEFE` memberikan tampilan gelap yang
kontras. Daftar tautan `.nav-links` (baris 27--31) juga merupakan _flex
container_ (`display: flex`) dengan `gap: 2rem` untuk memberikan jarak
antar item navigasi, sementara tautan di dalamnya (`.nav-links a`, baris
33--36) dihilangkan dekorasi garis bawah melalui `text-decoration: none`.

#include-code("src/tugas-2.css", line-range: (13, 37))

=== Hero Section Dua Kolom

_Hero section_ `<section class="hero">` terdiri dari dua anak:
`.hero-text` yang memuat judul, paragraf, dan tombol, serta `.hero-image`
yang memuat gambar.

#include-code("src/tugas-2.html", line-range: (22, 32))

Kelas `.hero` (baris 39--46) mendemonstrasikan tata letak dua kolom
menggunakan `display: flex` dengan `align-items: center` dan `gap: 3rem`
@mdn-flexbox. Kedua anak langsung, `.hero-text` (baris 48--50) dan
`.hero-image` (baris 73--77), masing-masing diberi `flex: 1` agar
memperoleh lebar yang sama secara proporsional. Tombol `.btn` (baris
63--71) menggunakan `display: inline-block` dengan `padding`, warna latar
`#D14D41`, dan `border-radius: 8px` untuk membentuk tombol ajakan
bertindak (_call to action_). Gambar dalam `.hero-image img` (baris
79--83) dibatasi ukurannya (`width: 400px`, `height: 280px`) dan diberi
`border-radius: 12px`.

#include-code("src/tugas-2.css", line-range: (39, 84))

=== Kisi Kartu Fitur

Bagian _features_ `<section class="features">` memuat judul `<h2>` dan
tiga kartu dalam `<div class="card-grid">`, masing-masing dengan judul
`<h3>` dan deskripsi `<p>`.

#include-code("src/tugas-2.html", line-range: (33, 50))

Kisi kartu `.card-grid` (baris 97--104) menerapkan `display: flex` dengan
`flex-wrap: wrap` dan `gap: 2rem`. Setiap kartu `.card` (baris 106--113)
menggunakan `flex: 1 1 280px` sehingga kartu secara otomatis berpindah ke
baris berikutnya ketika lebar kontainer tidak mencukupi @mdn-flexbox.
Properti `max-width: 360px` membatasi lebar maksimum kartu agar teks tetap
nyaman dibaca. Kartu diberi latar putih, `border-radius: 12px`, dan
`box-shadow` untuk kesan elevasi. Teks judul kartu (`.card h3`, baris
115--118) dan paragraf (`.card p`, baris 120--122) diatur warna dan
marginnya untuk hierarki visual yang jelas.

#include-code("src/tugas-2.css", line-range: (86, 123))

=== Footer dan Responsivitas

_Footer_ `<footer class="footer">` terdiri dari tiga kolom `.footer-col`
yang masing-masing berisi informasi "About", "Links", dan "Contact".

#include-code("src/tugas-2.html", line-range: (51, 71))

Kelas `.footer` (baris 125--132) menggunakan `display: flex` dengan
`flex-wrap: wrap` dan `gap: 2rem`, sementara setiap kolom `.footer-col`
(baris 134--136) diberi `flex: 1 1 200px` @mdn-flexbox. Warna latar gelap
`#343331` dan teks `#FEFEFE` membedakan _footer_ dari konten utama.
Tautan dan paragraf dalam _footer_ (selektor `.footer-col p, .footer-col
a`, baris 142--148) diatur warnanya ke `lightgrey` dengan
`text-decoration: none`, sedangkan daftar tautan `.footer-col ul` (baris
150--152) dihilangkan penanda butirnya melalui `list-style-type: none`.

Untuk perangkat seluler (lebar layar ≤ 768px), aturan `@media` (baris
155--179) mengubah `flex-direction` menjadi `column` pada `.navbar`,
`.hero`, `.card-grid`, dan `.footer`. Transformasi ini mengubah tata letak
horizontal menjadi vertikal secara menyeluruh @mdn-flexbox. Selain
perubahan arah sumbu, `text-align: center` ditambahkan pada `.hero` dan
`.footer` untuk merapikan konten dalam tampilan satu kolom, serta `gap:
1rem` pada `.navbar` untuk memberikan ruang antar elemen yang kini
tersusun vertikal.

#include-code("src/tugas-2.css", line-range: (125, 181))

#img("assets/output-tugas-2.png", caption: [Hasil render Tugas 2 yang menampilkan _landing page_ dengan bilah navigasi Flexbox, _hero section_ dua kolom, tiga kartu fitur dalam kisi, dan _footer_ tiga kolom.])

== Tugas 3: CSS Animation, Transition, dan Variables

Halaman ketiga mendemonstrasikan integrasi tiga mekanisme: CSS Variables
sebagai _design token_, CSS Transition untuk perubahan properti yang
dipicu interaksi pengguna, dan CSS Animation untuk efek visual yang
berjalan secara otonom @mdn-variables @mdn-transition @mdn-animation.

Aturan _reset_ (baris 14--19) mengikuti pola yang sama seperti tugas
sebelumnya. Elemen `body` (baris 21--27) menggunakan `var(--color-light)`
untuk warna latar dan `var(--color-dark)` untuk warna teks, menunjukkan
konsistensi penggunaan _design token_ sejak elemen akar. Selektor `h1, h2`
(baris 29--32) menyeragamkan perataan tengah dan margin bawah untuk semua
judul. Kelas `.section` (baris 34--41) membentuk kartu kontainer dengan
`max-width: 800px`, `margin: 0 auto` untuk pemusatan horizontal, serta
`border-radius: var(--radius)` dan `box-shadow: var(--shadow-md)` untuk
menjaga konsistensi desain di seluruh halaman.

=== CSS Variables

Blok `:root` (baris 2--12) mendeklarasikan sembilan _custom properties_
yang berfungsi sebagai _design token_: tiga warna (`--color-primary`,
`--color-secondary`, `--color-accent`), dua warna netral (`--color-dark`,
`--color-light`), tiga tingkat bayangan (`--shadow-sm`, `--shadow-md`,
`--shadow-lg`), dan satu radius sudut (`--radius`). Seluruh komponen pada
halaman ini mengakses nilai-nilai tersebut melalui fungsi `var()`,
sehingga perubahan konsisten di seluruh halaman cukup dilakukan dengan
memodifikasi nilai pada `:root` @mdn-variables.

#include-code("src/tugas-3.css", line-range: (2, 13))

=== Transisi Tombol Hover

Tiga tombol dalam `<div class="btn-group">` masing-masing memiliki kelas
tambahan yang menentukan jenis transisinya: `.btn-color`,
`.btn-transform`, dan `.btn-shadow`.

#include-code("src/tugas-3.html", line-range: (13, 21))

Kelas dasar `.btn` dan `.btn-group` (baris 44--59) menetapkan properti
bersama untuk ketiga tombol. `.btn-group` menggunakan Flexbox (`display:
flex`, `flex-wrap: wrap`, `gap: 1rem`) untuk menata tombol secara
horizontal dengan pembungkusan. `.btn` menetapkan `padding`,
`border-radius: var(--radius)`, `font-weight: 600`, `cursor: pointer`,
dan warna teks putih, sehingga ketiga tombol memiliki tampilan dasar yang
konsisten.

#include-code("src/tugas-3.css", line-range: (44, 60))

Tiga varian transisi didemonstrasikan melalui kelas spesifik (baris
61--87). `.btn-color` menerapkan `transition: background-color 0.2s ease`
untuk perubahan warna latar dari `var(--color-primary)` ke
`var(--color-dark)` saat `:hover`. Durasi 0,2 detik dipilih untuk
memberikan kesan responsif pada perubahan warna. `.btn-transform`
menerapkan `transition: transform 0.4s ease` dengan efek `scale(1.1)`
dan `rotate(-3deg)` saat `:hover`. `.btn-shadow` mendemonstrasikan
transisi multi-properti: `box-shadow 0.4s ease, transform 0.2s ease`,
menggabungkan perubahan bayangan dari `--shadow-sm` ke `--shadow-lg` dan
pergeseran vertikal `translateY(-4px)` @mdn-transition. Perbedaan durasi
antar properti (`0.4s` untuk bayangan, `0.2s` untuk transformasi)
menciptakan efek berlapis yang terasa lebih alami.

#include-code("src/tugas-3.css", line-range: (61, 88))

=== Loading Spinner

_Spinner_ `<div class="spinner">` adalah elemen kosong yang sepenuhnya
dibentuk melalui CSS, tanpa konten HTML apa pun.

#include-code("src/tugas-3.html", line-range: (22, 26))

Kelas `.spinner` (baris 90--98) dibentuk menggunakan properti `border:
4px solid var(--color-light)` pada tiga sisi dan `border-top-color:
var(--color-primary)` pada sisi atas, menciptakan ilusi busur berputar
pada lingkaran dengan `border-radius: 50%`. Animasi `spin` (baris 100--103)
didefinisikan melalui `@keyframes` dari `rotate(0deg)` ke `rotate(360deg)`
dan dijalankan dengan `animation: spin 1s linear infinite`
@mdn-animation. Penggunaan `linear` sebagai _timing function_ memastikan
rotasi berlangsung dengan kecepatan konstan, sesuai untuk indikator
pemuatan (_loading indicator_) yang harus memberikan kesan proses
berkelanjutan.

#include-code("src/tugas-3.css", line-range: (90, 104))

=== Efek Fade-In

Elemen `<div class="fade-in-element">` berisi teks "fade-in element"
sebagai konten demonstrasi.

#include-code("src/tugas-3.html", line-range: (27, 33))

Kelas `.fade-in-element` (baris 106--113) memulai dengan `opacity: 0` dan
menjalankan animasi `fadeIn` (baris 116--119) selama 1,5 detik. _Keyframe_
`fadeIn` mentransisikan `opacity` dari `0` ke `1` bersamaan dengan
pergeseran dari `translateY(20px)` ke `translateY(0)`, menciptakan efek
masuk (_entrance_) yang menggabungkan perubahan transparansi dan posisi
vertikal @mdn-animation. Properti `animation-fill-mode: forwards`
mempertahankan nilai akhir setelah animasi selesai, sehingga elemen tetap
terlihat sepenuhnya. Latar `var(--color-primary)` dan teks putih
memberikan kontras yang jelas terhadap latar halaman.

#include-code("src/tugas-3.css", line-range: (106, 120))

#img("assets/output-tugas-3.png", caption: [Hasil render Tugas 3 yang menampilkan tiga tombol dengan efek _hover_, _spinner_ berputar, dan elemen _fade-in_.])

#pagebreak()

// ═══════════════════════════════════════════════════════════════════════════════
// KESIMPULAN
// ═══════════════════════════════════════════════════════════════════════════════

= Kesimpulan

Berdasarkan hasil praktikum yang telah dilakukan, dapat disimpulkan
beberapa hal sebagai berikut:

+ Mekanisme penempatan elemen menggunakan CSS Position, yaitu `sticky`,
  `relative`, `absolute`, dan `fixed`, telah berhasil diterapkan pada
  halaman Tugas 1. Setiap nilai `position` menunjukkan perilaku yang
  berbeda terhadap aliran normal dokumen, dan kombinasi `z-index`
  memungkinkan pengaturan hierarki tumpukan (_stacking order_) secara
  eksplisit.

+ Tata letak halaman menggunakan CSS Flexbox telah berhasil
  diimplementasikan pada _landing page_ Tugas 2. Properti `display:
  flex`, `justify-content`, `align-items`, `flex-wrap`, `gap`, dan
  singkatan `flex` digunakan secara terpadu. _Media query_ `@media
  (max-width: 768px)` melengkapi Flexbox dengan mengubah arah sumbu
  utama menjadi vertikal pada perangkat seluler.

+ Efek interaktif pada komponen antarmuka telah berhasil
  diimplementasikan pada halaman Tugas 3 melalui integrasi tiga
  mekanisme: CSS Variables sebagai _design token_, CSS Transition untuk
  perubahan properti yang halus saat interaksi `:hover`, dan CSS
  Animation melalui `@keyframes` untuk _spinner_ berputar serta efek
  _fade-in_.

#pagebreak()

= Lampiran

#show link: underline

Kode sumber lengkap laporan praktikum ini tersedia di repositori GitHub berikut:
#link("https://github.com/atalariq/PPW1/tree/main/Pertemuan-7")[https://github.com/atalariq/PPW1/tree/main/Pertemuan-7]
