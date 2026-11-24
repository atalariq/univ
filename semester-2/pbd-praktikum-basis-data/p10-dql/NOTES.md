# Pertemuan 10: DQL

Folder ini tidak menyimpan modul atau laporan, hanya `query.sql` yang berisi sepuluh soal latihan DQL dan dua jawaban. Catatan ini merangkum soal yang tercantum di berkas tersebut, bukan materi pengantar dari dosen.

Soal latihan bergerak dari penyaringan sederhana sampai agregasi per kelompok. Soal 1 meminta customer yang belum pernah melakukan pembelian, soal 2 total seluruh order, soal 3 rata-rata order quantity, dan soal 4 total order per produk yang namanya mengandung "INTEL" atau "AMD" (baris 1-4). Soal 5 dan 6 meminta nilai pesanan tertinggi per pelanggan, masing-masing hanya id_customer lalu ditambah full_name (baris 5-6). Soal 9 meminta customer dengan lebih dari dua order, dan soal 10 produk dengan rata-rata quantity di atas 5 (baris 32-33).

Dua soal yang dijawab menunjukkan pola agregasi yang dipakai. Soal 7 menghitung jumlah order per tahun dengan EXTRACT(YEAR FROM order_date), COUNT(order_id), GROUP BY pada ekspresi yang sama, lalu ORDER BY order_year (baris 9-17). Soal 8 memakai bentuk serupa dan mengambil tahun dengan order terbanyak lewat ORDER BY order_count DESC dan FETCH FIRST 1 ROWS ONLY (baris 21-30). Keduanya bekerja pada tabel orders; soal lain menyebut data customer dan produk, tetapi nama tabelnya tidak muncul di bagian yang ditulis.

Delapan soal lainnya belum dijawab, sehingga latihan yang tersisa mencakup penyaringan pelanggan tanpa transaksi, penjumlahan dan rata-rata, filter nama produk, nilai maksimum per pelanggan, serta penyaringan hasil GROUP BY. Berkas ini karena itu lebih tepat dibaca sebagai lembar kerja daripada catatan materi.

## Poin kunci

- Berkas memuat sepuluh soal DQL; hanya soal 7 dan 8 yang sudah dijawab (baris 9-30).
- Soal 7 memakai EXTRACT(YEAR FROM order_date), COUNT, dan GROUP BY (baris 9-17).
- Soal 8 menambahkan ORDER BY ... DESC dan FETCH FIRST 1 ROWS ONLY (baris 21-30).
- Soal 1, 5, 9, dan 10 menuntut penyaringan lanjutan atas hasil agregasi (baris 1, 5, 32-33).
- Tidak ada materi pengantar, tabel contoh, atau laporan di folder ini.

## Istilah

- DQL: bagian SQL untuk menanyakan data
- aggregate function: fungsi seperti COUNT dan AVG yang meringkas banyak baris
- GROUP BY: pengelompokan baris sebelum agregasi
- HAVING: penyaringan setelah GROUP BY, belum dipakai di berkas
- EXTRACT: pengambilan bagian tanggal, misalnya tahun
- FETCH FIRST n ROWS ONLY: pembatasan jumlah baris hasil, pengganti LIMIT pada Oracle

## Sumber

- `query.sql`, baris 1-33
