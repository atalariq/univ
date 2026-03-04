#import "./template.typ": *
#import "@preview/numbly:0.1.0": numbly


#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "<course-name>",
  course-code: "<course-code>",
  lecturer: "<lecturer-name>",
  meeting: "<meeting>",
  title: "<report-title>",

  // Content
  minimal: false,
  show-table-of-content: true,
  show-table-of-figure: false,
  show-table-of-table: false,
  show-bibliography: true,

  // Document
  paper: "a4",
  font-size: 12pt,
  font: "New Computer Modern",
  code-font: "Fira Code",
  export-preset: "screen",
)

#set heading(numbering: numbly("{1:A}.", "{2}.", "{2}.{3}", "{2}.{3}.{4}"))

= Tujuan Praktikum

+ Memahami konsep version control dan Git
+ Mampu menggunakan perintah dasar Git
+ Mampu membuat repository dan mengelola commit


= Dasar Teori

Version control adalah sistem yang mencatat perubahan pada file seiring waktu sehingga dapat versi tertentu. Git merupakan distributed version control system yang dibuat oleh Linus Torvalds pada tahun 2005 @git-book.

#code(
  caption: "Instalasi Git di Ubuntu",
  ```bash
  # Install Git
  sudo apt-get update
  sudo apt-get install git
  
  # Configure Git
  git config --global user.name "Your Name"
  git config --global user.email "your@email.com"
  ```
)


= Hasil dan Pembahasan

== Instalasi dan Konfigurasi

Berikut adalah hasil instalasi Git pada sistem operasi Ubuntu:

#code(
  caption: "Cek versi Git",
  ```bash
  $ git --version
  git version 2.34.1
  ```
)

=== Contoh Tabel Perintah Dasar

#tbl(
  caption: "Daftar Perintah Dasar Git",
  columns: (auto, 1fr),
  [Perintah], [Fungsi],
  [git init], [Menginisialisasi repository baru],
  [git add], [Menambahkan file ke staging area],
  [git commit], [Menyimpan perubahan],
  [git push], [Mengunggah ke remote repository],
)

=== Contoh Persamaan Matematika

#eq(
  $E = m c^2$,
  caption: "Relativitas Umum Einstein",
  numbered: true,
)


= Kesimpulan

Dari praktikum ini dapat disimpulkan bahwa:
1. Git sangat penting untuk pengembangan perangkat lunak modern
2. Perintah dasar Git memungkinkan pengelolaan versi yang efektif
3. Pemahaman tentang branching sangat penting untuk workflow kolaboratif
