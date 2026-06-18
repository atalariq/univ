#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
)

#show: report.with(
  ..metadata,
  use-cover: false,
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
)


// ? imple header
#align(center)[
  #text(1.25em, weight: "bold")[
    Jawaban UTS Praktikum Basis Data
  ]

  #text(0.8em)[
    #metadata.author \
    (#metadata.id)
  ]
]
#line(length: 100%)


#set par(justify: true)
#set heading(numbering: none)
// #set enum(numbering: "1.")

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), width: 14cm, ..args)

= Soal


Akan dibangun sebuah perpustakaan yang dapat digunakan untuk peminjaman buku baik itu buku fisik maupun buku digital. Pencatatan yang dilakukan pada sistem adalah data peminjam/anggota perpustakaan, data buku, data penulis, data penerbit, data pustakawan yang sekaligus menjadi admin, dan tentu saja data peminjaman/pengembalian. Peminjaman buku digital (ebook) juga harus tercatat oleh pustakawan seperti halnya buku fisik.

+ Lakukan analisis dengan menentukan entitas apa saja yang terlibat dalam sistem kemudian buatlah ERD (logical model) dari sistem di atas menggunakan Oracle Data Modeller!
+ Setelah dibuat logical model-nya konversikan (engineer) ke dalam relational model sehingga didapatkan desain basis data yang siap diimplementasikan! Selain tangkapan layar, sertakan juga hasil akhir dari seluruh tabel yang terbentuk dengan format berikut:
  Format: Namatabel (kolom1, kolom2, …dst)
  Contoh: Member (id, nama, alamat, …dst)
+ Tuliskan perintah SQL untuk membuat tabel-tabel yang ada (minimal 3), lengkap dengan primary key dan foreign key-nya! Sertakan hasil running SQL berupa tangkapan layar pada Oracle!

= Hasil Analisis

Berdasarkan studi kasus sistem peminjaman buku atau sistem perpustakaan tersebut, entitas yang terlibat serta peran/atributnya adalah sebagai berikut:
+ `anggota` (peminjam): entitas yang dapat melakukan peminjaman
  - `id` (PK)
  - `nama`: Nama anggota
  - `email`: Alamat e-mail anggota untuk pemberitahuan.
  - `nomor_telepon`: Nomor telepon anggota untuk pemberitahuan.
+ `pustakawan` (admin): entitas yang mencatat peminjaman
  - `id` (PK)
  - `nama`: Nama pustakawan
+ `buku`
  - `isbn` (PK)
  - `id_penulis` (FK)
  - `id_penerbit` (FK)
  - `judul`: Judul buku
  - `tahun_terbit`: Tahun terbit buku
  - `kategori`: Kategori/Jenis buku, misalnya seperti Agama, Bisnis, Sains, dan sebagainya
  - `format`: Fisik (`F`) atau Digital (`D`)
  - `lokasi_rak`: lokasi rak yang menyimpan buku fisik
  - `akses_url`: URL untuk mengakses buku digital
  - `stok`: jumlah buku fisik yang tersedia
+ `penulis`
  - `id` (PK)
  - `nama`: Nama penulis
+ `penerbit`
  - `id` (PK)
  - `nama`: Nama penerbit
  - `kota`: Kota tempat penerbit, semisal 'Jakarta', 'Yogyakarta', 'Solo', dan sebagainya
+ `peminjaman`: kontrak peminjaman maupun pengembalian yang mengikat `anggota`, `pustakawan`, serta `buku`
  - `id` (PK)
  - `id_anggota` (FK)
  - `id_pustakawan` (FK)
  - `id_buku` (FK)
  - `tanggal_pinjam`: Tanggal peminjaman
  - `tenggat_pengembalian`: Tenggat waktu pengembalian
  - `tanggal_pengembalian`: Tanggal pengembalian, bisa berisi `NULL` apabila masih dipinjam
  - `status`: Status peminjaman, masih dipinjam (`P`); sudah dikembalikan (`K`); terlambat (`T`)
  - `denda`: Denda yang diberikan apabila tanggal pengembalian melebihi tenggat yang diberikan

= Logical dan Relational Model dengan Oracle Datamodeler

#img("assets/logical-model.png", caption: [Logical Model ERD])
#img("assets/relational-model.png", caption: [Relational Model])

= Implementasi Tabel Database Oracle dengan Oracle SQL Developer

#code(
  ```sql
CREATE TABLE penerbit (
    id VARCHAR2(10) NOT NULL,
    nama VARCHAR2(100) NOT NULL,
    kota VARCHAR2(50),
    CONSTRAINT pk_penerbit PRIMARY KEY (id)
);
CREATE TABLE penulis (
    id VARCHAR2(10) NOT NULL,
    nama VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_penulis PRIMARY KEY (id)
);
CREATE TABLE buku (
    isbn VARCHAR2(10) NOT NULL,
    judul VARCHAR2(200) NOT NULL,
    tahun_terbit NUMBER(4),
    format CHAR(1) CHECK (format IN ('F', 'D')),
    lokasi_rak VARCHAR2(20),
    url_akses VARCHAR2(255),
    stok NUMBER(4) DEFAULT 1,
    id_penerbit VARCHAR2(10),
    id_penulis VARCHAR2(10),
    CONSTRAINT pk_buku PRIMARY KEY (isbn),
    CONSTRAINT fk_buku_penerbit FOREIGN KEY (id_penerbit) REFERENCES Penerbit(id),
    CONSTRAINT fk_buku_penulis FOREIGN KEY (id_penulis) REFERENCES Penulis(id)
);
  ```
)

#img("assets/sql.png", caption: [Hasil pembuatan table di Oracle SQL Developer])
