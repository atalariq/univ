#import "@atalariq/lab-report:3.0.0": *

#set par(justify: true)

// Checkpoint box used after every step.
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
  meeting: "9",
  title: "Authentication",
  logo: image("assets/logo.png", width: 6cm),
)

#show: report.with(
  bib: bibliography("references.yaml"),
)

#cover(..metadata)

#toc()

= Lingkungan Pengerjaan

#tbl(
  caption: [Lingkungan yang dipakai untuk menghasilkan laporan ini; semua nilai berasal dari keluaran perintah pada sesi yang sama.],
  columns: (auto, 1fr),
  [Nama project], [PPWL My Portfolio],
  [Repository], [github.com/atalariq/PPWL-my-portfolio],
  [Commit], [`add137ea6a27da2d57a10963dc51fb7383710479`],
  [PHP], [8.5.12],
  [Laravel], [13.32.0 (`composer.lock`)],
  [Node.js / npm], [24.21.0 / 11.19.0],
  [Basis data], [MariaDB 11, `127.0.0.1:33060`],
  [Lingkungan], [devenv (NixOS)],
  [Typst / lab-report], [0.15.1 / 3.0.0],
)

#pagebreak()

= Tujuan Praktikum

+ Mahasiswa mampu membuat alur registrasi dan login dengan session authentication bawaan Laravel.
+ Mahasiswa mampu melindungi route dan menu aplikasi dengan middleware `auth` dan `guest`.
+ Mahasiswa mampu menangani login gagal, logout, dan regenerasi session dengan benar.
+ Mahasiswa mampu menerapkan autentikasi pada website portofolio yang sudah dibangun pada pertemuan 4--8.

#pagebreak()

= Dasar Teori

== Authentication dan session

Authentication memisahkan halaman yang dapat diakses publik dari halaman yang hanya
boleh dibuka pengguna terdaftar. Laravel menyediakan autentikasi berbasis session:
setelah kredensial diverifikasi, identitas pengguna disimpan di session dan dibaca
ulang pada setiap request berikutnya @laravel_authentication. Session sendiri adalah
data sisi server yang dihubungkan ke browser melalui cookie; isinya tidak dapat
dibaca atau diubah klien secara langsung @laravel_session.

== Facade `Auth`

Tiga operasi inti dipakai pada praktikum ini: `Auth::attempt($credentials)` memeriksa
email dan password lalu memulai session login bila cocok; `Auth::login($user)`
memulai session untuk instance user yang sudah ada; dan `Auth::logout()` mengakhiri
session. Method `attempt()` mengembalikan `true`/`false`, sehingga kegagalan login
ditangani sebagai pesan validasi, bukan sebagai error server @laravel_authentication.

== Middleware `auth` dan `guest`

Middleware memeriksa request sebelum mencapai controller @laravel_middleware.
Middleware `auth` mengalihkan pengunjung yang belum login ke halaman login, sedangkan
`guest` melakukan sebaliknya: pengguna yang sudah login tidak perlu melihat formulir
login lagi dan diarahkan ke halaman tujuan. Pada Laravel 11 ke atas, tujuan pengalihan
diatur terpusat di `bootstrap/app.php`, bukan lagi pada `RouteServiceProvider` seperti
pada versi lama.

== Password hashing dan validasi

Password tidak pernah disimpan sebagai teks biasa. Laravel memakai `Hash` (bcrypt
atau Argon2) dan cast `hashed` pada model `User`, sehingga nilai password otomatis
di-hash saat disimpan @laravel_hashing. Formulir registrasi divalidasi sebelum data
masuk basis data: email harus unik dan valid, password minimal 8 karakter serta
dikonfirmasi ulang @laravel_validation.

== Keamanan session: regenerasi dan invalidasi

Dua titik rawan pada alur login adalah *session fixation* (penyerang memaksa ID
session yang diketahui) dan session yang tetap hidup setelah logout. Karena itu ID
session diregenerasi setelah login berhasil dan setelah registrasi, sedangkan logout
memanggil `invalidate()` lalu `regenerateToken()` untuk menghapus data session dan
token CSRF lama @owasp_session @laravel_session.

#pagebreak()

= Hasil dan Pembahasan

== Sebelum mulai

*Prasyarat.* PHP 8.5.12, Composer 2.10.3, Node.js 24.21.0, dan MariaDB 11 di
`127.0.0.1:33060` (lingkungan devenv bersama); aplikasi Laravel 13.32 dari pertemuan 8
(projects dengan CRUD, seeder, dan pagination).

*Starter kit.* Kondisi awal adalah akhir pertemuan 8:

#codeblock(
```sh
git clone https://github.com/atalariq/PPWL-my-portfolio.git
cd PPWL-my-portfolio
git checkout add137ea6a27da2d57a10963dc51fb7383710479^
composer install && npm install
php artisan migrate:fresh --seed
```,
  header: [terminal],
)

*Hasil akhir.* Pengunjung dapat melihat portofolio dan daftar project, tetapi hanya
pengguna login yang dapat menambah, mengubah, dan menghapus project. Registrasi,
login, dashboard, dan logout berjalan dengan session Laravel.

*Batas cakupan.* Tidak ada reset password, verifikasi email, atau peran admin
terpisah; satu tipe pengguna login mengelola seluruh project. Modul memakai contoh
dashboard terpisah; praktikum ini menerapkan alur yang sama pada aplikasi portofolio.

== 1. Membuat controller autentikasi

Buat controller dengan `php artisan make:controller Auth/LoginRegisterController`, lalu
isi enam method: `register()`, `store()`, `login()`, `authenticate()`, `dashboard()`,
dan `logout()`.

#codeblock(
```php
public function store(Request $request)
{
    $validated = $request->validate([
        'name' => 'required|string|max:100',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => ['required', 'confirmed', Password::min(8)],
    ]);

    Auth::login(User::create($validated));
    $request->session()->regenerate();

    return redirect()->route('dashboard')
        ->with('success', 'Registrasi berhasil. Selamat datang!');
}
```,
  header: [app/Http/Controllers/Auth/LoginRegisterController.php],
)

#codeblock(
```php
public function authenticate(Request $request)
{
    $credentials = $request->validate([
        'email' => 'required|email',
        'password' => 'required',
    ]);

    if (Auth::attempt($credentials, $request->boolean('remember'))) {
        $request->session()->regenerate();

        return redirect()->intended(route('dashboard'));
    }

    return back()->onlyInput('email')->withErrors([
        'email' => 'Email atau password salah.',
    ]);
}
```,
  header: [app/Http/Controllers/Auth/LoginRegisterController.php],
)

`User::create($validated)` memakai cast `hashed` pada model `User`, sehingga password
langsung tersimpan dalam bentuk hash. `redirect()->intended()` menghormati halaman
yang tadinya ingin dibuka sebelum pengguna dialihkan ke login.

#codeblock(
```php
public function logout(Request $request)
{
    Auth::logout();

    $request->session()->invalidate();
    $request->session()->regenerateToken();

    return redirect()->route('home')->with('success', 'Anda telah logout.');
}
```,
  header: [app/Http/Controllers/Auth/LoginRegisterController.php],
)

#check[`php artisan route:list --name=login` menampilkan route `login` dan
`php artisan route:list --name=logout` menampilkan route `logout` dengan method POST.]

== 2. Mendaftarkan route dengan middleware `auth` dan `guest`

Buka `routes/web.php`. Formulir login dan registrasi hanya untuk tamu; dashboard dan
logout hanya untuk pengguna login. Aksi tulis pada project ikut dilindungi, sementara
daftar dan detail project tetap publik.

#codeblock(
```php
Route::resource('projects', ProjectController::class)
    ->only(['create', 'store', 'edit', 'update', 'destroy'])
    ->middleware('auth');

Route::resource('projects', ProjectController::class)->only(['index', 'show']);

Route::controller(LoginRegisterController::class)->group(function () {
    Route::middleware('guest')->group(function () {
        Route::get('/register', 'register')->name('register');
        Route::post('/store', 'store')->name('store');
        Route::get('/login', 'login')->name('login');
        Route::post('/authenticate', 'authenticate')->name('authenticate');
    });

    Route::middleware('auth')->group(function () {
        Route::get('/dashboard', 'dashboard')->name('dashboard');
        Route::post('/logout', 'logout')->name('logout');
    });
});
```,
  header: [routes/web.php],
)

Resource yang mengandung `create` didaftarkan lebih dulu dari resource yang berisi
`show`; bila urutannya terbalik, URL `/projects/create` tertangkap pola
`/projects/{project}` dan menghasilkan 404.

#check[`php artisan route:list --path=projects` menampilkan tujuh route dengan
middleware `auth` pada `create`, `store`, `edit`, `update`, dan `destroy`.]

== 3. Mengatur tujuan pengalihan di `bootstrap/app.php`

Modul lama memakai `RouteServiceProvider::HOME = '/dashboard'`. Pada Laravel 13
pengaturan setara berada di konfigurasi middleware:

#codeblock(
```php
->withMiddleware(function (Middleware $middleware): void {
    $middleware->redirectGuestsTo('/login');
    $middleware->redirectUsersTo('/dashboard');
})
```,
  header: [bootstrap/app.php],
)

#check[Tamu yang membuka `/dashboard` langsung diarahkan ke `/login`, dan pengguna
yang sudah login lalu membuka `/login` diarahkan ke `/dashboard`.]

== 4. Membuat halaman registrasi dan login

Buat `resources/views/auth/register.blade.php` dan `login.blade.php` yang mewarisi
layout aplikasi. Keduanya memuat `@csrf`, menampilkan pesan error per field, dan
mengisi kembali nilai sebelumnya dengan `old()`.

#codeblock(
```blade
<form method="POST" action="{{ route('store') }}" class="mt-6 space-y-4">
    @csrf

    <label class="block">
        <span class="text-sm font-medium">Nama</span>
        <input type="text" name="name" value="{{ old('name') }}" required autofocus
               class="mt-1 w-full rounded border border-gray-300 px-3 py-2">
        @error('name')
            <span class="mt-1 block text-sm text-red-600">{{ $message }}</span>
        @enderror
    </label>

    <button type="submit" class="w-full rounded bg-blue-600 px-4 py-2 font-medium text-white">
        Daftar
    </button>
</form>
```,
  header: [resources/views/auth/register.blade.php],
)

#img(
  image("assets/page-register.png"),
  caption: [Halaman `/register`: formulir nama, email, password, dan konfirmasi password.],
)

#img(
  image("assets/page-login-error.png"),
  caption: [Percobaan login dengan password salah: pesan "Email atau password salah." tampil dan email tetap terisi.],
)

== 5. Membuat dashboard pengguna

`dashboard()` mengirim `$request->user()` ke view. Dashboard menampilkan identitas
pengguna, jumlah project, project terbaru, dan tombol menuju area pengelolaan.

#codeblock(
```php
public function dashboard(Request $request)
{
    return view('auth.dashboard', ['user' => $request->user()]);
}
```,
  header: [app/Http/Controllers/Auth/LoginRegisterController.php],
)

#img(
  image("assets/page-dashboard.png"),
  caption: [Dashboard setelah login: identitas pengguna, jumlah project, dan menu Dashboard/Logout pada navigasi.],
)

#check[Membuka `/dashboard` tanpa login menghasilkan pengalihan ke `/login`; setelah
login, halaman menampilkan nama pengguna dan jumlah project.]

== 6. Menyesuaikan navigasi dan menyembunyikan aksi tulis

Navbar menampilkan tautan berbeda untuk tamu dan pengguna login, sedangkan tombol
aksi hanya tampil untuk pengguna login. Proteksi tetap berada di route; tampilan hanya
menjaga konsistensi antarmuka.

#codeblock(
```blade
@auth
    <a href="{{ route('dashboard') }}">Dashboard</a>
    <form method="POST" action="{{ route('logout') }}" class="inline">
        @csrf
        <button type="submit">Logout</button>
    </form>
@else
    <a href="{{ route('login') }}">Login</a>
@endauth
```,
  header: [resources/views/partials/navbar.blade.php],
)

#codeblock(
```blade
@auth
    <a href="{{ route('projects.create') }}" class="text-sm font-medium text-blue-600">Add Project</a>
@endauth
```,
  header: [resources/views/projects/index.blade.php],
)

#img(
  image("assets/page-projects-guest.png"),
  caption: [Tampilan `/projects` sebagai tamu: daftar project tetap terbaca, tetapi tombol Add Project tidak muncul dan navigasi menampilkan Login.],
)

#img(
  image("assets/page-projects-authed.png"),
  caption: [Tampilan `/projects` setelah login: tombol Add Project muncul dan navigasi menampilkan Dashboard serta Logout.],
)

#check[Sebagai tamu, `GET /projects/create` dialihkan ke `/login`; setelah login,
halaman form tambah project dapat dibuka dan tombol Add Project terlihat.]

== 7. Memeriksa seluruh alur

Semua perilaku di atas diuji otomatis dengan `php artisan test`. Skenario yang
tercakup: registrasi berhasil dan gagal, login benar dan salah, logout, tamu yang
ditolak dari dashboard, pengguna login yang dialihkan dari halaman login, serta
tamu yang tidak dapat menambah project.

#codeblock(
```text
Tests:    18 passed (57 assertions)
```,
  header: [terminal],
)

#check[`composer test` berakhir hijau, dan ketika logout ditekan, halaman kembali ke
beranda dengan pesan "Anda telah logout." serta menu berubah lagi menjadi Login.]

#pagebreak()

= Kesimpulan

Autentikasi berbasis session memisahkan area publik portofolio dari area pengelolaan:
pengunjung tetap dapat membaca daftar dan detail project, sedangkan aksi tulis hanya
tersedia setelah login. Enam method controller menangani registrasi, login, dashboard,
dan logout; middleware `guest` dan `auth` menjaga route; pengalihan dipusatkan di
`bootstrap/app.php`; dan regenerasi serta invalidasi session menutup celah session
fixation. Seluruh alur diperiksa pada langkah 7 dengan hasil sesuai indikator modul:
registrasi dan login berjalan, kredensial salah ditolak dengan pesan yang jelas, dan
tamu tidak dapat mengakses area pengelolaan.
