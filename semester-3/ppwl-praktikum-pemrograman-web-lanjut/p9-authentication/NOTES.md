# PPWL Meeting 9 — Authentication

## Module Checklist

| Module page/section | Change/file | Status | Evidence |
|---|---|---|---|
| Authentication: pisahkan halaman publik vs login | route groups + middleware `auth`/`guest` | Done | `routes/web.php`, verifikasi langkah 2 |
| Custom registration & login routes | 6 route di `LoginRegisterController` group | Done | `route:list` (langkah 2) |
| 6 method controller (register/store/login/authenticate/dashboard/logout) | `app/Http/Controllers/Auth/LoginRegisterController.php` | Done | laporan langkah 1 |
| Middleware auth/guest (constructor pada modul; Laravel 13: route group) | `routes/web.php`, `bootstrap/app.php` | Done | langkah 2–3 |
| Halaman home baru setelah login (modul: `RouteServiceProvider::HOME`; Laravel 13: redirect config) | `bootstrap/app.php` | Done | langkah 3 |
| View register, login, dashboard | `resources/views/auth/*.blade.php` | Done | langkah 4–5, screenshot |
| Tugas: menu/controller tak diakses pengguna umum | `@auth` pada Add/Edit/Delete + middleware route | Done | screenshot guest vs authed |
| Menjalankan aplikasi `/register`, `/login` | server devenv | Done | log 2026-10-29 |

## Assumptions

- Modul mencontohkan Laravel 10 (`RouteServiceProvider::HOME` dan middleware di constructor controller). Aplikasi memakai Laravel 13: pengalihan di `bootstrap/app.php`, middleware di route group — dicatat sebagai kalimat adaptasi di laporan.
- Modul memakai dashboard terpisah dari aplikasi portofolio; praktikum menerapkannya pada aplikasi yang sama (portofolio p4–p8).
- Registrasi langsung login (auto-login) lalu diarahkan ke dashboard; modul tidak merinci perilaku setelah `store()`.
- Lingkungan: devenv (PHP 8.5.12, Composer 2.10.3, Node 24.21.0, MariaDB 11 :33060, Laravel 13.32.0).

## Research

| Claim used | Supporting source | Notes/verification |
|---|---|---|
| Session auth: identitas disimpan di session setelah kredensial diverifikasi | Laravel docs "Authentication" @laravel_authentication | Langkah 1, 3 |
| `Auth::attempt/login/logout`, `intended()` | docs Authentication @laravel_authentication | Langkah 1 |
| Middleware `auth`/`guest`; redirect config di bootstrap/app.php (L12+) | docs Middleware @laravel_middleware | Langkah 2–3 |
| Cast `hashed` + Hash bcrypt/Argon2 untuk password | docs Hashing @laravel_hashing | Langkah 1 |
| Validasi registrasi (unique, confirmed, min 8) | docs Validation @laravel_validation | Langkah 1 |
| Regenerasi ID session setelah login, invalidate + regenerateToken saat logout | OWASP Session Management @owasp_session + docs Session @laravel_session | Langkah 1, 3 |
| Resource route order (`create` sebelum `{project}`) | Perilaku Laravel route registration, teruji saat implementasi | Langkah 2 |

## Verification

| Date | Command/scenario | Concise result | Log (outside repository) |
|---|---|---|---|
| 2026-10-29 | `composer test` | 18 passed, 57 assertions | `.runs/devenv/validate-full.txt` |
| 2026-10-29 | `php artisan route:list --path=projects` | 7 route; create/store/edit/update/destroy bermiddleware auth | conversation log |
| 2026-10-29 | Guest `GET /dashboard` | 302 → `/login` (test + manual) | AuthTest |
| 2026-10-29 | Guest `GET /projects/create` | 302 → `/login`; tidak menampilkan Add Project | screenshot `page-projects-guest.png` |
| 2026-10-29 | Authed `GET /projects` | Add Project + Dashboard/Logout tampil | screenshot `page-projects-authed.png` |
| 2026-10-29 | Login password salah | kembali ke `/login`, pesan "Email atau password salah." | screenshot `page-login-error.png` |
| 2026-10-29 | Login valid `test@example.com` | dashboard: identitas, 30 project, project terbaru | screenshot `page-dashboard.png` |
| 2026-10-29 | Logout | redirect `/` + pesan "Anda telah logout." (test) | AuthTest |
| 2026-10-29 | `typst compile report.typ report.pdf` | 15 halaman A4 | report.pdf |

## Rubric self-review

| # | Criterion | Score | Note |
|---|---|---|---|
| 1† | Build | 2 | Compile bersih (warning font `menlo` kosmetik dari zebraw) |
| 2† | Front matter | 2 | Cover, Daftar Isi, discovery table, repo line; Sebelum mulai di dalam Hasil dan Pembahasan (gaya p6, sesuai permintaan) |
| 3 | Version disclosure | 2 | Versi di tabel lingkungan + prasyarat |
| 4† | Starter kit | 2 | clone + checkout parent commit + perintah setup |
| 5† | Step granularity | 2 | 7 langkah, checkpoint per langkah, blok kode zebraw berlabel file |
| 6† | Checkpoints | 2 | Hasil teramati per langkah |
| 7† | Citations | 2 | `module_p9`, `repo_p9` (SHA penuh), docs Laravel + OWASP |
| 8 | Figure discipline | 2 | 6 screenshot ulang, PNG, caption lengkap |
| 9† | Module-vs-reality | 2 | Laravel 10 → 13 dicatat inline (langkah 2–3) |
| 10 | Ringkasan penugasan | 2 | Tidak ada tabel ringkasan terpisah; latihan/Tugas dibahas di langkah 2, 6, 7 (gaya p6) |
| 11† | Honest limits | 2 | Batas cakupan di Sebelum mulai |
| 12† | Code–repo fidelity | 2 | Commit `add137e`; kode laporan dari file repo |
| 13 | Structure & hygiene | 2 | Tidak ada TODO/dead code |
| 14 | Bibliography hygiene | 2 | Satu references.yaml, key snake_case, tanggal akses |

Total 28/28 — lolos ship gate.

## Human Follow-up

- [ ] Upload `artifacts/PPWL-B2-P9-557554-AtalariqBarraHadinugraha.pdf` ketika slot submisi p9 dibuka.
- [ ] Konfirmasi apakah registrasi sebaiknya diarahkan ke halaman login (bukan auto-login) jika dosen menuntut alur slide persis; saat ini auto-login → dashboard.
- [ ] (Opsional) Ganti akun demo `test@example.com` di seeder dengan kredensial lokal sendiri sebelum demo lisan.

## Oral-exam Practice

1. **Mengapa middleware dipasang di route, bukan constructor controller?** Laravel 13 memakai konfigurasi middleware terpusat (`bootstrap/app.php`) dan route group; constructor `$this->middleware()` sudah bukan API bawaan. Efeknya sama: `auth` menjaga dashboard/logout/aksi tulis, `guest` menjaga form login (langkah 2–3).
2. **Apa yang terjadi pada session saat login dan logout?** Setelah login berhasil ID session diregenerasi (mencegah session fixation); saat logout session di-invalidate dan token CSRF diregenerasi (langkah 1, 3).
3. **Mengapa password tidak perlu di-hash manual?** Model `User` memakai cast `hashed`, sehingga `User::create(['password' => ...])` otomatis menyimpan hash bcrypt/Argon2 (langkah 1, Dasar Teori).
4. **Bagaimana tamu dihalangi, padahal daftar project tetap publik?** Hanya route mutasi (`create/store/edit/update/destroy`) memakai middleware `auth`; `index/show` tetap terbuka. Tampilan juga menyembunyikan tombol aksi dengan `@auth` (langkah 2, 6).
5. **Apa fungsi `redirect()->intended()`?** Mengembalikan pengguna ke halaman yang ingin dibuka sebelum dialihkan ke login, dengan fallback `/dashboard` (langkah 1).
