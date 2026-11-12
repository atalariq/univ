#import "@atalariq/lab-report:3.0.0": *

#set par(justify: true)

#let metadata = (
    author: "Atalariq Barra Hadinugraha",
    id: "25/557554/SV/26192",
    class: "B2",
    course: "Praktikum Pemrograman Web Lanjutan",
    course-code: "PPWL",
    lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
    meeting: "11",
    title: "Search, Filter, dan Sorting",
    logo: image("assets/logo.png", width: 6cm),
)

#show: report.with(
    bib: bibliography("references.yaml"),
    font: ("Times New Roman",),
)

#show heading.where(level: 1): set align(center)

#cover(..metadata)
#toc(break-page: true)
#tof(break-page: true)
#tot(break-page: true)

= Tujuan Praktikum

+ Membaca parameter kueri dari URL dan menghubungkannya dengan formulir GET.
+ Membangun kueri dinamis menggunakan `when()` tanpa rangkaian percabangan yang
  berulang.
+ Memfilter proyek berdasarkan relasi kategori dan teknologi menggunakan
  `whereHas()`.
+ Menambahkan pengurutan dan paginasi yang tetap menjaga string kueri.
+ Menampilkan halaman detail proyek melalui *slug*, bukan ID.
+ Menyelesaikan Latihan modul: filter teknologi, sort `project_date`, jumlah
  hasil dan Reset, serta pencarian admin dengan filter status.

= Dasar Teori

== Parameter kueri dan formulir GET

Parameter kueri adalah pasangan kunci-nilai yang dikirim setelah tanda tanya pada
URL, misalnya `/projects?search=laravel&category=web`. Laravel menyediakan akses
yang aman melalui objek *request*, sehingga nilai dapat dibaca tanpa mengandalkan
variabel global @laravel_requests. Formulir dengan metode `GET` menghasilkan URL yang
dapat dibagikan, di-*bookmark*, dan dimuat ulang tanpa mengirim ulang data.
Pola formulir GET dan direktif Blade dijelaskan pada dokumentasi Blade @laravel_blade.

Pendekatan ini berbeda dari formulir `POST`. Formulir `POST` dipakai untuk mengubah data,
sedangkan formulir `GET` dipakai untuk membaca dan menyaring data. Karena filter
proyek bersifat membaca, seluruh kontrol pencarian, kategori, teknologi, pengurutan,
dan ukuran halaman memakai `GET`.

== Pembangun kueri dan `when()`

Pembangun kueri Laravel memungkinkan kueri dibangun secara bertahap. Metode
`when($condition, $callback)` hanya menjalankan *callback* jika kondisi bernilai
benar @laravel_queries. Dengan pola ini, kueri tetap terbaca sebagai satu rantai
meskipun jumlah filter bertambah.

Tanpa `when()`, kode biasanya berisi banyak `if` yang masing-masing memanggil
`where()`. Pola tersebut mudah menjadi panjang dan sulit dibaca. `when()` menjaga
satu kueri tetap satu alur, sekaligus memastikan filter yang kosong tidak
mengubah hasil.

== Filter relasi dengan `whereHas()`

`whereHas()` menambahkan *subquery* `exists` untuk memeriksa keberadaan relasi yang
cocok @laravel_eloquent. Pada aplikasi ini, filter kategori memeriksa
`category.slug`, sedangkan filter teknologi memeriksa `technologies.slug`.
Pendekatan ini lebih tepat daripada `join` untuk relasi banyak-ke-banyak karena
tidak menggandakan baris proyek ketika satu proyek memiliki beberapa teknologi.

Hasil akhirnya tetap satu baris per proyek, sementara basis data hanya perlu
membuktikan bahwa relasi yang diminta ada. Relasi `belongsToMany` pada
`Project::technologies()` dan `Technology::projects()` menjadi dasar *subquery*
tersebut.

== Pemuatan relasi dan masalah N+1

Relasi yang ditampilkan di kartu dan halaman detail dimuat dengan `with()`.
Tanpa *eager loading*, setiap kartu dapat memicu kueri kategori, teknologi, dan
gambar secara terpisah. Pola ini dikenal sebagai N+1 kueri @laravel_eloquent.
*Eager loading* menggabungkan kebutuhan tersebut menjadi beberapa kueri tambahan
yang jumlahnya tetap, bukan bertambah mengikuti jumlah proyek.

Pada halaman publik, *eager loading* mencakup `category`, `technologies`, dan
`images`. Halaman admin juga memuat `category` dan `images` agar gambar mini serta
hitungan gambar tidak memicu kueri per baris.

== Pengurutan, paginasi, dan `withQueryString()`

Pengurutan menentukan urutan hasil sebelum paginasi. Aplikasi menyediakan urutan
terbaru, terlama, judul A–Z, dan `project_date`. Paginasi membatasi jumlah baris
yang diambil dari basis data dan menghasilkan navigasi halaman
@laravel_pagination.

`withQueryString()` menambahkan string kueri aktif ke tautan paginasi. Tanpa
metode tersebut, pindah ke halaman dua akan menghilangkan `search`, `category`,
`technology`, `sort`, dan `per_page`. Dampaknya, pengguna merasa filter hilang
walaupun kueri basis data sebenarnya masih benar.

== Pengikatan model route melalui *slug*

*Route model binding* memungkinkan *controller* menerima instans model langsung dari
parameter *route* @laravel_routing. Model `Project` mengembalikan `slug` melalui
`getRouteKeyName()`, sehingga `/projects/personal-picks` mencari proyek
berdasarkan *slug*. Nilai *slug* dibentuk dengan `Str::slug()` @laravel_strings. *Slug* lebih stabil dan mudah dibaca daripada ID, tetapi
perubahannya harus dikelola agar URL lama tidak rusak.

Proyek berstatus `draft` tidak boleh tampil kepada tamu. Aplikasi mengembalikan
404 untuk tamu, tetapi memberi kesempatan admin melihat pratinjau. Keputusan ini
melanjutkan perilaku pertemuan 10.

== Validasi dan migrasi kolom nullable

Kolom baru dibuat melalui migrasi baru, bukan dengan mengubah migrasi lama.
Kolom yang belum tentu dimiliki data lama dibuat `nullable()` agar baris lama
tetap valid. Validasi di sisi server memastikan `status` hanya berisi `draft`
atau `published`, URL hanya berisi URL yang sah, dan relasi teknologi menunjuk
ID yang ada @laravel_validation.

#pagebreak()

= Hasil dan Pembahasan

Laporan ini menjelaskan fitur pertemuan 11 @module_p11 pada kode akhir
portofolio. Kode acuan adalah commit `051d370` @repo_p11; kondisi awal adalah
aplikasi pertemuan 10 pada commit `d78b48b`. Lingkungan pengujian memakai PHP 8.5.12, Laravel 13.32.0, Node.js 24,
MariaDB 11, dan `mise` + Podman.

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
    header: [terminal],
)

== Menyiapkan kolom detail proyek

Modul meminta kolom `slug`, `short_description`, `description`, `status`,
`project_date`, `is_featured`, `project_url`, dan `repository_url`. Aplikasi
sudah memiliki `slug`, `status`, `description`, dan `thumbnail` dari pertemuan ke-10.
Karena itu, migrasi pertemuan 11 hanya menambah kolom yang belum ada dan
menyesuaikan kolom lama.

#codeblock(
    ```sh
    php artisan make:migration add_detail_columns_to_projects_table
    php artisan migrate
    php artisan migrate:status
    ```,
    header: [terminal],
)

Migrasi yang dipakai:

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
    header: [database/migrations/2026_11_12_000001_add_detail_columns_to_projects_table.php],
)

Baris lama diisi melalui loop PHP agar tetap portabel di MariaDB dan SQLite.
Nilai `repo` yang masih berbentuk `owner/repository` diubah menjadi URL GitHub
lengkap, sedangkan `short_description` diisi dari potongan `description` lama.
Dengan cara ini, data pertemuan 10 tidak hilang dan halaman lama tetap dapat
dirender.

Hasil yang diharapkan: migrasi berstatus `Ran`, kolom baru tersedia, dan data
lama tetap memiliki `repository_url` serta ringkasan.

== Menyesuaikan model dan validasi

Model `Project` memuat kolom baru di `$fillable`, memberi konversi tipe pada
`project_date` dan `is_featured`, serta membentuk *slug* dari judul.

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
    header: [app/Models/Project.php],
)

*Slug* hanya dibuat ketika masih kosong. Dengan demikian, perubahan judul tidak
diam-diam mengubah URL yang sudah dibagikan. Metode `uniqueSlug()` menambahkan
sufiks angka jika *slug* sudah dipakai.

Validasi dipusatkan pada `validateProject()` agar formulir tambah dan edit memakai
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
    header: [app/Http/Controllers/ProjectController.php],
)

Aturan `in:published,draft` mencegah status lain masuk. Aturan `url` menjaga
tombol proyek dan repositori hanya berisi alamat yang sah. Relasi teknologi
divalidasi dengan `exists` agar ID yang tidak ada tidak masuk ke tabel *pivot*.

== Mengisi data uji

Data uji diisi melalui `ProjectSeeder`. Pengisi data (*seeder*) menghapus proyek lama, menyalin
gambar dari `database/seeders/assets`, lalu membuat proyek beserta relasi
teknologi dan galeri. Relasi teknologi memakai `sync()` agar daftar yang
tersimpan sama persis dengan pilihan pada data awal.

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
    header: [database/seeders/ProjectSeeder.php],
)

Data uji terdiri atas 12 proyek, 5 kategori, 31 teknologi, dan 24 gambar.
Sebaran proyek ditunjukkan pada tabel berikut.

#tbl(
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

== Memastikan prasyarat kategori, teknologi, dan *pivot*

Filter kategori dan teknologi membutuhkan *slug* pada tabel `categories` dan
`technologies`, serta tabel *pivot* `project_technology`. Ketiganya sudah dibuat
pada pertemuan 10. Pertemuan 11 tidak membuat migrasi duplikat; prasyarat
tersebut diverifikasi melalui `migrate:status` dan relasi model.

#codeblock(
    ```php
    Schema::create('project_technology', function (Blueprint $table) {
        $table->foreignId('project_id')->constrained()->cascadeOnDelete();
        $table->foreignId('technology_id')->constrained()->cascadeOnDelete();
        $table->primary(['project_id', 'technology_id']);
    });
    ```,
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
    header: [app/Models/Project.php dan app/Models/Technology.php],
)

Tabel *pivot* tidak memakai `id()` atau `timestamps()`. Kunci primer (*primary key*) gabungan
`project_id` dan `technology_id` mencegah baris ganda. Jika `id()` dibiarkan,
MariaDB dapat menolak migrasi dengan error 1075 karena tabel memiliki dua
kolom auto-increment.

== Membangun kueri pencarian dan filter

*Controller* publik membangun satu kueri bertahap. Filter hanya ditambahkan jika
parameter benar-benar terisi.

#codeblock(
    ```php
    $perPage = $request->integer('per_page', 9);
    $perPage = in_array($perPage, [9, 18, 27], true) ? $perPage : 9;
    $sort = $request->string('sort')->toString();

    $projects = Project::query()
        ->published()
        ->with(['category', 'technologies', 'images'])
        ->when($request->filled('search'), fn ($query) => $query->search($request->string('search')->toString()))
        ->when($request->filled('category'), fn ($query) => $query->categorySlug($request->string('category')->toString()))
        ->when($request->filled('technology'), fn ($query) => $query->technologySlug($request->string('technology')->toString()))
        ->sorted($sort)
        ->paginate($perPage)
        ->withQueryString();
    ```,
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
    header: [app/Models/Project.php],
)

Alur kueri dapat dibaca pada tabel berikut.

#tbl(
    caption: [Alur pembentukan kueri pada halaman publik.],
    columns: (1.1fr, 2.5fr, 2.2fr),
    [Tahap], [Kode], [Efek],
    [Permintaan], [`$request->filled('search')`], [Menentukan filter yang aktif],
    [Pembangun], [`Project::query()->published()`], [Membatasi proyek terbit],
    [Relasi], [`with([...])`], [Pemuatan relasi kategori, teknologi, gambar],
    [Pencarian], [`search($keyword)`], [`LIKE` pada tiga kolom teks],
    [Filter], [`categorySlug()` / `technologySlug()`], [`exists` pada relasi],
    [Pengurutan], [`sorted($sort)`], [Urutan sebelum paginasi],
    [Paginasi], [`paginate($perPage)`], [Mengambil satu halaman],
    [Tautan], [`withQueryString()`], [String kueri ikut ke halaman berikutnya],
)

Hasil yang diharapkan: URL tanpa parameter menampilkan semua proyek published;
parameter yang terisi mempersempit hasil; kombinasi filter bekerja bersama.

== Menambahkan pengurutan dan paginasi

Pengurutan dipusatkan pada scope `sorted()`. Urutan default memakai `project_date`
agar data awal tidak tampil acak hanya karena waktu seeding.

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
    header: [app/Models/Project.php],
)

Paginasi memakai 9 item sebagai default. Nilai `per_page` dibatasi pada 9, 18,
dan 27 agar ukuran halaman tidak dapat diubah menjadi nilai yang tidak masuk
akal. `withQueryString()` memastikan filter tetap ada pada tautan halaman kedua.

== Menampilkan formulir filter dan hasil

Formulir memakai metode `GET`, sehingga seluruh nilai filter terlihat pada URL.
Kutipan berikut menunjukkan bagian penting; kelas Tailwind dan wrapper layout
dihilangkan agar blok kode tetap terbaca.

#codeblock(
    ```blade
    <form method="GET" action="{{ route('projects.index') }}">
        <input name="search" value="{{ request('search') }}">

        <select name="category">
            <option value="">All categories</option>
            @foreach ($categories as $category)
                <option value="{{ $category->slug }}" @selected(request('category') === $category->slug)>
                    {{ $category->name }}
                </option>
            @endforeach
        </select>

        <select name="technology">
            <option value="">All technologies</option>
            @foreach ($technologies as $technology)
                <option value="{{ $technology->slug }}" @selected(request('technology') === $technology->slug)>
                    {{ $technology->name }}
                </option>
            @endforeach
        </select>

        <select name="sort">
            <option value="newest" @selected(request('sort', 'newest') === 'newest')>Newest</option>
            <option value="oldest" @selected(request('sort') === 'oldest')>Oldest</option>
            <option value="title" @selected(request('sort') === 'title')>Title A–Z</option>
            <option value="project_date" @selected(request('sort') === 'project_date')>Project date</option>
        </select>

        <select name="per_page">
            @foreach ([9, 18, 27] as $size)
                <option value="{{ $size }}" @selected((int) request('per_page', 9) === $size)>{{ $size }}</option>
            @endforeach
        </select>
    </form>
    ```,
    header: [resources/views/portfolio/projects.blade.php],
)

Di bawah formulir, jumlah hasil dan tombol Reset ditampilkan. Tombol Reset hanya
muncul jika ada filter aktif.

#codeblock(
    ```blade
    <p>
        {{ $projects->total() }} {{ \Illuminate\Support\Str::plural('project', $projects->total()) }} found
        @if (request()->filled('search') || request()->filled('category') || request()->filled('technology'))
            · filters active
        @endif
    </p>

    @if (request()->filled('search') || request()->filled('category') || request()->filled('technology') || request()->filled('sort') || request()->filled('per_page'))
        <a href="{{ route('projects.index') }}">Reset</a>
    @endif

    <div>
        @forelse ($projects as $project)
            <x-project-card :project="$project" />
        @empty
            <x-ui.empty-state title="No projects found" description="Try a different keyword or reset the filters." />
        @endforelse
    </div>

    {{ $projects->links() }}
    ```,
    header: [resources/views/portfolio/projects.blade.php],
)
Hasil pencarian `laravel` ditunjukkan pada gambar berikut.

#img(
    image("assets/page-projects-search.png", width: 100%),
    caption: [Pencarian `laravel` pada `/projects`; jumlah hasil dan tombol Reset tampil karena filter aktif.],
)

Pencarian mencakup judul, ringkasan, dan deskripsi. Karena itu, kata kunci yang
muncul di salah satu kolom tetap menemukan proyek yang relevan. Jumlah hasil
dihitung dari paginator, bukan dari jumlah kartu yang terlihat, sehingga nilai
pada teks tetap benar ketika hasil melebihi satu halaman. Tombol Reset
mengembalikan URL ke `/projects` tanpa parameter.

Kombinasi kategori, teknologi, dan pengurutan ditunjukkan pada gambar berikut.

#img(
    image("assets/page-projects-filter.png", width: 100%),
    caption: [Kombinasi filter kategori `web`, teknologi `typescript`, dan pengurutan `project_date`.],
)

== Menjaga string kueri antar halaman

Halaman kedua tetap membawa filter yang sama. Nilai formulir, jumlah hasil, dan
tautan paginasi konsisten karena *controller* memakai `withQueryString()`.
Pembaca dapat memeriksa tautan halaman pada HTML: parameter `search`, `category`,
`technology`, `sort`, dan `per_page` ikut muncul. Jika salah satu parameter
hilang, periksa urutan pemanggilan `withQueryString()` sebelum `links()`.
Periksa juga apakah *controller* mengembalikan *paginator*, bukan *collection*. Pada
`get()`, metode `links()` tidak tersedia. Pada `paginate()`, tautan halaman
dibentuk dari kueri yang sedang aktif; karena itu, filter harus sudah ditambahkan
sebelum paginasi dipanggil.

#img(
    image("assets/page-projects-page2.png", width: 100%),
    caption: [Halaman 2 dari 12 proyek; pengurutan dan ukuran halaman tetap terbawa.],
)

Jika tidak ada hasil, halaman menampilkan keadaan kosong (*empty state*) dan tombol Reset.

#img(
    image("assets/page-projects-empty.png", width: 100%),
    caption: [Keadaan kosong saat pencarian tidak menemukan proyek.],
)

== Menampilkan detail proyek lewat *slug*

Route publik memakai parameter *slug* dan model mengembalikan *slug* sebagai route
key.

#codeblock(
    ```php
    Route::get('/projects', [ProjectController::class, 'publicIndex'])->name('projects.index');
    Route::get('/projects/{project:slug}', [ProjectController::class, 'show'])->name('projects.show');
    ```,
    header: [routes/web.php],
)

*Controller* detail memuat relasi yang dibutuhkan dan menolak draft untuk tamu.

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
    header: [app/Http/Controllers/ProjectController.php],
)

Halaman detail menampilkan meta description, tanggal, kategori, repositori,
tombol proyek, teknologi, dan galeri. Meta description diambil dari
`summary()`, sehingga ringkasan yang sama dipakai pada kartu dan hasil pencarian.
Tombol proyek hanya muncul jika `project_url` terisi; tombol repositori muncul
jika `repository_url` terisi. Keduanya membuka tab baru dan memakai
`rel="noopener noreferrer"`.

Proyek `draft` tidak ditampilkan kepada tamu. *Controller* memeriksa status dan
hak admin sebelum memuat relasi. Jika tamu membuka *slug* draft, aplikasi
mengembalikan 404; admin melihat label `Draft preview`. Galeri dimuat dengan
`with('images')` agar tidak terjadi kueri per gambar. Jika *slug* kosong,
pembentukan URL *route* dapat gagal; karena itu, migrasi mengisi *slug* untuk
data lama dan model membentuk *slug* saat proyek dibuat. Jika *slug* berubah,
URL lama tidak otomatis dialihkan; keputusan ini perlu dipertimbangkan sebelum
judul proyek diubah.

Nilai tanggal dan label repositori juga dipusatkan pada model. `project_date`
dikonversi menjadi tanggal sehingga tampilan dapat memanggil `format('F Y')`.
`repositoryLabel()` mengubah URL GitHub menjadi `owner/repository`, sedangkan
`projectDateLabel()` menghasilkan label bulan dan tahun. Pemusatan ini menjaga
format yang sama pada kartu, halaman detail, dan halaman admin.

#img(
    image("assets/page-project-detail.png", width: 100%),
    caption: [Detail proyek `Personal Picks`; URL proyek, repositori, dan galeri tampil dari data proyek.],
)

== Menguji kombinasi pencarian, filter, dan pengurutan

Pengujian otomatis mencakup pencarian, filter kategori, filter teknologi, pengurutan,
batas `per_page`, string kueri, keadaan kosong, dan *draft*.

#codeblock(
    ```php
    public function test_query_string_is_preserved_on_the_next_page(): void
    {
        foreach (range(1, 10) as $index) {
            $this->project(['title' => "Alpha {$index}"]);
        }

        $response = $this->get(route('projects.index', [
            'search' => 'Alpha',
            'sort' => 'title',
            'per_page' => 9,
            'page' => 1,
        ]));

        $response->assertOk();
        $response->assertSee('search=Alpha', false);
        $response->assertSee('sort=title', false);
        $response->assertSee('per_page=9', false);
    }
    ```,
    header: [tests/Feature/ProjectSearchFilterTest.php],
)

Perintah dan hasil pengujian:

#codeblock(
    ```sh
    php artisan test
    ```,
    header: [terminal],
)

#codeblock(
    ```text
    Tests: 86 passed (303 assertions)
    ```,
    header: [output],
)

Skenario pengujian manual dan otomatis dirangkum pada tabel berikut.

#tbl(
    caption: [Skenario pengujian halaman publik dan admin.],
    columns: (2.1fr, 2.3fr, 0.8fr),
    [Skenario], [Hasil yang diharapkan], [Status],
    [`/projects` tanpa parameter], [Semua proyek berstatus `published` tampil], [Sesuai],
    [Pencarian `laravel`], [Hasil relevan dan jumlah hasil berubah], [Sesuai],
    [Filter kategori `web`], [Hanya proyek kategori Web], [Sesuai],
    [Filter teknologi `typescript`], [Hanya proyek dengan teknologi TypeScript], [Sesuai],
    [Pengurutan `title`], [Urutan A–Z], [Sesuai],
    [Pengurutan `project_date`], [Proyek terbaru lebih dahulu], [Sesuai],
    [Halaman 2], [String kueri tetap terbawa], [Sesuai],
    [Pencarian tanpa hasil], [Keadaan kosong dan Reset tampil], [Sesuai],
    [Detail *slug*], [Deskripsi meta, repositori, URL proyek, galeri tampil], [Sesuai],
    [Draft sebagai tamu], [404], [Sesuai],
    [Draft sebagai admin], [Pratinjau tampil], [Sesuai],
    [Pencarian admin + status], [Hasil admin terfilter], [Sesuai],
)

== Menyelesaikan Latihan modul

Latihan modul dikerjakan seluruhnya. Tabel berikut memetakan setiap Latihan ke
implementasi dan bukti.

#tbl(
    caption: [Pemenuhan Latihan modul pertemuan 11.],
    columns: (1.8fr, 2.5fr, 1.5fr),
    [Latihan], [Implementasi], [Bukti],
    [Filter teknologi], [`technology` parameter kueri, pilihan, `technologySlug()`], [Gambar filter],
    [Pengurutan `project_date`], [`sort=project_date`, cakupan `sorted()`], [Gambar halaman 2],
    [Jumlah hasil + Reset], [Jumlah dan tautan Reset di formulir], [Gambar pencarian],
    [Pencarian admin + status], [Formulir admin dengan `search` dan `status`], [Gambar admin filter],
)

Filter teknologi memakai *slug*, bukan ID, sehingga URL tetap mudah dibaca.
Pengurutan `project_date` memakai kolom tanggal, bukan waktu pembuatan baris.
Jumlah hasil dihitung dari *paginator*, sehingga nilainya sama dengan jumlah baris
yang cocok di basis data. Pencarian admin memakai cakupan yang sama dengan halaman
publik, lalu ditambah filter status.

Gambar berikut menunjukkan filter admin dengan pencarian dan status.

#img(
    image("assets/page-admin-projects-filter.png", width: 100%),
    caption: [Pencarian `portfolio` dan filter status `published` pada halaman admin.],
)

Field detail proyek pada formulir admin ditunjukkan pada gambar berikut.

#img(
    image("assets/page-admin-project-form.png", width: 100%),
    caption: [Formulir edit proyek dengan short description, tanggal proyek, featured, URL proyek, dan URL repositori.],
)

== Menangani kasus tepi dan pemecahan masalah

Tabel berikut merangkum gejala yang dibahas modul dan penanganannya.
Sebelum melihat tabel, penting untuk membedakan tiga lapisan masalah: kueri yang
salah, data yang tidak lengkap, dan tampilan yang tidak membawa konteks. Filter
yang hilang saat pindah halaman biasanya masalah tampilan; kolom kosong biasanya
masalah `$fillable` atau migrasi; sedangkan relasi yang tidak ditemukan biasanya
masalah model atau tabel *pivot*.

Urutan pemeriksaan yang disarankan: pertama, pastikan *route* dan parameter
sesuai; kedua, periksa kueri yang dihasilkan *controller*; ketiga, periksa data
dan `$fillable`; terakhir, periksa tampilan Blade. Dengan urutan ini, sumber
masalah dapat ditemukan tanpa mengubah bagian yang tidak terkait. Untuk kasus
filter hilang, periksa HTML tautan paginasi sebelum mengubah *controller*.

#tbl(
    caption: [Pemecahan masalah pencarian, filter, pengurutan, dan paginasi.],
    columns: (2.1fr, 2.2fr, 2.4fr),
    [Gejala], [Penyebab], [Solusi],
    [Filter hilang saat halaman 2], [Lupa `withQueryString()`], [Tambahkan sebelum `links()`],
    [`links does not exist`], [`get()` bukan `paginate()`], [Ganti dengan `paginate(9)`],
    [Paginasi berantakan], [Tampilan Bootstrap di proyek Tailwind], [Gunakan tampilan Tailwind],
    [`Unknown column 'slug'`], [Migrasi belum jalan], [Jalankan `php artisan migrate`],
    [Kolom baru kosong], [Kolom belum ada di `$fillable`], [Tambahkan ke `$fillable`],
    [`SQLSTATE 1075`], [`id()` dan `timestamps()` tertinggal di *pivot*], [Hapus keduanya],
    [Tabel *pivot* tidak ada], [Migrasi *pivot* belum jalan], [Perbaiki lalu `migrate`],
    [`Undefined relationship technologies`], [Metode relasi belum ada], [Tambahkan `belongsToMany()`],
    [Parameter rute tidak ada], [Ada proyek dengan *slug* null], [Isi *slug* proyek lama],
    [`/projects/3` menjadi 404], [Rute memakai *slug*], [Buka `/projects/slug-project`],
    [Proyek tidak tampil], [Status masih draft], [Ubah status menjadi published],
    [Pencarian tidak menemukan huruf besar], [Kolasi peka huruf besar-kecil], [Gunakan `utf8mb4_unicode_ci`],
)

Kasus yang paling sering muncul adalah string kueri. Paginasi Laravel
menghasilkan tautan dari kueri yang sedang aktif. Jika `withQueryString()` tidak
dipanggil, tautan hanya membawa nomor halaman. Akibatnya, filter yang terlihat
di formulir seolah hilang setelah pengguna berpindah halaman.

Perilaku pencarian `LIKE` juga bergantung pada kolasi basis data @mysql_like.
Kasus lain adalah `get()` dan `paginate()`. `get()` mengembalikan *collection*,
sedangkan `paginate()` mengembalikan *paginator*. Hanya *paginator* yang memiliki
metode `links()`, `total()`, `currentPage()`, dan `perPage()`.

== Mengapa desain kueri ini bekerja

Kueri dibangun sekali, lalu dieksekusi sekali. Setiap filter hanya menambah
kondisi pada builder yang sama. Database melakukan penyaringan, pengurutan, dan
pembatasan baris; PHP tidak perlu memuat seluruh tabel lalu menyaringnya sendiri.
Pola ini penting ketika jumlah proyek bertambah.

Pemuatan relasi menjaga jumlah kueri tetap terkendali. Tanpa `with()`, setiap kartu
dapat memicu kueri kategori, teknologi, dan gambar. Dengan `with()`, relasi
dimuat dalam beberapa kueri tambahan yang tidak tumbuh mengikuti jumlah kartu.

Paginasi membatasi data yang dikirim ke tampilan. `paginate(9)` menjalankan kueri
hitungan dan kueri data dengan `limit` serta `offset`. `withQueryString()`
menjaga konteks pengguna, sedangkan `links()` merender navigasi berdasarkan
*paginator*.

*Slug* membuat URL detail dapat dibaca dan stabil. Pengikatan model route (*route model binding*) menghindari
pencarian manual di *controller*. Konsekuensinya, *slug* harus unik dan tidak boleh
kosong. Migrasi serta model pada aplikasi ini menangani kedua syarat tersebut.

== Adaptasi modul dan batas hasil

Beberapa nama dan keputusan aplikasi berbeda dari modul. Perbedaan tersebut
diselesaikan tanpa mengubah tujuan pembelajaran.

#tbl(
    caption: [Adaptasi modul pertemuan 11 terhadap aplikasi portofolio.],
    columns: (2.1fr, 2.3fr, 2.4fr),
    [Modul], [Aplikasi], [Alasan],
    [`Post` dan `name`], [`Project` dan `title`], [Konsistensi portofolio pertemuan 4–10],
    [`PortfolioController@projects`], [`ProjectController@publicIndex`], [*Controller* proyek sudah ada],
    [`{project:slug}`], [`getRouteKeyName()`], [Pengikatan model *route* (*slug*)],
    [`attach()`], [`sync()`], [Teknologi yang tidak dipilih ikut dilepas],
    [`/post`], [`/admin`], [Area pengelolaan yang lebih representatif],
    [9 item per halaman], [9/18/27], [Modul tetap menjadi default],
    [Draft selalu 404], [Admin dapat pratinjau], [Keputusan pertemuan 10],
    [Kolom baru], [Sebagian sudah ada dari P10], [Migrasi baru hanya menambah yang belum ada],
    [Slug kategori/teknologi dan *pivot*], [Sudah ada dari P10], [Prasyarat diverifikasi, bukan diduplikasi],
)

Batas hasil yang perlu dicatat: data awal seluruhnya published, sehingga perilaku
draft dibuktikan melalui feature test, bukan melalui data awal. Prasyarat *slug*
kategori/teknologi dan *pivot* berasal dari pertemuan 10. Perubahan desain dan
nice-to-have di luar modul tidak dibahas dalam laporan ini.

#pagebreak()

= Kesimpulan

+ Parameter kueri dibaca melalui objek *request* dan dihubungkan dengan formulir `GET`;
  seluruh kombinasi pencarian, kategori, teknologi, pengurutan, dan ukuran halaman
  dapat direproduksi dari URL.
+ `when()` membuat kueri dinamis tetap terbaca, sedangkan `whereHas()` memfilter
  relasi kategori dan teknologi tanpa menggandakan baris proyek.
+ Pengurutan dan paginasi bekerja bersama; `withQueryString()` menjaga filter saat
  pengguna berpindah ke halaman berikutnya.
+ Halaman detail memakai *slug* melalui *route model binding*; proyek draft
  menghasilkan 404 untuk tamu dan dapat dipratinjau admin.
+ Data uji berisi 12 proyek, 5 kategori, dan 31 teknologi, sehingga paginasi
  dan filter dapat diuji dengan data yang cukup.
+ Seluruh Latihan modul terpenuhi: filter teknologi, sort `project_date`, jumlah
  hasil dan Reset, serta pencarian admin dengan filter status.
+ Pengujian otomatis mencatat 86 pengujian lulus dengan 303 pernyataan uji; bukti visual
  tersedia untuk pencarian, filter, halaman kedua, keadaan kosong, detail, dan admin.
