#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web 1",
  course-code: "PPW1",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "10",
  title: "JavaScript",
)

#show: report.with(
  ..metadata,
  association: (
    program: "Teknologi Rekayasa Perangkat Lunak",
    department: "Teknik Elektro dan Informatika",
    faculty: "Sekolah Vokasi",
    university: "Universitas Gadjah Mada",
    city: "Yogyakarta",
    logo: image("assets/logo.png", width: 6cm),
  ),
  year: 2026,
  use-cover: true,
  bib: bibliography("references.bib", style: "ieee"),
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
)

#set par(justify: true, first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), header: [#path.split("/").at(-1)], ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), ..args)

#daftar-isi()

// ── Tujuan Praktikum ────────────────────────────────────────────────────────

= Tujuan Praktikum

Praktikum ini bertujuan untuk:

+ Memahami tiga cara penulisan kode _JavaScript_ dalam dokumen _HTML_, yaitu _embed_, _inline_, dan _eksternal_.
+ Mampu menampilkan _output_ _JavaScript_ menggunakan fungsi `console.log()`, `alert()`, `document.write()`, dan `innerHTML`.
+ Mampu menggunakan dialog interaktif `prompt()` untuk menerima masukan serta menerapkan operator perbandingan dalam pengambilan keputusan.
+ Mampu menggunakan dialog `confirm()` dan `prompt()` untuk membuat sistem verifikasi data dengan _output_ dalam bentuk tabel.
+ Mampu mengimplementasikan kalkulator sederhana yang mendukung operasi aritmatika dasar menggunakan _JavaScript_.

// ── Dasar Teori ─────────────────────────────────────────────────────────────

= Dasar Teori

== Pengertian JavaScript

_JavaScript_ adalah bahasa pemrograman yang awalnya dirancang untuk berjalan pada peramban web dan kini telah berkembang untuk digunakan di berbagai lingkungan seperti peladen, permainan, dan perangkat _Internet of Things_ @mdn-js-guide. Berbeda dengan bahasa _HTML_ yang bersifat statis, _JavaScript_ memberikan kemampuan kepada halaman web untuk merespons tindakan pengguna, memanipulasi konten, dan melakukan komputasi secara dinamis. _JavaScript_ dikenal sebagai bahasa yang bersifat _dynamic typing_, sehingga deklarasi variabel tidak memerlukan spesifikasi tipe data secara eksplisit.

== Cara Penulisan JavaScript

Kode _JavaScript_ dapat dituliskan dalam dokumen _HTML_ melalui tiga metode @mdn-script. Metode pertama adalah _embed_, yaitu kode ditulis langsung di dalam tag `<script>` yang ditempatkan pada bagian `<head>` atau `<body>` dokumen. Metode kedua adalah _inline_, yaitu kode ditulis sebagai nilai atribut _HTML_ seperti `onclick` atau `href` dengan awalan `javascript:`. Metode ketiga adalah _eksternal_, yaitu kode ditulis dalam berkas terpisah berekstensi `.js` yang kemudian dirujuk melalui atribut `src` pada tag `<script>`. Setiap metode memiliki kelebihan tersendiri; metode _eksternal_ umumnya lebih terstruktur dan memudahkan pengelolaan kode pada proyek berskala besar.

== Metode Output JavaScript

_JavaScript_ menyediakan empat cara untuk menampilkan _output_ kepada pengguna @mdn-console @w3s-output. Fungsi `console.log()` menampilkan pesan ke konsol peramban dan umum digunakan untuk keperluan _debugging_. Fungsi `alert()` menampilkan jendela dialog berisi pesan informatif atau peringatan. Fungsi `document.write()` menulis teks langsung ke dokumen _HTML_ saat halaman dimuat. Properti `innerHTML` digunakan untuk menyisipkan atau mengganti konten _HTML_ pada elemen tertentu secara lebih spesifik. Masing-masing metode memiliki perilaku yang berbeda sehingga penggunaannya disesuaikan dengan kebutuhan.

== Dialog Interaktif

_JavaScript_ menyediakan tiga jenis dialog interaktif bawaan peramban @mdn-dialog. Fungsi `alert()` menampilkan pesan informatif dalam jendela dialog tanpa nilai kembali. Fungsi `confirm()` menampilkan dialog konfirmasi dengan dua pilihan (_OK_ dan _Cancel_) yang mengembalikan nilai _boolean_. Fungsi `prompt()` menampilkan dialog yang meminta masukan teks dari pengguna dan mengembalikan nilai _string_. Ketiga fungsi ini berada dalam objek `window` dan bersifat _blocking_, artinya eksekusi kode akan berhenti sementara hingga dialog ditutup.

== Operator dan Percabangan

_JavaScript_ mendukung berbagai jenis operator untuk melakukan komputasi dan pengambilan keputusan @mdn-operator. Operator aritmatika mencakup penjumlahan (`+`), pengurangan (`-`), perkalian (`*`), dan pembagian (`/`). Operator perbandingan seperti lebih besar (`>`), lebih kecil (`<`), dan sama dengan (`==` atau `===`) menghasilkan nilai _boolean_ yang digunakan dalam struktur percabangan `if-else if-else`. Operator `===` tidak hanya membandingkan nilai tetapi juga tipe data, sehingga lebih ketat dibandingkan `==`.

// ── Hasil dan Pembahasan ────────────────────────────────────────────────────

#pagebreak()

= Hasil dan Pembahasan

== Tugas 10.1: Tiga Cara Penulisan JavaScript

Tugas ini bertujuan untuk mendemonstrasikan tiga metode penulisan kode _JavaScript_ dalam dokumen _HTML_, yaitu _embed_, _inline_, dan _eksternal_. Berkas `use-js.html` memuat implementasi dari ketiga metode tersebut.

Metode _embed_ diterapkan dengan menuliskan kode fungsi `helloWorld()` di dalam tag `<script>` pada bagian `<head>`. Selanjutnya, fungsi tersebut dipanggil melalui atribut `onclick` pada tombol. Metode _inline_ diimplementasikan langsung pada atribut _HTML_, yaitu `onclick="alert('BOOM!!')"` pada tombol dan `href="javascript:alert(...)"` pada tautan. Metode _eksternal_ diimplementasikan dengan memisahkan kode ke dalam berkas `external.js` yang berisi fungsi `consoleMessage()` dan `alertMessage()`, kemudian dirujuk melalui `<script src="external.js">`.

#include-code("src/use-js.html", line-range: (17, 50))

#img("assets/ss-tugas-10-1.png", caption: [Hasil render halaman use-js.html yang menampilkan tiga metode penulisan JavaScript])

Pemilihan tiga metode ini menunjukkan fleksibilitas _JavaScript_ dalam penempatan kode. Metode _embed_ cocok untuk kode singkat yang spesifik pada satu halaman, metode _inline_ berguna untuk menangani _event_ sederhana secara cepat, dan metode _eksternal_ memungkinkan pemisahan logika dari struktur yang mempermudah perawatan kode pada proyek besar.

#pagebreak()

== Tugas 10.2: Empat Metode Output JavaScript

Tugas ini mendemonstrasikan empat cara menampilkan _output_ _JavaScript_, yaitu melalui `console.log()`, `alert()`, `document.write()`, dan `innerHTML`. Berkas `output-js.html` mengimplementasikan keempat metode tersebut dalam satu halaman.

Saat halaman dimuat, `console.log()` menuliskan pesan ke konsol peramban. Tombol "Click Me!" pada bagian `alert()` memicu dialog peringatan. Tombol "Click to overwrite" pada bagian `document.write()` akan mengganti seluruh konten halaman dengan konten baru. Tombol "Click to update text below" pada bagian `innerHTML` mengubah teks di dalam elemen dengan `id="text"` tanpa memengaruhi elemen lainnya di halaman.

#include-code("src/output-js.html", line-range: (61, 82))

#img("assets/ss-tugas-10-2.png", caption: [Hasil render halaman output-js.html yang menampilkan empat metode output JavaScript])

Perbedaan mendasar dari keempat metode ini terletak pada target _output_-nya. `console.log()` hanya menampilkan di konsol peramban, `alert()` menampilkan dialog terpisah, `document.write()` menimpa seluruh dokumen saat dipanggil setelah halaman dimuat, dan `innerHTML` mengubah konten pada elemen tertentu secara selektif.

#pagebreak()

== Tugas 11.1: Perbandingan Dua Bilangan

Tugas ini menerapkan fungsi `prompt()` untuk menerima dua masukan bilangan dari pengguna, kemudian membandingkan kedua bilangan tersebut menggunakan operator perbandingan. Berkas `compare-two-number.html` mengimplementasikan logika tersebut.

Pengguna memulai proses dengan menekan tombol "Start Compare", yang memicu fungsi `compareTwoNumber()`. Fungsi ini memanggil `prompt()` sebanyak dua kali untuk menerima bilangan pertama dan kedua. Kedua masukan dikonversi menjadi tipe _number_ melalui fungsi `Number()`, kemudian divalidasi menggunakan `isNaN()`. Setelah validasi, kedua bilangan dibandingkan menggunakan struktur `if-else if-else`. Hasil perbandingan ditampilkan dalam tiga kemungkinan: bilangan pertama lebih besar, lebih kecil, atau sama dengan bilangan kedua. Setiap hasil ditampilkan dengan latar belakang warna yang berbeda agar mudah dibedakan.

#include-code("src/compare-two-number.html", line-range: (25, 78))

#img("assets/ss-tugas-11-1.png", caption: [Hasil render saat dua bilangan telah dibandingkan dengan output berwarna sesuai kondisi])

Penerapan `isNaN()` berfungsi untuk menangani masukan yang tidak valid, misalnya ketika pengguna memasukkan teks bukan angka. Validasi ini mencegah _error_ saat proses konversi atau perbandingan data.

#pagebreak()

== Tugas 11.2: Verifikasi Praktikan PPW1

Tugas ini menerapkan dialog `confirm()` dan `prompt()` untuk membuat sistem verifikasi status praktikan, dengan _output_ hasil ditampilkan dalam bentuk tabel. Berkas `confirm-js.html` mengimplementasikan logika verifikasi tersebut.

Pengguna memulai dengan menekan tombol "Start Verification", yang memicu fungsi `verifyStudent()`. Fungsi `confirm()` menanyakan apakah pengguna adalah praktikan PPW1. Jika pengguna memilih _OK_, maka tiga kali `prompt()` berturut-turut meminta nama, NIM, dan angkatan. Data tersebut kemudian ditampilkan dalam tabel dengan tata letak yang rapi. Jika pengguna membatalkan salah satu _prompt_, pesan peringatan ditampilkan. Jika pengguna memilih _Cancel_ pada dialog `confirm()`, maka pesan penolakan "You are not a PPW1 student, you may not enter!" ditampilkan.

#include-code("src/confirm-js.html", line-range: (166, 230))

#img("assets/ss-tugas-11-2.png", caption: [Hasil render saat data praktikan berhasil diverifikasi dan ditampilkan dalam tabel])

Fungsi `escapeHtml()` digunakan untuk mencegah serangan _Cross-Site Scripting_ (XSS) dengan mengubah karakter khusus menjadi entitas _HTML_, sehingga masukan yang mengandung tag _HTML_ tidak akan dieksekusi sebagai kode.

#pagebreak()

== Tugas 11.3: Kalkulator Sederhana

Tugas ini mengimplementasikan kalkulator sederhana dengan antarmuka berbasis tombol yang mendukung operasi aritmatika dasar: penjumlahan, pengurangan, perkalian, dan pembagian. Kalkulator ini terdiri dari dua berkas, yaitu `calculator.html` untuk struktur antarmuka dan `calculator.js` untuk logika pemrosesan.

#include-code("src/calculator.html", line-range: (182, 207))

Kalkulator menggunakan pendekatan _state machine_ dengan variabel `currentValue`, `previousValue`, dan `activeOperator` untuk melacak status operasi. Tombol angka dan operator dipetakan ke dalam fungsi `inputDigit()`, `handleOperator()`, dan `handleEquals()`. Setiap penekanan tombol operator akan menyimpan nilai sebelumnya dan menunggu masukan kedua, kemudian saat tombol sama dengan (`=`) ditekan, hasil perhitungan ditampilkan pada _display_.

#include-code("src/calculator.js", line-range: (58, 114))

#img("assets/ss-tugas-11-3.png", caption: [Hasil render kalkulator dengan antarmuka Flexoki Light dan tampilan display setelah dilakukan perhitungan])

Penanganan terhadap pembagian dengan nol dilakukan dengan memeriksa nilai pembagi sebelum melakukan operasi. Jika pembagi bernilai nol, pesan "Error" ditampilkan pada _display_. Mekanisme _chaining calculation_ memungkinkan pengguna untuk melanjutkan operasi dari hasil yang telah diperoleh tanpa perlu memasukkan ulang nilai.

// ── Kesimpulan ──────────────────────────────────────────────────────────────

#pagebreak()

= Kesimpulan

Berdasarkan hasil praktikum yang telah dilakukan, dapat disimpulkan beberapa hal sebagai berikut.

+ _JavaScript_ dapat dituliskan dalam dokumen _HTML_ melalui tiga metode, yaitu _embed_, _inline_, dan _eksternal_. Metode _eksternal_ memberikan keunggulan dalam hal pemisahan logika dan kemudahan perawatan kode.
+ _Output_ _JavaScript_ dapat ditampilkan melalui empat cara dengan perilaku yang berbeda: `console.log()` menulis ke konsol untuk _debugging_, `alert()` menampilkan dialog, `document.write()` menimpa konten halaman, dan `innerHTML` memodifikasi elemen tertentu secara selektif.
+ Dialog interaktif `prompt()` dan `confirm()` memungkinkan pengambilan masukan dan konfirmasi dari pengguna secara langsung, yang kemudian dapat diolah menggunakan struktur percabangan `if-else`.
+ Operator perbandingan dan aritmatika di _JavaScript_ berfungsi sebagaimana mestinya dan telah berhasil diterapkan dalam program perbandingan bilangan dan kalkulator sederhana.
+ Penerapan validasi masukan menggunakan `isNaN()` dan penanganan kasus pembagian dengan nol merupakan praktik penting untuk menjaga keandalan program.

// ── Lampiran ────────────────────────────────────────────────────────────────

#heading(level: 1, numbering: none)[Lampiran]
#show link: underline

Seluruh kode sumber yang digunakan dalam praktikum ini dapat diakses melalui repositori GitHub serta dilihat secara langsung melalui laman demo berikut:

+ Repositori GitHub: #link("https://github.com/atalariq/PPW1/tree/main/Pertemuan-10")
+ Demo _live_: #link("https://atalariq.github.io/PPW1")
