# Pertemuan 2: Instalasi Laravel

Modul pertemuan ini adalah Bab I panduan praktikum, berisi kilas balik CRUD PHP dan pengenalan Laravel. Tujuannya agar mahasiswa mengingat kembali CRUD PHP native sebagai dasar sebelum memakai framework, mengenali Laravel, dan mampu memasangnya (hlm. 1). Laravel digambarkan sebagai framework PHP yang mempercepat pengembangan karena otentikasi otomatis, library yang ikut terunduh, dukungan testing, dan migrasi basis data untuk kerja tim (hlm. 1).

Langkah praktikum berjalan dari pemasangan XAMPP sebagai server lokal berisi Apache, MySQL/MariaDB, dan PHP (hlm. 1-4), latihan dasar PHP (hlm. 5-11), pemasangan Composer (hlm. 16-17), sampai pembuatan proyek Laravel. Dua jalur instalasi dibedakan: versi lama lewat `composer create-project laravel/laravel:"^versi"` dan versi terbaru lewat `composer create-project laravel/laravel`, keduanya diverifikasi dengan `php artisan serve` di alamat 127.0.0.1:8000 (hlm. 18-19). Tugasnya meminta CRUD PHP native untuk tabel lain dan instalasi Laravel di komputer sendiri (hlm. 20-21).

Pemasangan Composer ditutup dengan pemeriksaan `composer -v` pada terminal (hlm. 17). Modul menyebut dua jalur dokumentasi Laravel, versi lama dan versi baru, sehingga mahasiswa dapat memilih versi yang sesuai dengan contoh di kelas (hlm. 18).

Latihan PHP sebelum masuk framework mencakup keluaran teks, campuran PHP dan HTML, komentar, variabel, operasi aritmatika, manipulasi string, dan fungsi dengan argumen maupun nilai default (hlm. 5-11). Bagian penutup modul menyediakan tugas pengayaan berupa tanya jawab tentang CRUD, koneksi database, dan keamanan input, yang kuncinya disimpan pada dokumen terpisah (hlm. 21-22).

Laporan praktikum lengkap untuk pertemuan ini sudah ditulis di `main.typ`. Laporan itu memuat tujuan, langkah pemasangan XAMPP, Composer, dan Laravel beserta tangkapan layar versi PHP, serta jawaban tugas pengayaan. Catatan ini sengaja tidak mengulang isinya.

## Poin kunci

- Lingkup modul: CRUD PHP native sebagai pijakan, lalu pengenalan dan instalasi Laravel (hlm. 1).
- Laravel dipasang lewat Composer, bukan unduhan manual (hlm. 16-18).
- `php artisan serve` dan alamat 127.0.0.1:8000 dipakai memastikan instalasi berhasil (hlm. 18-19).
- Dua varian perintah instalasi: versi terkunci dan versi terbaru (hlm. 18-19).
- Tugas: CRUD PHP native untuk tabel lain dan instalasi Laravel (hlm. 20-21).

## Istilah

- XAMPP: paket server lokal berisi Apache, MySQL/MariaDB, PHP, dan Perl.
- Composer: package manager PHP yang dipakai memasang Laravel.
- Artisan: antarmuka baris perintah Laravel.
- CRUD: create, read, update, delete.

## Sumber

- `module.local.pdf`, hlm. 1-22.
- `main.typ`, laporan praktikum pertemuan 2.
