# Tugas — Pertemuan 7: Eloquent ORM

Sumber otoritatif: `module.local.pdf` (slide "Eloquent ORM", 11 langkah + Latihan Praktikum).

## Cakupan modul (Langkah 1–11)

1. Model conventions & `php artisan model:show` (tabel, primary key, timestamps, koneksi).
2. Retrieving: `all()`, `get()` bersyarat, `find()`, `findOrFail()`, `first()`, `firstWhere()`, `firstOrFail()`, `exists()`.
3. Agregasi: `count()`, `max()`, `min()`, `sum()`, `avg()`.
4. Inserting: instansiasi+`save()`, `create()`, `firstOrCreate()`, `firstOrNew()`, `updateOrCreate()`.
5. Updating: ambil+`save()`, `update()`, mass update; deteksi perubahan `isDirty()`, `isClean()`, `wasChanged()`, `getOriginal()`.
6. Mass assignment protection: `$fillable` vs `$guarded`, `fill()`.
7. Deleting: `delete()`, `destroy()`, mass delete (tanpa model events).
8. Soft deletes: migrasi `softDeletes()`, trait `SoftDeletes`, `withTrashed()`, `onlyTrashed()`, `restore()`, `forceDelete()`, `trashed()`.
9. Query scopes (local scope): `scopeXxx(Builder $query)`, chaining.
10. Eloquent Collections: `count()`, `map()`, `pluck()`, `each()`, `filter()`, `isEmpty()`, `first()/last()`, `groupBy()`, `toArray()/toJson()`.
11. Model events & Observers: `boot()`, `static::creating()`, `php artisan make:observer`, registrasi di `AppServiceProvider`.

## Latihan Praktikum (wajib)

1. Buat scope `published()` di model (modul: `Post`; praktikum ini: `Project` — kelanjutan portofolio p4–p6) untuk memfilter data berstatus `published`. Tambahkan kolom `status` enum(`draft`, `published`) di migration.
2. Sempurnakan implementasi soft delete: tambahkan tombol "Trash" di halaman index untuk melihat data terhapus, beserta opsi **restore** dan **permanent delete**.

## Adaptasi entitas

Slide memakai contoh `Post`; seluruh rangkaian praktikum PPWL memakai website portofolio
(Tugas p4: halaman portfolio; Tugas p5: model/controller `projects`; Tugas p9: portofolio
CV terproteksi). Maka semua langkah diimplementasikan pada model `Project` tanpa
mengubah cakupan.
