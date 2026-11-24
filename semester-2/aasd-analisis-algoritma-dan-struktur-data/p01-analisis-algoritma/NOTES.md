# Pertemuan 1: Analisis Algoritma

Materi membuka dengan cara mengukur biaya sebuah algoritma. Waktu proses tidak dinyatakan dalam milidetik karena kecepatan tiap komputer berbeda, melainkan dalam ek, yaitu jumlah eksekusi perintah (hlm. 2). Penghitungan dilakukan baris demi baris: perulangan `for` dihitung dua eksekusi karena komputer mengubah nilai pencacah lalu memeriksa batasnya, perintah di dalam perulangan satu eksekusi, dan `end` tidak dihitung (hlm. 3). Pada perulangan bersarang, satu siklus perulangan luar memakan (2*Y)+1 ek sehingga X siklus memerlukan X*((2*Y)+1) ek (hlm. 4). Cara ini diakui tidak praktis untuk algoritma berukuran besar, sehingga pembahasan beralih ke penghitungan jumlah perulangan.

Dari situ muncul tiga ukuran waktu proses: keadaan terbaik, terburuk, dan rata-rata (hlm. 5). Materi menetapkan θ untuk keadaan terbaik, O untuk keadaan terburuk, dan Ω untuk rata-rata, lalu menyatakan bahwa penilaian efisiensi selalu memakai keadaan terburuk (hlm. 5-6). Di luar materi, konvensi buku teks umum justru menukar peran O dan Ω. Contoh percabangan sederhana memperlihatkan waktu 2 ek untuk satu cabang dan 3 ek untuk cabang lain, sehingga ditulis θ(2) dan O(3) (hlm. 6). Jika percabangan dibungkus perulangan X kali, waktu terburuknya X*(3+1) ek (hlm. 7).

Bagian kedua mendefinisikan fungsi kompleksitas sebagai fungsi yang menggambarkan perubahan waktu proses terhadap jumlah input (hlm. 8, 13). Selection Sort dipakai sebagai contoh: perulangan dalam berjalan N-1, N-2, sampai 1 kali, sehingga f(n)=n(n+1)/2 (hlm. 9-13). Notasi Big-O diperoleh dengan membuang konstanta dan suku berderajat rendah, misalnya 3n²+4n+5 menjadi O(n²) (hlm. 14-15). Materi juga membedakan apriori analysis, yaitu menghitung fungsi kompleksitas lalu Big-O, dari aposteriori testing yang mengukur waktu eksak lewat percobaan pada komputer tertentu (hlm. 17).

Bagian akhir memakai pencarian bilangan prima sebagai studi kasus. Pseudocode 3.7a memeriksa semua pembagi dengan biaya 3N+3 ek; versi 3.7b mempersempit rentang ke 2 sampai N-1, tetapi salah menyimpulkan bahwa 1 prima (hlm. 19-22). Pseudocode 3.7c memperbaiki kesalahan itu dengan percabangan tambahan, lalu 3.7d membatasi perulangan sampai N div 2 dan memangkas waktu sekitar setengah (hlm. 23-26). Untuk mencetak semua prima 1 sampai N, pseudocode 3.8 butuh sekitar 49 detik pada N=100.000, sedangkan teknik flagging atau sieve pada pseudocode 3.9 hanya 15 sampai 45 ms (hlm. 40-41). Materi menutup dengan catatan bahwa flagging unggul untuk mendaftar prima, tetapi 3.7d lebih hemat untuk menguji satu bilangan saja (hlm. 44-47).

## Poin kunci

- Waktu proses diukur dalam ek, bukan detik, agar tidak bergantung pada kecepatan mesin (hlm. 2).
- Perulangan `for` dihitung 2 ek, isi perulangan 1 ek, dan `end` diabaikan (hlm. 3).
- Efisiensi algoritma dinilai dari keadaan terburuk, bukan terbaik (hlm. 6).
- Fungsi kompleksitas Selection Sort adalah n(n+1)/2, sehingga Big-O-nya O(n²) (hlm. 13-14).
- Big-O didapat dengan mengambil pangkat tertinggi lalu membuang konstanta (hlm. 15).
- Algoritma yang sama bisa benar untuk N besar tetapi salah untuk N=1, seperti pada pseudocode 3.7b (hlm. 22).
- Teknik flagging jauh lebih cepat untuk mendaftar prima, tetapi bukan untuk menguji satu bilangan (hlm. 44-47).

## Istilah

- ek: satuan waktu proses berupa jumlah eksekusi perintah.
- best case, worst case, average time: waktu proses pada kondisi terbaik, terburuk, dan rata-rata.
- fungsi kompleksitas: fungsi jumlah perulangan atau waktu proses terhadap ukuran input.
- growth rate: laju pertambahan waktu proses saat input bertambah.
- Big-O: notasi orde pertumbuhan yang dipakai materi untuk keadaan terburuk.
- apriori analysis: analisis dengan menghitung fungsi kompleksitas tanpa menjalankan program.
- aposteriori testing: analisis dengan mengukur waktu eksekusi nyata pada mesin tertentu.
- sieve atau flagging: penandaan kelipatan bilangan prima pada array status.
- div dan mod: pembagian bulat dan sisa pembagian.

## Sumber

- `analisis-algoritma.local.pdf`, hlm. 2-7 (waktu proses dan ketiga ukuran)
- `analisis-algoritma.local.pdf`, hlm. 8-17 (fungsi kompleksitas dan Big-O)
- `analisis-algoritma.local.pdf`, hlm. 18-47 (studi kasus bilangan prima)
