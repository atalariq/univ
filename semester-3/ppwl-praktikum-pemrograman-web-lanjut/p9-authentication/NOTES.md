# PPWL Meeting 9 — Authentication dan Middleware

## Module Checklist

| Module page/section | Change/file | Status | Evidence |
|---|---|---|---|
| Slide 2 tujuan: session auth, login/logout, middleware, custom middleware | Breeze + `EnsureAdmin` | Done | laporan langkah 3–8 |
| Slide 3 masalah route terbuka | grup `/post` dengan `auth` + `admin` | Done | `AuthTest`, `route:list` |
| Slide 4 alur session authentication | `AuthenticatedSessionController`, `LoginRequest` | Done | laporan langkah 3 |
| Slide 5 middleware sebagai penjaga request | `routes/web.php`, `bootstrap/app.php` | Done | `route:list` |
| Slide 6 `composer require laravel/breeze --dev` + `breeze:install blade` + `migrate` + `npm install && npm run dev` | Breeze 2.4.2 terpasang | Done | `.runs/p9/composer-breeze.txt`, `.runs/p9/breeze-install.txt` |
| Slide 7 user admin via seeder + `Hash::make` | `DatabaseSeeder` | Done | `2 users` setelah seed |
| Slide 8 login (`Auth::attempt`, regenerate, intended) | `LoginRequest`, `AuthenticatedSessionController@store` | Done | `AuthTest` |
| Slide 9 logout (`invalidate`, `regenerateToken`, POST + CSRF) | `AuthenticatedSessionController@destroy`, admin layout | Done | `AuthTest` |
| Slide 10 proteksi `/post` | `routes/web.php` | Done | 9 route `/post` |
| Slide 11 verifikasi `route:list --path=post` | route list | Done | laporan lampiran |
| Slide 12 middleware custom `EnsureAdmin` | `app/Http/Middleware/EnsureAdmin.php` | Done | `AuthTest` 403 |
| Slide 13 alias di `bootstrap/app.php` | `bootstrap/app.php` | Done | `route:list` |
| Slide 14 pengujian login/logout/guest | `tests/Feature/AuthTest.php` | Done | 57 passed, 183 assertions |
| Slide 15–17 troubleshooting (419, kredensial, redirect) | laporan langkah 3–6 | Done | laporan |
| Slide 18 latihan: register ditutup | route register dihapus, `/register` 404 | Done | `AuthTest` |
| Slide 18 latihan: nama user di navbar | `partials/navbar.blade.php`, `layouts/admin.blade.php` | Done | `page-projects-admin.png` |
| Slide 18 latihan: `/post/profile-saya` | `ProfileController`, `post/profile/edit.blade.php` | Done | `page-profile.png` |
| Slide 18 latihan: role-based `EnsureAdmin`, non-admin 403 | kolom `role`, middleware `admin` | Done | `page-403.png`, `AuthTest` |

## Assumptions

- P9 dijalankan dari aplikasi akhir P8 (`74a4feb`). Breeze dipasang pada aplikasi
  yang sudah berjalan, bukan aplikasi kosong; berkas yang tertimpa dipulihkan.
- Breeze 2.4.2 membawa Tailwind 3, PostCSS, dan Autoprefixer. Aplikasi tetap
  memakai Tailwind 4; hanya `alpinejs` dan `@tailwindcss/forms` yang dipakai dari
  scaffold Breeze.
- Registrasi publik ditutup sesuai latihan modul. Akun dibuat melalui seeder:
  `admin@example.com` / `password123` (role admin) dan `test@example.com` /
  `password` (role user).
- Halaman `/post/profile-saya` memakai middleware `auth` saja, bukan `admin`,
  sehingga pengguna non-admin tetap dapat memperbarui profilnya.
- Redirect pengguna non-admin setelah login diarahkan ke beranda dengan pesan
  status, bukan ke `/post/projects` yang akan menghasilkan 403.

## Research

| Claim used | Supporting source | Notes/verification |
|---|---|---|
| Session menyimpan identitas antar-request melalui cookie | Laravel Session @laravel_session | Langkah 3–4 |
| `Auth::attempt` mencocokkan kredensial dan memulai session | Laravel Authentication @laravel_authentication | Langkah 3 |
| Middleware berjalan sebelum controller; `auth`/`guest` mengatur akses | Laravel Middleware @laravel_middleware | Langkah 5–6 |
| Breeze menghasilkan controller, request, view, dan route autentikasi | Laravel Starter Kits @laravel_breeze | Langkah 1 |
| Password di-hash dengan bcrypt/Argon2; cast `hashed` | Laravel Hashing @laravel_hashing | Langkah 2 |
| Form mutasi memerlukan token CSRF | Laravel CSRF @laravel_csrf | Langkah 4 |
| Session ID diregenerasi setelah login; invalidate saat logout | OWASP Session Management @owasp_session | Langkah 3–4 |
| Otorisasi role memisahkan 403 dari redirect login | Laravel Authorization, OWASP Authorization @laravel_authorization @owasp_access_control | Langkah 6 |

## Verification

| Date | Command/scenario | Concise result | Log (outside repository) |
|---|---|---|---|
| 2026-11-05 | `composer require laravel/breeze --dev` | Breeze 2.4.2 terpasang | `.runs/p9/composer-breeze.txt` |
| 2026-11-05 | `php artisan breeze:install blade --no-interaction` | Scaffold Breeze + build aset | `.runs/p9/breeze-install.txt` |
| 2026-11-05 | `php artisan migrate:fresh --seed` | 2 user, 30 project | `.runs/p9/migrate-seed.txt` |
| 2026-11-05 | `composer test` | 57 passed (183 assertions) | `.runs/p9/tests.txt` |
| 2026-11-05 | `php artisan route:list --path=post -v` | 9 route dengan `auth`, `admin` | laporan lampiran |
| 2026-11-05 | Login admin | Dialihkan ke `/post/projects` | `page-login.png` |
| 2026-11-05 | Login password salah | Pesan kredensial muncul | `page-login-error.png` |
| 2026-11-05 | Non-admin membuka `/post/projects` | 403 `Akses ditolak.` | `page-403.png` |
| 2026-11-05 | Admin membuka `/post/projects` | 200, sidebar dan aksi tampil | `page-projects-admin.png` |
| 2026-11-05 | `GET /register` | 404 | `AuthTest` |
| 2026-11-05 | `/post/profile-saya` | 200 untuk pengguna login | `page-profile.png` |
| 2026-11-05 | `typst compile report.typ report.pdf` | 18 halaman A4 | `report.pdf` |

## Rubric self-review (v3)

| # | Criterion | Score | Note |
|---|---|---|---|
| 1† | Build | 2 | Compile bersih; warning font `menlo` dari paket zebraw |
| 2† | Struktur | 2 | Cover, ToC/LoF/LoT, Tujuan, Dasar Teori, Hasil, Kesimpulan, Lampiran, Daftar Pustaka |
| 3 | Kontinuitas | 2 | Paragraf lanjutan P8 + commit `ce6fa44` |
| 4† | Kelengkapan langkah | 2 | Semua command Breeze, migrasi, seeder, middleware, route, test ditulis |
| 5† | Kode–repo | 2 | Kode dari commit `ce6fa44`; path pada setiap blok |
| 6 | Gambar | 2 | Enam screenshot ulang, PNG, caption lengkap |
| 7† | Sitasi | 2 | `module_p9`, `repo_p9`, Laravel, OWASP |
| 8† | Modul vs realita | 2 | Breeze, Tailwind 4, `/post`, role, profile dijelaskan |
| 9† | Penugasan | 2 | Registrasi ditutup, nama navbar, profil, 403 non-admin |
| 10† | Batas hasil | 2 | Batas cakupan dan redirect non-admin ditulis |
| 11 | Kebersihan | 2 | Tidak ada `#check`/TODO/dead code |
| 12 | Bibliografi | 2 | Satu `references.yaml`, key snake_case |
| 13 | Verifikasi | 2 | Semua klaim punya command/bukti |
| 14 | Tidak ada callout | 2 | Hasil langkah memakai paragraf biasa |

Total 28/28 — lolos ship gate.

## Human Follow-up

- [x] Salin `report.pdf` ke `artifacts/PPWL-B2-P9-557554-AtalariqBarraHadinugraha.pdf`
      (menimpa artifact lama yang memakai auth kustom).
- [ ] Konfirmasi apakah registrasi publik memang harus ditutup pada aplikasi
      portofolio. Saat ini `/register` 404 dan akun dibuat lewat seeder.
- [ ] Ganti password demo `admin@example.com` sebelum demonstrasi lisan bila
      diperlukan.
- [ ] Breeze membawa Tailwind 3; aplikasi mempertahankan Tailwind 4. Jika dosen
      mensyaratkan scaffold Breeze apa adanya, konfigurasi dapat dikembalikan.

## Oral-exam Practice

1. **Mengapa Breeze dipakai, bukan auth kustom?** Breeze menyediakan scaffold
   controller, request, view, dan route yang dapat dibaca dan diubah. Modul
   memakai Breeze, sehingga alur login/logout dapat ditelusuri sampai ke
   `AuthenticatedSessionController` dan `LoginRequest` (laporan langkah 1–3).
2. **Apa yang terjadi pada session setelah login dan logout?** Setelah login, ID
   session diregenerasi untuk mencegah session fixation. Saat logout, session
   di-invalidate dan token CSRF diregenerasi (laporan langkah 3–4).
3. **Mengapa middleware `admin` mengembalikan 403, bukan redirect ke login?**
   Pengguna sudah terautentikasi tetapi tidak memiliki role yang cukup; 403
   menunjukkan masalah otorisasi, sedangkan redirect login untuk tamu (laporan
   langkah 6).
4. **Mengapa `/post/profile-saya` tidak memakai middleware `admin`?** Profil
   adalah data pengguna sendiri, sehingga semua pengguna login boleh
   memperbaruinya; area project dan dashboard tetap `admin` (laporan langkah 5
   dan 8).
5. **Apa yang harus dilakukan jika Breeze menimpa route portofolio?** Pulihkan
   route portofolio, tambahkan `require __DIR__.'/auth.php';`, dan pastikan
   layout publik serta konfigurasi Tailwind 4 dipulihkan (laporan langkah 1).
