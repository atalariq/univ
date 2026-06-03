#import "@preview/zebraw:0.5.5": *
#show: zebraw

#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2",

  mata-kuliah: "PRAKTIKUM PEMROGRAMAN KOMPUTER",
  kode-mata-kuliah: "PPK",
  nama-dosen-pengampu: "Firma Syahrian, S. Kom., M. Cs.",
  no-pertemuan: "6",

  judul-praktikum: "Percabangan",
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

*Percabangan* atau struktur kondisional (_control flow_) adalah mekanisme dasar yang memungkinkan program untuk mengambil keputusan. Alur eksekusi program tidak lagi bersifat linear, melainkan dapat "bercabang" berdasarkan evaluasi terhadap kondisi tertentu. Jika suatu kondisi terpenuhi (bernilai `True`), program akan menjalankan satu blok aksi; jika tidak (bernilai `False`), program akan menjalankan aksi alternatif atau melewatinya.

== Operasi Relasional

Untuk membangun sebuah kondisi, kita memerlukan *operasi relasional*. Operasi ini berfungsi sebagai pembanding antara dua nilai (operan) dan selalu menghasilkan nilai boolean, yaitu `True` atau `False`. Operasi ini merupakan fondasi untuk menentukan apakah suatu kondisi dalam percabangan terpenuhi. Berikut adalah operator relasional yang tersedia di Python.

#table(
  columns: (auto, 1.5fr, 2.5fr, 2.5fr, auto),
  align: (center, left, left, left, center),
  stroke: 0.4pt,
  inset: 8pt,

  // Header dengan latar belakang abu-abu dan teks tebal
  table.header(
    table.cell(fill: luma(220), text(weight: "bold")[Simbol]),
    table.cell(fill: luma(220), text(weight: "bold")[Nama Operator]),
    table.cell(fill: luma(220), text(weight: "bold")[Keterangan]),
    table.cell(fill: luma(220), text(weight: "bold")[Contoh Kode]),
    table.cell(fill: luma(220), text(weight: "bold")[Hasil]),
  ),

  // Isi tabel
  [`==`], [Sama dengan], [Memeriksa apakah nilai dua operan sama persis.], [`a = 10; b = 10; a == b`], [`true`],
  [`!=`], [Tidak sama dengan], [Memeriksa apakah nilai dua operan tidak sama.], [`a = 10; b = 5; a != b`], [`true`],
  [`>`], [Lebih besar dari], [Memeriksa apakah nilai operan kiri lebih besar dari operan kanan.], [`a = 10; b = 5; a > b`], [`true`],
  [`<`], [Lebih kecil dari], [Memeriksa apakah nilai operan kiri lebih kecil dari operan kanan.], [`a = 10; b = 5; a < b`], [`false`],
  [`>=`], [Lebih besar atau sama dengan], [Memeriksa apakah operan kiri lebih besar atau sama dengan operan kanan.], [`a = 10; b = 10; a >= b`], [`true`],
  [`<=`], [Lebih kecil atau sama dengan], [Memeriksa apakah operan kiri lebih kecil atau sama dengan operan kanan.], [`a = 10; b = 5; a <= b`], [`false`],
)

Meskipun sering digunakan pada tipe data numerik seperti integer dan float, operasi relasional juga dapat diterapkan pada string. Pada string, perbandingan dilakukan secara *leksikografis*, yaitu berdasarkan urutan abjad seperti dalam kamus. Sebagai contoh, ekspresi `"apel" < "jeruk"` akan menghasilkan `True` karena "apel" muncul lebih awal dalam urutan abjad dibandingkan "jeruk".

== Operasi Logika

Ketika sebuah keputusan bergantung pada beberapa kondisi sekaligus, *operasi logika* digunakan untuk menggabungkannya. Python menyediakan tiga operator logika utama: `and`, `or`, dan `not`. Operator `and` dan `or` digunakan untuk mengombinasikan dua atau lebih ekspresi boolean menjadi satu kesimpulan logis, sedangkan `not` berfungsi untuk membalik (menegasikan) nilai kebenaran dari sebuah ekspresi.

#table(
  columns: (auto, 2fr, 2.5fr, auto),
  align: (center, left, left, center, left),
  stroke: 0.4pt,
  inset: 8pt,

  // Header
  table.header(
    table.cell(fill: luma(220), text(weight: "bold")[Operator]),
    table.cell(fill: luma(220), text(weight: "bold")[Keterangan]),
    table.cell(fill: luma(220), text(weight: "bold")[Contoh Kode]),
    table.cell(fill: luma(220), text(weight: "bold")[Hasil]),
  ),

  // Isi tabel
  [`and` atau `&&`], [Bernilai `True` hanya jika *kedua* ekspresi yang dihubungkan bernilai `True`.], [`umur = 25; punya_sim = true; (umur > 17) and punya_sim`], [`true`],
  [`or` atau `||`], [Bernilai `True` jika *salah satu* dari ekspresi yang dihubungkan bernilai `True`.], [`hari = "Minggu"; (hari == "Sabtu") or (hari == "Minggu")`], [`true`],
  [`not` atau `!`], [Membalikkan nilai Boolean dari suatu ekspresi. `True` menjadi `False`, dan sebaliknya.], [`lulus = false; not lulus`], [`true`],
)

== Kondisional (`if`)

Struktur kondisional adalah implementasi dari konsep percabangan. Bentuk paling dasar adalah pernyataan `if`, yang digunakan untuk mengeksekusi blok kode hanya jika kondisi yang diberikan terpenuhi.

Sintaksnya diawali dengan kata kunci `if`, diikuti oleh kondisi, dan diakhiri dengan titik dua (`:`). Blok kode yang berada di bawahnya dan memiliki inden (menjorok ke dalam, biasanya 4 spasi atau 1 tab) akan dieksekusi jika kondisi bernilai `True`. Indentasi ini bersifat wajib di Python dan menjadi penanda lingkup (scope) dari blok `if`.

Contoh penggunaan untuk mencari nilai absolut:
```py
x = int(input())
if x < 0:
  # Blok ini hanya berjalan jika x negatif
  print("Nilai x negatif!")
  x = x * -1
print("Nilai absolutnya adalah", x)
```

Pada contoh di atas, jika x yang diinput bernilai -5, kedua baris di dalam blok if akan dieksekusi. Namun, jika x bernilai 5, program akan langsung melompat ke baris print terakhir.

== Kondisional dengan Alternatif (`if-else`)

Seringkali kita butuh untuk menjalankan aksi alternatif ketika sebuah kondisi tidak terpenuhi. Untuk keperluan ini, struktur if dapat dilengkapi dengan pernyataan else. Blok kode di bawah else akan dieksekusi hanya jika kondisi if bernilai False.

```py
if x % 2 == 1:
  print('Nilai x adalah ganjil')
else:
  # Blok ini berjalan jika sisa bagi x dengan 2 bukan 1
  print('Nilai x adalah genap')
```

== Kondisional Berantai (`if-elif-else`)

Untuk menangani lebih dari dua kemungkinan cabang, kita dapat menggunakan kondisional berantai dengan menambahkan satu atau lebih pernyataan elif (singkatan dari else if). Python akan mengevaluasi setiap kondisi secara berurutan dari atas ke bawah. Begitu salah satu kondisi if atau elif terpenuhi, blok kodenya akan dieksekusi, dan sisa rantai percabangan akan diabaikan. Klausa else di akhir bersifat opsional dan berfungsi sebagai penangkap kondisi "default" jika tidak ada kondisi sebelumnya yang terpenuhi.

```py
if x > 0:
  print("Positif")
elif x < 0:
  print("Negatif")
else:
  print("Netral (Nol)")
```

== Kondisional Bersarang (_Nested if_)

Kondisional bersarang adalah istilah untuk struktur if yang berada di dalam blok if atau else lain. Ini memungkinkan pengecekan kondisi yang lebih kompleks dan berlapis. Indentasi menjadi kunci untuk mendefinisikan tingkatan atau hierarki dari setiap percabangan.

```py
if x % 2 == 0:
  print("X adalah bilangan genap")
  if x > 0:
    print("dan merupakan bilangan positif")
  else:
    print("dan merupakan bilangan non-positif")
else:
  print("X adalah bilangan ganjil")
```

#pagebreak()

= Hasil dan Pembahasan

Berikut ini studi kasus atau latihan soal yang harus dikerjakan pada praktikum kali ini beserta pembahasannya.

// Soal dan Jawaban
#set enum(numbering: "1. a.")
+ Soal 1 (Latihan 3)
  + Deskripsi soal\
    Buatlah program yang menerima 3 buah input nilai, outputkan nilai paling besar diantara ketiga input tersebut.
    Contoh input:
    #zebraw(
      numbering: false,
      ```
      2 9 6
      ```
    )
    Contoh output:
    #zebraw(
      numbering: false,
      ```
      9
      ```
    )
    + Kode program
    #zebraw(
      numbering-separator: true,
      ```py
      # soal_1-bilangan_terbesar.py
      data = input("Masukkan angka: ").split()
      data = list(map(int, data))

      nilai_terbesar = data[0]

      if(data[1] > nilai_terbesar):
          nilai_terbesar = data[1]

      if(data[2] > nilai_terbesar):
          nilai_terbesar = data[2]
      print(f"Nilai terbesar adalah {nilai_terbesar}")
      ```
    )
  + Penjelasan\
    Program tersebut menerima tiga buah bilangan bulat untuk dicari manakah yang paling besar. Tiga bilangan tersebut diubah dalam bentuk `List` untuk mempermudah akses. Selanjutnya, untuk mencari nilai terbesar dalam `List` angka tersebut pertama-tama inisialisasi variabel `nilai_terbesar` untuk menyimpan jawaban. Anggap angka pertama (`data[0]`) sebagai nilai terbesar. Lalu, bandingkan nilai terbesar dengan angka kedua (`data[1]`) dan angka ketiga (`data[2]`). Apabila angka kedua ataupun angka ketiga lebih besar dari `nilai_terbesar`, maka tetapkan angka tersebut menjadi `nilai_terbesar`. Terakhir, outputkan jawaban ke layar.
  + Output program\
    #zebraw(
      numbering: false,
      ```
      $ python soal_1-bilangan_terbesar.py
      Masukkan angka: 2 8 6
      Nilai terbesar adalah 8

      $ python soal_1-bilangan_terbesar.py
      Masukkan angka: 333 33 3
      Nilai terbesar adalah 333
      ```
    )
+ Soal 2 (Quiz 1)
  + Deskripsi soal\
    Buatlah program untuk pembulatan menggunakan percabangan. Program akan menerima input sebuah bilangan pecahan, lalu bulatkan ke atas jika nilai pecahannya >= 0.4 dan bulatkan ke bawah jika sebaliknya.
    Contoh input:
    #zebraw(
      numbering: false,
      ```
      32.412
      ```
    )
    Contoh output:
    #zebraw(
      numbering: false,
      ```
      33
      ```
    )
  + Kode program\
    #zebraw(
      numbering-separator: true,
      ```py
      # soal_2-pembulatan.py
      from math import ceil, floor
      data = float(input("Masukkan angka: "))
      if(data * 10 % 10 >= 4):
          print(ceil(data))
      else:
          print(floor(data))
      ```
    )
  + Penjelasan\
    Program ini bertujuan untuk melakukan pembulatan kustom pada sebuah bilangan desimal.
    #set enum(numbering: "1)")
    + Import Modul:\
      `from math import ceil, floor` mengimpor dua fungsi dari modul `math`. Fungsi `ceil()` digunakan untuk membulatkan angka ke atas, sedangkan fungsi `floor()` untuk membulatkan ke bawah.
    + Input Pengguna:\
      Baris `data = float(input(...))` meminta pengguna memasukkan sebuah angka dan langsung mengubahnya menjadi tipe data `float`.
    + Kondisi pembulatan:\
      Kondisi `if(data * 10 % 10 >= 4)` adalah inti dari program ini. Logika ini bekerja dengan cara:
      - Mengalikan angka input dengan 10 untuk menggeser koma desimal ke kanan (misal: `32.412` menjadi `324.12`).
      - Menggunakan operator modulo (`% 10`) untuk mendapatkan sisa bagi dengan 10, yang secara efektif mengambil angka pertama di belakang koma (misal: `324.12 % 10` hasilnya `4.12`).
      - Kondisi ini memeriksa apakah hasil tersebut lebih besar atau sama dengan 4.
    + Eksekusi pengkondisian:
      - Jika kondisi `True` (nilai pecahan >= 0.4), program akan memanggil `ceil(data)` untuk membulatkan angka ke atas.
      - Jika `False`, program akan memanggil `floor(data)` untuk membulatkan ke bawah.
    + Terakhir, keluarkan hasil pembulatan langsung dicetak ke layar.
  + Output program\
    #zebraw(
      numbering: false,
      ```
      $ python soal_2-pembulatan.py
      Masukkan angka: 32.412
      33

      $ python soal_2-pembulatan.py
      Masukkan angka: 69.4
      70

      $ python soal_2-pembulatan.py
      Masukkan angka: 34.369
      34
      ```
    )
+ Soal 3 (Quiz 3)
  + Deskripsi soal\
    Buatlah program yang menerima 3 buah input nilai, input pertama sebagai tanggal, lalu bulan, lalu tahun, tentukan apakah tanggal tersebut valid.
    Contoh input:
    #zebraw(
      numbering: false,
      ```
      31 4 2019
      ```
    )
    Contoh output:
    #zebraw(
      numbering: false,
      ```
      tidak valid
      ```
    )
  + Kode program\
    #zebraw(
      numbering-separator: true,
      ```py
      # soal_3-validasi_tanggal.py
      # Input tanggal
      tanggal = input("Masukkan tanggal (DD MM YYYY): ").split()
      [hari, bulan, tahun] = map(int, tanggal)

      # di awal, anggap semua tanggal valid
      isValid: bool = True

      # Kalau tidak sesuai format tanggal
      if tahun < 0 or bulan < 1 or bulan > 12 or hari < 1:
          isValid = False
      # 10 Hari yang hilang pada kalendar Gregorian (5-14 Oktober 1582)
      elif tahun == 1582 and bulan == 10 and hari in range(5, 15):
          isValid = False
      # 31 hari (Januari, Maret, Mei, Juli, Agustus, Oktober, Desember)
      elif bulan in [1, 3, 5, 7, 8, 10, 12] and hari > 31:
          isValid = False
      # 30 hari (April, Juni, September, November)
      elif bulan in [4, 6, 9, 11] and hari > 30:
          isValid = False
      # Khusus Februari, bisa 28 atau 29 hari (tahun kabisat/leap year)
      elif bulan == 2:
          if tahun % 4 == 0 and tahun % 100 != 0 or tahun % 400 == 0:
              if hari > 29:
                  isValid = False
          else:
              if hari > 28:
                  isValid = False

      # Print output
      print("Tanggal valid" if isValid else "Tanggal tidak valid")
      ```
    )
  + Penjelasan\
    Program ini berfungsi mengecek apakah suatu tanggal itu valid, terdapat di kalender, atau tidak. Cara kerja program ini adalah sebagai berikut.
    #set enum(numbering: "1)")
    + Input tanggal, terdiri dari hari, bulan, dan tahun. Lalu menyimpan inputan tersebut ke dalam variabel dengan tipe data `int` sesuai namanya (`hari`, `bulan`, dan `tahun`)
    + Inisialisasi penanda/_flag_ `isValid` dengan nilai boolean `True`. Pada awalnya, program mengasumsikan bahwa tanggal yang diinput adalah tanggal yang valid. Baru kemudian nilainya diubah menjadi `False` apabila ditemukan aturan yang dilanggar.
    + Lakukan pengecekan dengan kondisi/aturan sebagai berikut:
      - Tahun haruslah lebih besar atau sama dengan nol -> (`tahun >= 0`)
      - Bulan haruslah bernilai di antara 1 dan 12 (inklusif) -> (`1 <= bulan <= 12`)
      - Hari haruslah bernilai di antara batas bawah (1) dan batas akhir (tergantung bulan)
        - Untuk bulan Januari, Maret, Mei, Juli, Agustus, Oktober, dan Desember, batas akhirnya 31.
        - Untuk bulan April, Juni, September, dan November, batas akhirnya 30.
        - Untuk bulan Februari, batas akhirnya 29 apabila tahun merupakan tahun kabisat (_leap year_) atau 28 bila bukan tahun kabisat.
      - Spesial untuk tahun 1582 bulan Oktober, terdapat 10 hari yang dihapus dalam kalendar, yaitu pada tanggal 5-14. Hal ini karena adanya koreksi ketidakakuratan pada perhitungan tahun kabisat sistem sebelumnya, yaitu pada kalendar Julius.
    + Outputkan hasil validasi pada layar.
      - Jika _flag_ `isValid` masih bernilai `True`, hasilnya "Tanggal valid".
      - Sebaliknya jika _flag_ `isValid` berubah nilai menjadi `False` pada saat uji validasi dengan percabangan, keluarkan hasil "Tanggal tidak valid".
  + Output program\
    #zebraw(
      numbering: false,
      ```
      $ python soal_3-validasi_tanggal.py
      Masukkan tanggal (DD MM YYYY): 31 4 2019
      Tanggal tidak valid

      $ python soal_3-validasi_tanggal.py
      Masukkan tanggal (DD MM YYYY): 29 2 1900
      Tanggal tidak valid

      $ python soal_3-validasi_tanggal.py
      Masukkan tanggal (DD MM YYYY): 29 2 2000
      Tanggal valid
      ```
    )
