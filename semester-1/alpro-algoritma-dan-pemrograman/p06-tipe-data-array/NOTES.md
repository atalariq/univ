# Pertemuan 6: Tipe data array

Array atau larik didefinisikan sebagai struktur data yang menyimpan sekumpulan elemen bertipe sama, diakses lewat indeks, dan bersifat statis. Jumlah elemennya harus diketahui sebelum program dieksekusi dan tidak dapat diubah selama program berjalan (hlm. 2). Indeks harus bertipe yang menyatakan keterurutan, misalnya integer atau karakter (hlm. 2). Pada C++, deklarasi array menentukan banyaknya elemen sekaligus tipe elemen, dan memori dialokasikan sebesar jumlah elemen tersebut (hlm. 3). Sintaksnya adalah tipe data, nama array, dan ukuran dalam kurung siku, seperti double number[10] (hlm. 4).

Python memperlakukan array sedikit berbeda. Array dapat dibuat lewat library numpy, yang mendukung array satu dimensi, dua dimensi, dan seterusnya. Array satu dimensi diakses dengan satu indeks, sedangkan array dua dimensi atau matriks diakses dengan indeks baris dan kolom (hlm. 5). Python juga punya tipe data collection yang karakternya mirip array tetapi dengan perilaku sendiri: list, tuple, dictionary, dan set (hlm. 6-8).

List adalah koleksi paling sederhana dan dianalogikan sebagai array. Elemennya berurutan, dapat diganti, dan boleh duplikat; indeks dimulai dari 0 (hlm. 9). Deck merinci operasi list: mengakses elemen, mengubah elemen, menambah dengan insert(), menghapus dengan remove(), pop(), del, atau clear(), mengurutkan dengan sort() dan reverse(), serta menyalin dengan copy() atau list() (hlm. 10-14). Tuple juga berurutan dan boleh duplikat, tetapi elemennya tidak dapat diubah; untuk mengubah isinya, tuple diubah dulu menjadi list (hlm. 15-18). Set tidak berurutan, tidak dapat diganti, dan tidak berindeks, sehingga akses dilakukan lewat perulangan; elemen dapat ditambah dengan add() atau update() (hlm. 21-24).

Dictionary menyimpan pasangan key dan value, berurutan sejak Python 3.7, dapat diubah, dan tidak boleh memiliki key duplikat (hlm. 26). Akses dapat memakai key atau get(), perubahan memakai key atau update(), dan penghapusan memakai pop(), clear(), atau del (hlm. 27-30). Perulangan dapat dipakai pada semua tipe koleksi, dengan perlakuan khusus untuk dictionary karena strukturnya key dan value (hlm. 32-33). List comprehension disebut sebagai cara singkat mengolah list (hlm. 35).

## Poin kunci

- Array menyimpan elemen bertipe sama, diakses lewat indeks, dan berukuran tetap (hlm. 2).
- Deklarasi array C++ menentukan jumlah elemen dan tipe elemen (hlm. 3).
- Python memakai numpy untuk array satu atau dua dimensi (hlm. 5).
- List berurutan, dapat diubah, boleh duplikat, dan diakses mulai indeks 0 (hlm. 9).
- Tuple tidak dapat diubah; set tidak berurutan dan tidak berindeks (hlm. 15, 21).
- Dictionary menyimpan pasangan key dan value serta tidak boleh memiliki key duplikat (hlm. 26).
- List comprehension menyediakan cara singkat mengolah list (hlm. 35).

## Istilah

- Array: struktur data berisi elemen bertipe sama dengan indeks.
- Indeks: posisi elemen dalam array atau koleksi.
- Static: ukuran data sudah tetap sebelum program berjalan.
- Numpy: library Python untuk operasi array multidimensi.
- List: koleksi berurutan yang dapat diubah.
- Tuple: koleksi berurutan yang tidak dapat diubah.
- Set: koleksi tanpa urutan dan tanpa duplikasi.
- Dictionary: koleksi pasangan key dan value.
- List comprehension: notasi ringkas untuk membentuk atau mengolah list.

## Sumber

- `2025-09-29-06-alpro.local.pdf`, hlm. 2-35
