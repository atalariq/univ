#import "@atalariq/lab-report:3.0.0": *

#set par(justify: true)

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web Lanjutan",
  course-code: "PPWL",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "10",
  title: "Dashboard, File Upload, dan Gallery",
  logo: image("assets/logo.png", width: 6cm),
)

#show: report.with(
  bib: bibliography("references.yaml"),
)

#cover(..metadata)

#toc(break-page: false)
#tof(break-page: false)
#tot(break-page: false)
#pagebreak()

= Tujuan Praktikum

+ Membangun dashboard pengelolaan dengan data agregat dari beberapa model.
+ Membuat komponen Blade `stat-card` dan layout admin dengan sidebar serta navbar.
+ Mengunggah thumbnail project dan foto profil ke disk `public`.
+ Menghapus berkas lama ketika thumbnail atau avatar diganti.
+ Mengunggah beberapa gambar sekaligus sebagai gallery project.
+ Menjelaskan alasan berkas disimpan di disk `public` dan diakses melalui
  `storage:link`.
+ Menyelesaikan penugasan: card Published/Draft, Skill Teratas, `withCount()` per
  kategori, halaman `/experience` dan `/education`, validasi dimensi, edit caption
  gallery, batas sepuluh gambar, dan halaman detail project berbasis slug.

= Dasar Teori

== Query agregat dan eager loading

Dashboard membutuhkan angka ringkasan, bukan seluruh baris tabel. Method `count()`
menerjemahkan permintaan menjadi `select count(*)` sehingga penghitungan dilakukan
oleh basis data. Pola `Model::all()->count()` memuat seluruh baris ke memori aplikasi
lebih dahulu, lalu menghitungnya di PHP; pola tersebut boros ketika tabel bertambah
besar @laravel_queries.

Relasi juga dapat dihitung tanpa memuat seluruh model relasi. `withCount('projects')`
menambahkan kolom virtual `projects_count` pada hasil query kategori. Kolom itu dapat
diurutkan dan ditampilkan langsung di view. Untuk relasi yang tetap perlu ditampilkan,
`with()` melakukan _eager loading_ sehingga satu query relasi dipakai untuk seluruh
baris, bukan satu query per baris @laravel_eloquent.

== Blade component dan layout admin

Blade menyediakan komponen anonim untuk potongan tampilan yang dipakai berulang
@laravel_blade_components. Berkas
`resources/views/components/stat-card.blade.php` dipanggil sebagai `<x-stat-card>`.
Direktif `@props` mendeklarasikan data yang diterima komponen, sedangkan atribut
bertitik dua seperti `:value="$totalProjects"` mengirim nilai PHP, bukan teks biasa.

Layout admin memisahkan area pengelolaan dari halaman publik. Sidebar memuat menu
Dashboard, Projects, Categories, Technologies, Skills, Profile, dan View site.
Penanda menu aktif memakai `request()->routeIs('post.projects.*')`. Layout memakai
`@yield('content')`, sehingga setiap halaman admin cukup mengisi bagian konten.

== Penyimpanan file: disk, path, dan URL publik

Laravel memisahkan berkas fisik dari nilai yang disimpan di basis data
@laravel_filesystem. Method `store('projects/thumbnails', 'public')` menyimpan berkas
di `storage/app/public/projects/thumbnails` dan mengembalikan path relatif, misalnya
`projects/thumbnails/abc123.jpg`. Basis data hanya menyimpan path tersebut.

Agar path dapat dibuka browser, direktori `storage/app/public` dihubungkan ke
`public/storage` melalui `php artisan storage:link`. URL gambar dibentuk dengan
`asset('storage/'.$path)`. Tanpa symlink, berkas tetap ada di server tetapi tidak
memiliki URL publik dan browser menerima 404.

== Validasi berkas dan keamanan upload

Aturan `image` memeriksa bahwa berkas benar-benar gambar, `mimes` membatasi ekstensi
dan tipe MIME yang diterima, `max` membatasi ukuran dalam kilobyte, dan `dimensions`
membatasi lebar serta tinggi gambar @laravel_validation. Validasi di sisi server tetap
wajib karena pemeriksaan di browser dapat dilewati.

Berkas unggahan tidak boleh dipercaya sebagai nama yang diberikan pengguna. Laravel
menghasilkan nama acak saat `store()` dipanggil, sehingga nama asli tidak dipakai
langsung sebagai path. Berkas juga ditempatkan pada disk `public` hanya karena memang
dirancang untuk diakses publik; dokumen privat harus memakai disk `local`
@owasp_file_upload.

== Relasi one-to-many dan gallery

Satu project memiliki banyak gambar. Relasi `hasMany` pada model `Project`
menghubungkan tabel `projects` ke `project_images` melalui kolom `project_id`.
Relasi balik `belongsTo` pada `ProjectImage` menghubungkan setiap gambar ke project
induknya @laravel_eloquent. Foreign key memakai `cascadeOnDelete()`, sehingga baris
gambar ikut terhapus ketika project dihapus.

Input `images[]` dengan atribut `multiple` mengirim beberapa berkas dalam satu
request. Aturan `images.*` memvalidasi setiap elemen array. Kolom `sort_order`
menjaga urutan tampil gambar. Penghapusan gambar harus menghapus berkas fisik dan
baris basis data; memeriksa `project_id` mencegah gambar project lain dihapus melalui
URL yang salah.

== Slug, route model binding, dan visibilitas data

Slug adalah versi URL dari judul. `Str::slug()` mengubah huruf menjadi lowercase dan
mengganti spasi dengan tanda hubung. Karena slug harus unik, benturan judul
diselesaikan dengan akhiran angka, misalnya `same-title-2`. Model `Project`
menghasilkan slug pada event `saving`, sehingga slug selalu tersedia sebelum data
disimpan.

Route model binding mencocokkan parameter route dengan kolom model. Dengan
`getRouteKeyName()` yang mengembalikan `slug`, URL `/projects/cloud-note-api` langsung
mencari project berdasarkan slug dan mengembalikan 404 bila tidak ada
@laravel_routing. Project berstatus `draft` hanya dapat dipratinjau oleh admin;
pengunjung biasa menerima 404 agar data yang belum terbit tidak bocor.

#pagebreak()

= Hasil dan Pembahasan

Laporan ini melanjutkan aplikasi pertemuan 9 pada commit `cc227ab`. Kondisi awal
memuat autentikasi Breeze, area `/post`, middleware `auth` dan `admin`, halaman
profil, serta CRUD project. Seluruh langkah berikut dijalankan di atas kondisi
tersebut. Lingkungan pengujian memakai PHP 8.5.12, Laravel 13.32.0, Node.js 24.21.0,
MariaDB 11 pada `127.0.0.1:33060`, dan Breeze 2.4.2.

Untuk mengikuti laporan dari awal, siapkan salinan aplikasi pertemuan 9:

#codeblock(
```sh
git clone https://github.com/atalariq/PPWL-my-portfolio.git
cd PPWL-my-portfolio
git checkout cc227ab
composer install
npm install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
php artisan storage:link
npm run dev
```,
  header: [terminal],
)

Commit hasil praktikum ini adalah `99b7082` dan menjadi acuan kode pada laporan
@repo_p10.

== Menyiapkan storage dan skema data

Berkas upload memerlukan symlink `public/storage`. Perintah berikut membuat symlink
dan memeriksa hasilnya:

#codeblock(
```sh
php artisan storage:link
ls -l public/storage
```,
  header: [terminal],
)

Hasil yang diharapkan: `public/storage` berupa symlink menuju
`storage/app/public`. Jika checkout berasal dari Windows, `public/storage` dapat
berupa berkas stub `XSym` yang menunjuk path sistem lain. Berkas stub tersebut bukan
symlink yang valid. Hapus stub, lalu jalankan ulang perintah:

#codeblock(
```sh
rm public/storage
php artisan storage:link
```,
  header: [terminal],
)

`public/storage` tercantum di `.gitignore`, sehingga symlink dibuat ulang pada setiap
checkout dan tidak ikut masuk ke repository.

Model dan migrasi dibuat dengan perintah berikut. Setiap perintah menghasilkan satu
berkas migrasi dan satu model:

#codeblock(
```sh
php artisan make:model Category -m
php artisan make:model Technology -m
php artisan make:model Skill -m
php artisan make:model ProjectImage -m
php artisan make:model Experience -m
php artisan make:model Education -m
php artisan make:migration add_dashboard_fields_to_projects_table --table=projects
php artisan make:migration add_avatar_to_users_table --table=users
php artisan make:migration create_project_technology_table
```,
  header: [terminal],
)

Migrasi `categories` menyimpan nama dan slug unik. Migrasi `project_images`
menyimpan path gambar, caption, dan urutan tampil:

#codeblock(
```php
Schema::create('project_images', function (Blueprint $table) {
    $table->id();
    $table->foreignId('project_id')->constrained()->cascadeOnDelete();
    $table->string('image', 255);
    $table->string('caption', 255)->nullable();
    $table->unsignedInteger('sort_order')->default(0);
    $table->timestamps();

    $table->index(['project_id', 'sort_order']);
});
```,
  header: [database/migrations/2026_11_05_021353_create_project_images_table.php],
)

Tabel `projects` dilengkapi kategori, slug, status, dan thumbnail. Kolom `slug`
diberi nilai unik dan diisi untuk data lama sebelum aplikasi dipakai:

#codeblock(
```php
Schema::table('projects', function (Blueprint $table) {
    $table->foreignId('category_id')->nullable()->after('id')->constrained()->nullOnDelete();
    $table->string('slug', 220)->nullable()->unique()->after('title');
    $table->string('status', 20)->default('draft')->index()->after('description');
    $table->string('thumbnail', 255)->nullable()->after('status');
});

$used = [];

foreach (DB::table('projects')->orderBy('id')->get(['id', 'title']) as $project) {
    $base = Str::slug($project->title) ?: 'project-'.$project->id;
    $slug = $base;
    $suffix = 2;

    while (in_array($slug, $used, true)) {
        $slug = $base.'-'.$suffix;
        $suffix++;
    }

    DB::table('projects')->where('id', $project->id)->update(['slug' => $slug]);
    $used[] = $slug;
}
```,
  header: [database/migrations/2026_11_05_021356_add_dashboard_fields_to_projects_table.php],
)

Kolom `avatar` pada tabel `users` menyimpan path foto profil:

#codeblock(
```php
Schema::table('users', function (Blueprint $table) {
    $table->string('avatar', 255)->nullable()->after('role');
});
```,
  header: [database/migrations/2026_11_05_021357_add_avatar_to_users_table.php],
)

Tabel pivot `project_technology` menghubungkan project dan teknologi. Kedua foreign
key memakai `cascadeOnDelete()`, sehingga baris pivot hilang ketika project atau
teknologi dihapus:

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

Model `Project` memuat `$fillable`, relasi, scope, dan pembentukan slug. Kolom yang
tidak ada di `$fillable` tidak akan tersimpan meskipun dikirim dari form. Karena itu
`category_id`, `status`, `slug`, dan `thumbnail` harus terdaftar:

#codeblock(
```php
protected $fillable = [
    'title',
    'slug',
    'repo',
    'description',
    'category_id',
    'status',
    'thumbnail',
];

protected static function booted(): void
{
    static::saving(function (Project $project) {
        if (blank($project->slug) || $project->isDirty('title')) {
            $project->slug = static::uniqueSlug($project->title, $project->exists ? $project->id : null);
        }
    });
}

public function getRouteKeyName(): string
{
    return 'slug';
}

public function images(): HasMany
{
    return $this->hasMany(ProjectImage::class)->orderBy('sort_order')->orderBy('id');
}

public function technologies(): BelongsToMany
{
    return $this->belongsToMany(Technology::class);
}

public function scopePublished(Builder $query): Builder
{
    return $query->where('status', 'published');
}
```,
  header: [app/Models/Project.php],
)

Jalankan migrasi dan seeder:

#codeblock(
```sh
php artisan migrate
php artisan db:seed
```,
  header: [terminal],
)

Seeder mengisi kategori, teknologi, skill, experience, education, dan 30 project.
Hasil yang diharapkan: `php artisan tinker --execute="echo App\Models\Project::count();"`
mencetak `30`, kolom `slug` tidak kosong, dan 22 project berstatus `published`
sedangkan 8 project berstatus `draft`. Angka tersebut dapat berbeda bila seeder
dijalankan ulang dengan data acak, tetapi jumlah published ditambah draft selalu sama
dengan total project.

== Membuat dashboard dan komponen stat-card

Controller dashboard dibuat dengan perintah:

#codeblock(
```sh
php artisan make:controller DashboardController
php artisan make:component StatCard --view
```,
  header: [terminal],
)

`DashboardController@index` mengumpulkan angka ringkasan dan lima project terbaru.
Penghitungan memakai `count()` di basis data, bukan `all()->count()`:

#codeblock(
```php
public function index(): View
{
    return view('post.dashboard.index', [
        'totalProjects' => Project::count(),
        'publishedProjects' => Project::where('status', 'published')->count(),
        'draftProjects' => Project::where('status', 'draft')->count(),
        'totalCategories' => Category::count(),
        'totalTechnologies' => Technology::count(),
        'totalSkills' => Skill::count(),
        'totalGalleryImages' => ProjectImage::count(),
        'latestProjects' => Project::with('category')->latest()->take(5)->get(),
        'topSkills' => Skill::orderByDesc('level')->orderBy('name')->take(5)->get(),
        'categories' => Category::withCount('projects')->orderByDesc('projects_count')->orderBy('name')->get(),
    ]);
}
```,
  header: [app/Http/Controllers/DashboardController.php],
)

Komponen `stat-card` menerima label, nilai, dan warna. Komponen ini dipakai berulang
di dashboard:

#codeblock(
```blade
@props(['label', 'value', 'color' => 'text-blue-600'])

<div class="rounded-lg bg-white p-6 shadow-sm">
    <div class="text-sm uppercase tracking-wider text-gray-500">{{ $label }}</div>
    <div class="mt-2 text-3xl font-bold {{ $color }}">{{ $value }}</div>
</div>
```,
  header: [resources/views/components/stat-card.blade.php],
)

Dashboard menampilkan card total, published, draft, skills, categories,
technologies, dan gallery. Bagian bawah memuat Skill Teratas, tabel
`withCount('projects')` per kategori, dan lima project terbaru:

#codeblock(
```blade
<div class="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
    <x-stat-card label="Projects" :value="$totalProjects" />
    <x-stat-card label="Published" :value="$publishedProjects" color="text-green-600" />
    <x-stat-card label="Draft" :value="$draftProjects" color="text-amber-600" />
    <x-stat-card label="Skills" :value="$totalSkills" color="text-orange-600" />
</div>

<div class="mt-4 grid gap-4 sm:grid-cols-3">
    <x-stat-card label="Categories" :value="$totalCategories" color="text-purple-600" />
    <x-stat-card label="Technologies" :value="$totalTechnologies" color="text-cyan-600" />
    <x-stat-card label="Gallery Images" :value="$totalGalleryImages" color="text-rose-600" />
</div>
```,
  header: [resources/views/post/dashboard/index.blade.php],
)

Route dashboard diletakkan di grup `/post` yang sudah memakai `auth` dan `admin`:

#codeblock(
```php
Route::prefix('post')->name('post.')->middleware(['auth', 'admin'])->group(function () {
    Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');
    // route resource dan gallery
});
```,
  header: [routes/web.php],
)

Hasil yang diharapkan: `/post/dashboard` menampilkan angka total, published, draft,
skills, categories, technologies, dan gallery. Card Published ditambah Draft sama
dengan total project. `withCount()` menampilkan jumlah project per kategori, termasuk
kategori yang belum memiliki project dengan nilai `0`.

Pada tangkapan layar berikut, project demo Cloud Note API sudah ditambahkan pada
langkah 5, sehingga total project menjadi 31 dan published menjadi 23. Hubungan
Published ditambah Draft sama dengan Total tetap berlaku.

#img(
  image("assets/page-dashboard.png"),
  caption: [Dashboard admin: card agregat, Skill Teratas, jumlah project per kategori, dan lima project terbaru.],
)

== Membuat layout admin

Layout admin memakai sidebar dan navbar. Sidebar menandai menu aktif dengan
`request()->routeIs('post.projects.*')`, sedangkan navbar menampilkan nama, role, dan
avatar pengguna:

#codeblock(
```blade
<a href="{{ route('post.projects.index') }}"
   class="block rounded px-3 py-2 {{ request()->routeIs('post.projects.*') ? 'bg-gray-800 font-semibold text-white' : 'text-gray-300 hover:bg-gray-800 hover:text-white' }}">
    Projects
</a>
```,
  header: [resources/views/layouts/admin.blade.php],
)

Bagian kanan navbar memuat avatar. Jika avatar belum diunggah, inisial nama dipakai
sebagai fallback:

#codeblock(
```blade
@if (auth()->user()->avatar)
    <img src="{{ auth()->user()->avatarUrl() }}" alt="{{ auth()->user()->name }}" class="h-9 w-9 rounded-full object-cover">
@else
    <div class="flex h-9 w-9 items-center justify-center rounded-full bg-gray-900 text-sm font-semibold text-white">
        {{ strtoupper(substr(auth()->user()->name, 0, 1)) }}
    </div>
@endif
```,
  header: [resources/views/layouts/admin.blade.php],
)

Hasil yang diharapkan: setiap halaman `/post/*` memakai sidebar dan navbar yang sama.
Menu aktif berubah sesuai route, dan nama pengguna tampil di kanan atas.

== Mengelola kategori, teknologi, dan skill

Kategori dan teknologi dipakai sebagai data referensi project dan dashboard. Ketiganya
memiliki CRUD di area admin. Controller dibuat dengan perintah:

#codeblock(
```sh
php artisan make:controller CategoryController --resource
php artisan make:controller TechnologyController --resource
php artisan make:controller SkillController --resource
```,
  header: [terminal],
)

Validasi skill memastikan nama unik dan level berada di antara 1 sampai 100:

#codeblock(
```php
$request->validate([
    'name' => ['required', 'string', 'max:100', Rule::unique(Skill::class)],
    'level' => ['required', 'integer', 'min:1', 'max:100'],
]);

Skill::create($request->only(['name', 'level']));
```,
  header: [app/Http/Controllers/SkillController.php],
)

Kategori dan teknologi menghasilkan slug otomatis dari nama. Contoh pada model
`Category`:

#codeblock(
```php
protected static function booted(): void
{
    static::saving(function (Category $category) {
        if (blank($category->slug)) {
            $category->slug = static::uniqueSlug($category->name, $category->exists ? $category->id : null);
        }
    });
}
```,
  header: [app/Models/Category.php],
)

Form project memakai pilihan kategori dan checkbox teknologi. Teknologi disinkronkan
setelah project disimpan:

#codeblock(
```php
$project = Project::create($validated);
$project->technologies()->sync($request->input('technologies', []));
```,
  header: [app/Http/Controllers/ProjectController.php],
)

Hasil yang diharapkan: `/post/categories`, `/post/technologies`, dan `/post/skills`
menampilkan tabel data. Menambah skill dengan level 101 ditolak. Menambah kategori
dengan nama yang sudah ada ditolak. Menghapus kategori membuat `category_id` project
menjadi `null`, sedangkan menghapus teknologi menghapus baris pivot tanpa menghapus
project.

== Upload thumbnail dan foto profil

Form project memakai `enctype="multipart/form-data"`. Tanpa atribut itu, berkas tidak
ikut terkirim dan `$request->file('thumbnail')` bernilai `null`:

#codeblock(
```blade
<form action="{{ route('post.projects.store') }}" method="POST" enctype="multipart/form-data" class="max-w-2xl space-y-4 rounded-lg bg-white p-6 shadow-sm">
    @csrf

    <input type="file" name="thumbnail" id="thumbnail" accept="image/*">
    <p class="mt-1 text-xs text-gray-500">JPG, JPEG, PNG, atau WebP. Maksimal 2 MB. Ukuran minimal 400 x 300 piksel.</p>
    @error('thumbnail')
        <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
    @enderror
</form>
```,
  header: [resources/views/post/projects/create.blade.php],
)

Controller memvalidasi gambar, menyimpan ke disk `public`, dan menulis path ke basis
data. `max:2048` berarti 2048 kilobyte atau sekitar 2 MB:

#codeblock(
```php
$validated = $request->validate([
    'title' => 'required|min:5|max:200',
    'repo' => 'required|max:200',
    'description' => 'required|min:10',
    'category_id' => 'nullable|exists:categories,id',
    'status' => 'required|in:published,draft',
    'thumbnail' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048|dimensions:min_width=400,min_height=300',
    'technologies' => 'nullable|array',
    'technologies.*' => 'exists:technologies,id',
]);

if ($request->hasFile('thumbnail')) {
    $validated['thumbnail'] = $request->file('thumbnail')->store('projects/thumbnails', 'public');
}

$project = Project::create($validated);
```,
  header: [app/Http/Controllers/ProjectController.php],
)

Foto profil memakai aturan yang sama dengan ukuran minimum 200 x 200 piksel. Form
profil juga memakai `enctype`:

#codeblock(
```php
'avatar' => ['nullable', 'image', 'mimes:jpg,jpeg,png,webp', 'max:2048', 'dimensions:min_width=200,min_height=200'],
```,
  header: [app/Http/Requests/ProfileUpdateRequest.php],
)

Penyimpanan avatar menghapus berkas lama sebelum path baru ditulis:

#codeblock(
```php
if ($request->hasFile('avatar')) {
    if ($user->avatar) {
        Storage::disk('public')->delete($user->avatar);
    }

    $user->avatar = $request->file('avatar')->store('avatars', 'public');
}
```,
  header: [app/Http/Controllers/ProfileController.php],
)

Hasil yang diharapkan: thumbnail tampil di halaman publik dan form edit; avatar tampil
di navbar admin dan halaman profil. Gambar 200 x 200 sebagai thumbnail ditolak dengan
pesan `The thumbnail field has invalid image dimensions.`; gambar 400 x 400 sebagai
avatar diterima.

#img(
  image("assets/check-thumbnail-dimensions.png"),
  caption: [Validasi dimensi thumbnail. Nilai input lain dipertahankan dan pesan kesalahan tampil di bawah field thumbnail.],
)

#img(
  image("assets/page-profile-avatar.png"),
  caption: [Halaman profil dengan avatar yang sudah diunggah. Form nama, email, avatar, dan password berada pada halaman yang sama.],
)

== Menghapus file lama dan file terkait

Tanpa penghapusan berkas lama, setiap penggantian thumbnail atau avatar meninggalkan
berkas yatim di `storage/app/public`. Method `update()` menghapus berkas lama hanya
ketika berkas baru berhasil divalidasi dan akan disimpan:

#codeblock(
```php
if ($request->hasFile('thumbnail')) {
    if ($project->thumbnail) {
        Storage::disk('public')->delete($project->thumbnail);
    }

    $validated['thumbnail'] = $request->file('thumbnail')->store('projects/thumbnails', 'public');
}

$project->update($validated);
$project->technologies()->sync($request->input('technologies', []));
```,
  header: [app/Http/Controllers/ProjectController.php],
)

Saat project dihapus, thumbnail dan seluruh gambar gallery dihapus dari disk, relasi
teknologi dilepas, lalu baris project dihapus. Baris `project_images` ikut terhapus
melalui `cascadeOnDelete()`:

#codeblock(
```php
public function destroy(Project $project)
{
    if ($project->thumbnail) {
        Storage::disk('public')->delete($project->thumbnail);
    }

    foreach ($project->images as $image) {
        Storage::disk('public')->delete($image->image);
    }

    $project->technologies()->detach();
    $project->delete();

    return redirect()->route('post.projects.index')->with('success', 'Project deleted successfully.');
}
```,
  header: [app/Http/Controllers/ProjectController.php],
)

Hasil yang diharapkan: mengganti thumbnail menghapus berkas lama dari
`storage/app/public/projects/thumbnails`; menghapus project menghapus thumbnail,
seluruh gambar gallery, baris `project_images`, dan baris pivot `project_technology`.

== Relasi gallery dan multiple upload

Relasi `images()` pada model `Project` memakai `hasMany` dan mengurutkan gambar
berdasarkan `sort_order`. Model `ProjectImage` menyimpan path, caption, dan urutan:

#codeblock(
```php
public function images(): HasMany
{
    return $this->hasMany(ProjectImage::class)->orderBy('sort_order')->orderBy('id');
}
```,
  header: [app/Models/Project.php],
)

#codeblock(
```php
protected $fillable = ['project_id', 'image', 'caption', 'sort_order'];

public function project(): BelongsTo
{
    return $this->belongsTo(Project::class);
}
```,
  header: [app/Models/ProjectImage.php],
)

Form gallery memakai `multiple` dan nama `images[]`. Setiap berkas divalidasi sebagai
gambar tersendiri melalui `images.*`:

#codeblock(
```blade
<form action="{{ route('post.projects.images.store', $project) }}" method="POST" enctype="multipart/form-data" class="space-y-2 border-t pt-4">
    @csrf
    <label for="images" class="block text-sm font-medium">Tambah gambar</label>
    <input type="file" name="images[]" id="images" accept="image/*" multiple class="w-full rounded border px-3 py-2">
    <p class="text-xs text-gray-500">Pilih beberapa gambar sekaligus. Maksimal 10 gambar per project, masing-masing maksimal 4 MB.</p>
    @error('images')
        <p class="text-sm text-red-600">{{ $message }}</p>
    @enderror
    @error('images.*')
        <p class="text-sm text-red-600">{{ $message }}</p>
    @enderror
    <button type="submit" class="rounded bg-gray-900 px-4 py-2 text-sm font-medium text-white">Upload gallery</button>
</form>
```,
  header: [resources/views/post/projects/edit.blade.php],
)

Controller menghitung jumlah gambar yang sudah ada sebelum menyimpan. Batas sepuluh
gambar berlaku untuk total, bukan hanya untuk satu kali unggah. `sort_order`
melanjutkan urutan terakhir:

#codeblock(
```php
$validated = $request->validate([
    'images' => 'required|array|min:1',
    'images.*' => 'image|mimes:jpg,jpeg,png,webp|max:4096',
]);

$existing = $project->images()->count();
$incoming = count($validated['images']);

if ($existing + $incoming > 10) {
    throw ValidationException::withMessages([
        'images' => 'Maksimal 10 gambar per project. Saat ini tersimpan '.$existing.' gambar.',
    ]);
}

$sortOrder = (int) $project->images()->max('sort_order');

foreach ($validated['images'] as $file) {
    $sortOrder++;

    $project->images()->create([
        'image' => $file->store('projects/gallery', 'public'),
        'sort_order' => $sortOrder,
    ]);
}
```,
  header: [app/Http/Controllers/ProjectGalleryController.php],
)

Hasil yang diharapkan: tiga gambar yang dipilih sekaligus tersimpan dengan
`sort_order` 1, 2, dan 3. Unggahan yang membuat total melebihi sepuluh ditolak tanpa
menyimpan berkas apa pun. Berkas PDF dan gambar yang bukan JPG/JPEG/PNG/WebP ditolak.

#img(
  image("assets/page-project-edit-gallery.png"),
  caption: [Halaman edit project: thumbnail, pilihan kategori dan status, checkbox teknologi, gallery yang sudah tersimpan, serta form unggah beberapa gambar.],
)

== Menampilkan gallery dan halaman detail publik

Halaman detail publik memakai route model binding berdasarkan slug. Project yang
sudah terbit dapat dibuka siapa saja; project draft hanya dapat dipratinjau admin:

#codeblock(
```php
public function show(Project $project)
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

View detail menampilkan thumbnail, kategori, deskripsi, teknologi, dan gallery grid.
Setiap gambar memakai `asset('storage/'.$path)` agar URL mengarah ke symlink publik.
Atribut `alt` diisi caption atau judul project:

#codeblock(
```blade
@if ($project->images->isNotEmpty())
    <section class="mt-8">
        <h2 class="text-xl font-semibold">Gallery</h2>
        <div class="mt-4 grid gap-4 sm:grid-cols-2">
            @foreach ($project->images as $image)
                <figure class="overflow-hidden rounded border bg-white">
                    <img src="{{ asset('storage/'.$image->image) }}" alt="{{ $image->caption ?: $project->title }}" class="h-48 w-full object-cover">
                    @if ($image->caption)
                        <figcaption class="px-3 py-2 text-sm text-gray-600">{{ $image->caption }}</figcaption>
                    @endif
                </figure>
            @endforeach
        </div>
    </section>
@endif
```,
  header: [resources/views/portfolio/project.blade.php],
)

Route publik dan route admin memakai model yang sama. Route publik memakai slug,
sedangkan route admin tetap memakai resource dan juga memakai slug karena
`getRouteKeyName()` model:

#codeblock(
```php
Route::get('/projects', [ProjectController::class, 'publicIndex'])->name('projects.index');
Route::get('/projects/{project}', [ProjectController::class, 'show'])->name('projects.show');

Route::prefix('post')->name('post.')->middleware(['auth', 'admin'])->group(function () {
    Route::resource('projects', ProjectController::class);
});
```,
  header: [routes/web.php],
)

Hasil yang diharapkan: `/projects/cloud-note-api` menampilkan project beserta gallery;
`/projects` hanya menampilkan project `published`; project draft menghasilkan 404
untuk tamu dan menampilkan label `Draft preview` untuk admin.

#img(
  image("assets/page-project-detail.png"),
  caption: [Halaman detail project publik dengan thumbnail, kategori, teknologi, dan gallery grid tiga gambar.],
)

== Edit caption dan batas sepuluh gambar

Caption setiap gambar dapat diubah melalui route PUT. Controller memeriksa bahwa
gambar benar-benar milik project pada URL sebelum memperbarui:

#codeblock(
```php
public function update(Request $request, Project $project, ProjectImage $image)
{
    abort_if($image->project_id !== $project->id, 404);

    $validated = $request->validate([
        'caption' => 'nullable|string|max:255',
    ]);

    $image->update($validated);

    return back()->with('success', 'Caption gambar diperbarui.');
}
```,
  header: [app/Http/Controllers/ProjectGalleryController.php],
)

Penghapusan gambar juga memeriksa kepemilikan, menghapus berkas fisik, lalu menghapus
baris basis data:

#codeblock(
```php
public function destroy(Project $project, ProjectImage $image)
{
    abort_if($image->project_id !== $project->id, 404);

    Storage::disk('public')->delete($image->image);
    $image->delete();

    return back()->with('success', 'Gambar gallery dihapus.');
}
```,
  header: [app/Http/Controllers/ProjectGalleryController.php],
)

Hasil yang diharapkan: caption baru tampil di halaman detail publik; menghapus gambar
menghilangkan berkas dari `storage/app/public/projects/gallery` dan baris dari
`project_images`; mengakses gambar project lain melalui URL project yang salah
menghasilkan 404. Batas sepuluh gambar diuji dengan sembilan gambar tersimpan lalu
mengunggah dua gambar sekaligus; request ditolak dan jumlah akhir tetap sembilan.

== Halaman experience dan education

Halaman `/experience` dan `/education` memakai data dari basis data. Controller
mengurutkan data berdasarkan `sort_order`:

#codeblock(
```php
public function experience(): View
{
    return view('portfolio.experience', [
        'experiences' => Experience::orderBy('sort_order')->orderBy('id')->get(),
    ]);
}

public function education(): View
{
    return view('portfolio.education', [
        'educations' => Education::orderBy('sort_order')->orderBy('id')->get(),
    ]);
}
```,
  header: [app/Http/Controllers/PortfolioController.php],
)

Halaman experience menampilkan role, organisasi, periode, dan deskripsi. Halaman
education menampilkan institusi, program, periode, dan daftar detail. Keduanya
memakai layout publik yang sama dengan halaman project:

#codeblock(
```blade
@forelse ($experiences as $experience)
    <article class="mt-4 rounded border bg-white p-4">
        <div class="flex flex-wrap items-center justify-between gap-2">
            <h2 class="font-semibold">{{ $experience->role }}</h2>
            <span class="text-sm text-gray-500">{{ $experience->period }}</span>
        </div>
        <p class="text-sm text-gray-600">{{ $experience->organization }}</p>
        @if ($experience->description)
            <p class="mt-2 text-sm">{{ $experience->description }}</p>
        @endif
    </article>
@empty
    <p class="mt-4 text-sm text-gray-500">Belum ada pengalaman yang ditambahkan.</p>
@endforelse
```,
  header: [resources/views/portfolio/experience.blade.php],
)

Hasil yang diharapkan: `/experience` dan `/education` dapat dibuka tanpa login dan
menampilkan data yang berasal dari seeder. Jika tabel kosong, halaman menampilkan
pesan kosong, bukan error.

#img(
  image("assets/page-experience.png"),
  caption: [Halaman publik `/experience` yang menampilkan pengalaman organisasi dari basis data.],
)

== Menguji seluruh alur

Pengujian otomatis mencakup dashboard, CRUD project, upload thumbnail, penggantian
berkas lama, validasi dimensi, gallery, batas sepuluh gambar, caption, penghapusan
berkas, profile avatar, halaman publik, serta CRUD kategori, teknologi, dan skill.
Perintah yang dipakai:

#codeblock(
```sh
composer test
npm run build
php artisan route:list --path=post
```,
  header: [terminal],
)

Keluaran akhir pengujian:

#codeblock(
```text
Tests:    60 passed (187 assertions)
```,
  header: [terminal],
)

Build aset produksi:

#codeblock(
```text
vite v8.3.0 building client environment for production...
✓ built in 638ms
```,
  header: [terminal],
)

Skenario manual yang dijalankan pada browser dicatat pada tabel berikut.

#tbl(
  caption: [Skenario manual dan hasil yang diamati pada aplikasi pertemuan 10.],
  columns: (1.7fr, 1.5fr, 0.8fr),
  [Skenario], [Hasil yang diharapkan], [Status],
  [Admin membuka dashboard], [Card agregat, skill teratas, kategori, dan project terbaru tampil], [Sesuai],
  [Upload thumbnail 1200 x 800], [Berkas tersimpan dan tampil di halaman publik], [Sesuai],
  [Upload thumbnail 300 x 300], [Ditolak dengan pesan dimensi], [Sesuai],
  [Ganti thumbnail], [Berkas lama terhapus, berkas baru tampil], [Sesuai],
  [Upload tiga gambar gallery], [Tiga gambar tampil berurutan], [Sesuai],
  [Upload gambar ke-11], [Ditolak, total tetap 10], [Sesuai],
  [Edit caption], [Caption baru tampil di halaman publik], [Sesuai],
  [Hapus gambar gallery], [Berkas dan baris basis data hilang], [Sesuai],
  [Upload avatar 800 x 600], [Avatar tampil di navbar dan halaman profil], [Sesuai],
  [Upload avatar 100 x 100], [Ditolak dengan pesan dimensi], [Sesuai],
  [Buka `/experience` dan `/education`], [Data dari basis data tampil], [Sesuai],
  [Buka project draft tanpa login], [404], [Sesuai],
  [Buka project draft sebagai admin], [Tampil dengan label Draft preview], [Sesuai],
)

#pagebreak()

= Kesimpulan

+ Dashboard menggabungkan data dari beberapa model dengan `count()`, `withCount()`,
  dan eager loading. Published ditambah draft selalu sama dengan total project, dan
  kategori tanpa project tetap tampil dengan nilai nol.
+ Komponen `stat-card` dan layout admin memisahkan tampilan pengelolaan dari halaman
  publik. Sidebar menandai menu aktif berdasarkan route.
+ Thumbnail dan avatar disimpan di disk `public`, sedangkan basis data menyimpan path.
  `storage:link` menghubungkan berkas fisik ke URL publik. Berkas lama dihapus saat
  diganti agar tidak menjadi berkas yatim.
+ Gallery memakai relasi `hasMany`, input `images[]`, dan kolom `sort_order`. Batas
  sepuluh gambar dihitung dari total gambar tersimpan, bukan hanya dari satu request.
+ Halaman detail publik memakai slug dan hanya menampilkan project `published`.
  Project draft tetap dapat dipratinjau admin, sedangkan pengunjung menerima 404.
+ Halaman `/experience` dan `/education` mengambil data dari basis data. Seluruh alur
  diverifikasi dengan 60 test otomatis dan tiga belas skenario manual.

#pagebreak()

#appendix[
  == Daftar route

  #text(size: 7.5pt)[
  #tbl(
    caption: [Route utama aplikasi setelah pertemuan 10.],
    columns: (0.45fr, 1.15fr, 2.2fr, 0.8fr),
    [Method], [URI], [Name], [Middleware],
    [`GET`], [`/projects`], [`projects.index`], [`web`],
    [`GET`], [`/projects/{project}`], [`projects.show`], [`web`],
    [`GET`], [`/experience`], [`experience`], [`web`],
    [`GET`], [`/education`], [`education`], [`web`],
    [`GET`], [`/post/dashboard`], [`post.dashboard`], [`auth`, `admin`],
    [`GET`], [`/post/projects`], [`post.projects.index`], [`auth`, `admin`],
    [`POST`], [`/post/projects`], [`post.projects.store`], [`auth`, `admin`],
    [`GET`], [`/post/projects/create`], [`post.projects.create`], [`auth`, `admin`],
    [`GET`], [`/post/projects/{project}`], [`post.projects.show`], [`auth`, `admin`],
    [`GET`], [`/post/projects/{project}/edit`], [`post.projects.edit`], [`auth`, `admin`],
    [`PUT/PATCH`], [`/post/projects/{project}`], [`post.projects.update`], [`auth`, `admin`],
    [`DELETE`], [`/post/projects/{project}`], [`post.projects.destroy`], [`auth`, `admin`],
    [`POST`], [`/post/projects/{project}/images`], [`post.projects.images.store`], [`auth`, `admin`],
    [`PUT`], [`/post/projects/{project}/images/{image}`], [`post.projects.images.update`], [`auth`, `admin`],
    [`DELETE`], [`/post/projects/{project}/images/{image}`], [`post.projects.images.destroy`], [`auth`, `admin`],
    [`GET`], [`/post/categories`], [`post.categories.index`], [`auth`, `admin`],
    [`GET`], [`/post/categories/create`], [`post.categories.create`], [`auth`, `admin`],
    [`POST`], [`/post/categories`], [`post.categories.store`], [`auth`, `admin`],
    [`GET`], [`/post/categories/{category}/edit`], [`post.categories.edit`], [`auth`, `admin`],
    [`PUT/PATCH`], [`/post/categories/{category}`], [`post.categories.update`], [`auth`, `admin`],
    [`DELETE`], [`/post/categories/{category}`], [`post.categories.destroy`], [`auth`, `admin`],
    [`GET`], [`/post/technologies`], [`post.technologies.index`], [`auth`, `admin`],
    [`GET`], [`/post/technologies/create`], [`post.technologies.create`], [`auth`, `admin`],
    [`POST`], [`/post/technologies`], [`post.technologies.store`], [`auth`, `admin`],
    [`GET`], [`/post/technologies/{technology}/edit`], [`post.technologies.edit`], [`auth`, `admin`],
    [`PUT/PATCH`], [`/post/technologies/{technology}`], [`post.technologies.update`], [`auth`, `admin`],
    [`DELETE`], [`/post/technologies/{technology}`], [`post.technologies.destroy`], [`auth`, `admin`],
    [`GET`], [`/post/skills`], [`post.skills.index`], [`auth`, `admin`],
    [`GET`], [`/post/skills/create`], [`post.skills.create`], [`auth`, `admin`],
    [`POST`], [`/post/skills`], [`post.skills.store`], [`auth`, `admin`],
    [`GET`], [`/post/skills/{skill}/edit`], [`post.skills.edit`], [`auth`, `admin`],
    [`PUT/PATCH`], [`/post/skills/{skill}`], [`post.skills.update`], [`auth`, `admin`],
    [`DELETE`], [`/post/skills/{skill}`], [`post.skills.destroy`], [`auth`, `admin`],
    [`GET`], [`/post/profile-saya`], [`post.profile.edit`], [`auth`],
    [`PATCH`], [`/post/profile-saya`], [`post.profile.update`], [`auth`],
  )
  ]

  == Ringkasan pengujian

  #tbl(
    caption: [Kelas pengujian dan cakupannya.],
    columns: (1.8fr, 2.2fr, 0.7fr),
    [Kelas], [Cakupan], [Hasil],
    [`AuthTest`], [Login, logout, rate limit, 403, registrasi ditutup, profil], [Lulus],
    [`DashboardTest`], [Agregat, published/draft, skill teratas, kategori], [Lulus],
    [`ProjectCrudTest`], [CRUD project, slug unik, validasi status], [Lulus],
    [`ProjectUploadTest`], [Thumbnail, dimensi, penggantian, penghapusan berkas], [Lulus],
    [`ProjectGalleryTest`], [Multiple upload, batas 10, caption, hapus, kepemilikan], [Lulus],
    [`ProfileTest`], [Profil, avatar, dimensi avatar], [Lulus],
    [`PublicPageTest`], [Experience, education, published/draft, slug], [Lulus],
    [`TaxonomyCrudTest`], [Kategori, teknologi, skill, validasi, 403], [Lulus],
  )
]
