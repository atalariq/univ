#import "@atalariq/lab-report:3.0.0": *

#set par(justify: true)

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web Lanjutan",
  course-code: "PPWL",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "9",
  title: "Authentication dan Middleware",
  logo: image("assets/logo.png", width: 6cm),
)

#show: report.with(bib: bibliography("references.yaml"))
#cover(..metadata)
#toc(break-page: false)
#tof(break-page: false)
#tot(break-page: false)
#pagebreak()

= Tujuan Praktikum

+ Menjelaskan session authentication pada aplikasi HTTP yang stateless.
+ Memasang Laravel Breeze dan menyesuaikannya dengan aplikasi portofolio.
+ Membuat alur login dan logout dengan regenerasi session serta proteksi CSRF.
+ Melindungi area `/post` dengan middleware `auth` dan `guest`.
+ Menjelaskan alur request melewati middleware sampai controller.
+ Membuat middleware `EnsureAdmin` dan mendaftarkannya sebagai alias.
+ Menutup registrasi publik dan menyediakan halaman profil pengguna.

= Dasar Teori

== Session authentication

HTTP tidak menyimpan keadaan antar-request. Laravel memberi browser cookie berisi
pengenal session, lalu menyimpan identitas pengguna pada session sisi server. Setelah
kredensial diverifikasi, request berikutnya dapat dikenali melalui cookie tersebut
@laravel_session. `Auth::attempt()` mencocokkan email dan password dengan tabel
`users`, lalu memulai session login @laravel_authentication.

== Middleware

Middleware berjalan sebelum request mencapai controller. Middleware `auth`
mengalihkan tamu ke halaman login, sedangkan `guest` mencegah pengguna yang sudah
login membuka halaman login kembali @laravel_middleware. Pada Laravel 11 ke atas,
tujuan pengalihan diatur di `bootstrap/app.php`, bukan `RouteServiceProvider`.

== Laravel Breeze

Breeze adalah starter kit autentikasi yang menyalin controller, request, route, view,
dan komponen ke dalam aplikasi. Scaffold dapat dibaca dan diubah, sehingga alur login
dapat ditelusuri sampai ke controller @laravel_breeze. Aplikasi ini memakai stack
Blade dan tetap mempertahankan Tailwind 4 milik portofolio.

== Password, CSRF, dan session fixation

Password disimpan sebagai hash bcrypt atau Argon2. Cast `hashed` pada model `User`
membuat password otomatis di-hash saat disimpan @laravel_hashing. Form login dan
logout memakai token CSRF; token yang hilang menghasilkan 419 @laravel_csrf.

ID session diregenerasi setelah login untuk mencegah session fixation. Saat logout,
session di-invalidate dan token CSRF diregenerasi @owasp_session.

== Autentikasi dan otorisasi

Autentikasi menentukan siapa pengguna; otorisasi menentukan apa yang boleh dilakukan.
Pengguna yang sudah login tetapi bukan admin tidak boleh membuka area pengelolaan.
Middleware `EnsureAdmin` mengembalikan 403 untuk kondisi ini, bukan mengalihkan ke
halaman login @laravel_authorization @owasp_access_control.

#pagebreak()

= Hasil dan Pembahasan

Laporan ini menjelaskan fitur autentikasi pertemuan 9 pada kode akhir portofolio.
Kode acuan adalah commit `ce6fa44`; kondisi awalnya adalah aplikasi pertemuan 8 pada
commit `74a4feb`. Lingkungan pengujian memakai PHP 8.5.12, Laravel 13.32.0, Node.js
24, MariaDB 11 pada `127.0.0.1:3306`, dan Breeze 2.4.2.

Untuk mengikuti laporan dari awal:

#codeblock(
```sh
git clone https://github.com/atalariq/ppwl-portfolio.git
cd ppwl-portfolio
git checkout 74a4feb
mise install
cp .env.example .env
php artisan key:generate
podman-compose -f compose.yaml up -d db
composer install
php artisan migrate --seed
npm ci
npm run build
```,
  header: [terminal],
)

== Memasang Breeze dan menyesuaikan aplikasi

Breeze dipasang dengan perintah berikut:

#codeblock(
```sh
composer require laravel/breeze --dev
php artisan breeze:install blade --no-interaction
php artisan migrate
npm install
npm run build
```,
  header: [terminal],
)

Breeze menimpa `routes/web.php`, `layouts/app.blade.php`, dan membawa Tailwind 3.
Karena aplikasi sudah memakai Tailwind 4, konfigurasi frontend dipertahankan dan
hanya controller, request, view auth, serta route auth yang dipakai. Setelah
penyesuaian, halaman login memakai layout autentikasi dan komponen UI aplikasi:

#codeblock(
```blade
@extends('layouts.auth')

@section('title', 'Login')

@section('content')
    <h1 class="text-xl font-semibold">Masuk</h1>

    <form method="POST" action="{{ route('login') }}" class="mt-6 space-y-4">
        @csrf

        <x-ui.field label="Email" name="email" :error="$errors->first('email')">
            <input id="email" class="input" type="email" name="email" value="{{ old('email') }}" required autofocus autocomplete="username">
        </x-ui.field>

        <x-ui.field label="Password" name="password" :error="$errors->first('password')">
            <input id="password" class="input" type="password" name="password" required autocomplete="current-password">
        </x-ui.field>

        <x-ui.button type="submit">Log in</x-ui.button>
    </form>
@endsection
```,
  header: [resources/views/auth/login.blade.php],
)

Hasil yang diharapkan: `/login` menampilkan form email dan password; `/register`
menghasilkan 404 karena registrasi ditutup pada langkah berikutnya.

#img(
  image("assets/page-login.png"),
  caption: [Halaman login final dengan layout autentikasi dan komponen design system aplikasi.],
)

== Menyiapkan user admin dan role

Kolom `role` ditambahkan melalui migrasi. Nilai bawaan `user`; akun admin diberi
nilai `admin` melalui seeder. Model `User` memakai daftar `Fillable` dan helper
`isAdmin()`:

#codeblock(
```php
#[Fillable(['name', 'email', 'password', 'role', 'avatar'])]
#[Hidden(['password', 'remember_token'])]
class User extends Authenticatable
{
    public function isAdmin(): bool
    {
        return $this->role === 'admin';
    }

    public function avatarUrl(): ?string
    {
        return $this->avatar ? asset('storage/'.$this->avatar) : null;
    }
}
```,
  header: [app/Models/User.php],
)

Seeder memakai `updateOrCreate()` agar idempoten. Password dibentuk dengan
`Hash::make()`; role admin diberikan eksplisit:

#codeblock(
```php
User::updateOrCreate(
    ['email' => 'admin@example.com'],
    [
        'name' => 'Admin',
        'password' => Hash::make('password123'),
        'role' => 'admin',
    ],
);

User::updateOrCreate(
    ['email' => 'test@example.com'],
    [
        'name' => 'Test User',
        'password' => Hash::make('password'),
        'role' => 'user',
    ],
);
```,
  header: [database/seeders/DatabaseSeeder.php],
)

Hasil yang diharapkan: tabel `users` memiliki kolom `role` dan `avatar`; seeder
menghasilkan satu admin dan satu pengguna non-admin. `Hash::check('password123', ...)`
mengembalikan `true` untuk akun admin.

== Login, session, dan rate limit

Controller login memanggil `LoginRequest@authenticate()`, meregenerasi session, lalu
memeriksa role. Admin diarahkan ke `/post/projects`; non-admin kembali ke beranda
dengan pesan status:

#codeblock(
```php
public function store(LoginRequest $request): RedirectResponse
{
    $request->authenticate();

    $request->session()->regenerate();

    if ($request->user()->role !== 'admin') {
        return redirect()->route('home')
            ->with('status', 'Akun ini tidak memiliki akses ke area pengelolaan.');
    }

    return redirect()->intended(route('post.projects.index', absolute: false));
}
```,
  header: [app/Http/Controllers/Auth/AuthenticatedSessionController.php],
)

`LoginRequest` membatasi lima percobaan gagal. Setelah batas tercapai, request
berikutnya ditolak sementara:

#codeblock(
```php
public function authenticate(): void
{
    $this->ensureIsNotRateLimited();

    if (! Auth::attempt($this->only('email', 'password'), $this->boolean('remember'))) {
        RateLimiter::hit($this->throttleKey());

        throw ValidationException::withMessages([
            'email' => trans('auth.failed'),
        ]);
    }

    RateLimiter::clear($this->throttleKey());
}
```,
  header: [app/Http/Requests/Auth/LoginRequest.php],
)

Hasil yang diharapkan: login admin berakhir di `/post/projects`; login non-admin
berakhir di `/` dengan pesan; password salah menampilkan pesan kredensial dan tidak
mengosongkan email.

#img(
  image("assets/page-login-error.png"),
  caption: [Percobaan login dengan password salah. Pesan validasi tampil di bawah field email.],
)

== Logout dan proteksi CSRF

Logout memakai POST dan `@csrf`. Session di-invalidate dan token CSRF diregenerasi:

#codeblock(
```php
public function destroy(Request $request): RedirectResponse
{
    Auth::guard('web')->logout();

    $request->session()->invalidate();

    $request->session()->regenerateToken();

    return redirect('/');
}
```,
  header: [app/Http/Controllers/Auth/AuthenticatedSessionController.php],
)

#codeblock(
```blade
<form method="POST" action="{{ route('logout') }}">
    @csrf
    <x-ui.button variant="ghost" size="sm" type="submit">Logout</x-ui.button>
</form>
```,
  header: [resources/views/layouts/admin.blade.php],
)

Hasil yang diharapkan: menekan Logout kembali ke `/`; `GET /logout` ditolak 405
karena route hanya menerima POST.

== Melindungi grup route `/post`

Area pengelolaan berada di bawah prefix `/post`. Route project dan dashboard memakai
`auth` dan `admin`; route profil hanya memakai `auth`:

#codeblock(
```php
Route::prefix('post')->name('post.')->middleware(['auth', 'admin'])->group(function () {
    Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::view('styleguide', 'post.styleguide')->name('styleguide');
    Route::resource('projects', ProjectController::class);
    Route::resource('categories', CategoryController::class)->except(['show']);
    Route::resource('technologies', TechnologyController::class)->except(['show']);
    Route::resource('skills', SkillController::class)->except(['show']);
});

Route::prefix('post')->name('post.')->middleware('auth')->group(function () {
    Route::get('profile-saya', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('profile-saya', [ProfileController::class, 'update'])->name('profile.update');
});
```,
  header: [routes/web.php],
)

Pengalihan tamu diatur di `bootstrap/app.php`. Laravel 13 tidak memiliki
`RouteServiceProvider`; konfigurasi berada pada middleware:

#codeblock(
```php
->withMiddleware(function (Middleware $middleware): void {
    $middleware->redirectGuestsTo('/login');
    $middleware->redirectUsersTo('/');
    $middleware->alias([
        'admin' => EnsureAdmin::class,
    ]);
})
```,
  header: [bootstrap/app.php],
)

Verifikasi:

#codeblock(
```sh
php artisan route:list --path=post -v
```,
  header: [terminal],
)

Hasil yang diharapkan: route `/post/*` menampilkan middleware `web`, `auth`, dan
`admin`; route profil hanya `web` dan `auth`.

== Middleware custom EnsureAdmin

Middleware memeriksa role pengguna. Pengguna tanpa role admin mendapat 403:

#codeblock(
```php
public function handle(Request $request, Closure $next): Response
{
    if ($request->user()?->role !== 'admin') {
        abort(403, 'Akses ditolak.');
    }

    return $next($request);
}
```,
  header: [app/Http/Middleware/EnsureAdmin.php],
)

Alias didaftarkan di `bootstrap/app.php` melalui `$middleware->alias([...])`. Tidak
ada `app/Http/Kernel.php` pada Laravel 13.

#img(
  image("assets/page-403.png"),
  caption: [Halaman 403 untuk pengguna non-admin yang membuka area pengelolaan.],
)

== Menutup registrasi dan halaman profil

Route register dihapus dari `routes/auth.php`; controller dan view register ikut
dihapus. `/register` menghasilkan 404. Halaman profil tersedia di
`/post/profile-saya` dan memakai middleware `auth` saja:

#codeblock(
```php
public function edit(Request $request): View
{
    return view('post.profile.edit', [
        'user' => $request->user(),
    ]);
}

public function update(ProfileUpdateRequest $request): RedirectResponse
{
    $user = $request->user();
    $user->fill($request->safe()->except('avatar'));

    if ($request->hasFile('avatar')) {
        if ($user->avatar) {
            Storage::disk('public')->delete($user->avatar);
        }
        $user->avatar = $request->file('avatar')->store('avatars', 'public');
    }

    if ($user->isDirty('email')) {
        $user->email_verified_at = null;
    }

    $user->save();

    return Redirect::route('post.profile.edit')->with('status', 'profile-updated');
}
```,
  header: [app/Http/Controllers/ProfileController.php],
)

#img(
  image("assets/page-profile.png"),
  caption: [Halaman profil pengguna dengan form identitas, avatar, dan password.],
)

#img(
  image("assets/page-projects-admin.png"),
  caption: [Daftar project pada area admin `/post/projects` dengan sidebar dan identitas pengguna.],
)

#img(
  image("assets/page-projects-public.png"),
  caption: [Daftar project publik. Tamu tetap dapat membaca project yang sudah diterbitkan.],
)

== Pengujian

Seluruh suite dijalankan dengan:

#codeblock(
```sh
php artisan test
```,
  header: [terminal],
)

Keluaran akhir:

#codeblock(
```text
Tests:    57 passed (183 assertions)
```,
  header: [terminal],
)

Skenario manual:

#tbl(
  caption: [Skenario manual autentikasi dan hasil yang diamati.],
  columns: (1.6fr, 1.5fr, 0.7fr),
  [Skenario], [Hasil yang diharapkan], [Status],
  [Tamu membuka `/post/projects`], [Dialihkan ke `/login`], [Sesuai],
  [Admin login], [Dialihkan ke `/post/projects`], [Sesuai],
  [Non-admin login], [Dialihkan ke `/` dengan pesan status], [Sesuai],
  [Non-admin membuka `/post/projects`], [403 `Akses ditolak.`], [Sesuai],
  [Password salah], [Pesan kredensial muncul], [Sesuai],
  [Logout], [Kembali ke `/`, session berakhir], [Sesuai],
  [Membuka `/register`], [404], [Sesuai],
  [Membuka `/post/profile-saya`], [200 untuk pengguna login], [Sesuai],
)

#pagebreak()

= Kesimpulan

+ Session authentication mengenali pengguna antar-request melalui cookie dan data
  session sisi server. ID session diregenerasi setelah login dan di-invalidate saat
  logout.
+ Breeze menyediakan scaffold login, logout, reset password, dan profil. Scaffold
  diintegrasikan dengan layout serta design system portofolio.
+ Middleware `auth` melindungi area pengelolaan dari tamu; `EnsureAdmin` membatasi
  area tersebut pada role `admin` dan mengembalikan 403 untuk pengguna biasa.
+ Registrasi publik ditutup. Akun pengelola hanya dibuat melalui seeder.
+ Seluruh alur diverifikasi dengan 57 test (183 assertions) dan delapan skenario
  manual.

#pagebreak()

#appendix[
  == Daftar route

  #text(size: 7.5pt)[
  #tbl(
    caption: [Route utama aplikasi setelah pertemuan 9 pada kode final.],
    columns: (0.55fr, 1.55fr, 1.7fr, 0.9fr),
    [Method], [URI], [Name], [Middleware],
    [`GET`], [`/login`], [`login`], [`guest`],
    [`POST`], [`/login`], [`-`], [`guest`],
    [`POST`], [`/logout`], [`logout`], [`auth`],
    [`GET`], [`/post/dashboard`], [`post.dashboard`], [`auth`, `admin`],
    [`GET`], [`/post/projects`], [`post.projects.index`], [`auth`, `admin`],
    [`POST`], [`/post/projects`], [`post.projects.store`], [`auth`, `admin`],
    [`GET`], [`/post/projects/create`], [`post.projects.create`], [`auth`, `admin`],
    [`GET`], [`/post/projects/{project}/edit`], [`post.projects.edit`], [`auth`, `admin`],
    [`PUT/PATCH`], [`/post/projects/{project}`], [`post.projects.update`], [`auth`, `admin`],
    [`DELETE`], [`/post/projects/{project}`], [`post.projects.destroy`], [`auth`, `admin`],
    [`GET`], [`/post/profile-saya`], [`post.profile.edit`], [`auth`],
    [`PATCH`], [`/post/profile-saya`], [`post.profile.update`], [`auth`],
  )
  ]

  == Ringkasan pengujian

  #tbl(
    caption: [Kelas pengujian autentikasi dan cakupannya.],
    columns: (1.4fr, 2.2fr, 0.8fr),
    [Kelas], [Cakupan], [Hasil],
    [`AuthTest`], [Login, logout, rate limit, 403, registrasi ditutup, profil], [Lulus],
    [`PasswordResetTest`], [Permintaan dan penyelesaian reset password], [Lulus],
    [`PasswordUpdateTest`], [Perubahan password dari halaman profil], [Lulus],
    [`ProjectCrudTest`], [CRUD project pada area admin], [Lulus],
  )
]
