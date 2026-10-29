# PPWL Meeting 8 — Seeder dan Pagination

## Module Checklist

| Module page/section | Change/file | Status | Evidence |
|---|---|---|---|
| Seeder: class di `database/seeders/`, `$this->call([...])` | `database/seeders/ProjectTableSeeder.php`, `DatabaseSeeder.php` | Done | `.runs/p8/verify.txt`, laporan langkah 2–3 |
| Seeder dijalankan dua kali tanpa duplikat | `ProjectSeeder::run()` → `Project::truncate()` di awal rangkaian | Done | 30 baris setelah dua kali `db:seed` |
| `db:seed` / `--class` / `migrate:fresh --seed` | Diverifikasi lewat `migrate:fresh --seed` | Done | log 2026-10-29 |
| `get()` → `paginate(10)` | `ProjectController@index` | Done | halaman 1 (/projects) |
| Info halaman (`currentPage/total/perPage`) + `links()` | `resources/views/projects/index.blade.php` | Done | screenshot 1–3 |
| Latihan: seeder kedua 25 judul acak | `ProjectTableSeeder` + `fake()->unique()` | Done | total 30 data |
| Latihan: nomor urut lanjut antar halaman | `$projects->firstItem() + $index` | Done | halaman 2 mulai 11 |
| Latihan: pencarian tetap aktif saat pindah halaman | form GET + `withQueryString()` + `scopeSearch` | Done | screenshot 3 |
| Latihan: per halaman 5/10/25 | whitelist `in_array` + `<select name="per_page">` | Done | screenshot 3, URL `?per_page=5` |

## Assumptions

- Slide memakai entitas `Post`; aplikasi portofolio (p4–p6) memakai `Project` — semua langkah diterapkan pada `Project` (kesinambungan modul, lihat TASK.md).
- Latihan pertemuan 7 (status enum, scope `published()`, soft delete/Trash) tidak dikumpulkan (tidak ada submission p7); `$fillable` dari p5/p6 dipakai apa adanya.
- Lingkungan verifikasi: devenv di root repo `code/` — PHP 8.5.12, Composer 2.10.3, Node 24.21.0, MariaDB 11 di 127.0.0.1:33060, Laravel 13.32.0.

## Research

| Claim used | Supporting source | Notes/verification |
|---|---|---|
| Seeder mengisi data; `db:seed` menjalankan `DatabaseSeeder`; `call([...])` berurutan | Laravel docs "Database: Seeding" @laravel_seeding | Dipakai di langkah 2–3 |
| `paginate(n)` mengembalikan LengthAwarePaginator; `?page=N` otomatis; ada `currentPage/total/perPage/firstItem/links` | Laravel docs "Database: Pagination" @laravel_pagination | Dipakai di langkah 4–5 |
| `withQueryString()` mempertahankan query string pada tautan halaman | Laravel docs "Database: Pagination" | Bukti perilaku: screenshot 2–3 |
| Query string adalah komponen URL setelah `?` (RFC 3986) | RFC 3986 @rfc3986 | Dasar teori pencarian/per_page |
| Faker via helper `fake()` menghasilkan data palsu | FakerPHP docs @faker | Seeder kedua |
| Scope `search` memakai `where(... like ...)` lewat query builder | Laravel docs Eloquent + Query Builder @laravel_eloquent @laravel_queries | Langkah 1 |

## Verification

| Date | Command/scenario | Concise result | Log (outside repository) |
|---|---|---|---|
| 2026-10-29 | `devenv up -d` (mysql 33060, laravel 8000, vite 5173) | 3 proses ready | `.runs/devenv/validate-full.txt` |
| 2026-10-29 | `php artisan migrate:fresh --seed` | migrasi + `ProjectSeeder` + `ProjectTableSeeder` DONE; 30 baris | `.runs/p8/verify.txt` |
| 2026-10-29 | `GET /projects` | 200; "Jumlah Data : 30", "Data Per Halaman : 10" | screenshot `page-projects-index.png` |
| 2026-10-29 | `GET /projects?page=2` | 200; nomor 11–20, "Halaman : 2", "Showing 11 to 20 of 30" | `page-projects-page-2.png` |
| 2026-10-29 | `GET /projects?page=99` | 200 halaman kosong tanpa galat | `.runs/p8/verify.txt` |
| 2026-10-29 | `GET /projects?search=Menu` | "Jumlah Data : 1" | `.runs/p8/verify.txt` |
| 2026-10-29 | `GET /projects?per_page=5` | "Data Per Halaman : 5" | `.runs/p8/verify.txt` |
| 2026-10-29 | `GET /projects?search=Menu&per_page=5` | 1 data, 5 per halaman, kata kunci tetap di formulir | `page-projects-search-per-page.png` |
| 2026-10-29 | `composer test` | 9 test lulus (termasuk `ProjectCrudTest`) | `.runs/devenv/validate-full.txt` |
| 2026-10-29 | `npm run build` | build sukses (css 56.63 kB) | `.runs/devenv/validate-full.txt` |
| 2026-10-29 | `typst compile report.typ report.pdf` | PDF 16 halaman A4, 814 KB | report.pdf |

## Rubric self-review

| # | Criterion | Score | Note |
|---|---|---|---|
| 1† | Build | 2 | Compile bersih (satu warning font `menlo` dari paket zebraw, bukan error) |
| 2† | Front matter | 2 | Cover, Daftar Isi saja (tanpa daftar gambar/tabel), discovery table, repo line; Sebelum mulai ada di dalam Hasil dan Pembahasan sesuai permintaan reviewer |
| 3 | Version disclosure | 2 | Versi di tabel + dari perintah nyata |
| 4† | Starter kit | 2 | clone + checkout SHA + perintah setup |
| 5† | Step granularity | 2 | 6 langkah dengan checkpoint; blok kode berlabel |
| 6† | Checkpoints | 2 | Tiap langkah punya hasil teramati |
| 7† | Citations | 2 | `module_p8`, `repo_p8` (SHA penuh), 6 sumber resmi |
| 8 | Figure discipline | 2 | 3 screenshot ulang, nama kebab-case, caption lengkap |
| 9† | Module-vs-reality | 2 | Post→Project, Laravel 10→13, truncate idempoten |
| 10 | Ringkasan penugasan | 2 | Tabel latihan → implementasi → bukti |
| 11† | Honest limits | 2 | Batas cakupan + batas hasil eksplisit |
| 12† | Code–repo fidelity | 2 | Commit `3b0ed22`; isi laporan dicocokkan |
| 13 | Structure & hygiene | 2 | Tidak ada TODO/dead code |
| 14 | Bibliography hygiene | 2 | Satu `references.yaml`, key snake_case, tanggal akses |

Total 28/28 — lolos ship gate.

## Human Follow-up

- [ ] Upload `artifacts/PPWL-B2-P8-557554-AtalariqBarraHadinugraha.pdf` ke elok sesuai instruksi dosen.
- [ ] Konfirmasi apakah laporan pertemuan 7 memang tidak perlu dikumpulkan (laporan 8 tetap menyebut p7 tidak termasuk cakupan).
- [ ] (Opsional) Tambahkan screenshot terminal `migrate:fresh --seed` bila ingin bukti teks; laporan saat ini memuat keluaran perintah sebagai blok kode.

## Oral-exam Practice

1. **Mengapa `paginate()` lebih baik daripada `get()` untuk 30+ data?** `get()` mengambil semua baris; `paginate(n)` hanya satu halaman + satu query hitung, membaca `?page=N` otomatis, dan menyediakan `links()` serta metadata halaman (laporan, Dasar Teori & langkah 4).
2. **Bagaimana nomor urut tetap benar di halaman 2?** Di view dipakai `$projects->firstItem() + $index`, sehingga item pertama halaman 2 bernilai 11, bukan 1 (langkah 5).
3. **Mengapa `db:seed` dua kali tidak menggandakan data?** `ProjectSeeder` memanggil `Project::truncate()` sebelum mengisi ulang rangkaian seed, sehingga hasil akhir tetap 30 baris (langkah 2–3).
4. **Apa fungsi `withQueryString()`?** Menyalin parameter query (`search`, `per_page`) ke setiap tautan halaman agar pencarian dan pilihan jumlah data tidak hilang saat berpindah halaman (langkah 4, 6).
5. **Di mana logika pencarian ditempatkan dan mengapa?** Di local scope `scopeSearch` pada model `Project`, agar dapat dipakai ulang dan controller tetap ringkas (langkah 1).
