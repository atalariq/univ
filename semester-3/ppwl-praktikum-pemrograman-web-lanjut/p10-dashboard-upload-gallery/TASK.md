# PPWL Pertemuan 10 — Dashboard, File Upload, dan Gallery

Sumber otoritatif: `module.local.pdf` (28 halaman, "PPW2 - Pertemuan 10 - Dashboard
Upload dan Gallery").

## Cakupan modul

1. Dashboard dengan data agregat dan `count()` di basis data.
2. `DashboardController`, route `/post/dashboard`, dan komponen `StatCard`.
3. Layout admin dengan sidebar dan navbar.
4. CRUD skill, kategori, dan teknologi.
5. Upload thumbnail dan foto profil ke disk `public`.
6. Penghapusan file lama saat update dan file terkait saat project dihapus.
7. Relasi `ProjectImage`, multiple upload `images[]`, dan penghapusan gambar gallery.
8. `storage:link`, penjelasan disk `local` vs `public`, dan troubleshooting upload.
9. Tampilan gambar di Blade dengan `asset('storage/...')` dan atribut `alt`.

## Penugasan (wajib)

- Dashboard: card Published/Draft, Skill Teratas, dan `withCount()` per kategori.
- Halaman publik `/experience` dan `/education`.
- Validasi dimensi: thumbnail minimal 400x300, foto profil minimal 200x200.
- Edit caption gallery melalui route PUT dan batas 10 gambar per project.
- Halaman detail project publik `/projects/{slug}` berisi gallery grid.

## Catatan adaptasi

- Modul memakai contoh `/post` dan entitas `Post`; aplikasi memakai `/post` dan
  entitas `Project` agar konsisten dengan portofolio pertemuan 4--9.
- Kategori dan teknologi dilengkapi sebagai entitas yang diandaikan modul, dengan
  CRUD di area admin.
- Halaman `/experience` dan `/education` memakai model dan seeder, bukan array statis.
- Registrasi publik tetap ditutup sesuai pertemuan 9; akun admin berasal dari seeder.
