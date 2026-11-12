# PPWL Meeting 11 — Search, Filter, dan Sorting

## Module Checklist

| Module page/section | Change/file | Status | Evidence |
|---|---|---|---|
| hlm. 2 tujuan pembelajaran | query parameter, `when()`, `whereHas()`, sorting, pagination, query string | Done | laporan langkah query dan pengujian |
| hlm. 3–4 kolom baru | migration `add_detail_columns_to_projects_table` | Done | laporan langkah 1, `migrate:status` |
| hlm. 5 perintah migration | `php artisan make:migration`, `migrate`, `migrate:status` | Done | laporan langkah 1 |
| hlm. 6 isi migration | `short_description`, `project_date`, `is_featured`, `project_url`, `repository_url` | Done | `ProjectSeeder`, screenshot form admin |
| hlm. 7 model dan slug | `Project::$fillable`, cast, slug otomatis | Done | `Project.php`, laporan langkah 2 |
| hlm. 8 validasi | `ProjectController@validateProject` | Done | `ProjectCrudTest`, `ProjectUploadTest` |
| hlm. 9 data uji | 12 project, 5 kategori, 31 teknologi | Done | `ProjectSeeder`, tabel data uji |
| hlm. 10 alasan langkah tambahan | slug kategori/teknologi, pivot, relasi | Done | migration P10, `migrate:status` |
| hlm. 11 slug kategori dan technology | migration P10 `categories`/`technologies` | Verified | `migrate:status`, model Category/Technology |
| hlm. 12 tabel pivot | `project_technology` | Verified | migration P10, relasi `belongsToMany` |
| hlm. 13 default `make:migration` | pivot tanpa `id()` dan `timestamps()` | Verified | migration P10 |
| hlm. 14 relasi pivot | `Project::technologies()`, `Technology::projects()` | Done | model, test filter technology |
| hlm. 15 simpan technologies | `sync()` dari form admin | Done | `ProjectCrudTest`, `ProjectSeeder` |
| hlm. 16 query parameter | `$request->integer()`, `$request->string()`, `filled()` | Done | `ProjectController@publicIndex` |
| hlm. 17 query dinamis | `when()` bertahap | Done | `ProjectController@publicIndex` |
| hlm. 18 search + filter | `search()`, `categorySlug()`, `technologySlug()` | Done | `ProjectSearchFilterTest`, screenshot filter |
| hlm. 19 sorting + pagination | `sorted()`, `paginate()`, `withQueryString()` | Done | `ProjectSearchFilterTest`, screenshot page 2 |
| hlm. 20 form Blade | form GET, select kategori/teknologi, sort, per page | Done | `projects.blade.php`, screenshot search |
| hlm. 21 link pagination | `links()` dan empty state | Done | screenshot page 2 dan empty state |
| hlm. 22 route detail slug | route `{project:slug}` dan `getRouteKeyName()` | Done | `routes/web.php`, `Project.php` |
| hlm. 23 controller detail | `ProjectController@show`, draft 404/admin preview | Done | `PublicPageTest`, screenshot detail |
| hlm. 24 pengujian | feature test search, filter, sort, pagination, query string | Done | `php artisan test` |
| hlm. 25–30 troubleshooting | tabel gejala, penyebab, diagnosis, solusi | Done | bagian troubleshooting laporan |
| hlm. 31 Latihan | technology filter, `project_date`, count/reset, admin search/status | Done | screenshot filter, page 2, admin filter |
| hlm. 32 ringkasan | kesimpulan dan peta bukti | Done | `Kesimpulan` |

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
- Perubahan desain dan nice-to-have di luar modul tidak dimasukkan ke laporan.

## Research

| Claim used | Supporting source | Notes/verification |
|---|---|---|
| Query parameter dapat dibaca dari request GET | Laravel HTTP Requests @laravel_requests | langkah query |
| `when()` hanya menjalankan closure jika nilai truthy | Laravel Query Builder @laravel_queries | langkah query |
| `whereHas()` menambahkan subquery `exists` pada relasi | Laravel Eloquent Relationships @laravel_eloquent | filter kategori/teknologi |
| `with()` melakukan eager loading dan mengurangi N+1 | Laravel Eloquent Relationships @laravel_eloquent | eager loading |
| `paginate()` menghasilkan paginator dan `withQueryString()` mempertahankan query | Laravel Pagination @laravel_pagination | page 2 |
| Route model binding memakai kolom dari `getRouteKeyName()` | Laravel Routing @laravel_routing | detail slug |
| Validasi `in`, `url`, `nullable`, dan `exists` dijalankan di server | Laravel Validation @laravel_validation | validasi project |
| Form GET dan directive Blade mempertahankan nilai lama | Laravel Blade @laravel_blade | form filter |
| `Str::slug()` membentuk slug dari judul | Laravel Strings @laravel_strings | model Project |
| Pencarian `LIKE` dipengaruhi kolasi database | MySQL String Comparison @mysql_like | troubleshooting case-sensitive |

## Verification

| Date | Command/scenario | Concise result | Log (outside repository) |
|---|---|---|---|
| 2026-11-12 | `git -C code rev-parse HEAD` | `051d37003e67855f2c5a79c2aba7bafafe1b8ebf` | `.runs/p11/` |
| 2026-11-12 | `php artisan migrate:status` | seluruh migration P11 `Ran` | `.runs/p11/` |
| 2026-11-12 | `php artisan tinker` counts | 12 project, 5 kategori, 31 teknologi, 32 skill, 24 gambar | `.runs/p11/` |
| 2026-11-12 | `php artisan test` | 86 passed, 303 assertions | `.runs/p11/tests.txt` |
| 2026-11-12 | `npm run build` | Vite build sukses | `.runs/p11/` |
| 2026-11-12 | `GET /projects?search=laravel` | 2 hasil, filter aktif | `page-projects-search.png` |
| 2026-11-12 | `GET /projects?category=web&technology=typescript&sort=project_date` | 2 hasil, kombinasi filter dan sort | `page-projects-filter.png` |
| 2026-11-12 | `GET /projects?sort=project_date&per_page=9&page=2` | halaman 2, query string terjaga | `page-projects-page2.png` |
| 2026-11-12 | `GET /projects?search=zzz` | empty state dan Reset | `page-projects-empty.png` |
| 2026-11-12 | `GET /projects/personal-picks` | detail slug, project URL, repository, gallery | `page-project-detail.png` |
| 2026-11-12 | `GET /admin/projects?search=portfolio&status=published` | filter admin bekerja | `page-admin-projects-filter.png` |
| 2026-11-12 | `GET /admin/projects/ppwl-portfolio/edit` | field detail project tampil | `page-admin-project-form.png` |
| 2026-11-12 | `typst compile report.typ report.pdf` | 24 halaman, warning font `menlo` dari paket zebraw | `report.pdf` |
| 2026-11-12 | Render halaman PDF ke PNG | H1 centered, Times New Roman, TOC/TOF/TOT berurutan | `.runs/p11/` |
| 2026-11-12 | `typst fonts` | Times New Roman tersedia | `.runs/p11/` |
| 2026-11-12 | `php artisan route:list --path=projects` | 13 route publik/admin | `.runs/p11/` |

## Rubric self-review (v3)

| # | Criterion | Score | Note |
|---|---|---|---|
| 1† | Build | 2 | `typst compile` selesai; warning font `menlo` berasal dari preset zebraw, bukan error |
| 2† | Struktur | 2 | Cover, ToC/ToF/ToT, Tujuan, Dasar Teori, Hasil, Kesimpulan, Daftar Pustaka; tanpa Lampiran |
| 3 | Kontinuitas | 2 | Satu paragraf kontinuitas P10 + commit `d78b48b` dan kode acuan `051d370` |
| 4† | Kelengkapan perintah | 2 | `make:migration`, `migrate`, `migrate:status`, `test`, `npm run build`, dan perintah terminal lain ditulis |
| 5† | Granularitas langkah | 2 | Setiap langkah memuat file, kode, alasan, hasil yang diharapkan, dan bukti |
| 6 | Tanpa callout | 2 | Tidak ada `#check` atau kotak checkpoint |
| 7† | Sitasi | 2 | `module_p11`, `repo_p11`, dokumentasi Laravel, dan MySQL; tanggal akses tersedia |
| 8 | Disiplin gambar | 2 | Tujuh PNG, nama kebab-case, caption lengkap, dipotong dari screenshot final |
| 9† | Modul vs realita | 2 | `Project`/`title`, `/admin`, `sync()`, pagination 9/18/27, draft preview, prasyarat P10 dijelaskan |
| 10† | Penugasan | 2 | Latihan technology, `project_date`, count/reset, admin search/status terpenuhi |
| 11† | Batas hasil | 2 | Data seed published, draft diuji lewat feature test, prasyarat P10 dicatat |
| 12† | Kesesuaian kode–repo | 2 | Blok kode dicek terhadap commit `051d370` |
| 13 | Kebersihan | 2 | Tidak ada TODO, kode mati, atau sitasi menggantung |
| 14 | Bibliografi | 2 | Satu `references.yaml`, key snake_case, 11 entri, tanggal akses |

Total 28/28 — lolos ship gate. Catatan: H1 dibuat centered dan font Times New Roman dipaksa melalui `report.with(font: ...)`.

## Human Follow-up

- [ ] Periksa kembali konsistensi istilah dan ejaan EYD V.
- [ ] Periksa apakah semua screenshot terbaca pada ukuran cetak.
- [ ] Periksa apakah ada klaim yang belum didukung evidence.
- [ ] Periksa kembali nomor halaman dan daftar gambar/tabel.

## Oral-exam Practice

1. Mengapa `when()` lebih baik daripada rangkaian `if` manual pada query builder?
2. Apa yang terjadi di SQL ketika `whereHas('technologies')` dijalankan?
3. Mengapa `withQueryString()` penting saat pagination?
4. Mengapa route detail memakai slug dan apa risikonya jika slug berubah?
5. Apa perbedaan `paginate()` dan `get()` pada konteks `links()`?
