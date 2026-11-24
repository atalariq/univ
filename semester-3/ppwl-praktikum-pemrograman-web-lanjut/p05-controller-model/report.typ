#import "@local/laprak:1.0.0": laprak

#show: laprak.with(
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2",
  mata-kuliah: "Praktikum Pemrograman Web Lanjutan",
  kode-mata-kuliah: "PPWL",
  nama-dosen-pengampu: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  no-pertemuan: "5",
  judul-praktikum: "Controller dan Model Laravel",
  logo: path("assets/logo-UGM.png"),
  bibliography-file: path("references.bib"),
)

= Tujuan Praktikum

+ Mahasiswa mampu mengenali Controller dan Model/Migration pada Laravel.
+ Mahasiswa mengetahui cara membuat Controller dan Model/Migration pada Laravel.
+ Mahasiswa dapat menggunakan / menerapkan Controller dan Model/Migration pada project.

= Dasar Teori

== Controller dalam MVC

Controller adalah kelas yang mengelompokkan logika penanganan request untuk satu resource, menggantikan closure route yang ditulis langsung di `routes/web.php` @laravel_controllers. Pada pola MVC, controller berperan sebagai penghubung antara request HTTP, model (data), dan view (tampilan): controller menerima input, memanggil model untuk membaca atau menulis data, lalu mengembalikan view atau redirect sebagai response. Secara default Laravel menyimpan controller di `app/Http/Controllers`, dan kelas dibuat lewat perintah `php artisan make:controller`.

== Resource Controller dan `Route::resource`

Untuk resource yang punya operasi CRUD standar (index, create, store, show, edit, update, destroy), Laravel menyediakan *resource controller* lewat opsi `--resource` pada `make:controller`, yang men-generate kerangka ketujuh method sekaligus @laravel_controllers. Method-method ini didaftarkan ke router hanya dengan satu baris, `Route::resource('nama', Controller::class)`, dan Laravel otomatis membuat tujuh route dengan verb HTTP dan nama route yang konsisten (`nama.index`, `nama.show`, dan seterusnya) @laravel_routing. Pendekatan ini menghindari penulisan tujuh route manual satu per satu untuk tiap resource.

== Model dan Eloquent ORM

Model adalah kelas yang mewakili satu tabel di basis data. Eloquent, ORM bawaan Laravel, memetakan setiap baris tabel menjadi objek PHP sehingga query dasar (ambil, simpan, ubah, hapus data) ditulis lewat method pada model, bukan SQL mentah @laravel_eloquent. Nama tabel disimpulkan otomatis dari nama kelas dalam bentuk jamak (`Project` memetakan ke tabel `projects`), dan setiap model mewarisi kelas `Illuminate\Database\Eloquent\Model`.

== Migration sebagai Version Control Skema

Migration adalah berkas PHP yang mendeskripsikan perubahan skema basis data (membuat tabel, menambah kolom, dan sejenisnya) secara terprogram, sehingga struktur tabel dapat dibagikan lewat repository dan dijalankan ulang di lingkungan lain tanpa perlu menjelaskan perubahan itu secara manual ke anggota tim lain @laravel_migrations. Setiap migration punya method `up()` untuk menerapkan perubahan dan `down()` untuk membatalkannya, dan dieksekusi lewat `php artisan migrate`.

== Mass Assignment dan `$fillable`

Mass assignment adalah pengisian banyak atribut model sekaligus lewat satu array, misalnya `Project::create($data)`. Karena cara ini menerima array apa saja termasuk yang berasal dari input pengguna, Eloquent mewajibkan properti `$fillable` pada model untuk mendaftarkan kolom mana saja yang boleh diisi lewat mass assignment; kolom di luar daftar itu akan diabaikan @laravel_eloquent. Properti ini mencegah pengguna menyisipkan nilai untuk kolom yang tidak dimaksudkan untuk diisi lewat form.

== Validasi Request dan Proteksi CSRF

Sebelum data dari form diteruskan ke model, Laravel menyediakan method `validate()` pada objek `Request` untuk memeriksa data terhadap sekumpulan aturan (`required`, `max`, dan lain-lain); jika ada aturan yang gagal, request diarahkan kembali ke form disertai pesan error tanpa menjalankan kode setelahnya @laravel_validation. Untuk form HTML yang mengirim method selain `GET`, Laravel mewajibkan token CSRF yang disisipkan lewat direktif `@csrf`; tanpa token ini request akan ditolak dengan status 419 karena middleware CSRF bawaan memverifikasi bahwa request benar berasal dari form aplikasi sendiri, bukan dari situs lain @laravel_csrf.

#pagebreak()

= Hasil dan Pembahasan

Praktikum ini melanjutkan project portfolio dari pertemuan 4 dengan Laravel 13.32.0, PHP 8.5, dan MySQL di lingkungan Lerd. Fokusnya menambahkan resource `Project` lengkap dengan model, migration, controller, dan view, menggantikan data project yang sebelumnya berupa array statis di `routes/web.php`.

== Pembuatan Model dan Migration

Model dan migration dibuat sekaligus dengan perintah:

```sh
php artisan make:model Project --migration
```

Kolom tabel `projects` diisi di berkas migration sesuai kebutuhan data project (judul, link repository, deskripsi):

```php
Schema::create('projects', function (Blueprint $table) {
    $table->id();
    $table->string('title', 200);
    $table->string('repo', 200);
    $table->mediumText('description');
    $table->timestamps();
});
```

`mediumText` dipakai untuk kolom `description` karena deskripsi project bisa lebih panjang dari batas `VARCHAR` biasa. Setelah kolom didefinisikan, migration dijalankan dengan `php artisan migrate`, dan struktur tabel yang terbentuk diverifikasi langsung di basis data.

== Resource Controller dan Pendaftaran Route

`ProjectController` dibuat dengan perintah:

```sh
php artisan make:controller ProjectController --resource
```

lalu didaftarkan dengan satu baris di `routes/web.php`:

```php
Route::resource('projects', ProjectController::class);
```

Baris ini menggantikan route tunggal `Route::get('/projects', ...)->name('projects')` dari pertemuan sebelumnya. Konsekuensinya, named route `projects` tidak lagi ada; yang terdaftar sekarang adalah tujuh route dengan awalan `projects.`, seperti `projects.index` dan `projects.show`. Perubahan ini sempat membuat `resources/views/partials/navbar.blade.php` error karena masih memanggil `route('projects')`, dan `resources/views/home.blade.php` sempat melempar `RouteNotFoundException` dengan pesan serupa karena tombol "View Projects" juga masih memakai nama route lama. Kedua berkas itu diperbaiki dengan mengganti pemanggilan menjadi `route('projects.index')`.

#figure(
  image("assets/route-list-projects.png"),
  caption: [Bagian `projects.*` pada `php artisan route:list`.],
)

== Menampilkan Daftar Project

Method `index()` pada `ProjectController` mengambil seluruh data lewat Eloquent dan mengirimkannya ke view:

```php
public function index()
{
    return view('projects.index', ['projects' => Project::latest()->get()]);
}
```

`Project::latest()` mengurutkan data berdasarkan `created_at` terbaru. View `projects/index.blade.php` menampilkan jumlah project dan me-loop data dengan `@forelse`, memakai ulang partial `partials/card.blade.php` untuk setiap kartu project, sama seperti pola yang sudah dipakai pada pertemuan 4.

#figure(
  image("assets/views-folder-structure.png", width: 80%),
  caption: [Struktur folder `resources/views` dengan subfolder `projects/`.],
)

#figure(
  image("assets/page-projects-index.png"),
  caption: [Halaman daftar project di `/projects`.],
)

== Halaman Detail Project

Method `show()` memakai *route model binding*:

```php
public function show(Project $project)
{
    return view('projects.show', ['project' => $project]);
}
```

Modul praktikum mencontohkan pengambilan data lewat `Project::find($id)` dengan parameter `string $id`, tetapi implementasi ini memakai type-hint `Project $project` langsung di parameter method. Dengan route model binding, Laravel mencari baris `projects` berdasarkan segmen URL sebelum method dijalankan dan langsung menyuntikkan objek `Project`-nya; jika baris tidak ditemukan, Laravel otomatis mengembalikan halaman 404 tanpa perlu pengecekan `null` secara manual seperti pada pola `find($id)`.

#figure(
  image("assets/page-projects-show.png"),
  caption: [Halaman detail project di `/projects/1`.],
)

== Form Insert Project

Form pada `projects/create.blade.php` mengirim `POST` ke `route('projects.store')` dan menyertakan `@csrf` agar lolos proteksi CSRF. Method `store()` memvalidasi input sebelum menyimpannya:

```php
public function store(Request $request)
{
    $request->validate([
        'title'       => 'required|max:200',
        'repo'        => 'required|max:200',
        'description' => 'required',
    ]);

    Project::create($request->only(['title', 'repo', 'description']));

    return redirect()->route('projects.index');
}
```

`Project::create()` memakai mass assignment, sehingga hanya kolom yang terdaftar di `$fillable` model (`title`, `repo`, `description`) yang bisa diisi lewat cara ini. Jika validasi gagal, Laravel mengarahkan kembali ke form dan blade menampilkan pesan error per field lewat `@error('nama_field')`, dengan nilai yang sudah diisi tetap dipertahankan lewat `old()`.

#figure(
  image("assets/page-projects-create.png"),
  caption: [Form insert project di `/projects/create`.],
)

#figure(
  image("assets/page-projects-form-validation-error.png"),
  caption: [Pesan error saat form dikirim kosong.],
)

== Data Dummy Lewat Seeder

Data dummy diisi lewat `database/seeders/ProjectSeeder.php` yang memanggil `Project::create()` untuk lima project, bukan lewat input manual di phpMyAdmin. Seeder disimpan sebagai kode dan ikut ter-commit ke repository, sehingga data yang sama bisa dibuat ulang kapan saja dengan `php artisan db:seed` tanpa perlu mengetik ulang isian satu per satu, dan setiap anggota tim yang meng-clone project mendapat data awal yang identik.

== Method yang Belum Diisi

Method `edit()`, `update()`, dan `destroy()` pada `ProjectController` dibiarkan kosong sesuai stub bawaan `make:controller --resource`. Cakupan modul pertemuan ini berhenti di pembuatan data (insert), sehingga fungsi edit dan hapus belum diimplementasikan.

= Kesimpulan

Seluruh ketentuan tugas terpenuhi: model dan migration `Project` dibuat lewat `make:model --migration`, resource controller `ProjectController` menangani index, show, create, dan store lewat `Route::resource`, halaman daftar dan detail project ditampilkan dari data basis data, form insert dilengkapi validasi dan proteksi CSRF, dan data dummy diisi lewat seeder. Pergantian named route dari `projects` menjadi `projects.index` menuntut perbaikan pada dua view yang masih memanggil nama route lama. Kode di-push ke repository pada branch `pertemuan5`.
