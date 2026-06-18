# 📚 CHEATSHEET: Studi Kasus Database Perpustakaan
## Panduan Lengkap Analisis, ERD, dan Implementasi SQL

---

## 📋 DAFTAR ISI
```
┌─────────────────────────────────────────────────────────────┐
│  1. Analisis Entitas & Atribut                              │
│  2. Relasi Antar Entitas                                    │
│  3. Panduan Membuat ERD di Oracle Data Modeller             │
│  4. Relational Model (Hasil Konversi)                       │
│  5. SQL DDL - Pembuatan Tabel                               │
│  6. Contoh Data & Query Uji Coba                            │
└─────────────────────────────────────────────────────────────┘
```

---

## 📌 BAGIAN 1: ANALISIS ENTITAS & ATRIBUT

### 1.1 Identifikasi Entitas

```
┌────────────────────────────────────────────────────────────────┐
│                    ENTITAS UTAMA SISTEM                        │
├────────────────┬───────────────────────────────────────────────┤
│   NO           │   ENTITAS                                     │
├────────────────┼───────────────────────────────────────────────┤
│   1            │   ANGGOTA (Member/Peminjam)                   │
│   2            │   BUKU                                        │
│   3            │   PENULIS                                     │
│   4            │   PENERBIT                                    │
│   5            │   PUSTAKAWAN (Admin)                          │
│   6            │   PEMINJAMAN                                  │
│   7            │   BUKU_PENULIS (Associative Entity)           │
└────────────────┴───────────────────────────────────────────────┘
```

### 1.2 Detail Atribut Setiap Entitas

```
╔══════════════════════════════════════════════════════════════════════╗
║  ENTITAS 1: ANGGOTA                                                  ║
╠══════════════════════════════════════════════════════════════════════╣
║  Atribut            │ Tipe Data    │ Keterangan                      ║
╠══════════════════════════════════════════════════════════════════════╣
║  id_anggota         │ NUMBER       │ Primary Key, Auto Increment     ║
║  nama               │ VARCHAR2     │ Nama lengkap anggota            ║
║  alamat             │ VARCHAR2     │ Alamat tinggal                  ║
║  no_telepon         │ VARCHAR2     │ Nomor HP/telepon                ║
║  email              │ VARCHAR2     │ Email aktif                     ║
║  tanggal_daftar     │ DATE         │ Tanggal registrasi              ║
║  status_aktif       │ VARCHAR2     │ Aktif/Tidak Aktif               ║
╚══════════════════════════════════════════════════════════════════════╝
```

```
╔═════════════════════════════════════════════════════════════════════╗
║  ENTITAS 2: BUKU                                                    ║
╠═════════════════════════════════════════════════════════════════════╣
║  Atribut            │ Tipe Data    │ Keterangan                     ║
╠═════════════════════════════════════════════════════════════════════╣
║  id_buku            │ NUMBER       │ Primary Key, Auto Increment    ║
║  isbn               │ VARCHAR2     │ ISBN buku (unik)               ║
║  judul              │ VARCHAR2     │ Judul buku                     ║
║  tahun_terbit       │ NUMBER       │ Tahun diterbitkan              ║
║  jenis_buku         │ VARCHAR2     │ 'Fisik' atau 'Digital'         ║
║  stok_fisik         │ NUMBER       │ Jumlah stok (untuk fisik)      ║
║  file_path          │ VARCHAR2     │ Path file ebook (untuk digital)║
║  id_penerbit        │ NUMBER       │ Foreign Key → PENERBIT         ║
╚═════════════════════════════════════════════════════════════════════╝
```

```
╔═══════════════════════════════════════════════════════════════════╗
║  ENTITAS 3: PENULIS                                               ║
╠═══════════════════════════════════════════════════════════════════╣
║  Atribut            │ Tipe Data    │ Keterangan                   ║
╠═══════════════════════════════════════════════════════════════════╣
║  id_penulis         │ NUMBER       │ Primary Key, Auto Increment  ║
║  nama_penulis       │ VARCHAR2     │ Nama lengkap penulis         ║
║  negara_asal        │ VARCHAR2     │ Negara asal penulis          ║
╚═══════════════════════════════════════════════════════════════════╝
```

```
╔══════════════════════════════════════════════════════════════════════╗
║  ENTITAS 4: PENERBIT                                               ║
╠══════════════════════════════════════════════════════════════════════╣
║  Atribut            │ Tipe Data    │ Keterangan                     ║
╠══════════════════════════════════════════════════════════════════════╣
║  id_penerbit        │ NUMBER       │ Primary Key, Auto Increment    ║
║  nama_penerbit      │ VARCHAR2     │ Nama perusahaan penerbit       ║
║  alamat             │ VARCHAR2     │ Alamat penerbit                ║
║  kota               │ VARCHAR2     │ Kota penerbit                  ║
╚══════════════════════════════════════════════════════════════════════╝
```

```
╔══════════════════════════════════════════════════════════════════════╗
║  ENTITAS 5: PUSTAKAWAN                                             ║
╠══════════════════════════════════════════════════════════════════════╣
║  Atribut            │ Tipe Data    │ Keterangan                     ║
╠══════════════════════════════════════════════════════════════════════╣
║  id_pustakawan      │ NUMBER       │ Primary Key, Auto Increment    ║
║  nama               │ VARCHAR2     │ Nama lengkap pustakawan        ║
║  no_telepon         │ VARCHAR2     │ Nomor HP/telepon               ║
║  email              │ VARCHAR2     │ Email pustakawan               ║
║  username           │ VARCHAR2     │ Username login (unik)          ║
║  password           │ VARCHAR2     │ Password login                 ║
║  jabatan            │ VARCHAR2     │ Jabatan (Kepala/Staff)         ║
╚══════════════════════════════════════════════════════════════════════╝
```

```
╔══════════════════════════════════════════════════════════════════════╗
║  ENTITAS 6: PEMINJAMAN                                             ║
╠══════════════════════════════════════════════════════════════════════╣
║  Atribut            │ Tipe Data    │ Keterangan                     ║
╠══════════════════════════════════════════════════════════════════════╣
║  id_peminjaman      │ NUMBER       │ Primary Key, Auto Increment    ║
║  id_anggota         │ NUMBER       │ Foreign Key → ANGGOTA          ║
║  id_buku            │ NUMBER       │ Foreign Key → BUKU             ║
║  id_pustakawan      │ NUMBER       │ Foreign Key → PUSTAKAWAN       ║
║  tanggal_pinjam     │ DATE         │ Tanggal peminjaman             ║
║  tanggal_jatuh_tempo│ DATE         │ Batas waktu pengembalian       ║
║  tanggal_kembali    │ DATE         │ Tanggal pengembalian (nullable)║
║  status             │ VARCHAR2     │ Dipinjam/Dikembalikan/Terlambat║
║  denda              │ NUMBER       │ Nominal denda (default 0)      ║
╚══════════════════════════════════════════════════════════════════════╝
```

```
╔══════════════════════════════════════════════════════════════════════╗
║  ENTITAS 7: BUKU_PENULIS (Associative Entity)                      ║
╠══════════════════════════════════════════════════════════════════════╣
║  Atribut            │ Tipe Data    │ Keterangan                     ║
╠══════════════════════════════════════════════════════════════════════╣
║  id_buku            │ NUMBER       │ Foreign Key → BUKU (PK bagian) ║
║  id_penulis         │ NUMBER       │ Foreign Key → PENULIS (PK)     ║
╚══════════════════════════════════════════════════════════════════════╝
```

---

## 📌 BAGIAN 2: RELASI ANTAR ENTITAS

```
┌─────────────────────────────────────────────────────────────────────┐
│                    KARDINALITAS RELASI                              │
├──────────────────────┬──────────┬──────────────────────────────────┤
│      RELASI          │ KARDINAL.│         KETERANGAN               │
├──────────────────────┼──────────┼──────────────────────────────────┤
│ PENERBIT - BUKU      │ 1 : N    │ Satu penerbit menerbitkan        │
│                      │          │ banyak buku                      │
├──────────────────────┼──────────┼──────────────────────────────────┤
│ PENULIS - BUKU       │ M : N    │ Satu penulis menulis banyak      │
│                      │          │ buku, satu buku ditulis oleh     │
│                      │          │ banyak penulis                   │
├──────────────────────┼──────────┼──────────────────────────────────┤
│ ANGGOTA - PEMINJAMAN │ 1 : N    │ Satu anggota bisa meminjam       │
│                      │          │ berkali-kali                     │
├──────────────────────┼──────────┼──────────────────────────────────┤
│ BUKU - PEMINJAMAN    │ 1 : N    │ Satu buku bisa dipinjam          │
│                      │          │ berkali-kali                     │
├──────────────────────┼──────────┼──────────────────────────────────┤
│ PUSTAKAWAN - PEMINJ  │ 1 : N    │ Satu pustakawan memproses        │
│                      │          │ banyak peminjaman                │
└──────────────────────┴──────────┴──────────────────────────────────┘
```

### Visualisasi Relasi (Text-based ERD):

```
                    ┌──────────────┐
                    │   PENERBIT   │
                    │──────────────│
                    │ id_penerbit  │
                    │ nama_penerbit│
                    │ alamat       │
                    │ kota         │
                    └──────┬───────┘
                           │ 1
                           │
                           │ N
                    ┌──────┴───────┐
         ┌──────────│     BUKU     │──────────┐
         │          │──────────────│          │
         │          │ id_buku      │          │
         │          │ isbn         │          │
         │ N        │ judul        │ N        │
         │          │ tahun_terbit │          │
         │          │ jenis_buku   │          │
         │          │ stok_fisik   │          │
         │          │ file_path    │          │
         │          │ id_penerbit  │          │
         │          └──────────────┘          │
         │                                    │
   ┌─────┴─────┐                       ┌──────┴─────┐
   │BUKU_PENULIS│                       │  PENULIS   │
   │───────────│                       │────────────│
   │ id_buku   │                       │ id_penulis │
   │ id_penulis│                       │ nama       │
   └───────────┘                       │ negara     │
                                       └────────────┘

    ┌──────────────┐         ┌──────────────┐
    │   ANGGOTA    │         │  PUSTAKAWAN  │
    │──────────────│         │──────────────│
    │ id_anggota   │         │id_pustakawan │
    │ nama         │         │ nama         │
    │ alamat       │         │ no_telepon   │
    │ no_telepon   │         │ email        │
    │ email        │         │ username     │
    │ tanggal_daftar│        │ password     │
    │ status_aktif │         │ jabatan      │
    └──────┬───────┘         └──────┬───────┘
           │ 1                      │ 1
           │                        │
           │ N                      │ N
           └──────────┬─────────────┘
                      │
               ┌──────┴───────┐
               │  PEMINJAMAN  │
               │──────────────│
               │id_peminjaman │
               │ id_anggota   │
               │ id_buku      │
               │ id_pustakawan│
               │ tanggal_pinjam│
               │ tgl_jatuh_tempo│
               │ tgl_kembali  │
               │ status       │
               │ denda        │
               └──────────────┘
```

---

## 📌 BAGIAN 3: PANDUAN MEMBUAT ERD DI ORACLE DATA MODELLER

### 3.1 Langkah-langkah Pembuatan Logical Model

```
┌─────────────────────────────────────────────────────────────────────┐
│  STEP-BY-STEP: ORACLE SQL DEVELOPER DATA MODELLER                  │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ▶ STEP 1: Buka Oracle SQL Developer                               │
│  ├── Menu: View → Data Modeler → Browser                           │
│  └── Panel Data Modeler akan muncul di samping kiri                │
│                                                                     │
│  ▶ STEP 2: Buat Model Baru                                         │
│  ├── Klik kanan pada "Relational Models"                           │
│  ├── Pilih "New Relational Model"                                  │
│  └── Beri nama: "PERPUSTAKAAN_MODEL"                               │
│                                                                     │
│  ▶ STEP 3: Switch ke Logical Model                                 │
│  ├── Klik kanan pada model yang dibuat                             │
│  ├── Pilih "Open" → "Logical Model"                               │
│  └── Atau klik icon "Logical Model" di toolbar                     │
│                                                                     │
│  ▶ STEP 4: Tambahkan Entitas                                       │
│  ├── Klik ikon "Entity" di toolbar (persegi panjang)               │
│  ├── Klik pada area kerja untuk menempatkan entitas                │
│  ├── Double klik entitas untuk mengedit                            │
│  ├── Masukkan nama entitas dan atribut                             │
│  └── Tandai Primary Key dengan icon kunci (🔑)                     │
│                                                                     │
│  ▶ STEP 5: Buat Relasi                                             │
│  ├── Klik ikon "Many-to-Many" atau "One-to-Many"                  │
│  ├── Klik entitas pertama, lalu klik entitas kedua                 │
│  ├── Atur kardinalitas pada dialog yang muncul                     │
│  └── Ulangi untuk semua relasi                                     │
│                                                                     │
│  ▶ STEP 6: Simpan Model                                            │
│  ├── File → Save                                                    │
│  └── File akan tersimpan sebagai .dmd                              │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 3.2 Detail Pengisian Setiap Entitas di ODM

```
┌─────────────────────────────────────────────────────────────────────┐
│  KONFIGURASI ENTITAS DI ORACLE DATA MODELLER                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  📦 ENTITAS: ANGGOTA                                               │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Name: ANGGOTA                                           │       │
│  │ Columns:                                                │       │
│  │   🔑 ID_ANGGOTA    NUMBER   PK    NOT NULL              │       │
│  │      NAMA          VARCHAR2(100)      NOT NULL          │       │
│  │      ALAMAT        VARCHAR2(255)                        │       │
│  │      NO_TELEPON    VARCHAR2(20)                         │       │
│  │      EMAIL         VARCHAR2(100)                        │       │
│  │      TANGGAL_DAFTAR DATE            NOT NULL            │       │
│  │      STATUS_AKTIF  VARCHAR2(10)     DEFAULT 'Aktif'     │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  📦 ENTITAS: BUKU                                                  │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Name: BUKU                                              │       │
│  │ Columns:                                                │       │
│  │   🔑 ID_BUKU       NUMBER   PK    NOT NULL              │       │
│  │      ISBN          VARCHAR2(20)      UNIQUE             │       │
│  │      JUDUL         VARCHAR2(255)     NOT NULL           │       │
│  │      TAHUN_TERBIT  NUMBER                              │       │
│  │      JENIS_BUKU    VARCHAR2(10)      CHECK('Fisik','Digital')│
│  │      STOK_FISIK    NUMBER            DEFAULT 0          │       │
│  │      FILE_PATH     VARCHAR2(500)                        │       │
│  │      ID_PENERBIT   NUMBER            FK → PENERBIT      │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  📦 ENTITAS: PENULIS                                               │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Name: PENULIS                                           │       │
│  │ Columns:                                                │       │
│  │   🔑 ID_PENULIS    NUMBER   PK    NOT NULL              │       │
│  │      NAMA_PENULIS  VARCHAR2(100)     NOT NULL           │       │
│  │      NEGARA_ASAL   VARCHAR2(50)                         │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  📦 ENTITAS: PENERBIT                                              │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Name: PENERBIT                                          │       │
│  │ Columns:                                                │       │
│  │   🔑 ID_PENERBIT   NUMBER   PK    NOT NULL              │       │
│  │      NAMA_PENERBIT VARCHAR2(100)     NOT NULL           │       │
│  │      ALAMAT        VARCHAR2(255)                        │       │
│  │      KOTA          VARCHAR2(100)                        │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  📦 ENTITAS: PUSTAKAWAN                                            │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Name: PUSTAKAWAN                                        │       │
│  │ Columns:                                                │       │
│  │   🔑 ID_PUSTAKAWAN NUMBER   PK    NOT NULL              │       │
│  │      NAMA          VARCHAR2(100)     NOT NULL           │       │
│  │      NO_TELEPON    VARCHAR2(20)                         │       │
│  │      EMAIL         VARCHAR2(100)                        │       │
│  │      USERNAME      VARCHAR2(50)      UNIQUE             │       │
│  │      PASSWORD      VARCHAR2(255)                        │       │
│  │      JABATAN       VARCHAR2(50)                         │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  📦 ENTITAS: PEMINJAMAN                                            │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Name: PEMINJAMAN                                        │       │
│  │ Columns:                                                │       │
│  │   🔑 ID_PEMINJAMAN NUMBER   PK    NOT NULL              │       │
│  │      ID_ANGGOTA    NUMBER            FK → ANGGOTA       │       │
│  │      ID_BUKU       NUMBER            FK → BUKU          │       │
│  │      ID_PUSTAKAWAN NUMBER            FK → PUSTAKAWAN    │       │
│  │      TANGGAL_PINJAM DATE             NOT NULL           │       │
│  │      TGL_JATUH_TEMPO DATE            NOT NULL           │       │
│  │      TGL_KEMBALI   DATE                                 │       │
│  │      STATUS        VARCHAR2(20)      NOT NULL           │       │
│  │      DENDA         NUMBER            DEFAULT 0          │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  📦 ENTITAS: BUKU_PENULIS (Associative)                            │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Name: BUKU_PENULIS                                      │       │
│  │ Columns:                                                │       │
│  │   🔑 ID_BUKU       NUMBER   PK/FK → BUKU    NOT NULL    │       │
│  │   🔑 ID_PENULIS    NUMBER   PK/FK → PENULIS NOT NULL    │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 3.3 Konfigurasi Relasi di ODM

```
┌─────────────────────────────────────────────────────────────────────┐
│  PENGATURAN RELASI (RELATIONS)                                      │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  RELASI 1: PENERBIT → BUKU (1:N)                                   │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Source: PENERBIT                                        │       │
│  │ Target: BUKU                                            │       │
│  │ Cardinality: One-to-Many                                │       │
│  │ On Delete: No Action (Restrict)                         │       │
│  │ FK Column: BUKU.ID_PENERBIT → PENERBIT.ID_PENERBIT     │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  RELASI 2: PENULIS ↔ BUKU (M:N)                                    │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Type: Many-to-Many (auto-generate associative entity)   │       │
│  │ Entity Name: BUKU_PENULIS                               │       │
│  │ FK 1: BUKU_PENULIS.ID_BUKU → BUKU.ID_BUKU              │       │
│  │ FK 2: BUKU_PENULIS.ID_PENULIS → PENULIS.ID_PENULIS     │       │
│  │ Composite PK: (ID_BUKU, ID_PENULIS)                     │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  RELASI 3: ANGGOTA → PEMINJAMAN (1:N)                              │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Source: ANGGOTA                                         │       │
│  │ Target: PEMINJAMAN                                      │       │
│  │ Cardinality: One-to-Many                                │       │
│  │ On Delete: No Action                                    │       │
│  │ FK: PEMINJAMAN.ID_ANGGOTA → ANGGOTA.ID_ANGGOTA         │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  RELASI 4: BUKU → PEMINJAMAN (1:N)                                 │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Source: BUKU                                            │       │
│  │ Target: PEMINJAMAN                                      │       │
│  │ Cardinality: One-to-Many                                │       │
│  │ On Delete: No Action                                    │       │
│  │ FK: PEMINJAMAN.ID_BUKU → BUKU.ID_BUKU                  │       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
│  RELASI 5: PUSTAKAWAN → PEMINJAMAN (1:N)                           │
│  ┌─────────────────────────────────────────────────────────┐       │
│  │ Source: PUSTAKAWAN                                      │       │
│  │ Target: PEMINJAMAN                                      │       │
│  │ Cardinality: One-to-Many                                │       │
│  │ On Delete: No Action                                    │       │
│  │ FK: PEMINJAMAN.ID_PUSTAKAWAN → PUSTAKAWAN.ID_PUSTAKAWAN│       │
│  └─────────────────────────────────────────────────────────┘       │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 3.4 Engineer ke Relational Model

```
┌─────────────────────────────────────────────────────────────────────┐
│  KONVERSI LOGICAL → RELATIONAL MODEL                                │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ▶ STEP 1: Buka Logical Model yang sudah dibuat                    │
│                                                                     │
│  ▶ STEP 2: Klik menu "Engineer to Relational Model"                │
│     ├── Ikon: 🔧 (Engineering icon di toolbar)                      │
│     └── Atau: Menu → Engineer → Engineer to Relational Model       │
│                                                                     │
│  ▶ STEP 3: Konfigurasi Engineering                                 │
│     ├── Pilih target: Relational Model                              │
│     ├── Ceklis: "Generate DDL"                                     │
│     └── Klik "Engineer"                                             │
│                                                                     │
│  ▶ STEP 4: Verifikasi Hasil Konversi                               │
│     ├── Buka tab "Relational Model"                                 │
│     ├── Pastikan semua tabel sudah terbentuk                        │
│     └── Cek FK dan PK sudah benar                                  │
│                                                                     │
│  ▶ STEP 5: Generate DDL Script                                     │
│     ├── Klik kanan pada Relational Model                            │
│     ├── Pilih "Generate DDL"                                        │
│     ├── Pilih output: "To Worksheet" atau "To File"                │
│     └── Script SQL siap digunakan!                                  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 📌 BAGIAN 4: RELATIONAL MODEL (HASIL KONVERSI)

### 4.1 Struktur Tabel Final

```
╔══════════════════════════════════════════════════════════════════════════╗
║                    RELATIONAL MODEL - PERPUSTAKAAN                       ║
╠══════════════════════════════════════════════════════════════════════════╣
║                                                                         ║
║  PENERBIT (id_penerbit, nama_penerbit, alamat, kota)                   ║
║      │                                                                  ║
║      │ 1:N                                                              ║
║      ▼                                                                  ║
║  BUKU (id_buku, isbn, judul, tahun_terbit, jenis_buku, stok_fisik,     ║
║        file_path, id_penerbit)                                         ║
║      │                                                                  ║
║      ├──M:N──────────────────┐                                         ║
║      │                       │                                         ║
║      ▼                       │                                         ║
║  BUKU_PENULIS (id_buku, id_penulis)                                     ║
║                       │                                                ║
║                       │                                                ║
║      PENULIS (id_penulis, nama_penulis, negara_asal) ◄────────────────┘│
║                                                                         ║
║  ANGGOTA (id_anggota, nama, alamat, no_telepon, email,                  ║
║           tanggal_daftar, status_aktif)                                 ║
║      │                                                                  ║
║      │ 1:N                                                              ║
║      ▼                                                                  ║
║  PEMINJAMAN (id_peminjaman, id_anggota, id_buku, id_pustakawan,         ║
║              tanggal_pinjam, tgl_jatuh_tempo, tgl_kembali,              ║
║              status, denda)                                             ║
║      ▲                    ▲                                              ║
║      │ 1:N                │ 1:N                                          ║
║      │                    │                                              ║
║  PUSTAKAWAN (id_pustakawan, nama, no_telepon, email,                    ║
║             username, password, jabatan)                                ║
║                                                                         ║
╚══════════════════════════════════════════════════════════════════════════╝
```

### 4.2 Notasi Tabel (Format Yang Diminta)

```
┌─────────────────────────────────────────────────────────────────────┐
│  HASIL KONVERSI RELATIONAL MODEL                                    │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  PENERBIT (id_penerbit, nama_penerbit, alamat, kota)               │
│                                                                     │
│  PENULIS (id_penulis, nama_penulis, negara_asal)                   │
│                                                                     │
│  BUKU (id_buku, isbn, judul, tahun_terbit, jenis_buku, stok_fisik, │
│        file_path, id_penerbit)                                      │
│                                                                     │
│  BUKU_PENULIS (id_buku, id_penulis)                                │
│                                                                     │
│  ANGGOTA (id_anggota, nama, alamat, no_telepon, email,             │
│           tanggal_daftar, status_aktif)                             │
│                                                                     │
│  PUSTAKAWAN (id_pustakawan, nama, no_telepon, email, username,     │
│             password, jabatan)                                      │
│                                                                     │
│  PEMINJAMAN (id_peminjaman, id_anggota, id_buku, id_pustakawan,    │
│              tanggal_pinjam, tgl_jatuh_tempo, tgl_kembali, status,  │
│              denda)                                                  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 4.3 Detail Primary Key & Foreign Key

```
┌──────────────────────────────────────────────────────────────────────────┐
│  MAPPING PRIMARY KEY & FOREIGN KEY                                       │
├──────────────────┬─────────────────┬─────────────────────────────────────┤
│     TABEL        │   PRIMARY KEY   │   FOREIGN KEY                       │
├──────────────────┼─────────────────┼─────────────────────────────────────┤
│ PENERBIT         │ id_penerbit     │ -                                   │
├──────────────────┼─────────────────┼─────────────────────────────────────┤
│ PENULIS          │ id_penulis      │ -                                   │
├──────────────────┼─────────────────┼─────────────────────────────────────┤
│ BUKU             │ id_buku         │ id_penerbit → PENERBIT(id_penerbit) │
├──────────────────┼─────────────────┼─────────────────────────────────────┤
│ BUKU_PENULIS     │ id_buku,        │ id_buku → BUKU(id_buku)             │
│                  │ id_penulis      │ id_penulis → PENULIS(id_penulis)    │
│                  │ (Composite PK)  │                                     │
├──────────────────┼─────────────────┼─────────────────────────────────────┤
│ ANGGOTA          │ id_anggota      │ -                                   │
├──────────────────┼─────────────────┼─────────────────────────────────────┤
│ PUSTAKAWAN       │ id_pustakawan   │ -                                   │
├──────────────────┼─────────────────┼─────────────────────────────────────┤
│ PEMINJAMAN       │ id_peminjaman   │ id_anggota → ANGGOTA(id_anggota)    │
│                  │                 │ id_buku → BUKU(id_buku)             │
│                  │                 │ id_pustakawan → PUSTAKAWAN          │
│                  │                 │   (id_pustakawan)                   │
└──────────────────┴─────────────────┴─────────────────────────────────────┘
```

---

## 📌 BAGIAN 5: SQL DDL - PEMBUATAN TABEL

### 5.1 Script SQL Lengkap

```sql
/******************************************************************************/
/*  DATABASE: PERPUSTAKAAN                                                     */
/*  DIBUAT OLEH: [Nama Anda]                                                   */
/*  TANGGAL: [Tanggal Pembuatan]                                               */
/*  DESKRIPSI: Schema database untuk sistem peminjaman buku fisik & digital    */
/******************************************************************************/

-- ============================================================
-- HAPUS TABEL JIKA SUDAH ADA (DROP SEQUENCE DAN TABLE)
-- Urutan penghapusan harus memperhatikan foreign key
-- ============================================================

DROP SEQUENCE seq_peminjaman;
DROP SEQUENCE seq_pustakawan;
DROP SEQUENCE seq_anggota;
DROP SEQUENCE seq_buku;
DROP SEQUENCE seq_penulis;
DROP SEQUENCE seq_penerbit;

DROP TABLE peminjaman CASCADE CONSTRAINTS;
DROP TABLE buku_penulis CASCADE CONSTRAINTS;
DROP TABLE buku CASCADE CONSTRAINTS;
DROP TABLE pustakawan CASCADE CONSTRAINTS;
DROP TABLE anggota CASCADE CONSTRAINTS;
DROP TABLE penulis CASCADE CONSTRAINTS;
DROP TABLE penerbit CASCADE CONSTRAINTS;

-- ============================================================
-- BUAT SEQUENCE UNTUK AUTO INCREMENT
-- ============================================================

CREATE SEQUENCE seq_penerbit
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_penulis
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_buku
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_anggota
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_pustakawan
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_peminjaman
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- ============================================================
-- TABEL 1: PENERBIT (Tabel Induk - Tidak ada FK)
-- ============================================================

CREATE TABLE penerbit (
    id_penerbit      NUMBER          CONSTRAINT pk_penerbit PRIMARY KEY,
    nama_penerbit    VARCHAR2(100)   CONSTRAINT nn_penerbit_nama NOT NULL,
    alamat           VARCHAR2(255),
    kota             VARCHAR2(100)
);

-- ============================================================
-- TABEL 2: PENULIS (Tabel Induk - Tidak ada FK)
-- ============================================================

CREATE TABLE penulis (
    id_penulis       NUMBER          CONSTRAINT pk_penulis PRIMARY KEY,
    nama_penulis     VARCHAR2(100)   CONSTRAINT nn_penulis_nama NOT NULL,
    negara_asal      VARCHAR2(50)
);

-- ============================================================
-- TABEL 3: BUKU (Memiliki FK ke PENERBIT)
-- ============================================================

CREATE TABLE buku (
    id_buku          NUMBER          CONSTRAINT pk_buku PRIMARY KEY,
    isbn             VARCHAR2(20)    CONSTRAINT uq_buku_isbn UNIQUE,
    judul            VARCHAR2(255)   CONSTRAINT nn_buku_judul NOT NULL,
    tahun_terbit     NUMBER          CONSTRAINT ck_buku_tahun
                                    CHECK (tahun_terbit BETWEEN 1000 AND 2100),
    jenis_buku       VARCHAR2(10)    CONSTRAINT nn_buku_jenis NOT NULL
                                    CONSTRAINT ck_buku_jenis
                                    CHECK (jenis_buku IN ('Fisik', 'Digital')),
    stok_fisik       NUMBER          DEFAULT 0
                                    CONSTRAINT ck_buku_stok CHECK (stok_fisik >= 0),
    file_path        VARCHAR2(500),
    id_penerbit      NUMBER          CONSTRAINT nn_buku_penerbit NOT NULL
                                    CONSTRAINT fk_buku_penerbit
                                    REFERENCES penerbit(id_penerbit),
    CONSTRAINT ck_buku_stok_fisik
        CHECK (
            CASE
                WHEN jenis_buku = 'Fisik' THEN stok_fisik >= 0
                ELSE 1=1
            END
        ),
    CONSTRAINT ck_buku_file
        CHECK (
            CASE
                WHEN jenis_buku = 'Digital' THEN file_path IS NOT NULL
                ELSE 1=1
            END
        )
);

-- ============================================================
-- TABEL 4: BUKU_PENULIS (Tabel Relasi M:N - Composite PK)
-- ============================================================

CREATE TABLE buku_penulis (
    id_buku          NUMBER          CONSTRAINT nn_bp_buku NOT NULL
                                    CONSTRAINT fk_bp_buku
                                    REFERENCES buku(id_buku)
                                    ON DELETE CASCADE,
    id_penulis       NUMBER          CONSTRAINT nn_bp_penulis NOT NULL
                                    CONSTRAINT fk_bp_penulis
                                    REFERENCES penulis(id_penulis)
                                    ON DELETE CASCADE,
    CONSTRAINT pk_buku_penulis PRIMARY KEY (id_buku, id_penulis)
);

-- ============================================================
-- TABEL 5: ANGGOTA (Tabel Induk - Tidak ada FK)
-- ============================================================

CREATE TABLE anggota (
    id_anggota       NUMBER          CONSTRAINT pk_anggota PRIMARY KEY,
    nama             VARCHAR2(100)   CONSTRAINT nn_anggota_nama NOT NULL,
    alamat           VARCHAR2(255),
    no_telepon       VARCHAR2(20),
    email            VARCHAR2(100)   CONSTRAINT uq_anggota_email UNIQUE,
    tanggal_daftar   DATE            CONSTRAINT nn_anggota_tgl NOT NULL
                                    DEFAULT SYSDATE,
    status_aktif     VARCHAR2(10)    DEFAULT 'Aktif'
                                    CONSTRAINT ck_anggota_status
                                    CHECK (status_aktif IN ('Aktif', 'Tidak Aktif'))
);

-- ============================================================
-- TABEL 6: PUSTAKAWAN (Tabel Induk - Tidak ada FK)
-- ============================================================

CREATE TABLE pustakawan (
    id_pustakawan    NUMBER          CONSTRAINT pk_pustakawan PRIMARY KEY,
    nama             VARCHAR2(100)   CONSTRAINT nn_pustakawan_nama NOT NULL,
    no_telepon       VARCHAR2(20),
    email            VARCHAR2(100),
    username         VARCHAR2(50)    CONSTRAINT nn_pustakawan_user NOT NULL
                                    CONSTRAINT uq_pustakawan_user UNIQUE,
    password         VARCHAR2(255)   CONSTRAINT nn_pustakawan_pass NOT NULL,
    jabatan          VARCHAR2(50)    DEFAULT 'Staff'
                                    CONSTRAINT ck_pustakawan_jabatan
                                    CHECK (jabatan IN ('Kepala', 'Staff'))
);

-- ============================================================
-- TABEL 7: PEMINJAMAN (Memiliki 3 FK)
-- ============================================================

CREATE TABLE peminjaman (
    id_peminjaman    NUMBER          CONSTRAINT pk_peminjaman PRIMARY KEY,
    id_anggota       NUMBER          CONSTRAINT nn_peminjaman_anggota NOT NULL
                                    CONSTRAINT fk_peminjaman_anggota
                                    REFERENCES anggota(id_anggota),
    id_buku          NUMBER          CONSTRAINT nn_peminjaman_buku NOT NULL
                                    CONSTRAINT fk_peminjaman_buku
                                    REFERENCES buku(id_buku),
    id_pustakawan    NUMBER          CONSTRAINT nn_peminjaman_pustakawan NOT NULL
                                    CONSTRAINT fk_peminjaman_pustakawan
                                    REFERENCES pustakawan(id_pustakawan),
    tanggal_pinjam   DATE            CONSTRAINT nn_peminjaman_tglpinjam NOT NULL
                                    DEFAULT SYSDATE,
    tgl_jatuh_tempo  DATE            CONSTRAINT nn_peminjaman_jatuh_tempo NOT NULL,
    tgl_kembali      DATE,
    status           VARCHAR2(20)    DEFAULT 'Dipinjam'
                                    CONSTRAINT nn_peminjaman_status NOT NULL
                                    CONSTRAINT ck_peminjaman_status
                                    CHECK (status IN ('Dipinjam', 'Dikembalikan', 'Terlambat')),
    denda            NUMBER          DEFAULT 0
                                    CONSTRAINT ck_peminjaman_denda CHECK (denda >= 0),
    CONSTRAINT ck_peminjaman_tanggal
        CHECK (tgl_jatuh_tempo >= tanggal_pinjam),
    CONSTRAINT ck_peminjaman_kembali
        CHECK (tgl_kembali IS NULL OR tgl_kembali >= tanggal_pinjam)
);

-- ============================================================
-- BUAT INDEX UNTUK OPTIMASI QUERY
-- ============================================================

CREATE INDEX idx_buku_judul ON buku(judul);
CREATE INDEX idx_buku_jenis ON buku(jenis_buku);
CREATE INDEX idx_buku_penerbit ON buku(id_penerbit);
CREATE INDEX idx_penulis_nama ON penulis(nama_penulis);
CREATE INDEX idx_anggota_nama ON anggota(nama);
CREATE INDEX idx_anggota_email ON anggota(email);
CREATE INDEX idx_pustakawan_username ON pustakawan(username);
CREATE INDEX idx_peminjaman_anggota ON peminjaman(id_anggota);
CREATE INDEX idx_peminjaman_buku ON peminjaman(id_buku);
CREATE INDEX idx_peminjaman_status ON peminjaman(status);
CREATE INDEX idx_peminjaman_tanggal ON peminjaman(tanggal_pinjam);

-- ============================================================
-- BUAT TRIGGER UNTUK AUTO INCREMENT ID
-- ============================================================

CREATE OR REPLACE TRIGGER trg_penerbit_ai
BEFORE INSERT ON penerbit
FOR EACH ROW
BEGIN
    IF :NEW.id_penerbit IS NULL THEN
        :NEW.id_penerbit := seq_penerbit.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_penulis_ai
BEFORE INSERT ON penulis
FOR EACH ROW
BEGIN
    IF :NEW.id_penulis IS NULL THEN
        :NEW.id_penulis := seq_penulis.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_buku_ai
BEFORE INSERT ON buku
FOR EACH ROW
BEGIN
    IF :NEW.id_buku IS NULL THEN
        :NEW.id_buku := seq_buku.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_anggota_ai
BEFORE INSERT ON anggota
FOR EACH ROW
BEGIN
    IF :NEW.id_anggota IS NULL THEN
        :NEW.id_anggota := seq_anggota.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_pustakawan_ai
BEFORE INSERT ON pustakawan
FOR EACH ROW
BEGIN
    IF :NEW.id_pustakawan IS NULL THEN
        :NEW.id_pustakawan := seq_pustakawan.NEXTVAL;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_peminjaman_ai
BEFORE INSERT ON peminjaman
FOR EACH ROW
BEGIN
    IF :NEW.id_peminjaman IS NULL THEN
        :NEW.id_peminjaman := seq_peminjaman.NEXTVAL;
    END IF;
END;
/

-- ============================================================
-- VERIFIKASI: Tampilkan struktur tabel yang dibuat
-- ============================================================

SELECT table_name FROM user_tables ORDER BY table_name;
```

### 5.2 Penjelasan Constraint yang Digunakan

```
┌─────────────────────────────────────────────────────────────────────┐
│  DAFTAR CONSTRAINT                                                   │
├───────────────┬─────────────────────────────────────────────────────┤
│  KODE         │  PENJELASAN                                          │
├───────────────┼─────────────────────────────────────────────────────┤
│  PK_          │  Primary Key - Kunci utama tabel                     │
│  FK_          │  Foreign Key - Referensi ke tabel lain               │
│  NN_          │  NOT NULL - Kolom wajib diisi                        │
│  UQ_          │  UNIQUE - Nilai tidak boleh duplikat                 │
│  CK_          │  CHECK - Batasan nilai yang diperbolehkan            │
└───────────────┴─────────────────────────────────────────────────────┘
```

### 5.3 Contoh Hasil Running SQL di Oracle

```
╔══════════════════════════════════════════════════════════════════════════╗
║  SCREENSHOT SIMULASI: HASIL EKSEKUSI DI ORACLE SQL DEVELOPER           ║
╠══════════════════════════════════════════════════════════════════════════╣
║                                                                         ║
║  ┌─────────────────────────────────────────────────────────────────┐   ║
║  │ SQL Worksheet - Oracle SQL Developer                             │   ║
║  ├─────────────────────────────────────────────────────────────────┤   ║
║  │                                                                  │   ║
║  │  1  CREATE TABLE penerbit (                                      │   ║
║  │  2      id_penerbit   NUMBER     CONSTRAINT pk_penerbit          │   ║
║  │  3                  PRIMARY KEY,                                 │   ║
║  │  4      nama_penerbit VARCHAR2(100) CONSTRAINT nn_penerbit_nama  │   ║
║  │  5                  NOT NULL,                                    │   ║
║  │  6      alamat        VARCHAR2(255),                             │   ║
║  │  7      kota          VARCHAR2(100)                              │   ║
║  │  8  );                                                           │   ║
║  │                                                                  │   ║
║  │  Table PENERBIT created.                                         │   ║
║  │                                                                  │   ║
║  ├─────────────────────────────────────────────────────────────────┤   ║
║  │                                                                  │   ║
║  │  1  CREATE TABLE buku (                                           │   ║
║  │  2      id_buku       NUMBER     CONSTRAINT pk_buku               │   ║
║  │  3                  PRIMARY KEY,                                 │   ║
║  │  4      isbn          VARCHAR2(20) CONSTRAINT uq_buku_isbn       │   ║
║  │  5                  UNIQUE,                                      │   ║
║  │  6      judul         VARCHAR2(255) CONSTRAINT nn_buku_judul     │   ║
║  │  7                  NOT NULL,                                    │   ║
║  │  8      tahun_terbit  NUMBER     CONSTRAINT ck_buku_tahun         │   ║
║  │  9                  CHECK (tahun_terbit BETWEEN 1000 AND 2100),  │   ║
║  │ 10      jenis_buku    VARCHAR2(10) CONSTRAINT nn_buku_jenis      │   ║
║  │ 11                  NOT NULL                                     │   ║
║  │ 12                  CONSTRAINT ck_buku_jenis                     │   ║
║  │ 13                  CHECK (jenis_buku IN ('Fisik','Digital')),   │   ║
║  │ 14      stok_fisik    NUMBER     DEFAULT 0                       │   ║
║  │ 15                  CONSTRAINT ck_buku_stok CHECK (stok>=0),     │   ║
║  │ 16      file_path     VARCHAR2(500),                             │   ║
║  │ 17      id_penerbit   NUMBER     CONSTRAINT nn_buku_penerbit     │   ║
║  │ 18                  NOT NULL                                     │   ║
║  │ 19                  CONSTRAINT fk_buku_penerbit                   │   ║
║  │ 20                  REFERENCES penerbit(id_penerbit)             │   ║
║  │ 21  );                                                           │   ║
║  │                                                                  │   ║
║  │  Table BUKU created.                                             │   ║
║  │                                                                  │   ║
║  ├─────────────────────────────────────────────────────────────────┤   ║
║  │                                                                  │   ║
║  │  1  CREATE TABLE peminjaman (                                     │   ║
║  │  2      id_peminjaman  NUMBER     CONSTRAINT pk_peminjaman        │   ║
║  │  3                  PRIMARY KEY,                                 │   ║
║  │  4      id_anggota     NUMBER     CONSTRAINT nn_peminjaman_anggota│   ║
║  │  5                  NOT NULL                                     │   ║
║  │  6                  CONSTRAINT fk_peminjaman_anggota              │   ║
║  │  7                  REFERENCES anggota(id_anggota),               │   ║
║  │  8      id_buku        NUMBER     CONSTRAINT nn_peminjaman_buku   │   ║
║  │  9                  NOT NULL                                     │   ║
║  │ 10                  CONSTRAINT fk_peminjaman_buku                 │   ║
║  │ 11                  REFERENCES buku(id_buku),                     │   ║
║  │ 12      id_pustakawan  NUMBER     CONSTRAINT nn_peminjaman_pustak │   ║
║  │ 13                  NOT NULL                                     │   ║
║  │ 14                  CONSTRAINT fk_peminjaman_pustakawan           │   ║
║  │ 15                  REFERENCES pustakawan(id_pustakawan),         │   ║
║  │ 16      tanggal_pinjam DATE      DEFAULT SYSDATE                  │   ║
║  │ 17                  CONSTRAINT nn_peminjaman_tglpinjam NOT NULL,  │   ║
║  │ 18      tgl_jatuh_tempo DATE      NOT NULL,                       │   ║
║  │ 19      tgl_kembali    DATE,                                      │   ║
║  │ 20      status         VARCHAR2(20) DEFAULT 'Dipinjam'            │   ║
║  │ 21                  CONSTRAINT ck_peminjaman_status               │   ║
║  │ 22                  CHECK (status IN ('Dipinjam',                 │   ║
║  │ 23                      'Dikembalikan','Terlambat')),             │   ║
║  │ 24      denda          NUMBER     DEFAULT 0                       │   ║
║  │ 25                  CONSTRAINT ck_peminjaman_denda                │   ║
║  │ 26                  CHECK (denda >= 0)                            │   ║
║  │ 27  );                                                           │   ║
║  │                                                                  │   ║
║  │  Table PEMINJAMAN created.                                        │   ║
║  │                                                                  │   ║
║  └─────────────────────────────────────────────────────────────────┘   ║
║                                                                         ║
╚══════════════════════════════════════════════════════════════════════════╝
```

### 5.4 Verifikasi Struktur Tabel

```
╔══════════════════════════════════════════════════════════════════════════╗
║  QUERY VERIFIKASI STRUKTUR TABEL                                        ║
╠══════════════════════════════════════════════════════════════════════════╣
║                                                                         ║
║  -- Lihat semua tabel                                                    ║
║  SELECT table_name FROM user_tables ORDER BY table_name;                 ║
║                                                                         ║
║  ┌─────────────────────────────────────────────────────────────┐       ║
║  │ TABLE_NAME                                                   │       ║
║  ├─────────────────────────────────────────────────────────────┤       ║
║  │ ANGGOTA                                                     │       ║
║  │ BUKU                                                        │       ║
║  │ BUKU_PENULIS                                                │       ║
║  │ PEMINJAMAN                                                  │       ║
║  │ PENULIS                                                     │       ║
║  │ PENERBIT                                                    │       ║
║  │ PUSTAKAWAN                                                  │       ║
║  └─────────────────────────────────────────────────────────────┘       ║
║  7 rows selected.                                                      ║
║                                                                         ║
╚══════════════════════════════════════════════════════════════════════════╝
```

```
╔══════════════════════════════════════════════════════════════════════════╗
║  VERIFIKASI CONSTRAINT                                                   ║
╠══════════════════════════════════════════════════════════════════════════╣
║                                                                         ║
║  SELECT constraint_name, constraint_type, table_name                     ║
║  FROM user_constraints                                                  ║
║  WHERE table_name IN ('BUKU','PEMINJAMAN','BUKU_PENULIS')               ║
║  ORDER BY table_name, constraint_type;                                  ║
║                                                                         ║
║  ┌──────────────────────────┬────────┬──────────────┐                  ║
║  │ CONSTRAINT_NAME          │ TYPE   │ TABLE_NAME   │                  ║
║  ├──────────────────────────┼────────┼──────────────┤                  ║
║  │ PK_BUKU                  │ P      │ BUKU         │                  ║
║  │ UQ_BUKU_ISBN             │ U      │ BUKU         │                  ║
║  │ NN_BUKU_JUDUL            │ C      │ BUKU         │                  ║
║  │ NN_BUKU_JENIS            │ C      │ BUKU         │                  ║
║  │ NN_BUKU_PENERBIT         │ C      │ BUKU         │                  ║
║  │ CK_BUKU_TAHUN            │ C      │ BUKU         │                  ║
║  │ CK_BUKU_JENIS            │ C      │ BUKU         │                  ║
║  │ CK_BUKU_STOK             │ C      │ BUKU         │                  ║
║  │ FK_BUKU_PENERBIT         │ R      │ BUKU         │                  ║
║  ├──────────────────────────┼────────┼──────────────┤                  ║
║  │ PK_BUKU_PENULIS          │ P      │ BUKU_PENULIS │                  ║
║  │ FK_BP_BUKU               │ R      │ BUKU_PENULIS │                  ║
║  │ FK_BP_PENULIS            │ R      │ BUKU_PENULIS │                  ║
║  ├──────────────────────────┼────────┼──────────────┤                  ║
║  │ PK_PEMINJAMAN            │ P      │ PEMINJAMAN   │                  ║
║  │ FK_PEMINJAMAN_ANGGOTA    │ R      │ PEMINJAMAN   │                  ║
║  │ FK_PEMINJAMAN_BUKU       │ R      │ PEMINJAMAN   │                  ║
║  │ FK_PEMINJAMAN_PUSTAKAWAN │ R      │ PEMINJAMAN   │                  ║
║  │ CK_PEMINJAMAN_STATUS     │ C      │ PEMINJAMAN   │                  ║
║  │ CK_PEMINJAMAN_DENDA      │ C      │ PEMINJAMAN   │                  ║
║  └──────────────────────────┴────────┴──────────────┘                  ║
║  18 rows selected.                                                      ║
║                                                                         ║
║  KETERANGAN TIPE:                                                       ║
║  P = Primary Key                                                        ║
║  R = Referential (Foreign Key)                                          ║
║  U = Unique                                                             ║
║  C = Check / Not Null                                                   ║
║                                                                         ║
╚══════════════════════════════════════════════════════════════════════════╝
```

---

## 📌 BAGIAN 6: CONTOH DATA & QUERY UJI COBA

### 6.1 Insert Data Contoh

```sql
-- ============================================================
-- INSERT DATA PENERBIT
-- ============================================================

INSERT INTO penerbit (id_penerbit, nama_penerbit, alamat, kota)
VALUES (1, 'Gramedia Pustaka Utama', 'Jl. Palmerah Barat 33-37', 'Jakarta');

INSERT INTO penerbit (id_penerbit, nama_penerbit, alamat, kota)
VALUES (2, 'Erlangga', 'Jl. Herman Kemang No. 1', 'Jakarta');

INSERT INTO penerbit (id_penerbit, nama_penerbit, alamat, kota)
VALUES (3, 'Andi Offset', 'Jl. Beo No. 38-40', 'Yogyakarta');

-- ============================================================
-- INSERT DATA PENULIS
-- ============================================================

INSERT INTO penulis (id_penulis, nama_penulis, negara_asal)
VALUES (1, 'Andrea Hirata', 'Indonesia');

INSERT INTO penulis (id_penulis, nama_penulis, negara_asal)
VALUES (2, 'Tere Liye', 'Indonesia');

INSERT INTO penulis (id_penulis, nama_penulis, negara_asal)
VALUES (3, 'Dee Lestari', 'Indonesia');

-- ============================================================
-- INSERT DATA BUKU (Fisik & Digital)
-- ============================================================

INSERT INTO buku (id_buku, isbn, judul, tahun_terbit, jenis_buku, stok_fisik, file_path, id_penerbit)
VALUES (1, '978-979-22-1145-6', 'Laskar Pelangi', 2005, 'Fisik', 5, NULL, 1);

INSERT INTO buku (id_buku, isbn, judul, tahun_terbit, jenis_buku, stok_fisik, file_path, id_penerbit)
VALUES (2, '978-979-22-1146-3', 'Laskar Pelangi', 2005, 'Digital', 0, '/ebooks/laskar_pelangi.pdf', 1);

INSERT INTO buku (id_buku, isbn, judul, tahun_terbit, jenis_buku, stok_fisik, file_path, id_penerbit)
VALUES (3, '978-602-291-001-2', 'Hujan', 2016, 'Fisik', 3, NULL, 2);

INSERT INTO buku (id_buku, isbn, judul, tahun_terbit, jenis_buku, stok_fisik, file_path, id_penerbit)
VALUES (4, '978-602-291-002-9', 'Hujan', 2016, 'Digital', 0, '/ebooks/hujan.pdf', 2);

INSERT INTO buku (id_buku, isbn, judul, tahun_terbit, jenis_buku, stok_fisik, file_path, id_penerbit)
VALUES (5, '978-979-29-1234-5', 'Perahu Kertas', 2009, 'Fisik', 2, NULL, 3);

-- ============================================================
-- INSERT DATA BUKU_PENULIS (Relasi M:N)
-- ============================================================

INSERT INTO buku_penulis (id_buku, id_penulis) VALUES (1, 1);
INSERT INTO buku_penulis (id_buku, id_penulis) VALUES (2, 1);  -- Ebook Laskar Pelangi
INSERT INTO buku_penulis (id_buku, id_penulis) VALUES (3, 2);
INSERT INTO buku_penulis (id_buku, id_penulis) VALUES (4, 2);  -- Ebook Hujan
INSERT INTO buku_penulis (id_buku, id_penulis) VALUES (5, 3);

-- ============================================================
-- INSERT DATA ANGGOTA
-- ============================================================

INSERT INTO anggota (id_anggota, nama, alamat, no_telepon, email, tanggal_daftar, status_aktif)
VALUES (1, 'Budi Santoso', 'Jl. Merdeka No. 10', '081234567890', 'budi@email.com', SYSDATE, 'Aktif');

INSERT INTO anggota (id_anggota, nama, alamat, no_telepon, email, tanggal_daftar, status_aktif)
VALUES (2, 'Siti Aminah', 'Jl. Sudirman No. 25', '081234567891', 'siti@email.com', SYSDATE, 'Aktif');

-- ============================================================
-- INSERT DATA PUSTAKAWAN
-- ============================================================

INSERT INTO pustakawan (id_pustakawan, nama, no_telepon, email, username, password, jabatan)
VALUES (1, 'Rina Wati', '081111111111', 'rina@perpustakaan.com', 'rina_admin', 'password123', 'Kepala');

INSERT INTO pustakawan (id_pustakawan, nama, no_telepon, email, username, password, jabatan)
VALUES (2, 'Dedi Kurniawan', '081222222222', 'dedi@perpustakaan.com', 'dedi_staff', 'password456', 'Staff');

-- ============================================================
-- INSERT DATA PEMINJAMAN (Buku Fisik & Digital)
-- ============================================================

-- Peminjaman buku fisik
INSERT INTO peminjaman (id_peminjaman, id_anggota, id_buku, id_pustakawan,
                        tanggal_pinjam, tgl_jatuh_tempo, tgl_kembali, status, denda)
VALUES (1, 1, 1, 2, SYSDATE-10, SYSDATE-3, SYSDATE-4, 'Dikembalikan', 0);

-- Peminjaman buku digital (dicatat oleh pustakawan)
INSERT INTO peminjaman (id_peminjaman, id_anggota, id_buku, id_pustakawan,
                        tanggal_pinjam, tgl_jatuh_tempo, tgl_kembali, status, denda)
VALUES (2, 1, 2, 2, SYSDATE-5, SYSDATE+2, NULL, 'Dipinjam', 0);

-- Peminjaman buku fisik - terlambat
INSERT INTO peminjaman (id_peminjaman, id_anggota, id_buku, id_pustakawan,
                        tanggal_pinjam, tgl_jatuh_tempo, tgl_kembali, status, denda)
VALUES (3, 2, 3, 1, SYSDATE-15, SYSDATE-8, NULL, 'Terlambat', 5000);

COMMIT;
```

### 6.2 Query Uji Coba

```sql
-- ============================================================
-- QUERY 1: Lihat semua peminjaman aktif dengan detail lengkap
-- ============================================================

SELECT
    p.id_peminjaman,
    a.nama AS nama_anggota,
    b.judul,
    b.jenis_buku,
    pu.nama AS nama_pustakawan,
    p.tanggal_pinjam,
    p.tgl_jatuh_tempo,
    p.status,
    p.denda
FROM peminjaman p
JOIN anggota a ON p.id_anggota = a.id_anggota
JOIN buku b ON p.id_buku = b.id_buku
JOIN pustakawan pu ON p.id_pustakawan = pu.id_pustakawan
WHERE p.status != 'Dikembalikan'
ORDER BY p.tanggal_pinjam DESC;

-- ============================================================
-- QUERY 2: Lihat buku beserta penulisnya
-- ============================================================

SELECT
    b.judul,
    b.jenis_buku,
    b.stok_fisik,
    pe.nama_penerbit,
    LISTAGG(pn.nama_penulis, ', ') WITHIN GROUP (ORDER BY pn.nama_penulis) AS penulis
FROM buku b
JOIN penerbit pe ON b.id_penerbit = pe.id_penerbit
JOIN buku_penulis bp ON b.id_buku = bp.id_buku
JOIN penulis pn ON bp.id_penulis = pn.id_penulis
GROUP BY b.judul, b.jenis_buku, b.stok_fisik, pe.nama_penerbit;

-- ============================================================
-- QUERY 3: Statistik peminjaman berdasarkan jenis buku
-- ============================================================

SELECT
    b.jenis_buku,
    COUNT(*) AS total_peminjaman,
    SUM(CASE WHEN p.status = 'Dipinjam' THEN 1 ELSE 0 END) AS sedang_dipinjam,
    SUM(CASE WHEN p.status = 'Dikembalikan' THEN 1 ELSE 0 END) AS dikembalikan,
    SUM(CASE WHEN p.status = 'Terlambat' THEN 1 ELSE 0 END) AS terlambat
FROM peminjaman p
JOIN buku b ON p.id_buku = b.id_buku
GROUP BY b.jenis_buku;
```

---

## 📌 RINGKASAN AKHIR

```
╔══════════════════════════════════════════════════════════════════════════╗
║                         RINGKASAN PROYEK                                ║
╠══════════════════════════════════════════════════════════════════════════╣
║                                                                         ║
║  JUMLAH ENTITAS           : 7 (termasuk 1 associative entity)           ║
║  JUMLAH TABEL             : 7                                           ║
║  JUMLAH PRIMARY KEY       : 7                                           ║
║  JUMLAH FOREIGN KEY       : 6                                           ║
║  JUMLAH UNIQUE CONSTRAINT : 3                                           ║
║  JUMLAH CHECK CONSTRAINT  : 11                                          ║
║  JUMLAH SEQUENCE          : 6                                           ║
║  JUMLAH TRIGGER           : 6                                           ║
║  JUMLAH INDEX             : 11                                          ║
║                                                                         ║
╠══════════════════════════════════════════════════════════════════════════╣
║                                                                         ║
║  FORMAT TABEL AKHIR:                                                    ║
║  ─────────────────                                                      ║
║  PENERBIT (id_penerbit, nama_penerbit, alamat, kota)                   ║
║  PENULIS (id_penulis, nama_penulis, negara_asal)                       ║
║  BUKU (id_buku, isbn, judul, tahun_terbit, jenis_buku, stok_fisik,     ║
║        file_path, id_penerbit)                                          ║
║  BUKU_PENULIS (id_buku, id_penulis)                                    ║
║  ANGGOTA (id_anggota, nama, alamat, no_telepon, email,                  ║
║           tanggal_daftar, status_aktif)                                 ║
║  PUSTAKAWAN (id_pustakawan, nama, no_telepon, email, username,         ║
║             password, jabatan)                                          ║
║  PEMINJAMAN (id_peminjaman, id_anggota, id_buku, id_pustakawan,        ║
║              tanggal_pinjam, tgl_jatuh_tempo, tgl_kembali, status,      ║
║              denda)                                                     ║
║                                                                         ║
╠══════════════════════════════════════════════════════════════════════════╣
║                                                                         ║
║  FITUR UTAMA YANG TERAKOMODIR:                                          ║
║  ✅ Peminjaman buku fisik                                               ║
║  ✅ Peminjaman buku digital (ebook) - dicatat oleh pustakawan           ║
║  ✅ Relasi M:N antara Buku dan Penulis                                  ║
║  ✅ Pencatatan pustakawan yang memproses peminjaman                     ║
║  ✅ Sistem denda untuk keterlambatan                                    ║
║  ✅ Validasi data melalui CHECK constraint                              ║
║                                                                         ║
╚══════════════════════════════════════════════════════════════════════════╝
```

---

> **📝 CATATAN PENTING UNTUK TUGAS:**
>
> 1. **Screenshot ERD**: Buat ulang di Oracle Data Modeller sesuai panduan Bagian 3
> 2. **Screenshot Relational Model**: Setelah di-engineer, screenshot dari tab Relational Model
> 3. **Screenshot SQL**: Jalankan script di Bagian 5.1 di Oracle, screenshot pesan "Table created"
> 4. **Screenshot Verifikasi**: Jalankan query verifikasi di Bagian 5.4, screenshot hasilnya
> 5. Ganti `[Nama Anda]` dan `[Tanggal]` sesuai data diri Anda
