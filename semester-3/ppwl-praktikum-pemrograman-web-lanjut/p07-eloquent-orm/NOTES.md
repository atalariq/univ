# Pertemuan 7: Eloquent ORM

Slide membuka dengan definisi ORM sebagai teknik menghubungkan tabel basis data relasional dengan objek di kode program: setiap baris menjadi satu instance model dan setiap kolom menjadi properti (hlm. 2). Eloquent adalah ORM bawaan Laravel. Empat keuntungannya: query ditulis dengan sintaks PHP, proteksi SQL injection lewat PDO parameter binding, hasil berupa objek Model atau Collection, dan dukungan relasi, model events, serta query scope (hlm. 3). Konvensi defaultnya adalah nama tabel plural snake_case, primary key `id` yang auto increment, kolom `created_at` dan `updated_at`, serta koneksi dari `.env`, semuanya bisa ditimpa lewat properti model (hlm. 4).

Alur kerjanya berjalan dari controller atau Tinker, diterjemahkan Eloquent menjadi query builder, dieksekusi ke basis data, lalu hasilnya dibungkus menjadi Collection atau single Model sebelum dikirim ke view atau JSON (hlm. 5). Sebelas langkah praktikum mengikuti alur itu. Retrieving memakai `all()`, `get()` bersyarat, `find()`, `findOrFail()`, `first()`, `firstWhere()`, `firstOrFail()`, dan `exists()` (hlm. 7-9); agregasi memakai `count()`, `max()`, `min()`, `sum()`, dan `avg()` (hlm. 10); penyimpanan punya lima cara, dari instansiasi dengan `save()` sampai `updateOrCreate()` (hlm. 11-13).

Pembaruan data bisa lewat ambil lalu `save()`, `update()` pada instance, atau mass update lewat query builder yang tidak memicu model events (hlm. 14). Perubahan state dideteksi dengan `isDirty()`, `isClean()`, `wasChanged()`, dan `getOriginal()` (hlm. 15). Mass assignment dijaga `$fillable` sebagai daftar putih atau `$guarded` sebagai daftar hitam, dan `fill()` mengisi properti tanpa menyimpan (hlm. 17). Penghapusan memakai `delete()`, `destroy()`, atau mass delete, dengan catatan hanya dua yang pertama memicu model events (hlm. 19).

Soft delete menyimpan `deleted_at` alih-alih membuang baris, diaktifkan lewat `$table->softDeletes()` dan trait `SoftDeletes`, lalu diakses dengan `withTrashed()`, `onlyTrashed()`, `restore()`, `forceDelete()`, dan `trashed()` (hlm. 21-22). Query scope lokal didefinisikan sebagai `scopeXxx(Builder $query)` dan bisa dirantai (hlm. 23-24). Bagian akhir membahas Collection helper seperti `pluck()`, `map()`, `filter()`, `groupBy()`, dan `toJson()` (hlm. 25), serta model events dan observer yang didaftarkan di `AppServiceProvider` (hlm. 26). Latihan praktikum meminta scope `published()` dengan kolom status enum dan tombol Trash berisi restore serta permanent delete (hlm. 27).

## Poin kunci

- ORM memetakan baris tabel ke instance model dan kolom ke properti (hlm. 2).
- Konvensi default: tabel plural, primary key `id`, timestamps, koneksi dari `.env` (hlm. 4).
- Tiga rute baca: `all()`, `get()` bersyarat, dan pencarian satu record dengan `findOrFail()` (hlm. 7-9).
- Mass assignment dijaga `$fillable` atau `$guarded` (hlm. 17).
- Mass update dan mass delete tidak memicu model events (hlm. 14, 19).
- Soft delete memakai `deleted_at`, `withTrashed()`, `restore()`, dan `forceDelete()` (hlm. 21-22).
- Query scope lokal memakai prefix `scope` dan bisa dirantai (hlm. 23-24).

## Istilah

- ORM: Object-Relational Mapping, pemetaan tabel relasional ke objek.
- Eloquent: ORM bawaan Laravel.
- Mass assignment: pengisian banyak kolom sekaligus dari array.
- `$fillable`: daftar kolom yang boleh diisi massal.
- Soft delete: penandaan terhapus lewat `deleted_at` tanpa membuang baris.
- Query scope: method model yang membungkus kondisi query agar dapat dipakai ulang.
- Observer: kelas terpisah yang menangani event siklus hidup model.

## Sumber

- `module.local.pdf`, hlm. 2-27.
- `TASK.md`, cakupan modul dan latihan praktikum.
