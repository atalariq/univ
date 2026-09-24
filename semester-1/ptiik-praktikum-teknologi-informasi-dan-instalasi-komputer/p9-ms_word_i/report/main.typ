#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2 TRPL 2025",

  mata-kuliah: "Praktikum Teknologi Informasi dan Instalasi Komputer",
  kode-mata-kuliah: "PTIIK",
  nama-dosen-pengampu: "Imam Fahrurrozi, S.T., M.Cs.",
  no-pertemuan: "9",

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
#let img(path, caption: "", width: 7.5cm) = [
  #figure(
    image(path, width: width),
    caption: caption,
  )
]

= Tujuan Percobaan

+ Melakukan eksplorasi Microsoft Word:
  - Memahami alur kerja dasar Microsoft Word, mulai dari pembuatan, pemformatan, hingga penyimpanan dokumen.
  - Menerapkan fitur *Styles* (Headings) untuk membangun struktur dokumen yang logis.
  - Menerapkan fitur referensi otomatis (Daftar Isi, Daftar Gambar, Sitasi, dan Daftar Pustaka) untuk penulisan akademis.

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

Eksplorasi fungsionalitas Microsoft Word, mencakup alur kerja dasar hingga penerapan fitur akademis lanjut.

== Alur Kerja Dasar (Basic Workflow)

Tahap awal adalah membiasakan diri dengan operasi fundamental program.

=== Membuka dan Membuat Dokumen

Program dibuka melalui Start Menu Windows. Setelah program terbuka, dokumen baru dibuat dengan memilih `File > New > Blank Document`. Alternatifnya, pengguna dapat memilih _template_ yang sudah ada, seperti _template_ "Report". @modul-word-2023

#img("assets/startup.png", caption: "Membuat dokumen baru", width: 12cm)

=== Pemformatan Dasar

Pemformatan teks dasar dieksplorasi menggunakan tab *Home*.
+ *Grup Font*: Digunakan untuk mengubah jenis huruf (*font family*), ukuran (*font size*), dan atribut (Bold, Italic, Underline).
+ *Grup Paragraph*: Digunakan untuk mengatur perataan teks (Align Left, Center, Right, Justify), spasi baris (*line spacing*), dan indentasi.

#img("assets/font.png", caption: "Grup Font pada tab Home", width: 8cm)
#img("assets/paragraph.png", caption: "Grup Paragraph pada tab Home", width: 8cm)

=== Menyimpan Dokumen

Dokumen disimpan menggunakan `File > Save As`. Format penyimpanan utama adalah `.docx`, yang merupakan standar modern berbasis XML. Untuk kompatibilitas dengan versi lama, opsi `.doc` (Word 97-2003) juga tersedia.

== Fitur Penulisan Akademis (Academic Features)

Tahap kedua berfokus pada fitur yang mengotomatisasi penulisan laporan terstruktur.

=== Memanfaatkan Headings (Styles)

#img("assets/styles.png", caption: "Grup Styles pada tab Home", width: 8cm)

Fitur fundamental yang dieksplorasi adalah *Styles* (`Home > Styles`). Alih-alih memformat judul secara manual, *style* "Heading 1" diterapkan untuk judul bab, dan "Heading 2" untuk sub-bab. Praktik ini memastikan konsistensi pemformatan di seluruh dokumen dan memberi label semantik pada struktur dokumen.

=== Membuat Daftar Isi (Table of Contents) Otomatis

#img("assets/toc.png", caption: "Grup Table of Contents pada tab References", width: 6cm)

Struktur yang dibuat menggunakan *Headings* memungkinkan pembuatan Daftar Isi (ToC) secara otomatis. Proses ini dilakukan dengan menempatkan kursor di halaman yang diinginkan dan memilih `References > Table of Contents`. Word secara otomatis memindai dokumen, mencari *Headings*, dan membuat daftar isi lengkap dengan nomor halaman.

=== Membuat Keterangan (Captions)

#img("assets/caption.png", caption: "Grup Caption pada tab References", width: 6cm)

Setiap gambar dan tabel yang disisipkan diberi label menggunakan `References > Insert Caption`. Fitur ini secara otomatis mengelola penomoran (misal, "Gambar 1", "Gambar 2").

=== Membuat Daftar Gambar dan Tabel
Mirip dengan ToC, *captions* yang telah dibuat memungkinkan pembuatan Daftar Gambar (Table of Figures) secara otomatis. Proses ini dilakukan melalui `References > Insert Table of Figures`.

=== Mengelola Sitasi dan Daftar Pustaka

#img("assets/citation.png", caption: "Grup Citations & Bibliography pada tab References", width: 6cm)

Manajemen referensi diuji menggunakan alat pada tab `References > Citations & Bibliography`.
+ *Gaya*\
  Gaya sitasi diatur ke "IEEE" (gaya akademis untuk bidang _Computer Science_).
+ *Sumber*\
  Sumber (buku, jurnal) dimasukkan melalui `Manage Sources`.
+ *Sitasi*\
  Kutipan dalam teks disisipkan menggunakan `Insert Citation`.
+ *Daftar Pustaka*\
  Di akhir dokumen, daftar pustaka lengkap digenerasi secara otomatis dengan memilih `Bibliography`.

== Ekspor Dokumen

Tahap akhir dari alur kerja adalah distribusi dokumen. Format PDF dipilih sebagai standar portabel universal. Dokumen diekspor melalui `File > Export > Create PDF/XPS Document`. Proses ini mengunci pemformatan dan memastikan dokumen tampil identik di perangkat mana pun.

#pagebreak()

= Kesimpulan

Eksplorasi Microsoft Word menunjukkan bahwa program ini lebih dari sekadar editor teks. Kekuatan utamanya terletak pada otomatisasi dan standarisasi.

Fitur *Styles*, khususnya *Headings*, adalah fondasi terpenting untuk dokumen terstruktur. Fitur ini menjadi prasyarat untuk otomatisasi Daftar Isi dan navigasi dokumen.

Fitur pada tab *References* secara drastis meningkatkan efisiensi penulisan akademis. Otomatisasi Daftar Isi, Daftar Gambar, sitasi, dan Daftar Pustaka mengurangi risiko kesalahan manual.

Alur kerja dari pemformatan dasar, penggunaan *Styles*, manajemen referensi, hingga ekspor ke PDF membentuk siklus lengkap produksi dokumen profesional. Penguasaan alur kerja ini esensial untuk produktivitas di lingkungan akademis dan perkantoran.

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
