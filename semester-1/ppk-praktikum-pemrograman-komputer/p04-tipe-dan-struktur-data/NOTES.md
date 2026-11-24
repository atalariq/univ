# Pertemuan 4: Tipe dan Struktur Data

Bab ini membahas tipe data, list, dan string, lalu memakainya untuk memecahkan soal yang sebelumnya hanya dikerjakan dengan operasi aritmatika. Python membedakan tiga tipe data umum, yaitu integer untuk bilangan bulat, float untuk bilangan pecahan, dan string untuk teks, dan fungsi `type()` dipakai untuk memeriksa tipe sebuah nilai (hlm. 1). List didefinisikan sebagai struktur data yang menyimpan sekumpulan nilai berurutan dan boleh bertipe campuran; elemennya ditulis di antara kurung siku dan dipisahkan koma, dan list bahkan dapat berisi list lain atau kosong (hlm. 1). Pengaksesan elemen memakai indeks yang dimulai dari nol, dan elemen pada posisi tertentu bisa dibaca maupun ditimpa dengan nilai baru (hlm. 1-2). String diperlakukan mirip list, bedanya string hanya menyimpan karakter dan penulisannya diapit tanda petik satu atau dua (hlm. 2).

Karena Python menentukan tipe variabel dari nilai yang disimpan, sering diperlukan konversi tipe atau type casting. Modul menampilkan tabel konversi antara int, float, string, dan list, misalnya `float(x)`, `str(x)`, `int(x)`, serta `list(x)` yang memecah string menjadi daftar karakter (hlm. 2-3). Untuk mengubah tipe seluruh elemen list dipakai `map()` yang hasilnya perlu dibungkus `list()`, sedangkan `split()` memecah string menjadi list kata dengan pemisah default berupa spasi (hlm. 3).

Bagian praktik memakai soal quiz bab sebelumnya, yakni menjumlahkan digit sebuah bilangan antara 100 dan 999. Bilangan diubah ke string agar tiap digit dapat diambil lewat indeks, tiap digit dikonversi kembali ke integer, lalu dijumlahkan (hlm. 4-5). Latihan meminta penghitungan banyak bit satu pada string biner lima bit, termasuk varian yang karakternya dipisah spasi, sedangkan quiz meminta konversi bilangan biner empat bit ke desimal (hlm. 5).

## Poin kunci

- `type()` menunjukkan tipe sebuah nilai atau variabel (hlm. 1).
- Indeks list dan string dimulai dari 0 (hlm. 1-2).
- List boleh berisi tipe campuran, list bersarang, atau kosong (hlm. 1).
- Konversi tipe memakai `int()`, `float()`, `str()`, dan `list()` (hlm. 2-3).
- `map()` mengubah tipe semua elemen list dan hasilnya dibungkus `list()` (hlm. 3).
- `split()` memecah string menjadi list kata berdasarkan spasi (hlm. 3).
- Praktik menjumlah digit dilakukan dengan mengubah angka ke string, mengambil tiap digit lewat indeks, lalu mengubahnya kembali ke integer (hlm. 4-5).

## Istilah

- integer: tipe bilangan bulat.
- float: tipe bilangan pecahan.
- string: tipe data teks berupa deretan karakter.
- list: struktur data berurutan yang dapat menyimpan banyak nilai.
- indeks: nomor urut elemen pada list atau string, dimulai dari 0.
- type casting: proses mengubah nilai dari satu tipe ke tipe lain.
- map: fungsi yang menerapkan suatu operasi pada seluruh elemen iterable.

## Sumber

- `modul-3-tipe-data-dan-struktur-data.local.pdf`, hlm. 1-5
