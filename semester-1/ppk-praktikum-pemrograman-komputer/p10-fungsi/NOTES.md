# Pertemuan 10: Fungsi

Modul ini cukup panjang dan terbagi menjadi beberapa bagian: function, recursive function, lambda, closure, class, dan parallelism. Function didefinisikan sebagai sekumpulan blok kode yang menjalankan operasi tertentu, dan dideklarasikan dengan `def` diikuti nama, tanda kurung, titik dua, serta blok yang menjorok (hlm. 1-3). Pemakaian function membuat program terstruktur, dapat dipakai ulang, mudah dibaca, dan mudah dirawat karena perbaikan cukup dilakukan pada satu tempat (hlm. 2).

Pada pemanggilan function dikenal argumen dan parameter: parameter adalah variabel pada definisi, sedangkan argumen adalah nilai yang dikirim saat pemanggilan (hlm. 3-4). Jumlah argumen yang tidak tetap ditangani dengan tanda bintang di depan parameter, sehingga nilainya dapat diakses lewat perulangan (hlm. 4). Default parameter memberi nilai cadangan bila argumen tidak dikirim, dengan aturan bahwa parameter berdefault harus berada di posisi terakhir (hlm. 5-6). Keyword parameter memungkinkan penyebutan nama parameter saat memanggil sehingga urutan tidak lagi penting, berbeda dengan positional argument yang bergantung pada urutan (hlm. 7-8). `return` mengembalikan hasil dan bahkan dapat mengembalikan beberapa nilai dalam bentuk tuple (hlm. 8-9).

Recursive function adalah function yang memanggil dirinya sendiri, dengan contoh utama faktorial dan syarat berhenti ketika n bernilai satu atau kurang (hlm. 9-11). Lambda adalah fungsi tanpa nama yang hanya berisi satu ekspresi, dan sering dipakai bersama `filter()`, `map()`, serta `reduce()` dari modul functools (hlm. 11-15). Closure muncul dari nested function yang tetap menyimpan variabel outer function-nya, sehingga dapat membatasi pemakaian variabel global dan menyembunyikan data (hlm. 15-19).

Bagian berikutnya membahas class dan objek: perbedaan class sebagai blueprint dengan instance sebagai objek nyata, method dan kata kunci `self`, constructor `__init__`, perbedaan instance variable dan class variable, inheritance, polymorphism, encapsulation lewat satu atau dua garis bawah, serta abstraction memakai modul abc (hlm. 19-35). Modul ditutup dengan concurrency dan parallelism, yang dijelaskan lewat perbedaan `threading` untuk concurrency dan `multiprocessing` untuk parallelism, termasuk pengaruh Global Interpreter Lock (hlm. 36-41). Soal praktikum pada halaman 41-44 meminta implementasi function dasar, argumen, argumen tak terbatas, faktorial rekursif, lambda dengan map, closure penghitung, class, inheritance, polymorphism, dan threading.

## Poin kunci

- Function dideklarasikan dengan `def` dan blok yang terindentasi (hlm. 1-3).
- Parameter ada pada definisi, argumen dikirim saat pemanggilan (hlm. 3-4).
- `*args` menampung jumlah argumen yang tidak tetap (hlm. 4).
- Default parameter harus diletakkan di posisi terakhir (hlm. 5-6).
- `return` dapat mengembalikan lebih dari satu nilai sebagai tuple (hlm. 8-9).
- Recursive function wajib punya kondisi berhenti (hlm. 9-11).
- `threading` untuk concurrency dan `multiprocessing` untuk parallelism (hlm. 36-41).

## Istilah

- parameter: variabel pada definisi function.
- argumen: nilai yang dikirim saat function dipanggil.
- arbitrary argument: argumen dengan jumlah tidak tetap, ditandai tanda bintang.
- default parameter: nilai cadangan bila argumen tidak diberikan.
- keyword parameter: argumen yang disebut berdasarkan nama parameternya.
- recursive function: function yang memanggil dirinya sendiri.
- lambda: function tanpa nama dengan satu ekspresi.
- closure: nested function yang tetap menyimpan variabel outer function.
- instance: objek yang dibuat dari sebuah class.
- inheritance: pewarisan sifat class induk kepada class anak.
- polymorphism: method bernama sama dengan perilaku berbeda pada class berbeda.
- encapsulation: pembatasan akses atribut lewat konvensi garis bawah.
- GIL: mekanisme yang membatasi eksekusi thread Python pada satu inti.

## Sumber

- `modul-8-function.local.pdf`, hlm. 1-44
