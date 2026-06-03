#import "@preview/zebraw:0.6.1": *
#show: zebraw

// --- Pengaturan Dokumen ---
#set page(
  paper: "a4",
  margin: (x: 2.54cm, y: 2.54cm),
  numbering: "1"
)
#set document(
  title: "Struktur Data Dasar",
  author: "Atalariq Barra Hadinugraha",
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  lang: "id",
)
#set heading(numbering: "A.")
#show heading: it => [
  #v(0.5em)
  #block(above: 1em, below: 1em)[#it]
]
#set par(
  justify: true,
)

// --- Judul ---
#align(center)[
  #text(16pt, weight: "bold")[Tugas Praktikum Struktur Data]\
  #v(0.5em)
  #text(14pt)[Sistem Manajemen Data Mahasiswa (CLI)]
]
#line(length: 100%)

// --- Isi Laporan ---

= Problem Statement

Tujuan dari tugas ini adalah membuat sebuah program yang berfungsi untuk memasukkan dan menampilkan sekumpulan data maha siswa yang terdiri dari NIM, nama mahasiswa, dan daerah asal mahasiswa dengan bahasa pemrograman Python.

= Source Code

Berikut adalah implementasi kode program:

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```py
  # helper functions
  def prompt_to_continue():
      input("\nPress any key to continue...")

  def clear_screen():
      print("\033c", end="") # ASCII code untuk membersihkan layar

  # main program
  class Student:
      def __init__(self, nim, name, origin):
          self.nim = nim
          self.name = name
          self.origin = origin

      def __str__(self):
          return f"{self.nim} | {self.name} | {self.origin}"

  def input_data(student_list: list[Student]):
      clear_screen() # bersihkan layar

      # input data NIM, nama, dan asal daerah
      nim = input("NIM: ")
      name = input("Name: ")
      origin = input("Origin: ")

      student_list.append(Student(nim, name, origin))  # tambahkan data ke list

      print("\nData Saved.")
      prompt_to_continue()

  def show_data(student_list: list[Student]):
      clear_screen() # bersihkan layar
      if not student_list: # handle jika list utama kosong
          print("No data available.")
      for mhs in student_list: # iterasi untuk menampilkan setiap data
          print(f"- {mhs}")
      prompt_to_continue()

  def main():
      student_list: list[Student] = []

      while True:
          clear_screen()
          print("""
  Students Management System
  ==========================
  Action List:
  1) Input Data Student
  2) Tampilkan Data Student
  3) Exit
          """)
          try:
              operator = int(input("Pilih action (1-3): "))
          except ValueError:
              print("\nError: Masukkan harus berupa angka (1-3).")
              prompt_to_continue()
              continue

          match operator:
              case 1:
                  input_data(student_list)
              case 2:
                  show_data(student_list)
              case 3:
                  break
              case _:
                  print("Invalid option.")

  if __name__ == "__main__":
      main()
  ```,
)

#pagebreak()

= Penjelasan

Program ini adalah sebuah aplikasi CLI untuk manajemen data mahasiswa (NIM, nama, dan daerah asal). Terdapat dua fitur utama yaitu memasukkan dan menampilkan data mahasiswa.

Berikut adalah penjelasan mengenai komponen-komponen penyusunnya:

+ *Model Data*\
  - Program menggunakan paradigma Object-Oriented Programming (OOP) sederhana dengan mendefinisikan `class Student`. Kelas ini berfungsi untuk mengenkapsulasi atribut mahasiswa (NIM, Nama, Asal) menjadi satu kesatuan objek.
  - Metode `__str__` di-override untuk menstandarisasi format tampilan data saat objek dicetak, sehingga kode utama menjadi lebih bersih dari logika formatting.
+ *Manajemen Antarmuka*\
  Untuk meningkatkan pengalaman pengguna (_User Experience_), terdapat dua fungsi utilitas:
  - `clear_screen()`: Menggunakan `ANSI escape sequence` untuk membersihkan layar terminal setiap kali menu dimuat ulang, menjaga tampilan tetap rapi.
  - `prompt_to_continue()`: Memberikan jeda interaksi agar pengguna memiliki waktu untuk membaca output program sebelum layar dibersihkan kembali.
+ *Logika Bisnis*\
  Fungsi operasional dipisahkan dari fungsi utama:
  + `input_data()`: Bertanggung jawab menangani input pengguna, membuat _instance_ objek `Student`, dan menyimpannya ke dalam struktur data `list`.
  + `show_data()`: Bertanggung jawab melakukan iterasi pada list dan menampilkan data. Fungsi ini dilengkapi validasi sederhana untuk mengecek apakah list kosong, memberikan umpan balik informatif jika belum ada data yang tersimpan.
+ *Kontrol Utama*\
  Fungsi `main()` bertindak sebagai orkestrator program dengan fitur-fitur kunci:
  + Manajemen State: Variabel `student_list` diinisialisasi di dalam lingkup lokal main untuk menjaga isolasi data (_scope safety_) dan menghindari penggunaan variabel global.
  + Penanganan Error (Error Handling): Blok `try-except ValueError` diterapkan pada input menu untuk mencegah program berhenti mendadak (_crash_) saat pengguna memasukkan karakter non-angka.
  + Navigasi Menu: Menggunakan struktur kontrol `match-case` (fitur Python 3.10+) yang menawarkan keterbacaan kode (_readability_) lebih baik dibandingkan struktur `if-elif` untuk logika pemilihan menu.

#pagebreak()

= Hasil Output

Berikut adalah simulasi tampilan program saat dijalankan di terminal:

// ---- Helper function ---
#let img(path, caption: "", width: 10cm) = [
  #figure(
    image(path, width: width),
    caption: caption,
  )
]

#img("assets/main-menu.png", caption: [Tampilan menu utama])
#img("assets/input-data.png", caption: [Fungsi input data mahasiswa])
#img("assets/show-data.png", caption: [Fungsi menampilkan data mahasiswa])
