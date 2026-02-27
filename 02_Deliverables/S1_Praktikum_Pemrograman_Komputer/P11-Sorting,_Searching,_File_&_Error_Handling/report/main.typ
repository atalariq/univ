#import "@preview/zebraw:0.5.5": *
#show: zebraw

#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2",

  mata-kuliah: "PRAKTIKUM PEMROGRAMAN KOMPUTER",
  kode-mata-kuliah: "PPK",
  nama-dosen-pengampu: "Firma Syahrian, S. Kom., M. Cs.",
  no-pertemuan: "11",

  judul-praktikum: "Searching, Sorting, Error & File Handling",
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

// ========================================================

// helper function
#let img(path, width: 10cm) = [
  #align(center)[
    #image(path, width: width)
  ]
]

// ========================================================

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

== Algoritma
Algoritma adalah inti dari pemrograman. Secara sederhana, algoritma dapat dipahami sebagai serangkaian langkah atau instruksi yang logis dan sistematis untuk menyelesaikan suatu masalah. Dalam konteks modul ini, kita fokus pada dua jenis algoritma utama: algoritma pencarian (_searching_) dan algoritma pengurutan (_sorting_).

=== Kompleksitas Algoritma
Kompleksitas algoritma adalah cara untuk mengukur seberapa efisien sebuah algoritma. Efisiensi ini biasanya diukur dari dua hal: waktu (seberapa cepat) dan ruang (seberapa banyak memori yang digunakan). Kita menggunakan notasi "Big O" untuk menggambarkannya.

Notasi Big O menunjukkan skenario terburuk (worst-case) dari sebuah algoritma seiring bertambahnya jumlah data (N).
- *$O(1)$ (Konstan):* Waktu eksekusi tetap, tidak peduli seberapa banyak datanya.
- *$O(log N)$ (Logaritmik):* Sangat efisien. Waktu bertambah sangat lambat meski data bertambah banyak. Contohnya adalah Binary Search. Setiap langkah, masalah dibagi dua.
- *$O(N)$ (Linear):* Cukup efisien. Waktu bertambah secara linear (lurus) sebanding dengan jumlah data. Contohnya adalah Linear Search, di mana kita mungkin harus mengecek setiap elemen.
- *$O(N^2)$ (Kuadratik):* Kurang efisien. Waktu bertambah secara eksponensial. Ini terjadi pada algoritma dengan perulangan bersarang (nested loop), seperti Bubble Sort dan Selection Sort.

== Sorting
Sorting adalah proses fundamental untuk mengatur sekumpulan data ke dalam urutan tertentu, baik itu urutan naik (_ascending_) maupun menurun (_descending_). Mengurutkan data seringkali menjadi langkah awal yang penting sebelum data tersebut dapat diproses lebih lanjut, misalnya sebelum melakukan Binary Search. Ada banyak teknik untuk melakukan sorting, di antaranya:

=== Bubble Sort
Bubble Sort adalah algoritma pengurutan yang paling sederhana. Idenya adalah dengan terus-menerus membandingkan dua elemen yang bersebelahan dalam list. Jika urutannya salah (misalnya, elemen kiri lebih besar dari elemen kanan dalam urutan _ascending_), maka kedua elemen tersebut ditukar posisinya. Proses ini diulang berkali-kali ("menggelembung" ke atas) sampai seluruh list terurut. Karena ia membandingkan setiap elemen dengan setiap elemen lainnya (melalui _nested loop_), kompleksitasnya adalah $O(n^2)$.

=== Selection Sort
Ide dari Selection Sort adalah mencari nilai terkecil (atau terbesar) dari bagian list yang belum terurut, lalu menukarnya dengan elemen di posisi paling depan. Proses ini dimulai dari indeks pertama. Algoritma akan memindai seluruh list untuk menemukan nilai terkecil, lalu menukarnya dengan elemen di indeks 0. Kemudian, ia pindah ke indeks 1, mencari nilai terkecil dari sisa list (indeks 1 sampai akhir), dan menukarnya dengan elemen di indeks 1. Ini diulang terus-menerus. Sama seperti Bubble Sort, algoritma ini juga memiliki kompleksitas $O(n^2)$ karena memerlukan perulangan bersarang untuk mencari nilai terkecil.

== Searching
Searching (pencarian) adalah teknik untuk menemukan suatu nilai tertentu di dalam sekumpulan data atau list. Tujuan utamanya adalah untuk memverifikasi apakah nilai tersebut ada, dan jika ada, di mana lokasinya (indeksnya). Secara umum, ada dua kategori besar algoritma pencarian:

=== Linear Search
Linear Search, atau _Sequential Search_, adalah metode pencarian yang paling dasar. Cara kerjanya adalah dengan memeriksa setiap elemen dalam list satu per satu, dimulai dari indeks paling awal (indeks 0). Jika elemen yang diperiksa sama dengan nilai yang dicari, pencarian berhenti dan mengembalikan indeks elemen tersebut. Jika tidak sama, pencarian berlanjut ke elemen berikutnya. Jika sampai akhir list nilai tidak ditemukan, program biasanya mengembalikan nilai penanda, seperti -1. Karena dalam skenario terburuk kita harus mengecek seluruh N elemen, kompleksitasnya adalah $O(N)$.

=== Binary Search
Binary Search, atau _Interval Search_, adalah metode pencarian yang jauh lebih efisien daripada Linear Search, namun memiliki satu syarat mutlak: data *harus* sudah dalam keadaan terurut.

Prinsip kerjanya adalah "bagi dan taklukkan" (_divide and conquer_). Algoritma ini pertama-tama memeriksa elemen yang ada di tengah list.
1.  Jika elemen tengah sama dengan nilai yang dicari, pencarian selesai.
2.  Jika nilai yang dicari lebih besar dari elemen tengah, algoritma mengabaikan seluruh setengah bagian kiri list dan mengulangi pencarian hanya di setengah bagian kanan.
3.  Jika nilai yang dicari lebih kecil dari elemen tengah, algoritma mengabaikan seluruh setengah bagian kanan dan mengulangi pencarian hanya di setengah bagian kiri.

Proses ini diulang terus-menerus, di mana "list" pencarian diperkecil setengahnya setiap langkah. Karena itu, kompleksitasnya sangat cepat, yaitu $O(log N)$.

== Error Handling
Saat menulis kode, kesalahan tidak dapat dihindari. Kesalahan ini bisa berupa kesalahan penulisan sintaks (_Syntax Error_) atau kesalahan logika saat program berjalan (_Exceptions_). _Syntax Error_ harus diperbaiki secara manual, namun _Exceptions_ (seperti membagi dengan nol atau salah tipe data) dapat kita antisipasi dan tangani.

Di Python, kita menggunakan blok `try...except` untuk mengelola _exceptions_.
-   `try`: Blok ini berisi kode yang "dicoba" untuk dijalankan, yang berpotensi menimbulkan _exception_.
-   `except`: Blok ini berisi kode yang akan dijalankan *hanya jika* terjadi _exception_ di dalam blok `try`. Kita bisa menangkap _exception_ spesifik (seperti `ValueError`) atau _exception_ umum.
-   `else`: Blok ini opsional, dan akan dijalankan *hanya jika* tidak ada _exception_ yang terjadi di blok `try`.
-   `finally`: Blok ini juga opsional, dan akan *selalu* dijalankan, baik terjadi _exception_ maupun tidak.

=== Macam-Macam Exception
Python memiliki banyak jenis _exception_ bawaan. Mengetahui jenisnya membantu kita menangani kesalahan secara lebih spesifik. Beberapa _exception_ yang paling sering ditemui antara lain:

-   `IndentationError`: Terjadi ketika ada kesalahan indentasi (spasi/tab di awal baris).
-   `TypeError`: Terjadi ketika operasi dilakukan pada tipe data yang tidak sesuai. Misalnya, mencoba membagi string dengan integer atau menjumlahkan string dengan integer.
-   `ValueError`: Terjadi ketika sebuah fungsi menerima argumen dengan tipe yang benar, tetapi nilainya tidak pantas. Contohnya, `int("aku")` akan memicu `ValueError` karena string "aku" tidak bisa dikonversi ke angka.
-   `ZeroDivisionError`: Terjadi ketika ada operasi pembagian dengan angka nol.
-   `NameError`: Terjadi ketika kita mencoba menggunakan variabel atau fungsi yang belum didefinisikan.
-   `IndexError`: Terjadi ketika kita mencoba mengakses indeks list yang berada di luar jangkauan (misalnya, mengakses indeks ke-10 dari list yang hanya punya 5 elemen).
-   `FileNotFoundError`: Terjadi dalam _file handling_ jika kita mencoba membuka file yang tidak ada dalam mode baca.

== File Handling
_File handling_ merujuk pada proses mengelola file pada sistem komputer, seperti membuat, membaca, memperbarui, dan menghapus file. File adalah unit penyimpanan data permanen di perangkat, yang memungkinkan data tetap tersimpan bahkan setelah komputer dimatikan.

Operasi dasar pada file di Python adalah:
1.  *Membuka File*: Menggunakan fungsi `open(nama_file, mode)`. Argumen `mode` sangat penting, misalnya "r" untuk membaca (_read_), "w" untuk menulis (_write_, akan menimpa file lama), "a" untuk menambah (_append_, menulis di akhir file), dan "r+" untuk membaca sekaligus menulis. Mode juga bisa digabung dengan "t" untuk teks (default) atau "b" untuk biner.
2.  *Memproses File*:
    -   *Membaca*: Setelah dibuka, kita bisa menggunakan `read()` (baca semua), `readline()` (baca satu baris), atau `readlines()` (baca semua baris dan simpan sebagai list).
    -   *Menulis*: Untuk mode "w", "a", atau "r+", kita bisa menggunakan `write()` untuk menulis string ke file.
3.  *Menutup File*: Setelah selesai, file harus ditutup menggunakan `file.close()`. Praktik yang lebih baik adalah menggunakan `with open(...) as f:`, yang akan menutup file secara otomatis, bahkan jika terjadi error.
4.  *Menghapus File*: Untuk menghapus file, kita perlu mengimpor modul `os` dan menggunakan fungsi `os.remove(nama_file)`.

#pagebreak()

= Hasil dan Pembahasan

== Latihan 1

Buatlah program untuk mengurutkan daftar nama orang. Diinputkan 5 buah nama orang. Outputkan nama-nama tersebut terurut secara leksikografis (terurut seperti di kamus).

Contoh input:
#zebraw(
  numbering: false,
  ```
  budi
  alam
  nana
  ardi
  neil
  ```
)
Contoh output:
#zebraw(
  numbering: false,
  ```
  alam
  ardi
  budi
  nana
  neil
  ```
)

=== Kode Program

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```py
  names: list[str] = [name for name in input().split()]

  names.sort()

  for name in names:
      print(name)
  ```
)

=== Penjelasan

Program ini dirancang untuk menerima 5 nama, mengurutkannya, lalu menampilkannya. Sesuai contoh input, program ini mengasumsikan kelima nama diinputkan dalam satu baris, dipisahkan oleh spasi.

+ Baris 1: Kode `input().split()` akan membaca satu baris teks dari pengguna dan memecahnya menjadi sebuah list berdasarkan spasi. _List comprehension_ `[name for name in ...]` kemudian digunakan untuk membuat list baru bernama names dari hasil pemecahan tersebut.
+ Baris 3: Ini adalah inti dari program. Method `names.sort()` dipanggil. Ini adalah fungsi sorting bawaan Python yang akan mengurutkan list names secara in-place (mengubah list aslinya). Untuk tipe data string, `sort()` akan mengurutkan secara leksikografis (alfabetis), sesuai dengan permintaan soal.
+ Baris 5-6: Sebuah loop `for` digunakan untuk iterasi melalui setiap `name` di dalam list `names` yang kini sudah terurut. Perintah `print(name)` akan mencetak setiap nama dalam baris baru, menghasilkan output yang sesuai

=== Output

#img("assets/l1.png")

== Latihan 2

Diberikan file ktp_tmp_01.txt yang berisikan data informasi KTP yang belum lengkap dari seorang bernama Labubu. Konten dari file ktp_tmp_01.txt adalah sebagai berikut.

#zebraw(
  numbering: false,
  ```
  NIK: 9504030101240003
  NAMA: Zhazha Zalabubu
  TEMPAT/TGL LAHIR: WAMENA, 1 Januari 2024
  ALAMAT: TAMAN SAFARI DJUANDA
  PEKERJAAN: PELAJAR/MAHASISWA
  ```
)

Tambahkan 1 baris setelah baris ALAMAT yang berisikan STATUS PERKAWINAN! (Isi atau nilai dari status perkawinan dibuat sekreatif mungkin, contoh: Sudah Menikah dengan Mark Lee)

=== Kode Program

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```py
  with open("ktp_tmp_01.txt", "r") as f:
      lines = f.readlines()
      f.close()

  modified: list[str] = []
  for line in lines:
      modified.append(line)

      if(line.strip().startswith("STATUS PERKAWINAN")):
          continue

      if(line.strip().startswith("ALAMAT")):
          modified.append("STATUS PERKAWINAN: Menikah dengan Lil Bahlil\n")

  with open("ktp_tmp_01.txt", "w") as f:
      lines = f.writelines(modified)
      f.close()
  ```
)

=== Penjelasan

Program ini memodifikasi file ktp_tmp_01.txt dengan membaca isinya terlebih dahulu, memanipulasinya dalam memori, lalu menuliskannya kembali ke file yang sama.

+ Baris 1-3: Program membuka file `ktp_tmp_01.txt` dalam mode "r" (read). Fungsi `f.readlines()` digunakan untuk membaca seluruh isi file dan menyimpannya sebagai list of strings (setiap baris adalah satu elemen) ke dalam variabel `lines`.
+ Baris 5: Sebuah list kosong bernama `modified` disiapkan untuk menampung baris-baris file yang sudah dimodifikasi.
+ Baris 6-13: Program melakukan iterasi pada setiap line di dalam list lines yang didapat dari file.
+ Baris 7: Setiap baris asli (`line`) langsung ditambahkan ke list `modified`.
+ Baris 9-10: Terdapat pengecekan untuk mencegah duplikasi. Jika baris "STATUS PERKAWINAN" sudah ada (misalnya jika program dijalankan dua kali), baris itu akan dilewati.
+ Baris 12-13: Program memeriksa apakah baris saat ini (`line`), setelah dihilangkan spasi kosong di awal/akhirnya (`.strip()`), dimulai dengan kata "ALAMAT". Jika iya, program segera menambahkan baris baru `"STATUS PERKAWINAN: ...\n"` ke dalam list `modified`. Ini memastikan baris baru tersebut disisipkan tepat setelah baris ALAMAT.
+ Baris 15-17: Terakhir, program membuka kembali file `ktp_tmp_01.txt`, namun kali ini dalam mode "w" (write). Mode "w" akan menghapus isi file yang lama. Fungsi `f.writelines(modified)` kemudian menulis seluruh konten dari list modified ke dalam file tersebut, sehingga file kini berisi data yang telah diperbarui.

=== Output

#img("assets/l2.png")

== Quiz 1

Buatlah aplikasi sederhana dengan Command Line Interface untuk menyimpan data nilai suatu kelas. Data dipisah menjadi 3 list yaitu `nama`, `nilai_matkul_1`, `nilai_matkul_2`. Buatlah beberapa fungsi yang dapat dilakukan pada aplikasi tersebut:

- Menambahkan nama beserta kedua nilai matkulnya (gunakan error handling terhadap inputannya)
- Mengurutkan nilai rata-rata dari kedua nilai matkul (hasil pengurutan juga akan menampilkan namanya)
- Mencari sebuah nilai rata-rata (apabila nilai rata-rata yang dicari tidak ada maka berikan keterangan "tidak ada", dan jika nilai rata-rata ada yang sama maka ditampilkan semuanya)

=== Kode Program

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```py
  # Helper Function =========================================
  def _clear_screen() -> None:
      print("\033c", end="")

  def _prompt_to_continue() -> None:
      _ = input("\nPress any key to continue...")

  def _header(text: str) -> None:
      print((len(text) + 4)* "=")
      print(text)
      print((len(text) + 4)* "=")
      print()

  # =========================================================

  class Student:
      def __init__(self, nama: str, nilai_1: int, nilai_2: int):
          self.nama: str = nama
          self.nilai_1: int = nilai_1
          self.nilai_2: int = nilai_2
          self.rataan: int = (nilai_1 + nilai_2) // 2

      def __str__(self):
          return f"{self.nama} | {self.nilai_1} | {self.nilai_2} | {self.rataan}"

  data: list[Student] = []
  isSorted = False

  def add_data():
      _clear_screen()
      _header("Input Data Baru")

      global isSorted
      isSorted = False

      try:
          nama = input("Nama: ")
          # Tambahan: Memastikan nama tidak kosong
          if not nama:
              raise ValueError("Nama tidak boleh kosong.")

          nilai_1 = int(input("Nilai 1: "))
          nilai_2 = int(input("Nilai 2: "))

          student = Student(nama, nilai_1, nilai_2)
          data.append(student)
          print(student)

      except ValueError as e: # 'e' akan berisi pesan errornya
          print(f"\nError: Input tidak valid. ({e})")
          print("Pastikan nilai adalah angka dan nama tidak kosong.")

      _prompt_to_continue()

  def sort_avg():
      _clear_screen()
      _header("Sort By Average")

      global isSorted
      isSorted = True

      data.sort(key=lambda student: student.rataan)
      for student in data:
          print(student)

      _prompt_to_continue()

  def find_by_avg():
      _clear_screen()
      _header("Find By Average")

      # 1. Menangani list kosong
      if not data:
          print("Data masih kosong. Silakan input data terlebih dahulu.")
          _prompt_to_continue()
          return

      global isSorted
      if not isSorted:
          print("Data belum terurut. Mengurutkan data terlebih dahulu...")
          sort_avg() # Panggil sort secara otomatis
          return

      # 2. Menangani input non-angka
      try:
          query = int(input("Query: "))
      except ValueError:
          print("\nError: Rata-rata yang dicari harus berupa angka.")
          _prompt_to_continue()
          return

      found = False
      low = 0
      high = len(data) - 1

      while(low <= high):
          mid = (high + low ) // 2

          if data[mid].rataan == query:
              found = True
              print(data[mid])

              # 1. Cek ke kiri dari 'mid'
              i = mid - 1
              while i >= 0 and data[i].rataan == query:
                  print(data[i])
                  i -= 1

              # 2. Cek ke kanan dari 'mid'
              i = mid + 1
              while i < len(data) and data[i].rataan == query:
                  print(data[i])
                  i += 1
              break
          elif data[mid].rataan < query:
              low = mid + 1
          else:
              high = mid - 1

      # Kalau data tidak ditemukan
      if not found:
          print("Hasil tidak ditemukan")

      _prompt_to_continue()

  def main():
      while True:
          _clear_screen()
          print('''
  Class Management System
  ==========================
  Action List:
  1) Input Data Mahasiswa
  2) Urutkan Rata-Rata
  3) Cari Berdasarkan Rata-Rata
  4) Exit
          ''')
          try:
              operator = int(input("Pilih action (1-4): "))
          except ValueError:
              print("\nError: Masukkan harus berupa angka (1-4).")
              _prompt_to_continue()
              continue

          match(operator):
              case 1: add_data()
              case 2: sort_avg()
              case 3: find_by_avg()
              case 4: break
              case _: pass

  if __name__ == "__main__":
      main()
  ```
)

=== Penjelasan

Program ini menggunakan sebuah class `Student` untuk membungkus data `nama`, `nilai_1`, `nilai_2`, dan `rataan` (rata-rata) dalam satu objek. Sebuah list global `data` digunakan untuk menyimpan semua objek `Student`.

+ Fungsi `add_data()` (Menu 1): Fungsi ini memenuhi kebutuhan untuk menambahkan data. Ia meminta input dari pengguna untuk nama dan dua nilai, membuat objek Student baru, lalu menambahkannya ke list `data`.
+ Fungsi sort_avg() (Menu 2): Fungsi ini mengurutkan list data berdasarkan nilai `rata-rata` (rataan). Ini menggunakan method `sort()` bawaan Python. Argumen `key=lambda student: student.rataan` memberi tahu fungsi sort untuk mengurutkan list objek tersebut berdasarkan atribut rataan dari setiap objek.
+ Fungsi `find_by_avg()` (Menu 3): Fungsi ini mengimplementasikan algoritma Binary Search untuk mencari data berdasarkan nilai rata-rata.
  - Peringatan: Algoritma ini wajib dijalankan pada data yang sudah terurut. Pengguna harus menjalankan Menu 2 (Sort) sebelum menjalankan Menu 3 agar pencarian berhasil.
  - Cara kerjanya adalah dengan mengambil `query` (rata-rata yang dicari). Ia mengatur batas `low` (0) dan `high` (indeks terakhir).
  - Selama `low <= high`, ia menghitung `mid` (indeks tengah).
  - Ia membandingkan `data[mid].rataan` dengan `query`. Jika cocok, data ditemukan. Jika `query` lebih besar, ia menggeser `low` ke `mid + 1` (cari di setengah kanan). Jika `query` lebih kecil, ia menggeser `high` ke `mid - 1` (cari di setengah kiri).
  - Jika loop selesai dan `found` masih False, maka "Hasil tidak ditemukan" akan dicetak, sesuai permintaan.

=== Output

#img("assets/q1_1.png")
#img("assets/q1_2.png")
#img("assets/q1_3.png")
#img("assets/q1_4.png")

== Quiz 2

Buatlah aplikasi sederhana dengan Command Line Interface (terminal) untuk membantu menyimpan data KTP seperti pada latihan 1!

Kriteria:
- Data KTP disimpan dalam bentuk txt (1 file 1 data ktp). (_write_)
- Dapat melihat data KTP di terminal. (_read_)
- Dapat menghapus data KTP yang diinginkan. (_delete_)

Gunakan fungsi `listdir()` dari modul `os` untuk mendapatkan daftar file yang ada di direktori (_project_) yang digunakan.
Contoh penggunaan:
#zebraw(
  numbering: false,
  ```py
  print(os.listdir('latihan'))
  ```
)

Fungsi tersebut akan menampilkan seluruh nama file atau nama folder yang ada di folder latihan. Hal tersebut dapat digunakan untuk membantu user menginputkan nama file data ktp yang ingin dihapus.

=== Kode Program

#zebraw(
  numbering: true,
  numbering-separator: true,
  ```py
    # Helper Function =========================================

  def _clear_screen() -> None:
      print("\033c", end="")

  def _prompt_to_continue() -> None:
      _ = input("Press any key to continue...")

  def _header(text: str) -> None:
      print((len(text) + 4)* "=")
      print(text)
      print((len(text) + 4)* "=")
      print()

    # =========================================================

  import os

  DIR = "./DATA-KTP"

  try:
      os.mkdir(DIR)
  except FileExistsError:
      pass

  def _list_ktp():
      print("Daftar KTP tersimpan:")
      files = os.listdir(DIR)
      if not files:
          print("[Kosong... Tidak ada data ktp yang tersimpan]")
      else:
          for f in files:
              print(f"- {f}")
      print()

  def add_ktp():
      _clear_screen()
      _header("Input Data KTP Baru")

      nama = input("Nama: ")

      file_content = f'''
  NIK: {input("NIK: ")}
  NAMA: {nama}
  TEMPAT/TGL LAHIR: {input("Tempat, Tanggal Lahir: ")}
  ALAMAT: {input("Alamat: ")}
  STATUS PERKAWINAN: {input("Status Perkawinan: ")}
  PEKERJAAN: {input("Pekerjaan: ")}
      '''

      file = f"{DIR}/{nama.lower().replace(' ', '_')}.txt"
      with open(file, "w") as f:
          _ = f.write(file_content)
          f.close()

      _prompt_to_continue()

  def read_ktp():
      _clear_screen()
      _header("Baca Data KTP")
      _list_ktp()

      try:
          nama_file = input('File ktp (tanpa ekstensi .txt): ')
          file = f"{DIR}/{nama_file}.txt"
          
          with open(file, "r") as f:
              print("\n--- Isi File ---")
              print(f.read())
              print("----------------")
      except FileNotFoundError:
          print(f"\nError: File '{nama_file}.txt' tidak ditemukan.")
      except Exception as e:
          print(f"\nTerjadi error: {e}")

      _prompt_to_continue()

  def delete_ktp():
      _clear_screen()
      _header("Hapus KTP")
      _list_ktp()

      try:
          nama_file = input('File ktp (tanpa ekstensi .txt): ')
          file = f"{DIR}/{nama_file}.txt"

          os.remove(file)
          print(f"\nFile '{nama_file}.txt' berhasil dihapus.")
      except FileNotFoundError:
          print(f"\nError: File '{nama_file}.txt' tidak ditemukan.")
      except Exception as e:
          print(f"\nTerjadi error lain: {e}")

      _prompt_to_continue()

  def main():
      while True:
          _clear_screen()
          print('''
  KTP Management System
  ==========================
  Action List:
  1) Tambah/Update Data KTP
  2) Baca Data KTP
  3) Hapus Data KTP
  4) Exit
          ''')

          try:
              operator = int(input("Pilih action (1-4): "))
              match(operator):
                  case 1: add_ktp()
                  case 2: read_ktp()
                  case 3: delete_ktp()
                  case 4: break
                  case _:
                      print("\nError: Pilihan tidak valid.")
                      _prompt_to_continue()
          except ValueError:
              print("\nError: Masukkan harus berupa angka (1-4).")
              _prompt_to_continue()


  if __name__ == "__main__":
      main()
  ```
)

=== Penjelasan

Program ini adalah aplikasi CLI yang menggunakan modul os untuk berinteraksi dengan sistem file, memenuhi semua kriteria.

+ Program pertama-tama mengimpor modul `os`. Ia lalu mencoba membuat direktori `DATA-KTP/` menggunakan `os.mkdir()`. Ini dibungkus `try-except FileExistsError` agar program tidak crash jika direktori tersebut sudah ada.
+ Fungsi `add_ktp()` (Menu 1): Fungsi ini untuk write data. Ia meminta semua data KTP dari pengguna. Nama file dibuat secara otomatis berdasarkan nama pengguna (misal: "Zhazha Zalabubu" menjadi "zhazha_zalabubu.txt"). Fungsi `open()` dipanggil dengan mode "w" (write), yang akan membuat file baru atau menimpa file lama dengan nama yang sama. Konten data KTP kemudian ditulis ke file tersebut.
+ Fungsi `read_ktp()` (Menu 2): Fungsi ini untuk read data. Sesuai petunjuk, fungsi `_list_ktp()` (yang menggunakan `os.listdir()`) dipanggil terlebih dahulu untuk menunjukkan file apa saja yang tersedia. Pengguna memasukkan nama file, lalu program membukanya menggunakan mode "r" (read). Method `f.read()` digunakan untuk membaca seluruh isi file dan menampilkannya ke terminal. Fungsi ini juga memiliki `try-except` untuk menangani `FileNotFoundError`.
+ Fungsi `delete_ktp()` (Menu 3): Fungsi ini untuk delete data. Sama seperti read_ktp, ia menampilkan daftar file terlebih dahulu. Setelah pengguna memilih file, program memanggil `os.remove(file)` untuk menghapus file tersebut dari direktori. Blok `try-except` juga digunakan di sini untuk menangani jika pengguna salah memasukkan nama file.

=== Output

#img("assets/q2_1.png")
#img("assets/q2_2.png")
#img("assets/q2_3.png")
#img("assets/q2_4.png")

