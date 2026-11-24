#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Berorientasi Objek",
  course-code: "PPBO",
  lecturer: "Imam Fahrurrozi, S.T., M.Cs.",
  meeting: "6",
  title: "Studi Kasus Sistem Manajemen Parkir Otomatis",

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
  font-size: 12pt,
)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), header: path, ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), width: 90%, ..args)

#daftar-isi()
// #daftar-gambar()
// #daftar-tabel()

= Tujuan Praktikum

+ Memahami dan mengimplementasikan konsep dasar OOP, meliputi Encapsulation, Inheritance, dan Polymorphism.
+ Mampu merancang kelas abstrak dan mengelompokkan objek menggunakan superclass dan subclass.
+ Mengimplementasikan menu interaktif menggunakan perulangan dan percabangan.
+ Menerapkan struktur data array dalam kasus nyata.

= Dasar Teori

Pemrograman Berorientasi Objek (OOP) adalah paradigma pemrograman yang berpusat pada pembuatan objek untuk memodelkan sistem dunia nyata. Daripada berfokus pada fungsi dan logika secara prosedural, OOP membungkus data (*state*) dan fungsi (*behavior*) ke dalam satu entitas tunggal yang disebut objek @liang2019. Terdapat tiga konsep utama yang diimplementasikan dalam sistem parkir ini:

/ *Encapsulation* (Enkapsulasi): mekanisme menyembunyikan detail implementasi internal dari sebuah objek dan membatasi akses langsung ke data tersebut. Secara kerangka kerja abstrak, enkapsulasi bertindak sebagai pelindung data. Sebagai contoh konkret, variabel `nomorPlat` dan `waktuMasuk` diatur sebagai `private` sehingga nilainya hanya dapat diakses melalui metode *getter*, mencegah perubahan data secara tidak sengaja dari luar kelas @deitel2017.

/ *Inheritance* (Pewarisan): memungkinkan pembuatan kelas baru yang mengadopsi properti dan metode dari kelas yang sudah ada. Konsep ini mendukung penggunaan ulang kode dan menciptakan hubungan hierarkis. Dalam sistem ini, `Kendaraan` bertindak sebagai *superclass* yang menurunkan sifat dasarnya ke *subclass* `Mobil` dan `Motor`.

/ *Polymorphism* (Polimorfisme): kemampuan objek dari kelas yang berbeda untuk merespons metode yang sama dengan cara yang spesifik untuk kelas mereka masing-masing @boyarsky2014. Contoh penggunaannya terlihat pada metode `hitungBiaya()`. Walaupun sistem utama hanya memanggil satu metode tersebut, Java akan otomatis menjalankan perhitungan tarif yang berbeda tergantung apakah objek tersebut merupakan turunan `Mobil` atau `Motor`.

#pagebreak()

= Hasil dan Pembahasan

Studi kasus ini meminta pengembangan aplikasi berbasis Command Line Interface (CLI) untuk mengelola parkir kendaraan di sebuah gedung. Sistem memiliki 5 kapasitas petak dan membatasi beban maksimal hingga 12 roda. Terdapat lima menu utama untuk mengelola kendaraan. Aturan bisnis utama menetapkan bahwa posisi mobil harus berada di indeks yang lebih besar dari motor, dan perpindahan kendaraan tidak boleh melanggar hierarki posisi tersebut. Sistem harus terus berjalan di dalam memori dan mengakumulasi total pendapatan hingga pengguna memilih menu keluar.

== Kode Sumber

#include-code("./src/dev/atalariq/parking/SistemParkir.java")

== Penjelasan

Sistem dibagi menjadi dua lapisan utama, yaitu POJO (Plain Old Java Object) & OOP Layer untuk pendefinisian struktur data, dan Main System untuk logika antarmuka dan validasi.

Keputusan menggunakan kelas `Kendaraan` sebagai *abstract class* diambil karena entitas `Kendaraan` secara umum tidak boleh diinstansiasi secara langsung di area parkir nyata; sebuah entitas harus berwujud spesifik sebagai Mobil atau Motor. Dengan menjadikan `hitungBiaya()` dan `getJumlahRoda()` sebagai metode abstrak, kita memaksa setiap subclass turunan untuk mendefinisikan tarif dan rodanya sendiri. Hal ini memusatkan tanggung jawab data pada masing-masing kelas dan menghindari penggunaan blok `if-else` yang panjang saat perhitungan biaya di blok kode utama.

Pada lapisan antarmuka, variabel array `slot` menggunakan indeks berbasis nol (zero-based indexing) sesuai standar memori Java. Namun, pada metode cetak dan input pengguna, sistem menambahkan angka 1 (`i+1`). Pendekatan ini memisahkan logika mesin dari pengalaman pengguna, sehingga pengguna melihat antarmuka yang ramah (slot 1 hingga 5).

Validasi posisi diimplementasikan pada fungsi `isValid()`. Keputusan untuk melakukan iterasi pengecekan ke seluruh array secara berulang (looping ganda) dinilai aman karena ukuran array tergolong sangat kecil (5 petak).

== Contoh Input dan Output

// #img("assets/output-1.png", caption: [Menu Utama dan Status Kosong])
// #img("assets/output-2.png", caption: [Penambahan Kendaraan dan Validasi Aturan])
// #img("assets/output-3.png", caption: [Proses Kendaraan Keluar dan Total Biaya])

#img("assets/menu-utama.png", caption: [Tampilan 'Menu Utama'])
#img("assets/status-kosong.png", caption: [Tampilan 'Status' apabila slot kosong semua])
#img("assets/tambah-motor.png", caption: [Tampilan menu 'Tambah' (1)])
#img("assets/tambah-mobil.png", caption: [Tampilan menu 'Tambah' (2)])
#img("assets/status-isi.png", caption: [Tampilan menu 'Status' saat slot parkir berisi])
#img("assets/pindah.png", caption: [Tampilan menu 'Pindah'])
#img("assets/keluar.png", caption: [Tampilan menu 'Keluar'])
#img("assets/exit.png", caption: [Tampilan 'Rekap Harian' saat program selesai dijalankan])

#img("assets/error-slot.png", caption: [Tampilan pesan error saat slot sudah diisi atau saat kapasitas roda penuh.])

#pagebreak()

= Kesimpulan

Penerapan Object-Oriented Programming (OOP) pada sistem manajemen parkir terbukti mempermudah pengelolaan data yang persisten. Polimorfisme secara khusus menekan kompleksitas logika bisnis dengan mendelegasikan perhitungan biaya langsung ke setiap objek kendaraan. Selain itu, pemisahan fungsi validasi aturan indeks kendaraan ke dalam satu metode tersendiri mencegah duplikasi kode saat proses penambahan maupun perpindahan kendaraan. Secara keseluruhan, struktur kode menjadi modular, jelas, dan siap dikembangkan lebih lanjut apabila terdapat penambahan jenis kendaraan baru.

#pagebreak()
