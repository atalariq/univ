# Praktikum Pemrograman Web 2 — Roadmap Curi Start

## Overview

Roadmap ini disusun untuk Praktikum Pemrograman Web 2 (VTRPL2106 / SVPL214305), D-IV TRPL Sekolah Vokasi UGM. Berdasarkan analisis bank-soal UTS 2020/2021 dan 2021/2022, **stack yang dipakai adalah PHP + Laravel + MySQL + Bootstrap**. Dosen pengampu Dinar Nugroho Pratomo, dan soal ujian selalu praktis (bukan hanya teori) — kamu diminta membuat project Laravel nyata di saat ujian.

> **Verifikasi ke silabus/dosen**: Konfirmasi versi Laravel yang dipakai semester ini (kemungkinan Laravel 10 atau 11). Konsepnya sama, perintah Artisan dan struktur file tidak banyak berubah dari versi ke versi.

Fokus praktikum ini: membangun web app dinamis berbasis database mengikuti pola MVC, mulai dari inisialisasi project sampai data tampil di browser.

---

## Prasyarat

Sebelum masuk topik inti, pastikan hal-hal berikut sudah dikuasai dari Web 1 dan mata kuliah sebelumnya:

- **HTML & CSS dasar** — struktur halaman, form, tabel, layout sederhana
- **Bootstrap** — grid system, navbar, komponen form, tabel (class `.table`)
- **JavaScript dasar** — DOM manipulation, event listener (tidak harus mendalam, tapi jangan blank)
- **PHP dasar** — variabel, array, kondisional, loop, fungsi, dan `echo`
- **PHP OOP** — class, property, method, constructor, inheritance (prasyarat utama sebelum Laravel)
- **SQL & MySQL** — `SELECT`, `INSERT`, `UPDATE`, `DELETE`, relasi tabel, primary/foreign key
- **Command line dasar** — navigasi direktori (`cd`, `ls`), menjalankan perintah
- **Composer** — package manager PHP; harus sudah terinstall

Jika PHP OOP-mu masih lemah, perkuat itu dulu sebelum Laravel. Laravel sangat OOP-heavy.

---

## Topik Inti (urutan belajar)

Ikuti urutan ini — setiap topik jadi fondasi untuk topik berikutnya.

### 1. Refresh HTML/CSS/Bootstrap & PHP OOP

Ulangi CSS flexbox/grid, komponen Bootstrap (navbar, card, form, tabel), dan pastikan konsep class/object di PHP sudah melekat — karena controller, model, dan service di Laravel semuanya adalah class.

### 2. Server-Side Scripting & Pengenalan PHP MVC

Pahami perbedaan server-side vs client-side scripting (ini selalu keluar di UTS), lalu pelajari pola MVC secara manual tanpa framework: buat router sederhana, pisahkan controller dan view — ini bikin Laravel tidak terasa "magic".

### 3. Instalasi & Inisialisasi Project Laravel

Install Laravel via Composer (`composer create-project laravel/laravel nama-project`), pahami struktur direktori (`app/`, `routes/`, `resources/views/`, `.env`), dan hafalkan perintah Artisan dasar (`php artisan serve`, `php artisan make:controller`, `php artisan make:model`, `php artisan migrate`) — soal UTS minta tulis perintah ini lengkap dengan screenshot.

### 4. Routing & Controller

Daftarkan route di `routes/web.php`, arahkan ke method dalam controller dengan `Route::get('/path', [NamaController::class, 'namaMethod'])`, dan pahami konvensi penamaan controller (PascalCase, akhiran `Controller`).

### 5. Blade Templating & Integrasi Bootstrap

Buat layout Blade (`@extends`, `@section`, `@yield`), integrasikan Bootstrap via CDN atau `npm`, dan buat komponen navigasi yang bisa di-reuse di banyak halaman.

### 6. Database: Migrasi & Koneksi

Konfigurasi koneksi database di `.env` (`DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`), buat migration dengan `php artisan make:migration`, definisikan schema tabel di method `up()`, dan jalankan dengan `php artisan migrate`.

### 7. Eloquent ORM & CRUD

Buat Model dengan `php artisan make:model`, gunakan `Model::all()`, `Model::find($id)`, `Model::create()`, `$model->save()`, dan `$model->delete()` untuk operasi data; pahami `$fillable` untuk mass assignment.

### 8. Autentikasi

Gunakan Laravel Breeze (`composer require laravel/breeze`) untuk scaffold auth siap pakai (register, login, logout, middleware `auth`), atau pelajari cara manual dengan `Auth::attempt()` — pahami middleware untuk melindungi route.

### 9. REST API Dasar

Buat route di `routes/api.php`, return `response()->json()` dari controller, dan pahami konsep HTTP method (GET/POST/PUT/DELETE) serta status code — ini biasanya masuk UAS atau tugas akhir.

---

## Resource Kurasi

### Kanonik

Resource wajib — authoritative, selalu up to date.

- **Laravel Documentation** — [laravel.com/docs](https://laravel.com/docs) | [EN] [Gratis] | Referensi utama; baca section Routing, Controllers, Blade Templates, Migrations, Eloquent secara berurutan.

- **Laravel Bootcamp (Official)** — [bootcamp.laravel.com](https://bootcamp.laravel.com) | [EN] [Gratis] | Panduan resmi dari tim Laravel; membangun app "Chirper" dari nol sampai deploy, mencakup MVC, CRUD, auth. Tersedia versi Blade, Livewire, dan Inertia.

- **Laracasts — 30 Days to Learn Laravel** — [laracasts.com/series/30-days-to-learn-laravel-11](https://laracasts.com/series/30-days-to-learn-laravel-11) | [EN] [Gratis di YouTube juga] | Dibuat Jeffrey Way (founder Laracasts), 8 jam lebih, membangun job board app dari nol. Playlist YouTube resminya ada di [youtube.com/playlist?list=PL3VM-unCzF8hy47mt9-chowaHNjfkuEVz](https://www.youtube.com/playlist?list=PL3VM-unCzF8hy47mt9-chowaHNjfkuEVz).

- **PHP Documentation** — [php.net/docs.php](https://www.php.net/docs.php) | [EN/ID] [Gratis] | Referensi fungsi PHP; cukup buka saat butuh cek fungsi spesifik, tidak perlu dibaca linear.

### Hidden gems (verified by experts)

Resource di bawah ini kurang tersorot tapi kualitasnya tinggi dan ada jejak rekomendasi nyata dari orang yang dikenal di ekosistem PHP/Laravel.

---

**PHP: The Right Way**

- URL: [phptherightway.com](https://phptherightway.com)
- Format: Website referensi + ebook (Leanpub, gratis) | [EN] [Gratis]
- Ditulis oleh **Josh Lockhart** (creator Slim Framework) dan **Phil Sturgeon** (kontributor PHP besar). Di-highlight di [Hacker News (2024)](https://news.ycombinator.com/item?id=41159638) oleh komunitas developer senior.
- **Kenapa penting untuk PPW 2:** Sebelum terbiasa dengan "cara Laravel", kamu perlu tahu "cara PHP yang benar" — PSR standards, error handling, security. Soal CPMK2 di bank-soal menyebut _PHP sesuai standard PSR_ — ini sumber terbaiknya.

---

**Laravel Daily — YouTube Channel**

- URL: [youtube.com/c/LaravelDaily](https://www.youtube.com/c/LaravelDaily)
- Format: Video pendek-menengah | [EN] [Gratis]
- Dijalankan **Povilas Korop** (Laravel developer & educator sejak 2014). Direkomendasikan secara eksplisit oleh **JetBrains** di artikel ["The Best Laravel Tutorials and Resources for Developers" (2024)](https://blog.jetbrains.com/phpstorm/2024/07/the-best-laravel-tutorials-and-resources-for-developers-2/) sebagai resource untuk practical real-world use cases.
- **Kenapa penting:** Videonya pendek (5–15 menit), langsung ke masalah nyata seperti Eloquent relationships, validation tricks, controller refactoring — cocok untuk persiapan proyek/UTS saat tidak ada waktu nonton course panjang.

---

**LaravelDaily/laravel-tips (GitHub Repo)**

- URL: [github.com/LaravelDaily/laravel-tips](https://github.com/LaravelDaily/laravel-tips)
- Format: Markdown cheatsheet | [EN] [Gratis] | 5000+ GitHub stars
- Direkomendasikan langsung oleh **Povilas Korop** di [LinkedIn](https://lt.linkedin.com/posts/povilas-korop-laravel-developer_github-laraveldailylaravel-tips-awesome-activity-6996120719541555200-kVLJ). Berisi 250+ tips tentang Eloquent, Routing, Validation, Views, Migrations, dan Auth.
- **Kenapa penting:** Bisa di-_clone_ dan baca offline. Bagus untuk review cepat sebelum ujian — banyak trik kecil yang tidak ada di dokumentasi resmi.

---

**Web Programming UNPAS — Playlist Belajar Laravel**

- URL: [youtube.com/channel/UCkXmLjEr95LVtGuIm3l2dPg](https://www.youtube.com/channel/UCkXmLjEr95LVtGuIm3l2dPg)
- Format: Playlist video | [ID] [Gratis]
- Dibuat **Sandhika Galih**, dosen Teknik Informatika Universitas Pasundan. Masuk daftar ["14 Channel YouTube Programmer Indonesia yang Harus Subscribe" di petanikode.com](https://www.petanikode.com/youtube-programmer/). Playlist "Belajar Laravel 8" tersedia di channel.
- **Kenapa penting:** Satu-satunya resource bahasa Indonesia di list ini dengan kualitas pedagogis yang konsisten dan penjelasan MVC yang sangat runtut. Kalau penjelasan Inggris susah dicerna, mulai dari sini.

---

**Codecourse — Laravel Basics**

- URL: [codecourse.com/courses/laravel-basics](https://codecourse.com/courses/laravel-basics)
- Format: Video course (~2,5 jam) | [EN] [Sebagian Gratis, sebagian berbayar]
- Dibuat **Alex Garrett-Smith** (founder Codecourse, 300k+ YouTube subscribers). Direkomendasikan di [JetBrains Blog 2024](https://blog.jetbrains.com/phpstorm/2024/07/the-best-laravel-tutorials-and-resources-for-developers-2/) dan [artikel Cloudways](https://www.cloudways.com/blog/alex-garrett-smith-interview/).
- **Kenapa penting:** Pendekatan project-based murni — setiap konsep langsung diterapkan ke kode nyata. Cocok untuk yang lebih suka belajar sambil build daripada baca teori.

---

## Fokus Bank-Soal

Analisis dari UTS 2020/2021 (VTRPL2106) dan UTS 2021/2022 (SVPL214305), keduanya diampu Dinar Nugroho Pratomo:

**Stack terdeteksi:** PHP + Laravel + MySQL + Bootstrap (100% konsisten di kedua soal).

**Pola soal yang berulang:**

| Topik                                                                 | Bobot                | Muncul di |
| --------------------------------------------------------------------- | -------------------- | --------- |
| Teori konseptual (MVC, server-side vs client-side, PHP native vs OOP) | 10–30%               | Keduanya  |
| Inisialisasi project Laravel + screenshot perintah Artisan            | 20–30%               | Keduanya  |
| Koneksi ke database via `.env`                                        | 20%                  | 2021/2022 |
| Routes → Controller → View dengan menu Bootstrap                      | 50%                  | Keduanya  |
| Migration (buat tabel) + tampilkan data di view                       | Bagian dari soal 50% | 2021/2022 |

**Yang paling sering diuji (prioritaskan ini):**

1. **Hafalkan perintah Artisan** yang digunakan dari nol: `create-project`, `serve`, `make:controller`, `make:model`, `make:migration`, `migrate`, `make:auth` (atau Breeze). Di ujian kamu diminta tulis perintah + screenshot — tidak ada waktu googling.

2. **Route → Controller → View end-to-end**: Dari `routes/web.php` → method di controller → `return view('nama-view', $data)` → file Blade di `resources/views/`. Latih ini sampai bisa buat tanpa lihat referensi.

3. **Integrasi Bootstrap via layout Blade**: Satu file `layout.blade.php` dengan `@yield('content')`, di-extend halaman lain dengan `@extends + @section`. Plus navbar dengan 3 menu aktif.

4. **Database + Migration + Eloquent read**: `php artisan make:migration create_nama_table`, definisi kolom di `Schema::create()`, `php artisan migrate`, lalu `Model::all()` di controller → tampil di view dengan `@foreach`.

5. **Konsep teori (10–20% bobot tapi wajib benar)**: Server-side vs client-side scripting, apa itu MVC, perbedaan PHP procedural vs OOP/framework. Bisa dijawab 3–5 kalimat padat.

---

## Estimasi Waktu

Asumsi: sudah punya dasar Web 1 dan dasar PHP/OOP.

| Fase       | Topik                                                            | Estimasi       |
| ---------- | ---------------------------------------------------------------- | -------------- |
| Fondasi    | Refresh PHP OOP + koneksi ke Laravel mindset                     | 4–6 jam        |
| Core 1     | Instalasi, Artisan, struktur project, routing, controller, Blade | 8–10 jam       |
| Core 2     | Database, migration, Eloquent CRUD, koneksi `.env`               | 6–8 jam        |
| Core 3     | Autentikasi (Breeze), middleware, proteksi route                 | 4–5 jam        |
| Core 4     | REST API dasar (opsional, untuk UAS/proyek)                      | 4–6 jam        |
| Drill soal | Latihan buat project dari nol mengikuti pola soal UTS            | 4–6 jam        |
| **Total**  |                                                                  | **~30–40 jam** |

Realistis: 4–5 minggu dengan 1–1,5 jam belajar per hari. Kalau mau curi start dalam 2 minggu sebelum praktikum mulai, fokus di Core 1 dan Core 2 dulu — itu yang paling sering keluar.
