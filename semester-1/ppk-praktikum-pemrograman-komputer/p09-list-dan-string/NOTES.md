# Pertemuan 9: List dan String

Bab ini melanjutkan pembahasan list dan string dari bab tipe data, dengan penekanan pada fungsi dan operasi yang sering dipakai. `len()` menghasilkan banyak elemen sebuah list atau banyak karakter sebuah string, termasuk spasi dan tanda baca (hlm. 1). Penelusuran list dapat dilakukan dengan dua cara: mencacah elemennya langsung lewat `for i in nama`, atau menelusuri indeksnya dengan `for i in range(len(nama))` sehingga indeks dan nilainya dapat ditampilkan bersama (hlm. 1-2).

Untuk membuat list berukuran tertentu dipakai operator `*`, misalnya `[0]*10`, yang berguna ketika banyaknya input sudah diketahui sehingga pembacaan bisa dilakukan dalam perulangan (hlm. 2). List juga dapat berdimensi lebih dari satu. Pada list dua dimensi, pengaksesan elemen memerlukan dua indeks seperti `a[1][2]`, `len()` hanya melaporkan panjang dimensi teratas, penelusurannya membutuhkan perulangan bersarang, inisialisasinya dilakukan per dimensi, dan pembacaan inputnya menggabungkan `split()` dengan perulangan (hlm. 2-4).

Pada string, tanda `+` menyambung dan `*` mengulang teks. Fungsi `ord()` mengubah satu karakter menjadi kode ASCII, sedangkan `chr()` melakukan sebaliknya, dan keduanya berguna untuk memeriksa apakah sebuah karakter kapital (hlm. 5). `join()` menggabungkan elemen list menjadi satu string dengan pemisah yang ditentukan, misalnya `""` atau spasi (hlm. 6). String bersifat immutable: elemennya tidak bisa ditimpa langsung, sehingga penggantian karakter dilakukan dengan mengubah string ke list, menimpa elemen, lalu menggabungkannya kembali dengan `join()` (hlm. 6-7). Praktik mencari nilai terbesar pada list memakai input pertama sebagai penanda panjang list, lalu menelusuri elemen dan menyimpan nilai terbesar sementara (hlm. 7-8). Latihan meminta penghitungan huruf kapital lewat tabel ASCII dan perapian kapitalisasi kalimat, sedangkan quiz meminta rotasi 180 derajat sebuah list dua dimensi 8x8 (hlm. 8-9).

## Poin kunci

- `len()` berlaku pada list maupun string (hlm. 1).
- List dapat ditelusuri lewat elemen langsung atau lewat indeks (hlm. 1-2).
- `[0]*n` membuat list berisi n elemen bernilai 0 (hlm. 2).
- List dua dimensi diakses dengan dua indeks dan ditelusuri dengan nested loop (hlm. 2-4).
- `ord()` dan `chr()` menghubungkan karakter dengan kode ASCII (hlm. 5).
- `join()` adalah kebalikan `split()` (hlm. 6).
- String immutable, sehingga penggantian karakter melewati list dan `join()` (hlm. 6-7).

## Istilah

- multidimensional list: list yang elemennya berupa list lain.
- inisialisasi: pemberian nilai awal pada struktur data.
- ASCII: kode bilangan yang mewakili setiap karakter.
- immutable: sifat objek yang isinya tidak dapat diubah di tempat.
- join: fungsi penggabung elemen list menjadi string.
- pencacahan: penelusuran list dengan mengambil elemennya satu per satu.

## Sumber

- `modul-7-list-dan-sorting.local.pdf`, hlm. 1-9 (nama berkas menyebut sorting, isi babnya hanya list dan string)
