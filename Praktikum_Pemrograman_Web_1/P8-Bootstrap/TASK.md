# PPW1: Pertemuan 8 - Bootstrap

## Tugas 1 — Eksplorasi Grid System

Buat halaman HTML dengan nama tugas1.html yang memenuhi ketentuan berikut:

- Buat sebuah halaman dengan Navbar yang memiliki brand dan minimal 3 menu navigasi
- Di bawah navbar, buat layout dengan Grid System mengikuti ketentuan:
  - Di layar desktop (lg): 3 kolom sama rata
  - Di layar tablet (md): 2 kolom
  - Di layar HP (sm ke bawah): 1 kolom penuh
- Setiap kolom berisi sebuah Card dengan gambar, judul, deskripsi, dan tombol
- Tambahkan Footer dengan teks hak cipta menggunakan utility class untuk posisi teks

## Tugas 2 — Formulir Pendaftaran

Buat halaman formulir pendaftaran mahasiswa baru dengan nama tugas2.html:

- Form memiliki field: Nama Lengkap, NIM, Email, Program Studi (select), Semester (select), Alamat (textarea), dan foto profil (file input)
- Gunakan layout 2 kolom untuk bagian data diri (nama & NIM berdampingan)
- Tambahkan validasi visual Bootstrap (class is-valid / is-invalid) pada minimal 2 field
- Sertakan tombol Simpan dan Reset, keduanya dalam satu baris menggunakan d-flex dan gap
- Tampilkan Alert sukses (dismissible) yang secara default tersembunyi

## Tugas 3 — Dashboard Nilai

Buat halaman dashboard nilai mahasiswa dengan nama dashboard.html:

- Header dengan profile card (foto + nama + badge status)
- Kartu ringkasan statistik: Total SKS, IPK, Mata Kuliah Lulus — masing-masing dalam Card dengan icon (bisa pakai emoji)
- Tabel responsif berisi daftar nilai dengan kolom: No, Mata Kuliah, SKS, Nilai Huruf, Nilai Angka
- Nilai A / A+ ditampilkan dengan badge hijau, B dengan badge biru, C dengan badge kuning, D/E dengan badge merah
- Tombol Detail di setiap baris yang membuka Modal berisi informasi detail mata kuliah
- Seluruh halaman menggunakan Bootstrap 5 via CDN tanpa library tambahan
