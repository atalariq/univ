# Pertemuan 12: REST API dan Rate Limit

Modul membuka dengan pemetaan method dan status code yang dipakai API: GET untuk mengambil data, POST untuk membuat data, serta kode 200, 404, 422, dan 429 (hlm. 3). Laravel 12 tidak menyertakan `routes/api.php` secara default, sehingga `php artisan install:api` harus dijalankan lebih dulu; setelah itu berkas route didaftarkan pada `withRouting()` di `bootstrap/app.php` (hlm. 4-5). Supaya galat di jalur `/api/*` selalu berbentuk JSON, modul menambahkan `shouldRenderJsonWhen()` pada konfigurasi exception (hlm. 6).

Rate limiting dijelaskan sebagai pembatas jumlah request per client dalam rentang waktu tertentu, misalnya 60 request per menit untuk API dan 3 pesan per menit untuk form kontak. Tanpa batas, bot dapat membanjiri form, mengambil seluruh isi API, atau menebak password (hlm. 7). Hitungan disimpan di cache dengan key berupa IP untuk tamu atau user id untuk pengguna login, dan bila melewati batas server menjawab 429 beserta header `Retry-After` (hlm. 8-9). Pemasangannya bisa memakai angka langsung seperti `throttle:60,1` atau named limiter yang didefinisikan lewat `RateLimiter::for()` di `AppServiceProvider` (hlm. 10-11).

Sisi API dibangun dengan controller di namespace `Api` dan `ProjectResource`, sehingga hanya field yang dipilih yang keluar dan kolom internal tidak bocor; `ProjectResource::collection()` juga membawa pagination (hlm. 13-14). Pengujian memakai `curl` dengan header `Accept: application/json`, dan modul menyertakan loop 61 request untuk memastikan 60 jawaban 200 serta satu 429 (hlm. 15, 25-27). Sisi web menambahkan tabel `contacts`, model `Contact`, `ContactController`, dan form kontak yang POST-nya dibatasi `throttle:contact` (hlm. 17-23).

Laporan praktikum lengkap untuk pertemuan ini ada di `report.typ` beserta `report.pdf`, `diagrams.typ`, `references.yaml`, dan `assets/`. Catatan ini hanya menunjuk ke sana dan tidak menyalin isinya.

## Poin kunci

- Laravel 12 butuh `php artisan install:api` sebelum `routes/api.php` dipakai (hlm. 4-5).
- `shouldRenderJsonWhen()` membuat galat `/api/*` selalu JSON (hlm. 6).
- Rate limit menghitung per IP atau user id dan menyimpan hitungan di cache (hlm. 8).
- Melewati batas menghasilkan 429 dengan `Retry-After` dan `X-RateLimit-Reset` (hlm. 9).
- API Resource menentukan field yang boleh keluar (hlm. 14).
- Form kontak dibatasi 3 pesan per menit lewat named limiter (hlm. 11, 23).

## Istilah

- REST: gaya arsitektur API yang memakai resource dan method HTTP.
- API Resource: kelas Laravel yang membentuk format JSON keluaran.
- Rate limiting: pembatasan jumlah request per client per rentang waktu.
- Throttle: middleware Laravel yang menerapkan rate limit.
- Named limiter: aturan limit bernama yang didefinisikan di `AppServiceProvider`.
- `Retry-After`: header berisi detik sampai client boleh mencoba lagi.
- `CACHE_STORE`: pengaturan driver cache yang menyimpan hitungan limit.

## Sumber

- `module.local.pdf`, hlm. 2-37.
- `report.typ` dan `report.pdf`, laporan praktikum pertemuan 12.
