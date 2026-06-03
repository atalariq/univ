#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2 TRPL 2025",

  mata-kuliah: "Praktikum Teknologi Informasi dan Instalasi Komputer",
  kode-mata-kuliah: "PTIIK",
  nama-dosen-pengampu: "Imam Fahrurrozi, S.T., M.Cs.",
  no-pertemuan: "10",

  judul-praktikum: "Microsoft Word",
)

#set page(
  paper: "a4",
  margin: 2.54cm,
)

#set document(
  title: vars.judul-praktikum,
  author: vars.nama
)

#set text(
  font: "Times New Roman",
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
    ]
  )

  #v(1fr)

  #image(
    "assets/logo-UGM.png",
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
      2025
    ]
  )
]

#pagebreak()

// #2 Content

#set par(
  spacing: 1.5em,
  leading: 1.0em,
  justify: true,
)

// #set par(first-line-indent: 1.5em)

#show outline: it => {
  show heading: set align(center)
  it
}

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

#show heading.where(level: 1): set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: "1.1")
#show heading.where(level: 3): set heading(numbering: "1.1.1")
// #set heading(numbering: "1.1")
// #set heading(numbering: "1.1.1.1")
#show heading: set block(below: 1em)

// helper function
#let img(path, caption: "", width: 12cm) = [
  #figure(
    image(path, width: width),
    caption: caption,
  )
]

= Tujuan Percobaan

+ Memahami dan mampu menerapkan pemformatan teks dasar di Microsoft Word seperti underline, bold, dan italic
+ Menguasai pengaturan perataan paragraf (alignment) untuk membuat dokumen yang rapi dan profesional
+ Mampu membuat daftar berurutan (numbering) dan daftar berpoin (bullet) untuk menyusun informasi secara terstruktur
+ Menguasai pengaturan spasi baris dan jarak antar paragraf agar dokumen mudah dibaca
+ Memahami cara mengatur indentasi untuk memberikan struktur visual pada paragraf
+ Mampu mengatur margin, ukuran kertas, dan orientasi halaman sesuai kebutuhan dokumen
+ Menguasai fitur-fitur tambahan seperti penyisipan tanggal, header & footer, dan simbol khusus
+ Memahami penggunaan fungsi Find dan Replace untuk mengedit dokumen secara efisien

= Dasar Teori

Microsoft Word adalah program pengolah kata (word processor) yang dikembangkan oleh Microsoft. @modul-word-2023 Program ini memungkinkan pengguna untuk membuat, mengedit, memformat, dan menyimpan dokumen teks berkualitas profesional.

Microsoft Word pertama kali dirilis pada tahun 1983 dengan nama *Multi-Tool Word* untuk sistem Xenix. Program ini dikembangkan oleh Charles Simonyi dan Richard Brodie, mantan *programmer* Xerox. Versi untuk MS-DOS, Macintosh, dan Windows kemudian menyusul. Versi Word for Windows (1989) menjadi sukses secara komersial dan memantapkan posisinya di pasar.

#img("assets/about.png", caption: "Microsoft Word pada MacOS", width: 4cm)

Word menjadi standar *de facto* di lingkungan perkantoran dan akademis karena beberapa alasan. Faktor utamanya adalah interoperabilitas. Format `.docx` menjadi standar universal untuk bertukar dokumen.  Selain itu, integrasinya yang erat dengan Microsoft Office Suite (Excel, PowerPoint) menjadikannya pilihan utama untuk produktivitas bisnis.

== Tampilan Antarmuka

Antarmuka modern Word berpusat pada *Ribbon*, sebuah bilah menu dinamis yang menggantikan *toolbar* tradisional. *Ribbon* mengelompokkan fungsi-fungsi ke dalam beberapa *Tabs* (Tab). @modul-word-2023 

#img("assets/top.png", caption: "Ribbon pada Microsoft Word", width: 16cm)

Fitur-fitur utama dikelompokkan sebagai berikut:
+ *Home*: Mengatur pemformatan teks dan paragraf (Font, Paragraph, Styles).
+ *Insert*: Menyisipkan objek seperti tabel, gambar, *header*, dan *footer*.
+ *Design*: Mengontrol tampilan dan tema dokumen secara keseluruhan.
+ *Layout*: Mengatur properti halaman seperti margin, orientasi, dan kolom.
+ *References*: Alat untuk penulisan akademis (Daftar Isi, Sitasi, Daftar Pustaka, Keterangan).
+ *Mailings*: Fitur untuk membuat surat massal (*Mail Merge*).
+ *Review*: Alat untuk kolaborasi, seperti melacak perubahan (*Track Changes*) dan komentar.

#pagebreak()

= Hasil dan Pembahasan

#img("assets/01.png", caption: "Teks demo (awal)")

== Menggarisbawahi (#underline[Underline]) untuk Kata Tertentu

Pada praktikum ini, fitur underline digunakan untuk memberikan penekanan pada kata "teknologi" yang muncul beberapa kali dalam teks.
Langkah-langkah yang dilakukan:

+ Membuka dokumen yang berisi teks tentang perkembangan teknologi komunikasi
+ Menggunakan fungsi Find (Ctrl+F) untuk mencari semua kemunculan kata "teknologi"
+ Memblok setiap kata "teknologi" yang ditemukan
+ Menekan tombol Ctrl+U atau mengklik ikon Underline (U) pada grup Font di tab Home
+ Mengulangi proses untuk semua kata "teknologi" dalam dokumen

#img("assets/02-underline.png", caption: "Teks demo setelah diberi underline")

== Mempertebal (*Bold*) pada Tahun dan Nama Gedung

Selanjutnya format bold diterapkan pada informasi tahun dan nama institusi untuk membuat informasi penting lebih menonjol.
Langkah-langkah yang dilakukan:

+ Mencari dan memblok semua tahun yang ada dalam teks (1960-an, 1990-an, 1996)
+ Menekan Ctrl+B atau mengklik ikon Bold (B) pada grup Font
+ Mencari nama institusi seperti "Institut Teknologi Massachusetts (MIT)" dan "Advanced Research Projects Agency Network (ARPANET)"
+ Memblok nama institusi tersebut dan menerapkan format bold

#img("assets/03-bold.png", caption: "Teks demo setelah diberi bold")

== Mencetak Miring (_Italic_) pada Kata-kata Asing

Kata-kata asing atau istilah berbahasa Inggris dalam teks berbahasa Indonesia sebaiknya diberi format italic sesuai kaidah penulisan ilmiah.
Langkah-langkah yang dilakukan:

+ Mengidentifikasi kata-kata asing dalam teks seperti "radio", "browser", "network"
+ Memblok setiap kata asing tersebut
+ Menekan Ctrl+I atau mengklik ikon Italic (I) pada grup Font
+ Menerapkan format yang sama pada istilah teknis berbahasa Inggris lainnya

#img("assets/04-italic.png", caption: "Teks demo setelah diberi italic")

== Mengatur Perataan Paragraf

+ Memblok judul "PERKEMBANGAN TEKNOLOGI KOMUNIKASI"
+ Mengklik ikon Center (Ctrl+E) pada grup Paragraph di tab Home untuk membuat judul rata tengah
+ Memblok paragraf isi teks
+ Mengklik ikon Justify (Ctrl+J) untuk membuat teks rata kanan-kiri

Selain Center dan Justify, Microsoft Word juga menyediakan opsi Align Left (Ctrl+L) untuk rata kiri dan Align Right (Ctrl+R) untuk rata kanan yang bisa disesuaikan dengan kebutuhan.

#img("assets/05-alignment.png", caption: "Teks demo setelah diatur perataan paragrafnya")

== Membuat _Bullet List_

Bullet list berguna untuk membuat daftar item yang tidak perlu urutan tertentu. Langkah-langkah yang dilakukan:

+ Mengetik daftar item yang akan dibuat bullet
+ Memblok seluruh daftar tersebut
+ Mengklik tab Home, kemudian pada grup Paragraph klik ikon Bullets
+ Memilih style bullet yang diinginkan dari dropdown menu (bulat, kotak, atau simbol lainnya)

#img("assets/06-bullet_list.png", caption: "Contoh bullet list")

== Membuat _Numbering List_

Berbeda dengan bullet, numbering list digunakan ketika urutan item memiliki arti penting, misalnya langkah-langkah atau prioritas. Langkah-langkah yang dilakukan:

+ Mengetik daftar langkah-langkah atau item yang perlu urutan
+ Memblok seluruh daftar
+ Mengklik ikon Numbering pada grup Paragraph di tab Home
+ Memilih format penomoran (angka arab, angka romawi, atau huruf)

#img("assets/07-numbering_list.png", caption: "Contoh number list")

== Mengatur Jarak/Spasi Antar Baris

Fungsi _line spacing_ atau spasi baris adalah untuk menentukan jarak antar baris pada dokumen. Secara default, spasi baris pada MS Word adalah 1.0 atau biasa juga disebut single. Namun sebagian besar dokumen di Indonesia menggunakan jarak spasi 1.5. Sehingga kita harus memahami cara mengubah dari spasi awal 1.0 atau single menjadi spasi 1.5 di Word. Tidak hanya single dan 1.5, ada 6 macam pilihan spasi yang bisa digunakan di Microsoft Word. Mulai dari single, 1.5, double, at least, exactly dan multiply. Untuk mengatur spasi di Word ada 2 cara yang bisa digunakan yaitu melalui toolbar paragraf dan melalui kotak dialog paragraf

+ Mengatur Spasi di Word Melalui Toolbar
  Menu tersebut dapat diakses melalui toolbar Line and Paragraph Spacing di toolbar group paragraph. Berikut ini adalah cara mengatur spasi di Word dengan menggunakan toolbar.
  + Blok paragraf yang ingin di atur spasi barisnya.
  + Klik menu Home.
  + Klik Line and Paragraph Spacing yang dilambangkan dengan icon teks yang disampingnya terdapat arah atas dan bawah. Maka akan tampil beberapa pilihan jarak spasi yang sudah disediakan oleh ms word.
  + Pilih spasi sesuai kebutuhan misalnya spasi 1.5. Maka otomatis spasi akan berubah sesuai dengan pilihan.

+ Mengubah Spasi di Word Melalui Kotak Dialog Paragraf
  Menu tersebut memiliki pengaturan yang lebih lengkap. Kita hanya perlu menyesuaikan apa yang ingin diatur dan juga berapa jarak spasi baris yang diinginkan. Cara mengubah spasi di Microsoft Word dengan menggunakan kotak dialog paragraf.
  + Blok teks atau paragraf dokumen terlebih dahulu.
  + Klik toolbar Line and Paragraph Spacing.
  + Lalu klik Line Spacing Options. Maka kotak dialog paragraph akan terbuka.
  + Atur spasi baris melalui kolom Line Spacing. Ubah sesuai keinginan misalnya spasi 1.5 lines.
  + Klik OK untuk menyimpan pengaturan.

#img("assets/08-line_spacing.png", caption: "Perbandingan spasi 1.0 dengan 1.5")

== Mengatur Jarak Antar Paragraf

Spasi baris yang tepat membuat dokumen lebih mudah dibaca dan sesuai dengan standar penulisan akademis. Langkah-langkah yang dilakukan:

+ Memblok seluruh paragraf yang akan diatur spasinya
+ Mengklik tab Home
+ Pada grup Paragraph, klik ikon Line and Paragraph Spacing (ikon dengan panah atas-bawah)
+ Memilih spasi 1.5 dari menu dropdown

Alternatif melalui dialog box:

+ Memblok paragraf
+ Klik dialog box launcher (ikon panah kecil) di pojok kanan bawah grup Paragraph
+ Pada bagian Line spacing, pilih "1.5 lines"
+ Klik OK

== Mengatur Jarak Indentasi

Jarak antar paragraf membantu memisahkan ide-ide yang berbeda dalam dokumen. Langkah-langkah yang dilakukan:

+ Memblok seluruh paragraf dalam dokumen
+ Klik kanan dan pilih Paragraph, atau klik dialog box launcher pada grup Paragraph
+ Pada kotak dialog Paragraph, di bagian Spacing:
  - Before: diisi 6 pt (jarak sebelum paragraf)
  - After: diisi 6 pt (jarak sesudah paragraf)
+ Klik OK

#img("assets/09-indentation.png", caption: "Dialog pengaturan indentasi", width: 6cm)

== Mengatur Margin, Ukuran, dan Orientasi Halaman

Pengaturan halaman yang benar penting agar dokumen sesuai dengan standar dan siap dicetak. Langkah-langkah yang dilakukan:

+ Mengklik tab Layout (atau Page Layout di versi lama)
+ Pada grup Page Setup, klik "Margins"
+ Memilih "Custom Margins" di bagian bawah
+ Pada kotak dialog Page Setup:
  - Top: 3 cm
  - Bottom: 3 cm
  - Left: 4 cm
  - Right: 3 cm
+ Pada bagian Orientation, memilih "Portrait" (vertikal)
+ Klik tab Paper
+ Pada Paper size, memilih "A4 (21 cm x 29.7 cm)"
+ Klik OK

#img("assets/10-margin.png", caption: "Pengaturan halaman (Page Setup)", width: 6cm)

== Menambahkan Tanggal dalam Dokumen

Tanggal dalam dokumen penting untuk pencatatan dan referensi waktu pembuatan atau revisi. Langkah-langkah yang dilakukan:

+ Menempatkan kursor di posisi yang diinginkan (misalnya di bawah judul)
+ Mengklik tab Insert
+ Pada grup Text, klik "Date & Time"
+ Pada kotak dialog yang muncul:
  - Memilih format tanggal yang diinginkan (misalnya: 16 November 2025)
  - Pada Language, memilih "Indonesian"
  - Mencentang opsi "Update automatically" agar tanggal selalu update otomatis
+ Klik OK

#img("assets/11-date.png", caption: "Dialog untuk menambahkan tanggal", width: 6cm)

== Mencari dan Mengganti Teks (_Find & Replace_)

Fitur Find & Replace sangat efisien untuk mengedit dokumen yang panjang, terutama ketika perlu mengubah istilah atau kata tertentu secara konsisten.

Langkah-langkah mencari teks (Find):

+ Menekan Ctrl+F atau klik tab Home > Find
+ Navigation pane akan muncul di sisi kiri
+ Mengetik kata yang dicari, misalnya "teknologi"
+ Microsoft Word akan menyorot semua kemunculan kata tersebut
+ Bisa mengklik hasil pencarian untuk langsung menuju lokasi kata tersebut

#img("assets/12-find.png", caption: "Dialog untuk mencari teks (Find)", width: 6cm)
Langkah-langkah mengganti teks (Replace):

+ Menekan Ctrl+H atau klik tab Home > Replace
+ Pada kotak dialog Find and Replace:
  - Di kolom "Find what": mengetik kata yang akan diganti (misalnya "internet")
  - Di kolom "Replace with": mengetik kata pengganti (misalnya "Internet")
+ Klik "Replace" untuk mengganti satu per satu, atau "Replace All" untuk mengganti semuanya sekaligus
+ Klik Close setelah selesai

#img("assets/13-replace.png", caption: "Dialog untuk mengganti teks (Replace)", width: 6cm)

== Membuat Header dan Footer

Header dan footer berguna untuk menampilkan informasi yang perlu muncul di setiap halaman seperti judul dokumen, nama penulis, atau nomor halaman.
Langkah-langkah membuat Header:

+ Mengklik tab Insert
+ Pada grup Header & Footer, klik "Header"
+ Memilih style header yang diinginkan dari galeri, atau klik "Edit Header"
+ Mengetik teks yang diinginkan, misalnya judul dokumen atau nama mata kuliah
+ Bisa menambahkan elemen seperti tanggal atau logo
+ Setelah selesai, klik "Close Header and Footer" atau double-click di area dokumen

Langkah-langkah membuat Footer:

+ Mengklik tab Insert
+ Pada grup Header & Footer, klik "Footer"
+ Memilih style footer atau klik "Edit Footer"
+ Mengetik informasi yang diinginkan, misalnya nama dan NIM
+ Untuk menambahkan nomor halaman, bisa klik "Page Number" di tab Header & Footer
+ Klik "Close Header and Footer" setelah selesai

#img("assets/14-header_footer.png", caption: "Tampilan header dan footer pada halaman")

== Menyisipkan Simbol

Microsoft Word menyediakan berbagai simbol khusus yang tidak ada di keyboard standar, seperti simbol matematika, mata uang, atau karakter khusus lainnya.
Langkah-langkah yang dilakukan:

+ Menempatkan kursor di posisi yang akan disisipkan simbol
+ Mengklik tab Insert
+ Pada grup Symbols (paling kanan), klik "Symbol"
+ Untuk simbol yang sering digunakan, bisa langsung dipilih dari dropdown
+ Untuk simbol lainnya, klik "More Symbols"
+ Pada kotak dialog Symbol:
  - Memilih font yang diinginkan
  - Pada Subset, memilih kategori simbol (misalnya: Currency Symbols, Mathematical Operators, Greek)
  - Mengklik simbol yang diinginkan
  - Klik "Insert"
+ Klik "Close" setelah selesai

#img("assets/15-symbol.png", caption: "Dialog untuk menampilkan symbol yang ingin ditambahkan", width: 10cm)

#pagebreak()

= Kesimpulan

Dari praktikum Microsoft Word ini, dapat disimpulkan beberapa hal:

+ Pemformatan Teks Dasar\
  Fitur underline, bold, dan italic sangat berguna untuk memberikan penekanan pada bagian penting dokumen. Kombinasi ketiga format ini membuat dokumen lebih mudah dibaca dan informasi kunci lebih menonjol.
+ Pengaturan Paragraf\
  Perataan paragraf yang tepat (center untuk judul, justify untuk isi) membuat dokumen terlihat lebih rapi dan profesional. Pengaturan ini adalah dasar dari pembuatan dokumen formal.
+ Daftar dan Struktur\
  Bullet dan numbering list membantu menyajikan informasi secara terorganisir. Bullet cocok untuk daftar tanpa urutan, sedangkan numbering untuk langkah-langkah atau urutan yang penting.
+ Spasi dan Jarak\
  Pengaturan spasi baris (1.5) dan jarak antar paragraf membuat dokumen lebih nyaman dibaca. Indentasi paragraf memberikan struktur visual yang jelas.
+ Pengaturan Halaman\
  Margin, ukuran kertas, dan orientasi halaman yang tepat membuat dokumen siap cetak dan sesuai standar akademis. Margin kiri yang lebih besar (4 cm) memberikan ruang untuk penjilidan.
+ Fitur Tambahan\
  Penyisipan tanggal otomatis, header & footer, dan simbol khusus menambah profesionalitas dokumen. Find & Replace sangat efisien untuk editing dokumen besar.
+ Efisiensi Kerja\
  Menguasai shortcut keyboard seperti Ctrl+B, Ctrl+I, Ctrl+U, Ctrl+F, dan Ctrl+H mempercepat proses pembuatan dan editing dokumen.

Secara keseluruhan, Microsoft Word memiliki fitur yang lengkap dan user-friendly untuk membuat dokumen profesional. Pemahaman terhadap fitur-fitur dasar ini sangat penting sebagai fondasi untuk menggunakan fitur yang lebih advanced seperti mail merge, table of contents, dan reference management di praktikum selanjutnya.

#pagebreak()

// #3 Bibliography/References

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

