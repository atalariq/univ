#import "@preview/numbly:0.1.0": numbly

// --- Pengaturan Dokumen ---
#set page(paper: "a4", margin: 1in)
#set document(title: "Praktikum Basis Data", author: "Atalariq Barra Hadinugraha")
#set text(font: "Times New Roman", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 1.5em, all: true))
#set heading(numbering: numbly("{1:A}.", "{2}.", "{3:a}.", "{2}.{3}.{4}"))

// --- Judul ---
#align(center)[
  #text(16pt, weight: "bold")[Tugas Praktikum Struktur Data]\
  #text(14pt)[ERD Sistem Indekos]
]
#line(length: 100%)

// --- Isi Laporan ---

= Sistem Indekos

Sistem indekos merupakan sistem pengelolaan hunian sewa berbasis kamar yang melibatkan
tiga pihak utama:
+ pemilik properti,
+ unit kamar yang disewakan, dan
+ penghuni sebagai penyewa.
Sistem ini mencakup seluruh siklus operasional mulai dari pencatatan data kamar dan penghuni, pengelolaan kontrak sewa, hingga perekaman transaksi pembayaran bulanan.

= Penjelasan

#figure(image("assets/erd.png"), caption: [Diagram ERD Sistem Indekos])

== Entity

Terdapat lima entitas dalam sistem indekos ini. Setiap entitas dipertahankan sebagai objek mandiri karena memiliki atribut sendiri, siklus hidup (_lifecycle_) yang independen, dan dirujuk oleh lebih dari satu relasi dalam sistem.

=== PEMILIK

Entitas PEMILIK merepresentasikan individu atau badan yang memiliki hak kepemilikan atas properti kos. Entitas ini bersifat fundamental karena menjadi titik asal dari seluruh hierarki. Tanpa pemilik, kamar tidak dapat terdaftar dalam sistem.
Atribut yang disimpan meliputi:
- `PEMILIK_ID`
- `NAMA`
- `NO_HP`
- `EMAIL`
- `ALAMAT`

=== KAMAR

Entitas KAMAR merepresentasikan unit fisik yang dapat disewakan. Kamar memiliki
atribut deskriptif seperti
- `TIPE`: (single, double, VIP)
- `HARGA_PER_BULAN`
- `FASILITAS`
- `STATUS`: (`tersedia`, `terisi`, `perbaikan`)

=== PENGHUNI

Entitas PENGHUNI menyimpan identitas penyewa secara independen dari kontrak sewanya. Pemisahan ini disengaja: apabila seorang penghuni keluar lalu kembali menyewa di kemudian hari, data identitasnya tidak perlu diinput ulang. Atribut antara lain:
- `NIK`
- `KONTAK_DARURAT`

=== SEWA

Entitas SEWA adalah _associative entity_ yang menghubungkan PENGHUNI dan KAMAR. Keberadaannya tidak sekadar sebagai tabel penghubung, melainkan karena relasi antara penghuni dan kamar bersifat _many-to-many_—satu penghuni dapat menyewa beberapa kamar secara bergantian, dan satu kamar dapat ditempati oleh penghuni yang berbeda. Entitas ini juga menyimpan atribut yang hanya bermakna
dalam konteks hubungan tersebut:
- `TGL_MASUK`
- `TGL_KELUAR`
- `STATUS`: (`aktif`, `selesai`, `dibatalkan`)

Atribut-atribut ini tidak dapat ditempatkan di PENGHUNI maupun di KAMAR tanpa menimbulkan ambiguitas data.

=== PEMBAYARAN

Entitas PEMBAYARAN mencatat setiap transaksi pembayaran sewa per periode. Entitas ini dipisahkan dari SEWA karena satu kontrak sewa menghasilkan banyak transaksi pembayaran (satu per bulan selama masa sewa berlangsung). Atributnya antara lain:
- `BULAN_BAYAR`: (`YYYY-MM`)
- `STATUS`: (`lunas`, `belum_bayar`, `terlambat`)

== Relationship

Berikut adalah relasi-relasi yang terbentuk antar entitas dalam sistem indekos:

=== PEMILIK > KAMAR (One-to-Many)

Satu pemilik dapat memiliki banyak kamar, namun setiap kamar hanya dimiliki oleh satu pemilik. Relasi ini bersifat _mandatory_ di sisi kamar, sebuah kamar tidak dapat eksis dalam sistem tanpa entitas pemilik yang merujukinya.

=== PENGHUNI > SEWA (One-to-Many)

Satu penghuni dapat melakukan banyak transaksi sewa (dalam periode yang berbeda), namun setiap record SEWA hanya merujuk pada satu penghuni. Relasi ini memungkinkan sistem menyimpan riwayat sewa seorang penghuni sepanjang waktu.

=== KAMAR > SEWA (One-to-Many)

Satu kamar dapat disewa melalui banyak kontrak sewa yang berbeda (secara bergantian), namun setiap record SEWA hanya merujuk pada satu kamar. Kombinasi relasi (2) dan (3) inilah yang memecah hubungan _many-to-many_ antara PENGHUNI dan KAMAR menjadi dua relasi _one-to-many_ melalui entitas SEWA.

=== SEWA > PEMBAYARAN (One-to-Many)

Satu kontrak sewa menghasilkan banyak record pembayaran (satu per bulan). Setiap record PEMBAYARAN merujuk pada tepat satu kontrak SEWA, sehingga jejak audit pembayaran dapat ditelusuri hingga ke kontrak dan penghuni asalnya.

== Matrix Diagram

Tabel berikut merepresentasikan matriks relasi antar seluruh entitas dalam sistem.

#table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr, 1fr),
  inset: 7pt,
  align: center + horizon,
  stroke: 0.5pt,

  // Header row
  table.header(
    table.cell(fill: rgb("#1e3a5f"))[#text(fill: white, weight: "bold")[Entitas]],
    table.cell(fill: rgb("#1e3a5f"))[#text(fill: white, weight: "bold")[PEMILIK]],
    table.cell(fill: rgb("#1e3a5f"))[#text(fill: white, weight: "bold")[KAMAR]],
    table.cell(fill: rgb("#1e3a5f"))[#text(fill: white, weight: "bold")[PENGHUNI]],
    table.cell(fill: rgb("#1e3a5f"))[#text(fill: white, weight: "bold")[SEWA]],
    table.cell(fill: rgb("#1e3a5f"))[#text(fill: white, weight: "bold")[PEMBAYARAN]],
  ),

  // Row: PEMILIK
  table.cell(fill: rgb("#dbe9f9"))[#text(weight: "bold")[PEMILIK]],
  table.cell(fill: rgb("#f0f0f0"))[-],
  [Memiliki \ (1:N)],
  [-],
  [-],
  [-],

  // Row: KAMAR
  table.cell(fill: rgb("#dbe9f9"))[#text(weight: "bold")[KAMAR]],
  [Dimiliki oleh \ (N:1)],
  table.cell(fill: rgb("#f0f0f0"))[-],
  [-],
  [Disewa melalui \ (1:N)],
  [-],

  // Row: PENGHUNI
  table.cell(fill: rgb("#dbe9f9"))[#text(weight: "bold")[PENGHUNI]],
  [-],
  [-],
  table.cell(fill: rgb("#f0f0f0"))[-],
  [Melakukan \ (1:N)],
  [-],

  // Row: SEWA
  table.cell(fill: rgb("#dbe9f9"))[#text(weight: "bold")[SEWA]],
  [-],
  [Melibatkan \ (N:1)],
  [Dilakukan oleh \ (N:1)],
  table.cell(fill: rgb("#f0f0f0"))[-],
  [Menghasilkan \ (1:N)],

  // Row: PEMBAYARAN
  table.cell(fill: rgb("#dbe9f9"))[#text(weight: "bold")[PEMBAYARAN]],
  [-],
  [-],
  [-],
  [Bagian dari \ (N:1)],
  table.cell(fill: rgb("#f0f0f0"))[-],
)

