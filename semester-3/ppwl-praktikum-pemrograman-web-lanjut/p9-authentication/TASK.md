# Tugas — Pertemuan 9: Authentication

Sumber otoritatif: `module.local.pdf` (slide "Authentication", Agenda + Tugas).

## Cakupan modul

1. Authentication: memisahkan halaman publik vs halaman yang butuh login.
2. Custom registration & login routes (`LoginRegisterController`).
3. Controller login dengan 6 method: `register()`, `store()`, `login()`, `authenticate()`, `dashboard()`, `logout()`.
4. Middleware `auth`/`guest` pada constructor controller.
5. Halaman home baru setelah login (modul: `RouteServiceProvider::HOME = '/dashboard'`; Laravel 13: pengaturan redirect di `bootstrap/app.php`).
6. View `register`, `login`, `dashboard` (+ layout).
7. Menjalankan aplikasi: `php artisan serve` → `/register`, `/login`.

## Tugas (wajib, dari modul)

1. Buatlah website portofolio yang menampilkan informasi CV Anda (kelanjutan aplikasi p4–p8).
2. Buat menu dan controller yang tidak dapat diakses oleh pengguna umum yang belum login.
3. Pengumpulan mengikuti pola penamaan submisi praktikum (salinan di `artifacts/`: `PPWL-B2-P9-557554-AtalariqBarraHadinugraha.pdf`).

## Catatan adaptasi

- Modul mencontohkan Laravel 10 (`RouteServiceProvider`); aplikasi praktikum memakai
  Laravel 13 — pendekatan modern yang setara didokumentasikan di laporan.
- Slide memakai contoh entitas `Post`; praktikum memakai `Project` di website portofolio.
