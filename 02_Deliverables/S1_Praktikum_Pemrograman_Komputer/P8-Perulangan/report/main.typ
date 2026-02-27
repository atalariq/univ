#import "@preview/zebraw:0.5.5": *
#show: zebraw

#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2",

  mata-kuliah: "PRAKTIKUM PEMROGRAMAN KOMPUTER",
  kode-mata-kuliah: "PPK",
  nama-dosen-pengampu: "Firma Syahrian, S. Kom., M. Cs.",
  no-pertemuan: "9",

  judul-praktikum: "Perulangan",
)

#set page(
  paper: "a4",
  margin: 2.54cm,
)

#set document(
  title: vars.judul-praktikum,
  author: vars.nama
)

#set text(
  font: "Times New Roman",
  size: 12pt,
)

#set par(
  justify: true
)

// #1 Cover
#align(center)[
  #upper(
    text(size: 14pt, weight: "bold")[
      LAPORAN PRAKTIKUM \
      #vars.mata-kuliah  \
      PERTEMUAN #vars.no-pertemuan \
      #vars.judul-praktikum
    ]
  )

  #v(1fr)

  #image(
    "assets/logo-UGM.png",
    width: 6cm
  )

  #v(1fr)

  Disusun oleh:
  #table(
    columns: 3,
    align: left,
    stroke: none,
    [Nama], [:], [#vars.nama],
    [NIM], [:], [#vars.nim],
    [Kelas], [:], [#vars.kode-mata-kuliah\-#vars.kelas],
    [Dosen Pengampu], [:], [#vars.nama-dosen-pengampu]
  )

  #v(0.5fr)

  #upper(
    text(weight: "bold")[
      PROGRAM STUDI D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK \
      DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA \
      SEKOLAH VOKASI \
      UNIVERSITAS GADJAH MADA \
      YOGYAKARTA \
      2025
    ]
  )
]

#pagebreak()

// #2 Content

#set heading(numbering: "1. 1.")

= Dasar Teori

Perulangan, atau yang sering disebut sebagai iterasi, adalah sebuah konsep fundamental dalam pemrograman yang memungkinkan eksekusi blok kode secara berulang kali. Mekanisme kontrol alur ini dirancang untuk mengatasi tugas-tugas yang bersifat repetitif. Tanpa perulangan, seorang programmer harus menulis baris kode yang sama berulang kali untuk melakukan tugas yang monoton, yang tidak hanya tidak efisien tetapi juga sulit untuk dikelola dan rentan terhadap kesalahan.   

Pentingnya perulangan terletak pada kemampuannya untuk mengotomatisasi proses. Dalam dunia komputasi, banyak masalah yang solusinya melibatkan pemrosesan ribuan bahkan jutaan data, menjalankan simulasi hingga kondisi tertentu tercapai, atau sekadar menunggu masukan dari pengguna. Perulangan menjadi tulang punggung dari semua tugas ini. Dengan perulangan, komputer dapat menyelesaikan pekerjaan repetitif dengan kecepatan dan akurasi yang jauh melampaui kemampuan manusia, sehingga memungkinkan pengembangan algoritma dan aplikasi yang kompleks.   

== Fungsi `range()`

Sebelum mendalami struktur perulangan, penting untuk memahami fungsi `range()`. Fungsi bawaan Python ini merupakan alat bantu utama yang sering digunakan bersama perulangan, khususnya perulangan for. Secara teknis, `range()` tidak menghasilkan sebuah list secara langsung, melainkan sebuah objek sekuens yang bersifat immutable (tidak dapat diubah). Objek ini sangat efisien dalam penggunaan memori karena ia hanya menghasilkan angka-angka dalam sekuens tersebut saat dibutuhkan, bukan menyimpannya sekaligus dalam memori.   

Fungsi `range()` dapat digunakan dalam tiga mode utama:

+ `range(stop)`: Menghasilkan sekuens bilangan bulat yang dimulai dari 0 hingga stop - 1. Sebagai contoh, range(10) akan menghasilkan angka 0, 1, 2, 3, 4, 5, 6, 7, 8, dan 9.
+ `range(start, stop)`: Menghasilkan sekuens bilangan bulat yang dimulai dari start hingga stop - 1. Sebagai contoh, range(5, 10) akan menghasilkan angka 5, 6, 7, 8, dan 9.
+ `range(start, stop, step)`: Menghasilkan sekuens bilangan bulat yang dimulai dari start hingga stop - 1, dengan setiap angka berikutnya merupakan penambahan dari angka sebelumnya dengan nilai step. Sebagai contoh, range(1, 10, 2) akan menghasilkan bilangan ganjil 1, 3, 5, 7, dan 9.


== Iterasi pada Python

Python menyediakan dua mekanisme utama untuk melakukan perulangan: `for` dan `while`. Keduanya memiliki tujuan yang sama, yaitu mengeksekusi kode berulang kali, namun digunakan dalam skenario yang berbeda berdasarkan sifat iterasinya.

=== `for`

Perulangan for digunakan untuk melakukan iterasi yang bersifat definit, yaitu ketika jumlah perulangan sudah diketahui sebelum loop dimulai. Struktur ini bekerja dengan cara mengambil elemen satu per satu dari sebuah objek iterable (seperti list, tuple, string, atau objek range) hingga seluruh elemen habis diproses. Karena sifatnya yang terstruktur dan aman (dijamin berhenti), for sering dianggap sebagai pilihan yang lebih "Pythonic" untuk iterasi pada sekuens.   

Contoh penggunaan for untuk iterasi pada list:

#zebraw(
  numbering-separator: true,
  ```py
  nama_buah = ["apel", "pisang", "ceri"]
  for buah in nama_buah:
      print(buah)
  ```
)

Contoh penggunaan for dengan `range()`:

#zebraw(
  numbering-separator: true,
  ```py
  for i in range(3):
      print(f"Iterasi ke-{i}")
  ```
)

=== `while`

Perulangan while digunakan untuk iterasi yang bersifat indefinit. Dalam perulangan ini, blok kode akan terus dieksekusi selama kondisi boolean yang ditentukan bernilai True. Loop ini sangat ideal untuk situasi di mana jumlah iterasi tidak dapat ditentukan di awal, tetapi kriteria untuk berhenti (stopping criteria) sudah jelas.   

Kriteria berhenti adalah elemen paling kritis dalam perulangan while. Logika di dalam badan loop harus mengandung sebuah aksi yang pada akhirnya akan mengubah kondisi evaluasi menjadi False. Kegagalan dalam memastikan hal ini akan menyebabkan _infinite loop_, di mana program akan berjalan tanpa henti. Ini menempatkan tanggung jawab manajemen status loop sepenuhnya pada programmer, memberikan fleksibilitas yang lebih tinggi namun juga menuntut kehati-hatian yang lebih besar.

Contoh penggunaan while:

#zebraw(
  numbering-separator: true,
  ```py
  i = 1
  while i**2 <= 50:
      print(i**2)
      i += 1
    ```
)

Pada contoh di atas, `i += 1` adalah aksi krusial yang memastikan loop pada akhirnya akan berhenti ketika nilai `i**2` melebihi 50.

=== `do... while`

Beberapa bahasa pemrograman lain seperti C++ atau Java memiliki konstruksi `do...while`. Ini adalah perulangan post-test, yang berarti kondisi perulangan diperiksa di akhir setiap iterasi. Hal ini menjamin bahwa blok kode di dalam loop akan dieksekusi setidaknya satu kali, terlepas dari apakah kondisinya terpenuhi atau tidak.   

Python secara native tidak memiliki sintaks do...while. Namun, fungsionalitas ini dapat diemulasikan dengan sebuah pola yang umum digunakan, yaitu while True yang dikombinasikan dengan pernyataan break di dalamnya.   

Contoh emulasi `do...while` di Python:

#zebraw(
  numbering-separator: true,
  ```py
  while True:
      masukan = input("Ketik 'keluar' untuk berhenti: ")
      print(f"Anda mengetik: {masukan}")
      if masukan == 'keluar':
          break
  ```
)

== Percabangan dalam Perulangan (Conditional Loop)

Pernyataan kondisional seperti if, elif, dan else dapat ditempatkan di dalam blok perulangan. Kombinasi ini memungkinkan eksekusi kode yang berbeda-beda tergantung pada kondisi yang terpenuhi pada setiap iterasi. Hal ini memberikan kontrol alur yang jauh lebih dinamis dan merupakan fondasi dari banyak algoritma kompleks, seperti pemfilteran data, pencarian elemen tertentu, atau simulasi berbasis aturan.   

Contoh penggunaan percabangan dalam perulangan untuk memisahkan bilangan ganjil dan genap: #zebraw( 
  numbering-separator: true,
  ```py
  for i in range(10):
      if i % 2 == 0:
          print(f"{i} adalah bilangan genap")
      else:
          print(f"{i} adalah bilangan ganjil")
  ```
)

== Perulangan dalam Perulangan (Nested Loop)

Sebuah struktur perulangan dapat ditempatkan di dalam blok perulangan lainnya. Konsep ini dikenal sebagai nested loop atau perulangan bersarang. Aturan eksekusinya sederhana: untuk setiap satu iterasi dari loop luar, loop dalam akan menyelesaikan seluruh siklus iterasinya dari awal hingga akhir.   

Analogi yang sering digunakan untuk menjelaskan konsep ini adalah jam. Jarum detik (loop dalam) harus berputar 60 kali penuh sebelum jarum menit (loop luar) dapat bergeser satu kali. Nested loop sangat umum digunakan untuk memproses struktur data dua dimensi seperti matriks, tabel, atau untuk menggambar pola berbasis grid baris dan kolom.

== Fungsi break, continue, dan pass

Python menyediakan tiga pernyataan (break, continue, pass) untuk memanipulasi alur eksekusi di dalam loop secara lebih presisi. Ketiganya dapat dipahami sebagai alat dengan tingkat granularitas kontrol yang berbeda: break beroperasi pada level keseluruhan loop, continue pada level iterasi saat ini, dan pass pada level pernyataan (tidak memiliki dampak kontrol).

- `break`: Pernyataan ini digunakan untuk menghentikan eksekusi loop secara paksa dan segera. Ketika break dieksekusi, program akan keluar dari loop dan melanjutkan eksekusi pada baris kode pertama setelah blok loop.   
- `continue`: Pernyataan ini digunakan untuk menghentikan iterasi yang sedang berjalan dan langsung melanjutkan ke iterasi berikutnya. Kode apa pun di dalam loop yang berada setelah pernyataan continue akan dilewati untuk iterasi tersebut.   
- `pass`: Pernyataan ini adalah sebuah null operation, artinya ia tidak melakukan apa-apa. pass digunakan ketika sintaks Python memerlukan sebuah pernyataan tetapi secara logika tidak ada aksi yang perlu dilakukan. Ini sering berfungsi sebagai placeholder untuk kode yang akan diimplementasikan di kemudian hari.   

#pagebreak()

= Hasil dan Pembahasan

Berikut ini pembahasan studi kasus untuk menguji pemahaman terkait materi perulangan yang dikerjakan di praktikum kali ini.

// Soal dan Jawaban
#set enum(numbering: "1. a.")
+ Soal 1 (Latihan 3)
  + Deskripsi soal\
    Budi membaca 1 halaman buku setiap harinya, kecuali pada hari Jumat dia membaca hingga 2 halaman dan pada hari Minggu dia membaca hingga 3 halaman. Budi selalu mulai membaca buku baru pada hari Senin dan terus membaca di hari-hari selanjutnya hingga buku tersebut habis. Buatlah program yang menebak pada hari apa Budi selesai membaca suatu buku. Diinputkan banyak halaman Buku yang Budi ingin baca, outputkan pada hari apa Budi selesai membaca bukunya.\
    Contoh input:
    #zebraw(
      numbering: false,
      ```
      15
      ```
    )
    Contoh output:
    #zebraw(
      numbering: false,
      ```
      Jumat
      ```
    )
    + Kode program
    #zebraw(
      numbering-separator: true,
      ```py
      # soal1.py
      pages = int(input())

      day = 1
      while pages > 0:
          match day:
              case 5:
                  pages -= 2
              case 7:
                  pages -= 3
              case \_:
                  pages -= 1

          if pages > 0:
              day += 1
              day = day if day <= 7 else 1

      match day:
          case 1:
              print("Senin")
          case 2:
              print("Selasa")
          case 3:
              print("Rabu")
          case 4:
              print("Kamis")
          case 5:
              print("Jumat")
          case 6:
              print("Sabtu")
          case 7:
              print("Minggu")
      ```
    )
  + Penjelasan\
    Program ini bertujuan untuk menyimulasikan proses membaca buku hingga selesai. Karena jumlah hari yang dibutuhkan untuk menyelesaikan buku tidak diketahui di awal dan bergantung pada jumlah halaman, maka struktur perulangan yang paling tepat adalah `while`. Loop akan terus berjalan selama jumlah halaman (pages) masih lebih besar dari nol.\
    Logika utama program ini adalah sebagai berikut:
    #set enum(numbering: "1)")
    + Inisialisasi variabel: `pages` diisi dengan input pengguna, dan `day` diinisialisasi dengan nilai 1, yang merepresentasikan hari Senin.
    + Kondisi perulangan `while pages > 0`: menjadi kriteria berhenti. Selama kondisi ini True, simulasi hari demi hari akan terus berjalan.
    + Di dalam loop, struktur `match-case` digunakan untuk menerapkan logika kondisional. Variabel pages dikurangi berdasarkan aturan pada hari tersebut: dikurangi 2 pada hari ke-5 (Jumat), dikurangi 3 pada hari ke-7 (Minggu), dan dikurangi 1 pada hari-hari lainnya.
    + Pengecekan `if pages > 0`: sangat krusial. Ini memastikan bahwa hari hanya akan berganti jika buku belum selesai dibaca. Jika pages menjadi nol atau kurang, loop akan berhenti pada iterasi berikutnya, dan nilai day saat itu adalah hari di mana buku selesai dibaca.
    + Logika `day += 1` dan `day = day if day <= 7 else 1` mengelola siklus mingguan. Hari ditambah satu. Jika nilainya mencapai 8, ia akan di-reset kembali menjadi 1 (Senin).
    + Setelah loop selesai, nilai terakhir dari `day` akan menentukan hari penyelesaian. Blok match-case kedua di luar loop berfungsi untuk menerjemahkan nilai numerik day (1-7) menjadi nama hari yang sesuai untuk ditampilkan sebagai output.
  + Output program\
    #zebraw(
      numbering: false,
      ```
      $ python soal1.py
      15
      Jumat

      $ python soal1.py
      10
      Minggu

      $ python soal1.py
      6
      Jumat
      ```
    )
+ Soal 2 (Latihan 2)
  + Deskripsi soal\
    Rumus pitagoras untuk menghitung sisi miring segitiga siku-siku adalah $a^2 + b^2 = c^2$ . Nilai $a$ dan $b$ adalah sisi-sisi yang membentuk sudut siku-siku, dan $c$ adalah panjang sisi miringnya. Ketiga nilai tersebut adalah bilangan bulat. Buatlah program untuk memunculkan semua kombinasi nilai $a$ dan $b$ ketika program diinputkan nilai $c$.\
    Contoh input:
    #zebraw(
      numbering: false,
      ```
      25
      ```
    )
    Contoh output:
    #zebraw(
      numbering: false,
      ```
      7 24
      15 20
      20 15
      24 7
      ```
    )
  + Kode program\
    #zebraw(
      numbering-separator: true,
      ```py
      # soal2.py
      from math import sqrt

      c = int(input())

      for a in range(1, c):
          b_power = c ** 2 - a ** 2
          b = sqrt(b_power)

          # Check if b is perfect square
          if(int(b) ** 2 == b_power):
              print(f"{a} {int(b)}")
      ```
    )
  + Penjelasan\
    Program ini dirancang untuk mencari semua pasangan bilangan bulat $(a, b)$ yang memenuhi teorema Pitagoras untuk nilai $c$ yang diberikan. Karena kita perlu menguji semua kemungkinan nilai untuk salah satu sisi (misalnya $a$) dalam rentang yang sudah pasti, perulangan for adalah pilihan yang paling sesuai. Rentang nilai $a$ yang mungkin adalah dari 1 hingga $c-1$.
    Langkah-langkah algoritmik yang diimplementasikan adalah:
    #set enum(numbering: "1)")
    + Rumus Pitagoras $a^2 + b^2 = c^2$ diubah secara aljabar menjadi $b^2 = c^2 - a^2$ untuk mengisolasi variabel $b$.
    + Loop `for a in range(1, c)`: melakukan iterasi untuk setiap kemungkinan nilai bilangan bulat $a$.Di dalam loop, nilai $b^2$ dihitung menggunakan variabel b_power.
    + Fungsi `sqrt()` dari modul math digunakan untuk menghitung nilai $b$. Hasil dari `sqrt()` adalah bilangan desimal (`float`).
    + Bagian terpenting dari program ini adalah pengecekan apakah $b$ merupakan bilangan bulat. Kondisi `if(int(b) ** 2 == b_power)`: adalah cara yang efektif untuk melakukan ini. Logikanya adalah: jika $b$ adalah bilangan bulat, maka mengonversinya ke tipe `int`, lalu mengkuadratkannya kembali, akan menghasilkan nilai yang sama persis dengan `b_power` awal. Jika $b$ memiliki komponen desimal, proses konversi ke int akan membuang bagian desimal tersebut, sehingga hasil kuadratnya tidak akan sama dengan `b_power`.
    + Jika kondisi tersebut terpenuhi, maka pasangan $(a, b)$ adalah solusi yang valid dan dicetak ke layar.
  + Output program\
    #zebraw(
      numbering: false,
      ```
      $ python soal2.py
      25
      7 24
      15 20
      20 15
      24 7
      
      $ python soal2.py
      29
      20 21
      21 20

      $ python soal2.py
      45
      27 36
      36 27
      ```
    )
+ Soal 3 (Quiz 2)
  + Deskripsi soal\
    Buatlah program python yang menerima sebuah bilangan bulat $N$ dan menampilkan tampilan gambar berikut. Panjang sisi (ditandai dengan tanda \#) adalah sebanyak $N$.\
    Contoh input:
    #zebraw(
      numbering: false,
      ```
      4
      ```
    )
    Contoh output:
    #zebraw(
      numbering: false,
      ```
      ####
      ####
      ####
      ####
      ```
    )
  + Kode program\
    #zebraw(
      numbering-separator: true,
      ```py
      # soal3.py
      n = int(input())

      for i in range(n):
          for j in range(n):
              print("#", end="")
          print()
      ```
    )
  + Penjelasan\
    Program ini bertujuan untuk menggambar sebuah persegi penuh berukuran $N crossmark N$ menggunakan karakter '\#'. Masalah ini secara inheren bersifat dua dimensi (terdiri dari baris dan kolom), sehingga penggunaan nested loop (perulangan bersarang) adalah pendekatan yang paling alami dan efisien.
    Struktur program ini dapat diuraikan sebagai berikut:
    #set enum(numbering: "1)")
    + Loop luar, `for i in range(n)`:, bertanggung jawab untuk mengelola baris. Loop ini akan berulang sebanyak $N$ kali, di mana setiap iterasi merepresentasikan satu baris dari persegi.
    + Loop dalam, `for j in range(n)`:, bertanggung jawab untuk mengelola kolom pada setiap baris. Untuk setiap satu iterasi loop luar, loop dalam ini akan berjalan penuh sebanyak $N$ kali.
    + Di dalam loop dalam, perintah `print("#", end="")` dieksekusi. Perintah ini mencetak karakter '\#'. Argumen `end=""` sangat penting karena ia mencegah fungsi `print()` untuk otomatis menambahkan karakter baris baru (`\n`) di akhir. Hasilnya, semua karakter '\#' yang dicetak oleh loop dalam akan tampil berjajar di baris yang sama.
    + Setelah loop dalam selesai (artinya satu baris penuh telah tercetak), perintah `print()` dieksekusi. Panggilan `print()` tanpa argumen ini berfungsi untuk mencetak karakter baris baru, yang efektif memindahkan kursor ke awal baris berikutnya, siap untuk iterasi loop luar selanjutnya.
  + Output program\
    #zebraw(
      numbering: false,
      ```
      $ python soal3.py
      4
      ####
      ####
      ####
      ####

      $ python soal3.py
      8
      ########
      ########
      ########
      ########
      ########
      ########
      ########
      ########
      ```
    )
+ Soal 4 (Quiz 3)
  + Deskripsi soal\
    Buatlah program python yang menerima sebuah bilangan bulat $N$ dan menampilkan tampilan gambar berikut. Panjang sisi (ditandai dengan tanda \#) adalah sebanyak $N$.\
    Contoh input:
    #zebraw(
      numbering: false,
      ```
      5
      ```
    )
    Contoh output:
    #zebraw(
      numbering: false,
      ```
      #####
      #   #
      #   #
      #   #
      #####
      ```
    )
  + Kode program\
    #zebraw(
      numbering-separator: true,
      ```py
      # soal4.py
      n = int(input())

      for i in range(n):
          for j in range(n):
              if i == 0 or i == n-1 or j == 0 or j == n-1:
                  print("#", end="")
              else:
                  print(" ", end="")
          print()
      ```
    )
  + Penjelasan\
    Program ini merupakan pengembangan dari soal sebelumnya. Tujuannya adalah menggambar persegi berongga, di mana karakter '\#' hanya muncul di bagian tepian, sementara bagian dalamnya diisi dengan spasi. Ini adalah contoh klasik penerapan konsep "percabangan dalam perulangan".
    Struktur dasar program ini masih menggunakan nested loop untuk membentuk grid $N crossmark N$, sama seperti pada Soal 3. Perbedaannya terletak pada logika di dalam loop dalam:
    #set enum(numbering: "1)")
    + Struktur `for i in range(n)`: (loop luar untuk baris) dan `for j in range(n)`: (loop dalam untuk kolom) menciptakan kerangka grid. Variabel `i` merepresentasikan indeks baris (dari 0 hingga $N-1$) dan j merepresentasikan indeks kolom (dari 0 hingga $N-1$).
    + Di dalam loop dalam, sebuah pernyataan if digunakan untuk membuat keputusan. Kondisi `if i == 0 or i == n-1 or j == 0 or j == n-1`: memeriksa apakah posisi (i, j) saat ini berada di tepian persegi.
    + Logika kondisi tersebut dapat dipecah menjadi empat bagian:
      + `i == 0`: Benar jika posisi berada di baris paling atas.
      + `i == n-1`: Benar jika posisi berada di baris paling bawah.
      + `j == 0`: Benar jika posisi berada di kolom paling kiri.
      + `j == n-1`: Benar jika posisi berada di kolom paling kanan.
    + Jika salah satu dari keempat kondisi tersebut terpenuhi (dihubungkan dengan or), maka program akan mencetak karakter '\#'.
    + Jika tidak ada kondisi yang terpenuhi, berarti posisi tersebut berada di bagian dalam persegi, dan program akan mengeksekusi blok else untuk mencetak spasi " ".
    + `print()` di akhir loop luar digunakan untuk pindah ke baris baru.
  + Output program\
    #zebraw(
      numbering: false,
      ```
      $ python soal4.py
      5
      #####
      #   #
      #   #
      #   #
      #####

      $ python soal4.py
      8
      ########
      #      #
      #      #
      #      #
      #      #
      #      #
      #      #
      ########
      ```
    )
