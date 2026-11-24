# PPWL Pertemuan 5 - Controller dan Model

- Buat Controller dan Model untuk `projects` (sesuai tugas portfolio sebelumnya). repo `ppwl-portfolio` (lihat `../AGENTS.md`)
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
| `route-list-projects.png`   | `php artisan route:list` bagian `projects.*`                                               |
| `page-projects-index.png`   | Halaman daftar `/projects`                                                                 |
| `page-project-show.png`     | Halaman detail `/projects/1`                                                               |
| `page-project-create.png`   | Form insert `/projects/create`                                                             |
| `form-validation-error.png` | Form dikirim kosong, pesan error tampil                                                    |
| `views-folder-structure.png`    | Struktur folder `resources/views` dengan folder `projects/`                                |
