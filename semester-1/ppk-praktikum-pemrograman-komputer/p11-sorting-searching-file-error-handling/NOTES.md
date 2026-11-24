# Pertemuan 11: Sorting, Searching, File, dan Error Handling

Folder ini memuat dua modul yang saling melengkapi. Modul sorting membahas lima algoritma pengurutan beserta ilustrasi langkahnya. Bubble sort membandingkan dua elemen bersebelahan dan menukarnya bila urutannya terbalik, lalu mengulang sampai seluruh elemen tersusun (hlm. 2-5). Selection sort mencari elemen terkecil pada bagian yang belum terurut dan menempatkannya di sisi kiri (hlm. 7-10). Insertion sort menyisipkan elemen satu per satu ke posisi yang tepat dalam bagian yang sudah terurut (hlm. 14-21). Merge sort memakai strategi divide-and-conquer: list dibagi menjadi dua, diurutkan secara rekursif, lalu digabung (hlm. 23-33). Quick sort juga membagi list, tetapi berdasarkan pivot, dan modul menyebut empat pilihan pivot: elemen pertama, terakhir, acak, atau median (hlm. 34-36). Bagian partisi dijelaskan dengan menukar elemen yang lebih besar dari pivot di sisi kiri dengan elemen yang lebih kecil di sisi kanan (hlm. 37-42). Praktikum meminta implementasi algoritma tersebut, pengukuran kecepatannya, dan penarikan kesimpulan (hlm. 44).

Modul kedua membahas searching, sorting, error handling, dan file handling. Pencarian dibagi dua: sequential search seperti linear search yang memeriksa semua elemen dengan kompleksitas O(N), dan interval search seperti binary search yang menuntut data sudah terurut dan bekerja dengan membelah ruang pencarian sehingga kompleksitasnya O(log N) (hlm. 1-3). Sorting diulang secara ringkas dengan tabel visualisasi bubble dan selection sort, keduanya berkompleksitas O(n^2) (hlm. 3-5). Error handling membedakan syntax error yang tidak dapat ditangani dari exception yang dapat ditangani. Exception seperti TypeError, NameError, dan ValueError diatasi dengan `try` dan `except`, dilengkapi `else` untuk kondisi tanpa kesalahan serta `finally` yang selalu dijalankan; urutan except harus dari yang paling spesifik ke yang paling umum (hlm. 5-7).

File handling menjelaskan file sebagai unit penyimpanan permanen beserta strukturnya, yaitu filename, extension, content, dan metadata (hlm. 8). File dibuka dengan `open()` yang mode default-nya "rt", dan sebaiknya ditutup dengan `close()` atau lewat `with` agar penutupan otomatis termasuk saat terjadi error (hlm. 8-9). Pembacaan memakai `read()`, `readline()`, atau `readlines()`, penulisan memakai `write()` dan dapat dipindahkan dengan `seek()`, sedangkan penghapusan memakai `os.remove()` (hlm. 9-10). Latihan meminta pengurutan lima nama secara leksikografis dan penambahan satu baris pada berkas data KTP, sedangkan quiz meminta aplikasi CLI untuk menyimpan nilai kelas serta aplikasi data KTP dengan `os.listdir()` (hlm. 10-12).

## Poin kunci

- Bubble sort menukar elemen bersebelahan yang salah urutan (hlm. 2-5).
- Selection sort memilih nilai terkecil lalu menempatkannya di kiri (hlm. 7-10).
- Insertion sort menyisipkan elemen ke posisi yang tepat pada bagian terurut (hlm. 14-21).
- Merge sort dan quick sort sama-sama divide-and-conquer, bedanya quick sort memakai pivot (hlm. 23-42).
- Linear search O(N) tanpa syarat urutan, binary search O(log N) dengan syarat data terurut (hlm. 1-3).
- `try`/`except`/`else`/`finally` menangani exception dengan urutan dari spesifik ke umum (hlm. 5-7).
- `with open(...)` menutup file otomatis, termasuk ketika terjadi error (hlm. 9).

## Istilah

- sorting: proses mengurutkan data menaik atau menurun.
- divide-and-conquer: strategi membagi masalah menjadi bagian lebih kecil.
- pivot: elemen acuan pembagi list pada quick sort.
- partitioning: proses memisahkan elemen berdasarkan pivot.
- sequential search: pencarian dengan memeriksa elemen satu per satu.
- binary search: pencarian dengan membelah ruang pencarian pada data terurut.
- kompleksitas: ukuran pertumbuhan waktu proses terhadap banyak data.
- exception: kesalahan saat program berjalan yang dapat ditangani.
- syntax error: kesalahan penulisan yang membuat program tidak dapat dijalankan.
- mode file: penentu operasi yang diizinkan pada file, seperti baca atau tulis.
- metadata: informasi tambahan tentang file, seperti ukuran dan tanggal.

## Sumber

- `modul-10-sorting.local.pdf`, hlm. 1-44
- `modul-11-searching-sorting-error-dan-file-handling.local.pdf`, hlm. 1-13
