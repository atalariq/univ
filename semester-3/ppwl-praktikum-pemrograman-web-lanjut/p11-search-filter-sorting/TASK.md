# PPWL Pertemuan 11 — Search, Filter, dan Sorting

Sumber otoritatif: `module.local.pdf` (32 halaman, "PPW2 - Pertemuan 11 - Search
Filter Sorting").

## Cakupan modul

1. Membaca query parameter dari URL.
2. Membangun query dinamis dengan `when()`.
3. Memfilter relasi dengan `whereHas()`.
4. Menambahkan sorting dan pagination.
5. Menjaga query string saat berpindah halaman.
6. Menambah kolom detail project: `short_description`, `project_date`,
   `is_featured`, `project_url`, dan `repository_url`.
7. Menampilkan detail project melalui slug.
8. Menyelesaikan Latihan: filter technology, sort `project_date`, jumlah hasil
   dan Reset, serta search admin dengan filter status.

## Penugasan dan Latihan (wajib)

- Minimal 10 project pada data uji; aplikasi memakai 12 project.
- Project berstatus `draft` tidak tampil di `/projects`.
- Filter kategori memakai slug kategori.
- Filter technology memakai slug technology.
- Sorting menyediakan pilihan terbaru, terlama, judul A–Z, dan `project_date`.
- Pagination memakai 9 item per halaman sebagai default dan menjaga query string.
- Form pencarian memakai metode GET.
- Halaman detail memakai slug, bukan ID.
- Latihan modul:
  - dropdown filter technology;
  - sort berdasarkan `project_date`;
  - teks jumlah hasil dan tombol Reset;
  - search di admin `/admin/projects` dengan filter status.

## Catatan adaptasi

- Modul memakai entitas `Post` dan kolom `name`; aplikasi memakai `Project` dan
  kolom `title` agar konsisten dengan portofolio pertemuan 4–10.
- Modul memakai `PortfolioController@projects`; aplikasi memakai
  `ProjectController@publicIndex`.
- Modul memakai route `{project:slug}`; aplikasi memakai `getRouteKeyName()`
  pada model `Project`, sehingga route tetap memakai slug.
- Modul memakai `attach()`; aplikasi memakai `sync()` agar teknologi yang tidak
  dipilih ikut dilepas.
- Area admin modul memakai `/post`; aplikasi memakai `/admin`.
- Sebagian kolom (`slug`, `status`, `description`, `thumbnail`) sudah ada dari
  pertemuan 10. Pertemuan 11 menambah kolom yang belum ada dan menyesuaikan
  kolom lama.
- Slug kategori/teknologi dan tabel pivot `project_technology` sudah dibuat pada
  pertemuan 10; laporan memverifikasi prasyarat tersebut, bukan menduplikasi
  migration.
- Project `draft` tetap dapat dipratinjau admin; tamu menerima 404.
- Data uji aplikasi seluruhnya berstatus `published`; perilaku draft diverifikasi
  melalui feature test.
- Perubahan desain, carousel, skills tanpa level, favicon, dan nice-to-have lain
  tidak dibahas karena bukan bagian modul pertemuan 11.

## Kode acuan

Commit final: `051d37003e67855f2c5a79c2aba7bafafe1b8ebf`.
