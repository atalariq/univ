#import "@atalariq/lab-report:1.0.0": *

#show: report.with(
  use-cover: false,
  title: [
    Quiz PBO Pra UTS \
    Studi Kasus Sistem MBG
  ]
)

#set par(justify: true)
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

= Identifikasi Class dan Object

+ Class yang diperlukan dalam sistem MBG tersebut antara lain:
  + `Siswa`
  + `MenuMakanan`
  + `DistribusiMakanan`

+ Peran masing-masing class dalam sistem antara lain:
  - `Siswa`: berperan merepresentasikan setiap murid yang terdaftar dalam program MBG,
    menyimpan identitas seperti NIS, nama, dan kelas.
  - `MenuMakanan`: berperan merepresentasikan pilihan makanan yang tersedia,
    menyimpan informasi gizi seperti nama menu, jumlah kalori, dan jenis makanan.
  - `DistribusiMakanan`: berperan mencatat dan mengelola proses pembagian makanan
    kepada siswa setiap harinya, menghubungkan antara siswa dengan menu yang diterimanya.

+ Satu contoh object dari masing-masing class:
  - Object `Siswa(1234, "Barra", "12-3")`\
    seorang siswa dengan NIS `"12345"`, nama `"Barra"`, kelas `"12-3"`.
  - Object `MenuMakanan("Nasi Ayam Goreng", 650, "Makanan Utama")`\
    sebuah menu bernama `"Nasi Ayam Goreng"` dengan `650` kalori, jenis makanan `"Makanan Utama"`.
  - Object `DistribusiMakanan("31-03-2026", siswa, menuMakanan)`\
    sebuah catatan distribusi pada tanggal `"31-03-2026"`, untuk siswa Barra, dengan menu Nasi Ayam Goreng.

= Atribut dan Method

== Siswa
+ Atribut:
  - `nis`: menyimpan Nomor Induk Siswa sebagai identitas unik.
  - `nama`: menyimpan nama lengkap siswa.
  - `kelas`: menyimpan informasi kelas siswa.
+ Method:
  - `tampilkanInfo()`: menampilkan informasi lengkap siswa (NIS, nama, dan kelas).
  - `getTotalKaloriHarian()`: menghitung dan mengembalikan total kalori yang diterima
    siswa pada hari tertentu berdasarkan riwayat distribusi.
+ Hubungan atribut dan method: method `tampilkanInfo()` mengakses atribut `nis`, `nama`,
  dan `kelas` untuk ditampilkan. Method `getTotalKaloriHarian()` bergantung pada data
  distribusi yang terhubung dengan siswa untuk menjumlahkan kalori yang diterima.

== MenuMakanan
+ Atribut:
  - `namaMenu`: menyimpan nama menu makanan.
  - `jumlahKalori`: menyimpan nilai kalori dari menu tersebut.
  - `jenisMakanan`: menyimpan kategori makanan (contoh: makanan utama, snack, minuman).
+ Method:
  - `tampilkanInformasi()`: menampilkan detail menu meliputi nama, jenis, dan jumlah kalori.
  - `hitungTotalKalori()`: mengembalikan nilai total kalori dari menu, dapat di-override
    oleh subclass untuk perhitungan yang lebih spesifik.
+ Hubungan atribut dan method: `tampilkanInformasi()` membaca ketiga atribut untuk
  ditampilkan ke pengguna, sedangkan `hitungTotalKalori()` secara langsung membaca
  nilai `jumlahKalori` dan mengembalikannya.

== DistribusiMakanan
+ Atribut:
  - `tanggalDistribusi`: menyimpan tanggal kapan distribusi makanan dilakukan.
  - `siswa`: menyimpan referensi ke object `Siswa` yang menerima makanan.
  - `menu`: menyimpan referensi ke object `MenuMakanan` yang didistribusikan.
+ Method:
  - `catatDistribusiMakanan()`: menyimpan data distribusi berdasarkan siswa, menu,
    dan tanggal yang diberikan.
  - `tampilkanRiwayat()`: menampilkan riwayat distribusi makanan untuk siswa tertentu.
+ Hubungan atribut dan method: `catatDistribusiMakanan()` menggunakan atribut `siswa`,
  `menu`, dan `tanggalDistribusi` sebagai data yang dicatat. `tampilkanRiwayat()`
  membaca atribut-atribut tersebut untuk ditampilkan dalam bentuk laporan.

= Encapsulation

+ Yang dimaksud dengan encapsulation dalam OOP adalah mekanisme pembungkusan atribut
  dan method ke dalam satu unit class, sekaligus *membatasi akses langsung* ke atribut
  dari luar class. Atribut biasanya dibuat `private` sehingga hanya bisa diakses atau
  dimodifikasi melalui method yang sudah ditentukan (`getter` dan `setter`).

+ Alasan mengapa atribut pada sistem MBG sebaiknya dibuat private adalah untuk mencegah
  data diubah sembarangan dari luar class tanpa validasi. Misalnya, atribut `nis` pada
  class `Siswa` tidak boleh diubah begitu saja dari luar karena NIS bersifat unik dan
  tetap. Begitu pula `jumlahKalori` pada `MenuMakanan` tidak seharusnya bisa diubah
  langsung karena bisa merusak integritas data gizi yang dicatat sistem.

+ Contoh penggunaan getter dan setter dalam class `Siswa`:
  / `getNIS()`: mengembalikan nilai atribut `nis` tanpa mengizinkan perubahan
  / `getNama()`: mengembalikan nilai atribut `nama` tanpa mengizinkan perubahan
    langsung.
  / `setKelas(String kelasBaru)`: mengubah nilai atribut `kelas` setelah memvalidasi
    bahwa nilai yang diberikan tidak kosong.

= Abstract Class

+ Alasan mengapa `MenuMakanan` cocok dijadikan abstract class adalah karena dalam
  dunia nyata, tidak ada yang namanya menu makanan *generik* yang *berdiri sendiri*.
  Yang ada adalah jenis menu yang spesifik seperti menu sehat atau menu diet.

  Karena `MenuMakanan` hanya mendefinisikan struktur dan kontrak umum yang harus dimiliki
  semua jenis menu, ia tidak perlu dan tidak seharusnya diinstansiasi secara langsung.
  Selain itu, method `hitungTotalKalori()` bisa berbeda cara kerjanya tergantung jenis
  menu, sehingga cocok dijadikan abstract method yang implementasinya diserahkan ke
  subclass.

+ Atribut dan method yang sebaiknya ada pada abstract class tersebut antara lain:
  - Atribut `namaMenu`
  - Atribut `jumlahKalori`
  - Atribut `jenisMakanan`
  - Method `tampilkanInformasi()`
  - Method abstract `hitungTotalKalori()`

+ Contoh class turunannya beserta perannya:
  - `MenuSehat`: merepresentasikan menu dengan kandungan gizi seimbang untuk siswa
    normal. Mengimplementasikan `hitungTotalKalori()` berdasarkan standar kebutuhan
    kalori harian siswa sekolah.
  - `MenuDiet`: merepresentasikan menu dengan kalori lebih rendah, ditujukan untuk
    siswa dengan kondisi atau kebutuhan khusus. `hitungTotalKalori()` mengembalikan
    nilai yang lebih rendah dengan penyesuaian tertentu.
  - `MenuVegetarian`: merepresentasikan menu berbasis nabati tanpa kandungan hewani.
    `hitungTotalKalori()` diperhitungkan khusus berdasarkan komposisi bahan nabati.

#pagebreak()


= Interface

#show raw.where(block: true): set text(size: 9pt)

+ Interface dalam OOP adalah kontrak yang mendefinisikan method apa saja yang wajib
  diimplementasikan oleh class yang menggunakannya, tanpa menentukan bagaimana method
  tersebut bekerja secara internal. Interface memisahkan "apa yang harus bisa dilakukan"(_*What*_)
  dan "bagaimana cara melakukannya" (_*How*_).

+ Contoh interface `Distribusi`:
```java
  interface Distribusi {
      void catatDistribusi(Siswa siswa, MenuMakanan menu, String tanggal);
      void tampilkanRiwayat(Siswa siswa);
  }
```

+ Method yang harus ada dalam interface tersebut antara lain:
  - `catatDistribusi(Siswa siswa, MenuMakanan menu, String tanggal)`: method untuk mencatat pembagian makanan kepada siswa pada tanggal tertentu.
  - `tampilkanRiwayat(Siswa siswa)`: method untuk menampilkan riwayat distribusi makanan yang pernah diterima oleh siswa tertentu.

+ Cara class `DistribusiMakanan` mengimplementasikan interface tersebut adalah dengan mendeklarasikan `implements Distribusi` pada definisi classnya, lalu menyediakan implementasi konkret untuk setiap method yang ada di interface.

  Misalnya, `catatDistribusi()` diimplementasikan dengan menyimpan data ke dalam list riwayat distribusi, dan `tampilkanRiwayat()` diimplementasikan dengan menelusuri list tersebut dan mencetak datanya.

= Relasi Antar Class

#set par(first-line-indent: (all: true, amount: 0.5in))

Hubungan antara class `Siswa` dan `MenuMakanan` adalah *association*. Siswa menerima
satu menu makanan setiap hari, sehingga keduanya saling berkaitan. Jenis relasinya
*association* sebab kedua class bisa berdiri sendiri secara independen; `MenuMakanan`
tetap ada meski tidak ada siswa yang sedang menerimanya, dan `Siswa` tetap terdaftar
meski belum menerima MBG.

Hubungan antara class `Siswa` dan `DistribusiMakanan` adalah *aggregation*.
`DistribusiMakanan` membutuhkan referensi ke object `Siswa` untuk mencatat siapa
yang menerima makanan. Jenis relasinya *aggregation* sebab `DistribusiMakanan`
bergantung pada `Siswa`, tapi `Siswa` tetap eksis secara independen meskipun tidak
ada data distribusi yang terkait.


= Analisis dan Pengembangan

+ Keuntungan menggunakan OOP dalam sistem MBG dibandingkan pendekatan prosedural antara lain:
  - *Modularitas*: setiap class bertanggung jawab atas datanya sendiri. Perubahan
    pada `MenuMakanan` tidak perlu menyentuh logika di `Siswa` atau `DistribusiMakanan`.
  - *Reusabilitas*: class seperti `MenuMakanan` dan subclass-nya bisa digunakan ulang
    di berbagai bagian sistem tanpa menulis ulang logika yang sama.
  - *Keterbacaan dan maintainability*: kode lebih mudah dipahami karena struktur
    mencerminkan entitas nyata, dan lebih mudah dikembangkan tanpa risiko merusak
    bagian lain.

+ Yang akan terjadi apabila semua atribut dibuat public adalah data bisa diubah
  langsung dari mana saja tanpa validasi. Misalnya, `jumlahKalori` pada `MenuMakanan`
  bisa diubah menjadi nilai negatif atau nol tanpa ada yang mencegahnya, sehingga
  perhitungan total kalori siswa akan salah. Ini melanggar prinsip *encapsulation* dan
  membuat sistem rentan terhadap bug yang sulit dilacak.

+ Jika sistem dikembangkan lebih lanjut (misalnya ada fitur laporan gizi bulanan),
  class yang perlu ditambahkan antara lain:
  + `LaporanGizi`: menggabungkan data dari `DistribusiMakanan` untuk menghitung total
    dan rata-rata kalori yang diterima setiap siswa dalam satu bulan, serta bisa
    menghasilkan ringkasan per kelas.
