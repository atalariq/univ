# Pertemuan 3: CRUD PHP

Pertemuan ini memakai modul yang sama dengan pertemuan 2, tetapi fokusnya bagian kilas balik CRUD PHP native. Studi kasusnya tabel `buku` pada basis data `toko_buku` dengan kolom id, judul, penulis, harga, dan tgl_terbit (hlm. 11). Urutan latihannya mengikuti empat operasi: menyiapkan basis data lewat phpMyAdmin, membuat `koneksi.php` dengan `mysqli_connect()`, lalu menulis create, read, update, dan delete (hlm. 11-15).

Pola yang ditekankan adalah pemisahan berkas. Create dipecah menjadi `tambah.php` untuk form dan `proses_tambah.php` untuk `INSERT`, update menjadi `edit.php` untuk menampilkan data lama dan `proses_edit.php` untuk `UPDATE` (hlm. 12-14). Read memakai `SELECT` lalu `mysqli_fetch_assoc()` di dalam `while`, sedangkan delete cukup menangkap id dari tautan dan menjalankan `DELETE` (hlm. 13-15). Modul menutup bagian ini dengan pengakuan bahwa CRUD native menuntut banyak baris kode berulang untuk setiap tabel, dan itulah alasan beralih ke framework (hlm. 15-16).

Form edit juga membawa id lewat input tersembunyi agar baris yang diubah tetap dikenali saat data dikirim (hlm. 14). Pola dua berkas ini kemudian menjadi pembanding ketika operasi yang sama ditulis ulang memakai controller dan model Laravel.

Modul menutup dengan tugas pengayaan yang menanyakan parameter `mysqli_connect()`, alasan pemisahan form dan pemroses, fungsi `mysqli_fetch_assoc()` di dalam `while`, risiko `DELETE` tanpa `WHERE`, serta kerentanan SQL injection dan penanganannya dengan prepared statement (hlm. 21-22). Pertanyaan-pertanyaan itu menandai batas pendekatan native: kode mudah dipahami, tetapi penyaringan input dan pengulangan per tabel menjadi beban.

Laporan praktikum lengkap ada di `main.typ`. Laporan itu memuat tangkapan layar tiap halaman dan jawaban tugas pengayaan, termasuk pembahasan SQL injection dan prepared statement. Catatan ini tidak mengulang isi laporan.

## Poin kunci

- Studi kasus CRUD: tabel `buku` pada basis data `toko_buku` (hlm. 11).
- Koneksi database dipusatkan di `koneksi.php` lalu di-include (hlm. 12).
- Create dan update masing-masing dipecah dua berkas: form dan pemroses (hlm. 11-14).
- Read memakai `while` dan `mysqli_fetch_assoc()` untuk menampilkan baris (hlm. 13).
- Delete memakai id dari query string dan query `DELETE` (hlm. 15).
- Kode native berulang per tabel menjadi alasan memakai framework (hlm. 15-16).

## Istilah

- PHP native: PHP tanpa framework.
- `mysqli_connect()`: fungsi membuka koneksi ke MySQL.
- `mysqli_fetch_assoc()`: mengambil satu baris hasil query sebagai array asosiatif.
- Query string: bagian URL setelah `?` yang membawa parameter seperti `id`.
- SQL injection: penyisipan perintah SQL lewat input yang tidak disaring.

## Sumber

- `module.local.pdf`, hlm. 11-16 dan 20-22.
- `main.typ`, laporan praktikum pertemuan 3.
