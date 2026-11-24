# Pertemuan 8: Fungsi rekursif, class, dan modul

Fungsi rekursif didefinisikan sebagai fungsi yang memanggil dirinya sendiri. Jika diimplementasikan dengan tepat, fungsi ini bisa sangat efisien (hlm. 2). Deck kemudian menampilkan contoh dan poin penting, lalu memberikan lima latihan rekursif beserta proses penyelesaiannya (hlm. 3-11). Sayangnya contoh dan latihan pada bagian ini sebagian besar berupa gambar, sehingga teks yang terbaca dari PDF hanya judul dan arahan.

Bagian class menjelaskan bahwa Python adalah bahasa berorientasi objek. Objek didefinisikan dalam sebuah konstruktor yang disebut class, dan di dalam class dapat didefinisikan variabel atau atribut serta fungsi (hlm. 13). Class dideklarasikan dengan kata kunci class. Contoh class Mahasiswa memiliki konstruktor yang dipanggil saat inisialisasi, fungsi __str__ yang mengembalikan representasi string, dan fungsi yang dapat dipanggil dari instance (hlm. 14-15). Parameter self pada konstruktor adalah referensi ke instance class yang dibuat (hlm. 15). Instance dibuat dengan memanggil class beserta konstruktornya, dan nilai properti dapat diubah atau dihapus (hlm. 16-17).

Atribut dan method secara default melekat pada instance. Class variable dan class method berbeda karena melekat pada class sehingga dapat dipakai tanpa membuat instance. Class variable didefinisikan di luar fungsi di dalam class, sedangkan class method memakai decorator @classmethod dan dapat mengakses class variable (hlm. 18-20). Inheritance dipakai untuk membuat class baru yang mewarisi atribut dan fungsi class lain. Class yang mewariskan disebut parent class, sedangkan penerimanya disebut child class (hlm. 21). Contoh MahasiswaPasca memanggil konstruktor parent lewat super() dan meng-override fungsi __str__; jika tidak di-override, fungsi milik parent yang dijalankan (hlm. 22-23).

Modul atau pustaka adalah file berisi kumpulan class dan fungsi yang bisa dipakai di program Python lain. Modul dibuat sebagai file .py dan dipanggil dengan import, serta dapat diberi alias memakai as (hlm. 24). Sebuah class juga dapat dijadikan modul, seperti contoh file krs.py, lalu diimpor dengan cara yang sama (hlm. 25-26).

## Poin kunci

- Fungsi rekursif adalah fungsi yang memanggil dirinya sendiri (hlm. 2).
- Class mendefinisikan objek dan dapat berisi atribut serta fungsi (hlm. 13).
- Konstruktor dipanggil saat class diinisialisasi, dan self merujuk pada instance (hlm. 14-15).
- __str__ mengembalikan representasi string dari objek (hlm. 14).
- Class variable dan class method melekat pada class, bukan pada instance (hlm. 18-20).
- Inheritance membuat child class mewarisi atribut dan method parent class (hlm. 21).
- Modul adalah file .py berisi class dan fungsi yang diimpor dengan import (hlm. 24).

## Istilah

- Recursion: teknik fungsi memanggil dirinya sendiri.
- Class: blueprint atau konstruktor yang mendefinisikan objek.
- Instance: objek yang dibuat dari sebuah class.
- Constructor: fungsi yang dijalankan saat class diinisialisasi.
- Attribute: variabel yang melekat pada class atau instance.
- Method: fungsi yang didefinisikan di dalam class.
- self: referensi ke instance class yang sedang dipakai.
- Class variable: variabel yang melekat pada class.
- Inheritance: pewarisan atribut dan method dari parent ke child class.
- Module: file Python berisi kumpulan class dan fungsi.

## Sumber

- `2025-09-29-08-alpro.local.pdf`, hlm. 2-26
