# PPWL Meeting 10 — Dashboard, File Upload, dan Gallery

## Module Checklist

| Module page/section | Change/file | Status | Evidence |
|---|---|---|---|
| hlm. 2 tujuan pembelajaran | dashboard, layout admin, thumbnail/avatar, hapus file lama, gallery, disk public | Done | laporan langkah 2–9 |
| hlm. 3 alur dashboard (`count()`, bukan `all()->count()`) | `DashboardController@index` | Done | laporan langkah 2, `DashboardTest` |
| hlm. 4 `make:controller DashboardController` + `make:component StatCard --view` | `app/Http/Controllers/DashboardController.php`, `resources/views/components/stat-card.blade.php` | Done | laporan langkah 2 |
| hlm. 5 `DashboardController` agregat + 5 project terbaru | `DashboardController@index` | Done | `page-dashboard.png` |
| hlm. 6 route `/post/dashboard` dalam middleware auth | `routes/web.php` | Done | `route:list` 31 route |
| hlm. 7 komponen `stat-card` (`@props`) | `resources/views/components/stat-card.blade.php` | Done | dashboard view |
| hlm. 8 pemakaian `<x-stat-card>` | `resources/views/post/dashboard/index.blade.php` | Done | `page-dashboard.png` |
| hlm. 9 layout sidebar + menu aktif + CRUD skills | `resources/views/layouts/admin.blade.php`, `SkillController` | Done | `page-project-edit-gallery.png`, `TaxonomyCrudTest` |
| hlm. 10 alur upload (enctype → validasi → store → path → link) | form project + `ProjectController@store` | Done | laporan langkah 5 |
| hlm. 11 disk public vs local | dasar teori + langkah 1 | Done | laporan, `storage:link` |
| hlm. 12 risiko `store()` tanpa disk `public` | troubleshooting/edge case langkah 1 dan 5 | Done | laporan |
| hlm. 13 `storage:link`, migrasi thumbnail, model `ProjectImage` | migrasi + `ProjectImage` | Done | `migrate:fresh --seed` |
| hlm. 14 `$fillable` project dan `ProjectImage` | `app/Models/Project.php`, `ProjectImage.php` | Done | test upload/gallery |
| hlm. 15 form upload `enctype` + `@csrf` | `resources/views/post/projects/create.blade.php` | Done | `page-project-edit-gallery.png` |
| hlm. 16 validasi thumbnail (`image`, `mimes`, `max`, `dimensions`) | `ProjectController@store` | Done | `check-thumbnail-dimensions.png`, `ProjectUploadTest` |
| hlm. 17 update + hapus file lama | `ProjectController@update` | Done | `ProjectUploadTest` |
| hlm. 18 hapus project + file + gallery + pivot | `ProjectController@destroy` | Done | `ProjectUploadTest`, `ProjectGalleryTest` |
| hlm. 19 relasi gallery `hasMany` + `ProjectImage` | `Project`, `ProjectImage` | Done | laporan langkah 7 |
| hlm. 20 multiple upload `images[]` + `images.*` | `ProjectGalleryController@store` | Done | `ProjectGalleryTest` |
| hlm. 21 hapus gambar gallery + cek kepemilikan | `ProjectGalleryController@destroy` | Done | `ProjectGalleryTest` |
| hlm. 22 tampilkan gambar dengan `asset('storage/...')` + `alt` | `portfolio/project.blade.php`, `partials/card.blade.php` | Done | `page-project-detail.png` |
| hlm. 23 pengujian upload/gallery | `tests/Feature/*` | Done | `composer test` 60 passed |
| hlm. 24–26 troubleshooting upload | laporan langkah 5–9 | Done | laporan |
| hlm. 27 latihan mandiri: Published/Draft, Skill Teratas, `withCount` kategori | dashboard | Done | `DashboardTest`, `page-dashboard.png` |
| hlm. 27 `/experience` dan `/education` | `PortfolioController`, model + seeder | Done | `page-experience.png`, `PublicPageTest` |
| hlm. 27 validasi dimensi thumbnail 400x300 dan avatar 200x200 | `ProjectController`, `ProfileUpdateRequest` | Done | `ProjectUploadTest`, `ProfileTest` |
| hlm. 27 edit caption PUT + batas 10 gambar | `ProjectGalleryController@update/store` | Done | `ProjectGalleryTest` |
| hlm. 27 detail publik `/projects/{slug}` + gallery grid | `Project::getRouteKeyName()`, `portfolio/project.blade.php` | Done | `page-project-detail.png` |
| hlm. 28 ringkasan | kesimpulan laporan | Done | laporan |

## Assumptions

- P10 dibangun di atas P9 commit `cc227ab` (Breeze, `/post`, `auth` + `admin`).
  Modul memakai `/post`; aplikasi memakai prefix yang sama.
- Entitas `Post` pada modul dipetakan ke `Project`; kategori dan teknologi
  dilengkapi sebagai entitas yang diandaikan modul.
- Kategori dan teknologi memakai CRUD penuh; skill juga. Modul hanya menunjukkan
  CRUD skill, tetapi dashboard membutuhkan tiga entitas tersebut.
- `/experience` dan `/education` memakai model + seeder. Data lama dari route
  closure dipindahkan ke `PortfolioController`.
- Registrasi publik tetap ditutup sesuai P9. Akun demo: `admin@example.com`
  (`password123`, role admin) dan `test@example.com` (`password`, role user).
- `public/storage` adalah symlink runtime (gitignored). Checkout Windows dapat
  membawa stub `XSym`; symlink dibuat ulang pada langkah 1.
- Screenshot diambil pada viewport 1280x900 dengan Playwright/Chromium. Gambar
  contoh (thumbnail, avatar, gallery) dibuat dengan ImageMagick untuk pengujian,
  bukan data pribadi.

## Research

| Claim used | Supporting source | Notes/verification |
|---|---|---|
| `count()` menjalankan agregasi di basis data; `all()->count()` memuat semua baris | Laravel Query Builder @laravel_queries | Langkah 2, dashboard |
| `withCount()` menambahkan `projects_count`; `with()` melakukan eager loading | Laravel Eloquent Relationships @laravel_eloquent | Langkah 2, `DashboardTest` |
| Komponen Blade anonim memakai `@props` dan dipanggil `<x-nama>` | Laravel Blade @laravel_blade_components | Langkah 2–3 |
| `store(path, 'public')` menyimpan path relatif; `storage:link` membuat URL publik | Laravel File Storage @laravel_filesystem | Langkah 1, 5–8 |
| `image`, `mimes`, `max`, `dimensions` memvalidasi berkas di server | Laravel Validation @laravel_validation | Langkah 5, `ProjectUploadTest` |
| `hasMany`/`belongsTo` dan `cascadeOnDelete` untuk relasi gallery | Laravel Eloquent Relationships @laravel_eloquent | Langkah 1, 7–9 |
| Route model binding memakai `getRouteKeyName()` | Laravel Routing @laravel_routing | Langkah 8, `PublicPageTest` |
| Unggahan publik perlu validasi tipe, ukuran, nama acak, dan pembatasan akses | OWASP File Upload Cheat Sheet @owasp_file_upload | Dasar teori, langkah 5 |
| Middleware `admin` membatasi area pengelolaan | Laravel Authorization @laravel_authorization | Langkah 2–4, `AuthTest` |

## Verification

| Date | Command/scenario | Concise result | Log (outside repository) |
|---|---|---|---|
| 2026-11-05 | `php artisan storage:link` | `public/storage -> storage/app/public` | `.runs/p10/` |
| 2026-11-05 | `php artisan migrate:fresh --seed` | 30 project, 4 kategori, 8 teknologi, 6 skill | `.runs/p10/` |
| 2026-11-05 | `composer test` | 60 passed (187 assertions) | `.runs/p10/tests-final.txt` |
| 2026-11-05 | `npm run build` | Vite build sukses | `.runs/p10/` |
| 2026-11-05 | `php artisan route:list --path=post` | 31 route admin | `.runs/p10/` |
| 2026-11-05 | `GET /post/dashboard` sebagai admin | 200; card agregat dan skill teratas | `page-dashboard.png` |
| 2026-11-05 | `GET /post/projects` sebagai admin | 200; status, kategori, gallery count | `page-projects-admin.png` |
| 2026-11-05 | `GET /post/projects/cloud-note-api/edit` | 200; thumbnail + 3 gambar gallery | `page-project-edit-gallery.png` |
| 2026-11-05 | `GET /projects/cloud-note-api` | 200; gallery grid tampil | `page-project-detail.png` |
| 2026-11-05 | Upload thumbnail 300x300 | Ditolak, pesan dimensi | `check-thumbnail-dimensions.png` |
| 2026-11-05 | Upload avatar 800x600 | Tersimpan, tampil di navbar/profil | `page-profile-avatar.png` |
| 2026-11-05 | `GET /experience` | 200; data dari seeder | `page-experience.png` |
| 2026-11-05 | `GET /projects` sebagai tamu | 200; hanya project published | `PublicPageTest` |
| 2026-11-05 | `GET /projects/{draft}` sebagai tamu | 404 | `PublicPageTest` |
| 2026-11-05 | `GET /projects/{draft}` sebagai admin | 200 dengan label Draft preview | `PublicPageTest` |
| 2026-11-05 | Upload gambar ke-11 | Ditolak, total tetap 10 | `ProjectGalleryTest` |
| 2026-11-05 | `typst compile report.typ report.pdf` | 26 halaman A4 | `report.pdf` |

## Rubric self-review (v3)

| # | Criterion | Score | Note |
|---|---|---|---|
| 1† | Build | 2 | Compile bersih; satu warning font `menlo` dari paket zebraw |
| 2† | Struktur | 2 | Cover, ToC/LoF/LoT, Tujuan, Dasar Teori, Hasil, Kesimpulan, Lampiran, Daftar Pustaka; pagebreak hanya di batas bagian |
| 3 | Kontinuitas | 2 | Satu paragraf kelanjutan P9 + commit `cc227ab`; tanpa tabel lingkungan/discovery |
| 4† | Kelengkapan langkah | 2 | Semua command `make:*`, migrasi, seeder, `storage:link`, `migrate`, `test`, `build` ditulis |
| 5† | Kode–repo | 2 | Kode dari commit `99b7082`; blok kode diberi path |
| 6 | Gambar | 2 | Enam screenshot ulang, PNG, caption lengkap; tanpa placeholder |
| 7† | Sitasi | 2 | `module_p10`, `repo_p10`, dokumentasi Laravel, OWASP |
| 8† | Modul vs realita | 2 | `/post`, `Project`, kategori/teknologi, experience/education dijelaskan |
| 9† | Penugasan | 2 | Published/Draft, Skill Teratas, `withCount`, dimensi, caption, batas 10, slug, gallery |
| 10† | Batas hasil | 2 | Batas cakupan dan edge case ditulis; tidak ada klaim di luar bukti |
| 11 | Kebersihan | 2 | Tidak ada `#check`; tidak ada TODO/dead code |
| 12 | Bibliografi | 2 | Satu `references.yaml`, key snake_case, tanggal akses |
| 13 | Verifikasi | 2 | Semua hasil punya command/bukti di tabel Verifikasi |
| 14 | Tidak ada callout | 2 | Hasil langkah memakai paragraf biasa |

Total 28/28 — lolos ship gate.

## Human Follow-up

- [ ] Salin `report.pdf` ke `artifacts/PPWL-B2-P10-557554-AtalariqBarraHadinugraha.pdf`
      bila slot submisi dibuka.
- [ ] Screenshot khusus pesan “batas 10 gambar” tidak diambil karena browser
      kehilangan flash setelah redirect; perilaku diverifikasi oleh
      `ProjectGalleryTest::test_eleventh_image_is_rejected` dan skenario manual
      (total akhir tetap 10). Ambil ulang bila dosen meminta bukti visual.
- [ ] Setelah clone baru, jalankan `php artisan storage:link`; symlink tidak ikut
      repository.
- [ ] Konfirmasi apakah halaman `/experience` dan `/education` perlu CRUD admin.
      Saat ini keduanya diisi melalui seeder sesuai penugasan.
- [ ] Ganti gambar contoh (thumbnail/avatar/gallery) dengan aset pribadi sebelum
      demonstrasi lisan bila diinginkan.

## Oral-exam Practice

1. **Mengapa dashboard memakai `count()` dan `withCount()`, bukan
   `all()->count()`?** `count()` dan `withCount()` menjalankan agregasi di basis
   data, sehingga aplikasi tidak memuat seluruh baris ke memori. `withCount()`
   menambahkan `projects_count` pada hasil kategori dan tetap bisa diurutkan
   (laporan langkah 2, `DashboardTest`).
2. **Mengapa file disimpan di disk `public` dan apa fungsi `storage:link`?**
   Basis data hanya menyimpan path; file fisik berada di `storage/app/public`.
   `storage:link` membuat symlink `public/storage` agar file dapat diakses browser
   melalui `asset('storage/'.$path)` (laporan langkah 1 dan 5).
3. **Apa yang terjadi jika form upload lupa `enctype` atau `$fillable` tidak
   memuat `thumbnail`?** Tanpa `enctype`, file tidak terkirim dan
   `$request->file('thumbnail')` bernilai `null`; tanpa `$fillable`, path tidak
   tersimpan meski file berhasil diunggah (laporan langkah 5).
4. **Bagaimana batas 10 gambar ditegakkan?** Controller menghitung total gambar
   tersimpan ditambah jumlah berkas masuk sebelum menyimpan. Jika total melebihi
   10, `ValidationException` dilempar dan tidak ada berkas yang disimpan
   (`ProjectGalleryController@store`, `ProjectGalleryTest`).
5. **Mengapa project draft menghasilkan 404 untuk tamu tetapi 200 untuk admin?**
   `ProjectController@show` memeriksa status dan role. Tamu tidak boleh melihat
   data yang belum terbit; admin memerlukan pratinjau sebelum publikasi
   (`PublicPageTest`).
