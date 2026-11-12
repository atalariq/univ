# PPWL Meeting 11 — Search, Filter, dan Sorting

## Module Checklist

| Module page/section | Change/file | Status | Evidence |
|---|---|---|---|
| hlm. 2 tujuan pembelajaran | query parameter, `when()`, `whereHas()`, sorting, pagination, query string | Done | laporan 3.2–3.3 |
| hlm. 3–4 kolom baru | migration `add_detail_columns_to_projects_table` | Done | laporan 3.1, `migrate:status` |
| hlm. 5 perintah migration | `php artisan make:migration`, `migrate`, `migrate:status` | Done | laporan 3.1 |
| hlm. 6 isi migration | `short_description`, `project_date`, `is_featured`, `project_url`, `repository_url` | Done | laporan 3.1, `ProjectSeeder` |
| hlm. 7 model dan slug | `Project::$fillable`, cast, slug otomatis | Done | `Project.php`, laporan 3.1 |
| hlm. 8 validasi | `ProjectController@validateProject` | Done | `ProjectCrudTest`, `ProjectUploadTest` |
| hlm. 9 data uji | 12 project, 5 kategori, 31 teknologi | Done | `ProjectSeeder`, Tabel 1 |
| hlm. 10 alasan langkah tambahan | slug kategori/teknologi, pivot, relasi | Done | laporan 3.1 |
| hlm. 11 slug kategori dan technology | migration P10 `categories`/`technologies` | Verified | `migrate:status`, model Category/Technology |
| hlm. 12 tabel pivot | `project_technology` | Verified | laporan 3.1, relasi `belongsToMany` |
| hlm. 13 default `make:migration` | pivot tanpa `id()` dan `timestamps()` | Verified | migration P10 |
| hlm. 14 relasi pivot | `Project::technologies()`, `Technology::projects()` | Done | laporan 3.1 |
| hlm. 15 simpan technologies | `sync()` dari form admin | Done | `ProjectCrudTest`, `ProjectSeeder` |
| hlm. 16 query parameter | `$request->integer()`, `$request->string()`, `filled()` | Done | laporan 3.2 |
| hlm. 17 query dinamis | `when()` bertahap | Done | laporan 3.2 |
| hlm. 18 search + filter | `search()`, `categorySlug()`, `technologySlug()` | Done | laporan 3.2, `ProjectSearchFilterTest` |
| hlm. 19 sorting + pagination | `sorted()`, `paginate()`, `withQueryString()` | Done | laporan 3.3 |
| hlm. 20 form Blade | form GET, select kategori/teknologi, sort, per page | Done | laporan 3.2–3.3 |
| hlm. 21 link pagination | `links()` dan empty state | Done | laporan 3.2–3.3 |
| hlm. 22 route detail slug | route `{project:slug}` dan `getRouteKeyName()` | Done | laporan 3.4 |
| hlm. 23 controller detail | `ProjectController@show`, draft 404/admin preview | Done | laporan 3.4, `PublicPageTest` |
| hlm. 24 pengujian | feature test search, filter, sort, pagination, query string | Done | `php artisan test` |
| hlm. 25–30 troubleshooting | kasus tepi nyata diserap ke subbab terkait; tabel generik tidak dimasukkan | Done | laporan 3.2–3.5 |
| hlm. 31 Latihan | technology filter, `project_date`, count/reset, admin search/status | Done | laporan 3.2–3.5 |
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
- Perubahan desain dan nice-to-have di luar modul tidak dimasukkan ke laporan.
- Laporan mengikuti template dosen: A4, Times New Roman 11pt, spasi 1,5,
  margin 3/2/2/2 cm, penomoran “Bab”, header/footer, sitasi IEEE.
- Istilah teknis yang lazim dibaca dipertahankan dalam bahasa Inggris; prosa
  tetap bahasa Indonesia formal.

## Research

| Claim used | Supporting source | Notes/verification |
|---|---|---|
| Query parameter dapat dibaca dari request GET | Laravel HTTP Requests @laravel_requests | laporan 2.1, 3.2 |
| `when()` hanya menjalankan closure jika nilai truthy | Laravel Query Builder @laravel_queries | laporan 2.2, 3.2 |
| `whereHas()` menambahkan subquery `exists` pada relasi | Laravel Eloquent Relationships @laravel_eloquent | laporan 2.3, 3.2 |
| `with()` melakukan eager loading dan mengurangi N+1 | Laravel Eloquent Relationships @laravel_eloquent | laporan 2.4 |
| `paginate()` menghasilkan paginator dan `withQueryString()` mempertahankan query | Laravel Pagination @laravel_pagination | laporan 2.5, 3.3 |
| Route model binding memakai kolom dari `getRouteKeyName()` | Laravel Routing @laravel_routing | laporan 2.6, 3.4 |
| Validasi `in`, `url`, `nullable`, dan `exists` dijalankan di server | Laravel Validation @laravel_validation | laporan 2.7, 3.1 |
| Form GET dan directive Blade mempertahankan nilai lama | Laravel Blade @laravel_blade | laporan 2.1, 3.2 |
| `Str::slug()` membentuk slug dari judul | Laravel Strings @laravel_strings | laporan 2.6, 3.4 |
| Pencarian `LIKE` dipengaruhi kolasi database | MySQL String Comparison @mysql_like | laporan 3.2 |
| Format laporan: 11pt, 1,5 spasi, margin 3/2/2/2, Bab centered | Template LaTeX dosen `Template_Laporan_Praktikum_LabRPL_2025/main.tex` | format laporan |
| EYD V: istilah asing miring, kalimat pasif, ejaan baku | EYD V, Badan Bahasa | bahasa laporan |
| Penulisan explanation vs how-to | Diátaxis | struktur naratif |
| Sitasi IEEE | Konvensi prodi / IEEE | Daftar Pustaka |

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
| 2026-11-12 | `typst compile report.typ report.pdf` | 19 halaman, `lab-report:4.0.0`, tanpa warning font | `report.pdf` |
| 2026-11-12 | Render halaman PDF ke PNG 110 DPI | 19 halaman diperiksa; tidak ada tabel meluber, code block terbelah, atau heading yatim | `.runs/p11/` |
| 2026-11-12 | `typst compile examples/{minimal,full,ppwl}.typ` | tiga contoh 4.0.0 compile | `.runs/p11/` |
| 2026-11-12 | Compile p6/p8/p9/p10/compendium dengan 3.0.0 | laporan lama tetap compile; warning font `menlo` bukan error | `.runs/p11/` |
| 2026-11-12 | `typst fonts` | Times New Roman, DejaVu Sans Mono, Fira Code tersedia | `.runs/p11/` |
| 2026-11-12 | `php artisan route:list --path=projects` | 13 route publik/admin | `.runs/p11/` |

## Rubric self-review (v4)

| # | Criterion | Score | Note |
|---|---|---|---|
| 1† | Build | 2 | `typst compile` selesai; 4.0.0; tanpa warning font |
| 2† | Format | 2 | A4, Times New Roman 11pt, spasi 1,5, margin 3/2/2/2, “Bab”, header/footer |
| 3† | Structure | 2 | Pendahuluan, Dasar Teori, Hasil dan Pembahasan, Kesimpulan dan Saran, Daftar Pustaka; tanpa lampiran |
| 4† | Narrative | 2 | Setiap subbab menjelaskan apa, mengapa, bagaimana, hasil, dan pelajaran; tanpa meta-komentar |
| 5† | Task-based | 2 | Subbab 3.1–3.5 berbasis pekerjaan; testing dan Latihan diserap |
| 6† | Evidence | 2 | 86 test, screenshot, code, command, dan data uji |
| 7† | No meta tables | 2 | Hanya Tabel 1 (data uji) dan Tabel 2 (alur query); tidak ada tabel checklist/adaptasi |
| 8† | Citations | 2 | IEEE; `module_p11`, `repo_p11` full SHA, dokumentasi Laravel, MySQL |
| 9† | Figures/tables | 2 | Enam gambar dan dua tabel; caption lengkap; tidak meluber |
| 10† | Language | 2 | Bahasa Indonesia formal; istilah teknis tetap Inggris bila lebih natural; EYD V |
| 11† | Layout | 2 | Tidak ada code header yatim atau tabel meluber; TOC/TOF/TOT berurutan; beberapa jeda di akhir bab |
| 12† | Honesty | 2 | Data seed published; draft diuji lewat feature test; batas hasil dicatat |

Total 24/24 — lolos ship gate. Catatan: laporan turun dari 24 menjadi 19 halaman
setelah section meta dihapus; beberapa halaman berakhir lebih awal karena
chapter break dan figure yang tidak muat, bukan karena konten hilang.

## Human Follow-up

- [ ] Periksa kembali konsistensi istilah dan ejaan EYD V.
- [ ] Periksa apakah semua screenshot terbaca pada ukuran cetak.
- [ ] Periksa apakah ada klaim yang belum didukung evidence.
- [ ] Periksa kembali nomor halaman dan daftar gambar/tabel.
- [ ] Pastikan laporan tidak lagi terbaca seperti checklist penyelesaian modul.
- [ ] Periksa format template dosen: “Bab”, 11pt, spasi 1,5, margin 3/2/2/2.

## Oral-exam Practice

1. Mengapa `when()` lebih baik daripada rangkaian `if` manual pada query builder?
2. Apa yang terjadi di SQL ketika `whereHas('technologies')` dijalankan?
3. Mengapa `withQueryString()` penting saat pagination?
4. Mengapa route detail memakai slug dan apa risikonya jika slug berubah?
5. Apa perbedaan `paginate()` dan `get()` pada konteks `links()`?
6. Mengapa `with()` penting untuk menghindari masalah N+1?
