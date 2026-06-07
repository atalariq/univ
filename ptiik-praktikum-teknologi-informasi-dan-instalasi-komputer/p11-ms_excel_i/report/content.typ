// helper function
#let img(path, caption: "", width: 8cm) = [
  #figure(
    image(path, width: width),
    caption: caption,
  )
]

= Tujuan Percobaan

+ Memahami antarmuka/_(interface)_ Microsoft Excel serta perbedaan mendasar antara tipe data label, value, dan formula.
+ Menerapkan konsep _Relative & Absolute Cell Reference_ untuk efisiensi perhitungan data berulang.
+ Mengimplementasikan fungsi aritmetika dasar, fungsi waktu, serta fungsi logika (`IF`, `AND`, `OR`) untuk pemecahan masalah sederhana.

= Dasar Teori

== Pengenalan Microsoft Excel
Microsoft Excel adalah perangkat lunak lembar kerja _(spreadsheet)_ yang dikembangkan oleh Microsoft Corporation untuk sistem operasi Windows dan Mac OS. Aplikasi ini menjadi standar industri untuk pengolahan data, mulai dari kalkulasi aritmetika sederhana, manajemen basis data, pembuatan grafik statistik, hingga analisis data kompleks . Excel bekerja menggunakan sistem _Worksheet_ yang terdiri dari kisi-kisi baris (ditandai dengan angka 1, 2, 3...) dan kolom (ditandai dengan huruf A, B, C...). Perpotongan antara baris dan kolom ini disebut sebagai "Sel" _(Cell)_, yang memiliki alamat unik (misalnya A1, B5) dan berfungsi sebagai wadah utama untuk input data .

Dalam lingkungan kerja profesional, Excel tidak hanya digunakan sebagai kalkulator digital, tetapi juga sebagai alat bantu pengambilan keputusan (_Decision Support System_). Kemampuannya untuk mengintegrasikan data teks dan numerik memungkinkan pengguna untuk menyusun laporan keuangan, jadwal kerja, hingga analisis tren penjualan dengan presisi tinggi.

== Tipe Data dalam Excel
Agar proses kalkulasi berjalan akurat, Excel membedakan input pengguna ke dalam tiga kategori utama. Pertama adalah *Data Label* atau teks, yang memuat karakter alfanumerik (huruf dan simbol). Data ini secara _default_ ditampilkan rata kiri dan tidak dapat dihitung menggunakan operator matematika . Kedua adalah *Data Value* atau numerik, yang terdiri dari angka (0-9), format mata uang, persen, atau tanggal. Data ini ditampilkan rata kanan dan merupakan objek utama operasi matematika .

Kategori ketiga dan yang paling krusial adalah *Data Formula*. Formula adalah instruksi perhitungan yang selalu diawali dengan tanda sama dengan (`=`). Formula dapat berupa operasi matematika sederhana (seperti `=A1+A2`) atau fungsi bawaan Excel yang kompleks. Tanpa tanda sama dengan, Excel akan menganggap input tersebut hanya sebagai teks biasa dan tidak akan melakukan proses komputasi .

== Cell Reference (Relative & Absolute)

Kekuatan utama Excel terletak pada kemampuannya menyalin rumus ke ribuan sel sekaligus. Hal ini diatur oleh jenis referensi sel. *Referensi Relatif* adalah perilaku standar Excel di mana alamat sel dalam rumus akan berubah menyesuaikan posisi baris dan kolom baru saat disalin . Misalnya, rumus `=A1+B1` di baris 1 akan otomatis berubah menjadi `=A2+B2` jika disalin ke baris 2.

Namun, terdapat kasus di mana kita perlu mengunci referensi ke satu sel tertentu yang berisi nilai tetap (konstanta), seperti nilai pajak atau persentase diskon. Untuk ini, digunakan *Referensi Absolut* dengan menambahkan simbol dolar (`$`) di depan nama kolom dan baris (contoh: `$A$1`). Dengan penguncian ini, rumus tidak akan bergeser meskipun disalin ke lokasi manapun dalam _worksheet_ .

== Fungsi Aritmetika, Tanggal, dan Logika

Untuk pengolahan data numerik, Excel menyediakan operator aritmetika standar seperti penjumlahan (`+`), pengurangan (`-`), perkalian (`*`), pembagian (`/`), dan perpangkatan (`^`). Selain itu, tersedia fungsi waktu seperti `TODAY()` untuk menampilkan tanggal hari ini secara dinamis, serta fungsi ekstraksi seperti `YEAR()` atau `MONTH()` untuk mengambil komponen waktu tertentu dari data tanggal.

Di sisi analisis keputusan, Excel menyediakan fungsi logika. Fungsi `IF` memungkinkan sel untuk menghasilkan nilai yang berbeda berdasarkan uji kondisi Benar/Salah (`TRUE`/`FALSE`). Kemampuan ini dapat diperluas dengan fungsi `AND` (mensyaratkan semua kondisi benar) dan `OR` (mensyaratkan salah satu kondisi benar). Kombinasi fungsi-fungsi ini memungkinkan pembuatan model data yang adaptif, seperti penentuan kelulusan siswa atau klasifikasi status kesehatan secara otomatis.

#pagebreak()

= Hasil dan Pembahasan

== Praktik Aritmetika Sederhana (Tambah, Kurang, Kali, Bagi)

Pada percobaan ini, dilakukan operasi matematika dasar untuk memahami cara kerja operator aritmetika di Excel.
- Masukkan data angka pada kolom "Nilai 1" dan "Nilai 2".
- Untuk penjumlahan, ketik rumus `=B1+B2` (atau sesuaikan dengan sel) pada kolom hasil.
- Ulangi langkah serupa untuk pengurangan (`-`), perkalian (`*`), dan pembagian (`/`).
- Gunakan _Fill Handle_ (kotak kecil di pojok kanan bawah sel aktif) untuk menyalin rumus ke baris selanjutnya secara otomatis.

#img("assets/aritmetika-awal.png", width: 10cm, caption: [Tabel awal praktik operasi aritmetika])
#img("assets/aritmetika-tambah.png", width: 10cm, caption: [Penjumlahan menggunakan operator tambah (`+`)])
#img("assets/aritmetika-tambah_sum.png", width: 10cm, caption: [Penjumlahan menggunakan fungsi `SUM`])
#img("assets/aritmetika-kurang.png", width: 10cm, caption: [Pengurangan menggunakan operator kurang (`-`)])
#img("assets/aritmetika-kali.png", width: 10cm, caption: [Perkalian menggunakan operator kali (`*`)])
#img("assets/aritmetika-bagi.png", width: 10cm, caption: [Pembagian menggunakan operator bagi (`/`)])
#img("assets/aritmetika-akhir.png", width: 10cm, caption: [Hasil akhir latihan aritmetika])

== Praktik Relative & Absolute Reference (Menghitung Diskon)

Percobaan ini bertujuan menghitung harga akhir barang dengan potongan diskon tetap sebesar 5% (_Cash_) dan 15% (_Promo_).

#img("assets/reference-awal.png", width: 12cm, caption: [Tabel awal praktik hitung diskonan])
#img("assets/reference-subtotal.png", width: 12cm, caption: [Menghitung subtotal (_Relative Reference_)])
#img("assets/reference-cash.png", width: 12cm, caption: [Menghitung diskon _cash_ (_Absolute Reference_)])
#img("assets/reference-promo.png", width: 12cm, caption: [Menghitung diskon promo (_Absolute Reference_)])
#img("assets/reference-total.png", width: 12cm, caption: [Menghitung total (_Relative Reference_)])
#img("assets/reference-grandtotal.png", width: 12cm, caption: [Menghitung _grand total_ (Sum range)])
#img("assets/reference-akhir.png", width: 12cm, caption: [Hasil akhir tabel praktik _Relative & Absolute Reference_])

== Praktik Fungsi Logika (Menghitung BMI)

Bagian ini menggabungkan aritmetika dan logika `IF` bertingkat untuk menentukan status kesehatan.
- Hitung nilai BMI dengan rumus:\
  `Berat Badan (kg) / (Tinggi Badan (m))^2`.
- Gunakan logika `IF` untuk mengisi kolom status. Logika yang digunakan:\
  `=IF(AND(18,5<=E3; E3<=25); "Normal"; "Tidak Normal")`

#img("assets/logic-awal.png", width: 14cm, caption: [Tabel awal praktik hitung BMI])
#img("assets/logic-bmi.png", width: 14cm, caption: [Menghitung BMI dengan operasi aritmetika])
#img("assets/logic-status.png", width: 14cm, caption: [Mengecek BMI dengan fungsi `IF-AND`])
#img("assets/logic-akhir.png", width: 14cm, caption: [Hasil akhir tabel BMI])

#pagebreak()

= Kesimpulan

Berdasarkan praktikum yang telah dilakukan, dapat disimpulkan bahwa:
+ Microsoft Excel memproses data berdasarkan tipenya; pemahaman antara data label (teks) dan value (angka) sangat krusial agar formula dapat bekerja tanpa _error_.
+ Penggunaan _Absolute Reference_ (tanda `$`) adalah kunci dalam otomatisasi data tabel. Tanpa fitur ini, pengguna harus memasukkan rumus secara manual satu per satu ketika melibatkan konstanta tetap.
+ Fungsi logika (`IF`, `AND`, `OR`) mengubah Excel dari sekadar alat hitung menjadi alat analisis yang mampu mengambil keputusan otomatis berdasarkan kriteria yang kompleks, seperti pada kasus penentuan status BMI.
