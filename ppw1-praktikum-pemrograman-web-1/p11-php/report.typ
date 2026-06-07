#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "PL2B2",
  course: "Praktikum Pemrograman Web 1",
  course-code: "PPW1",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "11",
  title: "PHP",
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

+ Memahami penggunaan variabel PHP untuk menampilkan data dinamis pada halaman HTML.
+ Memahami pembuatan fungsi PHP serta penanganan formulir dan validasi input menggunakan _superglobal_ `$_POST`.
+ Memahami penggunaan fungsi `date()` untuk manipulasi dan perhitungan tanggal.
+ Memahami dasar interaksi JavaScript dengan _Document Object Model_ (DOM) melalui pembuatan kalkulator sederhana.

// ── Dasar Teori ─────────────────────────────────────────────────────────────

= Dasar Teori

== PHP: Variabel, Fungsi, dan Superglobals

PHP merupakan bahasa pemrograman _server-side_ untuk pengembangan web dinamis
@php-manual-language. Kode PHP dieksekusi di server dan menghasilkan HTML yang
dikirim ke peramban. Variabel dalam PHP diawali dengan simbol `$` dan tidak
memerlukan deklarasi tipe secara eksplisit (_dynamic typing_).

#code(header: "variable.php", numbering: false, ```php
<?php
$nama = "Atalariq Barra Hadinugraha";
$nim  = "25/557554/SV/26192";
?>
<p>Nama: <?= $nama ?></p>
<p>NIM:  <?= $nim ?></p>
```)

Fungsi didefinisikan dengan kata kunci `function` dan dapat mengembalikan nilai
menggunakan `return`. Parameter dapat diisi dengan tipe data tertentu secara
opsional (_type hint_).

#code(header: "function.php", numbering: false, ```php
<?php
function getBMI(float $weightInKg, float $heightInMeter): float {
    return round($weightInKg / ($heightInMeter ** 2), 1);
}
?>
```)

Data dari formulir HTML dapat diakses melalui _superglobal_ `$_POST` untuk
metode POST. Validasi input dapat dilakukan menggunakan `filter_input()` dengan
menentukan tipe filter yang diinginkan @php-filter-input.

#code(header: "form-handling.php", numbering: false, ```php
<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $weight = filter_input(INPUT_POST, "weight", FILTER_VALIDATE_FLOAT);
    if ($weight === false || $weight <= 0) {
        $error = "Please enter a valid weight.";
    }
}
?>
```)

== PHP: Fungsi Date

Fungsi `date(string $format, ?int $timestamp = null): string` memformat
_timestamp_ Unix menjadi string tanggal sesuai dengan format yang ditentukan
@php-manual-date. Parameter `$timestamp` bersifat opsional; bila tidak diisi,
fungsi menggunakan _timestamp_ saat ini. Tabel 1 menunjukkan beberapa format
karakter yang paling umum digunakan.

#tbl(
  caption: "Format karakter fungsi date()",
  columns: (auto, auto, auto),
  [Karakter], [Deskripsi], [Contoh],
  [d], [Hari, 2 digit], [01--31],
  [j], [Hari, tanpa _leading zero_], [1--31],
  [D], [Hari, 3 huruf], [Mon--Sun],
  [m], [Bulan, 2 digit], [01--12],
  [n], [Bulan, tanpa _leading zero_], [1--12],
  [M], [Bulan, 3 huruf], [Jan--Dec],
  [Y], [Tahun, 4 digit], [2026],
  [y], [Tahun, 2 digit], [26],
  [t], [Jumlah hari dalam bulan], [28--31],
  [H], [Jam, format 24 jam], [00--23],
  [i], [Menit], [00--59],
  [s], [Detik], [00--59],
)

== JavaScript: Event Handling dan DOM

JavaScript adalah bahasa _client-side_ yang memungkinkan interaksi pengguna
tanpa memuat ulang halaman @mdn-javascript-guide. Elemen HTML dapat diakses
melalui DOM menggunakan metode seperti `document.getElementById()`.
`addEventListener()` digunakan untuk mendaftarkan fungsi yang dijalankan saat
peristiwa tertentu terjadi.

#code(header: "event-listener.js", numbering: true, ```js
const input = document.getElementById('num1');
const btn   = document.getElementById('btn-add');

btn.addEventListener('click', () => {
    const a = parseFloat(input.value);
    // lakukan operasi dengan a
});
```)

Fungsi `parseFloat()` mengonversi string menjadi bilangan desimal.
Properti `textContent` mengubah teks dalam elemen HTML tanpa mengeksekusi
HTML, sehingga lebih aman dibandingkan `innerHTML`.

// ── Hasil dan Pembahasan ────────────────────────────────────────────────────

#pagebreak()

= Hasil dan Pembahasan

== Tugas 1: Profile Mahasiswa

Tugas ini bertujuan menampilkan data profil mahasiswa dalam bentuk tabel HTML menggunakan variabel PHP. Empat variabel didefinisikan, yaitu `$nama`, `$nim`, `$prodi`, dan `$asal_kota`, yang masing-masing menyimpan data diri. Nilai variabel tersebut kemudian ditampilkan di dalam sel tabel menggunakan _short echo tag_ `<?= $var ?>`. Tabel yang dihasilkan memiliki dua kolom: kolom pertama berisi label (Nama, NIM, Program Studi, Asal Kota) dan kolom kedua berisi nilai dari masing-masing variabel. Potongan kode PHP dan HTML yang digunakan ditunjukkan pada Potongan Kode 1.

#include-code("src/profile.php", line-range: (1, 42))

#img("assets/ss-profile-mahasiswa.png", caption: [Hasil render halaman Profile Mahasiswa yang menampilkan data diri dalam tabel HTML.])

== Tugas 2: Body Mass Index Calculator

Tugas ini menerapkan pembuatan fungsi PHP, penanganan formulir dengan metode POST, dan validasi input. Tiga fungsi dibuat, yaitu `getBMI()` untuk menghitung nilai BMI, `getBMICategory()` untuk mengelompokkan kategori BMI (Underweight, Normal weight, Overweight, Obese), dan `getIdealWeightInsight()` yang memberikan informasi rentang berat badan ideal serta jumlah berat yang perlu ditambah atau dikurangi untuk mencapai rentang normal. Formulir HTML menerima input berat (kg) dan tinggi (cm), kemudian diproses oleh PHP ketika metode permintaan adalah POST. Validasi dilakukan menggunakan `filter_input()` dengan `FILTER_VALIDATE_FLOAT` untuk memastikan input merupakan angka positif. Hasil perhitungan hanya ditampilkan jika formulir telah dikirim dan tidak ada kesalahan validasi. Potongan kode fungsi-fungsi PHP ditunjukkan pada Potongan Kode 2.

#include-code("src/bmi-calculator.php", line-range: (7, 52))

Penanganan formulir dan validasi input ditunjukkan pada Potongan Kode 3. Variabel-variabel seperti `$bmi`, `$bmiCategory`, dan `$insight` diinisialisasi dengan nilai kosong terlebih dahulu, kemudian diisi setelah validasi berhasil. Hal ini mencegah _undefined variable warning_ ketika halaman pertama kali dimuat melalui metode GET. Setelah validasi berhasil, data dikirim ke fungsi `getBMI()`, `getBMICategory()`, dan `getIdealWeightInsight()` untuk dihitung dan ditampilkan dalam tabel hasil.

#include-code("src/bmi-calculator.php", line-range: (55, 78))

#img("assets/ss-bmi-calculator.png", caption: [Hasil perhitungan BMI Calculator dengan input berat dan tinggi yang menampilkan nilai BMI, kategori, rentang berat ideal, serta _insight_ yang disarankan.])

== Tugas 3: Date Remainder

Tugas ini memanfaatkan fungsi `date()` untuk menampilkan informasi bulan dan hari saat ini serta menghitung sisa hari dalam bulan tersebut. Variabel `$month` menyimpan nomor bulan, `$day` menyimpan hari saat ini, dan `$maxDays` menyimpan total hari dalam bulan berjalan. Sisa hari diperoleh dari pengurangan `$maxDays - $day`. Nilai-nilai tersebut ditampilkan dalam halaman HTML menggunakan _short echo tag_. PicoCSS digunakan sebagai _framework_ CSS untuk memperbaiki tata letak halaman. Potongan kode ditunjukkan pada Potongan Kode 4.

#include-code("src/date.php", line-range: (1, 29))

#img("assets/ss-date-remainder.png", caption: [Hasil render halaman Date Remainder yang menampilkan bulan, hari saat ini, dan sisa hari dalam bulan berjalan.])

== Tugas 4: Kalkulator JavaScript

Tugas ini menerapkan interaktivitas _client-side_ menggunakan JavaScript murni (_vanilla JS_). Sebuah kalkulator sederhana dibuat dengan dua kolom input bilangan dan empat tombol operasi (tambah, kurang, kali, bagi). Setiap tombol memiliki _event listener_ yang memanggil fungsi `calculate()` dengan parameter operasi yang sesuai.

Fungsi `getValues()` membaca nilai dari kedua kolom input, mengonversinya ke bilangan desimal menggunakan `parseFloat()`, dan memvalidasi apakah input merupakan angka yang valid. Jika salah satu atau kedua input tidak valid, fungsi mengembalikan `null` dan menampilkan pesan kesalahan. Fungsi `calculate()` menerima parameter operasi, kemudian menggunakan struktur `switch` untuk menentukan operasi aritmetika yang akan dilakukan. Hasil perhitungan ditampilkan pada elemen paragraf dengan ID `result` melalui properti `textContent`. Penanganan kasus pembagian dengan nol dilakukan dengan menampilkan pesan kesalahan khusus sebelum operasi dijalankan. Kode JavaScript lengkap ditunjukkan pada Potongan Kode 5, sedangkan struktur halaman HTML ditunjukkan pada Potongan Kode 6.

#include-code("src/calculator.js", line-range: (1, 53))

#include-code("src/calculator.html", line-range: (14, 28))

#img("assets/ss-calculator.png", caption: [Hasil perhitungan kalkulator JavaScript dengan operasi penjumlahan yang menampilkan input bilangan dan hasil operasi aritmetika.])

// ── Kesimpulan ──────────────────────────────────────────────────────────────

#pagebreak()

= Kesimpulan

+ Variabel PHP dapat digunakan untuk menyimpan data dinamis dan ditampilkan langsung di dalam HTML menggunakan _short echo tag_ `<?= ?>`, sehingga memungkinkan pembuatan halaman web yang kontennya dapat berubah secara terprogram.
+ Fungsi PHP, penanganan formulir dengan `$_POST`, dan validasi input menggunakan `filter_input()` memungkinkan pembuatan aplikasi web yang memproses data dari pengguna secara aman dan terstruktur.
+ Fungsi `date()` menyediakan berbagai opsi format untuk manipulasi tanggal, termasuk penghitungan sisa hari dalam satu bulan, yang berguna untuk aplikasi berbasis kalender.
+ JavaScript dengan DOM manipulation melalui `getElementById()` dan `addEventListener()` memungkinkan pembuatan antarmuka yang interaktif tanpa perlu memuat ulang halaman.

// ── Lampiran ────────────────────────────────────────────────────────────────

#pagebreak()
#heading(level: 1, numbering: none)[Lampiran]
#show link: underline

Kode sumber seluruh tugas pada praktikum ini dapat diakses melalui repositori GitHub melalui tautan berikut: #link("https://github.com/atalariq/PPW1-PHP/tree/main/src/p11")
