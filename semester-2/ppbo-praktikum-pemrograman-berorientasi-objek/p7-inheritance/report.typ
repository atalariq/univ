#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Berorientasi Objek",
  course-code: "PPBO",
  lecturer: "Imam Fahrurrozi, S.T., M.Cs.",
  meeting: "7",
  title: "Inheritance",
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
  font-size: 12pt,
)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), header: path, ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), width: 100%, ..args)

#daftar-isi()
// #daftar-gambar()

= Tujuan Praktikum

+ Merancang hierarki kelas menggunakan *inheritance* untuk merepresentasikan jenis-jenis karyawan yang memiliki perilaku berbeda dalam satu sistem yang terpadu.
+ Menerapkan *abstract class* dan *abstract method* untuk memisahkan kontrak perilaku dari implementasinya pada subclass yang konkret.
+ Mengimplementasikan *method overriding* pada perhitungan THR sehingga setiap jenis karyawan menghasilkan nilai yang sesuai ketentuan masing-masing.
+ Menerapkan *method overloading* pada pengelolaan cuti karyawan untuk mendukung dua cara penambahan cuti yang berbeda dalam satu nama method.
+ Menggunakan tipe `enum` untuk merepresentasikan kategori diskrit dan memanfaatkan *static field* untuk membangkitkan NIK secara otomatis per jenis karyawan.

= Dasar Teori

Pemrograman Berorientasi Objek (OOP) adalah paradigma pemrograman yang mengorganisasi perangkat lunak di sekitar objek, yakni entitas yang menggabungkan data (*state*) dan perilaku (*behavior*) dalam satu unit. Java sebagai bahasa OOP murni mengimplementasikan paradigma ini melalui mekanisme kelas dan objek @oracle-oop. Pada sistem penggajian ini, paradigma OOP dimanifestasikan melalui beberapa konsep inti yang saling berkaitan.

/ *Inheritance* (Pewarisan): mekanisme di mana sebuah kelas (*subclass*) mewarisi atribut dan method dari kelas lain (*superclass*), sehingga memungkinkan penggunaan ulang kode dan pembentukan hierarki. Dalam sistem ini, kelas `RegularEmployee`, `Manager`, dan `Salesman` masing-masing mewarisi atribut bersama seperti `name`, `salary`, dan `leaveBalance` dari kelas induk `Employee`, tanpa perlu mendefinisikan ulang di setiap subclass @deitel2018.

/ *Abstract Class dan Abstract Method*: kelas abstrak adalah kelas yang tidak dapat diinstansiasi secara langsung dan dirancang khusus untuk menjadi superclass. Sebuah abstract method dideklarasikan tanpa implementasi, sehingga setiap subclass konkret diwajibkan untuk menyediakan implementasinya sendiri @oracle-abstract. Penggunaan `abstract` pada kelas `Employee` dan method `getTHR()` mencerminkan fakta bahwa konsep "karyawan secara umum" tidak memiliki aturan THR yang dapat didefinisikan tanpa mengetahui jenis karyawannya terlebih dahulu.

/ *Polymorphism dan Method Overriding*: polimorfisme adalah kemampuan sebuah referensi bertipe superclass untuk merujuk ke objek dari subclass yang berbeda-beda, dan memanggil method yang sesuai dengan tipe objek aktualnya pada saat runtime. Ini dimungkinkan oleh *dynamic dispatch*, yakni mekanisme Java untuk menentukan implementasi method mana yang akan dieksekusi berdasarkan tipe konkret objek, bukan tipe referensinya @deitel2018[Chapter~10]. Dalam sistem ini, sebuah array `Employee[]` dapat menampung objek dari ketiga jenis karyawan sekaligus, dan pemanggilan `getTHR()` pada setiap elemen akan secara otomatis memanggil implementasi yang benar.

/ *Method Overloading*: fitur yang memungkinkan beberapa method dalam satu kelas memiliki nama yang sama selama parameter-parameternya berbeda, baik dari segi jumlah, tipe, maupun urutannya @oracle-method. Ini merupakan bentuk *compile-time polymorphism* karena method yang dipanggil ditentukan oleh compiler berdasarkan argumen yang diberikan. Pada kelas `Employee`, method `addLeave` dioverload dua kali: versi pertama menerima `int` untuk penambahan hari langsung, dan versi kedua menerima `LeaveType` untuk penambahan berdasarkan kategori cuti yang aturannya bergantung pula pada jenis kelamin karyawan.

/ *Enum Types*: tipe enumerasi adalah tipe data khusus yang mendefinisikan sekumpulan konstanta bernama yang nilainya terbatas dan telah ditentukan sejak kompilasi @oracle-enum. Penggunaan `enum` untuk `Gender`, `LeaveType`, dan `OfficeType` memberikan keamanan tipe (*type safety*) yang lebih kuat dibandingkan penggunaan `String` atau konstanta integer, sekaligus membuat kode lebih mudah dibaca dan terhindar dari kesalahan akibat nilai yang tidak valid.

/ *Static Field*: field yang dideklarasikan dengan kata kunci `static` dimiliki oleh kelas itu sendiri, bukan oleh instance tertentu, sehingga nilainya dibagi bersama oleh seluruh objek dari kelas tersebut @oracle-static. Pada setiap subclass karyawan, field `counter` yang bersifat statis digunakan sebagai pencacah untuk membangkitkan NIK secara otomatis dan berurutan khusus per jenis karyawan.

#pagebreak()

= Hasil dan Pembahasan

Studi kasus ini meminta pengembangan sistem penggajian karyawan berbasis Java yang mengelola tiga jenis karyawan: Karyawan Biasa, Manager, dan Salesman. Setiap jenis memiliki aturan perhitungan THR yang berbeda, sistem NIK yang dibangkitkan otomatis dengan awalan sesuai jenisnya, dan mekanisme cuti yang dapat ditambahkan baik secara langsung maupun berdasarkan tipe. Desain sistem menggunakan kelas abstrak `Employee` sebagai kontrak bersama, tiga subclass konkret, tiga tipe `enum`, dan satu kelas `Main` untuk demonstrasi.

== Kode Sumber

#set par(first-line-indent: (amount: 0.5in, all: false))

Tiga tipe `enum` dideklarasikan sebagai file tersendiri untuk merepresentasikan kategori-kategori diskrit yang digunakan lintas kelas:

#include-code("./src/Gender.java")

#include-code("./src/LeaveType.java")

#include-code("./src/OfficeType.java")

Kelas abstrak `Employee` mendefinisikan kontrak dan perilaku bersama seluruh karyawan:

#include-code("./src/Employee.java")

Implementasi masing-masing jenis karyawan sebagai subclass konkret:

#include-code("./src/RegularEmployee.java")

#include-code("./src/Manager.java")

#include-code("./src/Salesman.java")

Kelas `Main` untuk demonstrasi seluruh fungsionalitas sistem:

#include-code("./src/Main.java")

#set par(first-line-indent: (amount: 0.5in, all: true))

== Penjelasan

Keputusan menjadikan `Employee` sebagai *abstract class* adalah inti dari desain sistem ini. Entitas "karyawan" secara umum tidak memiliki aturan THR yang dapat didefinisikan tanpa mengetahui jenisnya, sehingga `getTHR()` dideklarasikan sebagai abstract method. Konsekuensinya, compiler Java akan menolak kompilasi subclass mana pun yang tidak mengimplementasikan method tersebut, mirip seperti kontrak yang harus dipenuhi pada saat kompilasi, bukan saat runtime.

Mekanisme pembangkitan NIK memanfaatkan *static field* `counter` yang dideklarasikan secara terpisah di setiap subclass. Karena field `static` bersifat milik kelas bukan instance, nilai `counter` diinkrementasi satu kali setiap subclass diinstansiasi dan persisten sepanjang program berjalan. Dengan demikian, `RegularEmployee` ke-1 dan ke-2 mendapatkan NIK `K001` dan `K002`, sementara `Manager` pertama mendapatkan `M001` secara independen, tanpa ada ketergantungan antar kelas.

Overloading pada `addLeave` mendemonstrasikan *compile-time polymorphism*, compiler menentukan versi mana yang dipanggil berdasarkan tipe argumen pada saat kompilasi. Versi `addLeave(int days)` berlaku untuk penambahan hari arbitrer (sembarang integer), sedangkan versi `addLeave(LeaveType type)` mengenkapsulasi aturan bisnis cuti, termasuk perbedaan durasi cuti persalinan antara karyawan wanita (90 hari) dan pria (3 hari) berdasarkan field `gender` yang diwarisi dari superclass.

Polimorfisme runtime didemonstrasikan secara eksplisit di blok `main` melalui iterasi array `Employee[]`. Saat `e.getTHR()` dipanggil pada setiap elemen, Java tidak mengeksekusi method di kelas `Employee` (karena tidak ada), melainkan menelusuri tipe konkret objek aktualnya melalui mekanisme pemanggilan implementasi yang sesuai.

== Contoh Output Program

#img("assets/output.png", caption: [Hasil output program sistem penggajian karyawan])

#pagebreak()

= Kesimpulan

Penerapan *inheritance* pada sistem penggajian karyawan ini terbukti menekan duplikasi kode secara signifikan: atribut dan logika cuti yang dimiliki ketiga jenis karyawan cukup didefinisikan sekali di kelas `Employee` dan diwarisi seluruhnya oleh subclass. Penggunaan *abstract class* dengan `getTHR()` sebagai abstract method mendelegasikan tanggung jawab perhitungan ke masing-masing subclass sesuai aturan bisnisnya, sekaligus menjamin bahwa tidak ada jenis karyawan yang dapat dideklarasikan tanpa mengimplementasikan perhitungan THR-nya.

*Method overriding* memungkinkan kode di `Main` untuk memanggil `getTHR()` pada array `Employee[]` tanpa mengetahui tipe konkret objek, sementara Java menentukan implementasi yang tepat pada saat runtime melalui dynamic dispatch. *Method overloading* pada `addLeave` menunjukkan bahwa satu nama method dapat mendukung dua antarmuka berbeda, yakni penambahan langsung dan penambahan berbasis kategori; tanpa membebani pengguna kelas dengan nama method yang berbeda-beda.

Terakhir, penggunaan `enum` untuk `Gender`, `LeaveType`, dan `OfficeType` memberikan keamanan tipe yang tidak dapat dicapai oleh konstanta `String` biasa, karena nilai yang tidak valid ditolak langsung oleh compiler.
