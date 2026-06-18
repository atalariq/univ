### 1. Analisis Entitas & Logical Model di Oracle Data Modeler

**Langkah Analisis (Obvious & Non-Obvious):**

* **Identifikasi Entitas Dasar (Obvious):** Dari deskripsi, kamu pasti membutuhkan entitas `Anggota`, `Buku`, `Penulis`, `Penerbit`, `Pustakawan`, dan `Transaksi_Peminjaman`.
* **Strategi Tipe Buku (Non-Obvious):** Karena ada buku fisik dan digital, jangan buat dua entitas terpisah yang hampir identik. Gunakan satu entitas `Buku` dan tambahkan atribut `jenis_buku` (Fisik/Digital). Alternatif yang lebih maju di Oracle Data Modeler adalah menggunakan *Supertype/Subtype* jika atribut buku fisik (seperti lokasi rak) dan digital (seperti ukuran file, link unduh) sangat berbeda.
* **Relasi:** Tentukan kardinalitasnya. Satu penerbit bisa mencetak banyak buku (1:N). Satu transaksi peminjaman bisa mencakup beberapa buku (N:M). Jika ada relasi N:M, Oracle akan memecahnya otomatis nanti, tetapi di Logical Model biarkan saja bentuk N:M.

**Langkah di Oracle Data Modeler:**
1.  Buka Oracle SQL Developer Data Modeler.
2.  Klik kanan pada **Logical Model** di *browser tree* sebelah kiri, pilih **Show**.
3.  Gunakan ikon **New Entity** di *toolbar* atas, klik pada kanvas untuk membuat entitas baru.
4.  Isi nama entitas, lalu masuk ke menu **Attributes**. Tambahkan atribut lengkap dengan tipe datanya (Logical Type). Jangan lupa centang kotak **Primary UID** untuk atribut yang menjadi Primary Key (misal: ID_Anggota).
5.  Gunakan ikon **New Relation** (1:N atau N:M) untuk menghubungkan antar entitas. Klik entitas sumber, lalu klik entitas target.

### 2. Konversi ke Relational Model

Setelah Logical Model selesai, kamu perlu mengonversinya (engineering) menjadi Relational Model agar mendapatkan bentuk tabel fisik (Primary Key dan Foreign Key akan terbentuk otomatis).

**Langkah di Oracle Data Modeler:**

1.  Klik ikon **Engineer to Relational Model** (biasanya bergambar panah ganda atau dua kotak terhubung di *toolbar* atas).
2.  Akan muncul jendela *Engineering*. Pastikan semua entitas tercentang, lalu klik **Engineer**.
3.  Sistem akan mengarahkanmu ke kanvas Relational Model. Di sini, relasi N:M yang kamu buat di langkah pertama akan otomatis pecah menjadi tabel baru (tabel jembatan/detail transaksi).
4.  Ambil tangkapan layar (screenshot) dari kanvas ini untuk laporanmu.

**Format Penulisan Hasil Akhir Tabel:**
Tuliskan hasil yang kamu lihat di Relational Model mengikuti format ini. Ini contoh untuk membantumu memulai:
* Anggota (id_anggota, nama, email, no_telp, tanggal_daftar)
* Penerbit (id_penerbit, nama_penerbit, kota)
* Buku (id_buku, judul, tahun_terbit, jenis_buku, id_penerbit, id_penulis) *-> Perhatikan id_penerbit dan id_penulis masuk sebagai Foreign Key.*
* ...lanjutkan untuk entitas lainnya sesuai model yang terbentuk.

### 3. Perintah SQL (DDL)

Pilih 3 tabel untuk dituliskan SQL-nya. Saran terbaik adalah memulai dari tabel *Master* yang tidak memiliki Foreign Key (seperti Penulis atau Penerbit), lalu baru buat tabel yang memiliki Foreign Key (seperti Buku).

**Struktur Dasar DDL untuk Cheatsheet:**

```sql
-- 1. Contoh pembuatan tabel Master
CREATE TABLE NamaTabel_1 (
    id_kolom VARCHAR2(10) NOT NULL,
    kolom_lain VARCHAR2(50),
    CONSTRAINT pk_namatabel1 PRIMARY KEY (id_kolom)
);

-- 2. Contoh pembuatan tabel Master kedua
CREATE TABLE NamaTabel_2 (
    id_kolom2 VARCHAR2(10) NOT NULL,
    kolom_lain DATE,
    CONSTRAINT pk_namatabel2 PRIMARY KEY (id_kolom2)
);

-- 3. Contoh pembuatan tabel Transaksi/Child (Mengandung FK)
CREATE TABLE NamaTabel_3 (
    id_kolom3 VARCHAR2(10) NOT NULL,
    fk_kolom1 VARCHAR2(10),
    fk_kolom2 VARCHAR2(10),
    CONSTRAINT pk_namatabel3 PRIMARY KEY (id_kolom3),
    CONSTRAINT fk_namatabel3_ref1 FOREIGN KEY (fk_kolom1) REFERENCES NamaTabel_1(id_kolom),
    CONSTRAINT fk_namatabel3_ref2 FOREIGN KEY (fk_kolom2) REFERENCES NamaTabel_2(id_kolom2)
);
```

**Langkah Running SQL:**
1.  Buka Oracle SQL Developer atau Live SQL.
2.  Ketik perintah `CREATE TABLE` milikmu.
3.  Blok perintah tersebut dan tekan tombol **Run** (segitiga hijau) atau `Ctrl+Enter`.
4.  Pastikan muncul pesan `Table created` di bagian *Script Output*. Ambil tangkapan layarnya.
