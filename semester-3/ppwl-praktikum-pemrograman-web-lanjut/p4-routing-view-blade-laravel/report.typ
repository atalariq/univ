#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2",

  mata-kuliah: "Praktikum Pemrograman Web Lanjutan",
  kode-mata-kuliah: "PPWL",
  nama-dosen-pengampu: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  no-pertemuan: "4",

  judul-praktikum: "Routing, View dan Blade Laravel",
)

#set page(
  paper: "a4",
  margin: 2.54cm,
)

#set document(
  title: vars.judul-praktikum,
  author: vars.nama,
)

#set text(
  font: "PT Serif",
  size: 12pt,
)

#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.10": *
#show: codly-init.with()
#codly(languages: codly-languages)

// #1 Cover
#align(center)[
  #upper(
    text(size: 14pt, weight: "bold")[
      LAPORAN PRAKTIKUM \
      #vars.mata-kuliah  \
      PERTEMUAN #vars.no-pertemuan \
      #vars.judul-praktikum
    ],
  )

  #v(1fr)

  #image(
    "assets/logo-UGM.png",
    width: 6cm,
  )

  #v(1fr)

  Disusun oleh:
  #table(
    columns: 3,
    align: left,
    stroke: none,
    [Nama], [:], [#vars.nama],
    [NIM], [:], [#vars.nim],
    [Kelas], [:], [#vars.kode-mata-kuliah\-#vars.kelas],
    [Dosen Pengampu], [:], [#vars.nama-dosen-pengampu],
  )

  #v(0.5fr)

  #upper(
    text(weight: "bold")[
      PROGRAM STUDI D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK \
      DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA \
      SEKOLAH VOKASI \
      UNIVERSITAS GADJAH MADA \
      YOGYAKARTA \
      2026
    ],
  )
]

#pagebreak()

// #2 Content

= Tujuan Praktikum

+ Mahasiswa mampu mengenali Routing, View dan Blade Laravel.
+ Mahasiswa mengetahui cara membuat Routing, View dan Blade Laravel.
+ Mahasiswa dapat menggunakan / menerapkan Routing, View dan Blade Laravel pada project.

= Dasar Teori

== Routing

Routing adalah alamat atau URL menuju halaman tertentu agar dapat diakses melalui web browser, memudahkan perpindahan dari halaman satu ke halaman lainnya @laravel_routing. Pada Laravel, route web didefinisikan di `routes/web.php`. Contoh route dasar:

```php
Route::get('/', fn() => view('home'))->name('home');
```

*Named route* (`->name('home')`) membuat URL di view tidak perlu hardcode string; bila URL diubah, semua blade yang memakai `route()` otomatis ikut berubah @laravel_routing.

== View

View adalah representasi visual halaman web yang menampilkan data yang diterima dari controller atau route @laravel_views. File view terletak di `resources/views/` dengan ekstensi `.blade.php` dan dipanggil lewat fungsi `view()`, misalnya `view('about')` memanggil `resources/views/about.blade.php`. Data dikirim ke view sebagai array, `with()`, atau `compact()`.

== Blade

Blade adalah template engine Laravel untuk templating yang dikompilasi ke PHP biasa dan di-cache hingga diubah, sehingga tidak menambah overhead saat aplikasi dijalankan @laravel_blade. Konsep utamanya adalah *template inheritance*: satu layout utama diwarisi banyak halaman anak lewat `@extends`, `@section`, `@yield`, dengan komponen kecil yang dipakai ulang lewat `@include`. Asset CSS/JS pada Laravel modern di-load lewat `@vite`, bukan `asset()` @laravel_vite.

#pagebreak()

= Hasil dan Pembahasan

Praktikum ini membangun website portfolio dengan Laravel 13, PHP 8.5, dan MySQL di lingkungan Lerd. Data portfolio diambil dari #link("https://github.com/atalariq/atalariq/blob/main/cv/main.typ")[CV] (Atalariq Barra Hadinugraha, Software Engineering UGM).

== Struktur Route

File `routes/web.php` didefinisikan dengan empat named routes sesuai penugasan:

```php
Route::get('/', fn() => view('home'))->name('home');
Route::get('/about', fn() => view('about'))->name('about');
Route::get('/education', fn() => view('education'))->name('education');
Route::get('/projects', fn() => view('projects'))->name('projects');
```

Pada implementasi akhir, setiap closure juga mengirim data CV sebagai array ke view (misalnya `$skills` untuk halaman about, `$projects` untuk halaman projects). Verifikasi dengan `php artisan route:list` menampilkan keempat route `home`, `about`, `education`, `projects` dengan method `GET|HEAD`.

#figure(
  image("assets/route-list.png"),
  caption: [Hasil perintah `php artisan route:list`.],
)

== Layout Utama dan Partial

Layout utama dibuat di `resources/views/layouts/app.blade.php`. Layout ini memuat `@vite(['resources/css/app.css', 'resources/js/app.js'])` di `<head>`, menyisipkan navbar dan footer lewat `@include`, serta menyediakan slot `@yield('title')`, `@yield('content')`, dan `@stack('scripts')`:

```php
<title>@yield('title', config('app.name'))</title>
@vite(['resources/css/app.css', 'resources/js/app.js'])
...
@include('partials.navbar')
@yield('content')
@include('partials.footer')
@stack('scripts')
```

Partial `resources/views/partials/navbar.blade.php` berisi seluruh link navigasi memakai named routes `{{ route('home') }}`, `{{ route('about') }}`, `{{ route('education') }}`, `{{ route('projects') }}`, dengan penanda aktif memakai `request()->routeIs()`. Partial `footer.blade.php` dan `card.blade.php` (kartu project) dipakai ulang lewat `@include`.

#figure(
  image("assets/views-structure.png"),
  caption: [Struktur folder views.],
)

== Halaman Home

`resources/views/home.blade.php` memakai `@extends('layouts.app')`, `@section('title', ...)`, `@section('content')`, dan `@push('scripts')`. Menampilkan nama, peran, ringkasan dari CV, serta CTA ke `route('about')` dan `route('projects')`.

#figure(
  image("assets/page-home.png"),
  caption: [Halaman Home.],
)

== Halaman About

`about.blade.php` menampilkan bio, email, kontak, dan daftar skills dengan `@foreach($skills as $category => $value)`.

#figure(
  image("assets/page-about.png"),
  caption: [Halaman About.],
)

== Halaman Education

`education.blade.php` me-loop array `$educations` dan `$organizations` dengan `@foreach` bersarang.

#figure(
  image("assets/page-education.png"),
  caption: [Halaman Education.],
)

== Halaman Projects

`projects.blade.php` memakai `@php($total = count($projects))`, `@forelse ... @empty ... @endforelse`, dan `@include('partials.card', ['project' => $project])` untuk tiap project.

#figure(
  image("assets/page-projects.png"),
  caption: [Halaman Projects.],
)

= Kesimpulan

Seluruh ketentuan tugas terpenuhi: empat halaman portfolio dengan route dan view, Blade templating (`layout`, `section`, `yield`, `include`), named routes untuk navigasi, dan asset di-load dengan `@vite`. Kode di-push ke repository pada branch `pertemuan4`.

#pagebreak()

// #3 Bibliography/References

// Make the title center
#show bibliography: it => {
  show heading: set align(center)
  it
}

#bibliography(
  "references.bib",
  title: "Daftar Pustaka",
  style: "institute-of-electrical-and-electronics-engineers",
)
