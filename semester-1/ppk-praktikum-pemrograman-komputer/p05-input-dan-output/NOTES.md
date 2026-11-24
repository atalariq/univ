# Pertemuan 5: Input dan Output

Modul ini membahas cara program menerima data dari pengguna dan menampilkan hasilnya. `print()` dapat menampilkan beberapa nilai sekaligus bila dipisahkan koma, dan nilai-nilai itu dicetak dengan spasi di antaranya (hlm. 1). Secara default `print()` memindahkan kursor ke baris berikutnya, dan perilaku itu dapat diubah dengan parameter `end`, misalnya `end=""` agar dua pemanggilan print menyambung pada satu baris (hlm. 1-2).

Sisi input memakai `input()` yang membaca ketikan pengguna dan selalu menghasilkan string, apa pun isi yang diketik. Konsekuensinya, operasi aritmatika langsung pada hasil `input()` menimbulkan error, sehingga nilainya perlu dikonversi, misalnya dengan menulis `int(input())` (hlm. 2). Untuk beberapa nilai sekaligus, modul membedakan dua pola: jika tiap nilai berada pada baris berbeda, cukup memanggil `input()` beberapa kali; jika nilai dipisahkan spasi pada satu baris, dipakai `split()` untuk memecahnya, lalu `map()` bila elemennya perlu dijadikan integer (hlm. 2-3). Contoh yang diberikan adalah input `11 12 100` yang setelah dipecah dan dikonversi menghasilkan list berisi tiga bilangan bulat (hlm. 3).

Praktik pada bab ini menghitung luas permukaan tabung dari jari-jari dan tinggi yang diinputkan pada satu baris dipisah spasi. Program memecah input dengan `split()`, mengubah seluruh elemennya ke float lewat `map()`, mengambil dua elemen yang dibutuhkan, lalu menghitung dengan rumus `2 * pi * r * t + 2 * (pi * r**2)` (hlm. 3-4). Latihan meminta penjumlahan empat bilangan bulat yang tersebar pada dua baris input, sedangkan quiz meminta perkalian dua matriks 2x2 dengan pemisah baris kosong, dan modul mengingatkan bahwa tampilan outputnya harus sesuai contoh (hlm. 4-5).

## Poin kunci

- Beberapa nilai dapat dicetak dengan satu `print()` bila dipisahkan koma (hlm. 1).
- `end=""` mencegah `print()` berpindah baris (hlm. 2).
- `input()` selalu mengembalikan string (hlm. 2).
- Konversi seperti `int(input())` diperlukan sebelum operasi aritmatika (hlm. 2).
- Input pada baris terpisah dibaca dengan beberapa pemanggilan `input()` (hlm. 2).
- Input satu baris dipisah spasi dibaca dengan `split()`, lalu `map()` untuk konversi tipe (hlm. 3).
- Praktik tabung menerima contoh input `7 12.5` dan menghasilkan `857.6295` (hlm. 3-4).

## Istilah

- output: data yang dihasilkan program, misalnya ke layar.
- input: data yang dimasukkan pengguna ke program.
- parameter `end`: penentu karakter setelah pencetakan pada `print()`.
- split: fungsi pemecah string menjadi list berdasarkan pemisah tertentu.
- map: fungsi yang menerapkan konversi pada seluruh elemen iterable.
- matriks: kumpulan bilangan yang disusun dalam baris dan kolom.

## Sumber

- `modul-4-input-dan-output.local.pdf`, hlm. 1-5
