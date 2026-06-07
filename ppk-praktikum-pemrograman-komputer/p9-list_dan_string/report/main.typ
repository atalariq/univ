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

  judul-praktikum: "List dan String",
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

#show heading.where(level: 1): set heading(numbering: "1.")
// #show heading.where(level: 2): set heading(numbering: "1.1")
// #show heading.where(level: 3): set heading(numbering: "1.1.1")
// #set heading(numbering: "1.1")

= Dasar Teori

List adalah struktur data yang dapat menyimpan kumpulan elemen secara terurut. Setiap elemen di dalam list memiliki indeks berupa bilangan bulat yang dimulai dari nol. Elemen-elemen ini dapat terdiri dari berbagai tipe data, seperti integer, string, atau bahkan list lain.

String adalah struktur data yang merepresentasikan urutan karakter. Mirip dengan list, setiap karakter dalam string dapat diakses menggunakan indeks. Namun, string bersifat _immutable_, yang berarti nilainya tidak dapat diubah setelah dibuat.

== Fungsi `len()`
Fungsi `len()` digunakan untuk menghitung jumlah elemen dalam sebuah objek. Jika diterapkan pada list, fungsi ini akan mengembalikan jumlah total elemen di dalamnya. Jika digunakan pada string, `len()` akan mengembalikan jumlah karakter, termasuk spasi dan simbol.

== Inisialisasi List
Inisialisasi list dapat dilakukan dengan menentukan ukuran dan nilai awal untuk setiap elemennya. Operator `*` digunakan untuk membuat list yang berisi elemen-elemen identik. Cara ini efisien untuk menyiapkan list dengan ukuran tertentu sebelum diisi dengan data, misalnya dari input pengguna.

```py
A = [0] * 5
print(A)

# Output:
# [0, 0, 0, 0, 0]
```

== Penelusuran List

Penelusuran atau iterasi pada list dapat dilakukan melalui dua cara utama. Pertama adalah dengan menelusuri setiap elemennya secara langsung (iterator). Cara ini cocok saat hanya nilai elemen yang dibutuhkan. Kedua adalah dengan menelusuri melalui indeksnya. Cara ini berguna saat posisi atau indeks elemen diperlukan dalam proses iterasi.

```py
names = ["Arif", "Budi", "Cindy", "Doni"]
for name in names:
    print(name, end=" ")

# Output:
# Arif Budi Cindy Doni

for i in range(len(names)):
    print(f"{i}-{names[i]}", end=" ")

# Output:
# 0-Arif 1-Budi 2-Cindy 3-Doni
```

== Multidimensional List

List multidimensi adalah list yang elemen-elemennya merupakan list lain. Struktur ini digunakan untuk merepresentasikan data dalam bentuk tabel atau matriks. Elemen pada dimensi yang lebih dalam diakses dengan menggunakan beberapa indeks. Fungsi `len()` pada list multidimensi hanya mengembalikan jumlah elemen pada dimensi terluar. Penelusuran pada struktur ini memerlukan perulangan bersarang (nested loop).

```py
foo = [[0, 1, 2], ['a', 'b', 'c', 'd', 'z'], [2.71, 3.14, 9.8]]

print(len(foo), len(foo[0]), len(foo[1]))

# Output:
# 3 3 5

for i in foo:
    for j in i:
        print(j, end=" ")
    print()

# Output:
# 0 1 2
# a b c d z
# 2.71 3.14 9.8
```

== Operasi String

Operasi pada string memanfaatkan simbol matematika untuk fungsi yang berbeda. Simbol `+` digunakan untuk konkatenasi atau penggabungan dua string. Simbol `*` digunakan untuk repetisi, yaitu mengulang sebuah string sebanyak jumlah yang ditentukan.

== Kode ASCII

Setiap karakter memiliki representasi numerik unik yang disebut kode ASCII (American Standard Code for Information Interchange). Python menyediakan fungsi `ord()` untuk mengubah sebuah karakter menjadi kode ASCII-nya dan fungsi `chr()` untuk mengubah kode ASCII kembali menjadi karakter. Konversi ini sangat berguna untuk manipulasi karakter, seperti memeriksa apakah sebuah karakter adalah huruf kapital.

== Method `join()`

Method `join()` berfungsi untuk menggabungkan elemen-elemen dari sebuah list menjadi satu string tunggal. Sebuah string separator ditentukan untuk disisipkan di antara setiap elemen yang digabungkan. Method ini merupakan kebalikan dari method `split()`.

== String adalah _Immutable_

_Immutable_ berarti nilai atau elemen dari sebuah objek tidak dapat diubah setelah objek tersebut dibuat. String memiliki sifat ini.

```py
s = "Hello"
print(s)

s[0] = "h"
print(s)

# Output:
# Hello
# Error
```

Untuk mengubah karakter tertentu dalam sebuah string, string tersebut harus diubah terlebih dahulu menjadi list, dimodifikasi, kemudian diubah kembali menjadi string menggunakan method `join()`.

```py
s = "Hello"
print(s)

s = list(s)     # Ubah dulu ke tipe data List
s[0] = "h"      # Ubah karakter menggunakan indeks
s = "".join(s)  # Ubah kembali ke string menggunakan method `join()`
print(s)

# Output:
# Hello
# hello
```

#pagebreak()

= Hasil dan Pembahasan

Berikut ini studi kasus atau latihan soal yang harus dikerjakan pada praktikum kali ini beserta pembahasannya.

// Soal dan Jawaban
#set enum(numbering: "1. a.")
+ Soal 1 (Latihan 1)
  + Deskripsi soal\
    Buat program untuk menghitung berapa banyak huruf kapital pada sebuah string. Gunakan tabel ASCII, dan lihat pola integernya untuk membantu mengetahui apakah sebuah karakter adalah kapital atau bukan.\
    Contoh input:
    #zebraw(
      numbering: false,
      ```
      hALo Apa KABAr
      ```
    )
    Contoh output:
    #zebraw(
      numbering: false,
      ```
      7
      ```
    )
  + Kode program
    #zebraw(
      numbering-separator: true,
      ```py
      # File: soal1_latihan1-hitung_kapital.py

      s = input()

      cnt: int = 0
      for i in range(len(s)):
          # 65 = 'A' in ASCII table
          # 90 = 'Z' in ASCII table
          if 65 <= ord(s[i]) <= 90:
              cnt += 1

      print(cnt)
      ```
    )
  + Penjelasan\
    Program ini membaca sebuah string sebagai input. Selanjutnya, program melakukan iterasi untuk setiap karakter dalam string tersebut. Pada setiap iterasi, karakter diubah menjadi nilai integer ASCII menggunakan fungsi `ord()`. Nilai ini kemudian diperiksa apakah berada dalam rentang 65 hingga 90, yang merupakan rentang kode ASCII untuk huruf kapital 'A' hingga 'Z'. Jika kondisi terpenuhi, sebuah variabel pencacah akan ditambahkan satu. Setelah iterasi selesai, nilai akhir dari pencacah akan dicetak sebagai output.
  + Output program\
    #zebraw(
      numbering: false,
      ```
      $ python soal1_latihan1-hitung_kapital
      hALo Apa KABAr
      7

      $ python soal1_latihan1-hitung_kapital
      Hello, World!
      2

      $ python soal1_latihan1-hitung_kapital
      HIDUP JOKOWI!!!
      11
      ```
    )
+ Soal 2 (Latihan 2)
  + Deskripsi soal\
    Buat program untuk merapikan huruf kapital pada string. Program menerima input sebuah string yang terdiri dari huruf kapital atau pun non-kapital dan juga spasi. Outputkan sebuah string dengan karakter pertamanya merupakan huruf kapital, dan sisanya bukan kapital.\
    Contoh input:
    #zebraw(
      numbering: false,
      ```
      hALo Apa KABAr
      ```
    )
    Contoh output:
    #zebraw(
      numbering: false,
      ```
      Halo apa kabar
      ```
    )
  + Kode program\
    #zebraw(
      numbering-separator: true,
      ```py
      # File: soal2_latihan2-rapikan_string.py

      s = list(input().lower())
      # s[0] = chr(ord(s[0]) - (ord('a') - ord('A')))
      s[0] = chr(ord(s[0]) - 32)
      s = "".join(s)
      print(s)

      ```
    )
  + Penjelasan\
    Program ini pertama-tama mengubah seluruh string input menjadi huruf kecil menggunakan method `.lower()`, lalu mengonversinya menjadi sebuah list karakter. Langkah ini memastikan semua karakter selain karakter pertama sudah dalam format yang benar. Selanjutnya, karakter pertama dalam list (s[0]) diubah menjadi huruf kapital dengan memanipulasi kode ASCII-nya. Kode ASCII untuk huruf kecil dikurangi 32 untuk mendapatkan kode ASCII huruf kapital yang sesuai. Terakhir, list karakter tersebut digabungkan kembali menjadi sebuah string menggunakan method `"".join()` dan dicetak ke layar.
  + Output program\
    #zebraw(
      numbering: false,
      ```
      $ python soal2_latihan2-rapikan_string.py
      hALo Apa KABAr
      Halo apa kabar

      $ python soal2_latihan2-rapikan_string.py
      LOREM IPSUM
      Lorem ipsum

      $ python soal2_latihan2-rapikan_string.py
      bAHlIl
      Bahlil
      ```
    )
+ Soal 3 (Quiz 1)
  + Deskripsi soal\
    Buat program yang membaca sebuah list dua dimensi berukuran 8 x 8 dengan format seperti di bawah. Lalu outputkan list yang sama tetapi dirotasi 180 derajat.\
    Contoh input:
    #zebraw(
      numbering: false,
      ```
      1 2 3 4 5 6 7 8
      2 2 2 2 2 2 2 2
      3 3 3 3 3 3 3 3
      4 4 4 4 4 4 4 4
      5 5 5 5 5 5 5 5
      6 6 6 6 6 6 6 6
      7 7 7 7 7 7 7 7
      8 8 8 8 8 8 8 8
      ```
    )
    Contoh output:
    #zebraw(
      numbering: false,
      ```
      8 8 8 8 8 8 8 8
      7 7 7 7 7 7 7 7
      6 6 6 6 6 6 6 6
      5 5 5 5 5 5 5 5
      4 4 4 4 4 4 4 4
      3 3 3 3 3 3 3 3
      2 2 2 2 2 2 2 2
      8 7 6 5 4 3 2 1
      ```
    )
  + Kode program\
    #zebraw(
      numbering-separator: true,
      ```py
      # File: soal3_quiz1-rotasi_matrix.py

      N: int = 8
      matrix: list[list[int]] = [[0] * N] * N

      for i in range(N):
          matrix[i] = [int(j) for j in input().split()]

      print()

      for i in range(N):
          for j in range(N):
              print(matrix[N-1-i][N-1-j], end=" ")
          print() # Newline
      ```
    )
  + Penjelasan\
    Program ini dirancang untuk memutar matriks berukuran 8x8 sebesar 180 derajat. Pertama, program membaca 8 baris input, di mana setiap baris berisi 8 angka yang dipisahkan spasi, dan menyimpannya dalam sebuah list dua dimensi. Untuk melakukan rotasi, program menggunakan perulangan bersarang untuk mencetak matriks baru. Logika rotasi terletak pada cara mengakses elemen, yaitu matrix[N-1-i][N-1-j]. Indeks N-1-i membalik urutan baris (dari bawah ke atas), dan indeks N-1-j membalik urutan kolom (dari kanan ke kiri). Kombinasi keduanya menghasilkan rotasi 180 derajat.
  + Output program\
    #zebraw(
      numbering: false,
      ```
      $ python soal3_quiz1-rotasi_matrix.py
      1 2 3 4 5 6 7 8
      2 2 2 2 2 2 2 2
      3 3 3 3 3 3 3 3
      4 4 4 4 4 4 4 4
      5 5 5 5 5 5 5 5
      6 6 6 6 6 6 6 6
      7 7 7 7 7 7 7 7
      8 8 8 8 8 8 8 8

      8 8 8 8 8 8 8 8
      7 7 7 7 7 7 7 7
      6 6 6 6 6 6 6 6
      5 5 5 5 5 5 5 5
      4 4 4 4 4 4 4 4
      3 3 3 3 3 3 3 3
      2 2 2 2 2 2 2 2
      8 7 6 5 4 3 2 1

      $ python soal3_quiz1-rotasi_matrix.py
      1 2 3 4 5 6 7 8
      2 3 4 5 6 7 8 9
      3 4 5 6 7 8 9 0
      4 5 6 7 8 9 0 1
      5 6 7 8 9 0 1 2
      6 7 8 9 0 1 2 3
      7 8 9 0 1 2 3 4
      8 9 0 1 2 3 4 5

      5 4 3 2 1 0 9 8 
      4 3 2 1 0 9 8 7 
      3 2 1 0 9 8 7 6 
      2 1 0 9 8 7 6 5 
      1 0 9 8 7 6 5 4 
      0 9 8 7 6 5 4 3 
      9 8 7 6 5 4 3 2 
      8 7 6 5 4 3 2 1

      $ python soal3_quiz1-rotasi_matrix.py
      1 0 1 0 1 0 1 0
      0 2 0 2 0 2 0 2
      3 0 3 0 3 0 3 0
      0 4 0 4 0 4 0 4
      5 0 5 0 5 0 5 0
      0 6 0 6 0 6 0 6
      7 0 7 0 7 0 7 0
      0 8 0 8 0 8 0 8

      8 0 8 0 8 0 8 0 
      0 7 0 7 0 7 0 7 
      6 0 6 0 6 0 6 0 
      0 5 0 5 0 5 0 5 
      4 0 4 0 4 0 4 0 
      0 3 0 3 0 3 0 3 
      2 0 2 0 2 0 2 0 
      0 1 0 1 0 1 0 1 
      ```
    )
