// helper function
#let img(path, caption: "", width: 16cm) = [
  #figure(
    image(path, width: width),
    caption: caption,
  )
]

= Tujuan Percobaan

+ Menguasai penggunaan fungsi referensi `HLOOKUP` dan `VLOOKUP` untuk penggabungan data antar tabel secara otomatis.
+ Mampu menyajikan data secara visual menggunakan _Chart_ dan menganalisis subset data menggunakan fitur _Auto Filter_.
+ Memahami konsep otomasi sederhana menggunakan _Macro_ untuk efisiensi kerja berulang.
+ Menerapkan alat analisis data tingkat lanjut (_Goal Seek, Solver, Pivot Table_) untuk penyelesaian masalah optimasi dan pembuatan laporan ringkas.

= Dasar Teori

== Fungsi Lookup (HLOOKUP & VLOOKUP)
Fungsi Lookup adalah instrumen vital dalam Excel yang digunakan untuk mencari dan mengambil data dari tabel referensi lain (tabel bantu) berdasarkan kata kunci (_lookup value_) tertentu. Excel menyediakan dua varian utama:
- *VLOOKUP (Vertical Lookup):* Digunakan ketika data pada tabel referensi disusun secara vertikal atau per kolom (judul berada di baris atas). Sintaks dasarnya adalah `=VLOOKUP(lookup_value, table_array, col_index_num, [range_lookup])` .
- *HLOOKUP (Horizontal Lookup):* Digunakan ketika data pada tabel referensi disusun secara horizontal atau per baris (judul berada di kolom kiri). Prinsip kerjanya sama dengan VLOOKUP, namun parameter pencariannya menggunakan nomor baris (_row index_) .

== Pembuatan Grafik (_Chart_)
Grafik atau _Chart_ merupakan representasi visual dari data tabel yang bertujuan untuk memudahkan pembacaan tren, perbandingan, dan pola data yang sulit diinterpretasikan hanya dengan melihat angka mentah. Excel mempermudah proses ini melalui fitur _Recommended Charts_ pada tab _Insert_, yang secara cerdas menyarankan jenis visualisasi (seperti _Clustered Column_, _Pie_, atau _Line Chart_) yang paling sesuai dengan karakteristik data yang disorot . Pengguna juga dapat melakukan kustomisasi tampilan melalui menu _Design_ untuk mengubah gaya dan warna grafik agar lebih profesional .

== Auto Filter
_Auto Filter_ adalah fitur penyaringan data yang memungkinkan pengguna untuk memilah dan hanya menampilkan baris data yang memenuhi kriteria spesifik, sementara data lain disembunyikan sementara. Filter di Excel sangat fleksibel dan dapat diterapkan berdasarkan berbagai parameter:
- *Text Filters:* Menyaring data teks (misal: "Begins with", "Contains").
- *Number Filters:* Menyaring angka (misal: "Greater Than", "Between", "Top 10").
- *Date Filters:* Menyaring tanggal (misal: "This Month", "Next Year").
- *Color Filters:* Menyaring berdasarkan warna sel atau warna font.

== Macro
_Macro_ adalah fitur otomasi yang bekerja dengan cara merekam serangkaian langkah atau aktivitas yang dilakukan pengguna di Excel untuk kemudian disimpan sebagai skrip (VBA). Rekaman aktivitas ini dapat dijalankan ulang (_playback_) kapan saja dengan satu tombol atau _shortcut_. Fitur ini sangat bermanfaat untuk efisiensi kerja, terutama dalam menangani tugas-tugas yang bersifat repetitif dan membosankan, seperti memformat laporan harian dengan gaya yang sama berulang kali .

== Analisis What-If (Goal Seek & Solver)
Excel menyediakan alat analisis skenario untuk pemecahan masalah kuantitatif:
- *Goal Seek:* Digunakan untuk metode perhitungan mundur (_backward calculation_), yaitu mencari nilai input tunggal yang dibutuhkan untuk mencapai target hasil yang sudah diketahui .
- *Solver:* Alat optimasi yang lebih canggih untuk masalah dengan banyak variabel input dan batasan (_constraints_). Solver mampu mencari nilai maksimum, minimum, atau nilai tertentu dengan mempertimbangkan limitasi sumber daya yang ada.

== Pivot Table
_Pivot Table_ adalah fitur analisis data interaktif yang berfungsi untuk merangkum, mengelompokkan, dan menyajikan ringkasan dari dataset dalam jumlah besar tanpa mengubah data aslinya. Pengguna dapat dengan mudah memodifikasi tampilan laporan hanya dengan melakukan _drag-and-drop_ pada empat area utama: _Rows_ (baris), _Columns_ (kolom), _Values_ (nilai hitungan), dan _Filters_ (penyaring). Fitur ini sangat efektif untuk mengubah ribuan baris data transaksi menjadi tabel ringkasan yang informatif dalam hitungan detik .

#pagebreak()

= Hasil dan Pembahasan

== Praktik Fungsi Lookup (Latihan 1)

Dalam latihan ini, dilakukan pengisian "Daftar Penjualan Handphone" yang masih kosong. Data rincian barang (Nama, Harga, Potongan) diambil dari tabel referensi menggunakan fungsi Lookup.

=== Penerapan HLOOKUP
Fungsi `HLOOKUP` digunakan karena tabel referensi disusun secara horizontal (Baris 1: Kode, Baris 2: Nama, dst).

#img("assets/h-awal.png", caption: [Tabel awal])
#img("assets/h-nama.png", caption: [HLOOKUP Nama Barang])
#img("assets/h-harga.png", caption: [HLOOKUP Harga satuan])
#img("assets/h-harga_total.png", caption: [Hitung Harga total])
#img("assets/h-diskon.png", caption: [HLOOKUP Diskon])
#img("assets/h-total.png", caption: [Hitung total])
#img("assets/h-akhir.png", caption: [Hasil akhir])
#img("assets/h-akhir_rapi.png", caption: [Hasil akhir dengan formatting yang lebih baik])

#pagebreak()

=== Penerapan VLOOKUP
Fungsi `VLOOKUP` digunakan pada sheet berikutnya dimana tabel referensi disusun secara vertikal (Kolom 1: Kode, Kolom 2: Nama, dst).

#img("assets/v-awal.png", caption: [Tabel awal])
#img("assets/v-nama.png", caption: [VLOOKUP Nama Barang])
#img("assets/v-harga.png", caption: [VLOOKUP Harga satuan])
#img("assets/v-harga_total.png", caption: [Hitung Harga total])
#img("assets/v-diskon.png", caption: [VLOOKUP Diskon])
#img("assets/v-total.png", caption: [Hitung total])
#img("assets/v-akhir.png", caption: [Hasil akhir])
#img("assets/v-akhir_rapi.png", caption: [Hasil akhir dengan formatting yang lebih baik])

#pagebreak()

== Praktik Fungsi Lanjutan (Latihan 2)

Bagian ini membahas penerapan fitur-fitur analisis data lanjutan pada Excel.

=== Visualisasi dan Penyaringan Data
1. *Pembuatan Grafik (_Chart_):*
  - Data "Stok Barang Gudang" diblok, kemudian melalui menu `Insert > Recommended Charts`, dipilih grafik tipe _Clustered Column_.
  - Tampilan dipercantik menggunakan menu _Design_ (mengubah warna batang menjadi hijau) untuk memudahkan perbandingan visual stok antar barang.
2. *Auto Filter:*
  - Fitur Filter diaktifkan pada data "Sensus Penduduk".
  - Dilakukan penyaringan data kompleks, misalnya: Menampilkan penduduk dengan pekerjaan "Petani" DAN rentang usia 27-35 tahun menggunakan _Number Filters (Between)_.

=== Otomasi dan Analisis
1. *Macro:*
  - Sebuah Macro direkam untuk melakukan formatting otomatis (mengubah font, menambah kolom "Total Barang", dan rumus pengurangan stok).
  - Macro disimpan dan dijalankan ulang pada data mentah, membuktikan efisiensi waktu dalam pengerjaan format berulang.
2. *Goal Seek:*
  - Digunakan untuk mencari target penjualan. Kasus: "Berapa penjualan Minggu ke-4 agar rata-rata bulanan menjadi 800?". _Goal Seek_ secara otomatis menghitung nilai input yang diperlukan.
3. *Pivot Table:*
  - Diterapkan pada data "Transaksi Penjualan".
  - Pivot Table dikonfigurasi dengan: _Rows_ = Nama Barang, _Columns_ = Tahun, _Values_ = Sum of Total. Hasilnya adalah ringkasan total penjualan per barang per tahun yang mudah dibaca.

#pagebreak()

= Kesimpulan

Berdasarkan serangkaian percobaan pada modul Excel Lanjut ini, dapat disimpulkan bahwa:
+ Fungsi *HLOOKUP* dan *VLOOKUP* sangat esensial untuk menjaga integritas data relasional, meminimalkan kesalahan _input_ manual dengan mengambil data secara otomatis dari tabel master.
+ Fitur *Visualisasi (Chart)* dan *Filter* mengubah data mentah menjadi informasi yang lebih bermakna dan mudah dianalisis, memungkinkan pengambilan keputusan yang lebih cepat.
+ *Macro* menawarkan solusi efisiensi tinggi untuk tugas repetitif, sementara *Pivot Table* dan *Solver* memberikan kemampuan analisis bisnis yang mendalam (seperti peringkasan data masif dan optimasi target) yang tidak dapat dilakukan oleh rumus aritmetika biasa.
