# Pertemuan 3: Tipe data, variabel, dan operasi I/O

Materi ini memindahkan perkakas dasar pemrograman ke Python, dimulai dari lingkungan kerja Google Colab. Notebook baru dibuat lewat File > New Notebook, diberi nama, lalu disimpan otomatis di folder Colab Notebooks pada Google Drive (hlm. 2-3). Deck menunjukkan antarmuka notebook serta cara membuat code cell dan text cell (hlm. 4-7).

Perbedaan sintaks Python dijelaskan lewat dua hal: statemen ditulis satu baris tanpa delimiter, dan indentation dipakai untuk menandai blok kode, bukan sekadar mempercantik tampilan. Lebar indentasi bebas tetapi harus konsisten dalam satu blok (hlm. 8). Komentar juga diperkenalkan sebelum masuk ke variabel dan tipe data (hlm. 9-10). Pada Python tidak ada deklarasi variabel; tipe ditentukan saat variabel diberi nilai. Nama variabel tidak boleh berawalan angka, tidak boleh mengandung spasi atau tanda minus, dan bersifat case sensitive (hlm. 11). Satu pernyataan juga dapat mendefinisikan beberapa variabel sekaligus (hlm. 12).

Tipe data dibagi menjadi teks, numerik, sequence, mapping, set, boolean, binary, dan None (hlm. 14-22). Untuk teks digunakan len() guna mengetahui jumlah karakter, sedangkan mapping menyimpan pasangan key dan value. Set tidak berurutan dan tidak memiliki duplikasi, frozen set tidak dapat diubah, dan None menyatakan nilai kosong yang berbeda dari 0, False, atau string kosong (hlm. 18-22). Pemeriksaan tipe memakai type(), sedangkan konversi memakai str(), int(), dan float() (hlm. 23-24).

Bagian akhir membahas tujuh kelompok operator: aritmatika, penugasan, perbandingan, logika, identitas, keanggotaan, dan bitwise (hlm. 26-33). Operator identitas membandingkan apakah dua objek menempati alamat memori yang sama, sedangkan operator keanggotaan memeriksa keberadaan nilai dalam objek koleksi (hlm. 31-32). Deck menutup dengan prioritas operator dan rencana lanjutan ke conditional execution serta loop (hlm. 34-35).

## Poin kunci

- Python tidak memakai delimiter baris; indentation menentukan blok kode dan harus konsisten (hlm. 8).
- Variabel tidak perlu dideklarasikan; tipe mengikuti nilai yang diberikan (hlm. 11).
- Nama variabel case sensitive dan tidak boleh berawalan angka, berspasi, atau memakai tanda minus (hlm. 11).
- Tipe data Python mencakup teks, numerik, sequence, mapping, set, boolean, binary, dan None (hlm. 14-22).
- len() menghitung panjang teks, type() memeriksa tipe, dan str(), int(), float() mengubah tipe (hlm. 15, 23-24).
- Ada tujuh kelompok operator, dari aritmatika sampai bitwise (hlm. 26-33).
- Operator identitas membandingkan lokasi memori, bukan sekadar nilai (hlm. 31).

## Istilah

- Google Colab: lingkungan notebook berbasis cloud untuk menjalankan Python.
- Indentation: lekukan baris yang di Python menentukan blok kode.
- Sequence: tipe data berurutan seperti list dan tuple.
- Mapping: tipe data pasangan key dan value, contohnya dictionary.
- Set: himpunan tanpa urutan dan tanpa duplikasi.
- Frozen set: set yang elemennya tidak dapat diubah.
- None: nilai yang menyatakan ketiadaan nilai.
- Type casting: konversi nilai dari satu tipe ke tipe lain.
- Operator bitwise: operator yang bekerja pada representasi biner.
- Operator identitas: operator yang memeriksa kesamaan objek di memori.

## Sumber

- `2025-09-29-03-alpro.local.pdf`, hlm. 2-35
