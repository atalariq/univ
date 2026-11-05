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

#show: report.with(
  bib: bibliography("references.yaml"),
)

#cover(..metadata)

#toc(break-page: false)
#tof(break-page: false)
#tot(break-page: false)
#pagebreak()

= Tujuan Praktikum

+ Menjelaskan cara kerja session authentication pada aplikasi web yang bersifat
  _stateless_.
+ Memasang Laravel Breeze sebagai _starter kit_ autentikasi dan menyesuaikannya dengan
  aplikasi portofolio yang sudah berjalan.
+ Membuat alur login dan logout yang memakai session, regenerasi ID session, dan
  proteksi CSRF.
+ Melindungi route pengelolaan dengan middleware `auth` dan `guest`.
+ Menjelaskan alur request melewati middleware sampai mencapai controller.
+ Membuat middleware custom `EnsureAdmin` dan mendaftarkannya sebagai alias middleware.

= Dasar Teori

== HTTP stateless dan session authentication

HTTP tidak menyimpan keadaan antar-request. Setiap request berdiri sendiri, sehingga
server tidak otomatis tahu bahwa dua request berasal dari pengguna yang sama. Laravel
menyelesaikan masalah ini dengan session: setelah kredensial diverifikasi, identitas
pengguna disimpan di penyimpanan session sisi server, lalu browser diberi cookie yang
berisi pengenal session. Pada request berikutnya, cookie dikirim kembali dan Laravel
membaca data session yang sesuai @laravel_session.

Autentikasi berbasis session karena itu terdiri atas dua lapisan. Lapisan pertama
adalah pembuktian identitas, biasanya melalui email dan password. Lapisan kedua adalah
penyimpanan identitas yang sudah terbukti ke dalam session. Laravel menyediakan
`Auth::attempt()` untuk menggabungkan keduanya: kredensial dicocokkan dengan baris
`users`, lalu session login dimulai bila cocok @laravel_authentication.

== Middleware dan pipeline request

Middleware adalah lapisan yang dijalankan sebelum atau sesudah request mencapai
controller. Request masuk ke pipeline, melewati middleware satu per satu, lalu
diteruskan ke controller. Middleware dapat mengubah request, menghentikan request, atau
mengembalikan response lebih awal @laravel_middleware.

Middleware `auth` memeriksa apakah pengguna sudah login. Jika belum, pengguna
dialihkan ke halaman login. Middleware `guest` melakukan pemeriksaan sebaliknya:
halaman login dan registrasi hanya boleh dibuka oleh pengguna yang belum login. Pada
Laravel 11 ke atas, tujuan pengalihan tidak lagi diatur di `RouteServiceProvider`,
tetapi di `bootstrap/app.php` melalui `redirectGuestsTo()` dan `redirectUsersTo()`.

== Laravel Breeze

Breeze adalah _starter kit_ autentikasi minimal. Breeze menyediakan controller, request,
route, view, dan komponen Blade untuk login, registrasi, reset password, verifikasi
email, dan konfirmasi password @laravel_breeze. _Stack_ `blade` dipakai pada praktikum
ini karena aplikasi memang menggunakan Blade dan Tailwind, bukan Inertia atau Livewire.

Breeze bukan pustaka autentikasi yang bekerja di belakang layar. Breeze menyalin
berkas-berkas scaffold ke dalam aplikasi, sehingga seluruh kode autentikasi dapat
dibaca, diubah, dan dipelajari. Sifat ini penting untuk praktikum: perilaku login dan
logout dapat ditelusuri sampai ke controller dan request class.

== Password hashing, CSRF, dan session fixation

Password tidak pernah disimpan sebagai teks biasa. Laravel memakai `Hash` dengan
algoritma bcrypt atau Argon2. Model `User` pada aplikasi ini memakai _cast_ `hashed`,
sehingga nilai password otomatis di-hash saat disimpan @laravel_hashing. Pemanggilan
`Hash::make()` tetap dipakai pada seeder agar nilai hash terbentuk sebelum data masuk
ke basis data.

Setiap form yang mengubah keadaan, termasuk login dan logout, harus menyertakan token
CSRF. Laravel mencocokkan token pada request dengan token yang tersimpan di session;
token yang hilang atau kedaluwarsa menghasilkan response 419 @laravel_csrf.

Dua risiko session yang ditutup pada praktikum ini adalah _session fixation_ dan
session yang tetap hidup setelah logout. ID session diregenerasi setelah login berhasil.
Saat logout, session di-invalidate dan token CSRF diregenerasi, sehingga cookie lama
tidak dapat dipakai lagi @owasp_session.

== Autentikasi dan otorisasi berbasis role

Autentikasi menjawab pertanyaan “siapa pengguna ini”, sedangkan otorisasi menjawab
“apa yang boleh dilakukan pengguna ini”. Pengguna yang sudah login belum tentu boleh
membuka area pengelolaan. Karena itu aplikasi memakai kolom `role` dan middleware
`EnsureAdmin`. Middleware ini mengembalikan 403 bila role pengguna bukan `admin`,
bukan mengalihkannya ke halaman login @laravel_authorization @owasp_access_control.

Pembedaan response penting. Tamu yang belum login diarahkan ke `/login` karena mereka
masih bisa memperbaiki keadaan dengan masuk. Pengguna yang sudah login tetapi bukan
admin mendapat 403 karena kredensialnya sah, tetapi hak aksesnya tidak cukup.

#pagebreak()

= Hasil dan Pembahasan

Laporan ini melanjutkan aplikasi portofolio pertemuan 8. Kondisi awal adalah aplikasi
Laravel 13.32.0 dengan route `projects`, CRUD project, seeder, pencarian, dan pagination
pada commit `74a4feb`. Seluruh langkah berikut dijalankan di atas kondisi tersebut.
Lingkungan pengujian memakai PHP 8.5.12, Composer 2.10.3, Node.js 24.21.0, MariaDB 11
pada `127.0.0.1:33060`, dan Breeze 2.4.2.

Untuk mengikuti laporan ini dari awal, siapkan salinan aplikasi pada kondisi tersebut:

#codeblock(
```sh
git clone https://github.com/atalariq/PPWL-my-portfolio.git
cd PPWL-my-portfolio
git checkout 74a4feb
composer install
npm install
cp .env.example .env
php artisan key:generate
php artisan migrate --seed
```,
  header: [terminal],
)

Perintah `git checkout 74a4feb` menghasilkan aplikasi pertemuan 8. Commit hasil
praktikum ini adalah `cc227ab` dan dipakai sebagai acuan kode pada laporan
@repo_p9.

== Memasang Breeze pada aplikasi yang sudah berjalan

Modul memakai Breeze untuk menghasilkan scaffold autentikasi. Dua perintah berikut
memasang paket dan menjalankan _installer_ untuk stack Blade:

#codeblock(
```sh
composer require laravel/breeze --dev
php artisan breeze:install blade --no-interaction
```,
  header: [terminal],
)

Breeze 2.4.2 menambahkan paket `laravel/breeze` ke `require-dev`, menyalin controller,
request, view, komponen, route, dan test autentikasi, lalu menjalankan `npm install`
serta `npm run build`. Keluaran akhir proses tersebut menampilkan pesan
`Breeze scaffolding installed successfully.`

Breeze dirancang untuk aplikasi baru, sehingga beberapa berkas yang sudah ada ikut
tertimpa. Berkas yang perlu dipulihkan atau digabungkan dicatat pada tabel berikut.

#tbl(
  caption: [Berkas yang dihasilkan Breeze dan tindakan yang diambil pada aplikasi portofolio.],
  columns: (1.2fr, 1.3fr, 1.5fr),
  [Berkas], [Kondisi setelah Breeze], [Tindakan],
  [`routes/web.php`], [Route Breeze menimpa route portofolio], [Route portofolio dipulihkan, `routes/auth.php` dimuat dengan `require`],
  [`resources/views/layouts/app.blade.php`], [Layout Breeze berbasis komponen], [Layout publik portofolio dipulihkan],
  [`resources/views/welcome.blade.php`], [Halaman selamat datang Breeze], [Dihapus karena aplikasi memakai `home.blade.php`],
  [`resources/views/dashboard.blade.php`], [Dashboard Breeze], [Dihapus, dashboard pengelolaan dibuat pada pertemuan 10],
  [`package.json`], [Tailwind 3, PostCSS, Autoprefixer, Alpine], [Tailwind 4 dipertahankan, Alpine dan `@tailwindcss/forms` dipakai],
  [`vite.config.js`], [Konfigurasi Vite tanpa plugin Tailwind], [Plugin `@tailwindcss/vite` dipulihkan],
  [`tailwind.config.js`, `postcss.config.js`], [Konfigurasi Tailwind 3], [Dihapus karena Tailwind 4 tidak memerlukannya],
)

Konfigurasi frontend dikembalikan ke Tailwind 4 agar aplikasi tidak menurunkan versi
_toolchain_. Dependensi yang tetap dipakai dari Breeze adalah `alpinejs` dan
`@tailwindcss/forms`. Berkas `package.json` menjadi seperti berikut.

#codeblock(
```json
{
    "private": true,
    "type": "module",
    "scripts": {
        "build": "vite build",
        "dev": "vite"
    },
    "devDependencies": {
        "@tailwindcss/forms": "^0.5.10",
        "@tailwindcss/vite": "^4.0.0",
        "alpinejs": "^3.4.2",
        "concurrently": "^10.0.3",
        "laravel-vite-plugin": "^3.1",
        "tailwindcss": "^4.0.0",
        "vite": "^8.0.0"
    }
}
```,
  header: [package.json],
)

Konfigurasi Vite memakai plugin Tailwind 4 dan tetap menyediakan _hot reload_:

#codeblock(
```js
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import { bunny } from 'laravel-vite-plugin/fonts';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
            fonts: [
                bunny('Instrument Sans', {
                    weights: [400, 500, 600],
                }),
            ],
        }),
        tailwindcss(),
    ],
    server: {
        watch: {
            ignored: ['**/storage/framework/views/**'],
        },
    },
});
```,
  header: [vite.config.js],
)

Berkas CSS memuat Tailwind 4 dan plugin form Breeze:

#codeblock(
```css
@import 'tailwindcss';
@plugin '@tailwindcss/forms';

@source '../../vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php';
@source '../../storage/framework/views/*.php';

@theme {
    --font-sans: 'Instrument Sans', ui-sans-serif, system-ui, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji',
        'Segoe UI Symbol', 'Noto Color Emoji';
}
```,
  header: [resources/css/app.css],
)

Setelah konfigurasi dipulihkan, dependensi dipasang ulang dan aset dibangun:

#codeblock(
```sh
npm install
npm run build
```,
  header: [terminal],
)

Untuk pengembangan, Vite dijalankan dengan `npm run dev`. Halaman `/login` dapat
dibuka setelah server Laravel dan Vite aktif. Hasil yang diharapkan: `/login`
menampilkan form email dan password, sedangkan `/register` belum tersedia karena
registrasi akan dinonaktifkan pada langkah 7.

#img(
  image("assets/page-login.png"),
  caption: [Halaman login Breeze yang dipakai aplikasi. Form memuat email, password, opsi remember me, dan tautan reset password.],
)

== Menyiapkan user admin dan kolom role

Modul membuat akun admin melalui seeder. Aplikasi ini menambahkan kolom `role` agar
pemeriksaan admin tidak bergantung pada satu alamat email. Migrasi dibuat dengan
perintah:

#codeblock(
```sh
php artisan make:migration add_role_to_users_table --table=users
```,
  header: [terminal],
)

Berkas migrasi yang dihasilkan diisi sebagai berikut:

#codeblock(
```php
public function up(): void
{
    Schema::table('users', function (Blueprint $table) {
        $table->string('role', 20)->default('user')->after('email');
    });
}

public function down(): void
{
    Schema::table('users', function (Blueprint $table) {
        $table->dropColumn('role');
    });
}
```,
  header: [database/migrations/2026_11_05_015244_add_role_to_users_table.php],
)

Kolom `role` diberi nilai bawaan `user`, sehingga pengguna yang dibuat sebelum migrasi
tetap memiliki role yang valid. Nilai `admin` diberikan secara eksplisit melalui
seeder. Seeder memakai `updateOrCreate()` agar dapat dijalankan berulang tanpa
menghasilkan duplikat:

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

`Hash::make()` membentuk hash sebelum nilai disimpan. Model `User` juga memakai _cast_
`hashed`, sehingga password yang diberikan melalui `User::create()` tetap aman. Kolom
`role` harus ada di daftar `Fillable` agar dapat diisi secara massal:

#codeblock(
```php
#[Fillable(['name', 'email', 'password', 'role'])]
#[Hidden(['password', 'remember_token'])]
class User extends Authenticatable
{
    public function isAdmin(): bool
    {
        return $this->role === 'admin';
    }
}
```,
  header: [app/Models/User.php],
)

Jalankan migrasi dan seeder:

#codeblock(
```sh
php artisan migrate
php artisan db:seed
```,
  header: [terminal],
)

Hasil yang diharapkan: tabel `users` memiliki kolom `role`, dan seeder menghasilkan dua
akun, yaitu `admin@example.com` dengan role `admin` serta `test@example.com` dengan
role `user`. Perintah `php artisan tinker --execute="echo App\Models\User::count();"`
mencetak `2` setelah basis data di-seed dari kondisi kosong.

== Alur login dan session

Breeze menaruh logika login di `AuthenticatedSessionController`. Method `store()`
memanggil `LoginRequest@authenticate()`, meregenerasi ID session, lalu mengarahkan
pengguna sesuai role:

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

`LoginRequest` menangani validasi, percobaan autentikasi, dan pembatasan laju login.
Setelah lima percobaan gagal, request berikutnya ditolak sementara dengan pesan
_throttle_:

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

public function ensureIsNotRateLimited(): void
{
    if (! RateLimiter::tooManyAttempts($this->throttleKey(), 5)) {
        return;
    }

    event(new Lockout($this));

    $seconds = RateLimiter::availableIn($this->throttleKey());

    throw ValidationException::withMessages([
        'email' => trans('auth.throttle', [
            'seconds' => $seconds,
            'minutes' => ceil($seconds / 60),
        ]),
    ]);
}
```,
  header: [app/Http/Requests/Auth/LoginRequest.php],
)

`redirect()->intended()` menghormati halaman yang ingin dibuka sebelum pengguna
dialihkan ke login. Jika pengguna membuka `/post/projects` sebagai tamu, setelah login
sebagai admin ia kembali ke halaman tersebut. Pengguna non-admin tidak dikirim ke area
pengelolaan karena akan langsung mendapat 403; ia diarahkan ke beranda dengan pesan
status.

Hasil yang diharapkan: login dengan `admin@example.com` dan `password123` berakhir di
`/post/projects`; login dengan `test@example.com` dan `password` berakhir di `/` dengan
pesan bahwa akun tidak memiliki akses; password salah menampilkan pesan
`These credentials do not match our records.` dan email tetap terisi.

#img(
  image("assets/page-login-error.png"),
  caption: [Percobaan login dengan password salah. Pesan kesalahan tampil di bawah field email dan nilai email dipertahankan.],
)

== Logout dan proteksi CSRF

Logout bukan operasi baca, sehingga route-nya memakai method POST dan form menyertakan
token CSRF. Breeze menangani logout di method `destroy()`:

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

Route logout didaftarkan di `routes/auth.php`:

#codeblock(
```php
Route::post('logout', [AuthenticatedSessionController::class, 'destroy'])
    ->name('logout');
```,
  header: [routes/auth.php],
)

Form logout pada layout admin memakai `@csrf`:

#codeblock(
```blade
<form method="POST" action="{{ route('logout') }}">
    @csrf
    <button type="submit" class="text-sm text-red-600 hover:underline">Logout</button>
</form>
```,
  header: [resources/views/layouts/admin.blade.php],
)

`invalidate()` menghapus data session lama, sedangkan `regenerateToken()` membuat token
CSRF baru. Kombinasi keduanya mencegah cookie session lama dipakai kembali setelah
logout @owasp_session.

Hasil yang diharapkan: menekan tombol Logout mengembalikan pengguna ke `/`, navbar
kembali menampilkan tautan Login, dan request `GET /logout` ditolak dengan status 405
karena route hanya menerima POST.

== Melindungi grup route `/post`

Area pengelolaan dipisahkan dari halaman publik. Semua route pengelolaan berada di
bawah prefix `/post` dan memakai middleware `auth` serta `admin`:

#codeblock(
```php
Route::prefix('post')->name('post.')->middleware(['auth', 'admin'])->group(function () {
    Route::resource('projects', ProjectController::class);
});

Route::prefix('post')->name('post.')->middleware('auth')->group(function () {
    Route::get('profile-saya', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('profile-saya', [ProfileController::class, 'update'])->name('profile.update');
});
```,
  header: [routes/web.php],
)

Grup pertama memakai `auth` dan `admin`. Grup kedua hanya memakai `auth` karena halaman
profil boleh dibuka oleh pengguna yang sudah login, termasuk pengguna non-admin.
Pemisahan ini mencegah pengguna non-admin kehilangan akses ke profilnya sendiri.

Tujuan pengalihan diatur di `bootstrap/app.php`. Laravel 13 tidak memiliki
`RouteServiceProvider` seperti versi lama, sehingga konfigurasi ditempatkan pada
middleware:

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

`redirectGuestsTo('/login')` mengarahkan tamu ke halaman login. `redirectUsersTo('/')`
mengarahkan pengguna yang sudah login ke beranda ketika membuka halaman `guest`,
misalnya `/login`. Nilai ini sengaja tidak diarahkan ke `/post/projects` karena
pengguna non-admin akan menerima 403.

Verifikasi route dilakukan dengan perintah:

#codeblock(
```sh
php artisan route:list --path=post -v
```,
  header: [terminal],
)

Hasil yang diharapkan: Sembilan route `/post` tampil dengan middleware `web`, `auth`,
dan `admin` pada route project, sedangkan route profil hanya memakai `web` dan `auth`.
Rincian route dicatat pada Lampiran.

== Middleware custom `EnsureAdmin`

Middleware custom dibuat dengan perintah:

#codeblock(
```sh
php artisan make:middleware EnsureAdmin
```,
  header: [terminal],
)

Isi middleware memeriksa role pengguna. Jika pengguna tidak login atau role-nya bukan
`admin`, request dihentikan dengan 403:

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

Alias `admin` didaftarkan di `bootstrap/app.php`:

#codeblock(
```php
$middleware->alias([
    'admin' => EnsureAdmin::class,
]);
```,
  header: [bootstrap/app.php],
)

Sejak Laravel 11, tidak ada `app/Http/Kernel.php`. Alias middleware didaftarkan melalui
`bootstrap/app.php`, bukan melalui properti `$routeMiddleware` seperti pada versi lama.

Hasil yang diharapkan: tamu yang membuka `/post/projects` diarahkan ke `/login`;
pengguna dengan role `user` mendapat halaman 403 dengan pesan `Akses ditolak.`; pengguna
dengan role `admin` dapat membuka halaman project.

#img(
  image("assets/page-403.png"),
  caption: [Halaman 403 yang diterima pengguna non-admin ketika membuka area pengelolaan.],
)

== Menonaktifkan registrasi publik

Registrasi publik dinonaktifkan agar akun pengelola tidak dapat dibuat oleh sembarang
pengunjung. Route registrasi dihapus dari `routes/auth.php`:

#codeblock(
```php
Route::middleware('guest')->group(function () {
    Route::get('login', [AuthenticatedSessionController::class, 'create'])
        ->name('login');

    Route::post('login', [AuthenticatedSessionController::class, 'store']);

    // route register dihapus
});
```,
  header: [routes/auth.php],
)

Berkas yang hanya dipakai oleh registrasi juga dihapus, yaitu
`app/Http/Controllers/Auth/RegisteredUserController.php` dan
`resources/views/auth/register.blade.php`. Tautan menuju registrasi tidak boleh
dibiarkan karena akan menghasilkan galat `Route [register] not defined`. Halaman login
Breeze tidak memuat tautan registrasi, sehingga tidak ada tautan mati yang tersisa.

Hasil yang diharapkan: `GET /register` dan `POST /register` menghasilkan 404. Akun baru
hanya dapat dibuat melalui seeder atau `php artisan tinker` oleh pengelola.

== Menampilkan identitas user dan halaman profil

Navbar publik menampilkan nama pengguna yang sedang login. Tautan mengarah ke area
pengelolaan, sedangkan tamu melihat tautan Login:

#codeblock(
```blade
@auth
    <a href="{{ route('post.projects.index') }}" class="{{ request()->routeIs('post.*') ? 'font-semibold underline' : '' }}">
        {{ auth()->user()->name }}
    </a>
    <form method="POST" action="{{ route('logout') }}" class="inline">
        @csrf
        <button type="submit" class="cursor-pointer underline-offset-2 hover:underline">Logout</button>
    </form>
@else
    <a href="{{ route('login') }}" class="{{ request()->routeIs('login') ? 'font-semibold underline' : '' }}">Login</a>
@endauth
```,
  header: [resources/views/partials/navbar.blade.php],
)

Layout admin menampilkan nama, role, dan inisial pengguna. Menu aktif ditandai dengan
`request()->routeIs()`:

#codeblock(
```blade
<a href="{{ route('post.projects.index') }}"
   class="block rounded px-3 py-2 {{ request()->routeIs('post.projects.*') ? 'bg-gray-800 font-semibold text-white' : 'text-gray-300 hover:bg-gray-800 hover:text-white' }}">
    Projects
</a>
```,
  header: [resources/views/layouts/admin.blade.php],
)

Halaman profil tersedia di `/post/profile-saya`. Route-nya memakai middleware `auth`
saja, sehingga pengguna non-admin tetap dapat memperbarui namanya. `ProfileController`
menampilkan form dan menyimpan perubahan:

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
    $request->user()->fill($request->validated());

    if ($request->user()->isDirty('email')) {
        $request->user()->email_verified_at = null;
    }

    $request->user()->save();

    return Redirect::route('post.profile.edit')->with('status', 'profile-updated');
}
```,
  header: [app/Http/Controllers/ProfileController.php],
)

Form profil memuat dua bagian: informasi profil dan perubahan password. Form informasi
profil memakai method PATCH dan route `post.profile.update`; form password memakai
method PUT dan route `password.update`.

#img(
  image("assets/page-profile.png"),
  caption: [Halaman profil pada area admin. Form nama dan email berada di kiri, form perubahan password di kanan.],
)

Hasil yang diharapkan: nama pengguna tampil di navbar publik dan layout admin; halaman
`/post/profile-saya` dapat dibuka setelah login; tamu yang membuka halaman profil
diarahkan ke `/login`.

== Menguji seluruh alur

Pengujian otomatis mencakup login admin, login non-admin, password salah, pembatasan
laju, logout, proteksi route, role 403, registrasi yang ditutup, dan halaman profil.
Perintah yang dipakai:

#codeblock(
```sh
composer test
```,
  header: [terminal],
)

Keluaran akhir:

#codeblock(
```text
Tests:    31 passed (80 assertions)
```,
  header: [terminal],
)

Skenario manual yang dijalankan pada browser dicatat pada tabel berikut.

#tbl(
  caption: [Skenario manual dan hasil yang diamati pada aplikasi pertemuan 9.],
  columns: (1.5fr, 1.4fr, 1.2fr),
  [Skenario], [Hasil yang diharapkan], [Status],
  [Tamu membuka `/post/projects`], [Dialihkan ke `/login`], [Sesuai],
  [Admin login], [Dialihkan ke `/post/projects`], [Sesuai],
  [Non-admin login], [Dialihkan ke `/` dengan pesan status], [Sesuai],
  [Non-admin membuka `/post/projects`], [Halaman 403 `Akses ditolak.`], [Sesuai],
  [Password salah], [Pesan kredensial tidak cocok, email tetap terisi], [Sesuai],
  [Logout], [Kembali ke `/`, session berakhir], [Sesuai],
  [Membuka `/register`], [404, route registrasi tidak ada], [Sesuai],
  [Membuka `/post/profile-saya`], [200 untuk pengguna login], [Sesuai],
)

Halaman publik tetap dapat dibaca tanpa login. Daftar project publik menampilkan data
yang sama seperti pertemuan 8, tetapi tombol pengelolaan tidak lagi muncul untuk tamu.

#img(
  image("assets/page-projects-public.png"),
  caption: [Daftar project publik. Pencarian, jumlah data per halaman, dan pagination tetap berfungsi tanpa login.],
)

#img(
  image("assets/page-projects-admin.png"),
  caption: [Daftar project pada area pengelolaan `/post/projects`. Sidebar, identitas admin, dan aksi Edit/Delete hanya tersedia untuk admin.],
)

#pagebreak()

= Kesimpulan

+ Session authentication membuat server mengenali pengguna antar-request melalui cookie
  dan data session sisi server. ID session diregenerasi setelah login dan di-invalidate
  saat logout.
+ Breeze menyediakan scaffold login, logout, reset password, dan konfirmasi password.
  Scaffold tersebut dipasang pada aplikasi yang sudah berjalan, lalu route, layout, dan
  konfigurasi Tailwind 4 dipulihkan agar aplikasi tetap konsisten.
+ Middleware `auth` melindungi area pengelolaan dari tamu, sedangkan middleware
  `EnsureAdmin` membatasi area tersebut pada pengguna dengan role `admin`. Tamu
  diarahkan ke login, pengguna non-admin mendapat 403.
+ Kolom `role` dan seeder idempoten menghasilkan akun admin tanpa bergantung pada satu
  alamat email. Registrasi publik ditutup, sehingga akun pengelola hanya dibuat oleh
  pengelola.
+ Seluruh alur diverifikasi dengan 31 test otomatis dan delapan skenario manual.
  Halaman publik tetap terbuka, sedangkan area `/post` hanya dapat diakses admin.

#pagebreak()

#appendix[
  == Daftar route

  #text(size: 7.5pt)[
  #tbl(
    caption: [Route utama aplikasi setelah pertemuan 9.],
    columns: (0.45fr, 1.15fr, 2.2fr, 0.8fr),
    [Method], [URI], [Name], [Middleware],
    [`GET`], [`/login`], [`login`], [`guest`],
    [`POST`], [`/login`], [`-`], [`guest`],
    [`POST`], [`/logout`], [`logout`], [`auth`],
    [`GET`], [`/post/projects`], [`post.projects.index`], [`auth`, `admin`],
    [`GET`], [`/post/projects/create`], [`post.projects.create`], [`auth`, `admin`],
    [`POST`], [`/post/projects`], [`post.projects.store`], [`auth`, `admin`],
    [`GET`], [`/post/projects/{project}/edit`], [`post.projects.edit`], [`auth`, `admin`],
    [`PUT/PATCH`], [`/post/projects/{project}`], [`post.projects.update`], [`auth`, `admin`],
    [`DELETE`], [`/post/projects/{project}`], [`post.projects.destroy`], [`auth`, `admin`],
    [`GET`], [`/post/profile-saya`], [`post.profile.edit`], [`auth`],
    [`PATCH`], [`/post/profile-saya`], [`post.profile.update`], [`auth`],
  )
  ]

  == Ringkasan pengujian

  #tbl(
    caption: [Ringkasan kelas pengujian dan cakupannya.],
    columns: (1.4fr, 2.2fr, 0.8fr),
    [Kelas], [Cakupan], [Hasil],
    [`AuthTest`], [Login, logout, rate limit, 403, registrasi ditutup, profil], [Lulus],
    [`PasswordConfirmationTest`], [Konfirmasi password], [Lulus],
    [`PasswordResetTest`], [Permintaan dan penyelesaian reset password], [Lulus],
    [`PasswordUpdateTest`], [Perubahan password dari halaman profil], [Lulus],
    [`ProjectCrudTest`], [CRUD project pada area admin], [Lulus],
  )
]
