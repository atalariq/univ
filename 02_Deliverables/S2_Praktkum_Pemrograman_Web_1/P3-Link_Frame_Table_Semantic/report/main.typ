#import "./template.typ": *
#import "@preview/numbly:0.1.0": numbly

#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web 1",
  course-code: "PPW1",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "3",
  title: "Link Frame Table dan Semantic",

  minimal: false,
  show-table-of-content: true,
  show-table-of-figure: false,
  show-table-of-table: false,
  show-bibliography: true,

  paper: "a4",
  font: "Times New Roman",
  font-size: 12pt,
  
  add-indentation-every-paragraph: true,
  line-spacing: 1.5,
  heading-numbering-preset: "1.",
  show-page-number: false,
  page-number-position: "bottom-center",
  export-preset: "screen",
)

#set heading(numbering: numbly("{1:A}.", "{2}.", "{2}.{3}", "{2}.{3}.{4}"))


= Tujuan Praktikum

+ Memahami dan mengimplementasikan berbagai jenis tautan/_link_
+ Mengimplementasikan `iframe` untuk menyematkan konten eksternal.
+ Membuat dan memanipulasi tabel HTML
+ Menerapkan elemen-elemen semantik untuk struktur halaman web yang lebih baik dan SEO-friendly.


= Dasar Teori

Pengembangan aplikasi web modern sangat bergantung pada kemampuan pengembang dalam mengorganisir informasi secara logis dan bermakna. HTML menyediakan berbagai elemen fundamental untuk mencapai hal tersebut, mulai dari mekanisme navigasi hingga penyajian data tabular dan pengelompokan konten secara semantik.

== Link

Implementasi tautan dilakukan dengan memanfaatkan elemen `<a>`. Melalui pengerjaan latihan, praktikan mampu membuat tautan eksternal ke situs web lain, tautan internal yang merujuk pada elemen ID di dalam satu dokumen, serta penggunaan gambar sebagai media pemicu tautan. Pengaturan atribut `target="_blank"` dibuktikan efektif dalam membuka halaman baru tanpa meninggalkan halaman saat ini.

#code(
```html
<p>
  <a href="awal.html">Teks ini</a> adalah sebuah link ke suatu
  halaman dalam situs Web.
</p>

<p>
  <a href="https://www.google.com/" target="_blank">Teks ini</a>
  adalah sebuah link ke halaman awal Situs Google.
</p>

<p><a href="#C4">Melompat ke bagian lain dalam halaman ini.</a></p>

<p>
  Anda dapat juga menggunakan gambar sebagai sebuah link:
  <a href="">
    <img border="0" src="logo.png" width="85" height="88" />
  </a>
</p>

<a href="baru.html" target="_blank">halaman Berikutnya</a>

<p>
  Bila Anda memberikan atribut target sebuah link menjadi "_blank",
  Link tersebut akan membuka sebuah window browser baru.
</p>

<div>
  <p>
    Ada tulisan disini (lakukan copy dan paste baris ini untuk baris
    berikutnya)
  </p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>

  <a name="C4">
    <h2>Disinilah tujuan lompatan link internal anda</h2>
  </a>

  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
  <p>Ada tulisan disini</p>
</div>
```
)

#img("assets/link.png", caption: [Output implementasi berbagai jenis tautan pada browser])

Tautan (links) dalam HTML diimplementasikan menggunakan elemen jangkar atau anchor (`<a>`). Komponen ini merupakan elemen krusial yang membentuk konsep *hypertext*, memungkinkan pengguna berpindah antar dokumen atau bagian dalam dokumen yang sama. Atribut `href` bertindak sebagai penentu lokasi sumber daya (*URL*), sedangkan atribut `target` mengontrol konteks presentasi tautan, seperti membuka halaman di tab baru melalui nilai `_blank`. Lebih lanjut, tautan internal dimungkinkan dengan mereferensikan ID elemen tertentu, yang sangat berguna pada dokumen panjang untuk meningkatkan pengalaman navigasi pengguna @mdn-html.

== Frame

Pada bagian ini, dilakukan eksplorasi terhadap penggunaan elemen frame. Meskipun `<frameset>` sudah tidak direkomendasikan, pemahaman mengenai mekanisme pembagian layar tetap penting. Di sisi lain, penggunaan `<iframe>` diuji coba untuk menampilkan konten dari file lokal maupun URL eksternal secara *inline*. Hal ini menunjukkan fleksibilitas dalam menyatukan beberapa sumber informasi dalam satu tampilan utuh.

#code(
```html
<h2>Contoh iframe HTML</h2>
<p>iFrame berikut menampilkan halaman Sekolah Vokasi UGM:</p>
<iframe
  src="https://ugm.ac.id/id/fakultas/sekolah-vokasi/"
  title="Sekolah Vokasi"
  width="680"
  height="360"
></iframe>

<h2>frame inline</h2>
<iframe src="link.html"></iframe>
<p>Beberapa browser lama tidak mendukung iframe.</p>
<p>
  Bila browser yang Anda pakai sekarang tidak mendukung, iframe tak akan
  terlihat.
</p>
```
)

#img("assets/frame.png", caption: [Output penggunaan iframe untuk menampilkan dokumen lain])

Pengaturan tata letak peramban secara historis menggunakan elemen `<frameset>` dan `<frame>` untuk menampilkan beberapa dokumen HTML sekaligus dalam satu jendela. Namun, seiring dengan evolusi standar web ke HTML5, penggunaan *frameset* telah ditinggalkan (*deprecated*) karena masalah aksesibilitas, performa, dan hambatan pada indeks mesin pencari. Sebagai penggantinya, standar modern tetap mempertahankan `<iframe>` atau *inline frame*. Elemen ini memungkinkan penyematan konten eksternal secara terisolasi di dalam struktur dokumen utama, yang sering dimanfaatkan untuk integrasi peta, video, atau aplikasi pihak ketiga @w3schools-html.

== Tabel

Pembuatan tabel difokuskan pada penggunaan atribut perbatasan (*border*) dan manipulasi sel. Salah satu tantangan yang ditemukan adalah sel kosong yang terkadang tidak menampilkan garis tepi pada peramban tertentu; solusinya adalah menggunakan entitas `&nbsp;`. Selain itu, teknik `colspan` digunakan untuk menggabungkan sel secara horizontal (kolom) dan `rowspan` untuk penggabungan secara vertikal (baris).

Penyajian data yang bersifat kuantitatif atau relasional memerlukan struktur tabel (`<table>`). Data dalam tabel disusun secara hierarkis melalui baris (`<tr>`) dan sel, baik berupa kepala tabel (`<th>`) untuk konteks maupun sel data (`<td>`). Fleksibilitas visual tabel dicapai melalui atribut `rowspan` dan `colspan`, yang memungkinkan satu sel menempati lebih dari satu ruang baris atau kolom. Hal ini sangat penting dalam menyajikan data kompleks yang memerlukan kategorisasi bertingkat.

=== Membuat Tabel

#img("assets/table-1.png", caption: [Tampilan tabel HTML dalam browser])

#code(
```html
<h1>Tabel</h1>
<p>
  Setiap tabel dimulai dengan tag table.<br />
  Setiap baris tabel dimulai dengan tag tr.<br />
  Setiap data dalam tabel dimulai dengan tag td.
</p>

<h2>Membuat Table</h2>
<h3>Satu baris satu kolom dengan border normal:</h3>
<table border="1">
  <tr>
    <td>100</td>
  </tr>
</table>

<h3>Satu baris dan tiga kolom dengan border tebal:</h3>
<table border="8">
  <tr>
    <td>100</td>
    <td>200</td>
    <td>300</td>
  </tr>
</table>

<h3>Dua baris dan tiga kolom dengan border sangat tebal:</h3>
<table border="15">
  <tr>
    <td>100</td>
    <td>200</td>
    <td>300</td>
  </tr>
  <tr>
    <td>400</td>
    <td>500</td>
    <td>600</td>
  </tr>
</table>

<h3>Tabel ini tidak memiliki border:</h3>
<table border="0">
  <tr>
    <td>100</td>
    <td>200</td>
  </tr>
  <tr>
    <td>300</td>
    <td>400</td>
  </tr>
</table>
```
)

=== Sel Kosong dan Sel yang Diperlebar

#img("assets/table-2.png", caption: [Tampilan sel kosong dan sel yang diperlebar])

#code(
```html
<h2>Sel Kosong dalam tabel:</h2>
<table border="1">
  <tr>
    <td>Teks</td>
    <td>Teks</td>
  </tr>
  <tr>
    <td></td>
    <td>Teks</td>
  </tr>
</table>

<p>
  Seperti yang Anda lihat, salah satu sel tidak memiliki border. Itu terjadi
  karena sel tersebut kosong. Cobalah untuk menyisipkan sebuah spasi ke
  dalam sel tersebut. Ternyata tetap saja tidak memiliki border.
</p>

<p>
  Cara yang benar adalah dengan menyisipkan spasi non-breaking di dalam sel.
</p>

<p>
  Spasi non-breaking adalah sebuah entitas karakter. Bila Anda tidak
  mengetahui apa yang disebut karakter entitas, baca kembali materi kuliah
  tentang hal tersebut.
</p>

<p>
  Entitas spasi non-breaking dimulai dengan tanda ampersand ("&"), kemudian
  karakter-karakter "nbsp", dan diakhiri dengan semicolon (";").
</p>

<table border="1">
  <tr>
    <td>Teks</td>
    <td>Teks</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Teks</td>
  </tr>
</table>

<h2>Sel yang diperlebar:</h2>
<h3>Sel yang melebar dua kolom:</h3>
<table border="1">
  <tr>
    <th>Nama</th>
    <th colspan="2">Telepon</th>
  </tr>
  <tr>
    <td>Bill Gates</td>
    <td>555 77 854</td>
    <td>555 77 855</td>
  </tr>
</table>

<h3>Sel yang melebar dua baris:</h3>
<table border="1">
  <tr>
    <th>Nama depan:</th>
    <td>Bill Gates</td>
  </tr>
  <tr>
    <th rowspan="2">Telepon:</th>
    <td>555 77 854</td>
  </tr>
  <tr>
    <td>555 77 855</td>
  </tr>
</table>
```
)

=== Sel dengan Latar Belakang dan Layout Web Sederhana

#img("assets/table-3.png", caption: [Tampilan sel dengan latar belakang dan layout web sederhana dengan tabel])

#code(
```html
<h2>Sel dengan warna latar belakang:</h2>
<table border="1" bgcolor="red">
  <tr>
    <td>Pertama</td>
    <td>Baris</td>
  </tr>
  <tr>
    <td>Kedua</td>
    <td>Baris</td>
  </tr>
</table>

<h4>Dengan latar belakang gambar:</h4>
<table border="1" background="../bg.jpg">
  <tr>
    <td>Pertama</td>
    <td>Baris</td>
  </tr>
  <tr>
    <td>Kedua</td>
    <td>Baris</td>
  </tr>
</table>

<h4>Latar belakang pada sel:</h4>
<table border="1">
  <tr>
    <td bgcolor="red">Pertama</td>
    <td>Baris</td>
  </tr>
  <tr>
    <td background="logo.png">Kedua</td>
    <td>Baris</td>
  </tr>
</table>

<h2>Layout web sederhana dengan tabel</h2>
<table border="1" width="100%">
  <tr>
    <td>
      <a href="https://ugm.ac.id" target="iframe_target">Website UGM</a>
    </td>
    <td rowspan="2">
      <iframe
        src="https://ugm.ac.id"
        name="iframe_target"
        height="500"
        width="100%"
      ></iframe>
    </td>
  </tr>
  <tr>
    <td>
      <a
        href="https://ugm.ac.id/id/fakultas/sekolah-vokasi/"
        target="iframe_target"
        >Website Vokasi</a
      >
    </td>
  </tr>
</table>
```
)

== Semantik

Penggunaan elemen semantik memberikan struktur yang jauh lebih bermakna dibandingkan blok generik. Berikut adalah rincian fungsionalitas dari elemen yang diimplementasikan:

- `<header>`: Digunakan sebagai wadah konten pengantar atau navigasi global di bagian atas halaman. Use case: Penempatan logo dan judul situs.
- `<nav>`: Mendefinisikan sekumpulan tautan navigasi utama. Use case: Menu bar atau daftar link kategori.
- `<main>`: Menampung konten unik dan utama dari dokumen tersebut. Use case: Tubuh artikel atau isi utama berita.
- `<section>`: Mengelompokkan konten berdasarkan tema atau bab tertentu. Use case: Pemisahan bagian "Kontak", "Layanan", atau "Tentang Kami".
- `<article>`: Mewakili konten mandiri yang dapat didistribusikan secara independen. Use case: Postingan blog, ulasan produk, atau berita.
- `<aside>`: Berisi konten yang berkaitan secara tidak langsung dengan konten utama di sekitarnya. Use case: Sidebar, kutipan, atau iklan.
- `<figure>` & `<figcaption>`: Mengelompokkan elemen ilustrasi (seperti gambar) dengan keterangan teksnya. Use case: Gambar ilustrasi dalam artikel ilmiah.
- `<footer>`: Digunakan untuk bagian bawah dokumen atau bagian tertentu. Use case: Informasi hak cipta (*copyright*) dan tautan kebijakan privasi.

#code(
```html
<header>
  <h1>Toko Online</h1>
  <nav>
    <ul>
      <li><a href="#">Beranda</a></li>
      <li><a href="#">Produk</a></li>
      <li><a href="#">Tentang Kami</a></li>
      <li><a href="#">Kontak</a></li>
    </ul>
  </nav>
</header>
<main>
  <section>
    <h2>Pengantar HTML</h2>
    <p>
      HyperText Markup Language (HTML) adalah bahasa markup standar yang
      digunakan untuk membuat halaman web. HTML menyediakan struktur dasar
      dan konten untuk halaman web dan bekerja bersama dengan Cascading
      Style Sheets (CSS) untuk presentasi visual halaman web dan JavaScript
      untuk perilaku interaktif.
    </p>
  </section>
  <section>
    <h2>Elemen Semantik HTML</h2>
    <p>
      Elemen semantik HTML adalah elemen-elemen yang memiliki makna atau
      arti yang spesifik untuk memudahkan mesin pencari dan pengembang web
      memahami struktur halaman web. Elemen ini membantu meningkatkan
      aksesibilitas dan pengalaman pengguna pada halaman web.
    </p>
  </section>
  <section>
    <article>
      <h2>Keajaiban Alam: Great Barrier Reef</h2>
      <p>
        Great Barrier Reef adalah sistem terumbu karang terbesar di dunia,
        membentang sejauh lebih dari 2.300 kilometer di sepanjang pantai
        timur Australia. Terumbu karang ini terdiri dari jutaan
        polip karang individu yang hidup bersama dalam simbiosis
        dengan ganggang fotosintesis. Great Barrier Reef adalah rumah
        bagi berbagai macam kehidupan laut, termasuk ikan, hiu, penyu,
        dan terumbu karang.
      </p>

      <figure>
        <img src="image.jpg" alt="Gambar Great Barrier Reef" />
        <figcaption>Great Barrier Reef yang memukau</figcaption>
      </figure>

      <p>
        Sayangnya, Great Barrier Reef menghadapi berbagai ancaman, termasuk
        perubahan iklim, polusi, dan penangkapan ikan berlebihan. Sangat
        penting untuk melindungi terumbu karang ini untuk menjaga
        keanekaragaman hayati laut dan keindahan alam.
      </p>
    </article>
  </section>
  <aside>
    <h3>Tips:</h3>
    <ul>
      <li>
        Gunakan mentega dingin agar menghasilkan tekstur yang lebih renyah.
      </li>
      <li>Jangan terlalu lama mengaduk adonan agar kue tidak keras.</li>
      <li>
        Sesuaikan waktu pemanggangan sesuai dengan oven masing-masing.
      </li>
    </ul>
  </aside>
</main>
```
)

#img("assets/semantics.png", caption: [Output struktur halaman yang memanfaatkan tag semantik])

Puncak dari evolusi HTML adalah diperkenalkannya elemen semantik. Berbeda dengan elemen generik seperti `<div>` atau `<span>` yang tidak membawa makna intrinsik, elemen semantik seperti `<header>`, `<nav>`, dan `<article>` memberikan informasi eksplisit mengenai fungsi konten tersebut di dalam halaman. Penggunaan tag semantik bukan sekadar masalah estetika kode, melainkan fondasi bagi aksesibilitas web bagi pengguna perangkat bantu (*screen readers*) dan optimalisasi indeksasi oleh mesin pencari (*Search Engine Optimization*). Dengan memberikan makna pada setiap bagian, struktur informasi menjadi lebih transparan bagi mesin maupun manusia @modul-ppw1-p3.

#pagebreak()

= Hasil dan Pembahasan

Bagian ini merupakan hasil eksekusi dari penugasan mandiri yang melibatkan pembuatan tabel biodata diri dan penyusunan tata letak halaman yang sepenuhnya menggunakan elemen semantik HTML5.

#code(
```html
<!doctype html>
<html>
  <head>
    <title>Assignment</title>
  </head>
  <body>
    <header>
      <h1>Link, Frame, Table, and Semantics</h1>
    </header>
    <nav>
      <ul>
        <li><a href="#profile">Profile</a></li>
        <li><a href="#article">Articles</a></li>
      </ul>
    </nav>
    <main>
      <section id="profile">
        <h2>Identity</h2>
        <article>
          <h3>Table</h3>
          <table border="1">
            <thead>
              <tr>
                <th>Name</th>
                <th>Age</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Atalariq Barra Hadinugraha</td>
                <td>19</td>
              </tr>
            </tbody>
          </table>
        </article>
      </section>

      <section id="article">
        <h2>Articles</h2>
        <article>
          <h3>Article 1</h3>
          <p>This is article</p>
        </article>
        <article>
          <h3>Article 2</h3>
          <p>This is also article</p>
        </article>
      </section>
    </main>
    <aside>
      <h3>Aside</h3>
      <p>This is Aside</p>
    </aside>

    <footer>
      <p>&copy; 2025 Atalariq</p>
    </footer>
  </body>
</html>
```
)

#img("assets/assignment.png", caption: [Output penugasan])

#pagebreak()

= Kesimpulan

Berdasarkan seluruh rangkaian aktivitas praktikum yang telah dilaksanakan, dapat ditarik beberapa kesimpulan sebagai berikut:

- *Fleksibilitas Navigasi*\
  Penguasaan elemen tautan (`<a>`) memungkinkan penciptaan alur informasi yang dinamis, baik antar dokumen eksternal maupun navigasi internal yang efisien dalam satu halaman dokumen.
- *Evolusi Layout Web*\
  Penggunaan `<iframe>` terbukti menjadi solusi yang lebih relevan dan aman dibandingkan struktur `<frameset>` yang sudah usang dalam standar pengembangan web modern.
- *Penyajian Data Tabular*\
  Tabel HTML tidak hanya berfungsi untuk menampilkan data sederhana, tetapi dengan penggunaan atribut `colspan` dan `rowspan`, pengembang mampu menyajikan data kompleks secara sistematis dan rapi.
- *Signifikansi Semantik*\
  Penerapan elemen semantik HTML5 (`<header>`, `<nav>`, `<main>`, dll.) sangat krusial dalam meningkatkan kualitas arsitektur informasi, mempermudah aksesibilitas bagi pengguna difabel, serta memberikan keuntungan teknis pada sisi optimasi mesin pencari (SEO).
- *Struktur vs Desain*\
  Pemisahan antara struktur konten (lewat elemen semantik) dan penyajian informasi (lewat tabel) menunjukkan pentingnya pemilihan tag yang tepat sesuai dengan tujuan fungsional dari data yang akan ditampilkan.
