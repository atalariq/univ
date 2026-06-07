#import "@preview/zebraw:0.5.5": *
#show: zebraw

#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2",

  mata-kuliah: "PRAKTIKUM PEMROGRAMAN KOMPUTER",
  kode-mata-kuliah: "PPK",
  nama-dosen-pengampu: "Firma Syahrian, S. Kom., M. Cs.",
  no-pertemuan: "10",

  judul-praktikum: "Function dan OOP",
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

== Function

Fungsi (function) adalah blok kode terorganisir yang dirancang untuk melakukan tugas tertentu. Fungsi membantu memecah program besar menjadi bagian-bagian yang lebih kecil dan modular. Penggunaan fungsi memberikan beberapa keuntungan, seperti membuat program lebih terstruktur, meningkatkan keterbacaan kode (readability), dan memungkinkan penggunaan kembali kode (reusability) di bagian lain program.

Konsep-konsep dasar terkait fungsi dalam Python meliputi:
+ *Deklarasi dan Pemanggilan*: Fungsi dideklarasikan menggunakan kata kunci `def`, diikuti nama fungsi dan parameter dalam tanda kurung. Fungsi dieksekusi dengan memanggil namanya.
+ *Parameter dan Argumen*: Parameter adalah variabel yang didefinisikan saat deklarasi fungsi. Argumen adalah nilai aktual yang dikirimkan ke fungsi saat pemanggilan.
+ *Arbitrary Arguments (`*args`)*: Memungkinkan fungsi menerima jumlah argumen yang tidak ditentukan sebagai sebuah tuple.
+ *Default Parameters*: Memberikan nilai bawaan pada parameter. Nilai ini akan digunakan jika tidak ada argumen yang diberikan saat fungsi dipanggil.
+ *Keyword Parameters*: Memungkinkan pemanggilan fungsi dengan menyebutkan nama parameter secara eksplisit, sehingga urutan argumen tidak lagi penting.
+ *Return Statement*: Menggunakan kata kunci `return` untuk mengembalikan nilai atau hasil dari eksekusi fungsi.
+ *Recursive Function*: Fungsi yang memanggil dirinya sendiri. Teknik ini berguna untuk menyelesaikan masalah yang dapat dipecah menjadi sub-masalah yang lebih kecil dan identik, seperti perhitungan faktorial.
+ *Lambda Function*: Fungsi anonim (tanpa nama) yang kecil dan sederhana, didefinisikan menggunakan kata kunci `lambda`. Sering digunakan bersama fungsi bawaan seperti `map()` dan `filter()`.

== Object-Oriented Programming (OOP)

Object-Oriented Programming (OOP) atau Pemrograman Berorientasi Objek adalah paradigma pemrograman yang didasarkan pada konsep "objek". Dalam OOP, program distrukturkan di sekitar objek, yang dapat memiliki data dalam bentuk atribut (properties) dan kode dalam bentuk metode (methods). Hampir semua hal dalam Python adalah objek.

Konsep-konsep dasar dalam OOP meliputi:
+ *Class*: Sebuah cetak biru (blueprint) atau templat untuk membuat objek. Class mendefinisikan atribut dan metode yang akan dimiliki oleh objek.
+ *Object (Instance)*: Wujud nyata atau hasil instansiasi dari sebuah class.
+ *Constructor (`__init__`)*: Metode khusus dalam class yang dieksekusi secara otomatis saat sebuah objek baru dibuat. Metode ini biasanya digunakan untuk menginisialisasi atribut objek.
+ *Self*: Parameter pertama dalam setiap metode di dalam class (termasuk `__init__`). Parameter `self` merujuk pada instance objek itu sendiri, memungkinkan akses ke atribut dan metode lain dari objek tersebut.
+ *Instance vs. Class Variables*: Instance variable adalah data yang unik untuk setiap objek (didefinisikan di dalam `__init__`). Class variable adalah data yang dibagikan oleh semua objek dari class tersebut (didefinisikan di luar metode).
+ *Inheritance (Pewarisan)*: Mekanisme di mana sebuah class (child class) dapat mewarisi atribut dan metode dari class lain (parent class). Ini mendukung reusabilitas kode.
+ *Polymorphism (Polimorfisme)*: Kemampuan objek dari class yang berbeda untuk merespons metode dengan nama yang sama secara berbeda. Ini memungkinkan fleksibilitas dalam desain program.
+ *Encapsulation (Enkapsulasi)*: Konsep menyembunyikan data internal objek dan melindungi data tersebut dari akses luar yang tidak sah. Di Python, ini dicapai melalui konvensi penamaan (seperti `_` untuk semi-privat dan `__` untuk privat) dan penggunaan metode getter/setter.
+ *Abstraction (Abstraksi)*: Menyembunyikan detail implementasi yang kompleks dan hanya mengekspos fungsionalitas yang relevan kepada pengguna.

#pagebreak()

= Hasil dan Pembahasan

== Deskripsi Soal

=== Latar Belakang

Di Universitas XYZ, terdapat sistem manajemen data mahasiswa bernama Ruang Data Mahasiswa Terenkripsi. Sistem ini dirancang untuk menjaga keamanan data pribadi mahasiswa menggunakan teknik enkripsi sederhana. Setiap mahasiswa memiliki informasi berupa nama, usia, dan nilai ratarata. Nama mahasiswa dienkripsi untuk melindungi identitas mereka dari akses yang tidak sah.

=== Cerita

Suatu hari, Prof. Andi, seorang dosen yang peduli terhadap keamanan data, mendapatkan tugas untuk menganalisis data mahasiswa baru di universitasnya. Ia memerlukan sistem yang dapat mengelola dan menganalisis data mahasiswa yang terenkripsi. Untuk itu, Prof. Andi meminta bantuan Anda — seorang programmer handal — untuk membuat sistem tersebut.

=== Tugas

Buatlah sebuah program dengan ketentuan berikut:

+ Input Data Mahasiswa
  - Program harus meminta input nama, usia, dan nilai ratarata dari mahasiswa.
  - Nama mahasiswa harus disimpan dalam bentuk terenkripsi dengan metode geser huruf (Caesar Cipher) sebanyak 3 posisi ke depan dalam alfabet.
    Contoh:
    - 'a' menjadi 'd'
    - 'x' menjadi 'a'
    - 'z' menjadi 'c'
+ Menampilkan Data Mahasiswa
  - Program harus menampilkan daftar seluruh mahasiswa dengan format:\
    Nama (terenkripsi) | Usia | Nilai rata-rata
+ Mencari Mahasiswa Berdasarkan Nama Asli
  - Program dapat mencari mahasiswa berdasarkan nama asli (belum terenkripsi).
  - Jika ditemukan, tampilkan usia dan nilai rata-rata mahasiswa tersebut.
+ Menghitung Rata-Rata Nilai Mahasiswa
  - Program harus menghitung dan menampilkan rata-rata nilai dari seluruh mahasiswa yang telah dimasukkan.
+ Menampilkan Mahasiswa yang Lulus
  - Program harus menampilkan nama mahasiswa (terenkripsi) yang memiliki nilai rata-rata ≥ 70.
+ Menampilkan Mahasiswa Tertua dan Termuda
  - Program harus menentukan dan menampilkan mahasiswa tertua dan termuda berdasarkan usia.

#pagebreak()

== Kode Program

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```py
  # File: sistem-mahasiswa.py
  def _clear_screen() -> None:
      print("\033c", end="")

  def _space() -> None:
      print("", end="\n")

  def _prompt_to_continue() -> None:
      _space()
      _ = input("Press any key to continue...")

  def _header(text: str) -> None:
      print((len(text) + 4)* "=")
      print(text)
      print((len(text) + 4)* "=")

  def _encrypt(name: str):
        ROT: int = 3
        cipher = list(name)
        for i in range(len(cipher)):
            c: int = ord(cipher[i])
            if 'a' <= cipher[i] <= 'z':
                c = ord('a') + (c - ord('a') + ROT) % 26
            elif 'A' <= cipher[i] <= 'Z':
                c = ord('A') + (c - ord('A') + ROT) % 26
            cipher[i] = chr(c)
        cipher = "".join(cipher)
        return cipher

  class Student:
      def __init__(self, name: str, age: int, avg: float) -> None:
          self.name: str = name
          self.age: int = age
          self.avg: float = avg

      def show(self, encrypted: bool = True) -> None:
          name = _encrypt(self.name) if encrypted else self.name
          print(f"{name} | {self.age} | {self.avg}")

  data: list[Student] = []
  youngest: Student = Student("_", 999, 0)
  oldest: Student = Student("_", 0, 0)

  def _append(student: Student):
      global youngest, oldest
      data.append(student)
      if student.age < youngest.age:
          youngest = student
      if student.age > oldest.age:
          oldest = student

  def get_input() -> None:
      _clear_screen()
      _header("Input Mahasiswa Baru")

      name = input("Nama      : ")
      age = int(input("Usia      : "))
      avg = float(input("Rata-rata : "))

      student = Student(name, age, avg)
      _space()
      student.show()

      _append(student)
      _prompt_to_continue()

  def show_all_students() -> None:
      _clear_screen()
      _header("Daftar Seluruh Mahasiswa")
      global data
      for student in data:
          student.show()
      _prompt_to_continue()

  def find_by_name() -> None:
      _clear_screen()
      _header("Cari Mahasiswa")
      global data
      query = input("Input nama mahasiswa: ")

      _space()

      available = False
      for student in data:
          if query in student.name:
              available = True
              print(f"Usia: {student.age}")
              print(f"Nilai: {student.avg}")

      if (not available):
          print(f"Mohon maaf, mahasiswa a.n. {query} tidak ditemukan!")
      _prompt_to_continue()

  def show_all_average_score() -> None:
      _clear_screen()
      _header("Rata-Rata Seluruh Mahasiswa")
      global data
      total: float = 0
      for student in data:
          total += student.avg
      result = total / len(data)
      print(f"Total Keseluruhan     = {total}")
      print(f"Banyak Mahasiswa      = {len(data)}")
      print(f"Rata-rata keseluruhan = {result}")
      _prompt_to_continue()

  def show_graduated_students() -> None:
      _clear_screen()
      _header("Daftar Mahasiswa yang Lulus (Rata-rata >= 70)")
      global data

      count = 0
      for student in data:
          if student.avg >= 70:
              student.show()
              count += 1

      _space()
      print(f"Banyak mahasiswa yang lulus: {count}")
      _prompt_to_continue()

  def show_youngest_and_oldest() -> None:
      _clear_screen()
      _header("Mahasiswa Termuda dan Tertua")
      global youngest, oldest
      youngest.show()
      oldest.show()
      _prompt_to_continue()

  def main():
      while True:
          _clear_screen()
          print('''
  Sistem Database Mahasiswa
  ==========================
  Action List:
  1) Input Data Mahasiswa
  2) Menampilkan Data Mahasiswa
  3) Mencari Mahasiswa Berdasarkan Nama Asli
  4) Menghitung Rata-Rata Nilai Mahasiswa
  5) Menampilkan Mahasiswa yang Lulus
  6) Menampilkan Mahasiswa Tertua dan Termuda
  7) Exit
          ''')
          operator = int(input("Pilih action (1-7): "))
          match(operator):
              case 1: get_input()
              case 2: show_all_students()
              case 3: find_by_name()
              case 4: show_all_average_score()
              case 5: show_graduated_students()
              case 6: show_youngest_and_oldest()
              case 7: break
              case _: pass

  if __name__ == "__main__":
      main()
  ```
)

== Penjelasan

Program di atas dirancang untuk memenuhi semua kebutuhan dalam deskripsi soal "Ruang Data Mahasiswa Terenkripsi". Program ini merupakan aplikasi konsol (CLI) yang memanfaatkan konsep fungsi dan Object-Oriented Programming (OOP).

Struktur program dapat dibagi menjadi beberapa bagian utama:

+ *Fungsi Utilitas (Helper Functions)*: Terdapat beberapa fungsi yang diawali dengan garis bawah (`_`), seperti `_clear_screen()`, `_space()`, `_prompt_to_continue()`, dan `_header()`. Fungsi-fungsi ini bertugas untuk meningkatkan pengalaman pengguna (user experience) di konsol, seperti membersihkan layar, memberi jeda, dan menampilkan judul menu yang rapi.
+ *Fungsi Enkripsi*: Fungsi `_encrypt(name)` bertugas mengimplementasikan logika Caesar Cipher sesuai permintaan soal. Fungsi ini menerima nama sebagai string, menggeser setiap karakter alfabet sebanyak 3 posisi (ROT=3) dengan menggunakan operasi modulo (`% 26`) untuk menangani perputaran dari 'x', 'y', 'z', dan mengembalikan nama yang sudah terenkripsi.
+ *Class `Student`*: Class ini adalah inti dari konsep OOP dalam program. Class `Student` bertindak sebagai cetak biru (blueprint) untuk data mahasiswa.
  - Metode `__init__` (constructor) digunakan untuk menginisialisasi objek dengan atribut `name` (nama asli), `age` (usia), dan `avg` (nilai rata-rata).
  - Metode `show()` digunakan untuk menampilkan data mahasiswa. Metode ini memiliki parameter `encrypted: bool = True` yang secara default akan menampilkan nama terenkripsi (dengan memanggil `_encrypt()`).
+ *Variabel Global*: Program menggunakan beberapa variabel global:
  - `data: list[Student]`: Sebuah list kosong yang berfungsi sebagai database sederhana untuk menyimpan semua objek `Student` yang telah dibuat.
  - `youngest` dan `oldest`: Dua objek `Student` yang diinisialisasi dengan nilai ekstrem. Variabel ini digunakan untuk melacak mahasiswa termuda dan tertua secara efisien setiap kali data baru ditambahkan.
+ *Fungsi Logika Utama*: Setiap fungsi ini mewakili satu fitur yang diminta dalam soal:
  - `_append(student)`: Fungsi internal untuk menambahkan objek `student` baru ke dalam list `data`. Fungsi ini juga langsung memperbarui variabel `youngest` dan `oldest` jika diperlukan.
  - `get_input()`: Menangani fitur "Input Data Mahasiswa" (Tugas 1).
  - `show_all_students()`: Menampilkan seluruh data mahasiswa (Tugas 2).
  - `find_by_name()`: Mencari mahasiswa berdasarkan nama asli (Tugas 3).
  - `show_all_average_score()`: Menghitung rata-rata nilai seluruh mahasiswa (Tugas 4).
  - `show_graduated_students()`: Menampilkan mahasiswa yang lulus (Tugas 5).
  - `show_youngest_and_oldest()`: Menampilkan mahasiswa termuda dan tertua (Tugas 6).
+ *Fungsi `main()`*: Ini adalah fungsi utama yang menjalankan alur program. Fungsi ini berisi loop `while True` yang terus-menerus menampilkan menu utama. Struktur `match-case` (memerlukan Python 3.10+) digunakan untuk memanggil fungsi yang sesuai berdasarkan input angka dari pengguna. Program akan keluar dari loop (dan berakhir) jika pengguna memilih opsi 7.
+ *Entry Point*: Baris `if __name__ == "__main__":`  Baris ini memastikan bahwa fungsi `main()` hanya akan dieksekusi ketika file skrip ini dijalankan secara langsung, bukan saat diimpor sebagai modul oleh file lain.

== Contoh Input dan Output

// helper function
#let img(path, caption: "", width: 12cm) = [
  #figure(
    image(path, width: width),
    caption: caption,
  )
]

#img("assets/1-main_menu.png", caption: "Tampilan awal program")
#img("assets/2-input.png", caption: "Tampilan menu input mahasiswa")
#img("assets/3-list_semua.png", caption: "Tampilan daftar seluruh mahasiswa")
#img("assets/4-cari.png", caption: "Tampilan menu cari berdasarkan kueri nama")
#img("assets/5-rataan.png", caption: "Tampilan hasil hitung seluruh rata-rata mahasiswa")
#img("assets/6-list_lulus.png", caption: "Tampilan daftar mahasiswa yang lulus")
#img("assets/7-termuda_tertua.png", caption: "Tampilan mahasiswa termuda dan mahasiswa tertua")
