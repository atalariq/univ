# Review Laporan P12 — REST API dan Rate Limiting

**Status: perlu revisi kecil sebelum dikumpulkan.** Ada 11 temuan: 3 wajib, 3 sebaiknya, 5 minor. Sebagian besar isi teknis cocok dengan kode; masalah utamanya ada di urutan perintah reproduksi dan beberapa contoh keluaran yang tidak persis.

Yang wajib diperbaiki:

1. Urutan perintah reproduksi: `key:generate` sebelum `composer install` (baris 43–63 dan 317–335).
2. Contoh JSON "Respons nyata" tidak memuat `project_url` dan `meta` yang lengkap (baris 487–519).
3. Klaim 422 untuk form contact; route web mengembalikan 302 (baris 194).


- Berkas yang direview: `report.typ` (845 baris), `references.yaml`, `assets/`, `diagrams.typ`.
- Acuan kode: `93d08334b570022f5138bc590e88f167acdbe572` (tip branch `pertemuan12`).
- Tidak ada perubahan pada `report.typ` atau kode.

## Metode verifikasi

- Membaca berkas kode di commit acuan lewat `git show 93d0833:<path>`: route, middleware, controller, resource, model, migration, blade, dan seluruh test baru.
- Menjalankan suite pada salinan commit di `/tmp/opencode/p12code` (PHP 8.5.12, framework 13.32.0, SQLite in-memory sesuai `phpunit.xml`). Hasil: **100 passed (431 assertions), 3,82 s**. `public/build/manifest.json` dibuat stub karena direktori build tidak masuk git; tanpa itu test yang merender Blade gagal 500.
- Menjalankan server dengan database SQLite hasil `migrate --seed`, lalu memanggil `/api/projects`, `/api/categories`, kasus 404, dan 61 request berurutan untuk membandingkan angka dan header.
- Memeriksa sembilan URL di `references.yaml` dan `report.typ` (semua 200) serta mengompilasi `report.typ` dengan Typst 0.15.1 (berhasil, tanpa warning).

## Temuan

| Lokasi | Temuan | Bukti | Saran perbaikan |
|---|---|---|---|
| 43–63, 317–335 | **[Wajib]** Urutan perintah reproduksi salah: `php artisan key:generate` dijalankan sebelum `composer install`, padahal `artisan` butuh `vendor/autoload.php`. Blok ini muncul dua kali (lampiran dan 4.1), jadi keduanya harus diperbaiki. | `artisan` baris 10 me-require `vendor/autoload.php`. Pada salinan bersih commit 93d0833 tanpa `vendor/`, `php artisan key:generate` gagal: `Failed opening required '.../vendor/autoload.php'`. Urutannya sama dengan `.mise.toml` task `setup` (baris 11 `key:generate`, baris 14 `composer install`), yang pada clone bersih juga gagal karena alasan yang sama. | Pindahkan `composer install` ke atas perintah artisan di kedua blok. Karena `.mise.toml` memakai urutan yang sama, task `setup` di repo kode juga perlu diperbaiki terpisah agar `mise run setup` benar-benar bisa dipakai. |
| 487–519 | **[Wajib]** Contoh JSON diberi label `response.json` dan disebut "Respons nyata", tetapi bukan keluaran apa adanya: `project_url` tidak ada, dan `meta` hanya memuat 3 kunci padahal teks di 217–220 menyebut `last_page` dan `path`. | Respons aktual `GET /api/projects?search=portfolio&per_page=9` memuat `"project_url": null`; `meta` memuat `current_page`, `from`, `last_page`, `links`, `path`, `per_page`, `to`, `total`. `PaginatedResourceResponse::meta()` mempertahankan semua kunci paginator kecuali `data` dan empat URL halaman. | Salin respons lengkap, atau beri label "kutipan" dan minimal tambahkan `project_url`, `last_page`, serta `path` agar konsisten dengan teks. |
| 583–594 | **[Sebaiknya]** Contoh `/api/categories` tidak sesuai urutan dan jumlah: kode mengurutkan `orderBy('name')`, sedangkan contoh menampilkan Web lalu API. Endpoint juga mengembalikan 5 kategori, bukan 2. | Respons aktual: API (id 2), Design System (4), Mobile (3), Tool (5), Web (1). `CategoryController@index` memakai `->orderBy('name')`. | Urutkan contoh sesuai abjad (API sebelum Web) dan tandai sebagai potongan, atau tampilkan kelima baris. |
| 525–534, 623–658 | **[Sebaiknya]** Blok header 404 dan 429 tidak punya perintah yang menghasilkannya. Perintah di 630–635 hanya mencetak status code, jadi nilai `Retry-After`, `X-RateLimit-Reset`, dan `X-RateLimit-Remaining` tidak bisa ditelusuri dari blok itu. | `curl -s -o /dev/null -w "%{http_code}"` tidak pernah menulis header. Klaimnya sendiri benar: 61 request bersih menghasilkan 60×200 + 1×429, dan 429 membawa `X-RateLimit-Limit: 60`, `X-RateLimit-Remaining: 0`, `Retry-After: 56`, serta `X-RateLimit-Reset` (timestamp). | Tambahkan perintah pengambil header, misalnya `curl -sD - -o /dev/null ... \| grep -iE 'HTTP/\|X-RateLimit\|Retry-After'` untuk request ke-61/62, dan perintah serupa untuk kasus 404. |
| 742–745 | **[Sebaiknya]** Caption "Detail pesan; status berubah menjadi sudah dibaca" tidak didukung gambar. Halaman detail tidak menampilkan status baca. | `assets/admin-message-detail.png` hanya memuat nama, email, subjek, diterima, dan isi pesan. `resources/views/admin/messages/show.blade.php` tidak merender `is_read`; status hanya muncul di daftar (`index.blade.php`). | Ganti dengan tangkapan daftar setelah detail dibuka (badge "Sudah dibaca"), atau ubah caption menjadi "Detail pesan" dan jelaskan perubahan status di teks. |
| 32, 378–381 | **[Minor]** Output `route:list` yang ditempel tidak persis: namespace ditulis `Api/...`, sedangkan artisan mencetak `Api\...`. Di lampiran, pola route ditulis `/api/projects/{slug}`, sedangkan URI terdaftar adalah `api/projects/{project:slug}`. | `php artisan route:list --path=api` pada 93d0833 mencetak `Api\CategoryController@index` dan seterusnya, dengan URI `api/projects/{project:slug}`. | Tempel ulang output apa adanya. Di tabel lampiran, gunakan `{project:slug}` atau jelaskan bahwa `{slug}` adalah bentuk URL publik. |
| 194 | **[Wajib]** Tabel status code menyebut 422 untuk "Form contact tanpa email". Form contact adalah route web: validasi gagal menghasilkan 302 kembali ke form dengan error, bukan 422. 422 hanya muncul untuk request yang meminta JSON. | `ContactMessageTest::test_invalid_message_is_rejected` mengharapkan `assertRedirect('/contact')` + `assertSessionHasErrors`. Route POST `/contact` ada di grup `web` (session + CSRF), bukan `api`. Bagian 274–277 juga sudah menulis bahwa pengguna dikembalikan ke form dengan pesan error. | Ganti contoh 422 menjadi "Request JSON tanpa email", atau ganti baris itu dengan 302 "Validasi form gagal, kembali ke form". |
| 698–701 | **[Minor]** "Tiga pesan pertama ... diarahkan kembali ke form" tidak diverifikasi test: test hanya memakai `assertRedirect()` tanpa `from('/contact')`, sehingga target redirect tidak diperiksa. | `ContactMessageTest` baris 65 hanya `assertRedirect()`; hanya test pesan tidak valid (baris 46–50) yang memakai `from('/contact')` dan memeriksa target. | Tulis "direspons dengan redirect", atau tambahkan `from('/contact')->assertRedirect('/contact')` pada test. |
| 132–151 | **[Minor]** Tidak ada rumusan/sumber masalah eksplisit; konteks masalah hanya tersirat di Latar Belakang. Struktur lain lengkap. | Heading yang ada: Latar Belakang, Tujuan Praktikum, Dasar Teori, Hasil dan Pembahasan, Penutup, Daftar Pustaka. Laporan p11 memakai kerangka yang sama. | Opsional. Satu paragraf "Rumusan Masalah" (bot, spam form, query mahal) akan memetakan langsung ke solusi. |
| 279–282 | **[Minor]** "pemisahan data pesan dari data kontak admin" disebut sebagai perlindungan, padahal itu keputusan skema, bukan kontrol keamanan. Kalimat ini membuat klaim keamanan kabur. | Perlindungan yang benar-benar ada: validasi, `throttle:contact` 3 pesan/menit, dan CSRF. Pemisahan tabel `contact_messages` dari `contacts` hanya menghindari tabrakan data. | Hapus frasa itu atau ganti dengan "CSRF, validasi, dan throttle". |
| 538–541, 551 | **[Minor]** Disebut parameter API "sama dengan halaman publik", tetapi `sort` hanya didaftar `oldest`, `title`, `project_date`. Halaman publik juga mengirim `newest`, dan `scopeSorted()` menerimanya sebagai default. | `resources/views/portfolio/projects.blade.php` punya opsi `newest`; `Project::scopeSorted()` menangani nilai default sebagai urutan terbaru. | Tambahkan `newest` di tabel/narasi, atau tulis bahwa nilai lain jatuh ke `newest`. |

## Yang sudah benar

- **Empat endpoint API** cocok dengan `routes/api.php`: `/projects`, `/projects/{project:slug}`, `/categories`, `/technologies`, semuanya di dalam grup `throttle:portfolio-api`.
- **Pendaftaran route** di `bootstrap/app.php` memakai argumen `api:` seperti yang dikutip laporan, dan perintah `php artisan install:api` memang masih tersedia di Laravel 13.32.0.
- **Named limiter** di `AppServiceProvider`: `portfolio-api` 60/menit per IP dan `contact` 3/menit per IP. `throttle:contact` benar-benar dipasang pada POST `/contact`.
- **Cache rate limit** memakai driver `database`: `config/cache.php` default `database`, `.env.example` mengisi `CACHE_STORE=database`, dan migration tabel cache ada.
- **Controller proyek**: hanya proyek `published`, eager load kategori/teknologi, filter `search`/`category`/`technology`, `sorted()`, `paginate()` dengan `per_page` 9/18/27, dan `withQueryString()`. `show()` memakai binding slug dan mengembalikan 404 untuk draft, sesuai 428–444.
- **`ProjectResource`**: seluruh field yang dikutip (termasuk `summary()`, `asset('storage/...')`, `whenLoaded`, `route('projects.show')`, `project_url`) cocok dengan kode.
- **Kategori/teknologi**: `withCount(['projects' => published])` dan resource `whenCounted` cocok. Angka `projects_count` pada contoh (Web 7, API 1) juga benar.
- **Contact**: validasi `required/email/max/min`, penyimpanan ke `contact_messages` dengan `is_read` default `false`, scope `unread()`, dan dua kartu dashboard semuanya cocok dengan kode dan blade.
- **Admin messages**: daftar memuat nama, email, subjek, waktu, status, aksi; membuka detail mengubah `is_read` sebelum render; route dilindungi `auth` + `admin`.
- **Angka pengujian**: 100 test dan 431 assertion tereproduksi tepat pada commit 93d0833. Isi `ApiRateLimitTest`, `ContactMessageTest`, `AdminMessageTest`, `ProjectApiTest`, dan `CategoryApiTest` sesuai tabel di 782–793.
- **Angka rate limit manual**: 60 respons 200 dan 1 respons 429 tereproduksi. Klaim header 429 juga benar, hanya perintah pembuktiannya yang belum dicantumkan (lihat temuan 525–534/623–658).
- **404 JSON + header rate limit** tereproduksi: `Content-Type: application/json`, `X-RateLimit-Limit: 60`, dan `X-RateLimit-Remaining` ada. Nilai 58 pada contoh masuk akal untuk request kedua dalam jendela.
- **Lingkungan**: PHP 8.5.12 dan Node 24.21.0 cocok dengan `.mise.toml`; Laravel 13.32.0 cocok dengan `composer.lock`; MariaDB 11 cocok dengan `compose.yaml`.
- **Tautan dan rujukan**: delapan entri `references.yaml` semuanya dikutip di laporan; sembilan URL (repo, commit tree, empat halaman dokumentasi Laravel, RFC 6585, MDN, disertasi Fielding) merespons 200.
- **Aset dan build**: keenam gambar ada dan cocok dengan caption, kecuali detail pesan di 742–745. Laporan berhasil dikompilasi dengan Typst 0.15.1 tanpa warning.
- **Struktur**: Pendahuluan, Dasar Teori, Hasil dan Pembahasan, Penutup, Kesimpulan, Saran, dan Daftar Pustaka lengkap. Sumber masalah ada secara naratif di Latar Belakang.

## Catatan di luar `report.typ`

- **Versi Typst.** Paket `@atalariq/lab-report:4.0.0` menuntut Typst >= 0.15.0, sedangkan `/home/atalariq/Kuliah/mise.toml` mem-pin `typst = "0.13"`. Akibatnya `typst compile` memakai 0.13.1 dan gagal pada `#import` baris 1. Kompilasi berhasil dengan binary 0.15.1 yang juga terpasang di mesin ini. Ini masalah konfigurasi repo catatan, bukan isi laporan; perlu diputuskan apakah pin `mise.toml` dinaikkan atau paket diturunkan.
- **`TASK.md` tidak ditemukan** di folder `p12-rest-api-rate-limit/`. Review ini memakai `report.typ`, `references.yaml`, aset, dan kode commit 93d0833 sebagai acuan.
- **Durasi test** di laporan 4,89 s, sedangkan mesin review menghasilkan 3,82 s. Jumlah test dan assertion sama persis, jadi perbedaan durasi tidak dihitung sebagai temuan.
- **Duplikasi blok** perintah reproduksi (43–63 vs 317–335) dan bukti pengujian (74–79 vs 765–780) bukan kesalahan isi, tetapi dua salinan harus diperbarui bersamaan.
