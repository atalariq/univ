#import "@atalariq/lab-report:4.0.0": *

#let labels = (
  cover-title: "LAPORAN PRAKTIKUM",
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
)

#let fig = img.with(supplement: [Gambar])
#let tab = tbl.with(supplement: [Tabel])

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
  header-left: [Laporan Praktikum],
  header-right: [Pemrograman Web Lanjutan],
  footer-center: context counter(page).display(),
  bib: bibliography("references.yaml", style: "ieee"),
  bib-title: [Daftar Pustaka],
  labels: labels,
)

#show raw.where(block: true): set text(size: 0.8em)

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
    "2026",
  ),
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
melalui slug. Perubahan ini bukan sekadar menambah kontrol pada view; query
yang dibangun harus tetap efisien, filter harus bertahan saat berpindah
halaman, dan hasilnya harus dapat direproduksi dari URL. Laporan ini membahas
implementasi tersebut pada aplikasi portofolio, dengan kode acuan commit
`051d370` @repo_p11 dan modul praktikum @module_p11.

== Tujuan Praktikum

+ Membaca query parameter dari URL dan menghubungkannya dengan form `GET`.
+ Membangun query dinamis menggunakan `when()` tanpa rangkaian `if` yang
  berulang.
+ Memfilter proyek berdasarkan relasi kategori dan teknologi menggunakan
  `whereHas()`.
+ Menambahkan sorting dan pagination yang tetap menjaga query string.
+ Menampilkan halaman detail proyek melalui slug, bukan ID.
+ Menyelesaikan Latihan modul: filter technology, sort `project_date`, jumlah
  hasil dan Reset, serta pencarian admin dengan filter status.

= Dasar Teori

== Query Parameter dan Form GET

Query parameter adalah pasangan kunci-nilai yang dikirim setelah tanda tanya
pada URL, misalnya `/projects?search=laravel&category=web`. Laravel membaca
nilai tersebut melalui objek request, sehingga aplikasi tidak perlu mengakses
variabel global @laravel_requests. Form dengan metode `GET` menghasilkan URL
yang dapat dibagikan, di-bookmark, dan dimuat ulang tanpa mengirim ulang data.
Pola form GET dan directive Blade dijelaskan pada dokumentasi Blade
@laravel_blade.

Form `POST` dipakai untuk mengubah data, sedangkan form `GET` dipakai untuk
membaca dan menyaring data. Karena filter proyek bersifat membaca, seluruh
kontrol pencarian, kategori, teknologi, sorting, dan ukuran halaman memakai
`GET`.

== Query Builder dan `when()`

Query builder Laravel memungkinkan query dibangun secara bertahap. Method
`when($condition, $callback)` hanya menjalankan callback jika kondisi bernilai
benar @laravel_queries. Dengan pola ini, query tetap terbaca sebagai satu
rantai meskipun jumlah filter bertambah.

Tanpa `when()`, kode biasanya berisi banyak `if` yang masing-masing memanggil
`where()`. Pola tersebut mudah menjadi panjang dan sulit dibaca. `when()`
menjaga satu query tetap satu alur, sekaligus memastikan filter yang kosong
tidak mengubah hasil.

== Filter Relasi dengan `whereHas()`

`whereHas()` menambahkan subquery `exists` untuk memeriksa keberadaan relasi
yang cocok @laravel_eloquent. Pada aplikasi ini, filter kategori memeriksa
`category.slug`, sedangkan filter teknologi memeriksa `technologies.slug`.
Pendekatan ini lebih tepat daripada `join` untuk relasi banyak-ke-banyak
karena tidak menggandakan baris proyek ketika satu proyek memiliki beberapa
teknologi.

Hasilnya tetap satu baris per proyek, sementara database hanya perlu
membuktikan bahwa relasi yang diminta ada. Relasi `belongsToMany` pada
`Project::technologies()` dan `Technology::projects()` menjadi dasar subquery
tersebut.

== Eager Loading dan Masalah N+1

Relasi yang ditampilkan di card dan halaman detail dimuat dengan `with()`.
Tanpa eager loading, setiap card dapat memicu query kategori, teknologi, dan
gambar secara terpisah. Pola ini dikenal sebagai masalah N+1 @laravel_eloquent.
Eager loading menggabungkan kebutuhan tersebut menjadi beberapa query tambahan
yang jumlahnya tetap, bukan bertambah mengikuti jumlah proyek.

Pada halaman publik, eager loading mencakup `category`, `technologies`, dan
`images`. Halaman admin juga memuat `category` dan `images` agar thumbnail
serta hitungan gambar tidak memicu query per baris.

== Sorting, Pagination, dan `withQueryString()`

Sorting menentukan urutan hasil sebelum pagination. Aplikasi menyediakan
urutan terbaru, terlama, judul A–Z, dan `project_date`. Pagination membatasi
jumlah baris yang diambil dari database dan menghasilkan navigasi halaman
@laravel_pagination.

`withQueryString()` menambahkan query string aktif ke tautan pagination. Tanpa
method tersebut, pindah ke halaman dua akan menghilangkan `search`, `category`,
`technology`, `sort`, dan `per_page`. Dampaknya, pengguna merasa filter hilang
walaupun query database sebenarnya masih benar.

== Route Model Binding melalui Slug

Route model binding memungkinkan controller menerima instance model langsung
dari parameter route @laravel_routing. Model `Project` mengembalikan `slug`
melalui `getRouteKeyName()`, sehingga `/projects/personal-picks` mencari proyek
berdasarkan slug. Nilai slug dibentuk dengan `Str::slug()` @laravel_strings.
Slug lebih stabil dan mudah dibaca daripada ID, tetapi perubahannya harus
dikelola agar URL lama tidak rusak.

Proyek berstatus `draft` tidak boleh tampil kepada tamu. Aplikasi mengembalikan
404 untuk tamu, tetapi memberi kesempatan admin melihat pratinjau. Keputusan
ini melanjutkan perilaku pertemuan 10.

== Validasi dan Migrasi Kolom Nullable

Kolom baru dibuat melalui migration baru, bukan dengan mengubah migration
lama. Kolom yang belum tentu dimiliki data lama dibuat `nullable()` agar baris
lama tetap valid. Validasi di sisi server memastikan `status` hanya berisi
`draft` atau `published`, URL hanya berisi URL yang sah, dan relasi teknologi
menunjuk ID yang ada @laravel_validation.

#pagebreak()

= Hasil dan Pembahasan

Laporan ini menjelaskan fitur pertemuan 11 pada kode akhir portofolio. Kode
acuan adalah commit `051d370` @repo_p11; kondisi awal adalah aplikasi pertemuan
10 pada commit `d78b48b`. Lingkungan pengujian memakai PHP 8.5.12, Laravel
13.32.0, Node.js 24, MariaDB 11, dan `mise` + Podman.

Untuk mereproduksi keadaan akhir:

#codeblock(
  ```sh
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
  lang: "sh",
  header: [terminal],
)

== Menyiapkan Kolom dan Data Proyek

Modul meminta kolom `slug`, `short_description`, `description`, `status`,
`project_date`, `is_featured`, `project_url`, dan `repository_url`. Aplikasi
sudah memiliki `slug`, `status`, `description`, dan `thumbnail` dari pertemuan
ke-10. Karena itu, migration pertemuan 11 hanya menambah kolom yang belum ada
dan menyesuaikan kolom lama.

Modul memakai entitas `Post` dan kolom `name`; aplikasi memakai `Project` dan
kolom `title` agar konsisten dengan portofolio pertemuan 4–10. Perbedaan ini
tidak mengubah tujuan pembelajaran: query, filter, sorting, dan pagination
tetap dibangun dengan pola yang sama.

#codeblock(
  ```sh
  php artisan make:migration add_detail_columns_to_projects_table
  php artisan migrate
  php artisan migrate:status
  ```,
  lang: "sh",
  header: [terminal],
)

Migration yang dipakai:

#codeblock(
  ```php
  Schema::table('projects', function (Blueprint $table) {
      $table->string('short_description', 255)->nullable()->after('slug');
      $table->renameColumn('repo', 'repository_url');
      $table->text('description')->nullable()->change();
      $table->date('project_date')->nullable()->after('status');
      $table->boolean('is_featured')->default(false)->after('project_date');
      $table->string('project_url', 255)->nullable()->after('is_featured');
  });
  ```,
  lang: "php",
  highlight-lang: "PHP Source",
  header: [database/migrations/2026_11_12_000001_add_detail_columns_to_projects_table.php],
)

Baris lama diisi melalui loop PHP agar tetap portabel di MariaDB dan SQLite.
Nilai `repo` yang masih berbentuk `owner/repository` diubah menjadi URL GitHub
lengkap, sedangkan `short_description` diisi dari potongan `description` lama.
Dengan cara ini, data pertemuan 10 tidak hilang dan halaman lama tetap dapat
dirender.

Model `Project` memuat kolom baru di `$fillable`, memberi cast pada
`project_date` dan `is_featured`, serta membentuk slug dari judul.

#codeblock(
  ```php
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

  protected function casts(): array
  {
      return [
          'project_date' => 'date',
          'is_featured' => 'boolean',
      ];
  }
  ```,
  lang: "php",
  highlight-lang: "PHP Source",
  header: [app/Models/Project.php],
)

Slug hanya dibuat ketika masih kosong. Dengan demikian, perubahan judul tidak
diam-diam mengubah URL yang sudah dibagikan. Method `uniqueSlug()` menambahkan
sufiks angka jika slug sudah dipakai.

Validasi dipusatkan pada `validateProject()` agar form tambah dan edit memakai
aturan yang sama.

#codeblock(
  ```php
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
  lang: "php",
  highlight-lang: "PHP Source",
  header: [app/Http/Controllers/ProjectController.php],
)

Aturan `in:published,draft` mencegah status lain masuk. Aturan `url` menjaga
tombol proyek dan repositori hanya berisi alamat yang sah. Relasi teknologi
divalidasi dengan `exists` agar ID yang tidak ada tidak masuk ke tabel pivot.

Data uji diisi melalui `ProjectSeeder`. Seeder menghapus proyek lama,
menyalin gambar dari `database/seeders/assets`, lalu membuat proyek beserta
relasi teknologi dan galeri. Modul memakai `attach()`; aplikasi memakai
`sync()` agar teknologi yang tidak dipilih ikut dilepas dan daftar yang
tersimpan sama persis dengan pilihan pada data seed.

#codeblock(
  ```php
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
  lang: "php",
  highlight-lang: "PHP Source",
  header: [database/seeders/ProjectSeeder.php],
)

Filter kategori dan teknologi membutuhkan slug pada tabel `categories` dan
`technologies`, serta tabel pivot `project_technology`. Ketiganya sudah dibuat
pada pertemuan 10; pertemuan 11 tidak membuat migration duplikat. Tabel pivot
memakai primary key gabungan `project_id` dan `technology_id` untuk mencegah
baris ganda.

#codeblock(
  ```php
  Schema::create('project_technology', function (Blueprint $table) {
      $table->foreignId('project_id')->constrained()->cascadeOnDelete();
      $table->foreignId('technology_id')->constrained()->cascadeOnDelete();
      $table->primary(['project_id', 'technology_id']);
  });
  ```,
  lang: "php",
  highlight-lang: "PHP Source",
  header: [database/migrations/2026_11_05_021358_create_project_technology_table.php],
)

Relasi dua arah didefinisikan pada model:

#codeblock(
  ```php
  public function technologies(): BelongsToMany
  {
      return $this->belongsToMany(Technology::class);
  }

  public function projects(): BelongsToMany
  {
      return $this->belongsToMany(Project::class);
  }
  ```,
  lang: "php",
  highlight-lang: "PHP Source",
  header: [app/Models/Project.php dan app/Models/Technology.php],
)

Data uji terdiri atas 12 proyek, 5 kategori, 31 teknologi, dan 24 gambar.
Sebaran proyek ditunjukkan pada tabel berikut.

#tab(
  caption: [Data uji proyek pada aplikasi pertemuan 11.],
  columns: (0.45fr, 2.1fr, 1.05fr, 1.1fr, 0.7fr),
  [No.], [Proyek], [Kategori], [Tanggal], [Unggulan],
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
)

Dengan 12 proyek dan 9 item per halaman, halaman kedua tetap dapat diuji. Data
ini juga memenuhi syarat minimal 10 proyek pada modul.

Pengujian `ProjectCrudTest` dan `ProjectUploadTest` memastikan kolom baru
tersimpan, validasi berjalan, dan upload thumbnail tetap bekerja. Pada suite
penuh, seluruh 86 pengujian lulus dengan 303 assertion; angka ini juga mencakup
pengujian pencarian, filter, sorting, pagination, dan detail yang dibahas pada
subbab berikutnya.

== Membangun Query Pencarian dan Filter

Modul memakai `PortfolioController` dengan method `projects`; aplikasi memakai
`ProjectController` dengan method `publicIndex` karena controller proyek sudah
ada. Controller publik membangun satu query bertahap. Filter hanya ditambahkan
jika parameter benar-benar terisi.

#codeblock(
  ```php
  $perPage = $request->integer('per_page', 9);
  $perPage = in_array($perPage, [9, 18, 27], true) ? $perPage : 9;
  $sort = $request->string('sort')->toString();

  $projects = Project::query()
      ->published()
      ->with(['category', 'technologies', 'images'])
      ->when(
          $request->filled('search'),
          fn ($query) => $query->search($request->string('search')->toString())
      )
      ->when(
          $request->filled('category'),
          fn ($query) => $query->categorySlug($request->string('category')->toString())
      )
      ->when(
          $request->filled('technology'),
          fn ($query) => $query->technologySlug($request->string('technology')->toString())
      )
      ->sorted($sort)
      ->paginate($perPage)
      ->withQueryString();
  ```,
  lang: "php",
  highlight-lang: "PHP Source",
  header: [app/Http/Controllers/ProjectController.php],
)

Scope pencarian mencakup tiga kolom:

#codeblock(
  ```php
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
  lang: "php",
  highlight-lang: "PHP Source",
  header: [app/Models/Project.php],
)

Filter relasi memakai `whereHas()`:

#codeblock(
  ```php
  public function scopeCategorySlug(Builder $query, string $slug): Builder
  {
      return $query->whereHas('category', fn (Builder $query) => $query->where('slug', $slug));
  }

  public function scopeTechnologySlug(Builder $query, string $slug): Builder
  {
      return $query->whereHas('technologies', fn (Builder $query) => $query->where('slug', $slug));
  }
  ```,
  lang: "php",
  highlight-lang: "PHP Source",
  header: [app/Models/Project.php],
)

#tab(
  caption: [Alur pembentukan query pada halaman publik.],
  columns: (1.1fr, 2.5fr, 2.2fr),
  [Tahap], [Kode], [Efek],
  [Request], [`$request->filled('search')`], [Menentukan filter yang aktif],
  [Builder], [`Project::query()->published()`], [Membatasi proyek terbit],
  [Relasi], [`with([...])`], [Eager loading kategori, teknologi, gambar],
  [Search], [`search($keyword)`], [`LIKE` pada tiga kolom teks],
  [Filter], [`categorySlug()` / `technologySlug()`], [`exists` pada relasi],
  [Sorting], [`sorted($sort)`], [Urutan sebelum pagination],
  [Pagination], [`paginate($perPage)`], [Mengambil satu halaman],
  [Tautan], [`withQueryString()`], [Query string ikut ke halaman berikutnya],
)

Form memakai metode `GET`, sehingga seluruh nilai filter terlihat pada URL.
Kutipan berikut menunjukkan bagian penting; kelas Tailwind dan wrapper layout
dihilangkan agar blok kode tetap terbaca.

#codeblock(
  ```blade
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
  lang: "blade",
  highlight-lang: "html",
  header: [resources/views/portfolio/projects.blade.php],
)

Kontrol sort dan `per_page` tidak ditampilkan di sini; keduanya dibahas pada
subbab 3.3. Di bawah form, jumlah hasil dan tombol Reset ditampilkan. Tombol
Reset hanya muncul jika ada filter aktif.

#codeblock(
  ```blade
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
  lang: "blade",
  highlight-lang: "html",
  header: [resources/views/portfolio/projects.blade.php],
)

#pagebreak()

Hasil pencarian `laravel` ditunjukkan pada gambar berikut.

#fig(
  image("assets/page-projects-search.png", width: 100%),
  caption: [Pencarian `laravel` pada `/projects`; jumlah hasil dan tombol Reset tampil karena filter aktif.],
)

Pencarian mencakup judul, ringkasan, dan deskripsi. Karena itu, kata kunci yang
muncul di salah satu kolom tetap menemukan proyek yang relevan. Jumlah hasil
dihitung dari paginator, bukan dari jumlah card yang terlihat, sehingga nilai
pada teks tetap benar ketika hasil melebihi satu halaman. Tombol Reset
mengembalikan URL ke `/projects` tanpa parameter.

Kombinasi kategori, teknologi, dan sorting ditunjukkan pada gambar berikut.

#fig(
  image("assets/page-projects-filter.png", width: 100%),
  caption: [Kombinasi filter kategori `web`, teknologi `typescript`, dan sorting `project_date`.],
)

Filter technology adalah bagian dari Latihan modul. Nilainya memakai slug
teknologi, bukan ID, sehingga URL tetap mudah dibaca dan dapat dibagikan.

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
  public function scopeSorted(Builder $query, ?string $sort): Builder
  {
      return match ($sort) {
          'oldest' => $query->orderBy('project_date')->orderBy('id'),
          'title' => $query->orderBy('title'),
          'project_date' => $query->orderByDesc('project_date')->orderByDesc('id'),
          default => $query->orderByDesc('project_date')->orderByDesc('id'),
      };
  }
  ```,
  lang: "php",
  highlight-lang: "PHP Source",
  header: [app/Models/Project.php],
)

Pagination memakai 9 item sebagai default. Nilai `per_page` dibatasi pada 9,
18, dan 27 agar ukuran halaman tidak dapat diubah menjadi nilai yang tidak
masuk akal. `withQueryString()` memastikan filter tetap ada pada tautan halaman
kedua.

Halaman kedua tetap membawa filter yang sama. Nilai form, jumlah hasil, dan
tautan pagination konsisten karena controller memakai `withQueryString()`.
Pembaca dapat memeriksa tautan halaman pada HTML: parameter `search`,
`category`, `technology`, `sort`, dan `per_page` ikut muncul. Jika salah satu
parameter hilang, periksa urutan pemanggilan `withQueryString()` sebelum
`links()`.

#fig(
  image("assets/page-projects-page2.png", width: 100%),
  caption: [Halaman 2 dari 12 proyek; sorting dan ukuran halaman tetap terbawa.],
)

#pagebreak()

Jika tidak ada hasil, halaman menampilkan empty state dan tombol Reset.

#fig(
  image("assets/page-projects-empty.png", width: 100%),
  caption: [Empty state saat pencarian tidak menemukan proyek.],
)

Pengujian `ProjectSearchFilterTest` juga menguji sorting `title` dan
`project_date`, batas `per_page`, serta keberadaan query string pada tautan
halaman kedua. Latihan sort `project_date` terpenuhi melalui opsi
`Project date` pada form dan scope `sorted()`.

== Menampilkan Detail Proyek melalui Slug

Modul memakai `{project:slug}` pada route; aplikasi memakai `getRouteKeyName()`
pada model. Route publik tetap memakai parameter slug dan model mengembalikan
slug sebagai route key.

#codeblock(
  ```php
  Route::get('/projects', [ProjectController::class, 'publicIndex'])->name('projects.index');
  Route::get('/projects/{project:slug}', [ProjectController::class, 'show'])->name('projects.show');
  ```,
  lang: "php",
  highlight-lang: "PHP Source",
  header: [routes/web.php],
)

Controller detail memuat relasi yang dibutuhkan dan menolak draft untuk tamu.

#codeblock(
  ```php
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
  lang: "php",
  highlight-lang: "PHP Source",
  header: [app/Http/Controllers/ProjectController.php],
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
  image("assets/page-project-detail.png", width: 100%),
  caption: [Detail proyek `Personal Picks`; URL proyek, repositori, dan galeri tampil dari data proyek.],
)

Pengujian `PublicPageTest` memastikan halaman detail dapat dibuka melalui slug,
proyek `draft` menghasilkan 404 untuk tamu, dan admin dapat melihat pratinjau.
Data seed seluruhnya berstatus `published`, sehingga perilaku draft dibuktikan
melalui feature test, bukan melalui data seed.

== Menambahkan Pencarian dan Filter Admin

Area admin memakai prefix `/admin`, bukan `/post` seperti pada modul. Form
admin menyediakan pencarian dan filter status; keduanya memakai scope yang
sama dengan halaman publik.

#codeblock(
  ```blade
  <form method="GET" action="{{ route('admin.projects.index') }}">
      <input name="search" value="{{ request('search') }}" placeholder="Title or description…">

      <select name="status">
          <option value="">All statuses</option>
          <option value="published" @selected(request('status') === 'published')>Published</option>
          <option value="draft" @selected(request('status') === 'draft')>Draft</option>
      </select>
  </form>
  ```,
  lang: "blade",
  highlight-lang: "html",
  header: [resources/views/admin/projects/index.blade.php],
)

#fig(
  image("assets/page-admin-projects-filter.png", width: 100%),
  caption: [Pencarian `portfolio` dan filter status `published` pada halaman admin.],
)

Pencarian admin memakai scope `search()` yang sama dengan halaman publik, lalu
ditambah filter status. Pengujian memastikan hasil admin terfilter dan tidak
menampilkan proyek dengan status yang tidak dipilih.

#pagebreak()

= Kesimpulan dan Saran

== Kesimpulan

+ Query parameter dibaca melalui objek request dan dihubungkan dengan form
  `GET`; seluruh kombinasi pencarian, kategori, teknologi, sorting, dan ukuran
  halaman dapat direproduksi dari URL.
+ `when()` membuat query dinamis tetap terbaca, sedangkan `whereHas()`
  memfilter relasi kategori dan teknologi tanpa menggandakan baris proyek.
+ Sorting dan pagination bekerja bersama; `withQueryString()` menjaga filter
  saat pengguna berpindah ke halaman berikutnya.
+ Halaman detail memakai slug melalui route model binding; proyek draft
  menghasilkan 404 untuk tamu dan dapat dipratinjau admin.
+ Data uji berisi 12 proyek, 5 kategori, dan 31 teknologi, sehingga pagination
  dan filter dapat diuji dengan data yang cukup.
+ Seluruh Latihan modul terpenuhi: filter technology, sort `project_date`,
  jumlah hasil dan Reset, serta pencarian admin dengan filter status.
+ Pengujian otomatis mencatat 86 pengujian lulus dengan 303 assertion; bukti
  visual tersedia untuk pencarian, filter, halaman kedua, detail, dan admin.

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
