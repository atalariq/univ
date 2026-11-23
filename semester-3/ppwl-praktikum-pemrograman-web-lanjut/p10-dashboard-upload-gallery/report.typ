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

#show: report.with(bib: bibliography("references.yaml"))
#cover(..metadata)
#toc()
#tof()
#tot()

= Tujuan Praktikum

+ Membangun dashboard pengelolaan dengan data agregat.
+ Membuat komponen UI dan layout admin yang konsisten.
+ Mengunggah thumbnail project dan foto profil ke disk `public`.
+ Menghapus file lama saat thumbnail atau avatar diganti.
+ Mengunggah beberapa gambar sekaligus sebagai gallery.
+ Menjelaskan disk `public`, `storage:link`, dan URL publik.

= Dasar Teori

== Query agregat dan eager loading

`count()` menjalankan `select count(*)` di basis data; `all()->count()` memuat semua
baris ke memori lalu menghitungnya di PHP @laravel_queries. `withCount('projects')`
menambahkan kolom `projects_count` pada kategori. `with()` melakukan eager loading
untuk relasi yang akan ditampilkan @laravel_eloquent.

== Blade component dan design system

Komponen Blade anonim dipanggil sebagai `<x-ui.nama>` dan menerima data melalui
`@props` @laravel_blade_components. Aplikasi ini memakai token Tailwind 4 dan
komponen `x-ui.button`, `x-ui.card`, `x-ui.field`, `x-ui.alert`, `x-ui.badge`,
`x-ui.page-header`, `x-ui.empty-state`, `x-ui.stat`, dan `x-ui.avatar`. Tidak ada
library komponen atau JavaScript framework.

== Penyimpanan file dan disk public

`store('projects/thumbnails', 'public')` menyimpan file di
`storage/app/public/projects/thumbnails` dan mengembalikan path relatif. Basis data
hanya menyimpan path @laravel_filesystem. `storage:link` membuat symlink
`public/storage`, sehingga `asset('storage/'.$path)` dapat dibuka browser. Tanpa
symlink, file ada tetapi URL-nya 404.

== Validasi upload

Aturan `image` memeriksa tipe gambar, `mimes` membatasi ekstensi/MIME, `max`
membatasi ukuran dalam kilobyte, dan `dimensions` membatasi lebar/tinggi
@laravel_validation. Validasi dilakukan di server karena pemeriksaan browser dapat
dilewati. File publik tetap harus divalidasi dan diberi nama acak
@owasp_file_upload.

== Relasi one-to-many

`Project` memiliki banyak `ProjectImage` melalui `hasMany`; `ProjectImage` memiliki
`belongsTo` ke project @laravel_eloquent. Foreign key memakai `cascadeOnDelete()`
sehingga baris gambar ikut terhapus saat project dihapus.

== Slug dan route model binding

`Str::slug()` membentuk URL dari judul. Model `Project` mengembalikan `slug` dari
`getRouteKeyName()`, sehingga `/projects/menu-catalog-api` mencari project
berdasarkan slug @laravel_routing. Project `draft` hanya dapat dipratinjau admin;
tamu menerima 404.

#pagebreak()

= Hasil dan Pembahasan

Laporan ini menjelaskan fitur pertemuan 10 pada kode akhir portofolio. Kode acuan
adalah commit `d78b48b`; kondisi awal adalah aplikasi pertemuan 9. Lingkungan
pengujian memakai PHP 8.5.12, Laravel 13.32.0, Node.js 24, MariaDB 11 pada
`127.0.0.1:3306`, dan `mise` + Podman.

Untuk mengikuti laporan dari awal:

#codeblock(
    ```sh
    git clone https://github.com/atalariq/ppwl-portfolio.git
    cd ppwl-portfolio
    git checkout cc227ab
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

== Menyiapkan storage dan skema data

Symlink storage dibuat dan diperiksa:

#codeblock(
    ```sh
    php artisan storage:link
    ls -l public/storage
    ```,
    header: [terminal],
)

Jika checkout berasal dari Windows, `public/storage` dapat berupa stub `XSym`.
Hapus stub lalu buat symlink ulang:

#codeblock(
    ```sh
    rm public/storage
    php artisan storage:link
    ```,
    header: [terminal],
)

Model dan migrasi dibuat dengan perintah:

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

Migrasi project menambahkan kategori, slug, status, dan thumbnail. Slug data lama
diisi sebelum aplikasi dipakai:

#codeblock(
    ```php
    Schema::table('projects', function (Blueprint $table) {
        $table->foreignId('category_id')->nullable()->after('id')->constrained()->nullOnDelete();
        $table->string('slug', 220)->nullable()->unique()->after('title');
        $table->string('status', 20)->default('draft')->index()->after('description');
        $table->string('thumbnail', 255)->nullable()->after('status');
    });

    foreach (DB::table('projects')->orderBy('id')->get(['id', 'title']) as $project) {
        $base = Str::slug($project->title) ?: 'project-'.$project->id;
        DB::table('projects')->where('id', $project->id)->update(['slug' => $base]);
    }
    ```,
    header: [database/migrations/2026_11_05_021356_add_dashboard_fields_to_projects_table.php],
)

Migrasi gallery menyimpan path, caption, dan urutan:

#codeblock(
    ```php
    Schema::create('project_images', function (Blueprint $table) {
        $table->id();
        $table->foreignId('project_id')->constrained()->cascadeOnDelete();
        $table->string('image', 255);
        $table->string('caption', 255)->nullable();
        $table->unsignedInteger('sort_order')->default(0);
        $table->timestamps();
    });
    ```,
    header: [database/migrations/2026_11_05_021353_create_project_images_table.php],
)

Kolom `avatar` pada `users` dan tabel pivot teknologi:

#codeblock(
    ```php
    Schema::table('users', function (Blueprint $table) {
        $table->string('avatar', 255)->nullable()->after('role');
    });
    ```,
    header: [database/migrations/2026_11_05_021357_add_avatar_to_users_table.php],
)

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

Model `Project` memuat relasi, scope, dan slug otomatis:

#codeblock(
    ```php
    protected $fillable = ['title', 'slug', 'repo', 'description', 'category_id', 'status', 'thumbnail'];

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

Hasil yang diharapkan: 5 project kurasi, 4 kategori, 8 teknologi, 6 skill. Kolom `slug`
tidak kosong; 4 project published dan 1 project draft, sehingga published ditambah
draft sama dengan total project. Tidak ada data project acak.

== Dashboard dan komponen UI

Controller dashboard dibuat dengan `php artisan make:controller DashboardController`.
Angka ringkasan dihitung di basis data:

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

Dashboard memakai komponen `x-ui.stat`, `x-ui.card`, `x-ui.badge`, dan `x-ui.page-header`:

#codeblock(
    ```blade
    <div class="grid gap-4 sm:grid-cols-2 xl:grid-cols-4">
        <x-ui.stat label="Projects" :value="$totalProjects" />
        <x-ui.stat label="Published" :value="$publishedProjects" tone="text-success" />
        <x-ui.stat label="Draft" :value="$draftProjects" tone="text-warning" />
        <x-ui.stat label="Skills" :value="$totalSkills" tone="text-brand-700" />
    </div>
    ```,
    header: [resources/views/post/dashboard/index.blade.php],
)

#img(
    image("assets/page-dashboard.png"),
    caption: [Dashboard admin: agregat project, Skill Teratas, project per kategori, dan project terbaru.],
)

== Layout admin

Layout memakai sidebar CSS-only dan topbar. Menu aktif ditandai `request()->routeIs()`:

#codeblock(
    ```blade
    <x-ui.sidebar-link :href="route('post.projects.index')" :active="request()->routeIs('post.projects.*')">Projects</x-ui.sidebar-link>
    ```,
    header: [resources/views/layouts/admin.blade.php],
)

Tidak ada Alpine atau JavaScript bundle. Drawer mobile memakai checkbox dan `peer`:

#codeblock(
    ```blade
    <input id="sidebar-toggle" type="checkbox" class="peer sr-only lg:hidden">
    <aside class="fixed inset-y-0 left-0 z-30 w-64 -translate-x-full ... peer-checked:translate-x-0 lg:translate-x-0">
        ...
    </aside>
    <label for="sidebar-toggle" class="btn btn-secondary btn-sm lg:hidden">Menu</label>
    ```,
    header: [resources/views/layouts/admin.blade.php],
)

== CRUD kategori, teknologi, dan skill

Controller resource dibuat untuk tiga entitas. Validasi skill:

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

Kategori dan teknologi menghasilkan slug otomatis dari nama. Form project memilih
kategori dan menyinkronkan teknologi:

#codeblock(
    ```php
    $project = Project::create($validated);
    $project->technologies()->sync($request->input('technologies', []));
    ```,
    header: [app/Http/Controllers/ProjectController.php],
)

Hasil yang diharapkan: CRUD kategori, teknologi, dan skill berjalan; level 101
ditolak; kategori duplikat ditolak; menghapus kategori membuat `category_id` project
menjadi `null`.

== Upload thumbnail dan avatar

Form memakai `enctype="multipart/form-data"` dan `@csrf`. Tanpa `enctype`, file tidak
terkirim:

#codeblock(
    ```blade
    <form action="{{ route('post.projects.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <x-ui.field label="Thumbnail" name="thumbnail" :error="$errors->first('thumbnail')"
            hint="JPG, JPEG, PNG, atau WebP. Maksimal 2 MB. Ukuran minimal 400 x 300 piksel.">
            <input id="thumbnail" type="file" name="thumbnail" accept="image/*" class="input">
        </x-ui.field>
    </form>
    ```,
    header: [resources/views/post/projects/create.blade.php],
)

Validasi dan penyimpanan thumbnail:

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

Avatar memakai aturan minimum 200 x 200 dan menghapus file lama:

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

#img(
    image("assets/check-thumbnail-dimensions.png"),
    caption: [Validasi dimensi thumbnail: input dipertahankan dan pesan kesalahan tampil di bawah field.],
)

#img(
    image("assets/page-profile-avatar.png"),
    caption: [Halaman profil dengan avatar, identitas, dan form password.],
)

== Menghapus file lama dan file terkait

Update thumbnail menghapus file lama hanya setelah file baru disimpan:

#codeblock(
    ```php
    if ($request->hasFile('thumbnail')) {
        if ($project->thumbnail) {
            Storage::disk('public')->delete($project->thumbnail);
        }
        $validated['thumbnail'] = $request->file('thumbnail')->store('projects/thumbnails', 'public');
    }
    $project->update($validated);
    ```,
    header: [app/Http/Controllers/ProjectController.php],
)

Hapus project menghapus thumbnail, seluruh gambar gallery, baris pivot, dan baris
project:

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

== Gallery dan multiple upload

Form gallery memakai `multiple` dan `images[]`; setiap file divalidasi via `images.*`:

#codeblock(
    ```blade
    <form action="{{ route('post.projects.images.store', $project) }}" method="POST" enctype="multipart/form-data" class="space-y-3">
        @csrf
        <input type="file" name="images[]" accept="image/*" multiple class="input">
        @error('images') <p class="error">{{ $message }}</p> @enderror
        @error('images.*') <p class="error">{{ $message }}</p> @enderror
        <x-ui.button type="submit" size="sm">Upload gallery</x-ui.button>
    </form>
    ```,
    header: [resources/views/post/projects/edit.blade.php],
)

Controller menghitung total gambar tersimpan ditambah file masuk. Jika lebih dari 10,
tidak ada file yang disimpan:

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

#img(
    image("assets/page-project-edit-gallery.png"),
    caption: [Halaman edit project: thumbnail, kategori/status, teknologi, gallery tersimpan, dan form upload multiple.],
)

== Halaman detail publik dan caption

Detail publik memakai slug dan hanya menampilkan project published. Draft dapat
dipratinjau admin:

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

View detail menampilkan gallery grid dengan `asset('storage/...')` dan `alt`:

#codeblock(
    ```blade
    @foreach ($project->images as $image)
        <figure class="card overflow-hidden">
            <img src="{{ asset('storage/'.$image->image) }}" alt="{{ $image->caption ?: $project->title }}" class="h-52 w-full object-cover">
            @if ($image->caption)
                <figcaption class="border-t border-border px-4 py-3 text-sm text-muted">{{ $image->caption }}</figcaption>
            @endif
        </figure>
    @endforeach
    ```,
    header: [resources/views/portfolio/project.blade.php],
)

Caption diubah lewat PUT; kepemilikan gambar diperiksa:

#codeblock(
    ```php
    public function update(Request $request, Project $project, ProjectImage $image)
    {
        abort_if($image->project_id !== $project->id, 404);
        $image->update($request->validate(['caption' => 'nullable|string|max:255']));
        return back()->with('success', 'Caption gambar diperbarui.');
    }
    ```,
    header: [app/Http/Controllers/ProjectGalleryController.php],
)

#img(
    image("assets/page-project-detail.png"),
    caption: [Halaman detail publik dengan thumbnail, kategori, teknologi, dan gallery grid.],
)

== Halaman experience dan education

Data diambil dari model dan diurutkan berdasarkan `sort_order`:

#codeblock(
    ```php
    public function experience(): View
    {
        return view('portfolio.experience', [
            'experiences' => Experience::orderBy('sort_order')->orderBy('id')->get(),
        ]);
    }
    ```,
    header: [app/Http/Controllers/PortfolioController.php],
)

#img(
    image("assets/page-experience.png"),
    caption: [Halaman publik `/experience` dengan data dari basis data.],
)

// == Pengujian
//
// #codeblock(
//     ```sh
//     php artisan test
//     npm run build
//     ```,
//     header: [terminal],
// )
//
// #codeblock(
//     ```text
//     Tests:    57 passed (183 assertions)
//     ```,
//     header: [terminal],
// )
//
// #tbl(
//     caption: [Skenario manual pertemuan 10.],
//     columns: (1.5fr, 1.6fr, 0.7fr),
//     [Skenario],
//     [Hasil yang diharapkan],
//     [Status],
//     [Dashboard admin],
//     [Card agregat, skill teratas, kategori tampil],
//     [Sesuai],
//     [Upload thumbnail 800x600],
//     [Tersimpan dan tampil],
//     [Sesuai],
//     [Upload thumbnail 300x300],
//     [Ditolak karena dimensi],
//     [Sesuai],
//     [Ganti thumbnail],
//     [File lama terhapus],
//     [Sesuai],
//     [Upload tiga gallery],
//     [Tersimpan berurutan],
//     [Sesuai],
//     [Upload gambar ke-11],
//     [Ditolak, total 10],
//     [Sesuai],
//     [Edit caption],
//     [Tampil di halaman publik],
//     [Sesuai],
//     [Hapus gambar],
//     [File dan baris hilang],
//     [Sesuai],
//     [Upload avatar 800x600],
//     [Tampil di navbar/profil],
//     [Sesuai],
//     [Upload avatar 100x100],
//     [Ditolak karena dimensi],
//     [Sesuai],
//     [Project draft sebagai tamu],
//     [404],
//     [Sesuai],
//     [Project draft sebagai admin],
//     [Draft preview],
//     [Sesuai],
// )
//
#pagebreak()

= Kesimpulan

+ Dashboard memakai agregasi basis data dan eager loading. Published ditambah draft
    sama dengan total project.
+ Design system kustom menjaga konsistensi public, admin, dan auth tanpa library
    komponen atau JavaScript framework.
+ Thumbnail dan avatar disimpan di disk `public`; basis data menyimpan path.
    `storage:link` menghubungkan file ke URL, dan file lama dihapus saat diganti.
+ Gallery memakai relasi `hasMany`, input `images[]`, dan `sort_order`. Batas 10
    dihitung dari total gambar tersimpan.
+ Detail project memakai slug; draft hanya dapat dipratinjau admin.
+ Seluruh alur diverifikasi dengan 57 test (183 assertions) dan dua belas skenario
    manual.

// #pagebreak()
//
// #appendix[
//     == Daftar route
//
//     #text(size: 7.5pt)[
//         #tbl(
//             caption: [Route utama aplikasi setelah pertemuan 10 pada kode final.],
//             columns: (0.45fr, 1.15fr, 2.2fr, 0.8fr),
//             [Method],
//             [URI],
//             [Name],
//             [Middleware],
//             [`GET`],
//             [`/projects`],
//             [`projects.index`],
//             [`web`],
//             [`GET`],
//             [`/projects/{project}`],
//             [`projects.show`],
//             [`web`],
//             [`GET`],
//             [`/experience`],
//             [`experience`],
//             [`web`],
//             [`GET`],
//             [`/education`],
//             [`education`],
//             [`web`],
//             [`GET`],
//             [`/post/dashboard`],
//             [`post.dashboard`],
//             [`auth`, `admin`],
//             [`GET`],
//             [`/post/styleguide`],
//             [`post.styleguide`],
//             [`auth`, `admin`],
//             [`GET`],
//             [`/post/projects`],
//             [`post.projects.index`],
//             [`auth`, `admin`],
//             [`GET`],
//             [`/post/projects/create`],
//             [`post.projects.create`],
//             [`auth`, `admin`],
//             [`POST`],
//             [`/post/projects`],
//             [`post.projects.store`],
//             [`auth`, `admin`],
//             [`GET`],
//             [`/post/projects/{project}/edit`],
//             [`post.projects.edit`],
//             [`auth`, `admin`],
//             [`PUT/PATCH`],
//             [`/post/projects/{project}`],
//             [`post.projects.update`],
//             [`auth`, `admin`],
//             [`DELETE`],
//             [`/post/projects/{project}`],
//             [`post.projects.destroy`],
//             [`auth`, `admin`],
//             [`POST`],
//             [`/post/projects/{project}/images`],
//             [`post.projects.images.store`],
//             [`auth`, `admin`],
//             [`PUT`],
//             [`/post/projects/{project}/images/{image}`],
//             [`post.projects.images.update`],
//             [`auth`, `admin`],
//             [`DELETE`],
//             [`/post/projects/{project}/images/{image}`],
//             [`post.projects.images.destroy`],
//             [`auth`, `admin`],
//             [`GET`],
//             [`/post/profile-saya`],
//             [`post.profile.edit`],
//             [`auth`],
//             [`PATCH`],
//             [`/post/profile-saya`],
//             [`post.profile.update`],
//             [`auth`],
//         )
//     ]
//
//     == Ringkasan pengujian
//
//     #tbl(
//         caption: [Kelas pengujian dan cakupannya.],
//         columns: (1.8fr, 2.2fr, 0.7fr),
//         [Kelas],
//         [Cakupan],
//         [Hasil],
//         [`AuthTest`],
//         [Login, logout, rate limit, 403, profil],
//         [Lulus],
//         [`DashboardTest`],
//         [Agregat, published/draft, skill, kategori],
//         [Lulus],
//         [`ProjectCrudTest`],
//         [CRUD project, slug unik, validasi status],
//         [Lulus],
//         [`ProjectUploadTest`],
//         [Thumbnail, dimensi, penggantian, hapus file],
//         [Lulus],
//         [`ProjectGalleryTest`],
//         [Multiple upload, batas 10, caption, kepemilikan],
//         [Lulus],
//         [`ProfileTest`],
//         [Profil, avatar, dimensi],
//         [Lulus],
//         [`PublicPageTest`],
//         [Experience, education, draft/published, slug],
//         [Lulus],
//         [`TaxonomyCrudTest`],
//         [Kategori, teknologi, skill, validasi, 403],
//         [Lulus],
//     )
// ]
