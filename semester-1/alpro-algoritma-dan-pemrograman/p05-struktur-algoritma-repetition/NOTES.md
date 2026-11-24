# Pertemuan 5: Struktur algoritma: repetition

Deck ini membahas kendali perulangan dalam dua versi bahasa. Versi C++ memperkenalkan while, do, dan for dengan contoh sehari-hari: selama hujan pakai payung, kuras bak mandi sampai bersih, dan lari keliling lapangan sepuluh kali (hlm. 2). Ketiganya kemudian ditulis berdampingan dalam bentuk kode, dengan while memeriksa kondisi di awal, do-while mengerjakan isi dulu baru memeriksa kondisi, dan for memadatkan inisialisasi, kondisi, serta perubahan nilai dalam satu baris (hlm. 2).

Versi Python memperkenalkan while lewat kasus tabungan: uang 10.000 dengan bunga 5 persen per tahun, berapa tahun sampai saldo menjadi dua kali lipat (hlm. 4). Struktur while dijelaskan terdiri dari initialization, condition, dan update di dalam badan loop (hlm. 6). Contoh kodenya memakai variabel year dan balance, lalu menaikkan year dan mengalikan balance dengan laju bunga selama saldo belum mencapai target (hlm. 7). Deck juga memberi latihan dan solusi untuk kasus yang sama (hlm. 8-11).

Infinite loop dijelaskan sebagai loop yang berjalan selamanya dan hanya bisa dihentikan dengan mematikan program atau merestart komputer (hlm. 12-13). For loop dipakai ketika sebuah nilai bergerak dari titik awal ke titik akhir dengan kenaikan atau penurunan yang tetap (hlm. 14). Beberapa latihan meminta peserta menebak output dan menyelesaikan masalah dengan for (hlm. 15-20). Bagian akhir membahas nested loop, yaitu loop di dalam loop, dengan latihan menghasilkan pola output tertentu (hlm. 21-25).

Sesi ditutup dengan latihan menghitung berapa kali S1 sampai S4 dieksekusi pada potongan kode yang ditampilkan, lalu menuliskan output programnya (hlm. 26-27). Sayangnya potongan kode pada slide latihan berupa gambar, sehingga teks yang dapat dibaca dari PDF hanya instruksi dan judul output.

## Poin kunci

- C++ menyediakan while, do-while, dan for untuk perulangan (hlm. 2).
- While memeriksa kondisi sebelum mengerjakan isi loop (hlm. 2, 6).
- Do-while mengerjakan isi loop lebih dulu, lalu memeriksa kondisi (hlm. 2).
- For dipakai saat nilai bergerak dari titik awal ke titik akhir dengan increment atau decrement tetap (hlm. 14).
- While pada Python membutuhkan initialization, condition, dan update (hlm. 6).
- Infinite loop berjalan terus dan hanya berhenti bila program dimatikan atau komputer direstart (hlm. 12).
- Nested loop adalah loop yang berada di dalam loop lain (hlm. 21-25).

## Istilah

- Loop: struktur yang mengulang eksekusi sekumpulan instruksi.
- While: perulangan yang berjalan selama kondisi bernilai benar.
- Do-while: perulangan yang mengerjakan badan loop dahulu, kemudian memeriksa kondisi.
- For: perulangan dengan inisialisasi, kondisi, dan perubahan nilai yang terpadu.
- Initialization: pemberian nilai awal sebelum loop dimulai.
- Update: perubahan nilai variabel pengendali pada setiap iterasi.
- Infinite loop: perulangan yang tidak pernah berhenti.
- Nested loop: perulangan di dalam perulangan lain.
- Iteration: satu kali pelaksanaan badan loop.

## Sumber

- `2025-09-29-05-alpro.local.pdf`, hlm. 2-27
