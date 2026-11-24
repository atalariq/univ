# Pertemuan 11: Search, Filter, dan Sorting

Modul ini menambahkan kolom detail pada tabel `projects` lewat migration baru, bukan dengan mengubah migration lama: `slug` unik, `short_description`, `description`, `status` dengan default draft, `project_date`, `is_featured`, `project_url`, dan `repository_url`, semuanya nullable agar baris lama tetap aman (hlm. 3-6). Slug dibentuk dari nama memakai `Str::slug()` dan wajib masuk `$fillable` (hlm. 7).

Fitur pencarian dibangun dari query parameter (`search`, `category`, `sort`, `page`) yang dibaca dari request, lalu dirangkai bertahap dengan `when()` dan difilter lewat relasi memakai `whereHas()` (hlm. 16-18). Sorting ditangani `switch` dengan pilihan terbaru, terlama, dan A-Z, lalu `paginate(9)->withQueryString()` menjaga parameter tetap terbawa saat berpindah halaman (hlm. 19-21). Form pencarian memakai method GET dan mengisi ulang nilai lama dengan `request()` (hlm. 20).

Modul juga menambahkan tabel pivot `project_technology` dengan primary key gabungan serta relasi `belongsToMany` di kedua model, lalu mengganti detail route dari ID ke slug lewat `{project:slug}` (hlm. 12-14, 22). Bagian troubleshooting mendaftar gejala yang sering muncul, dari filter yang hilang di halaman 2, `links does not exist` karena memakai `get()`, sampai error 1075 akibat `$table->id()` yang tertinggal di migration pivot (hlm. 25-30).

Latihan mandiri meminta dropdown filter technology, sorting berdasarkan `project_date`, penghitung hasil beserta tombol reset, dan pencarian di area admin dengan filter status, dengan indikator bahwa semua kombinasi filter berjalan tanpa query N+1 (hlm. 31). Ringkasannya menegaskan empat hal: `when()` untuk query bersyarat, `whereHas()` untuk filter relasi, `withQueryString()` untuk menjaga filter, dan form pencarian dengan method GET (hlm. 32).

Laporan praktikum lengkap untuk pertemuan ini ada di `report.typ` beserta `report.pdf`, `diagrams.typ`, dan aset tangkapan layar. Catatan ini hanya menunjuk ke sana dan tidak menyalin isinya.

## Poin kunci

- Kolom baru ditambahkan lewat migration tambahan dan dibuat nullable (hlm. 3-6).
- `when()` merangkai kondisi bertahap, `whereHas()` memfilter lewat relasi (hlm. 17-18).
- `withQueryString()` menjaga search dan filter saat pindah halaman (hlm. 21).
- Pivot `project_technology` memakai primary key gabungan tanpa `id` dan `timestamps` (hlm. 12-13).
- Route detail memakai slug, dan project draft menghasilkan 404 (hlm. 22-23).

## Istilah

- Query parameter: pasangan kunci-nilai setelah `?` pada URL.
- `when()`: method yang menjalankan closure hanya bila nilainya terisi.
- `whereHas()`: filter berdasarkan keberadaan relasi yang cocok.
- Pivot: tabel penghubung untuk relasi many-to-many.
- Route model binding: pengambilan model otomatis dari parameter route.
- N+1 query: query berulang per baris yang dihindari dengan eager loading.

## Sumber

- `module.local.pdf`, hlm. 2-32.
- `report.typ` dan `report.pdf`, laporan praktikum pertemuan 11.
