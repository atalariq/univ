# PPWL Pertemuan 6 - CRUD (Lanjutan Pertemuan 5)

## Resume

Di pertemuan 5 [^p5] kita sudah membuat:
- index() — menampilkan daftar
- create() — menampilkan form
- store() — menyimpan data (sebagian, perlu dilengkapi)
Pertemuan ini kita lengkapi dengan show(), edit(), update(), destroy().

## Tugas
- Silahkan terapkan flash message saat kalian membuat data baru dan hapus data
- Tambahkan validasi: title minimal 5 karakter dan description minimal 10 karakter. Gunakan aturan min:5 dan min:10.
- Buat konfirmasi delete menggunakan JavaScript.

## My Notes

### Method spoofing

HTML hanya tau HTTP method GET dan POST. Nah, di Laravel, untuk pakai method PUT, PATCH, dan DELETE disediakan method spoofing

```php
@method('PUT')
@method('PATCH')
@method('DELETE')
```

### Route Model Binding

Laravel secara otomatis mengambil data berdasarkan ID dari sebuah Request URL.

```php
// Parameter {post} → Laravel cari Post dengan ID tersebut
public function show(Post $post)
{
 // $post sudah berisi data dari database
}
```

### CSRF (Cross-Site Request Forgery)

- CSRF adalah serangan di mana pengguna tidak sadar mengirim request dari situs lain.
- Laravel melindungi form POST/PUT/DELETE secara default dengan token CSRF.

### Flash Message

...

### CRUD - Update / Edit
### CRUD - Delete

Kenapa menggunakan `<form>` bukan `<a>`?
- `<a>` selalu mengirimkan GET, Route delete di resource controller hanya menerima DELETE. Jadi kalau ditulis `<a href="/posts/1">`Hapus</a> yang terjadi adalah halaman detail post terbuka, bukan data terhapus. URL-nya sama, tetapi HTTP method-nya berbeda. Untuk mengirim DELETE lewat browser (tanpa JavaScript) kita perlu `<form method="POST">` ditambah `@method('DELETE')`, dan `@method` hanya bekerja di dalam form.
- GET tidak boleh mengubah data. Dalam standar HTTP, GET dianggap safe, artinya hanya untuk membaca. Kalau hapus dibuat lewat GET, misalnya `/posts/1/delete` , ada risiko bot yang lewat bisa menghapus seluruh data tanpa ada yang sengaja mengklik.
- Form Laravel membawa token lewat `@csrf`. Laravel memeriksa token ini untuk request POST, PUT, PATCH, dan DELETE, tetapi tidak untuk GET. Akibatnya, kalau hapus lewat GET, penyerang cukup menaruh ini di halaman lain:
  `<img src="https://situs-anda.test/posts/1/delete ">`
  Saat user yang sedang login membuka halaman itu, browser mengirim request beserta cookie sesinya dan data terhapus tanpa disadari

<!-- Footnotes -->
[^p5]: ../p5-controller-model/NOTES.md
