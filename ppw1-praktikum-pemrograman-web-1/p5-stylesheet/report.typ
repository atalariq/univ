#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author:      "Atalariq Barra Hadinugraha",
  id:          "25/557554/SV/26192",
  class:       "B2",
  course:      "Praktikum Pemrograman Web 1",
  course-code: "PPW",
  lecturer: "Achmad Choirudin Emcha, S. Kom., M. Eng.",
  meeting:     "5",
  title:       "Slicing Desain Website Personal dengan HTML dan CSS",
)

#show: report.with(
  ..metadata,

  association: (
    program:    "D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK",
    department: "DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA",
    faculty:    "SEKOLAH VOKASI",
    university: "UNIVERSITAS GADJAH MADA",
    city:       "YOGYAKARTA",
    logo:       image("assets/logo.png", width: 6cm),
  ),
  year: 2026,

  use-cover: true,
  bib:        bibliography("references.bib"),
  font:       "Times New Roman",
  code-font:  "Fira Code",
  font-size:  11pt,
)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), header: path, ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), ..args)

#daftar-isi()
#daftar-gambar()

= Hasil dan Pembahasan

Berikut adalah tampilan akhir halaman website yang dihasilkan dari proses slicing desain.

#img("assets/screenshot.png", caption: [Tampilan website])

#show link: it => underline(text(fill: blue, it))

Dapat diakses melalui tautan berikut: #link("https://atalariq.github.io/personal-picks").
Kode sumber lengkap juga dapat diakses melalui tautan repository GitHub berikut: #link("https://github.com/atalariq/personal-picks")

== `index.html`

=== Struktur Dokumen (`<head>`)

Elemen `<head>` mendefinisikan metadata dokumen dan mendeklarasikan dependensi eksternal. Atribut `charset="UTF-8"` memastikan encoding teks yang benar, `viewport` mengatur skala tampilan, dan dua tag `<link rel="preconnect">` di baris 7--8 melakukan _DNS preconnect_ ke server Google Fonts untuk mempercepat pengunduhan font sebelum browser membutuhkannya.

#include-code("src/index.html", line-range: (1, 15))

=== Navigasi

Elemen `<nav>` adalah elemen semantik yang secara eksplisit menandai blok navigasi bagi mesin pencari dan _screen reader_ @mdn-semantics. Atribut `href` pada setiap tautan menggunakan _fragment identifier_ (misal `#album`) yang merujuk langsung ke `id` section di halaman yang sama, memungkinkan navigasi _in-page_ tanpa berpindah halaman.

#include-code("src/index.html", line-range: (16, 32))

=== Hero Section

Elemen `<header>` digunakan sebagai kontainer semantik untuk area pengantar halaman karena memiliki peran ARIA implisit sebagai _banner_, berbeda dengan `<div>` yang tidak membawa makna apapun @mdn-semantics. Elemen `<span class="highlight">` memisahkan potongan teks yang mendapat warna aksen dari teks judul utamanya tanpa menambahkan makna semantik baru.

#include-code("src/index.html", line-range: (33, 46))

=== Konten Utama: Section dan Card

Setiap bagian konten (Album, Film, Series) distrukturkan dalam `<section>` dengan `id` unik sebagai target navigasi, dan setiap entri media menggunakan elemen `<article>` karena konten tiap kartu bersifat mandiri dan bermakna di luar konteks halaman @mdn-semantics. Pola `section-header > (h2 + span)` lalu `card-grid > article*3` ini diulang identik untuk ketiga section.

#include-code("src/index.html", line-range: (47, 73))

=== About Section

Layout _about_ membagi konten ke dalam dua `<div>` yang diatur oleh CSS Grid: `about-text` untuk paragraf biografi dan `about-links` untuk daftar tautan sosial. Atribut `rel="noopener noreferrer"` pada setiap tautan eksternal (`target="_blank"`) mencegah halaman target mengakses objek `window.opener` sumber, sehingga mengeliminasi celah keamanan _reverse tabnapping_ @mdn-rel.

#include-code("src/index.html", line-range: (222, 282))

=== Contact Section

Elemen `<form>` menggunakan `action="mailto:"` yang membuka klien email bawaan pengguna saat disubmit, tanpa memerlukan server backend. Setiap input dibungkus bersama `<label>`-nya dalam `<div class="form-group">`; nilai atribut `for` pada label harus identik dengan `id` pada input agar label dapat diklik untuk memfokuskan field-nya.

#include-code("src/index.html", line-range: (283, 312))

=== Footer

Elemen `<footer>` ditempatkan di luar `</main>` sebagai _sibling_, bukan sebagai turunannya, sesuai konvensi HTML semantik dimana footer mewakili penutup dari keseluruhan dokumen @mdn-semantics.

#include-code("src/index.html", line-range: (312, 325))


== `style.css`

=== CSS Reset

CSS Reset dari Josh W. Comeau diterapkan untuk menghapus perbedaan _default style_ antar browser dan menetapkan fondasi yang dapat diprediksi @comeau-reset. Tiga poin paling kritis: `box-sizing: border-box` menjadikan `padding` dan `border` dihitung di dalam lebar elemen, `img { display: block }` menghilangkan _inline gap_ di bawah gambar, dan `font: inherit` pada elemen form mencegah browser menggunakan font berbeda untuk input.

#include-code("src/style.css", line-range: (1, 47))

=== CSS Custom Properties

Seluruh token desain (warna, spasi, radius, durasi transisi) dideklarasikan sebagai _custom properties_ dalam `:root` sehingga dapat digunakan ulang di seluruh stylesheet melalui sintaks `var()` @mdn-custom-props. Pendekatan ini memungkinkan perubahan tema dilakukan di satu tempat dan langsung terrefleksikan pada semua komponen yang mereferensikannya.

#include-code("src/style.css", line-range: (48, 100))

=== Base Styles

`scroll-behavior: smooth` pada elemen `html` mengaktifkan animasi gulir halus saat tautan _fragment_ di navbar diklik, tanpa memerlukan JavaScript @mdn-scroll-behavior. Property `min-width: 1024px` pada `body` mencegah layout pecah pada viewport sempit karena desain ini secara eksplisit hanya menarget tampilan desktop.

#include-code("src/style.css", line-range: (101, 114))

=== Tipografi

Skala tipografi ditetapkan secara eksplisit untuk `h1` (4rem), `h2` (2.5rem), dan `h3` (1.5rem) agar hierarki visual konsisten di seluruh halaman. Seluruh tautan secara _default_ tidak memiliki garis bawah dan warnanya bertransisi via `var(--transition-fast)` saat di-_hover_, memanfaatkan variabel transisi yang telah didefinisikan di `:root`.

#include-code("src/style.css", line-range: (115, 145))

=== Navigasi

Kombinasi `position: fixed` dan `z-index: 1000` memastikan navbar selalu tampil di atas seluruh konten halaman saat di-_scroll_ @mdn-position. Property `backdrop-filter: blur(20px)` menghasilkan efek kaca buram yang membutuhkan latar belakang semi-transparan (`rgba` dengan alpha 0.8) agar efek _frosted glass_ terlihat @mdn-backdrop-filter; `.nav-container` menggunakan `display: flex` dengan `justify-content: space-between` untuk mendorong logo ke kiri dan tautan ke kanan @mdn-flexbox.

#include-code("src/style.css", line-range: (146, 194))

=== Hero Section

`.hero` menggunakan `display: flex` dengan `justify-content: center` dan `align-items: center` untuk memusatkan konten secara vertikal sekaligus horizontal dalam tinggi minimum 60% viewport @mdn-flexbox. Nilai `padding-top` menggunakan `calc(80px + var(--space-3xl))` untuk mengkompensasi tinggi navbar yang bersifat `fixed`, mencegah teks hero tertutup di baliknya.

#include-code("src/style.css", line-range: (195, 231))

=== Main Content dan Sections

_Pseudo-element_ `::after` pada `.section-header` digunakan untuk membuat garis horizontal dekoratif yang mengisi sisa ruang di samping label section, tanpa menambahkan markup HTML tambahan. Nilai `flex: 1` pada pseudo-element tersebut membuatnya meregang mengisi ruang kosong yang tersisa, sementara `background: linear-gradient(to right, ...)` membuat garis memudar ke transparan di ujung kanannya.

#include-code("src/style.css", line-range: (232, 274))

=== Card Grid dan Aspect Ratio

`.card-grid` menggunakan `grid-template-columns: repeat(3, 1fr)` untuk membuat tiga kolom berukuran sama secara otomatis @mdn-grid. Property `aspect-ratio` memaksa gambar memiliki rasio konsisten tanpa perlu menetapkan tinggi secara eksplisit: album menggunakan `1` (persegi) dan film/series menggunakan `2/3` (portrait) @mdn-aspect-ratio; selector `#album .card-image img` menggunakan `id` section sebagai _namespace_ agar aturan hanya berlaku pada konteks yang relevan.

#include-code("src/style.css", line-range: (275, 320))

Efek hover pada `.card` menggabungkan tiga perubahan sekaligus (translasi vertikal, warna border, dan shadow) dalam satu `transition: all var(--transition-base)` pada state normal, sehingga semua properti beranimasi bersamaan saat mouse masuk maupun keluar. `.card-meta` menggunakan `text-transform: uppercase` dan `letter-spacing` yang diperbesar untuk menciptakan label metadata bergaya editorial.

#include-code("src/style.css", line-range: (320, 350))

=== About Section

`.about-section` mendapat tampilan berbeda dari section lain dengan menambahkan `background-color`, `border-radius: var(--radius-xl)`, dan aksen `border-top`, menjadikannya sebuah _panel_ bertumpang dengan latar belakang yang sedikit lebih terang. `.about-grid` menggunakan `grid-template-columns: 2fr 1fr` untuk memberi kolom teks dua kali lebih banyak ruang dibanding kolom tautan sosial @mdn-grid.

#include-code("src/style.css", line-range: (351, 428))

=== Contact Section dan Form

Pola `.form-group { display: flex; flex-direction: column }` menyusun pasangan `label` dan `input` secara vertikal tanpa properti tambahan @mdn-flexbox. State `:focus` menghapus `outline` bawaan browser dan menggantinya dengan `box-shadow` berwarna aksen primer, sementara `.submit-btn:active` mereset `translateY` ke nol agar tombol terasa "ditekan" saat diklik.

#include-code("src/style.css", line-range: (429, 510))

=== Footer

`.footer` menggunakan `background-color: var(--color-surface-container-low)` agar tampil lebih gelap dari area konten utama, menciptakan pemisah visual yang jelas di bagian bawah halaman. `::selection` di baris akhir mengkustomisasi warna teks yang dipilih pengguna agar tetap konsisten dengan palet warna tema.

#include-code("src/style.css", line-range: (511, 543))


