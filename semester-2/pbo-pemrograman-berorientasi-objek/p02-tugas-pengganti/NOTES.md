# Pertemuan 2: Tugas pengganti

Pertemuan ini tidak berisi materi kuliah, melainkan tugas pengganti berupa studi kasus sistem manajemen perpustakaan sederhana (hlm. 1). Soal meminta sistem yang mencatat data buku berisi kode, judul, penulis, dan status ketersediaan; data anggota berisi ID, nama, dan kelas; serta proses peminjaman dan pengembalian yang mengubah status buku. Latar belakangnya adalah pencatatan manual yang ingin diganti aplikasi berbasis OOP agar data lebih terstruktur, mudah dikembangkan, dan mengurangi kesalahan pencatatan.

Soal dibagi menjadi tujuh bagian. Bagian pertama meminta identifikasi minimal tiga class utama beserta alasan dan perannya, lalu penggolongan mana yang entity class dan mana yang berpotensi control class. Bagian kedua meminta attribute setiap class, dikelompokkan menjadi attribute identitas, deskriptif, dan status, lengkap dengan tipe data serta level akses beserta alasannya. Bagian ketiga meminta method yang dikelompokkan menjadi manipulasi data, penampilan informasi, dan validasi, serta penjelasan bagaimana method itu mencerminkan encapsulation. Bagian keempat meminta perbedaan class dan object, tiga contoh object konkret, dan penjelasan apa yang terjadi di memori saat object dibuat. Bagian kelima meminta analisis relasi association, aggregation, dan composition beserta diagram sederhana dan multiplicity. Bagian keenam meminta analisis desain bila sistem membesar, termasuk perlunya class Transaksi. Bagian ketujuh berisi tiga pertanyaan refleksi tentang keunggulan OOP, akibat attribute yang dapat diubah langsung dari luar, dan hubungan object dengan dunia nyata (hlm. 1-3).

Jawaban yang dikerjakan memilih tiga class: Buku, Anggota, dan Petugas. Buku dan Anggota digolongkan sebagai entity class, sedangkan Petugas sebagai control class yang memproses peminjaman dan pengembalian. Seluruh attribute dibuat private dengan alasan menjaga konsistensi status, dan setiap class diberi method publik untuk manipulasi serta method privat untuk validasi. Jawaban juga menambahkan analisis bahwa satu anggota boleh meminjam beberapa buku, tetapi satu eksemplar hanya boleh dipinjam satu anggota pada satu waktu, dan menyarankan class Transaksi untuk menyimpan riwayat peminjaman.

Berkas jawaban tersedia dalam bentuk `answer.md` dan `PBOBB_557554_Atalariq Barra Hadinugraha.pdf`. Folder ini juga menyimpan dua jawaban alternatif, `ANSWER-CLAUDE.md` dan `ANSWER-GEMINI.md`, yang isinya tidak dipakai sebagai jawaban utama.

## Poin kunci

- Tugas berupa studi kasus perpustakaan dengan tujuh bagian pertanyaan (hlm. 1-3).
- Tiga class yang dipilih: Buku, Anggota, dan Petugas.
- Buku dan Anggota sebagai entity class, Petugas sebagai control class.
- Semua attribute dibuat private, perubahan status hanya lewat method.
- Relasi many to many tidak dipakai untuk peminjaman karena satu eksemplar hanya untuk satu peminjam.
- Jawaban menyarankan class Transaksi untuk menyimpan riwayat peminjaman.

## Istilah

- entity class: class yang mewakili data dan perilaku dasar suatu entitas.
- control class: class yang mengatur alur logika dan interaksi antar entity.
- encapsulation: pembungkusan attribute dan method dengan pembatasan akses.
- association, aggregation, composition: jenis relasi antar class dari yang longgar ke yang kuat.
- multiplicity: jumlah instance yang boleh terlibat dalam satu relasi.

## Sumber

- `study-case.local.pdf`, hlm. 1-3
- `answer.md`
- `PBOBB_557554_Atalariq Barra Hadinugraha.pdf`, hlm. 1-7
