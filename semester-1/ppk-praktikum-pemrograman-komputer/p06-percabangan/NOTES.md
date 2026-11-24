# Pertemuan 6: Percabangan

Percabangan membuat program memeriksa kondisi lebih dahulu sebelum menentukan aksi yang dijalankan. Sebelum masuk ke `if`, modul memperkenalkan dua kelompok operator. Operasi relasional menghasilkan True atau False dan mencakup `==`, `!=`, `>`, `>=`, `<`, serta `<=`; operator ini juga berlaku pada string dan membandingkannya secara leksikografis, sehingga `"abu" > "aku"` bernilai False karena "abu" muncul lebih dulu di kamus (hlm. 1). Operasi logika terdiri dari `and`, `or`, dan `not` untuk menggabungkan atau menegasikan ekspresi boolean (hlm. 1-2).

Bentuk kondisional paling sederhana adalah `if` dengan satu kondisi, seperti mengubah nilai negatif menjadi positif untuk memperoleh nilai absolut. Modul menekankan bahwa indentasi bersifat sensitif: baris yang menjorok satu tab menandai blok yang hanya dijalankan bila kondisi terpenuhi, dan bagian setelah blok tetap dieksekusi (hlm. 2-3). Kondisi dapat digabung dengan operator relasional dan logika, misalnya memeriksa bilangan genap antara 100 dan 200. Selanjutnya dibahas bentuk dengan alternatif `else` untuk kasus ganjil atau genap, bentuk berantai `elif` yang memeriksa kondisi secara bertahap dari atas, dan kondisional bersarang yang menempatkan `if` di dalam `if` (hlm. 3-4).

Praktik menerapkan materi pada soal pengecekan jenis sudut dari bab algoritma. Input dibaca sebagai float, lalu urutan kondisionalnya disusun hati-hati agar sudut 180 derajat tidak terbaca sebagai sudut tumpul: kurang dari 90 lancip, sama dengan 90 siku-siku, antara 90 dan 180 tumpul, selebihnya lurus (hlm. 4-5). Latihan meminta program tahun kabisat, versi kabisat dengan hanya satu percabangan memakai operasi logika, dan pencarian nilai terbesar dari tiga input. Quiz meminta pembulatan berdasarkan nilai pecahan, nilai terbesar kedua, serta validasi tanggal, bulan, dan tahun (hlm. 5-6).

## Poin kunci

- Operator relasional menghasilkan True atau False dan dapat dipakai pada string (hlm. 1).
- `and` menuntut semua kondisi benar, `or` cukup salah satu, `not` menegasikan (hlm. 1-2).
- Indentasi menandai blok yang termasuk ke dalam `if` (hlm. 2-3).
- `elif` memeriksa kondisi secara berurutan dari atas ke bawah (hlm. 4).
- Kondisional bersarang adalah `if` yang menjadi aksi dari `if` lain (hlm. 4).
- Urutan kondisi penting: sudut 180 harus diperiksa terpisah agar tidak masuk kategori tumpul (hlm. 5).

## Istilah

- percabangan: pengambilan keputusan program berdasarkan kondisi.
- operasi relasional: operasi pembanding yang bernilai True atau False.
- ekspresi boolean: ekspresi yang bernilai benar atau salah.
- leksikografis: urutan berdasarkan abjad seperti pada kamus.
- indentasi: penjorokan baris yang menandai blok program.
- kondisional bersarang: percabangan di dalam percabangan lain.
- elif: cabang alternatif yang diperiksa bila kondisi sebelumnya tidak terpenuhi.

## Sumber

- `modul-5-percabangan.local.pdf`, hlm. 1-6
