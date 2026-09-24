#import "@preview/zebraw:0.6.1": *
#import "@preview/numbly:0.1.0": numbly

#show: zebraw

#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2",
  mata-kuliah: "Praktikum Pemrograman Web 1",
  kode-mata-kuliah: "PPW1",
  nama-dosen-pengampu: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  no-pertemuan: "2",
  judul-praktikum: "Dasar-Dasar HTML",
)

#set page( paper: "a4", margin: 2.54cm)

#set document( title: vars.judul-praktikum, author: vars.nama)

#set text( font: "New Computer Modern", size: 12pt)

#align(center)[
  #upper(
    text(size: 14pt, weight: "bold")[
      LAPORAN PRAKTIKUM \
      #vars.mata-kuliah  \
      PERTEMUAN #vars.no-pertemuan \
      #vars.judul-praktikum
    ]
  )
  #v(1fr)
  #image(
    "assets/logo.png",
    width: 6cm
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
    [Dosen Pengampu], [:], [#vars.nama-dosen-pengampu]
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
    ]
  )
]
#pagebreak()

#set par(
  spacing: 1.5em,
  leading: 1.0em,
  justify: true,
  first-line-indent: (amount: 0.5in, all: true)
)

// #show heading.where(level: 1): it => [
//   #set heading(numbering: none)
//   #set align(center)
//   #set text(weight: 700)
//   #pad(it.body)
// ]
#set heading(numbering: "A.1.a")
#set heading(numbering: (..nums) => {
  let numbers = nums.pos()
  str(numbers.last()) + "."
})

// Define the numbering for each level:
// Level 1: empty string (no number)
// Level 2: {1} (just the current number)
// Level 3: {2}.{3} (parent.child), etc.
#set heading(numbering: numbly("{1}.", "{2}.", "{2}.{3}", "{2}.{3}.{4}"))

// #show heading.where(level: 1): set heading(numbering: none)
// #set heading(numbering: (first, ..nums) => numbering("A.", ..nums))

#show outline: it => {
  show heading: set align(center)
  it
}

// Helper functions
#let img(path, caption: "", width: 12cm) = [
#figure(
    image(path, width: width),
    caption: caption,
  )
]

// Table of Contents
#outline(title: "Daftar Isi")
#pagebreak()

// Table of Image Figures
#set figure(
  supplement: "Gambar",
  numbering: "1.1",
)

#show figure.caption: set text(size: 0.8em)
#outline(title: "Daftar Gambar", target: figure.where(kind: image))
#pagebreak()

= Tujuan Praktikum

1. Memahami struktur dasar dokumen HTML
2. Mengimplementasikan elemen teks dasar seperti paragraf, heading, dan line break.
3. Menggunakan tag-formatting untuk memanipulasi tampilan teks seperti bold, italic, subscript, dan superscript.
4. Menerapkan elemen semantik untuk menampilkan teks preformatted.
5. Menggunakan horizontal rule dan komentar HTML untuk memecah dan mendokumentasikan konten.
6. Mengimplementasikan berbagai jenis list.
7. Memahami penggunaan text direction dan quotation.

= Dasar Teori

== Definisi

HTML (HyperText Markup Language) merupakan bahasa markup standar yang digunakan untuk membuat dan menyusun halaman web @mdn_html. Dokumen HTML tersusun dari elemen-elemen yang dibungkus oleh tag. Setiap tag memiliki fungsi spesifik dalam menentukan struktur dan tampilan konten pada browser. Standar HTML saat ini mengikuti spesifikasi yang dikembangkan oleh WHATWG (Web Hypertext Application Technology Working Group) @whatwg_html_living_standard.

== Struktur Dasar

Struktur dasar dokumen HTML terdiri dari beberapa komponen esensial. Elemen `<!doctype html>` pada baris pertama deklarasi dokumen memberitahu browser bahwa dokumen tersebut menggunakan HTML5 @w3c_html5. Elemen `<html>` merupakan root element yang membungkus seluruh konten dokumen. Dalamnya terdapat dua bagian utama: `<head>` yang berisi metadata seperti title, dan `<body>` yang berisi konten yang akan ditampilkan kepada pengguna @duckett_html_css.

=== Heading

Elemen heading (`<h1>` hingga `<h6>`) digunakan untuk mendefinisikan hierarki judul dalam dokumen. Heading level 1 (`<h1>`) merupakan level tertinggi dan umumnya digunakan untuk judul utama halaman, sedangkan heading level 6 (`<h6>`) merupakan level terendah. Penggunaan heading yang tepat sangat penting untuk aksesibilitas dan struktur semantik dokumen karena membantu screen reader dalam menavigasi konten @mdn_html.

=== Paragraf dan Line Break

Elemen paragraf (`<p>`) digunakan untuk mengelompokkan konten teks dalam satu blok. Secara default, browser akan mengabaikan spasi ekstra dan line break di dalam elemen paragraf. Untuk membuat line break di dalam paragraf, digunakan tag `<br>` (break). Atribut `align` pada paragraf dapat digunakan untuk mengatur perataan teks (left, center, right, justify) meskipun atribut ini sudah deprecated dalam HTML5 @duckett_html_css.

=== Text Formatting

Tag-formatting teks dalam HTML terdiri dari dua kategori utama: tag fisik dan tag semantik. Tag `<b>` (bold) dan `<i>` (italic) merupakan tag fisik yang hanya mengubah tampilan visual teks. Sebaliknya, tag `<strong>` dan `<em>` merupakan tag semantik yang tidak hanya mengubah tampilan tetapi juga memberikan makna penting pada teks tersebut. Tag `<sup>` menghasilkan teks superskrip (naik ke atas), sedangkan `<sub>` menghasilkan teks subskrip (turun ke bawah). Tag `<big>` dan `<small>` masing-masing memperbesar dan memperkecil ukuran teks @mdn_html.

=== Preformatted Text

Elemen `<pre>` (preformatted text) menampilkan teks apa adanya sesuai dengan formatting dalam kode sumber, termasuk spasi dan line break. Elemen ini sangat cocok untuk menampilkan kode sumber komputer karena font-nya bersifat monospace dan mempertahankan struktur kode @mdn_html.

=== Horizontal Line

Elemen `<hr>` (horizontal rule) menghasilkan garis horizontal pemisah dalam dokumen. Atribut-atribut yang dapat digunakan pada `<hr>` meliputi `color` untuk warna, `width` untuk lebar garis, `size` untuk ketebalan, dan `align` untuk perataan.

=== Komentar

Komentar HTML ditulis menggunakan sintaks `<!-- komentar -->` dan tidak akan ditampilkan oleh browser @duckett_html_css.

=== List

List dalam HTML dapat diimplementasikan dalam tiga jenis: ordered list (`<ol>`) untuk daftar berurutan dengan nomor atau huruf, unordered list (`<ul>`) untuk daftar tidak berurutan dengan bullet, dan description list (`<dl>`) untuk daftar yang terdiri dari istilah dan deskripsinya. Nested list atau list bersarang dapat dibuat dengan menempatkan satu list di dalam elemen `<li>` list lainnya @mdn_html.

=== Text Direction

Elemen `<bdo>` (Bi-Directional Override) digunakan untuk mengatur arah teks secara manual, berguna untuk bahasa yang ditulis dari kanan ke kiri seperti Arab. Elemen quotation `<blockquote>` digunakan untuk kutipan panjang yang biasanya ditampilkan dengan indentasi, sedangkan `<q>` digunakan untuk kutipan pendek @mdn_html.

#pagebreak()

= Hasil dan Pembahasan

Praktikum ini terdiri dari 8 latihan yang mencakup penggunaan elemen-elemen dasar HTML. Setiap latihan berfokus pada aspek spesifik dari HTML: struktur paragraf dan line break, heading dan background color, horizontal rule dan komentar, text formatting, preformatted text, text direction dan quotation, berbagai jenis list, serta nested list dan description list. Setiap file HTML harus memiliki struktur dasar yang benar dan ditampilkan dengan benar di browser.

#set heading(numbering: numbly("{1}.", ""))

== Latihan 1: Paragraph dan Line Break

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```html
  <!-- Latihan 1: Paragraph and Line Break -->
  <!doctype html>
  <html>
    <head>
      <title>Paragraph and Line Break</title>
    </head>
    <body>
      <p>
        Paragraf ini mengandung banyak spasi dan baris dalam kode sumbernya,
        tetapi browser akan mengabaikannya.
      </p>
      <p>Whereas this paragraph has a long space.</p>
      <p align="center">
        Jumlah baris tiap paragraf bergantung pada ukuran window browser. Bila
        ukuran window browser-nya diubah, jumlah baris akan mengikuti
      </p>
      <p align="right">
        Untuk memotong<br>baris<br>dalam sebuah<br>paragraf,<br>gunakan tag<br>br
      </p>
    </body>
  </html>
  ```
)

Pada latihan ini, elemen `<p>` digunakan untuk membuat paragraf. Perilaku browser yang mengabaikan spasi ekstra dalam paragraf merupakan karakteristik standar HTML karena spasi ditafsirkan sebagai single space. Untuk membuat baris baru di dalam paragraf, digunakan elemen `<br>` yang merupakan empty element. Atribut `align` pada elemen `<p>` mendemonstrasikan cara mengatur perataan teks (center, right, left) meskipun dalam HTML5 disarankan untuk menggunakan CSS.

#img("assets/latihan-1.png", caption: "Tampilan paragraf dengan berbagai alignment dan line break")

== Latihan 2: Background Color dan Heading

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```html
  <!-- Latihan 2: Background Color and Heading -->
  <!doctype html>
  <html>
    <head>
      <title>Background Color dan Heading</title>
    </head>
    <body bgcolor="grey">
      <h1>Ini Heading 1</h1>
      <h2>Ini Heading 2</h2>
      <h3>Ini Heading 3</h3>
      <h4>Ini Heading 4</h4>
      <h5>Ini Heading 5</h5>
      <h6>Ini Heading 6</h6>
    </body>
  </html>
  ```
)

Latihan ini mendemonstrasikan penggunaan heading levels dari `<h1>` hingga `<h6>`. Heading level 1 (`<h1>`) merupakan level tertinggi dan umumnya digunakan untuk judul utama halaman, sedangkan heading level 6 (`<h6>`) merupakan level terendah. Heading-level yang lebih rendah menghasilkan ukuran teks yang lebih kecil, menciptakan hierarki visual yang jelas dalam dokumen. Penggunaan heading yang tepat sangat penting untuk aksesibilitas dan struktur semantik dokumen karena membantu screen reader dalam menavigasi konten. Atribut `bgcolor` pada elemen `<body>` digunakan untuk mengatur warna latar belakang halaman, dalam hal ini warna abu-abu. Perlu diperhatikan bahwa atribut ini deprecated dan dalam praktik modern disarankan menggunakan CSS.

#img("assets/latihan-2.png", caption: "Tampilan heading levels h1-h6 dengan latar belakang abu-abu")

== Latihan 3: Horizontal Line dan Comment

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```html
  <!-- Latihan 3: Horizontal Line and Comment -->
  <!doctype html>
  <html>
    <head>
      <title>Horizontal Line dan Comment</title>
    </head>
    <body>
      <p>Tag hr "horizontal line" mendefinisikan sebuah garis horizontal</p>
      <hr>
      <p>Ini adalah paragraf di bawah tag hr (default)</p>
      <hr color="red">
      <p>Ini adalah paragraf yang lain di bawah tag hr berwarna merah</p>
      <hr width="400" size="5" color="green">
      <p align="center">Ini adalah paragraf yang lain di bawah tag hr berwarna hijau</p>
      <hr width="400" size="5" color="green" align="left">
      <p>Secara default, tag hr itu rata tengah (align="center"), tapi kita bisa mengaturnya secara manual</p>

      <!-- Ini adalah komentar, isinya tidak akan ditampilkan ke browser -->
      <!--
        Komentar juga mendukung
        multi-baris
        atau
        multi-line
      -->
    </body>
  </html>
  ```
)

Latihan ini fokus pada elemen `<hr>` untuk membuat garis horizontal dan komentar HTML. Tag `<hr>` secara default menghasilkan garis penuh selebar viewport dengan perataan tengah. Atribut-atribut yang dapat digunakan pada `<hr>` meliputi `color` untuk warna, `width` untuk lebar garis, `size` untuk ketebalan, dan `align` untuk perataan. Komentar HTML dengan sintaks `<!-- -->` sangat berguna untuk mendokumentasikan kode atau menonaktifkan sementara bagian tertentu dari kode tanpa menghapusnya.

#img("assets/latihan-3.png", caption: "Tampilan horizontal rule dengan berbagai atribut")

== Latihan 4: Text Formatting

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```html
  <!-- Latihan 4: Text Formatting -->
  <!doctype html>
  <html>
    <head>
      <title>Text Formatting</title>
    </head>
    <body>
      <p>
        <b>Teks ini tebal (b)</b> <br />
        <strong>Teks ini juga tebal (strong)</strong> <br />
        <em>Teks ini miring (em)</em> <br />
        <i>Teks ini juga miring (i)</i> <br />
        <big>Teks ini besar</big> <br />
        <small>Teks ini kecil</small> <br />
        Teks ini berisi <sup>superscript</sup> <br />
        Teks ini berisi <sub>subscript</sub> <br />
      </p>
    </body>
  </html>
  ```
)

Latihan ini menunjukkan berbagai tag-formatting teks. Perbedaan penting terdapat antara tag fisik dan semantik. Tag `<b>` (bold) dan `<i>` (italic) merupakan tag fisik yang hanya mengubah tampilan visual teks. Sebaliknya, tag `<strong>` dan `<em>` merupakan tag semantik yang tidak hanya mengubah tampilan tetapi juga memberikan makna penting kepada browser dan screen reader bahwa teks tersebut memiliki kepentingan khusus. Tag `<sup>` menghasilkan teks superskrip (naik ke atas), sedangkan `<sub>` menghasilkan teks subskrip (turun ke bawah). Tag `<big>` dan `<small>` masing-masing memperbesar dan memperkecil ukuran teks.

#img("assets/latihan-4.png", caption: "Tampilan berbagai tag format teks")

== Latihan 5: Preformat

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```html
  <!-- Latihan 5: Preformat -->
  <!doctype html>
  <html>
    <head>
      <title>Preformat</title>
    </head>
    <body>
      <h1>Preformat</h1>
      <pre>
  Ini adalah
  teks yang di-preformat.

  Preformat menampilkan teks *apa adanya*
  entah itu              spasi
  ataupun
  line break

  seperti ini.
      </pre>
      <p>Tag pre cocok untuk menampilkan source code, contohnya kode Python di bawah ini:</p>
      <pre>
  for i in range(10):
    print(i)
      </pre>
    </body>
  </html>
  ```
)

Latihan ini mendemonstrasikan elemen `<pre>` (preformatted text) yang sangat penting untuk menampilkan kode sumber. Berbeda dengan elemen `<p>` yang mengabaikan spasi dan line break, `<pre>` menampilkan teks apa adanya sesuai dengan formatting dalam kode sumber, termasuk spasi dan line break. Font monospace yang digunakan membuat kode mudah dibaca dan dipahami strukturnya.

#img("assets/latihan-5.png", caption: "Tampilan preformatted text untuk kode sumber")

== Latihan 6: Text Direction dan Quotation

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```html
  <!-- Latihan 6: Text Direction and Quotation -->
  <!doctype html>
  <html>
    <head>
      <title>Text Direction and Quotation</title>
    </head>
    <body>
      <h1>Text Direction and Quotation</h1>
      <h2>Bi-Directional Override (BDO)</h2>
      <p>Bila browser kamu mendukung Bi-Directional Override (BDO), maka paragraf berikut akan dituliskan dari kanan ke kiri (right-to-left/rtl):</p>
      <bdo dir="rtl">
        Anggap saja ini tulisan Arab
      </bdo>
      
      <h2>Quotation</h2>
      <p>Ini adalah contoh quotation panjang:</p>
      <blockquote>
        Ini adalah quotation panjang. Ini adalah quotation panjang. Ini adalah quotation panjang. Ini adalah quotation panjang.
        Ini adalah quotation panjang. Ini adalah quotation panjang. Ini adalah quotation panjang. Ini adalah quotation panjang.
      </blockquote>
      <p>Ini adalah contoh quotation pendek:</p>
      <q>Ini adalah quotation pendek.</q>
    </body>
  </html>
  ```
)

Latihan ini menunjukkan penggunaan `<bdo>` (Bi-Directional Override) yang memungkinkan teks ditulis dari kanan ke kiri, berguna untuk bahasa-bahasa seperti Arab atau Ibrani. Elemen quotation `<blockquote>` digunakan untuk kutipan panjang yang biasanya ditampilkan dengan indentasi, sedangkan `<q>` digunakan untuk kutipan pendek yang ditampilkan dalam tanda kutip.

#img("assets/latihan-6.png", caption: "Tampilan text direction dan quotation")

== Latihan 7: List

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```html
  <!-- Latihan 7: List -->
  <!doctype html>
  <html>
    <head>
      <title>List</title>
    </head>
    <body>
      <h1>List</h1>
      <h2>Ordered List</h2>
      <ol>
        <li>Item 1</li>
        <li>Item 2</li>
        <li>Item 3</li>
      </ol>

      <h3>Jenis-Jenis</h3>
      <ol type="A">
        <li>Item A</li>
        <li>Item B</li>
        <li>Item C</li>
      </ol>

      <ol type="I">
        <li>Item I</li>
        <li>Item II</li>
      </ol>

      <h2>Unordered List</h2>
      <ul>
        <li>Meja</li>
        <li>Kursi</li>
        <li>Lemari</li>
      </ul>

      <h3>Jenis-Jenis</h3>
      <ul type="circle">
        <li>Kasur</li>
        <li>Bantal</li>
        <li>Guling</li>
      </ul>

      <ul type="disc">
        <li>Kaos</li>
        <li>Celana</li>
      </ul>

      <ul type="square">
        <li>Sepatu</li>
        <li>Sandal</li>
      </ul>
    </body>
  </html>
  ```
)

Latihan ini mendemonstrasikan berbagai jenis list dalam HTML. Ordered list (`<ol>`) dapat menggunakan berbagai tipe penomoran melalui atribut `type` seperti angka (default), huruf besar (A), dan angka romawi (I). Unordered list (`<ul>`) menggunakan bullet point yang dapat dikustomisasi dengan atribut `type` yaitu disc (default), circle, dan square.

#img("assets/latihan-7.png", caption: "Tampilan ordered dan unordered list")

== Latihan 8: Nested List dan Description List

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```html
  <!-- Latihan 8: Nested List and Description List -->
  <!doctype html>
  <html>
    <head>
      <title>Nested List and Description List</title>
    </head>
    <body>
      <h1>Nested List and Description List</h1>
      <h2>Nested List</h2>
      <ol>
        <li>Item 1</li>
        <li>
          Item 2
          <ol>
            <li>Item 2.1</li>
            <li>
              Item 2.2
              <ol type="A">
                <li>Item 2.2.A</li>
                <li>Item 2.2.B</li>
                <li>Item 2.2.C</li>
              </ol>
            </li>
          </ol>
        </li>
        <li>
          Item 3
          <ul>
            <li>Apple</li>
            <li>Banana</li>
          </ul>
        </li>
      </ol>

      <h2>Description List</h2>
      <dl>
        <dt>Coffee</dt>
        <dd>Black hot drink</dd>
        <dt>Milk</dt>
        <dd>White cold drink</dd>
      </dl>
    </body>
  </html>
  ```
)

Latihan ini mendemonstrasikan nested list (list bersarang) dan description list. Nested list dibuat dengan menempatkan satu list di dalam elemen `<li>` list lainnya, memungkinkan pembuatan struktur hierarkis yang kompleks dengan kombinasi ordered dan unordered list. Description list (`<dl>`) terdiri dari pasangan istilah (`<dt>`) dan deskripsinya (`<dd>`), sangat cocok untuk glossary atau kamus.

#img("assets/latihan-8.png", caption: "Tampilan nested list dan description list")

#pagebreak()

= Kesimpulan

Berdasarkan praktikum yang telah dilaksanakan, dapat disimpulkan bahwa struktur dasar HTML meliputi DOCTYPE, head, dan body merupakan fondasi penting dalam pembuatan halaman web. Penggunaan tag-tag dasar seperti paragraf, heading, line break, dan berbagai elemen format teks sangat penting untuk membangun konten web yang terstruktur dan semantik.

Pemahaman tentang perbedaan antara tag fisik dan semantik (`<b>` vs `<strong>`, `<i>` vs `<em>`) sangat krusial karena mempengaruhi aksesibilitas dan SEO halaman web. Elemen `<pre>` sangat berguna untuk menampilkan kode sumber karena mempertahankan formatting asli.

Penggunaan list dalam HTML dengan berbagai jenisnya (ordered, unordered, description) memberikan fleksibilitas dalam menyajikan informasi terstruktur. Kemampuan membuat nested list memungkinkan pembangunan struktur data hierarkis yang kompleks.

Dengan menyelesaikan 8 latihan ini, praktikan telah memahami fundamental HTML yang diperlukan untuk membuat halaman web statis. Penguasaan elemen-elemen dasar ini menjadi prasyarat untuk mempelajari teknologi web lanjutan seperti CSS dan JavaScript.

#pagebreak()

// Daftar Pustaka
#show bibliography: it => {
show heading: set align(center)
  it
}

#bibliography(
  "references.bib",
  title: "Daftar Pustaka",
  style: "ieee",
  full: true,
)
