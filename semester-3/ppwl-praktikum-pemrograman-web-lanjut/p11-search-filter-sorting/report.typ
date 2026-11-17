#import "@atalariq/lab-report:4.0.0": *
#import "diagrams.typ": request-flow, erd, query-pipeline

#let labels = (
  cover-title: "LAPORAN PERTEMUAN",
  meeting: "Pertemuan",
  prepared-by: "Disusun Oleh:",
  name: "Nama",
  id: "NIM",
  class: "Kelas",
  lecturer: "Dosen Pengampu",
  toc: "Daftar Isi",
  tof: "Daftar Gambar",
  tot: "Daftar Tabel",
  figure: "Gambar",
  table: "Tabel",
  bibliography: "Daftar Pustaka",
  appendix: "Lampiran",
)

#let fig = img.with(supplement: [Gambar])
#let tab = tbl.with(supplement: [Tabel])

#let appendix-content = appendix(title: [Lampiran])[
  == Mise

  Mise adalah version manager dan task runner yang dapat mengelola
  beberapa bahasa sekaligus. Berkas `.mise.toml` mendefinisikan versi PHP,
  Node.js, dan tool lain yang dipakai proyek; perintah `mise install` membaca
  berkas tersebut dan memasang versi yang sesuai @mise.

  Versi PHP dan Node.js yang berbeda dapat menghasilkan perilaku
  yang berbeda. Mise menyimpan versi tool di dalam repositori, sehingga mesin
  pengembang, CI, dan server memakai versi yang sama. Dengan satu berkas,
  proyek tidak bergantung pada instalasi global yang mungkin berbeda di setiap
  mesin. Alternatifnya adalah asdf, nvm, phpenv, atau instalasi manual, tetapi
  Mise menangani PHP dan Node.js dalam satu konfigurasi.

  `mise install` memasang tool sesuai `.mise.toml`; `mise
  current` menampilkan versi aktif; `mise exec -- php artisan test` menjalankan
  perintah dengan versi yang sudah dipin. Jika terjadi masalah, `mise doctor`
  memeriksa konfigurasi dan integrasi shell.

  == Podman

  Podman adalah container engine yang menjalankan container OCI
  tanpa daemon dan dapat berjalan tanpa hak root. Podman menyediakan perintah
  yang kompatibel dengan Docker CLI dan dapat membaca `compose.yaml`
  @podman.

  Database MariaDB dapat dijalankan sebagai container terisolasi
  tanpa memasang server database di host. Container membuat lingkungan database
  mudah dibuat ulang, dihentikan, dan dihapus. Karena Podman dapat berjalan
  tanpa root, risiko keamanan dan konflik dengan layanan host lebih kecil.
  Alternatifnya adalah Docker, instalasi MariaDB native, atau SQLite; Podman
  dipilih karena tersedia di lingkungan pengembangan dan tidak membutuhkan
  daemon.

  `podman-compose -f compose.yaml up -d db` menjalankan service
  `db`; `podman ps` menampilkan container; `podman logs` membaca log; dan
  `podman-compose down` menghentikan container. Laravel terhubung ke database
  melalui `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, dan `DB_PASSWORD`
  pada `.env`. Volume container menyimpan data agar tidak hilang saat container
  dihentikan.

  == PHP dan Laravel

  PHP adalah bahasa server-side yang menjalankan aplikasi; Laravel
  adalah framework PHP yang menyediakan routing, controller, model, view,
  migration, validasi, dan testing @php_manual. Composer adalah dependency
  manager PHP yang memasang paket dan menghasilkan autoload @composer.

  PHP dan Laravel dipakai karena seluruh portofolio dibangun di
  atas stack tersebut. Laravel memberi struktur MVC, Eloquent untuk database,
  Blade untuk view, dan Artisan untuk perintah pengembangan. Composer membuat
  dependensi dapat direproduksi melalui `composer.json` dan `composer.lock`.

  `composer install` memasang dependensi; `php artisan
  key:generate` membuat application key; `php artisan migrate --seed`
  menjalankan migration dan seeder; `php artisan serve` menjalankan server
  pengembangan; `php artisan test` menjalankan test @laravel. Jika terjadi
  masalah, `php -v`, `php -m`, `composer diagnose`, dan `php artisan about`
  membantu memeriksa versi, ekstensi, dan konfigurasi.

  == Node.js dan Vite

  Node.js adalah runtime JavaScript yang juga menyediakan npm
  untuk mengelola paket frontend. Vite adalah build tool yang menyediakan dev
  server dan bundling produksi @node. Pada aplikasi ini, Vite membangun CSS
  dan JavaScript, termasuk Tailwind CSS.

  Frontend modern membutuhkan proses build untuk menggabungkan
  CSS, JavaScript, dan aset. Vite cepat saat pengembangan karena memakai dev
  server berbasis ES modules, dan menghasilkan bundle produksi yang
  dioptimalkan. Alternatifnya adalah Webpack, Parcel, atau CSS polos; Vite
  dipilih karena terintegrasi dengan Laravel dan konfigurasinya ringkas
  @vite.

  `npm ci` memasang dependensi dari `package-lock.json`;
  `npm run dev` menjalankan dev server; `npm run build` menghasilkan aset
  produksi di `public/build/`. Berkas `vite.config.js` menghubungkan Vite
  dengan `resources/css/app.css` dan `resources/js/app.js`.

  == MariaDB

  MariaDB adalah database relasional open source yang kompatibel
  dengan MySQL. MariaDB mendukung SQL, transaksi, foreign key, index, dan
  collation `utf8mb4` @mariadb.

  Data portofolio bersifat relasional: proyek memiliki kategori,
  teknologi, dan gambar. MariaDB menjaga integritas data melalui primary key
  dan foreign key, serta mendukung query yang dibutuhkan untuk search, filter,
  sorting, dan pagination. Alternatifnya adalah MySQL, PostgreSQL, atau SQLite;
  MariaDB dipilih karena kompatibel dengan stack praktikum dan mudah dijalankan
  di Podman.

  `php artisan migrate` membentuk skema; `php artisan db:seed`
  mengisi data; `php artisan migrate:status` memeriksa status migration.
  Collation `utf8mb4_unicode_ci` membuat pencarian `LIKE` tidak membedakan
  huruf besar-kecil. Jika terjadi masalah, periksa koneksi `.env`, log
  container, dan error SQL di `storage/logs/laravel.log`.

  == Ringkasan Lingkungan

  Tabel berikut merangkum tool yang dipakai, fungsinya, dan alasan
  pemilihannya.

  #tab(
    caption: [Tool yang digunakan pada lingkungan pengembangan.],
    columns: (1.2fr, 2.1fr, 3.1fr),
    header: ([Tool], [Fungsi], [Alasan]),
    [Mise], [Version manager], [Memin versi PHP dan Node.js dalam satu berkas],
    [Podman], [Container engine], [Menjalankan MariaDB tanpa instalasi host],
    [PHP 8.5], [Bahasa server-side], [Runtime Laravel],
    [Laravel 13], [Framework web], [MVC, Eloquent, Blade, Artisan],
    [Composer], [Dependency manager PHP], [Memasang paket dan autoload],
    [Node.js 24], [Runtime JavaScript], [Menjalankan tool frontend],
    [Vite], [Build tool], [Membangun CSS dan JavaScript],
    [MariaDB 11], [Database relasional], [Menyimpan data portofolio],
    align: (left, left, left),
    size: 9.5pt,
  )

  Secara keseluruhan, Mise menyiapkan versi PHP dan Node.js; Composer memasang
  dependensi PHP; npm memasang dependensi JavaScript; Podman menjalankan
  MariaDB; Artisan menjalankan migration, seeder, dan test; Vite membangun aset
  frontend. Kombinasi ini membuat lingkungan dapat direproduksi dan terisolasi.
]

#show: report.with(
  font: ("Times New Roman",),
  mono-font: ("DejaVu Sans Mono", "Fira Code", "Courier New"),
  font-size: 11pt,
  leading: 0.9em,
  lang: "id",
  region: "id",
  margin: (left: 3cm, right: 2cm, top: 2cm, bottom: 2cm),
  justify: true,
  first-line-indent: 1.27cm,
  heading-numbering: "bab",
  heading-align: center,
  heading-size: 20pt,
  code-theme: "thesis",
  code-size: 9pt,
  code-padding: 4pt,
  code-numbering: "",
  bib: bibliography("references.yaml", style: "ieee"),
  bib-title: [Daftar Pustaka],
  appendix: appendix-content,
  labels: labels,
)

#cover(
  title: [Search, Filter, dan Sorting],
  author: [Atalariq Barra Hadinugraha],
  id: [25/557554/SV/26192],
  class: [B2],
  course: [Praktikum Pemrograman Web Lanjutan],
  course-code: [PPWL],
  lecturer: [Achmad Choirudin Emcha, S.Kom., M.Eng.],
  meeting: [11],
  logo: image("assets/logo.png", width: 6cm),
  institution: (
    "D-IV Teknologi Rekayasa Perangkat Lunak",
    "Departemen Teknik Elektro dan Informatika",
    "Sekolah Vokasi",
    "Universitas Gadjah Mada",
    "Yogyakarta",
  ),
  year: 2026,
  labels: labels,
)

#toc(title: labels.toc)
#tof(title: labels.tof)
#tot(title: labels.tot)

= Pendahuluan

== Latar Belakang

Portofolio ini menyimpan proyek, kategori, teknologi, dan galeri yang telah
dibangun pada pertemuan sebelumnya. Pada pertemuan 10, halaman `/projects`
masih menampilkan seluruh proyek dalam satu daftar. Ketika jumlah proyek
bertambah, daftar tersebut sulit ditelusuri: pengguna harus menggulir seluruh
halaman untuk menemukan proyek tertentu, dan tidak ada cara untuk menyaring
berdasarkan kategori atau teknologi.

Pertemuan 11 menambahkan kemampuan discovery: pencarian teks, filter kategori
dan teknologi, sorting, pagination, serta halaman detail yang dapat dibuka
melalui slug. Perubahan ini menuntut query yang efisien, filter yang bertahan saat
berpindah halaman, dan hasil yang dapat direproduksi dari URL. Laporan ini membahas
implementasi tersebut pada aplikasi portofolio, dengan kode acuan commit
`051d370` @repo_p11.

== Tujuan Praktikum

+ Menjelaskan konsep PHP, Laravel, MVC, HTTP, SQL, Eloquent, query builder,
  dan testing yang dipakai pada aplikasi.
+ Membaca query parameter dari URL dan menghubungkannya dengan form `GET`.
+ Membangun query dinamis menggunakan `when()` tanpa rangkaian `if` yang
  berulang.
+ Memfilter proyek berdasarkan relasi kategori dan teknologi menggunakan
  `whereHas()`.
+ Menambahkan sorting dan pagination yang tetap menjaga query string.
+ Menampilkan halaman detail proyek melalui slug, bukan ID.
+ Memverifikasi perilaku pencarian, filter, sorting, pagination, dan detail
  melalui feature test.

#pagebreak()

= Dasar Teori

== PHP dan Pemrograman Server-Side

PHP (PHP: Hypertext Preprocessor) adalah bahasa pemrograman
server-side yang dieksekusi di server web. Kode PHP dapat disisipkan ke dalam
HTML dengan tag `<?php ... ?>`; server menjalankan kode tersebut, lalu mengirim
HTML, CSS, dan JavaScript hasilnya ke browser @php_manual. Karena eksekusinya
terjadi di server, pengguna tidak melihat kode PHP, hanya output yang
dihasilkan.

PHP dipakai untuk menghasilkan halaman dinamis, memproses form,
membaca dan menulis database, mengelola sesi dan autentikasi, serta menangani
upload file. Pada aplikasi ini, PHP menjadi bahasa runtime untuk Laravel:
setiap request masuk ke `public/index.php`, diproses oleh Laravel, lalu
dikembalikan sebagai respons HTTP @php_language. PHP juga memiliki ekosistem
paket yang besar melalui Composer, sehingga dependensi seperti Laravel dapat
dipasang dan diperbarui secara terkelola @composer.

Browser mengirim request ke web server, web server meneruskan
request ke PHP (misalnya melalui PHP-FPM), PHP menjalankan kode aplikasi, dan
hasilnya dikirim kembali sebagai respons. Di dalam kode, PHP menyediakan
variabel (`$request`), array (`$data`), fungsi (`function`), closure
(`function ($query) { ... }`), arrow function (`fn ($query) => ...`), class
(`Project`), method (`scopeSearch`), dan namespace (`App\Models`). Composer
memuat class secara otomatis melalui autoload, sehingga kode tidak perlu
memanggil `require` untuk setiap file @composer.

Beberapa konstruksi PHP muncul langsung di laporan ini. `$request->validate`
memvalidasi input; `collect($items)->map(...)->filter()->all()` mengubah array
menjadi collection, memetakan setiap elemen, membuang nilai kosong, lalu
mengembalikan array; `match ($sort) { ... }` memilih cabang berdasarkan nilai;
`auth()->check()` memeriksa apakah pengguna sudah login; `abort(404)`
menghentikan request dengan status 404; dan `view(...)->load(...)` memuat view
beserta relasi yang dibutuhkan. Memahami konstruksi ini penting karena kode
Laravel adalah kode PHP biasa yang dijalankan di server.

Masalah PHP yang umum adalah versi yang tidak sesuai,
ekstensi yang hilang, dan autoload Composer yang rusak. Perintah `php -v`
menampilkan versi, `php -m` menampilkan ekstensi, dan `composer diagnose`
memeriksa konfigurasi Composer. Ekstensi yang dibutuhkan Laravel antara lain
`pdo_mysql`, `mbstring`, `xml`, `fileinfo`, `openssl`, `tokenizer`, `ctype`,
dan `json` @php_manual. Jika ekstensi hilang, aplikasi dapat gagal saat membuka
halaman atau saat menjalankan migration.

== Laravel dan Arsitektur MVC

Laravel adalah framework PHP yang menyediakan routing, controller,
model, view, migration, validasi, autentikasi, testing, dan berbagai komponen
lain. Laravel menganut pola MVC: model mengelola data dan aturan bisnis, view
menangani presentasi, dan controller menghubungkan request dengan model serta
view @laravel_lifecycle. Laravel tidak memaksa MVC secara kaku, tetapi struktur
defaultnya mengarah ke pemisahan tanggung jawab tersebut.

Framework memberi struktur yang konsisten untuk aplikasi yang
bertambah besar. Routing, validasi, keamanan, dan testing sudah disediakan,
sehingga pengembang tidak perlu membangun semuanya dari nol. Eloquent
mempermudah akses database, Blade mempermudah template, dan Artisan
menyediakan perintah untuk migration, seeding, testing, dan diagnostik
@laravel. Pada aplikasi ini, Laravel dipakai karena seluruh portofolio sudah
dibangun di atasnya dan karena ekosistemnya mendukung kebutuhan pertemuan ini.

#fig(
  request-flow(),
  caption: [Alur satu request pencarian dari browser sampai database.],
)


Request masuk melalui `public/index.php`, melewati bootstrap
aplikasi, HTTP kernel, middleware, router, lalu diteruskan ke controller.
Controller dapat memanggil model Eloquent, menyiapkan data, dan mengembalikan
view Blade atau respons JSON @laravel_lifecycle. Service container menangani
dependency injection, sedangkan facade menyediakan akses statis ke service
tertentu. Struktur yang relevan pada aplikasi ini adalah `routes/web.php` untuk
route, `app/Http/Controllers/ProjectController.php` untuk controller,
`app/Models/Project.php` untuk model, `resources/views/portfolio/` untuk view,
serta `database/migrations/` dan `database/seeders/` untuk skema dan data.

Artisan adalah CLI Laravel. Perintah `php artisan route:list` menampilkan
route, `php artisan about` menampilkan konfigurasi lingkungan, `php artisan
migrate` menjalankan migration, `php artisan db:seed` menjalankan seeder, dan
`php artisan test` menjalankan test @laravel_artisan. Perintah-perintah ini
dipakai pada bagian hasil dan pembahasan.

Jika halaman menampilkan error 500, periksa
`storage/logs/laravel.log`, nilai `APP_DEBUG`, dan permission direktori
`storage` serta `bootstrap/cache`. Jika perubahan konfigurasi atau view tidak
terbaca, jalankan `php artisan config:clear`, `php artisan view:clear`, atau
`php artisan route:clear`. `php artisan about` membantu memastikan versi PHP,
Laravel, dan driver database yang aktif @laravel.

== HTTP, URL, dan Query String

HTTP adalah protokol request-response yang dipakai browser dan
server untuk bertukar data. Browser mengirim request dengan method, URL,
header, dan kadang body; server mengembalikan respons dengan status code,
header, dan body @mdn_http. URL terdiri atas scheme, host, path, query string,
dan fragment. Query string adalah bagian setelah tanda tanya yang berisi
pasangan kunci-nilai, misalnya `?search=laravel&category=web` @mdn_url.

Method `GET` dipakai untuk membaca data karena bersifat safe dan
idempotent: request yang sama dapat diulang tanpa mengubah state server, dan
URL-nya dapat dibagikan, di-bookmark, serta dimuat ulang @mdn_http_methods.
Method `POST` dipakai untuk mengubah data, misalnya membuat atau memperbarui
proyek. Karena pencarian, filter, sorting, dan pagination hanya membaca data,
seluruh kontrolnya memakai `GET`. Konsekuensinya, state halaman terlihat di URL
dan dapat direproduksi.

Browser mengirim `GET /projects?search=laravel&category=web`.
Laravel membaca query string melalui objek request: `$request->query('search')`,
`$request->string('search')`, `$request->integer('per_page')`, dan
`$request->filled('search')` @laravel_requests. Nilai query string di-encode:
spasi menjadi `%20` atau `+`, dan karakter khusus di-encode agar tidak
bertabrakan dengan pemisah `&` atau `=`. Server merespons dengan status code
seperti 200 (OK), 302 (redirect), 404 (tidak ditemukan), atau 500 (error
server). Status 419 muncul ketika token CSRF tidak cocok pada request `POST`.

Status 404 biasanya berarti route tidak cocok atau model
tidak ditemukan; status 419 berarti token CSRF hilang atau kedaluwarsa; status
500 berarti ada exception di server. Jika query string hilang, periksa nama
input pada form, method form, dan pemanggilan `request()` di controller. Jika
URL ter-encode aneh, periksa karakter khusus dan encoding browser. Route yang
lebih spesifik harus dideklarasikan sebelum route dinamis agar tidak tertangkap
oleh parameter @laravel_routing.

== Database Relasional dan SQL

Database relasional menyimpan data dalam tabel yang terdiri atas
baris dan kolom. Setiap baris adalah satu record, setiap kolom memiliki tipe
data, dan setiap tabel memiliki primary key yang membedakan baris. Foreign key
menghubungkan baris di satu tabel dengan baris di tabel lain. Relasi
one-to-many menghubungkan satu baris dengan banyak baris; relasi many-to-many
membutuhkan tabel pivot yang berisi dua foreign key @mariadb.

Data portofolio bersifat relasional: satu proyek memiliki satu
kategori, banyak teknologi, dan banyak gambar; satu teknologi dapat dipakai
oleh banyak proyek. Database relasional menjaga integritas data melalui primary
key, foreign key, dan constraint. SQL menyediakan cara standar untuk membaca,
menyaring, mengurutkan, dan menggabungkan data. MariaDB dipakai karena
kompatibel dengan MySQL, open source, dan mendukung fitur yang dibutuhkan
Laravel @mariadb.

#fig(
  erd(),
  caption: [Relasi tabel proyek, kategori, dan teknologi pada aplikasi portofolio.],
)


Perintah SQL yang relevan adalah `SELECT` untuk membaca kolom,
`WHERE` untuk menyaring baris, `LIKE` untuk mencocokkan pola teks, `JOIN` untuk
menggabungkan tabel, `EXISTS` untuk memeriksa keberadaan baris pada subquery,
`ORDER BY` untuk mengurutkan, serta `LIMIT` dan `OFFSET` untuk mengambil satu
halaman @mysql_select. Relasi many-to-many pada aplikasi ini memakai tabel
`project_technology` dengan primary key gabungan `project_id` dan
`technology_id`; kombinasi tersebut mencegah baris ganda. Foreign key memakai
`cascadeOnDelete` agar baris pivot ikut terhapus ketika proyek atau teknologi
dihapus @mysql_join.

Pencarian `LIKE '%laravel%'` mencocokkan substring pada kolom teks. Apakah
pencarian membedakan huruf besar-kecil bergantung pada collation database.
MariaDB dengan `utf8mb4_unicode_ci` tidak membedakan huruf besar-kecil,
sedangkan collation yang berakhiran `_bin` membedakannya @mysql_like. Hal ini
menjelaskan mengapa pencarian `laravel` dapat menemukan `Laravel` pada data uji.

Error `Unknown column` berarti nama kolom tidak ada atau
migration belum dijalankan. `SQLSTATE` dengan kode tertentu menunjukkan masalah
constraint, misalnya foreign key atau duplicate entry. Jika hasil query
berganda, periksa `JOIN` yang menghasilkan baris ganda dan pertimbangkan
`whereHas` atau `distinct`. Jika pencarian tidak menemukan huruf besar, periksa
collation kolom dan database. Jika data hilang setelah migration, periksa
urutan migration dan apakah kolom baru bersifat `nullable`.

== Eloquent ORM dan Query Builder

ORM (Object-Relational Mapping) memetakan tabel database ke class.
Setiap instance class mewakili satu baris, dan setiap atribut mewakili kolom.
Eloquent adalah ORM Laravel; model seperti `Project` mewarisi `Model` dan
menyediakan method untuk membaca, menyimpan, serta menghubungkan data
@laravel_eloquent. Query builder adalah API fluent untuk membangun query SQL
tanpa menulis SQL mentah. Eloquent memakai query builder di belakang layar.

Eloquent membuat kode lebih terbaca dan aman karena nilai di-bind
sebagai parameter, bukan disisipkan langsung ke string SQL. Relasi seperti
`belongsTo`, `hasMany`, dan `belongsToMany` mempermudah navigasi data. Scope
mengemas constraint yang sering dipakai, sehingga controller tidak berisi query
panjang. Query builder juga menyediakan `when()`, `whereHas()`, dan `with()`
yang menjaga query tetap ekspresif @laravel_queries.

`Project::query()` memulai query builder untuk model `Project`.
`where()` menambahkan kondisi, `when($condition, $callback)` hanya menambahkan
kondisi jika `$condition` benar, dan `whereHas('relation', $callback)`
menambahkan subquery `exists` untuk memfilter berdasarkan relasi
@laravel_eloquent. `with(['category', 'technologies', 'images'])` melakukan
eager loading, yaitu memuat relasi dalam beberapa query tambahan agar tidak
terjadi N+1. `paginate($perPage)` menjalankan query hitung dan query data dengan
`LIMIT` serta `OFFSET`, lalu mengembalikan paginator @laravel_pagination.
`withQueryString()` menambahkan query string aktif ke tautan pagination.

Pada aplikasi ini, scope `scopeSearch`, `scopeCategorySlug`,
`scopeTechnologySlug`, dan `scopeSorted` mengemas logika query. `$fillable`
menentukan kolom yang boleh diisi secara massal, `casts` mengubah tipe atribut
(misalnya `project_date` menjadi date), dan `getRouteKeyName()` menentukan
kolom yang dipakai untuk route model binding. Relasi many-to-many memakai
`belongsToMany`, dan `sync()` memperbarui daftar relasi dengan menambahkan atau
menghapus baris pivot sesuai pilihan.

Jika kolom baru tidak tersimpan, periksa `$fillable`. Jika
halaman memicu banyak query, periksa relasi yang belum dimuat dengan `with()`.
Jika filter relasi menggandakan baris, gunakan `whereHas()` alih-alih `join`.
Jika `links()` tidak tersedia, pastikan controller mengembalikan paginator dari
`paginate()`, bukan collection dari `get()`. Jika filter hilang saat pindah
halaman, periksa `withQueryString()` sebelum `links()`.

== Search, Filter, Sorting, dan Pagination

Search mencari record yang teksnya cocok dengan kata kunci. Filter
membatasi hasil berdasarkan atribut atau relasi, misalnya kategori dan
teknologi. Sorting menentukan urutan hasil, misalnya berdasarkan tanggal atau
judul. Pagination membagi hasil menjadi beberapa halaman agar tidak semua baris
dimuat sekaligus @laravel_pagination.

Ketika jumlah proyek bertambah, daftar tunggal menjadi sulit
ditelusuri. Search dan filter membantu pengguna menemukan proyek yang relevan;
sorting membantu melihat proyek terbaru atau terlama; pagination menjaga waktu
muat dan jumlah data yang dikirim ke browser. Karena state disimpan di query
string, pengguna dapat membagikan URL hasil pencarian dan kembali ke halaman
yang sama.

Search memakai `LIKE` pada `title`, `short_description`, dan
`description`; ketiganya dikelompokkan dalam closure agar kondisi `OR` tidak
bocor ke kondisi lain. Filter kategori dan teknologi memakai `whereHas()` pada
relasi, sehingga database memeriksa keberadaan relasi tanpa menggandakan baris
proyek. Sorting memakai `orderBy()` atau `orderByDesc()`; aplikasi menyediakan
urutan terbaru, terlama, judul A–Z, dan `project_date`. Pagination memakai
`paginate(9)` dengan pilihan 9, 18, atau 27 item per halaman; `links()` merender
navigasi, dan `withQueryString()` mempertahankan filter pada tautan halaman
berikutnya. Jika tidak ada hasil, view menampilkan empty state dan tombol

#fig(
  query-pipeline(),
  caption: [Pipeline query dari pencarian sampai pagination.],
)

Reset.

Jika filter hilang saat pindah halaman, periksa
`withQueryString()`. Jika `links does not exist`, ganti `get()` dengan
`paginate()`. Jika jumlah hasil tidak sesuai, periksa `total()` pada paginator
dan kondisi query. Jika pencarian tidak menemukan huruf besar, periksa
collation database. Jika halaman kedua kosong, periksa `per_page` dan jumlah
data.

== Route, Controller, dan Route Model Binding

Route memetakan URL dan method HTTP ke handler. Controller adalah
class yang menangani request dan mengembalikan respons atau view. Route model
binding adalah fitur Laravel yang mengubah parameter route menjadi instance
model secara otomatis @laravel_routing. Jika parameter route adalah
`{project:slug}`, Laravel mencari `Project` berdasarkan kolom `slug`.

Pemisahan route, controller, dan model menjaga kode tetap
terorganisasi. Route mendefinisikan antarmuka URL; controller mengatur alur
request; model mengelola data. Route model binding mengurangi boilerplate
karena controller tidak perlu memanggil `Project::where('slug', $slug)->first()`
secara manual. Jika model tidak ditemukan, Laravel otomatis mengembalikan 404
@laravel_controllers.

Route publik dideklarasikan di `routes/web.php`:
`Route::get('/projects', [ProjectController::class, 'publicIndex'])` dan
`Route::get('/projects/{project:slug}', [ProjectController::class, 'show'])`.
Method `show(Project $project)` menerima instance `Project` yang sudah dicari
berdasarkan slug. Controller memeriksa status proyek: jika `draft` dan pengguna
bukan admin, `abort(404)` dipanggil. Jika boleh dilihat, controller memuat
relasi dengan `load(['category', 'images', 'technologies'])` dan mengembalikan
view `portfolio.project`. Nilai slug dibentuk dengan `Str::slug()`
@laravel_strings. Method `getRouteKeyName()` pada model menentukan kolom route
key default, sehingga route juga dapat memakai `{project}` tanpa menulis
`:slug`.

Jika muncul `Missing required parameter`, periksa nama
parameter route dan pemanggilan `route()`. Jika slug `null`, isi slug untuk data
lama dan pastikan model membentuk slug saat menyimpan. Jika proyek draft selalu
404, periksa status dan hak admin. Jika route lama masih memakai ID, periksa
`getRouteKeyName()` dan definisi route. Setelah mengubah route, jalankan
`php artisan route:clear` jika route ter-cache.

== Blade, Form, dan View

Blade adalah template engine Laravel. File `.blade.php` berisi HTML
dan directive Blade yang dikompilasi menjadi PHP. Blade menyediakan escape
output, kondisi, loop, komponen, dan slot @laravel_blade. View adalah tampilan
yang dikembalikan controller; komponen memecah UI menjadi bagian yang dapat
dipakai ulang.

Blade memisahkan presentasi dari logika controller. Escape `{{ }}`
membantu mencegah XSS, directive seperti `@foreach` dan `@if` membuat template
lebih ringkas, dan komponen seperti `x-project-card` mengurangi duplikasi. Form
`GET` mempertahankan nilai filter di URL, sehingga pengguna dapat melihat dan
membagikan state halaman @laravel_views.

Form filter memakai `method="GET"`, `action` ke route
`projects.index`, dan input dengan nama `search`, `category`, `technology`,
`sort`, serta `per_page`. Nilai input diisi dengan `request('search')` agar
tetap terlihat setelah submit. Select memakai `@selected(request('category') ===
$category->slug)` untuk menandai pilihan aktif. Hasil pencarian dirender dengan
`@forelse ($projects as $project)`, `x-project-card`, dan `@empty` untuk empty
state. `{{ $projects->links() }}` merender navigasi pagination. Untuk form
`POST`, Blade menyediakan `@csrf` dan `@method` untuk metode spoofing.

Jika variabel tidak dikenal, periksa nama variabel yang
dikirim controller. Jika HTML ter-escape dua kali, periksa penggunaan `{{ }}`
dan `{!! !!}`. Jika form `POST` menghasilkan 419, periksa `@csrf`. Jika metode
form tidak sesuai, periksa `@method`. Jika komponen tidak ditemukan, periksa
nama file di `resources/views/components/` dan namespace komponen.

== Validasi, Migration, dan Seeder

Validasi memeriksa input sebelum disimpan. Migration adalah
perubahan skema database yang tercatat dan dapat dijalankan ulang. Seeder
mengisi database dengan data awal atau data uji @laravel_validation. Ketiganya
bekerja bersama: migration membentuk tabel, seeder mengisi data, dan validasi
menjaga input agar sesuai dengan skema.

Validasi di sisi server mencegah data tidak valid masuk ke
database, meskipun validasi di sisi klien dilewati. Migration membuat skema
dapat direproduksi di mesin lain dan memudahkan rollback. Seeder menyediakan
data uji yang konsisten, sehingga pencarian, filter, sorting, dan pagination
dapat diuji dengan jumlah data yang cukup @laravel_migrations.

`$request->validate([...])` mengembalikan array data yang sudah
divalidasi atau melempar exception validasi. Aturan yang dipakai pada aplikasi
ini antara lain `required`, `nullable`, `string`, `max`, `in`, `url`, `exists`,
`image`, `mimes`, dan `dimensions`. Migration memakai `Schema::table` untuk
mengubah tabel yang sudah ada: `$table->string(...)->nullable()->after(...)`,
`renameColumn`, `change`, `foreignId`, `constrained`, `cascadeOnDelete`, dan
`primary`. Seeder `ProjectSeeder` memanggil `Project::create()` dan
`technologies()->sync()` untuk mengisi proyek beserta relasinya. Perintah
`php artisan migrate`, `php artisan migrate:status`, dan `php artisan db:seed`
menjalankan serta memeriksa proses tersebut @laravel_seeding.

Jika kolom baru tidak tersimpan, periksa `$fillable`. Jika
migration gagal karena kolom sudah ada, periksa urutan migration dan gunakan
migration baru, bukan mengubah migration lama. Jika muncul `SQLSTATE 1075`,
periksa primary key gabungan pada tabel pivot dan hapus `id()`/`timestamps()`
yang tidak perlu. Jika data seed tidak muncul, periksa `DatabaseSeeder` dan
jalankan `php artisan db:seed`. Hindari `migrate:fresh` atau `db:wipe` pada
database yang berisi data penting karena keduanya menghapus data.

== Testing dan Debugging

Feature test adalah test yang mensimulasikan request HTTP ke
aplikasi dan memeriksa responsnya. Test dapat memeriksa status code, isi HTML,
redirect, dan keberadaan data di database @laravel_testing. Debugging adalah
proses menemukan penyebab perilaku yang tidak sesuai, baik melalui log,
inspector, maupun perintah diagnostik.

Test memberi jaminan bahwa perubahan tidak merusak perilaku yang
sudah ada. Test juga menjadi dokumentasi hidup: test search, filter, sorting,
pagination, dan detail menunjukkan perilaku yang diharapkan. Debugging yang
terarah mengurangi waktu perbaikan dan mencegah perubahan yang tidak perlu.

Test dijalankan dengan `php artisan test`. `RefreshDatabase`
membuat database test bersih untuk setiap test. Helper seperti `$this->get()`
mengirim request, sedangkan `assertOk()`, `assertSee()`, `assertDontSee()`,
`assertNotFound()`, dan `assertRedirect()` memeriksa respons. Factory atau
helper `project()` membuat data uji. Untuk debugging, `php artisan route:list`
menampilkan route, `php artisan about` menampilkan konfigurasi, `config:clear`
dan `view:clear` membersihkan cache, serta `storage/logs/laravel.log` menyimpan
error. `dd()` dan `dump()` dapat menghentikan eksekusi untuk memeriksa nilai,
tetapi tidak boleh ditinggalkan di kode produksi @phpunit.

Jika test gagal karena database, periksa koneksi test dan
`RefreshDatabase`. Jika assertion tidak menemukan teks, periksa escape HTML dan
nama route. Jika test mendapatkan 419, periksa middleware CSRF dan
`withoutMiddleware()` bila perlu. Jika perubahan tidak terbaca, bersihkan cache
konfigurasi dan view. Jika error hanya muncul di browser, periksa log dan
`APP_DEBUG`.

== Alur Request dan Peta Komponen

Setelah konsep-konsep di atas, alur satu request dapat dibaca sebagai satu
rantai. Browser mengirim `GET /projects?search=laravel`; router mencocokkan
route `projects.index`; controller `ProjectController@publicIndex` membaca
query string, membangun query melalui model `Project`, dan meminta data ke
database. Hasilnya dikirim ke view `portfolio.projects`, dirender dengan Blade,
lalu dikembalikan sebagai HTML. Tabel berikut merangkum pembagian tanggung
jawab tersebut.

#tab(
  caption: [Peta komponen dan tanggung jawab pada alur pencarian proyek.],
  columns: (0.9fr, 2.7fr, 2.4fr),
  header: ([Lapisan], [Berkas], [Tanggung jawab]),
  [Route], [`routes/web.php`], [Memetakan URL dan method ke controller],
  [Controller], [`app/Http/Controllers/ProjectController.php`], [Membaca request, membangun query, mengembalikan view],
  [Model], [`app/Models/Project.php`], [Eloquent model, scope, relasi, cast],
  [View], [`resources/views/portfolio/projects.blade.php`], [Merender form, hasil, dan pagination],
  [Database], [`database/migrations/`, `database/seeders/`], [Skema dan data awal],
  [Test], [`tests/Feature/ProjectSearchFilterTest.php`], [Memverifikasi perilaku],
  align: (left, left, left),
  size: 9pt,
)

#pagebreak()

= Hasil dan Pembahasan

Laporan ini menjelaskan fitur pertemuan 11 pada kode akhir portofolio. Kode
acuan adalah commit `051d370` @repo_p11; kondisi awal adalah aplikasi pertemuan
10 pada commit `d78b48b`. Lingkungan pengujian memakai PHP 8.5.12, Laravel
13.32.0, Node.js 24, MariaDB 11, dan `mise` + Podman.

Untuk mereproduksi keadaan akhir:

#codeblock(
  ```bash
  git clone https://github.com/atalariq/ppwl-portfolio.git
  cd ppwl-portfolio
  git checkout 051d370
  mise install
  cp .env.example .env
  php artisan key:generate
  podman-compose -f compose.yaml up -d db
  composer install
  php artisan migrate --seed
  php artisan storage:link
  npm ci
  npm run build
  ```,
  file: "terminal",
)

== Menyiapkan Kolom dan Data Proyek

Aplikasi membutuhkan informasi tambahan pada proyek agar dapat ditampilkan dan
diurutkan dengan baik. Kolom `short_description` menyimpan ringkasan singkat
untuk card dan meta description; `project_date` menyimpan tanggal proyek untuk
sorting; `is_featured` menandai proyek unggulan; `project_url` dan
`repository_url` menyimpan tautan demo dan sumber. Kolom `slug`, `status`,
`description`, dan `thumbnail` sudah ada dari pertemuan sebelumnya. Karena itu,
migration baru hanya menambah kolom yang belum ada dan menyesuaikan kolom lama,
tanpa mengubah migration lama.

#codeblock(
  ```bash
  php artisan make:migration add_detail_columns_to_projects_table
  php artisan migrate
  php artisan migrate:status
  ```,
  file: "terminal",
)

#codeblock(
  ```php
  <?php
  Schema::table('projects', function (Blueprint $table) {
      $table->string('short_description', 255)->nullable()->after('slug');
      $table->renameColumn('repo', 'repository_url');
      $table->text('description')->nullable()->change();
      $table->date('project_date')->nullable()->after('status');
      $table->boolean('is_featured')->default(false)->after('project_date');
      $table->string('project_url', 255)->nullable()->after('is_featured');
  });
  ```,
  file: "add_detail_columns_to_projects_table.php",
)

Kolom baru dibuat `nullable()` karena baris lama belum memiliki nilainya.
Setelah kolom ditambahkan, data lama diisi melalui loop PHP: nilai `repo` yang
masih berbentuk `owner/repository` diubah menjadi URL GitHub lengkap, sedangkan
`short_description` diisi dari potongan `description` lama. Dengan cara ini,
data pertemuan sebelumnya tidak hilang dan halaman lama tetap dapat dirender.

Model `Project` memuat kolom baru di `$fillable`, memberi cast pada
`project_date` dan `is_featured`, serta membentuk slug dari judul.

#codeblock(
  ```php
  <?php
  protected $fillable = [
      'title',
      'slug',
      'short_description',
      'description',
      'category_id',
      'status',
      'project_date',
      'is_featured',
      'project_url',
      'repository_url',
      'thumbnail',
  ];
  ```,
  file: "Project.php",
)

Cast menentukan tipe atribut saat diakses:

#codeblock(
  ```php
  <?php
  protected function casts(): array
  {
      return [
          'project_date' => 'date',
          'is_featured' => 'boolean',
      ];
  }
  ```,
  file: "Project.php",
)

#codeblock(
  ```php
  <?php
  $validated = $request->validate([
      'title' => 'required|string|min:5|max:200',
      'short_description' => 'nullable|string|max:255',
      'description' => 'nullable|string',
      'category_id' => 'nullable|exists:categories,id',
      'status' => 'required|in:published,draft',
      'project_date' => 'nullable|date',
      'is_featured' => 'nullable|boolean',
      'project_url' => 'nullable|url|max:255',
      'repository_url' => 'nullable|url|max:255',
      'thumbnail' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:4096|dimensions:min_width=400,min_height=300',
      'technologies' => 'nullable|array',
      'technologies.*' => 'exists:technologies,id',
  ]);
  ```,
  file: "ProjectController.php",
)

Slug hanya dibuat ketika masih kosong. Dengan demikian, perubahan judul tidak
diam-diam mengubah URL yang sudah dibagikan. Method `uniqueSlug()` menambahkan
sufiks angka jika slug sudah dipakai. Validasi dipusatkan pada
`validateProject()` agar form tambah dan edit memakai aturan yang sama.

Aturan `in:published,draft` mencegah status lain masuk. Aturan `url` menjaga
tombol proyek dan repositori hanya berisi alamat yang sah. Relasi teknologi
divalidasi dengan `exists` agar ID yang tidak ada tidak masuk ke tabel pivot.

Data uji diisi melalui `ProjectSeeder`. Seeder menghapus proyek lama, menyalin
gambar dari `database/seeders/assets`, lalu membuat proyek beserta relasi
teknologi dan galeri. Relasi teknologi memakai `sync()` agar teknologi yang
tidak dipilih ikut dilepas dan daftar yang tersimpan sama persis dengan pilihan
pada data seed.

#codeblock(
  ```php
  <?php
  $project = Project::create($data + [
      'category_id' => $categories[$category] ?? null,
  ]);

  $project->technologies()->sync(
      collect($technologySlugs)
          ->map(fn (string $technology) => $technologies[$technology] ?? null)
          ->filter()
          ->all()
  );
  ```,
  file: "ProjectSeeder.php",
)

Filter kategori dan teknologi membutuhkan slug pada tabel `categories` dan
`technologies`, serta tabel pivot `project_technology`. Ketiganya sudah dibuat
pada pertemuan sebelumnya. Tabel pivot memakai primary key gabungan
`project_id` dan `technology_id` untuk mencegah baris ganda.

#codeblock(
  ```php
  <?php
  Schema::create('project_technology', function (Blueprint $table) {
      $table->foreignId('project_id')->constrained()->cascadeOnDelete();
      $table->foreignId('technology_id')->constrained()->cascadeOnDelete();
      $table->primary(['project_id', 'technology_id']);
  });
  ```,
  file: "create_project_technology_table.php",
)

Relasi dua arah didefinisikan pada model:

#codeblock(
  ```php
  <?php
  public function technologies(): BelongsToMany
  {
      return $this->belongsToMany(Technology::class);
  }

  public function projects(): BelongsToMany
  {
      return $this->belongsToMany(Project::class);
  }
  ```,
  file: "Project.php",
)

Data uji terdiri atas 12 proyek, 5 kategori, 31 teknologi, dan 24 gambar.
Sebaran proyek ditunjukkan pada tabel berikut.

#tab(
  caption: [Data uji proyek pada aplikasi portofolio.],
  columns: (0.45fr, 1.9fr, 1fr, 1.1fr, 0.75fr),
  header: ([No.], [Proyek], [Kategori], [Tanggal], [Unggulan]),
  [1], [Menu Catalog API], [API], [27 Nov 2025], [Tidak],
  [2], [Sift], [Web], [2 Feb 2026], [Tidak],
  [3], [Journey], [Web], [4 Jul 2026], [Ya],
  [4], [Personal Picks], [Web], [3 Apr 2026], [Tidak],
  [5], [LaptopVal], [Web], [4 Jul 2026], [Ya],
  [6], [Wana], [Design System], [4 Jul 2026], [Tidak],
  [7], [atalariq.dev], [Web], [24 Okt 2026], [Tidak],
  [8], [PPW1], [Web], [17 Jun 2026], [Tidak],
  [9], [PPWL Portfolio], [Web], [12 Nov 2026], [Tidak],
  [10], [Typst Packages], [Tool], [28 Sep 2026], [Ya],
  [11], [Dotfiles], [Tool], [12 Nov 2026], [Ya],
  [12], [Nyalara], [Mobile], [28 Mei 2026], [Ya],
  align: (center, left, left, left, center),
  size: 10pt,
)

Dengan 12 proyek dan 9 item per halaman, halaman kedua tetap dapat diuji.
Pengujian `ProjectCrudTest` dan `ProjectUploadTest` memastikan kolom baru
tersimpan, validasi berjalan, dan upload thumbnail tetap bekerja. Pada suite
penuh, seluruh 86 pengujian lulus dengan 303 assertion; angka ini juga mencakup
pengujian pencarian, filter, sorting, pagination, dan detail yang dibahas pada
subbab berikutnya.

== Membangun Query Pencarian dan Filter

Controller publik membangun satu query bertahap. Filter hanya ditambahkan jika
parameter benar-benar terisi, sehingga URL tanpa parameter tetap menampilkan
semua proyek published. Query dimulai dari `Project::query()`, dibatasi dengan
`published()`, memuat relasi dengan `with()`, menambahkan filter dengan
`when()`, mengurutkan dengan `sorted()`, dan mengambil satu halaman dengan
`paginate()`.

#codeblock(
  ```php
  <?php
  $perPage = $request->integer('per_page', 9);
  $perPage = in_array($perPage, [9, 18, 27], true) ? $perPage : 9;
  $sort = $request->string('sort')->toString();

  $search = $request->string('search')->toString();
  $category = $request->string('category')->toString();
  $technology = $request->string('technology')->toString();

  $projects = Project::query()
      ->published()
      ->with(['category', 'technologies', 'images'])
      ->when(
          $request->filled('search'),
          fn ($query) => $query->search($search)
      )
      ->when(
          $request->filled('category'),
          fn ($query) => $query->categorySlug($category)
      )
      ->when(
          $request->filled('technology'),
          fn ($query) => $query->technologySlug($technology)
      )
      ->sorted($sort)
      ->paginate($perPage)
      ->withQueryString();
  ```,
  file: "ProjectController.php",
)

Potongan ini merapikan pemanggilan `$request->string()` menjadi variabel lokal
agar baris kode tidak terpotong. Scope pencarian mencakup tiga kolom. Kondisi `OR` dikelompokkan dalam closure
agar tidak bocor ke kondisi filter lain.

#codeblock(
  ```php
  <?php
  public function scopeSearch(Builder $query, string $keyword): Builder
  {
      $keyword = trim($keyword);

      if ($keyword === '') {
          return $query;
      }

      return $query->where(function (Builder $query) use ($keyword) {
          $query->where('title', 'like', "%{$keyword}%")
              ->orWhere('short_description', 'like', "%{$keyword}%")
              ->orWhere('description', 'like', "%{$keyword}%");
      });
  }
  ```,
  file: "Project.php",
)

Filter relasi memakai `whereHas()`:

#codeblock(
  ```php
  <?php
  public function scopeCategorySlug(Builder $query, string $slug): Builder
  {
      return $query->whereHas(
          'category',
          fn (Builder $query) => $query->where('slug', $slug)
      );
  }

  public function scopeTechnologySlug(Builder $query, string $slug): Builder
  {
      return $query->whereHas(
          'technologies',
          fn (Builder $query) => $query->where('slug', $slug)
      );
  }
  ```,
  file: "Project.php",
)

Alur query dapat dibaca pada tabel berikut.

#tab(
  caption: [Alur pembentukan query pada halaman publik.],
  columns: (1fr, 2.6fr, 2.2fr),
  header: ([Tahap], [Kode], [Efek]),
  [Request], [`$request->filled('search')`], [Menentukan filter yang aktif],
  [Builder], [`Project::query()->published()`], [Membatasi proyek terbit],
  [Relasi], [`with([...])`], [Eager loading kategori, teknologi, gambar],
  [Search], [`search($keyword)`], [`LIKE` pada tiga kolom teks],
  [Filter], [`categorySlug()` / `technologySlug()`], [`exists` pada relasi],
  [Sorting], [`sorted($sort)`], [Urutan sebelum pagination],
  [Pagination], [`paginate($perPage)`], [Mengambil satu halaman],
  [Tautan], [`withQueryString()`], [Query string ikut ke halaman berikutnya],
  align: (left, left, left),
  size: 9.5pt,
)

Form memakai metode `GET`, sehingga seluruh nilai filter terlihat pada URL.
Kutipan berikut menunjukkan bagian penting; kelas Tailwind dan wrapper layout
dihilangkan agar blok kode tetap terbaca.

#codeblock(
  ```html
  <form method="GET" action="{{ route('projects.index') }}">
      <input name="search" value="{{ request('search') }}">

      <select name="category">
          <option value="">All categories</option>
          @foreach ($categories as $category)
              <option
                  value="{{ $category->slug }}"
                  @selected(request('category') === $category->slug)
              >
                  {{ $category->name }}
              </option>
          @endforeach
      </select>

      <select name="technology">
          <option value="">All technologies</option>
          @foreach ($technologies as $technology)
              <option
                  value="{{ $technology->slug }}"
                  @selected(request('technology') === $technology->slug)
              >
                  {{ $technology->name }}
              </option>
          @endforeach
      </select>
  </form>
  ```,
  file: "projects.blade.php",
)

Kontrol sort dan `per_page` tidak ditampilkan di sini; keduanya dibahas pada
subbab 3.3. Di bawah form, jumlah hasil dan tombol Reset ditampilkan. Tombol
Reset hanya muncul jika ada filter aktif.

#codeblock(
  ```html
  <p>
      {{ $projects->total() }} {{ \Illuminate\Support\Str::plural('project', $projects->total()) }} found
      @if (
          request()->filled('search')
          || request()->filled('category')
          || request()->filled('technology')
      )
          · filters active
      @endif
  </p>

  @if (
      request()->filled('search')
      || request()->filled('category')
      || request()->filled('technology')
      || request()->filled('sort')
      || request()->filled('per_page')
  )
      <a href="{{ route('projects.index') }}">Reset</a>
  @endif

  <div>
      @forelse ($projects as $project)
          <x-project-card :project="$project" />
      @empty
          <x-ui.empty-state
              title="No projects found"
              description="Try a different keyword or reset the filters."
          />
      @endforelse
  </div>

  {{ $projects->links() }}
  ```,
  file: "projects.blade.php",
)

Hasil pencarian `laravel` ditunjukkan pada gambar berikut.

#fig(
  image("assets/page-projects-search.png", width: 80%),
  caption: [Pencarian `laravel` pada `/projects`; jumlah hasil dan tombol Reset tampil karena filter aktif.],
)

Pencarian mencakup judul, ringkasan, dan deskripsi. Karena itu, kata kunci yang
muncul di salah satu kolom tetap menemukan proyek yang relevan. Jumlah hasil
dihitung dari paginator, bukan dari jumlah card yang terlihat, sehingga nilai
pada teks tetap benar ketika hasil melebihi satu halaman. Tombol Reset
mengembalikan URL ke `/projects` tanpa parameter.

Kombinasi kategori, teknologi, dan sorting ditunjukkan pada gambar berikut.

#fig(
  image("assets/page-projects-filter.png", width: 80%),
  caption: [Kombinasi filter kategori `web`, teknologi `typescript`, dan sorting `project_date`.],
)

Pengujian `ProjectSearchFilterTest` mencakup pencarian pada judul, ringkasan,
dan deskripsi; filter kategori; filter teknologi; kombinasi filter; serta query
string pada halaman berikutnya. Pengujian manual dengan `GET
/projects?search=laravel` menghasilkan dua proyek yang relevan, dan kombinasi
`category=web&technology=typescript&sort=project_date` menghasilkan dua proyek
yang sesuai. Pencarian `LIKE` bergantung pada collation database @mysql_like;
MariaDB dengan `utf8mb4_unicode_ci` tidak membedakan huruf besar-kecil.

== Menambahkan Sorting dan Pagination

Sorting dipusatkan pada scope `sorted()`. Urutan default memakai
`project_date` agar data seed tidak tampil acak hanya karena waktu seeding.

#codeblock(
  ```php
  <?php
  public function scopeSorted(Builder $query, ?string $sort): Builder
  {
      return match ($sort) {
          'oldest' => $query
              ->orderBy('project_date')
              ->orderBy('id'),
          'title' => $query->orderBy('title'),
          'project_date' => $query
              ->orderByDesc('project_date')
              ->orderByDesc('id'),
          default => $query
              ->orderByDesc('project_date')
              ->orderByDesc('id'),
      };
  }
  ```,
  file: "Project.php",
)

Pagination memakai 9 item sebagai default. Nilai `per_page` dibatasi pada 9, 18,
dan 27 agar ukuran halaman tidak dapat diubah menjadi nilai yang tidak masuk
akal. `withQueryString()` memastikan filter tetap ada pada tautan halaman kedua.

Halaman kedua tetap membawa filter yang sama. Nilai form, jumlah hasil, dan
tautan pagination konsisten karena controller memakai `withQueryString()`.
Pembaca dapat memeriksa tautan halaman pada HTML: parameter `search`,
`category`, `technology`, `sort`, dan `per_page` ikut muncul. Jika salah satu
parameter hilang, periksa urutan pemanggilan `withQueryString()` sebelum
`links()`.

#fig(
  image("assets/page-projects-page2.png", width: 80%),
  caption: [Halaman kedua dari 12 proyek; sorting dan ukuran halaman tetap terbawa.],
)

Jika tidak ada hasil, halaman menampilkan empty state dan tombol Reset.

#fig(
  image("assets/page-projects-empty.png", width: 70%),
  caption: [Empty state saat pencarian tidak menemukan proyek.],
)

Pengujian `ProjectSearchFilterTest` juga menguji sorting `title` dan
`project_date`, batas `per_page`, serta keberadaan query string pada tautan
halaman kedua.

== Menampilkan Detail Proyek melalui Slug

Route publik memakai parameter slug dan model mengembalikan slug sebagai route
key. Controller detail memuat relasi yang dibutuhkan dan menolak draft untuk
tamu.

#codeblock(
  ```php
  <?php
  Route::get('/projects', [ProjectController::class, 'publicIndex'])
      ->name('projects.index');
  Route::get('/projects/{project:slug}', [ProjectController::class, 'show'])
      ->name('projects.show');
  ```,
  file: "web.php",
)

#codeblock(
  ```php
  <?php
  public function show(Project $project): View
  {
      $canPreview = auth()->check() && auth()->user()->isAdmin();

      if ($project->status !== 'published' && ! $canPreview) {
          abort(404);
      }

      return view('portfolio.project', [
          'project' => $project->load(['category', 'images', 'technologies']),
      ]);
  }
  ```,
  file: "ProjectController.php",
)

Halaman detail menampilkan meta description, tanggal, kategori, repositori,
tombol proyek, teknologi, dan galeri. Meta description diambil dari
`summary()`, sehingga ringkasan yang sama dipakai pada card dan hasil
pencarian. Tombol proyek hanya muncul jika `project_url` terisi; tombol
repositori muncul jika `repository_url` terisi. Keduanya membuka tab baru dan
memakai `rel="noopener noreferrer"`.

Proyek `draft` tidak ditampilkan kepada tamu. Controller memeriksa status dan
hak admin sebelum memuat relasi. Jika tamu membuka slug draft, aplikasi
mengembalikan 404; admin melihat label `Draft preview`. Galeri dimuat dengan
`with('images')` agar tidak terjadi query per gambar. Jika slug kosong,
pembentukan URL route dapat gagal; karena itu, migration mengisi slug untuk
data lama dan model membentuk slug saat proyek dibuat. Jika slug berubah, URL
lama tidak otomatis dialihkan; keputusan ini perlu dipertimbangkan sebelum
judul proyek diubah.

Nilai tanggal dan label repositori juga dipusatkan pada model. `project_date`
di-cast menjadi tanggal sehingga view dapat memanggil `format('F Y')`.
`repositoryLabel()` mengubah URL GitHub menjadi `owner/repository`, sedangkan
`projectDateLabel()` menghasilkan label bulan dan tahun. Pemusatan ini menjaga
format yang sama pada card, halaman detail, dan halaman admin.

#fig(
  image("assets/page-project-detail.png", width: 80%),
  caption: [Halaman detail proyek `Personal Picks`; URL proyek, repositori, dan galeri tampil dari data proyek.],
)

Pengujian `PublicPageTest` memastikan halaman detail dapat dibuka melalui slug,
proyek `draft` menghasilkan 404 untuk tamu, dan admin dapat melihat pratinjau.
Data seed seluruhnya berstatus `published`, sehingga perilaku draft dibuktikan
melalui feature test, bukan melalui data seed.

== Menambahkan Pencarian dan Filter Admin

Area admin memakai prefix `/admin` dan dilindungi middleware `auth` serta
`admin`. Form admin menyediakan pencarian dan filter status; keduanya memakai
scope yang sama dengan halaman publik.

#codeblock(
  ```html
  <form method="GET" action="{{ route('admin.projects.index') }}">
      <input name="search" value="{{ request('search') }}" placeholder="Title or description…">

      <select name="status">
          <option value="">All statuses</option>
          <option value="published" @selected(request('status') === 'published')>Published</option>
          <option value="draft" @selected(request('status') === 'draft')>Draft</option>
      </select>
  </form>
  ```,
  file: "admin/projects/index.blade.php",
)

#fig(
  image("assets/page-admin-projects-filter.png", width: 80%),
  caption: [Pencarian `portfolio` dan filter status `published` pada halaman admin.],
)

Pencarian admin memakai scope `search()` yang sama dengan halaman publik, lalu
ditambah filter status. Pengujian memastikan hasil admin terfilter dan tidak
menampilkan proyek dengan status yang tidak dipilih.

#pagebreak()

= Penutup

== Kesimpulan

Pencarian, filter, sorting, pagination, dan halaman detail dibangun di atas
aplikasi portofolio yang sudah ada. Masalah
utamanya adalah daftar proyek yang semakin panjang dan sulit ditelusuri.
Pendekatan yang dipakai adalah memindahkan state pencarian ke query string,
membangun query secara bertahap di controller, dan mempertahankan filter pada
tautan pagination.

Query pencarian memakai `LIKE` pada tiga kolom teks, sedangkan filter kategori
dan teknologi memakai `whereHas()` pada relasi. Pendekatan relasi ini menjaga
satu baris per proyek dan menghindari duplikasi yang sering muncul ketika
`join` dipakai untuk relasi banyak-ke-banyak. Sorting dipusatkan pada scope
`sorted()`, dan pagination memakai `paginate()` dengan `withQueryString()`
sehingga pengguna tidak kehilangan konteks saat berpindah halaman.

Halaman detail memakai route model binding melalui slug. Slug lebih mudah
dibaca dan dibagikan daripada ID, tetapi perubahannya harus dikelola agar URL
lama tidak rusak. Proyek draft tidak ditampilkan kepada tamu; controller
mengembalikan 404, sementara admin dapat melihat pratinjau. Keputusan ini
menjaga konsistensi antara data yang terbit dan data yang masih disiapkan.

Pengujian otomatis mencatat 86 pengujian lulus dengan 303 assertion. Test
mencakup pencarian, filter kategori, filter teknologi, sorting, batas
`per_page`, query string, empty state, detail slug, draft, dan filter admin.
Bukti visual juga tersedia untuk pencarian, kombinasi filter, halaman kedua,
empty state, detail, dan halaman admin.

Query yang baik menghasilkan data yang benar, menjaga konteks pengguna,
tetap terbaca, dan dapat diuji. Pemisahan antara route, controller,
model, dan view membuat perubahan pada satu bagian tidak langsung merusak
bagian lain.

== Saran

+ Pencarian saat ini memakai `LIKE` pada tiga kolom. Untuk dataset yang lebih
  besar, full-text search dengan relevance ranking dapat memberikan hasil yang
  lebih baik.
+ Filter dapat disimpan pada session atau dijadikan saved search agar pengguna
  tidak perlu menyusun ulang kombinasi yang sering dipakai.
+ Slug sebaiknya disertai redirect ketika berubah, agar URL lama yang sudah
  dibagikan tetap dapat diakses.
+ Pengujian performa dapat ditambahkan untuk memantau jumlah query ketika
  jumlah proyek dan relasi bertambah.
+ Halaman hasil dapat dilengkapi dengan indikator jumlah query, logging query,
  atau alat observabilitas lain agar masalah N+1 lebih mudah dideteksi.
