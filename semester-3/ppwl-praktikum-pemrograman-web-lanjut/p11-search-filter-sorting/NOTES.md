# PPWL Meeting 11 — Search, Filter, dan Sorting

## Module Checklist

| Module page/section | Change/file | Status | Evidence |
|---|---|---|---|
| hlm. 2 tujuan pembelajaran | query parameter, `when()`, `whereHas()`, sorting, pagination, query string | Done | laporan 2.1–2.11, 3.2–3.3 |
| hlm. 3–4 kolom baru | migration `add_detail_columns_to_projects_table` | Done | laporan 3.1, `migrate:status` |
| hlm. 5 perintah migration | `php artisan make:migration`, `migrate`, `migrate:status` | Done | laporan 3.1 |
| hlm. 6 isi migration | `short_description`, `project_date`, `is_featured`, `project_url`, `repository_url` | Done | laporan 3.1, `ProjectSeeder` |
| hlm. 7 model dan slug | `Project::$fillable`, cast, slug otomatis | Done | laporan 3.1 |
| hlm. 8 validasi | `ProjectController@validateProject` | Done | `ProjectCrudTest`, `ProjectUploadTest` |
| hlm. 9 data uji | 12 project, 5 kategori, 31 teknologi | Done | `ProjectSeeder`, Tabel 2 |
| hlm. 10 alasan langkah tambahan | slug kategori/teknologi, pivot, relasi | Done | laporan 3.1 |
| hlm. 11 slug kategori dan technology | migration P10 `categories`/`technologies` | Verified | `migrate:status`, model Category/Technology |
| hlm. 12 tabel pivot | `project_technology` | Verified | laporan 3.1, relasi `belongsToMany` |
| hlm. 13 default `make:migration` | pivot tanpa `id()` dan `timestamps()` | Verified | migration P10 |
| hlm. 14 relasi pivot | `Project::technologies()`, `Technology::projects()` | Done | laporan 3.1 |
| hlm. 15 simpan technologies | `sync()` dari form admin | Done | `ProjectCrudTest`, `ProjectSeeder` |
| hlm. 16 query parameter | `$request->integer()`, `$request->string()`, `filled()` | Done | laporan 2.3, 3.2 |
| hlm. 17 query dinamis | `when()` bertahap | Done | laporan 2.5, 3.2 |
| hlm. 18 search + filter | `search()`, `categorySlug()`, `technologySlug()` | Done | laporan 3.2, `ProjectSearchFilterTest` |
| hlm. 19 sorting + pagination | `sorted()`, `paginate()`, `withQueryString()` | Done | laporan 3.3 |
| hlm. 20 form Blade | form GET, select kategori/teknologi, sort, per page | Done | laporan 3.2–3.3 |
| hlm. 21 link pagination | `links()` dan empty state | Done | laporan 3.2–3.3 |
| hlm. 22 route detail slug | route `{project:slug}` dan `getRouteKeyName()` | Done | laporan 3.4 |
| hlm. 23 controller detail | `ProjectController@show`, draft 404/admin preview | Done | laporan 3.4, `PublicPageTest` |
| hlm. 24 pengujian | feature test search, filter, sort, pagination, query string | Done | `php artisan test` |
| hlm. 25–30 troubleshooting | kasus tepi nyata diserap ke subbab terkait; tabel generik tidak dimasukkan | Done | laporan 3.2–3.5 |
| hlm. 31 Latihan | filter technology, `project_date`, count/reset, admin search/status | Done | laporan 3.2–3.5 |
| hlm. 32 ringkasan | kesimpulan dan saran | Done | laporan 4.1–4.2 |

## Assumptions

- Entitas `Post` pada modul dipetakan ke `Project`; kolom `name` dipetakan ke
  `title`.
- Sebagian kolom project sudah dibuat pada pertemuan 10: `slug`, `status`,
  `description`, dan `thumbnail`. Pertemuan 11 menambah kolom yang belum ada.
- Slug kategori/teknologi dan pivot `project_technology` sudah ada dari
  pertemuan 10; laporan memverifikasi, bukan membuat ulang.
- Area admin memakai prefix `/admin`, bukan `/post`.
- Default pagination 9 item; aplikasi menyediakan pilihan 9/18/27.
- Project draft tetap dapat dipratinjau admin; tamu menerima 404.
- Data uji seluruhnya published; perilaku draft diuji melalui feature test.
- Screenshot diambil pada viewport 1265 px dan dipotong ke bagian yang relevan.
- Laporan mengikuti paper-style PPWL: cover 3.0.0, tanpa header/footer/nomor
  halaman, tabel booktabs, code block codly `thesis` 9.5pt, gambar 70–80%,
  Lampiran setelah Daftar Pustaka.
- PDF self-contained: tidak menyebut modul atau Latihan; mapping modul tetap di
  `NOTES.md`.
- Istilah teknis yang lazim dibaca dipertahankan dalam bahasa Inggris; prosa
  tetap bahasa Indonesia formal.

## Research

| Claim used | Supporting source | Notes/verification |
|---|---|---|
| PHP adalah bahasa server-side; request diproses di server | PHP Manual @php_manual | laporan 2.1 |
| Variabel, array, closure, class, method, namespace | PHP Language Reference @php_language | laporan 2.1 |
| Composer mengelola dependensi dan autoload | Composer Documentation @composer | laporan 2.1, Lampiran |
| Laravel memakai request lifecycle dan MVC | Laravel Request Lifecycle @laravel_lifecycle | laporan 2.2 |
| Routing, controller, view, migration, seeding, testing | Laravel docs @laravel_* | laporan 2.2–2.10 |
| Artisan menyediakan perintah pengembangan | Laravel Artisan @laravel_artisan | laporan 2.2 |
| HTTP request/response, method, status code, URL | MDN HTTP @mdn_http, @mdn_http_methods, @mdn_url | laporan 2.3 |
| Query string dibaca melalui request object | Laravel HTTP Requests @laravel_requests | laporan 2.3, 3.2 |
| Database relasional, primary/foreign key, pivot | MariaDB Documentation @mariadb | laporan 2.4 |
| SELECT, WHERE, LIKE, JOIN, ORDER BY, LIMIT/OFFSET | MySQL Reference Manual @mysql_select, @mysql_join | laporan 2.4 |
| Collation memengaruhi pencarian `LIKE` | MySQL String Comparison @mysql_like | laporan 2.4, 3.2 |
| Eloquent ORM, relasi, scope, eager loading | Laravel Eloquent Relationships @laravel_eloquent | laporan 2.5, 3.2–3.4 |
| Query builder, `when()`, `whereHas()`, `with()` | Laravel Query Builder @laravel_queries | laporan 2.5, 3.2 |
| Pagination, `withQueryString()`, `links()` | Laravel Pagination @laravel_pagination | laporan 2.5, 3.3 |
| Route model binding dan slug | Laravel Routing @laravel_routing | laporan 2.7, 3.4 |
| `Str::slug()` membentuk slug | Laravel Strings @laravel_strings | laporan 2.7, 3.4 |
| Validasi server-side dan aturan validasi | Laravel Validation @laravel_validation | laporan 2.9, 3.1 |
| Migration dan seeder | Laravel Migrations/Seeding @laravel_migrations, @laravel_seeding | laporan 2.9, 3.1 |
| Blade, form GET, directive, komponen | Laravel Blade/Views @laravel_blade, @laravel_views | laporan 2.8, 3.2 |
| Feature test dan assertion | Laravel Testing @laravel_testing, PHPUnit @phpunit | laporan 2.10 |
| Mise mengelola versi tool | Mise Documentation @mise | Lampiran |
| Podman menjalankan container rootless | Podman Documentation @podman | Lampiran |
| Node.js dan Vite untuk build frontend | Node.js @node, Vite @vite | Lampiran |
| MariaDB sebagai database relasional | MariaDB Documentation @mariadb | Lampiran |
| Sitasi IEEE | Konvensi prodi / IEEE | Daftar Pustaka |

## Verification

| Date | Command/scenario | Concise result | Log (outside repository) |
|---|---|---|---|
| 2026-11-17 | `git -C code rev-parse HEAD` | `051d37003e67855f2c5a79c2aba7bafafe1b8ebf` | `.runs/p11/` |
| 2026-11-17 | `php artisan migrate:status` | seluruh migration P11 `Ran` | `.runs/p11/` |
| 2026-11-17 | `php artisan tinker` counts | 12 project, 5 kategori, 31 teknologi, 32 skill, 24 gambar | `.runs/p11/` |
| 2026-11-17 | `php artisan test` | 86 passed, 303 assertions | `.runs/p11/tests.txt` |
| 2026-11-17 | `npm run build` | Vite build sukses | `.runs/p11/` |
| 2026-11-17 | `GET /projects?search=laravel` | 2 hasil, filter aktif | `page-projects-search.png` |
| 2026-11-17 | `GET /projects?category=web&technology=typescript&sort=project_date` | 2 hasil, kombinasi filter dan sort | `page-projects-filter.png` |
| 2026-11-17 | `GET /projects?sort=project_date&per_page=9&page=2` | halaman 2, query string terjaga | `page-projects-page2.png` |
| 2026-11-17 | `GET /projects?search=zzz` | empty state dan Reset | `page-projects-empty.png` |
| 2026-11-17 | `GET /projects/personal-picks` | detail slug, project URL, repository, gallery | `page-project-detail.png` |
| 2026-11-17 | `GET /admin/projects?search=portfolio&status=published` | filter admin bekerja | `page-admin-projects-filter.png` |
| 2026-11-17 | `typst compile report.typ report.pdf` | 30 halaman, `lab-report:4.0.0`, codly 2.x, tanpa warning | `report.pdf` |
| 2026-11-17 | Render 30 halaman ke PNG 100 DPI | tidak ada tabel meluber, code badge yatim, atau heading yatim; code block utuh; gambar 70–80% | `.runs/p11/` |
| 2026-11-17 | `typst compile examples/{minimal,full,ppwl}.typ` | tiga contoh 4.0.0 compile dengan codly | `.runs/p11/` |
| 2026-11-17 | Compile p6/p8/p9/p10/compendium dengan 3.0.0 | laporan lama tetap compile; warning `menlo` bukan error | `.runs/p11/` |
| 2026-11-17 | `typst fonts` | Times New Roman, DejaVu Sans Mono, Fira Code tersedia | `.runs/p11/` |
| 2026-11-17 | `php artisan route:list --path=projects` | 13 route publik/admin | `.runs/p11/` |
| 2026-11-17 | Cek 32 entri `references.yaml` | semua entri dikutip; tidak ada `module_p11` | `.runs/p11/` |
| 2026-11-17 | Cek `report.typ` untuk “Modul meminta/Latihan modul” | tidak ada | `.runs/p11/` |

## Rubric self-review (v4)

| # | Criterion | Score | Note |
|---|---|---|---|
| 1† | Build | 2 | `typst compile` selesai; 4.0.0; codly 2.x; tanpa warning |
| 2† | Format | 2 | Paper-style: cover 3.0.0, tanpa header/footer/nomor halaman, 11pt, 1,5, 3/2/2/2, “Bab” |
| 3† | Structure | 2 | Pendahuluan, Dasar Teori, Hasil dan Pembahasan, Kesimpulan dan Saran, Daftar Pustaka, Lampiran setelah referensi |
| 4† | Narrative | 2 | Dasar Teori memakai Apa/Mengapa/Bagaimana; Hasil task-based; kesimpulan naratif |
| 5† | Task-based | 2 | Subbab 3.1–3.5; testing dan fitur Latihan diserap; tanpa section meta |
| 6† | Evidence | 2 | 86 test, screenshot, code, data uji, command |
| 7† | No meta tables | 2 | Hanya Tabel 1–4 (peta komponen, data uji, alur query, tools); tanpa checklist/adaptasi |
| 8† | Citations | 2 | IEEE, 32 entri, semua dikutip; repo SHA; dokumentasi resmi; tanpa `module_p11` |
| 9† | Figures/tables | 2 | Booktabs; codly `thesis`; 6 gambar 70–80%; tidak meluber |
| 10† | Language | 2 | Bahasa Indonesia formal; istilah teknis tetap Inggris bila natural; EYD V |
| 11† | Layout | 2 | Tidak ada tabel meluber, code badge yatim, heading yatim; TOC/TOF/TOT berurutan; beberapa jeda di akhir bab |
| 12† | Honesty | 2 | Data seed published; draft diuji lewat feature test; batas hasil dicatat |

Total 24/24 — lolos ship gate. Catatan: laporan 30 halaman karena Dasar Teori
diperdalam (2.1–2.11) dan Lampiran menjelaskan environment/tools; bukan padding.
Beberapa halaman berakhir lebih awal karena chapter break atau code block yang
tidak muat, bukan karena konten hilang.

## Human Follow-up

- [ ] Periksa konsistensi istilah dan ejaan EYD V.
- [ ] Periksa apakah semua screenshot terbaca pada ukuran cetak (70–80%).
- [ ] Periksa apakah ada klaim yang belum didukung evidence.
- [ ] Periksa TOC/TOF/TOT dan nomor halaman entri.
- [ ] Pastikan laporan tidak menyebut modul, “Latihan modul”, atau `module_p11`.
- [ ] Periksa paper-style: cover 3.0.0, tanpa header/footer, booktabs, codly `thesis`, Lampiran setelah Daftar Pustaka.
- [ ] Periksa akurasi Lampiran (Mise, Podman, PHP/Laravel, Node/Vite, MariaDB).
- [ ] Periksa 32 entri Daftar Pustaka dan sitasi IEEE.

## Oral-exam Practice

1. Mengapa `when()` lebih baik daripada rangkaian `if` manual pada query builder?
2. Apa yang terjadi di SQL ketika `whereHas('technologies')` dijalankan, dan mengapa `join` kurang tepat untuk relasi banyak-ke-banyak?
3. Mengapa `withQueryString()` penting saat pagination? Apa yang rusak tanpa method itu?
4. Mengapa route detail memakai slug dan apa risikonya jika slug berubah?
5. Mengapa `with()` penting untuk menghindari N+1, dan bagaimana hubungannya dengan jumlah card di halaman proyek?
