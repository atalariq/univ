# PPWL Pertemuan 5 - Controller dan Model

- Buat Controller dan Model untuk projects (sesuai tugas portfolio sebelumnya). [my-portfolio](../PPWL-my-portfolio/)
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
