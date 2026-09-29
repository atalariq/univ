#import "@atalariq/lab-report:3.0.0": *

#set par(justify: true)

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web Lanjutan",
  course-code: "PPWL",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "6",
  title: "CRUD Laravel",
  logo: image("assets/logo.png", width: 6cm),
)

#show: report.with(
  bib: bibliography("references.yaml"),
)

#cover(..metadata)

#toc()

= Tujuan Praktikum

+ Mahasiswa mampu melengkapi _resource controller_ dengan method `edit()`, `update()`, dan `destroy()`.
+ Mahasiswa mampu menerapkan _flash message_ untuk memberi umpan balik setelah operasi `create` dan `delete`.
+ Mahasiswa mampu menerapkan aturan validasi panjang minimum pada input formulir.
+ Mahasiswa mampu membuat konfirmasi aksi hapus data menggunakan JavaScript di sisi klien.

= Dasar Teori

== CRUD dan Resource Route

CRUD adalah singkatan dari Create, Read, Update, dan Delete, empat operasi dasar yang hampir selalu dibutuhkan terhadap data persisten. Alih-alih mendefinisikan tujuh _route_ CRUD satu per satu, Laravel menyediakan `Route::resource()` yang mendaftarkan ketujuh _route_ sekaligus ke satu _controller_, lengkap dengan _verb_ HTTP dan nama _route_ yang konsisten @laravel_routing @laravel_controllers.

#tbl(
  caption: [_Route_ yang didaftarkan `Route::resource('projects', ProjectController::class)`.],
  columns: (auto, auto, auto, auto),
  [*Verb*], [*URI*], [*Action*], [*Nama Route*],
  [`GET`], [`/projects`], [`index`], [`projects.index`],
  [`GET`], [`/projects/create`], [`create`], [`projects.create`],
  [`POST`], [`/projects`], [`store`], [`projects.store`],
  [`GET`], [`/projects/{project}`], [`show`], [`projects.show`],
  [`GET`], [`/projects/{project}/edit`], [`edit`], [`projects.edit`],
  [`PUT`/`PATCH`], [`/projects/{project}`], [`update`], [`projects.update`],
  [`DELETE`], [`/projects/{project}`], [`destroy`], [`projects.destroy`],
)

Tiga baris terakhir pada tabel di atas, yaitu `edit`, `update`, dan `destroy`, adalah bagian yang dilengkapi pada praktikum ini, melanjutkan `index`, `create`, dan `store` yang sudah dibuat sebelumnya.

== Sifat Method HTTP

Setiap HTTP method punya dua sifat yang relevan untuk desain _endpoint_: _safe_ dan _idempotent_. Method bersifat _safe_ jika ia tidak mengubah _state_ apa pun di server, sedangkan method bersifat _idempotent_ jika mengirim _request_ yang sama berkali-kali menghasilkan efek akhir yang sama seperti mengirimnya sekali @rfc9110. `PUT` dan `DELETE` tetap tergolong idempotent meskipun mengubah data di server, karena mengirim `PUT` yang sama dua kali menghasilkan _resource_ dengan isi akhir yang identik, dan menghapus _resource_ yang sudah terhapus tidak mengubah keadaan _resource_ itu lagi.

#tbl(
  caption: [Sifat _safe_ dan _idempotent_ untuk method HTTP yang dipakai di aplikasi ini.],
  columns: (auto, auto, auto),
  [*Method*], [*Safe*], [*Idempotent*],
  [`GET`], [Ya], [Ya],
  [`POST`], [Tidak], [Tidak],
  [`PUT`], [Tidak], [Ya],
  [`DELETE`], [Tidak], [Ya],
)

`POST` tidak _idempotent_ karena setiap _request store_ dianggap membuat _resource_ baru; mengirim `POST` yang sama dua kali secara naif akan menghasilkan dua project, bukan satu @mdn_http. Sifat _safe_ inilah yang jadi alasan operasi hapus tidak boleh dipasang lewat `GET`, sebagaimana dibahas pada subbab CSRF berikut.

== _Method Spoofing_

HTML hanya mengenal dua HTTP method pada atribut `method` formulir, yaitu `GET` dan `POST` @mdn_http. Untuk method lain seperti `PUT`, `PATCH`, dan `DELETE` yang dipakai pada operasi update dan delete, Laravel menyediakan _method spoofing_ lewat direktif `@method()`. Direktif ini menyisipkan input tersembunyi bernama `_method` ke dalam formulir:

#code-figure(
  ```html
  <form action="/example" method="POST">
      <input type="hidden" name="_method" value="PUT">
  </form>
  ```,
  caption: [HTML yang dihasilkan direktif `@method('PUT')` di dalam form.],
)

Formulir tetap dikirim sebagai `POST` secara fisik, tetapi Laravel membaca nilai `_method` di sisi server dan memperlakukan _request_ seolah dikirim dengan method `PUT` @laravel_routing. Direktif `@method()` hanya berlaku di dalam elemen `<form>` karena bekerja lewat input tersembunyi, bukan lewat header _request_.

== _Route Model Binding_

_Route model binding_ membuat Laravel otomatis mengambil instance model berdasarkan ID pada segmen URI, tanpa perlu memanggil query secara manual di dalam method _controller_ @laravel_routing. Ketika parameter _route_ bernama `{project}` dicocokkan dengan parameter method bertipe `Project $project`, Laravel menjalankan pencarian yang setara dengan `Project::findOrFail($id)` sebelum method _controller_ dieksekusi. Sebagai contoh, _request_ `GET /projects/5` akan mengisi `$project` dengan baris berID 5 dari tabel `projects`; jika baris dengan ID tersebut tidak ada, Laravel menghentikan _request_ lebih awal dengan respons 404 tanpa masuk ke badan method sama sekali.

== Session, Pola _Post/Redirect/Get_ (PRG), dan _Flash Data_

HTTP bersifat _stateless_: setiap _request_ diperlakukan terpisah tanpa mengingat _request_ sebelumnya. Session mengatasi ini dengan menyimpan data di sisi server dan menandai tiap klien lewat ID unik pada _cookie_, sehingga server bisa "mengingat" klien yang sama antar-_request_ @laravel_session. _Flash data_ adalah data session yang sengaja dibuat berumur pendek, hanya tersedia untuk satu _request_ berikutnya setelah disimpan, lalu otomatis dibuang oleh Laravel tanpa perlu dihapus manual.

Pola ini dipasangkan dengan _Post/Redirect/Get_ (PRG): setelah `POST`/`PUT`/`DELETE` berhasil diproses, server tidak langsung merender halaman hasil, melainkan mengirim redirect (302) ke halaman `GET` terpisah @prg. Tanpa pola ini, me-refresh halaman hasil akan meminta browser mengirim ulang `POST` yang sama, berisiko menduplikasi data.

#tbl(
  caption: [Timeline tiga _request_ pada alur create project dengan _flash message_.],
  columns: (auto, 1fr, 2fr),
  [*\#*], [*Request*], [*Yang terjadi*],
  [1], [`POST` `/projects`], [`store()` menyimpan data, memanggil `with('success', ...)`, lalu redirect 302 ke `/projects`.],
  [2], [`GET` `/projects`], [_Flash message_ tersedia untuk _request_ ini; `session('success')` tampil di halaman.],
  [3], [Refresh `GET` `/projects`], [_Flash message_ sudah dibuang Laravel; halaman tampil tanpa pesan.],
)

Laravel menyediakan _flash message_ lewat method `with()` yang dirangkai pada `redirect()`, dan data tersebut dibaca di view lewat helper `session()` @laravel_session @laravel_responses.

== Validasi Input di Sisi Server

Sebelum data dari formulir disimpan, `$request->validate()` memeriksa data terhadap sekumpulan aturan @laravel_validation. Jika seluruh aturan lolos, eksekusi method _controller_ berlanjut ke baris berikutnya. Jika ada aturan yang gagal, Laravel melempar `ValidationException`, mengarahkan _request_ kembali ke formulir asal (mengikuti pola PRG dari subbab sebelumnya), lalu menyimpan pesan error dan input terakhir ke _flash_ session, yang kemudian dibaca lewat `@error()` dan `old()`.

Aturan dituliskan sebagai string berpemisah `|` dalam satu baris per field (`'title' => 'required|min:5|max:200'`), setara dengan menuliskannya sebagai array (`'title' => ['required', 'min:5', 'max:200']`); kedua bentuk berperilaku sama.

Makna aturan `min`, `max`, dan `size` tidak selalu berarti "jumlah karakter": maknanya bergantung pada tipe data field yang divalidasi @laravel_validation.

#tbl(
  caption: [Makna aturan `min`/`max`/`size` menurut tipe data field.],
  columns: (auto, auto),
  [*Tipe field*], [*Makna `min`/`max`/`size`*],
  [String], [Jumlah karakter.],
  [Numerik], [Nilai angka itu sendiri.],
  [Array], [Jumlah elemen dalam array.],
  [File], [Ukuran berkas dalam kilobyte.],
)

Sebagai contoh kerja, string `"12345"` lolos aturan `min:5` karena panjangnya lima karakter, tetapi nilai `"7"` dengan aturan `numeric|min:5` gagal karena sebagai angka, 7 lebih kecil dari 5. Aturan yang dipakai pada praktikum ini bertipe string, sehingga `min` dihitung dari jumlah karakter:

#tbl(
  caption: [Aturan validasi yang dipakai pada field `title` dan `description`.],
  columns: (auto, auto, auto, auto),
  [*Field*], [*Aturan*], [*Contoh input*], [*Hasil*],
  [title], [`required|min:5|max:200`], [`"Abcd"` (4 karakter)], [Gagal, kurang dari `min:5`],
  [title], [`required|min:5|max:200`], [`"My Project"`], [Lolos],
  [description], [`required|min:10`], [`"Too short"` (9 karakter)], [Gagal, kurang dari `min:10`],
  [description], [`required|min:10`], [`"A sufficiently long description."`], [Lolos],
)

Selain `required`, `min`, dan `max`, Laravel menyediakan aturan lain yang relevan untuk kasus serupa, misalnya `nullable` untuk field opsional, `string` untuk memastikan tipe data, `url` untuk memvalidasi format tautan, dan `bail` untuk menghentikan pengecekan field itu pada kegagalan pertama alih-alih memeriksa seluruh aturan @laravel_validation.

Validasi di sisi server berbeda dari atribut HTML seperti `minlength`, yang hanya bekerja di sisi klien lewat _constraint validation_ browser @mdn_minlength. Atribut semacam itu berguna untuk umpan balik instan, tetapi mudah dilewati dengan menonaktifkan JavaScript atau mengirim _request_ langsung ke server, sehingga validasi di sisi server tetap wajib ada sebagai lapisan yang tidak bisa dilewati pengguna.

== CSRF (_Cross-Site Request Forgery_)

_Cross-Site Request Forgery_ (CSRF) adalah serangan yang menipu browser milik pengguna yang sudah terautentikasi agar mengirim request tidak diinginkan ke situs tempat pengguna itu punya sesi aktif, tanpa sepengetahuannya @owasp_csrf. Akar masalahnya adalah browser secara otomatis menyertakan _cookie_ sesi pada setiap _request_ ke suatu domain, dari halaman mana pun _request_ itu dipicu, bukan hanya dari halaman aplikasi itu sendiri; server yang hanya mengandalkan _cookie_ sesi untuk mengenali pengirim _request_ tidak bisa membedakan _request_ yang benar-benar berasal dari formulir aplikasinya sendiri dan _request_ yang dipicu diam-diam dari halaman lain.

Sebagai contoh kerja, tanpa proteksi, halaman milik penyerang di situs lain cukup memuat:

#code-figure(
  ```html
  <img src="https://situs-anda.test/projects/1/delete">

  <form action="https://situs-anda.test/projects/1" method="POST" id="csrf-form">
      <input type="hidden" name="_method" value="DELETE">
  </form>
  <script>document.getElementById('csrf-form').submit();</script>
  ```,
  caption: [Dua varian percobaan CSRF: `<img>` untuk _endpoint_ `GET`, dan form yang di-_auto-submit_ untuk _endpoint_ `POST`/`DELETE`.],
)

Baris `<img>` hanya berhasil jika _endpoint_ hapus keliru dipasang lewat `GET`, sedangkan potongan form kedua menunjukkan bahwa _endpoint_ `POST` atau `DELETE` pun tetap rentan selama tidak ada token yang diperiksa; keduanya berjalan begitu saja saat korban yang sedang login membuka halaman penyerang, karena browser ikut menyertakan _cookie_ sesi korban.

Laravel bertahan dari serangan ini lewat _synchronizer token pattern_ @owasp_csrf: token acak disimpan di session pengguna, direktif `@csrf` merender token itu sebagai input tersembunyi `_token` pada formulir, dan _middleware_ CSRF bawaan membandingkan token yang dikirim (lewat input itu atau header `X-CSRF-TOKEN`) dengan token di session pada setiap _request_ `POST`, `PUT`, `PATCH`, dan `DELETE` @laravel_csrf. Situs penyerang tidak bisa membaca token korban karena _Same-Origin Policy_ browser mencegah situs lain mengakses isi halaman aplikasi. Jika token tidak ada atau tidak cocok, Laravel menolak _request_ dengan status 419 sebelum method _controller_ sempat dijalankan @laravel_csrf.

_Middleware_ CSRF tidak memeriksa _request_ `GET` karena `GET` seharusnya bersifat _safe_ sebagaimana dibahas pada subbab sifat method HTTP, sehingga secara desain tidak semestinya mengubah data. Sebagai lapisan tambahan di luar token, atribut _cookie_ `SameSite` membatasi kapan _cookie_ sesi ikut terkirim pada _request_ lintas situs, dan direkomendasikan dipasang bersama token sebagai _defense in depth_, bukan penggantinya @mdn_samesite.

== Blade Stack (`@push`/`@stack`)

Blade menyediakan mekanisme _stack_ untuk mengumpulkan konten, seperti skrip, dari berbagai view yang dirender lalu menampilkannya sekali di satu titik pada layout @laravel_blade. Direktif `@push('nama')` di dalam view menambahkan konten ke stack bernama `nama`, sedangkan `@stack('nama')` di layout merender seluruh konten yang pernah didorong ke stack itu. Pola ini menghindari penulisan tag `<script>` berulang di layout untuk setiap kemungkinan skrip per halaman.

#pagebreak()

= Hasil dan Pembahasan

Praktikum ini melanjutkan _resource_ `Project` dari pertemuan 5, melengkapi tiga _route_ terakhir pada tabel _resource route_ di Dasar Teori, yaitu `edit`, `update`, dan `destroy`, pada `ProjectController` yang sebelumnya masih kosong, serta menambahkan _flash message_, validasi panjang minimum, dan konfirmasi delete di sisi klien.

== Method Edit dan Update

Method `edit()` memakai _route model binding_ yang sama seperti `show()`, mengembalikan view formulir yang sudah terisi data project:

#code-figure(
  ```php
  public function edit(Project $project)
  {
      return view('projects.edit', ['project' => $project]);
  }
  ```,
  caption: [Method `edit()` pada `ProjectController`.],
)

View `projects/edit.blade.php` adalah salinan `projects/create.blade.php` dengan dua perbedaan: nilai awal input diambil dari `old('field', $project->field)` sehingga menampilkan data lama alih-alih kosong, dan formulir menyertakan `@method('PUT')` karena method HTTP untuk update bukan `POST`:

#code-figure(
  ```html
  <form action="{{ route('projects.update', $project) }}" method="POST">
      @csrf
      @method('PUT')

      <input type="text" name="title" value="{{ old('title', $project->title) }}">
      @error('title')
          <p>{{ $message }}</p>
      @enderror
  </form>
  ```,
  caption: [Potongan `projects/edit.blade.php` untuk field `title`.],
)

`old('title', $project->title)` memprioritaskan input terakhir yang dikirim pengguna, baru jatuh ke `$project->title` jika belum ada input yang di-_flash_ ke session. Prioritas ini dibutuhkan karena ketika validasi `update()` gagal, Laravel mengarahkan kembali ke formulir edit sambil membawa input terakhir lewat _flash_ session; tanpa `old()`, formulir akan menampilkan data lama dari basis data, bukan input yang baru saja diketik dan gagal divalidasi, sehingga pesan error di atas tidak terasa terhubung dengan isian formulirnya.

Method `update()` memvalidasi input dengan aturan yang sama seperti `store()`, lalu memperbarui data lewat `$project->update()`, yang menerapkan mass assignment pada kolom yang terdaftar di `$fillable` seperti pada method `store()` @laravel_eloquent:

#code-figure(
  ```php
  public function update(Request $request, Project $project)
  {
      $request->validate([
          'title' => 'required|min:5|max:200',
          'repo' => 'required|max:200',
          'description' => 'required|min:10',
      ]);

      $project->update($request->only(['title', 'repo', 'description']));

      return redirect()->route('projects.show', $project)->with('success', 'Project updated successfully.');
  }
  ```,
  caption: [Method `update()` pada `ProjectController`.],
)

Setelah berhasil, pengguna diarahkan ke halaman detail project yang baru saja diubah, bukan ke halaman daftar, supaya perubahan bisa langsung diverifikasi. Redirect ini juga mengikuti pola PRG yang dibahas di Dasar Teori: `update()` tidak langsung merender view detail sebagai respons dari `PUT`, melainkan mengirim redirect 302 ke _route_ `projects.show`, sehingga me-refresh halaman detail tidak akan mengirim ulang _request_ update.

#img(
  image("assets/page-projects-edit.jpg"),
  caption: [Formulir edit project di `/projects/{id}/edit` terisi data lama.],
)

== Method Destroy dan Konfirmasi Delete

Method `destroy()` menghapus data lewat `$project->delete()`, method Eloquent yang menghapus baris sesuai primary key model saat ini dari basis data @laravel_eloquent, lalu mengarahkan kembali ke daftar project:

#code-figure(
  ```php
  public function destroy(Project $project)
  {
      $project->delete();

      return redirect()->route('projects.index')->with('success', 'Project deleted successfully.');
  }
  ```,
  caption: [Method `destroy()` pada `ProjectController`.],
)

Karena `<a>` selalu mengirim `GET` sedangkan _route_ delete pada _resource controller_ hanya menerima method `DELETE`, tombol hapus dibuat sebagai `<form>` tersendiri yang menyertakan `@csrf` dan `@method('DELETE')`. Elemen `<button type="submit">` di dalamnya menggantikan peran link, sehingga _request_ `DELETE` beserta token CSRF-nya baru terkirim ketika formulir itu di-submit, bukan hanya dengan mengklik tautan biasa.

Jika tombol hapus tetap dipaksa memakai `<a href="/projects/1">Delete</a>`, dua masalah muncul sekaligus. Pertama, `<a>` hanya bisa mengirim `GET`, sedangkan _route_ `projects.destroy` terdaftar untuk `DELETE`, sehingga link itu justru membuka halaman detail project, bukan menghapusnya. Kedua, seandainya _route_ hapus dipaksa didaftarkan lewat `GET` agar link itu berfungsi, method tersebut kehilangan sifat _safe_-nya dan menjadi target contoh serangan `<img src="...">` pada subbab CSRF di Dasar Teori, karena `GET` tidak diperiksa _middleware_ CSRF.

Konfirmasi di sisi klien dipasang lewat atribut `data-confirm` pada formulir tersebut, dan _listener_ JavaScript-nya didaftarkan lewat `@push('scripts')` karena layout `app.blade.php` sudah menyediakan `@stack('scripts')` di akhir `<body>`. Method `window.confirm()` menampilkan dialog modal berisi pesan dan mengembalikan nilai boolean sesuai pilihan pengguna @mdn_window_confirm; nilai ini dipakai pada _event listener_ `submit` formulir, dan ketika dialog dibatalkan, `event.preventDefault()` dipanggil untuk menghentikan pengiriman formulir sehingga _request_ delete tidak pernah terkirim ke server @mdn_prevent_default:

#code-figure(
  ```php
  <form action="{{ route('projects.destroy', $project) }}" method="POST" data-confirm="Delete this project?">
      @csrf
      @method('DELETE')
      <button type="submit" class="text-sm font-medium text-red-600">Delete</button>
  </form>

  @push('scripts')
  <script>
      document.querySelectorAll('form[data-confirm]').forEach((form) => {
          form.addEventListener('submit', (event) => {
              if (!confirm(form.dataset.confirm)) {
                  event.preventDefault();
              }
          });
      });
  </script>
  @endpush
  ```,
  caption: [Form delete dengan konfirmasi lewat `data-confirm` dan _listener_ `submit`.],
)

Pola `data-confirm` dipilih alih-alih `onsubmit="return confirm(...)"` inline supaya pesan konfirmasi bisa dipakai ulang pada formulir delete lain di masa depan tanpa menulis ulang skrip, cukup menambahkan atribut `data-confirm` pada formulir baru.

Konfirmasi ini murni lapisan pengalaman pengguna, bukan lapisan keamanan. Dialog `confirm()` berjalan sepenuhnya di browser dan bisa dilewati dengan menonaktifkan JavaScript atau mengirim _request_ `DELETE` langsung ke _endpoint_-nya; yang benar-benar mencegah _request_ hapus dari situs lain adalah proteksi CSRF yang dibahas di Dasar Teori, bukan dialog ini.

#img(
  image("assets/confirm-delete-dialog.png"),
  caption: [Dialog konfirmasi `window.confirm()` sebelum project dihapus.],
)

== Flash Message Setelah Create dan Delete

Baik `store()` maupun `destroy()` merangkai `->with('success', '...')` pada `redirect()`, mengikuti timeline tiga _request_ yang dibahas di Dasar Teori: pesan disimpan pada _request_ `POST`/`DELETE`, tampil sekali pada _request_ `GET` berikutnya, lalu hilang dengan sendirinya. Blok _flash message_ ditambahkan sekali di layout `app.blade.php` di atas `@yield('content')` sehingga tampil konsisten di semua halaman, bukan diulang di tiap view:

#code-figure(
  ```php
  @if (session('success'))
      <div class="mb-4 rounded border border-green-300 bg-green-50 px-4 py-2 text-sm text-green-800">{{ session('success') }}</div>
  @endif
  ```,
  caption: [Blok _flash message_ di `layouts/app.blade.php`.],
)

#img(
  image("assets/flash-created.jpg"),
  caption: [_Flash message_ setelah project baru berhasil disimpan.],
)

#img(
  image("assets/flash-deleted.jpg"),
  caption: [_Flash message_ setelah project berhasil dihapus.],
)

== Validasi Panjang Minimum

Aturan validasi pada `store()` dan `update()` ditambah `min:5` untuk `title` dan `min:10` untuk `description`. Pesan error bawaan Laravel untuk aturan `min` tetap ditampilkan lewat direktif `@error()` yang sudah dipakai pada pertemuan sebelumnya, tanpa perubahan pada blade.

Array aturan yang sama dituliskan ulang persis di `store()` dan `update()`, sehingga menambah atau mengubah aturan mengharuskan dua tempat diperbarui bersamaan. Laravel menyediakan _Form Request_ sebagai kelas validasi terpisah yang bisa dipakai ulang lintas method _controller_ untuk menghindari duplikasi semacam ini @laravel_validation, tetapi pemindahan ke _Form Request_ tidak dilakukan pada praktikum ini karena cakupan tugas hanya meminta aturan `min` ditambahkan pada kedua method, bukan penataan ulang struktur validasi.

#img(
  image("assets/validation-min-error.jpg"),
  caption: [Pesan error saat title kurang dari 5 karakter dan description kurang dari 10 karakter.],
)

#pagebreak()

= Kesimpulan

+ Method `edit()` dan `update()` berhasil dilengkapi memakai _route model binding_: `edit()` mengembalikan formulir terisi data lama lewat `old('field', $project->field)`, dan `update()` memvalidasi input sebelum menerapkan mass assignment serta mengarahkan pengguna ke halaman detail lewat pola PRG.
+ Method `destroy()` berhasil dilengkapi; tombol hapus dibuat sebagai `<form>` beserta `@method('DELETE')`, bukan `<a>`, karena `<a>` hanya bisa mengirim `GET`, dan `GET` yang dipakai untuk operasi hapus akan kehilangan proteksi CSRF karena _middleware_ CSRF tidak memeriksa method yang seharusnya bersifat _safe_.
+ _Flash message_ berhasil diterapkan pada `store()` dan `destroy()` lewat `redirect()->with()`, dirender sekali di layout lewat `session('success')`, dan mengikuti pola PRG sehingga tidak tampil berulang saat halaman di-refresh.
+ Aturan validasi `min:5` pada `title` dan `min:10` pada `description` berhasil diterapkan pada `store()` dan `update()`, dengan makna "minimum" yang dihitung dari jumlah karakter karena kedua field bertipe string.
+ Konfirmasi delete di sisi klien berhasil dipasang lewat `window.confirm()` dan `event.preventDefault()` yang didaftarkan lewat `@push('scripts')`, dengan catatan bahwa lapisan ini murni untuk pengalaman pengguna dan bukan pengganti proteksi CSRF di sisi server.
+ Praktikum ini menunjukkan bahwa keamanan operasi tulis-hapus pada aplikasi web bertumpu pada beberapa lapisan yang saling melengkapi: method spoofing agar HTML bisa mengirim `PUT`/`DELETE`, validasi server sebagai penjaga yang tidak bisa dilewati klien, dan token CSRF yang memastikan _request_ memang berasal dari formulir aplikasi sendiri.
+ Seluruh Tujuan Praktikum tercapai: `edit()`, `update()`, dan `destroy()` melengkapi _resource controller_ `Project`, _flash message_ dan validasi panjang minimum diterapkan pada operasi terkait, dan konfirmasi hapus di sisi klien terpasang seperti ditunjukkan pada tangkapan layar di Hasil dan Pembahasan. Kode berada pada branch `pertemuan6`.
