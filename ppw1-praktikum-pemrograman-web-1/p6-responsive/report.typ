#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web 1",
  course-code: "PPW1",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "6",
  title: "Responsive Design",
)

#show: report.with(
  ..metadata,

  association: (
    program: "D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK",
    department: "DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA",
    faculty: "SEKOLAH VOKASI",
    university: "UNIVERSITAS GADJAH MADA",
    city: "YOGYAKARTA",
    logo: image("assets/logo.png", width: 6cm),
  ),
  year: 2026,

  use-cover: true,
  bib: bibliography("references.bib"),
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 11pt,
)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), header: path, ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), width: 90%, ..args)

#daftar-isi()
#daftar-gambar()

= Hasil dan Pembahasan

Perubahan pada praktikum ini sepenuhnya berada di `style.css`. Tidak ada perubahan pada struktur `index.html`. Berikut adalah empat area CSS yang dimodifikasi.

== Penghapusan `min-width` pada `body`

Versi sebelumnya menetapkan `min-width: 1024px` pada `body`, yang secara eksplisit memblokir rendering yang benar di bawah lebar tersebut. Properti ini dihapus agar browser tidak membatasi lebar minimum layout dan dapat merender halaman pada viewport ukuran apapun @mdn-viewport.

#include-code("src/style.css", line-range: (107, 113))

== Fluid Typography dengan `clamp()`

Deklarasi ukuran font pada `h1`, `h2`, dan `h3` diubah dari nilai statis menjadi fungsi `clamp(min, val, max)` @mdn-clamp. Fungsi ini menerima tiga argumen: batas bawah, nilai ideal (biasanya dalam satuan viewport seperti `vw`), dan batas atas. Browser memilih nilai di antara ketiganya sesuai lebar viewport saat itu, sehingga tipografi menyesuaikan ukuran secara kontinu tanpa memerlukan media query.

#include-code("src/style.css", line-range: (123, 134))

Hal yang sama diterapkan pada `.hero-title` agar judul hero tetap proporsional di berbagai ukuran layar.

#include-code("src/style.css", line-range: (225, 230))

== Responsive Navbar

Di mobile, navbar cukup menampilkan logo yang diposisikan di tengah — tautan navigasi disembunyikan karena tidak ada ruang yang cukup. Perubahan ini diselesaikan sepenuhnya dengan CSS tanpa modifikasi HTML maupun JavaScript @mdn-media-queries.

`.nav-container` mendapat `justify-content: center` sebagai default sehingga logo otomatis berada di tengah saat satu-satunya elemen yang visible. `.nav-links` diset `display: none` secara default. Sebuah media query pada 768px kemudian menimpa keduanya: `justify-content` dikembalikan ke `space-between` untuk memisahkan logo dan tautan, dan `.nav-links` diubah menjadi `display: flex`.

#include-code("src/style.css", line-range: (159, 203))

== Responsive Card Grid

`.card-grid` sebelumnya ditetapkan secara kaku sebagai tiga kolom `repeat(3, 1fr)`. Pada versi ini diterapkan pendekatan _mobile-first_: nilai _default_ menggunakan `repeat(auto-fit, minmax(280px, 1fr))` yang secara otomatis menentukan jumlah kolom berdasarkan ruang yang tersedia, kemudian dua media query menimpa nilai tersebut pada breakpoint yang lebih lebar @mdn-grid @mdn-media-queries.

#include-code("src/style.css", line-range: (286, 303))

`auto-fit` mengisi jalur grid yang tersisa dan menciutkannya jika tidak ada item, sedangkan `minmax(280px, 1fr)` memastikan setiap kolom tidak pernah lebih sempit dari 280px namun tetap meregang hingga `1fr` jika ruang tersedia @mdn-minmax. Hasilnya: satu kolom di mobile, dua kolom di tablet (≥768px), tiga kolom di desktop (≥1024px).

== Responsive About Grid

`.about-grid` sebelumnya selalu menampilkan dua kolom `2fr 1fr`. Perubahan ini mengadopsi pola yang sama: nilai _default_ `1fr` (satu kolom penuh untuk mobile), lalu media query pada 768px mengembalikan tata letak dua kolom asimetris @mdn-media-queries.

#include-code("src/style.css", line-range: (392, 403))

#pagebreak()

== Hasil Akhir

Berikut adalah perbandingan tampilan halaman pada tiga ukuran viewport setelah seluruh perubahan diterapkan.

#col(
  ratio: (3fr, 4fr),
  img("assets/screenshot-mobile.png", caption: [Tampilan pada viewport mobile]),
  img("assets/screenshot-tablet.png", caption: [Tampilan pada viewport tablet])
)
#img("assets/screenshot-desktop.png", caption: [Tampilan pada viewport desktop])

