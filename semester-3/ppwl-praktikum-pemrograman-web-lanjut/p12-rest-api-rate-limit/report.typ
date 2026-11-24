#import "@atalariq/lab-report:4.0.0": *
#import "diagrams.typ": api-flow, rate-limit, resource-shape, message-flow

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
  == Peta route

  #tab(
    caption: [Route yang ditambahkan pada pertemuan ini.],
    columns: (1.5fr, 0.8fr, 2.6fr),
    header: ([Route], [Method], [Handler]),
    [`/api/projects`], [GET], [`Api/ProjectController@index`],
    [`/api/projects/{slug}`], [GET], [`Api/ProjectController@show`],
    [`/api/categories`], [GET], [`Api/CategoryController@index`],
    [`/api/technologies`], [GET], [`Api/TechnologyController@index`],
    [`/contact`], [GET], [`ContactMessageController@create`],
    [`/contact`], [POST], [`ContactMessageController@store`],
    [`/admin/messages`], [GET], [`Admin/ContactMessageController@index`],
    [`/admin/messages/{contactMessage}`], [GET], [`Admin/ContactMessageController@show`],
    align: (left, center, left),
    size: 9pt,
  )

  == Perintah reproduksi

  #codeblock(
    breakable: true,
    ```bash
    git clone https://github.com/atalariq/ppwl-portfolio.git
    cd ppwl-portfolio
    git checkout 93d08334b570022f5138bc590e88f167acdbe572
    mise install
    cp .env.example .env
    composer install
    php artisan key:generate
    podman-compose -f compose.yaml up -d db
    php artisan migrate --seed
    php artisan storage:link
    npm ci
    npm run build
    php artisan serve
    ```,
    file: "terminal",
  )

  == Catatan adaptasi

  Proyek memakai Laravel 13.32.0. Perintah `php artisan install:api` tetap
  tersedia, tetapi proyek ini mendaftarkan `api:` secara manual karena API
  bersifat publik dan tidak memakai Sanctum. Tabel pesan diberi nama
  `contact_messages` karena tabel `contacts` sudah dipakai untuk link kontak
  pada halaman About. Route admin mengikuti konvensi aplikasi, yaitu
  `/admin/messages`.

  == Bukti pengujian

  Seluruh suite berisi 100 pengujian dengan 431 assertion dan lulus pada
  commit `93d08334b570022f5138bc590e88f167acdbe572`. Pengujian baru mencakup bentuk JSON, filter API, 404,
  pembatasan `per_page`, rate limit 60 request, header rate limit, validasi
  contact, throttle contact, akses admin, dan penandaan pesan dibaca.
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
  title: [REST API dan Rate Limiting],
  author: [Atalariq Barra Hadinugraha],
  id: [25/557554/SV/26192],
  class: [B2],
  course: [Praktikum Pemrograman Web Lanjutan],
  course-code: [PPWL],
  lecturer: [Achmad Choirudin Emcha, S.Kom., M.Eng.],
  meeting: [12],
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

Aplikasi portofolio sudah memiliki halaman publik, panel admin, pencarian,
filter, sorting, pagination, dan halaman detail proyek. Semua data masih
disajikan sebagai HTML untuk manusia. Pada pertemuan ini aplikasi membuka
sebagian data yang sama sebagai REST API dalam format JSON, sehingga data
proyek dapat dipakai oleh klien lain: aplikasi mobile, dashboard eksternal,
atau skrip otomatis.

API publik membawa risiko baru. Endpoint dapat dipanggil berulang kali oleh
bot, form contact dapat dibanjiri pesan, dan query yang mahal dapat
menghabiskan sumber daya server. Karena itu API dan form contact dibatasi
dengan rate limiting. Batas dihitung per IP dalam jendela waktu satu menit,
dan permintaan yang melewati batas dijawab dengan HTTP 429, bukan error 500.

Perubahan ini juga menambah alur data baru. Pesan dari form contact disimpan
ke tabel `contact_messages`, ditampilkan di panel admin, dan ditandai sudah
dibaca ketika dibuka. Dashboard admin menghitung jumlah pesan dan pesan yang
belum dibaca. Laporan ini membahas implementasi tersebut pada commit
`93d08334b570022f5138bc590e88f167acdbe572` @repo_p12.

== Tujuan Praktikum

+ Menjelaskan prinsip REST, HTTP method, status code, dan format respons JSON.
+ Membuat route API, controller API, dan API Resource pada Laravel.
+ Menghasilkan respons JSON yang konsisten dengan `data`, `links`, dan `meta`.
+ Menerapkan rate limiting pada API dan form contact menggunakan named limiter.
+ Membaca header `X-RateLimit-Limit`, `X-RateLimit-Remaining`, dan `Retry-After`.
+ Membuat form contact yang tervalidasi dan tersimpan ke database.
+ Menampilkan pesan contact di panel admin dan menandainya sudah dibaca.
+ Memverifikasi perilaku API, rate limit, contact, dan admin melalui feature test.

#pagebreak()

= Dasar Teori

== REST dan HTTP

Representational State Transfer (REST) adalah gaya arsitektur untuk layanan
yang memakai resource sebagai unit utama. Setiap resource memiliki identitas
berupa URL, dan klien berinteraksi dengan resource melalui method HTTP yang
standar. `GET` membaca resource, `POST` membuat resource baru, `PUT` atau
`PATCH` mengubah resource, dan `DELETE` menghapusnya @fielding_rest.

REST bukan protokol baru. Ia memanfaatkan HTTP: request memiliki method, path,
header, dan body; response memiliki status code, header, dan body. Layanan
REST biasanya tidak menyimpan state percakapan di server; setiap request
membawa informasi yang dibutuhkan, misalnya token autentikasi atau parameter
filter. Sifat stateless ini memudahkan scaling karena request dapat dilayani
oleh instance mana pun.

Pada aplikasi ini, resource yang diekspos adalah proyek, kategori, dan
teknologi. Proyek memiliki relasi ke kategori dan teknologi, sehingga respons
proyek dapat memuat nama kategori dan daftar nama teknologi tanpa klien harus
melakukan request tambahan.

#tab(
  caption: [Method dan status code yang dipakai pada API proyek.],
  columns: (0.8fr, 2.8fr, 1.6fr),
  header: ([Kode], [Arti], [Contoh pada aplikasi]),
  [`200`], [Request berhasil], [`GET /api/projects`],
  [`404`], [Resource tidak ditemukan], [Slug proyek salah atau proyek draft],
  [`422`], [Validasi gagal pada request JSON], [Request JSON tanpa email],
  [`429`], [Batas request terlampaui], [Request ke-61 dalam satu menit],
  align: (center, left, left),
  size: 9pt,
)

== API Resource dan bentuk JSON

Mengembalikan model Eloquent secara langsung membocorkan seluruh kolom tabel.
Kolom internal seperti `id`, `category_id`, atau `created_at` dapat berubah
tanpa kontrak API yang jelas, dan relasi yang tidak dimuat dapat memicu query
tambahan. API Resource memisahkan bentuk respons dari bentuk database. Resource
menentukan field yang boleh keluar, memberi nama field yang stabil, dan
menjaga agar perubahan skema internal tidak langsung merusak klien
@laravel_resources.

Resource juga menangani relasi yang sudah dimuat. `whenLoaded` hanya
menyertakan relasi jika relasi tersebut di-`load` atau di-`with` oleh
controller, sehingga respons tidak diam-diam menjalankan query N+1. Pada
aplikasi ini, `ProjectResource` memuat judul, slug, ringkasan, thumbnail,
kategori, teknologi, tanggal proyek, status unggulan, URL publik, dan URL
repositori.

Pagination menghasilkan tiga bagian penting: `data` berisi baris pada halaman
aktif, `links` berisi URL halaman pertama/berikutnya/sebelumnya, dan `meta`
berisi `current_page`, `last_page`, `per_page`, `total`, serta `path`. Dengan
bentuk ini klien tidak perlu menebak cara mengambil halaman berikutnya.

#fig(
  resource-shape(),
  caption: [Transformasi model menjadi respons JSON melalui API Resource.],
)

== Rate limiting

Rate limiting membatasi jumlah request dari satu client dalam jendela waktu
tertentu. Implementasi yang dipakai Laravel adalah fixed window: server
menyimpan counter di cache untuk setiap key, menambah counter pada setiap
request, dan mengembalikan HTTP 429 ketika counter melewati batas. Counter
kedaluwarsa setelah jendela waktu selesai, lalu dihitung dari nol
@laravel_rate_limiting.

Key menentukan siapa yang dihitung. Untuk tamu, key biasanya alamat IP; untuk
pengguna login, key dapat berupa user id. Dua named limiter pada aplikasi ini
memakai IP: `portfolio-api` dengan 60 request per menit dan `contact` dengan
3 pesan per menit. Named limiter dipilih agar kedua alur memiliki counter
terpisah; kiriman form contact tidak mengurangi jatah request API.

Setiap respons yang melewati middleware throttle membawa header
`X-RateLimit-Limit` dan `X-RateLimit-Remaining`. Saat batas terlampaui,
respons 429 juga membawa `Retry-After` dan `X-RateLimit-Reset`, sehingga klien
tahu kapan boleh mencoba lagi. Status 429 didefinisikan dalam RFC 6585 sebagai
Too Many Requests @rfc6585; MDN menjelaskan header `Retry-After` sebagai
isyarat waktu tunggu @mdn_429.

#fig(
  rate-limit(),
  caption: [Alur penghitungan rate limit dan keputusan 200 atau 429.],
)

== Middleware dan named limiter di Laravel

Laravel menyediakan middleware `throttle` yang dapat dipasang langsung dengan
angka (`throttle:60,1`) atau dengan nama limiter (`throttle:portfolio-api`).
Named limiter didefinisikan di `AppServiceProvider::boot()` menggunakan
`RateLimiter::for()`, lalu route memakai nama tersebut. Cara ini lebih terbaca
daripada angka yang tersebar di banyak route dan memudahkan perubahan batas
di satu tempat @laravel_middleware.

Middleware berjalan sebelum controller. Jika counter masih di bawah batas,
request diteruskan; jika tidak, Laravel menghentikan request dan mengembalikan
429. Untuk API, respons berbentuk JSON karena request membawa
`Accept: application/json` dan aplikasi mengatur `shouldRenderJsonWhen` untuk
path `api/*`. Untuk form contact, respons 429 berbentuk halaman HTML karena
request berasal dari browser.

== Form contact, validasi, dan CSRF

Form contact adalah endpoint publik yang menerima input pengguna. Validasi
memeriksa nama, email, subjek, dan pesan sebelum data disimpan. Aturan
`required`, `email`, `max`, dan `min` menjaga agar data yang masuk masuk akal
dan tidak memenuhi database dengan pesan kosong @laravel_validation. Jika
validasi gagal, Laravel mengembalikan pengguna ke form dengan pesan error dan
input lama.

Form memakai metode `POST` dan token CSRF. Token mencegah situs lain
mengirimkan form atas nama pengguna yang sedang login. Karena form contact
dapat diakses tanpa login, perlindungan utamanya adalah validasi, rate limit,
dan pemisahan data pesan dari data kontak admin.

Pesan disimpan ke tabel `contact_messages` dengan `is_read` bernilai `false`.
Kolom ini menjadi status sederhana yang dipakai panel admin. Ketika admin
membuka detail pesan, status diubah menjadi `true`, sehingga dashboard dapat
menghitung pesan yang belum dibaca.

== Alur request API

Satu request API melewati rantai yang pendek tetapi jelas. Klien mengirim
`GET /api/projects` dengan header `Accept: application/json`. Router mencocokkan
route, middleware throttle memeriksa counter, controller membangun query dan
memuat relasi, resource membentuk array, lalu Laravel mengubahnya menjadi JSON.
Jika slug tidak ditemukan atau proyek masih draft, controller mengembalikan
404.

#fig(
  api-flow(),
  caption: [Alur request API dari klien sampai respons JSON.],
)

#pagebreak()

= Hasil dan Pembahasan

== Lingkungan dan reproduksi

Pekerjaan dilakukan pada repository `ppwl-portfolio` di branch `pertemuan12`,
dengan commit acuan `93d0833`. Lingkungan memakai PHP 8.5.12, Laravel 13.32.0,
Node.js 24.21.0, MariaDB 11, dan `mise` + Podman. Cache rate limit memakai
driver `database`, sehingga counter bertahan antar-request dan tidak hilang
saat proses PHP selesai.

Untuk mereproduksi keadaan akhir:

#codeblock(
  breakable: true,
  ```bash
  git clone https://github.com/atalariq/ppwl-portfolio.git
  cd ppwl-portfolio
  git checkout 93d08334b570022f5138bc590e88f167acdbe572
  mise install
  cp .env.example .env
  composer install
  php artisan key:generate
  podman-compose -f compose.yaml up -d db
  php artisan migrate --seed
  php artisan storage:link
  npm ci
  npm run build
  php artisan serve
  ```,
  file: "terminal",
)

== Mengaktifkan API dan mendaftarkan route

Laravel 13 tidak memuat `routes/api.php` secara otomatis. Berkas route
didaftarkan pada `bootstrap/app.php` melalui argumen `api:`, sehingga semua
route di dalamnya mendapat prefix `/api` dan middleware group `api`. Berkas
`routes/api.php` kemudian mendefinisikan empat endpoint di dalam group
`throttle:portfolio-api`.

#codeblock(
  breakable: true,
  ```php
  ->withRouting(
      web: __DIR__.'/../routes/web.php',
      api: __DIR__.'/../routes/api.php',
      commands: __DIR__.'/../routes/console.php',
      health: '/up',
  )
  ```,
  file: "bootstrap/app.php",
)

#codeblock(
  breakable: true,
  ```php
  Route::middleware('throttle:portfolio-api')->group(function () {
      Route::get('/projects', [ProjectController::class, 'index']);
      Route::get('/projects/{project:slug}', [ProjectController::class, 'show']);
      Route::get('/categories', [CategoryController::class, 'index']);
      Route::get('/technologies', [TechnologyController::class, 'index']);
  });
  ```,
  file: "routes/api.php",
)

Hasil `php artisan route:list --path=api` menunjukkan empat route terdaftar.
Route detail memakai parameter `{project:slug}`, sehingga URL memakai slug
yang mudah dibaca, bukan id.

#codeblock(
  breakable: true,
  ```text
  GET|HEAD  api/categories ................. Api/CategoryController@index
  GET|HEAD  api/projects .................... Api/ProjectController@index
  GET|HEAD  api/projects/{project:slug} ...... Api/ProjectController@show
  GET|HEAD  api/technologies ............. Api/TechnologyController@index
  ```,
  file: "terminal",
)

== Controller dan Resource proyek

`Api/ProjectController@index` hanya mengambil proyek berstatus `published`,
memuat kategori dan teknologi, menerapkan filter yang diisi, lalu memanggil
`paginate(9)` dan `withQueryString()`. `withQueryString()` penting karena
tautan pagination pada `links` harus membawa `search`, `category`,
`technology`, `sort`, dan `per_page`, bukan hanya nomor halaman.

#codeblock(
  breakable: true,
  ```php
  public function index(Request $request): AnonymousResourceCollection
  {
      $perPage = $request->integer('per_page', 9);
      $perPage = in_array($perPage, [9, 18, 27], true) ? $perPage : 9;
      $sort = $request->string('sort')->toString();

      $projects = Project::query()
          ->published()
          ->with(['category', 'technologies'])
          ->when(
              $request->filled('search'),
              fn ($query) => $query->search($request->string('search')->toString()),
          )
          ->when(
              $request->filled('category'),
              fn ($query) => $query->categorySlug($request->string('category')->toString()),
          )
          ->when(
              $request->filled('technology'),
              fn ($query) => $query->technologySlug($request->string('technology')->toString()),
          )
          ->sorted($sort)
          ->paginate($perPage)
          ->withQueryString();

      return ProjectResource::collection($projects);
  }
  ```,
  file: "app/Http/Controllers/Api/ProjectController.php",
)

`show()` memakai route model binding berdasarkan slug, lalu memeriksa status.
Proyek draft tidak boleh muncul di API publik, sehingga controller
mengembalikan 404 meskipun slug ada di database. Pemeriksaan ini menjaga
konsistensi dengan halaman publik yang juga menyembunyikan draft.

#codeblock(
  breakable: true,
  ```php
  public function show(Project $project): ProjectResource
  {
      abort_unless($project->status === 'published', 404);

      return new ProjectResource($project->load(['category', 'technologies']));
  }
  ```,
  file: "app/Http/Controllers/Api/ProjectController.php",
)

`ProjectResource` menentukan field yang keluar. `summary` memakai
`short_description` atau potongan deskripsi, `thumbnail` diubah menjadi URL
absolut, dan `category`/`technologies` hanya disertakan jika relasi sudah
dimuat. `url` menunjuk ke halaman publik proyek, sehingga klien dapat membuka
detail di browser.

#codeblock(
  breakable: true,
  ```php
  public function toArray(Request $request): array
  {
      return [
          'title' => $this->title,
          'slug' => $this->slug,
          'summary' => $this->summary(),
          'thumbnail' => $this->thumbnail
              ? asset('storage/'.$this->thumbnail)
              : null,
          'category' => $this->whenLoaded(
              'category',
              fn () => $this->category?->name,
          ),
          'technologies' => $this->whenLoaded(
              'technologies',
              fn () => $this->technologies->pluck('name')->values(),
          ),
          'project_date' => $this->project_date?->toDateString(),
          'is_featured' => (bool) $this->is_featured,
          'url' => route('projects.show', $this),
          'project_url' => $this->project_url,
          'repository_url' => $this->repository_url,
      ];
  }
  ```,
  file: "app/Http/Resources/ProjectResource.php",
)

Kutipan respons untuk `GET /api/projects?search=portfolio&per_page=9` memuat
satu proyek, objek `links`, dan objek `meta`. Bentuk ini sama untuk semua
halaman; yang berubah hanya isi `data` dan URL pada `links`.

#codeblock(
  breakable: true,
  ```json
  {
      "data": [
          {
              "title": "PPWL Portfolio",
              "slug": "ppwl-portfolio",
              "summary": "The Laravel portfolio application that grows across the Advanced Web Programming practicum.",
              "thumbnail": "http://127.0.0.1:8000/storage/projects/ppwl-portfolio/thumbnail.jpg",
              "category": "Web",
              "technologies": ["PHP", "Laravel", "Tailwind CSS", "MariaDB", "Docker"],
              "project_date": "2026-11-12",
              "is_featured": false,
              "url": "http://127.0.0.1:8000/projects/ppwl-portfolio",
              "repository_url": "https://github.com/atalariq/ppwl-portfolio",
              "project_url": null
          }
      ],
      "links": {
          "first": "http://127.0.0.1:8000/api/projects?search=portfolio&per_page=9&page=1",
          "last": "http://127.0.0.1:8000/api/projects?search=portfolio&per_page=9&page=1",
          "prev": null,
          "next": null
      },
      "meta": {
          "current_page": 1,
          "from": 1,
          "last_page": 1,
          "path": "http://127.0.0.1:8000/api/projects",
          "per_page": 9,
          "to": 1,
          "total": 1
      }
  }
  ```,
  file: "response.json",
)

Permintaan ke slug yang tidak ada dijawab dengan JSON 404, bukan halaman HTML.
Header respons tetap membawa `X-RateLimit-Limit` dan `X-RateLimit-Remaining`
karena middleware throttle berjalan sebelum controller.

#codeblock(
  breakable: true,
  ```text
  HTTP/1.1 404 Not Found
  Content-Type: application/json
  X-RateLimit-Limit: 60
  X-RateLimit-Remaining: 58
  ```,
  file: "terminal",
)

== Pencarian, filter, sorting, dan pagination pada API

Endpoint `/api/projects` menerima parameter yang sama dengan halaman publik.
`search` mencocokkan judul, ringkasan, dan deskripsi; `category` dan
`technology` memakai slug relasi; `sort` menerima `oldest`, `title`, atau
`project_date`; `per_page` dibatasi ke 9, 18, atau 27. Pembatasan ini mencegah
klien meminta seluruh tabel sekaligus.

#tab(
  caption: [Parameter query pada endpoint proyek.],
  columns: (0.9fr, 2.4fr, 2.3fr),
  header: ([Parameter], [Nilai], [Efek]),
  [`search`], [Teks bebas], [Mencocokkan judul, ringkasan, deskripsi],
  [`category`], [Slug kategori], [Membatasi lewat relasi kategori],
  [`technology`], [Slug teknologi], [Membatasi lewat relasi teknologi],
  [`sort`], [`oldest`, `title`, `project_date`], [Menentukan urutan hasil],
  [`per_page`], [`9`, `18`, `27`], [Ukuran halaman; nilai lain kembali ke 9],
  align: (left, left, left),
  size: 9pt,
)

Filter kategori dan teknologi memakai `whereHas()`, bukan `join`. Pendekatan
ini menjaga satu baris per proyek meskipun proyek memiliki banyak teknologi.
`withQueryString()` memastikan URL pada `links.next` tetap membawa filter,
sehingga klien dapat melanjutkan halaman tanpa kehilangan konteks.

== Kategori dan teknologi dengan `withCount`

Endpoint `/api/categories` mengembalikan id, nama, slug, dan jumlah proyek
terbit. `withCount()` dengan closure `published()` menghasilkan subquery
`count(*)` yang hanya menghitung proyek berstatus published, sehingga angka
pada API sesuai dengan jumlah proyek yang benar-benar terlihat publik.
Endpoint teknologi memakai pola yang sama.

#codeblock(
  breakable: true,
  ```php
  $categories = Category::query()
      ->withCount(['projects' => fn ($query) => $query->published()])
      ->orderBy('name')
      ->get();

  return CategoryResource::collection($categories);
  ```,
  file: "app/Http/Controllers/Api/CategoryController.php",
)

#codeblock(
  breakable: true,
  ```json
  {
      "data": [
          {"id": 5, "name": "Web", "slug": "web", "projects_count": 7},
          {"id": 2, "name": "API", "slug": "api", "projects_count": 1}
      ]
  }
  ```,
  file: "response.json",
)

== Rate limiter API

Named limiter `portfolio-api` didefinisikan di `AppServiceProvider`. Setiap
request API memakai key IP dan batas 60 request per menit. Limiter `contact`
memakai batas 3 pesan per menit dan dipasang pada route POST `/contact`.
Keduanya memakai cache `database`, jadi counter tidak hilang saat request
selesai.

#codeblock(
  breakable: true,
  ```php
  public function boot(): void
  {
      RateLimiter::for(
          'portfolio-api',
          fn (Request $request) => Limit::perMinute(60)->by($request->ip()),
      );

      RateLimiter::for(
          'contact',
          fn (Request $request) => Limit::perMinute(3)->by($request->ip()),
      );
  }
  ```,
  file: "app/Providers/AppServiceProvider.php",
)

Pengujian manual dilakukan dengan 61 request berurutan ke `/api/projects`.
Hasilnya 60 respons 200 dan satu respons 429. Request ke-61 juga membawa
`Retry-After: 57`, `X-RateLimit-Limit: 60`, `X-RateLimit-Remaining: 0`, dan
`X-RateLimit-Reset` berupa timestamp.

#codeblock(
  breakable: true,
  ```bash
  for i in $(seq 1 61); do
    curl -s -o /dev/null -w "%{http_code}\n" \
      -H 'Accept: application/json' http://127.0.0.1:8000/api/projects
  done | sort | uniq -c
  ```,
  file: "terminal",
)

#codeblock(
  breakable: true,
  ```text
       60 200
        1 429
  ```,
  file: "terminal",
)

#codeblock(
  breakable: true,
  ```text
  HTTP/1.1 429 Too Many Requests
  X-RateLimit-Limit: 60
  X-RateLimit-Remaining: 0
  Retry-After: 57
  X-RateLimit-Reset: 1794936397
  ```,
  file: "terminal",
)

== Form contact dan throttle

Halaman `/contact` menampilkan form nama, email, subjek, dan pesan. Form
mengirim POST ke route `contact.store` yang memakai middleware
`throttle:contact`. Validasi menolak email yang tidak valid dan pesan yang
terlalu pendek; pesan yang valid disimpan ke `contact_messages` dengan
`is_read = false`.

#codeblock(
  breakable: true,
  ```php
  public function store(Request $request): RedirectResponse
  {
      $validated = $request->validate([
          'name' => 'required|string|max:100',
          'email' => 'required|email|max:100',
          'subject' => 'nullable|string|max:200',
          'message' => 'required|string|min:10|max:5000',
      ]);

      ContactMessage::create($validated);

      return back()->with('success', 'Pesan berhasil dikirim. Terima kasih!');
  }
  ```,
  file: "app/Http/Controllers/ContactMessageController.php",
)

#fig(
  image("assets/contact-form.png", width: 78%),
  caption: [Form contact pada halaman publik.],
)

#fig(
  image("assets/contact-success.png", width: 78%),
  caption: [Notifikasi setelah pesan valid tersimpan.],
)

Pengujian contact mengirim tiga pesan valid lalu pesan keempat. Tiga pesan
pertama tersimpan dan diarahkan kembali ke form; pesan keempat dijawab 429.
Jumlah baris di `contact_messages` tetap tiga, sehingga throttle bekerja
sebelum controller sempat menyimpan data.

#codeblock(
  breakable: true,
  ```text
  ✓ contact form is public
  ✓ a valid message is stored
  ✓ invalid message is rejected
  ✓ contact form is throttled after three messages
  ```,
  file: "test output",
)

== Admin messages dan dashboard

Pesan yang masuk ditampilkan di `/admin/messages` dengan kolom nama, email,
subjek, waktu diterima, status, dan aksi. Halaman ini dilindungi middleware
`auth` dan `admin`. Membuka detail pesan mengubah `is_read` menjadi `true`
sebelum halaman dirender, sehingga status pada daftar berubah dari “Belum
dibaca” menjadi “Sudah dibaca”.

#codeblock(
  breakable: true,
  ```php
  public function show(ContactMessage $contactMessage): View
  {
      if (! $contactMessage->is_read) {
          $contactMessage->update(['is_read' => true]);
      }

      return view('admin.messages.show', ['message' => $contactMessage]);
  }
  ```,
  file: "app/Http/Controllers/Admin/ContactMessageController.php",
)

#fig(
  image("assets/admin-messages.png", width: 82%),
  caption: [Daftar pesan contact pada panel admin.],
)

#fig(
  image("assets/admin-message-detail.png", width: 82%),
  caption: [Detail pesan; status berubah menjadi sudah dibaca.],
)

Dashboard menambahkan dua kartu: jumlah seluruh pesan dan jumlah pesan yang
belum dibaca. Keduanya dihitung dari model `ContactMessage`; kartu unread
memakai scope `unread()` yang membungkus `where('is_read', false)`.

#codeblock(
  breakable: true,
  ```php
  'totalMessages' => ContactMessage::count(),
  'unreadMessages' => ContactMessage::unread()->count(),
  ```,
  file: "app/Http/Controllers/DashboardController.php",
)

#fig(
  image("assets/admin-dashboard.png", width: 72%),
  caption: [Dashboard dengan kartu Messages dan Unread messages.],
)

== Pengujian otomatis

Seluruh suite berisi 100 pengujian dengan 431 assertion dan lulus. Pengujian
baru mencakup empat area: API proyek, API kategori, contact dan throttle, serta
admin messages. Pengujian rate limit mengirim 60 request yang harus 200 dan
request ke-61 yang harus 429; pengujian juga memeriksa header
`X-RateLimit-Limit` dan `Retry-After`.

#codeblock(
  breakable: true,
  ```text
  Tests:    100 passed (431 assertions)
  Duration: 4.89s
  ```,
  file: "test output",
)

#tab(
  caption: [Berkas pengujian baru dan perilaku yang dicakup.],
  columns: (2.2fr, 3.2fr),
  header: ([Berkas], [Perilaku]),
  [`Api/ProjectApiTest`], [Bentuk JSON, filter, 404, batas `per_page`],
  [`Api/CategoryApiTest`], [`projects_count` hanya menghitung proyek terbit],
  [`ContactMessageTest`], [Validasi, penyimpanan, throttle 3 pesan],
  [`ApiRateLimitTest`], [60 request 200, request ke-61 429, header],
  [`AdminMessageTest`], [Akses admin, daftar pesan, penandaan dibaca],
  align: (left, left),
  size: 9pt,
)

== Adaptasi terhadap kondisi proyek

Proyek memakai Laravel 13.32.0 dan sudah memiliki tabel `contacts` untuk link
kontak pada halaman About. Karena itu pesan contact disimpan di
`contact_messages`, sedangkan tabel `contacts` tidak diubah. Perbedaan ini
menjaga data lama tetap valid dan menghindari migrasi yang merusak halaman
About.

Route admin mengikuti konvensi aplikasi. Seluruh panel memakai prefix
`/admin`, sehingga route pesan adalah `/admin/messages`. Daftar pesan, detail,
status baca, dan perlindungan admin tetap sama.

#pagebreak()

= Penutup

== Kesimpulan

REST API pada aplikasi portofolio dibangun dengan empat endpoint: daftar
proyek, detail proyek, kategori, dan teknologi. Setiap respons memakai API
Resource dan bentuk pagination yang konsisten, sehingga klien menerima field
yang stabil tanpa melihat kolom internal database. Filter `search`,
`category`, `technology`, `sort`, dan `per_page` memakai query yang sama
dengan halaman publik, dan `withQueryString()` menjaga filter pada tautan
halaman berikutnya.

Rate limiting melindungi dua jalur yang berbeda. API dibatasi 60 request per
menit per IP, sedangkan form contact dibatasi 3 pesan per menit per IP. Named
limiter memisahkan counter keduanya, dan respons 429 membawa `Retry-After`
serta header `X-RateLimit-*`. Pengujian manual menunjukkan 60 respons 200 dan
satu respons 429 dari 61 request.

Form contact menyimpan pesan ke `contact_messages` setelah validasi, lalu
panel admin menampilkan pesan dan menandainya dibaca. Dashboard menghitung
seluruh pesan dan pesan yang belum dibaca. Seluruh alur diverifikasi oleh 100
pengujian dengan 431 assertion.

== Saran

API dapat dikembangkan dengan autentikasi token untuk endpoint tulis,
documentation OpenAPI, dan versi API (`/api/v1`) agar perubahan kontrak tidak
langsung memutus klien lama. Rate limit dapat dinaikkan untuk pengguna
terautentikasi dan diturunkan untuk tamu, atau memakai algoritma sliding
window jika batas per menit perlu lebih halus.

Form contact dapat ditambah honeypot dan verifikasi email sebelum pesan
diteruskan ke admin. Panel admin dapat menambahkan filter belum dibaca,
pencarian pesan, dan aksi hapus, sedangkan dashboard dapat menampilkan grafik
pesan per hari. Untuk produksi, cache rate limit sebaiknya memakai Redis agar
counter konsisten di beberapa instance aplikasi.

