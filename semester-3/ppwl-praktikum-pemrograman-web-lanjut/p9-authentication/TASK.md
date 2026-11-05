# PPWL Pertemuan 9 — Authentication dan Middleware

Sumber otoritatif: `module.local.pdf` (18 slide, "Authentication dan Middleware").

## Cakupan modul

1. Session authentication: menjelaskan alur login dan cookie session.
2. Memasang Laravel Breeze (`composer require`, `breeze:install blade`,
   `migrate`, `npm install && npm run dev`).
3. Membuat user admin melalui seeder dengan password ter-hash.
4. Login (`Auth::attempt`, regenerasi session, `intended`) dan logout
   (`invalidate`, `regenerateToken`).
5. Melindungi grup route `/post` dengan middleware `auth`.
6. Menjelaskan alur request melewati middleware.
7. Membuat middleware custom `EnsureAdmin` dan mendaftarkan alias `admin` di
   `bootstrap/app.php`.
8. Menguji route, login, logout, dan akses non-admin.

## Latihan (wajib)

- Nonaktifkan route registrasi publik.
- Tampilkan nama user yang login di navbar.
- Buat halaman `/post/profile-saya` khusus pengguna login.
- Ubah `EnsureAdmin` agar memakai kolom `role`; pengguna non-admin mendapat 403.

## Catatan adaptasi

- Breeze 2.4.2 dipasang pada aplikasi portofolio yang sudah berjalan. Breeze
  menimpa `routes/web.php`, `layouts/app.blade.php`, dan membawa Tailwind 3;
  route/layout portofolio dipulihkan dan Tailwind 4 dipertahankan.
- Modul memakai contoh `/post`; aplikasi memakai prefix yang sama.
- Laravel 13 tidak memiliki `RouteServiceProvider`; pengalihan tamu dan alias
  middleware diatur di `bootstrap/app.php`.
- Registrasi publik ditutup; akun demo berasal dari seeder.
