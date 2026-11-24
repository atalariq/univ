# Pertemuan 12: Microsoft Excel II

Modul lanjutan ini dibuka dengan HLOOKUP dan VLOOKUP, dua fungsi untuk mengambil nilai referensi dari tabel lain. HLOOKUP mencari pada tabel yang disusun mendatar, misalnya `=HLOOKUP(C11,$D$2:$G$5,3,0)`, lalu rumus disalin ke seluruh kolom yang membutuhkan dan dikalikan dengan kolom harga sebelum diformat sebagai persen (hlm. 3-6). VLOOKUP dipakai pada tabel yang disusun menurun; pada latihan, tabel sumber diubah orientasinya dengan Paste Special dan opsi Transpose, lalu dipakai rumus seperti `=VLOOKUP(C11,$I$3:$L$6,2,0)` (hlm. 7-10). Keduanya memakai rentang absolut dengan tanda `$` agar acuan tabel tidak bergeser saat rumus disalin.

Pembuatan grafik dimulai dengan memblok data yang akan ditampilkan, lalu memilih Insert dan Recommended Charts sampai muncul jendela Insert Chart untuk memilih jenis grafik. Grafik yang sudah jadi dapat dipercantik melalui tombol kuas, tab Design, Chart Styles, dan Change Colors (hlm. 12-16). Auto filter memungkinkan penyaringan baris berdasarkan teks, angka, tanggal, maupun warna. Penyaringan teks memakai Text Filters dengan kriteria seperti Equals atau is greater than, penyaringan angka memakai Number Filters dengan pilihan Between, Top, dan sejenisnya, penyaringan tanggal memakai Date Filters, dan Filter by Color dipakai untuk menyaring berdasarkan warna sel (hlm. 17-26).

Bagian pencetakan dan keamanan menjelaskan pencetakan lewat File lalu Print, termasuk pemilihan printer, halaman, dan orientasi, serta proteksi berkas lewat File, Info, Protect Workbook, dan Encrypt with Password. Modul mengingatkan bahwa kata sandi yang lupa tidak dapat dipulihkan sehingga berkas tidak bisa dibuka (hlm. 28-31). Macro diaktifkan dengan mencentang Developer pada File, Options, Customize Ribbon, lalu direkam lewat Record Macro, dijalankan pada data, dan dihentikan dengan Stop Recording (hlm. 33-39).

Fitur analisis what-if dibahas pada bagian berikutnya. Goal Seek dipakai dengan menyiapkan sel berisi rumus, sel input, dan target hasil, lalu dijalankan dari tab Data melalui What-if Analysis dengan mengisi Set Cell, To Value, dan By changing cell (hlm. 41-44). Solver diaktifkan sebagai add-in lewat File, Options, Add-ins, lalu dipakai untuk menetapkan sel target, tujuan, dan batasan (hlm. 45-51). Terakhir, PivotTable dibuat dari tab Insert atau menu Summarize With Pivot Table, kemudian field disusun ke area FILTERS, COLUMNS, ROWS, dan VALUES sesuai kebutuhan ringkasan (hlm. 53-57). Modul juga menyinggung pembaruan PivotTable ketika data sumber berubah (hlm. 59).

## Poin kunci

- HLOOKUP membaca tabel mendatar, VLOOKUP membaca tabel menurun (hlm. 3-10).
- Rentang tabel pada lookup dikunci dengan `$` agar tidak bergeser (hlm. 4, 10).
- Grafik dibuat dari data terblok lewat Insert dan Recommended Charts (hlm. 12-13).
- Auto filter menyaring berdasarkan teks, angka, tanggal, atau warna (hlm. 17-26).
- Encrypt with Password ada di File, Info, Protect Workbook (hlm. 29-30).
- Goal Seek dan Solver dijalankan dari tab Data melalui What-if Analysis (hlm. 41-47).
- PivotTable menyusun field ke area FILTERS, COLUMNS, ROWS, dan VALUES (hlm. 56).

## Istilah

- HLOOKUP: fungsi pencarian nilai pada tabel berorientasi horizontal.
- VLOOKUP: fungsi pencarian nilai pada tabel berorientasi vertikal.
- rentang absolut: acuan sel terkunci dengan tanda `$`.
- Transpose: pembalikan baris menjadi kolom atau sebaliknya.
- auto filter: fitur penyaringan baris data.
- macro: rekaman rangkaian perintah yang dapat dijalankan ulang.
- Goal Seek: fitur pencarian nilai input agar rumus mencapai target.
- Solver: add-in optimasi dengan sel target dan batasan.
- PivotTable: tabel ringkasan yang menyusun ulang data berdasarkan field.
- add-in: perangkat tambahan yang menambah fungsi aplikasi.

## Sumber

- `modul-excel-lanjut.local.pdf`, hlm. 3-59
