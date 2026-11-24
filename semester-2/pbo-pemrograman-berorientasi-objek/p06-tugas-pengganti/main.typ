#import "@atalariq/lab-report:1.0.0": *

#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "BB",
  course: "Pemrograman Berorientasi Objek",
  course-code: "PBO",
  // lecturer: "",
  meeting: "5",
  title: "Studi Kasus - Sistem Manajemen Kendaraan Rental",

  association: (
    program: "D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK",
    department: "DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA",
    faculty: "SEKOLAH VOKASI",
    university: "UNIVERSITAS GADJAH MADA",
    city: "YOGYAKARTA",
    // logo: image("assets/logo.png", width: 6cm),
  ),
  year: 2026,

  use-cover: false,
  // bib: bibliography("references.bib"),
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
)

#set par(justify: true, leading: 0.75em)
#set par(justify: true)
// #set par(first-line-indent: (amount: 0.5in, all: true))

// #set heading(numbering: "A.1.")

#let img(path, ..args) = image-wrapper(read(path), ..args)

= Konsep Class dan Object

== Identifikasi Class Utama dan Perannya

Class utama yang diperlukan dalam sistem ini adalah:

- *Kendaraan*: berfungsi sebagai abstract class yang menjadi induk dari semua jenis kendaraan. Berisi atribut dan method umum yang dimiliki oleh semua kendaraan agar tidak ada duplikasi kode.
- *Mobil*: subclass dari `Kendaraan` yang merepresentasikan kendaraan jenis mobil. Memiliki karakteristik tambahan berupa jumlah pintu.
- *Motor*: subclass dari `Kendaraan` yang merepresentasikan kendaraan jenis motor. Memiliki karakteristik tambahan berupa tipe transmisi.
- *Bus*: subclass dari `Kendaraan` yang merepresentasikan kendaraan jenis bus. Memiliki karakteristik tambahan berupa kapasitas penumpang.
- *Sewa*: berfungsi sebagai interface yang mendefinisikan kontrak perilaku yang wajib dimiliki oleh setiap kendaraan dalam konteks transaksi sewa.

== Atribut Setiap Class

*Abstract class Kendaraan:*
- `nomorKendaraan`: identitas unik setiap kendaraan
- `merk`: nama merek atau pabrikan kendaraan
- `tahunProduksi`: tahun kendaraan diproduksi
- `status`: status ketersediaan kendaraan, bernilai "tersedia" atau "disewa"

*Subclass Mobil (extend Kendaraan):*
- `jumlahPintu`: jumlah pintu yang dimiliki mobil

*Subclass Motor (extend Kendaraan):*
- `tipeTransmisi`: jenis transmisi motor, misalnya "manual" atau "otomatis"

*Subclass Bus (extend Kendaraan):*
- `kapasitasPenumpang`: jumlah maksimum penumpang yang dapat ditampung

== Method Setiap Class

*Abstract class Kendaraan:*
- `ubahStatus(newStatus)`: mengubah status kendaraan ketika disewa atau dikembalikan
- `tampilInfo()`: menampilkan informasi lengkap kendaraan
- `hitungBiaya()`: menghitung dan mengembalikan nilai biaya sewa

*Subclass Mobil, Motor, Bus (masing-masing mengimplementasikan):*
- `tampilInfo()`: implementasi spesifik yang menyertakan atribut unik masing-masing kendaraan
- `hitungBiaya()`: implementasi spesifik berdasarkan tarif sewa jenis kendaraan tersebut

*Interface Sewa:*
- `hitungBiaya()`: menghitung biaya sewa
- `tampilDetail()`: menampilkan detail kendaraan

== Perbedaan Class dan Object

Class adalah cetak biru atau template yang mendefinisikan struktur (atribut) dan perilaku (method) dari suatu entitas. Class belum merepresentasikan sesuatu yang konkret dan tidak memiliki nilai aktual pada atributnya. Sementara itu, object adalah instansiasi nyata dari sebuah class: ia sudah memiliki nilai spesifik pada setiap atributnya dan dapat menjalankan method yang didefinisikan oleh class-nya.

Dalam konteks sistem rental ini, `Mobil` adalah class yang mendefinisikan "seperti apa itu Mobil." Sedangkan sebuah Toyota Avanza berwarna merah dengan nomor B-1234-AB adalah object konkret yang dibuat dari class `Mobil` tersebut.

== Tiga Contoh Object

+ *Object dari class Mobil:*
  - `nomorKendaraan` = "B-1234-AB"
  - `merk` = "Toyota Avanza"
  - `tahunProduksi` = 2021
  - `status` = "tersedia"
  - `jumlahPintu` = 4

+ *Object dari class Motor:*
  - `nomorKendaraan` = "D-5678-CD"
  - `merk` = "Honda Beat"
  - `tahunProduksi` = 2022
  - `status` = "disewa"
  - `tipeTransmisi` = "otomatis"

+ *Object dari class Bus:*
  - `nomorKendaraan` = "E-9012-EF"
  - `merk` = "Mercedes Benz"
  - `tahunProduksi` = 2019
  - `status` = "tersedia"
  - `kapasitasPenumpang` = 45

= Konsep Encapsulation

== Alasan Atribut Dibuat Private

Atribut pada class `Kendaraan` sebaiknya dibuat `private` karena akses langsung dari luar class membuka celah perubahan data yang tidak terkontrol. Misalnya, jika atribut `status` bersifat publik, kode dari bagian manapun dalam program bisa mengubah status kendaraan menjadi "tersedia" tanpa melalui proses pengembalian yang seharusnya. Dengan menjadikannya `private`, semua perubahan data harus melewati method yang sudah memiliki logika validasi, sehingga integritas data terjaga.

== Contoh Getter dan Setter

*Getter: mengambil nilai atribut:*
- `getStatus()`: mengembalikan nilai atribut `status`, sehingga pihak luar dapat mengetahui apakah kendaraan sedang tersedia atau disewa tanpa bisa mengubahnya secara langsung.
- `getMerk()`: mengembalikan nama merk kendaraan.
- `getNomorKendaraan()`: mengembalikan nomor identitas kendaraan.

*Setter: mengubah nilai atribut dengan validasi:*
- `setStatus(String statusBaru)`: mengubah nilai `status`. Di dalam method ini dapat ditambahkan validasi, misalnya memastikan nilai yang dimasukkan hanya boleh "tersedia" atau "disewa", bukan nilai sembarangan.
- `setTahunProduksi(int tahun)`: mengubah tahun produksi dengan validasi bahwa nilai tidak boleh lebih besar dari tahun saat ini.

== Manfaat Encapsulation dalam Sistem Ini

- *Melindungi integritas data.* Validasi dapat dipusatkan di dalam setter, sehingga tidak mungkin ada data tidak valid yang masuk ke dalam atribut. Misalnya, status kendaraan tidak bisa diubah ke nilai selain yang sudah ditentukan.
- *Memudahkan pemeliharaan kode.* Jika suatu saat representasi internal data berubah (misalnya `status` yang semula bertipe String berubah menjadi enum), perubahan cukup dilakukan di dalam class itu sendiri tanpa harus mengubah semua bagian program yang menggunakan data tersebut.
- *Menyembunyikan kompleksitas internal.* Pengguna class tidak perlu mengetahui bagaimana data disimpan atau diolah di dalam. Mereka cukup menggunakan method getter dan setter yang sudah tersedia, sehingga interaksi dengan class menjadi lebih sederhana dan konsisten.

= Konsep Abstract Class

== Alasan Kendaraan Dibuat sebagai Abstract Class

Ada dua alasan utama mengapa `Kendaraan` sebaiknya dibuat sebagai abstract class:

- *Alasan domain bisnis.* Tidak masuk akal secara logika bisnis untuk membuat objek langsung dari class `Kendaraan`. Pelanggan tidak bisa menyewa "kendaraan" tanpa tahu jenisnya: apakah mobil, motor, atau bus. Setiap kendaraan yang nyata di dunia pasti merupakan salah satu dari jenis tersebut. Abstract class mencegah pembuatan objek yang tidak memiliki representasi nyata ini.
- *Alasan teknis.* `Kendaraan` menjadi wadah bersama bagi atribut dan method yang dimiliki oleh semua jenis kendaraan, sehingga kode tidak perlu ditulis ulang di setiap subclass. Ini memenuhi prinsip _Don't Repeat Yourself (DRY)_ dalam pengembangan perangkat lunak.

== Atribut Abstract Class Kendaraan

- `nomorKendaraan` (String)
- `merk` (String)
- `tahunProduksi` (int)
- `status` (String)

== Method Abstract Class Kendaraan

*Method yang memiliki implementasi (concrete method):*
- `ubahStatus(String status)`: logika mengubah status berlaku sama untuk semua jenis kendaraan, sehingga cukup diimplementasikan sekali di dalam abstract class.

*Method yang tidak memiliki implementasi (abstract method):*
- `tampilInfo()`: dideklarasikan abstract karena setiap jenis kendaraan menampilkan informasi yang berbeda. Mobil menyertakan jumlah pintu, Motor menyertakan tipe transmisi, dan Bus menyertakan kapasitas penumpang.
- `hitungBiaya()`: dideklarasikan abstract karena tarif sewa setiap jenis kendaraan berbeda. Tarif Bus kemungkinan mempertimbangkan kapasitas penumpang, sedangkan Motor memiliki tarif dasar yang lebih rendah dari Mobil.

== Cara Subclass Mewarisi Abstract Class Kendaraan

- *Mobil* menggunakan keyword `extends Kendaraan` dalam deklarasi class-nya. Dengan ini, Mobil secara otomatis mewarisi semua atribut dan method concrete dari `Kendaraan`. Mobil kemudian wajib mengimplementasikan `tampilInfo()` dengan menyertakan `jumlahPintu` dalam tampilan, dan `hitungBiaya()` dengan tarif yang sesuai untuk jenis mobil.
- *Motor* juga menggunakan `extends Kendaraan` dan mewarisi struktur yang sama. Motor mengimplementasikan `tampilInfo()` dengan menyertakan `tipeTransmisi`, dan `hitungBiaya()` dengan tarif khusus motor.
- *Bus* menggunakan `extends Kendaraan` dan mewarisi atribut serta method concrete yang sama. Bus mengimplementasikan `tampilInfo()` dengan menyertakan `kapasitasPenumpang`, dan `hitungBiaya()` yang mungkin memperhitungkan faktor kapasitas dalam kalkulasi tarifnya.

Jika salah satu dari ketiga subclass ini tidak mengimplementasikan semua abstract method yang diwajibkan, compiler akan menolak dan class tersebut harus ikut dideklarasikan sebagai abstract.

= Konsep Interface

== Fungsi Interface dalam Sistem Ini

Interface `Sewa` berfungsi sebagai kontrak formal yang menjamin bahwa setiap class yang mengimplementasikannya pasti memiliki kemampuan tertentu: dalam hal ini kemampuan untuk menghitung biaya sewa dan menampilkan detail kendaraan. Ini berguna ketika bagian lain dari sistem, misalnya modul billing atau laporan, perlu memanggil `hitungBiaya()` tanpa harus peduli apakah objek yang dihadapinya adalah Mobil, Motor, atau Bus. Selama objek tersebut mengimplementasikan interface `Sewa`, panggilannya dijamin aman.

== Method yang Harus Ada dalam Interface Sewa

- `hitungBiaya()`: menghitung total biaya sewa dan mengembalikan nilainya dalam tipe data `double`.
- `tampilDetail()`: menampilkan informasi lengkap dan detail kendaraan kepada pengguna.

== Cara Subclass Mengimplementasikan Interface Sewa

- *Mobil* menggunakan deklarasi `class Mobil extends Kendaraan implements Sewa`. Dengan ini, Mobil wajib menyediakan implementasi konkret untuk `hitungBiaya()` (dengan tarif per hari untuk mobil) dan `tampilDetail()` (yang menampilkan seluruh atribut termasuk `jumlahPintu`).
- *Motor* menggunakan deklarasi `class Motor extends Kendaraan implements Sewa`. Motor mengimplementasikan `hitungBiaya()` dengan tarif yang sesuai untuk motor, dan `tampilDetail()` yang menyertakan `tipeTransmisi`.
- *Bus* menggunakan deklarasi `class Bus extends Kendaraan implements Sewa`. Bus mengimplementasikan `hitungBiaya()` dengan perhitungan yang mungkin mempertimbangkan kapasitas penumpang, dan `tampilDetail()` yang menyertakan `kapasitasPenumpang`.

== Akibat Jika Method Interface Tidak Diimplementasikan

Jika sebuah class mengimplementasikan interface tetapi tidak menuliskan semua method yang diwajibkan, compiler akan mengeluarkan _compile-time error_ dan program tidak dapat dikompilasi sama sekali. Interface adalah kontrak yang bersifat mengikat secara paksa: tidak ada toleransi untuk method yang hilang. Satu-satunya pengecualian adalah jika class tersebut dideklarasikan sebagai abstract, dalam hal ini kewajiban implementasi diteruskan ke subclass berikutnya.

= Analisis Desain Sistem

== Hubungan antara Abstract Class, Interface, dan Class Turunan

Ketiga elemen ini membentuk lapisan hierarki yang saling melengkapi dalam sistem ini:

- *Abstract class Kendaraan* adalah fondasi hierarki. Ia menyediakan struktur bersama berupa atribut yang relevan untuk semua kendaraan, method concrete yang implementasinya sama untuk semua jenis (seperti `ubahStatus()`), serta mendefinisikan kontrak internal berupa abstract method yang wajib diimplementasikan oleh setiap subclass.
- *Interface Sewa* adalah lapisan kontrak perilaku yang bersifat eksternal dan terpisah dari hierarki class. Ia tidak peduli tentang atribut atau implementasi internal: ia hanya memastikan bahwa setiap class yang menggunakannya memiliki kemampuan tertentu yang konsisten dan dapat dipanggil secara seragam dari luar.
- *Class turunan (Mobil, Motor, Bus)* adalah titik pertemuan keduanya. Mereka mewarisi struktur dan perilaku bersama dari abstract class, sekaligus memenuhi kontrak perilaku dari interface. Di atas semua itu, mereka menambahkan atribut dan logika yang unik sesuai karakteristik masing-masing jenis kendaraan.

Hubungan ini bisa dirangkum sebagai: abstract class mendefinisikan *apa yang dimiliki* dan *apa yang harus dilakukan secara internal*, sedangkan interface mendefinisikan *apa yang harus bisa dilakukan secara eksternal*. Class turunan menjawab keduanya sekaligus.

== UML Class Diagram

#image("uml.png")

// ```d2
// Kendaraan: {
//   shape: class
//   "<<abstract>>": ""
//   "-nomorKendaraan": ""
//   "-merk": ""
//   "-tahunProduksi": ""
//   "-status": ""
//   "+ubahStatus()": ""
//   "+tampilInfo()": ""
//   "+hitungBiaya()": ""
// }
//
// Sewa: {
//   shape: class
//   "<<interface>>": ""
//   "+hitungBiaya()": ""
//   "+tampilDetail()": ""
// }
//
// Mobil: {
//   shape: class
//   "-jumlahPintu": ""
//   "+tampilInfo()": ""
//   "+hitungBiaya()": ""
//   "+tampilDetail()": ""
// }
//
// Motor: {
//   shape: class
//   "-tipeTransmisi": ""
//   "+tampilInfo()": ""
//   "+hitungBiaya()": ""
//   "+tampilDetail()": ""
// }
//
// Bus: {
//   shape: class
//   "-kapasitasPenumpang": ""
//   "+tampilInfo()": ""
//   "+hitungBiaya()": ""
//   "+tampilDetail()": ""
// }
//
// Mobil -> Kendaraan: extends {
//   target-arrowhead: {
//     shape: triangle
//     style.filled: false
//   }
// }
//
// Motor -> Kendaraan: extends {
//   target-arrowhead: {
//     shape: triangle
//     style.filled: false
//   }
// }
//
// Bus -> Kendaraan: extends {
//   target-arrowhead: {
//     shape: triangle
//     style.filled: false
//   }
// }
//
// Mobil -> Sewa: implements {
//   style.stroke-dash: 5
//   target-arrowhead: {
//     shape: triangle
//     style.filled: false
//   }
// }
//
// Motor -> Sewa: implements {
//   style.stroke-dash: 5
//   target-arrowhead: {
//     shape: triangle
//     style.filled: false
//   }
// }
//
// Bus -> Sewa: implements {
//   style.stroke-dash: 5
//   target-arrowhead: {
//     shape: triangle
//     style.filled: false
//   }
// }
// ```

// ```mermaid
// classDiagram
//     class Kendaraan {
//         <<abstract>>
//         -nomorKendaraan
//         -merk
//         -tahunProduksi
//         -status
//         +ubahStatus()
//         +tampilInfo()*
//         +hitungBiaya()*
//     }
//     class Sewa {
//         <<interface>>
//         +hitungBiaya()
//         +tampilDetail()
//     }
//     class Mobil {
//         -jumlahPintu
//         +tampilInfo()
//         +hitungBiaya()
//         +tampilDetail()
//     }
//     class Motor {
//         -tipeTransmisi
//         +tampilInfo()
//         +hitungBiaya()
//         +tampilDetail()
//     }
//     class Bus {
//         -kapasitasPenumpang
//         +tampilInfo()
//         +hitungBiaya()
//         +tampilDetail()
//     }
//     Kendaraan <|-- Mobil : extends
//     Kendaraan <|-- Motor : extends
//     Kendaraan <|-- Bus : extends
//     Sewa <|.. Mobil : implements
//     Sewa <|.. Motor : implements
//     Sewa <|.. Bus : implements
// ```

== Keuntungan Abstract Class dan Interface dibanding Class Biasa

*Keuntungan abstract class:*
- Mencegah pembuatan objek dari class yang tidak seharusnya di-instantiate secara langsung, menjaga konsistensi logika domain bisnis.
- Memaksa setiap subclass untuk mengimplementasikan method tertentu. Tanpa abstract class, subclass bisa mewarisi method dari parent tanpa meng-override-nya, sehingga tidak ada jaminan perilaku yang benar untuk setiap jenis kendaraan.
- Menghindari duplikasi kode. Atribut dan method yang sama cukup ditulis sekali di abstract class dan diwarisi oleh semua subclass.
- Memudahkan pengembangan di masa depan. Jika ada jenis kendaraan baru seperti Truk, cukup buat class baru yang `extends Kendaraan` dan implementasikan abstract method-nya: tanpa perlu mengubah kode yang sudah ada.

*Keuntungan interface:*
- Mendefinisikan kemampuan yang harus dimiliki tanpa terikat pada hierarki class. Sebuah class di luar hierarki `Kendaraan` pun bisa mengimplementasikan interface `Sewa` jika diperlukan.
- Memungkinkan satu class mengimplementasikan lebih dari satu kontrak sekaligus (multiple interface implementation), sesuatu yang tidak mungkin dilakukan dengan inheritance class biasa di Java.
- Membuat kode lebih fleksibel dan mudah diuji. Modul billing atau modul laporan hanya perlu bergantung pada interface `Sewa`, bukan pada implementasi spesifiknya. Ini berarti implementasi bisa diganti tanpa mengubah kode yang memanggilnya.
- Memperjelas batas antara "apa yang sebuah objek bisa lakukan" dengan "bagaimana ia melakukannya", sehingga kode lebih mudah dibaca dan dipahami oleh developer lain.
