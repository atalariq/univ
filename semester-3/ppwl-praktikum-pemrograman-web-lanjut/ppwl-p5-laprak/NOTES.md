# PPWL Pertemuan 5 - Controller dan Model

- Buat Controller dan Model untuk `projects` (sesuai tugas portfolio sebelumnya). [my-portfolio](../PPWL-my-portfolio/)
- Buat halaman view untuk menampilkan daftar dan detail data project.
- Buat form insert untuk menambah data project baru.
- Tambahkan data dummy agar tampil di halaman web.
- Perintah yang dibutuhkan:

```sh
# Buat model + migration sekaligus
php artisan make:model Project --migration

# Buat controller resource
php artisan make:controller ProjectController --resource

# Jalankan migration setelah mengisi kolom di file migration
php artisan migrate

# Verifikasi route
php artisan route:list
```

## Screenshot yang dibutuhkan

Simpan seluruh file di `ppwl-pertemuan-5/assets/` dengan nama persis seperti berikut (dipakai sebagai placeholder di `report.typ`):

| File                        | Isi                                                                                        |
| --------------------------- | ------------------------------------------------------------------------------------------ |
| `make-artisan.png`          | Output `make:model Project --migration` dan `make:controller ProjectController --resource` |
| `migrate.png`               | Output `php artisan migrate`                                                               |
| `db-projects-table.png`     | Struktur tabel `projects` (`DESCRIBE projects;` atau phpMyAdmin)                           |
| `route-list-projects.png`   | `php artisan route:list` bagian `projects.*`                                               |
| `page-projects-index.png`   | Halaman daftar `/projects`                                                                 |
| `page-project-show.png`     | Halaman detail `/projects/1`                                                               |
| `page-project-create.png`   | Form insert `/projects/create`                                                             |
| `form-validation-error.png` | Form dikirim kosong, pesan error tampil                                                    |
| `views-structure-p5.png`    | Struktur folder `resources/views` dengan folder `projects/`                                |
