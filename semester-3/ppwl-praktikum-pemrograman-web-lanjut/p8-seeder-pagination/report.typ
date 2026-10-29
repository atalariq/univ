#import "@atalariq/lab-report:3.0.0": *

#set par(justify: true)

// Checkpoint box used after every step (spec v2).
#let check(body) = block(
  inset: 9pt,
  fill: luma(247),
  stroke: (left: 2pt + rgb("2457a7")),
  width: 100%,
)[*Periksa hasilnya.* #body]

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web Lanjutan",
  course-code: "PPWL",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "8",
  title: "Seeder dan Pagination",
  logo: image("assets/logo.png", width: 6cm),
)

#show: report.with(
  bib: bibliography("references.yaml"),
)

#cover(..metadata)

#toc()

= Tujuan Praktikum

+ Mahasiswa mampu membuat dan menjalankan seeder untuk mengisi data contoh.
+ Mahasiswa mampu mengganti `get()` menjadi `paginate()` dan menampilkan informasi halaman.
+ Mahasiswa mampu mempertahankan pencarian dan pilihan jumlah data per halaman saat berpindah halaman.

#pagebreak()

= Dasar Teori

== Seeder: mengisi basis data dengan data contoh

Migrasi membuat *struktur* tabel; seeder mengisi *baris* data contoh ke dalam tabel
yang sudah ada. Seeder adalah kelas di `database/seeders/` yang dijalankan oleh
`php artisan db:seed` atau dipanggil dari `DatabaseSeeder::run()` melalui
`$this->call([...])` @laravel_seeding. Karena `db:seed` dapat dijalankan berkali-kali,
seeder yang memakai `Model::create()` akan menambah baris baru setiap kali dijalankan;
tanpa pembersihan, 10 data menjadi 20 data. Modul menyarankan pembersihan tabel di
awal proses; pada praktikum ini pembersihan diletakkan di seeder pertama yang
dipanggil sehingga seluruh rangkaian seed bersifat *idempoten*.

== Faker dan data acak yang realistis

`fakerphp/faker` menghasilkan data palsu yang konsisten dengan skema: kalimat acak,
paragraf, dan sebagainya @faker. Dipakai lewat helper `fake()` di dalam seeder.
Judul acak dibuat dengan `fake()->unique()` agar tidak ada judul duplikat yang
membingungkan saat pengujian pencarian.

== Pagination di Laravel

`paginate(n)` mengembalikan objek `LengthAwarePaginator`: satu halaman data sekaligus,
bukan seluruh tabel. Laravel membaca parameter `?page=N` dari URL secara otomatis,
menjalankan satu query hitung total dan satu query `LIMIT`/`OFFSET` @laravel_pagination.
Method yang dipakai di view: `currentPage()`, `total()`, `perPage()`, `firstItem()`,
dan `links()`. `firstItem()` dibutuhkan untuk nomor urut yang berlanjut antar halaman:
pada halaman 2, item pertama bernomor 11, bukan 1.

== Mempertahankan status halaman di URL

Pencarian dan jumlah data per halaman adalah parameter query string. Agar keduanya
tidak hilang saat pengguna menekan tautan halaman, Laravel menyediakan
`withQueryString()` pada paginator; parameter yang ada disalin ke setiap tautan
halaman @laravel_pagination. Query string sendiri adalah bagian URL setelah `?`
sesuai RFC 3986 @rfc3986, sehingga nilai yang mengandung spasi perlu di-encode.

#pagebreak()

= Hasil dan Pembahasan

== Sebelum mulai

*Prasyarat.* PHP 8.5.12, Composer 2.10.3, Node.js 24.21.0 + npm 11.19.0, dan MariaDB
11 di `127.0.0.1:33060` (lingkungan devenv bersama). Aplikasi adalah portofolio
Laravel 13.32 dari pertemuan 4--6: route `projects` dengan resource controller,
model `Project` yang sudah memiliki `$fillable`, serta flash message dan konfirmasi
hapus dari pertemuan 6 @repo_p8.

*Starter kit.* Mulai dari kondisi pertemuan 6:

```sh
git clone https://github.com/atalariq/PPWL-my-portfolio.git
cd PPWL-my-portfolio
git checkout 3b0ed22ec31f80bb184028067e06d4a02ae39f5e
composer install && npm install
```

*Hasil akhir.* Halaman `/projects` menampilkan 10 data per halaman dengan nomor urut
yang berlanjut (halaman 2 mulai dari 11), formulir pencarian judul, pilihan 5/10/25
data per halaman, serta tautan pagination. Dua seeder mengisi 5 data kurasi dan 25
data acak yang dapat dijalankan ulang tanpa duplikasi.

*Batas cakupan.* Latihan pertemuan 7 (kolom `status`, scope `published()`, soft
delete + Trash) tidak termasuk dalam laporan ini; `$fillable` yang sudah ada dipakai
apa adanya. Laporan ini tidak mengklaim fitur di luar yang diperiksa pada langkah 4.

*Modul.* Laporan mengikuti urutan modul "Seeder dan Pagination" @module_p8, dengan
satu perbedaan wajib: seluruh contoh `Post` diterapkan pada model `Project` karena
portofolio pertemuan 4--6 sudah memakai `projects`.

*Tentang kode dan gambar.* Kode akhir mengacu pada commit
`3b0ed22ec31f80bb184028067e06d4a02ae39f5e`. Seluruh gambar pada laporan ini adalah
screenshot ulang dari aplikasi yang dijalankan pada lingkungan di atas, kecuali
logo UGM. Versi perangkat lunak diukur dari `php -v`, `composer --version`,
`node -v`, dan `npm -v` pada sesi yang sama.

== 1. Menambahkan scope pencarian pada model

Buka `app/Models/Project.php`. Tambahkan `use Illuminate\Database\Eloquent\Builder;`
dan satu local scope berikut. Scope menjaga logika pencarian tetap di model, sehingga
controller tinggal memanggil `->search(...)`.

```php
public function scopeSearch(Builder $query, string $keyword): Builder
{
    return $query->where('title', 'like', "%{$keyword}%");
}
```

#check[`php artisan tinker` lalu `App\Models\Project::search('Menu')->count();`
mengembalikan angka, bukan error.]

== 2. Membuat seeder kedua berisi 25 judul acak

Buat berkas `database/seeders/ProjectTableSeeder.php` dengan
`php artisan make:seeder ProjectTableSeeder`, lalu isi:

```php
for ($i = 1; $i <= 25; $i++) {
    $title = fake()->unique()->sentence(3);

    Project::create([
        'title' => $title,
        'repo' => 'atalariq/'.str($title)->slug(),
        'description' => fake()->paragraph(),
    ]);
}
```

Seeder pertama (`ProjectSeeder`) tetap memuat 5 proyek kurasi; tambahkan
`Project::truncate();` di awal `run()` seeder tersebut agar rangkaian seed dapat
dijalankan ulang tanpa menumpuk data. Daftarkan keduanya di `DatabaseSeeder`:

```php
$this->call([
    ProjectSeeder::class,
    ProjectTableSeeder::class,
]);
```

#check[`php artisan db:seed` dua kali berturut-turut menghasilkan tepat 30 baris
(`Project::count()`), bukan 35 atau 60.]

== 3. Menjalankan ulang basis data dari nol

Perintah `php artisan migrate:fresh --seed` menghapus seluruh tabel, menjalankan
migrasi, lalu mengisi data. Perintah ini hanya dipakai pada basis data pengembangan
yang data aslinya sudah tercakup seeder.

```text
INFO  Seeding database.
Database\Seeders\ProjectSeeder ...... DONE
Database\Seeders\ProjectTableSeeder . DONE
```

#check[`php artisan tinker --execute='echo App\Models\Project::count();'` mencetak
`30`, dan `Project::latest()->first()->title` berupa kalimat acak.]

== 4. Mengubah `get()` menjadi `paginate()`

Pada `ProjectController@index`, baca parameter `per_page` (hanya 5/10/25 yang
diizinkan), terapkan scope pencarian bila ada, lalu paginate:

```php
$perPage = (int) $request->integer('per_page', 10);
$perPage = in_array($perPage, [5, 10, 25], true) ? $perPage : 10;

$query = Project::query();
if ($request->filled('search')) {
    $query->search($request->string('search'));
}

$projects = $query->latest()->paginate($perPage)->withQueryString();
```

`withQueryString()` menyalin `search` dan `per_page` ke setiap tautan halaman,
sehingga pencarian tetap aktif di halaman 2.

#check[`php artisan route:list --name=projects.index` tetap satu route; membuka
`/projects` menampilkan 10 data dan blok "Jumlah Data : 30".]

== 5. Menampilkan nomor urut, formulir, dan navigasi halaman

Pada `resources/views/projects/index.blade.php`, bungkus kartu dengan nomor urut
yang melanjutkan posisi item. Formulir pencarian dan pilihan jumlah data dikirim
dengan `GET` agar nilainya muncul di URL dan dapat dipertahankan paginator:

```blade
@forelse($projects as $index => $project)
    <span>{{ $projects->firstItem() + $index }}.</span>
    @include('partials.card', ['project' => $project])
@empty
    <p>There is no projects yet.</p>
@endforelse
```

```blade
Halaman : {{ $projects->currentPage() }}
Jumlah Data : {{ $projects->total() }}
Data Per Halaman : {{ $projects->perPage() }}
{{ $projects->links() }}
```

#check[Di `/projects`, baris terakhir halaman 1 bernomor 10 dan halaman 2 dimulai
dari nomor 11; URL halaman 2 memuat `?page=2`.]

#img(
  image("assets/page-projects-index.png"),
  caption: [Halaman pertama `/projects`: nomor 1--10, formulir pencarian, pilihan jumlah data, dan tautan halaman 1--3.],
)

== 6. Memeriksa pencarian dan pilihan jumlah data

Buka `/projects?page=2` untuk memastikan nomor urut melanjutkan. Lalu buka
`/projects?search=Menu&per_page=5`: kata kunci tetap tampil di formulir, hanya satu
data yang cocok, dan pilihan 5 data per halaman tetap terpilih.

#img(
  image("assets/page-projects-page-2.png"),
  caption: [Halaman kedua: nomor urut berlanjut 11--20, "Halaman : 2", dan "Showing 11 to 20 of 30 results".],
)

#img(
  image("assets/page-projects-search-per-page.png"),
  caption: [Pencarian "Menu" dengan 5 data per halaman: kata kunci tetap di formulir dan hasil tersaring menjadi 1 data.],
)

#check[Mengubah URL menjadi `/projects?page=99` menampilkan halaman kosong tanpa
galat, dan mengosongkan pencarian mengembalikan 30 data.]

#pagebreak()

= Cocokkan kode akhir

Tiga berkas berikut adalah inti perubahan pertemuan ini. Bandingkan hasil Anda dengan
isi berkas pada commit `3b0ed22`:

- `database/seeders/ProjectTableSeeder.php` — 25 data acak dengan `fake()->unique()`.
- `database/seeders/DatabaseSeeder.php` — memanggil `ProjectSeeder` lalu `ProjectTableSeeder`.
- `app/Http/Controllers/ProjectController.php` — `paginate()`, `search`, `per_page`,
  dan `withQueryString()`.

#pagebreak()

= Ringkasan penugasan

#tbl(
  caption: [Latihan modul dan bukti pemenuhannya pada laporan ini.],
  columns: (auto, 1fr, auto),
  [*Latihan*], [*Implementasi*], [*Bukti*],
  [Seeder kedua 25 judul acak], [`ProjectTableSeeder` + `fake()->unique()`], [Langkah 2--3],
  [Nomor urut berlanjut antar halaman], [`firstItem() + $index`], [Langkah 5, Gambar 2],
  [Pencarian tetap aktif saat pindah halaman], [`withQueryString()` + form GET], [Langkah 4, 6],
  [Jumlah data 5/10/25], [Whitelist `in_array($perPage, [5,10,25])` + `<select>`], [Langkah 4--6, Gambar 3],
)

#pagebreak()

= Adaptasi modul dan batas hasil

- Modul memakai contoh `Post`; praktikum menerapkan semua langkah pada `Project`
  sesuai kesinambungan portofolio pertemuan 4--6.
- Slide menyebut Laravel 10 pada modul lain; aplikasi ini memakai Laravel 13.32.
  Tidak ada API yang berubah untuk materi ini: `paginate()`, `withQueryString()`,
  `firstItem()`, dan seeder bekerja sama. Perbedaan versi dicatat pada tabel
  lingkungan di bagian awal.
- Nomor urut dihitung di view dari `firstItem()`, bukan dari kolom basis data;
  pendekatan ini tetap benar meskipun data difilter pencarian.
- Gambar pada laporan ini adalah screenshot ulang aplikasi yang berjalan; laporan
  tidak mengklaim pengujian yang tidak dilakukan.

#pagebreak()

= Kesimpulan

Seeder dan pagination menyelesaikan dua masalah modul: pengisian data contoh yang
cepat dan penyajian data dalam halaman terpisah. Rangkaian seeder dibuat idempoten
dengan pembersihan di awal, pencarian dipusatkan pada scope `search`, dan
`withQueryString()` menjaga status pencarian serta jumlah data per halaman saat
berpindah halaman. Seluruh perilaku diperiksa pada langkah 2--6 dengan hasil sesuai
indikator modul: 30 data seed, nomor urut berlanjut, pencarian tetap aktif, dan
jumlah per halaman berubah sesuai pilihan.
