# Konteks Pembuatan Laporan Praktikum (Laprak)

File ini berisi panduan, Map of Content (MOC), dan instruksi untuk agen penulis laprak Typst dalam menyusun laporan praktikum.

## Instruksi untuk Agen Penulis (Typst Lab Report Skill)
Gunakan mode **DRAFT** sesuai dengan aturan di `~/Repos/typst-packages/skills/typst-lab-report/SKILL.md`.
Pastikan untuk membaca `references/course-specific/ppw1.md` terlebih dahulu untuk *course config*.

- **Mata Kuliah:** PPW1 (Pemrograman Web 1)
- **Materi:** Pertemuan 12 (CRUD PHP, PDO, dan Konversi Nilai)
- **Lokasi Source Code:** `src/`

## Map of Content (Fokus Implementasi & Hasil Pembahasan)
Gunakan poin-poin berikut sebagai bahan utama saat menulis bagian "Hasil dan Pembahasan":

1. **`index.php` (Read & Dashboard)**
   - Menampilkan tabel daftar mahasiswa.
   - Menggunakan query `LEFT JOIN` dengan tabel `prodi` untuk mencegah data mahasiswa hilang dari tampilan jika *record* prodi-nya tidak ada/terhapus.
   - Menjalankan kueri agregasi SQL (`COUNT` dan `AVG`) untuk mendapatkan nilai Total Mahasiswa dan Rata-rata IPK secara dinamis.
   - Merender UI *badge* Bootstrap yang warnanya dikondisikan (hijau, kuning, merah) sesuai besaran IPK.

2. **`create.php` (Create & Business Logic)**
   - Menerapkan validasi *backend* berlapis: pengecekan eksistensi form, pencegahan bypass tipe data, hingga validasi rentang angka (IPK 0.00-4.00, Semester 1-14).
   - Terdapat logika bisnis untuk menentukan "Predikat Kelulusan" (Cumlaude, Sangat Memuaskan, Memuaskan, dll) secara otomatis berdasarkan nilai IPK yang diinput.
   - Penanganan *Race Condition* (*Time-of-Check to Time-of-Use*): Mencegah duplikasi entri NIM secara absolut dengan menangkap error `PDOException 23000` (Integrity Constraint Violation) saat query eksekusi `INSERT`, bukan hanya sekadar pengecekan `SELECT` di awal.

3. **`edit.php` (Update)**
   - Menarik data lama dari database dan melakukan repopulasi form.
   - Validasi NIM ganda (uniqueness) yang dirancang sedemikian rupa untuk **mengecualikan** *ID mahasiswa yang sedang diedit* (klausa `WHERE nim = ? AND id != ?`), agar user tetap bisa menyimpan data meski NIM tidak diubah.

4. **`delete.php` (Delete)**
   - Pengamanan metode: hanya merespons *request* HTTP `POST` dan mewajibkan keberadaan `csrf_token` valid.
   - Menerapkan prinsip *idempotent* dan keakuratan *feedback* ke *user* dengan memeriksa hasil `$stmt->rowCount() > 0`. Pesan sukses hanya muncul jika row di DB benar-benar ada yang terhapus; jika tidak, berikan pesan *warning*.

5. **`grade.php` (Konversi Nilai)**
   - Skrip *standalone* yang bertugas mengonversi masukan nilai metrik (0-100) menjadi huruf mutu (*Grade* A-E) dan Keterangan (Sangat Baik - Tidak Lulus).
   - Manipulasi UI dinamis (*reactive UI state*) di mana warna *Card* dari hasil konversi akan berubah-ubah merespons besaran angka masukan (misal hijau untuk A, merah untuk E).
