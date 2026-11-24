# Tugas — Pertemuan 8: Seeder dan Pagination

Sumber otoritatif: `module.local.pdf` (slide "Seeder dan Pagination", Tujuan Pembelajaran + Latihan).

## Sasaran pembelajaran (dari modul)

1. Membuat Seeder untuk mengisi data contoh.
2. Menjalankan seeder tertentu atau semua seeder (`db:seed`, `--class`, `migrate:fresh --seed`).
3. Mengubah `get()` menjadi `paginate()`.
4. Menampilkan informasi halaman dan tautan halaman (`currentPage()`, `total()`, `perPage()`, `links()`).
5. Mengatur tampilan pagination (publish view bawaan, rebuild aset).

## Latihan (wajib)

1. Tambahkan seeder kedua untuk 25 data dengan judul acak (Faker), berbeda dari seeder contoh yang sudah ada.
2. Tampilkan nomor urut yang berlanjut antar halaman (halaman 2 mulai dari nomor 11).
3. Tambahkan pencarian judul yang tetap bekerja saat pindah halaman.
4. Ubah jumlah data per halaman lewat pilihan 5, 10, atau 25.

## Indikator berhasil (dari modul)

- `migrate:fresh --seed` berjalan tanpa error.
- Nomor urut tidak kembali ke 1 di halaman berikutnya.
- Pencarian tetap aktif di halaman 2.
- Jumlah per halaman berubah sesuai pilihan.

## Catatan

Slide memakai contoh `Post`; implementasi praktikum memakai `Project` (kelanjutan p4–p7).
