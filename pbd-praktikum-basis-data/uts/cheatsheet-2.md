### 1. Analisis Entitas & Logical Model

Secara standar, sistem ini membutuhkan entitas utama seperti Anggota, Buku, Pustakawan, dan Peminjaman. Namun untuk mengakomodasi buku fisik dan digital tanpa membuat entitas ganda yang redundan, kita menggunakan pendekatan satu entitas `Buku` dengan atribut spesifik.

**Daftar Entitas dan Atribut Utama:**
* **Anggota:** Menyimpan data peminjam. Atribut: `id_anggota` (PK), `nama`, `email`, `tanggal_daftar`.
* **Pustakawan (Admin):** Menyimpan data staf. Atribut: `id_pustakawan` (PK), `nama`, `username`, `password_hash`.
* **Penerbit:** Atribut: `id_penerbit` (PK), `nama_penerbit`, `kota`.
* **Penulis:** Atribut: `id_penulis` (PK), `nama_penulis`.
* **Buku:** Menggabungkan fisik dan digital. Atribut: `id_buku` (PK), `judul`, `tahun_terbit`, `format` (Fisik/Digital), `lokasi_rak` (NULL jika digital), `url_akses` (NULL jika fisik), `stok` (bernilai 9999 atau NULL untuk digital).
* **Peminjaman:** Mencatat *header* transaksi. Atribut: `id_peminjaman` (PK), `tanggal_pinjam`, `batas_kembali`.
* **Detail_Peminjaman:** Entitas jembatan (resolusi N:M antara Peminjaman dan Buku) karena satu transaksi bisa meminjam banyak buku. Atribut: `tanggal_dikembalikan`, `denda`.
* **Penulis_Buku:** Entitas jembatan (resolusi N:M antara Penulis dan Buku) karena satu buku bisa ditulis banyak orang dan satu orang bisa menulis banyak buku.

### 2. Relational Model (Desain Basis Data)

Berikut adalah konversi *Logical Model* menjadi tabel relasional dengan penempatan *Primary Key* (PK) dan *Foreign Key* (FK) yang tepat:

* **Penerbit** (id_penerbit, nama_penerbit, kota)
* **Penulis** (id_penulis, nama_penulis)
* **Anggota** (id_anggota, nama, email, tanggal_daftar)
* **Pustakawan** (id_pustakawan, nama, username, password_hash)
* **Buku** (id_buku, judul, tahun_terbit, format, lokasi_rak, url_akses, stok, id_penerbit)
* **Penulis_Buku** (id_buku, id_penulis)
* **Peminjaman** (id_peminjaman, tanggal_pinjam, batas_kembali, status, id_anggota, id_pustakawan)
* **Detail_Peminjaman** (id_peminjaman, id_buku, tanggal_dikembalikan, denda)



















### 3. Perintah SQL (DDL Oracle)

Berikut adalah perintah DDL untuk membuat 3 tabel yang saling berelasi, mulai dari tabel *master* hingga tabel transaksi.

```sql
-- 1. Membuat Tabel Penerbit (Tabel Master)
CREATE TABLE Penerbit (
    id_penerbit VARCHAR2(10) NOT NULL,
    nama_penerbit VARCHAR2(100) NOT NULL,
    kota VARCHAR2(50),
    CONSTRAINT pk_penerbit PRIMARY KEY (id_penerbit)
);

-- 2. Membuat Tabel Buku (Tabel Master yang memiliki FK ke Penerbit)
CREATE TABLE Buku (
    id_buku VARCHAR2(10) NOT NULL,
    judul VARCHAR2(200) NOT NULL,
    tahun_terbit NUMBER(4),
    format VARCHAR2(10) CHECK (format IN ('Fisik', 'Digital')),
    lokasi_rak VARCHAR2(20),
    url_akses VARCHAR2(255),
    stok NUMBER(4) DEFAULT 1,
    id_penerbit VARCHAR2(10),
    CONSTRAINT pk_buku PRIMARY KEY (id_buku),
    CONSTRAINT fk_buku_penerbit FOREIGN KEY (id_penerbit) REFERENCES Penerbit(id_penerbit)
);

-- 3. Membuat Tabel Detail_Peminjaman (Tabel Transaksi dengan Composite PK dan FK)
-- Asumsi tabel Peminjaman sudah dibuat sebelumnya
CREATE TABLE Detail_Peminjaman (
    id_peminjaman VARCHAR2(15) NOT NULL,
    id_buku VARCHAR2(10) NOT NULL,
    tanggal_dikembalikan DATE,
    denda NUMBER(10,2) DEFAULT 0,
    CONSTRAINT pk_detail_pinjam PRIMARY KEY (id_peminjaman, id_buku),
    CONSTRAINT fk_detail_peminjaman FOREIGN KEY (id_peminjaman) REFERENCES Peminjaman(id_peminjaman),
    CONSTRAINT fk_detail_buku FOREIGN KEY (id_buku) REFERENCES Buku(id_buku)
);
```

