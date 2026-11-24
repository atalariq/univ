# Pertemuan 3: Metode Greedy

Materi membuka dengan penggolongan masalah berdasarkan jumlah solusinya, dari yang hanya punya satu jawaban benar sampai yang tidak punya solusi sama sekali (hlm. 2). Pengurutan [7,2,8,4,9] hanya boleh menghasilkan [2,4,7,8,9], sedangkan pencarian rute Jakarta ke Surabaya punya banyak jawaban yang sama-sama benar. Dari situ disebutkan empat rumpun pendekatan yang akan dipelajari: greedy, dynamic programming, backtracking, dan branch and bound (hlm. 3).

Prinsip greedy dijelaskan sebagai penggantian perhitungan lengkap dengan pemakaian elemen yang tampak paling menjanjikan pada setiap langkah (hlm. 4). Kata greedy sendiri berarti serakah. Materi berargumen bahwa daripada menghabiskan waktu mencari solusi terbaik, greedy memilih solusi yang cukup baik. Analoginya seorang lelaki yang mencampur semua makanan yang ia sukai tanpa mempertimbangkan kecocokan antar bahan (hlm. 5-6), sehingga hasilnya bisa mendekati benar tetapi juga bisa jauh dari benar.

Untuk memberi kerangka, materi memperkenalkan ruang solusi, solusi feasible, fungsi objektif, dan solusi optimal (hlm. 7). Ruang solusi adalah semua kemungkinan jawaban, solusi feasible adalah bagian yang memenuhi syarat, dan fungsi objektif mengukur kualitas setiap solusi feasible. Solusi optimal adalah titik potong keduanya.

Knapsack problem dipakai sebagai kasus utama. Seorang pencuri membawa tas berkapasitas 20 kg dan menghadapi lima barang dengan berat dan nilai berbeda: A 7 kg $2975, B 3 kg $1230, C 9 kg $3870, D 2 kg $840, dan E 5 kg $2250 (hlm. 8). Materi mendaftar empat varian: fractional, 0/1, bounded, dan unbounded (hlm. 9). Dengan menghitung semua kombinasi lewat Complete Calculation Method, solusi optimal versi 0/1 adalah {B,C,D,E} dengan nilai $8190 (hlm. 10-11), tetapi cara ini disebut tidak layak untuk jumlah barang yang besar (hlm. 12).

Greedy menyelesaikannya dengan menghitung value per kg lalu mengambil yang tertinggi, yaitu barang E senilai $450 per kg (hlm. 12-13). Pada kapasitas 23 kg, greedy menghasilkan empat E dan satu D dengan nilai $9420, padahal empat E dan satu B memberi $10320 (hlm. 14-15). Kesimpulannya, greedy tidak menyelesaikan 0/N unbounded knapsack secara sempurna, tetapi berhasil sempurna pada fractional unbounded knapsack (hlm. 15-17).

Kasus kedua adalah penjadwalan job berdasarkan deadline dengan empat job, profit 110, 47, 25, 20 dan deadline 2, 1, 2, 1 (hlm. 18). Complete calculation memberi profit maksimum 157 dari urutan job 2 lalu 1, sedangkan greedy memilih job 1 lalu 3 dengan profit 135 (hlm. 19-20). Deck ini berlanjut ke minimum spanning tree dan shortest path (hlm. 21-43), yang dibahas pada pertemuan berikutnya. Di bagian shortest path, greedy memilih jalur ADCF sepanjang 36, padahal jalur ADEBF hanya 30, sehingga solusinya disebut local optimum (hlm. 38-43).

## Poin kunci

- Greedy memilih pilihan terbaik pada tiap langkah lokal tanpa meninjau keseluruhan ruang solusi (hlm. 4).
- Solusi feasible adalah solusi yang memenuhi batasan, sedangkan solusi optimal adalah yang terbaik menurut fungsi objektif (hlm. 7).
- Complete Calculation Method menjamin solusi optimal tetapi biayanya terlalu besar untuk input besar (hlm. 11-12).
- Greedy pada 0/N unbounded knapsack gagal mencapai solusi optimal, sedangkan pada fractional unbounded knapsack berhasil (hlm. 15-17).
- Pada penjadwalan job, greedy memilih 1 lalu 3 dengan profit 135, sedangkan solusi optimal 157 berasal dari urutan 2 lalu 1 (hlm. 19-20).
- Greedy menghasilkan local optimum, bukan selalu global optimum, seperti pada kasus shortest path (hlm. 43).

## Istilah

- greedy: pendekatan yang mengambil pilihan terbaik yang tersedia saat itu juga.
- ruang solusi: himpunan semua kemungkinan jawaban suatu masalah.
- solusi feasible: solusi yang memenuhi semua batasan masalah.
- fungsi objektif: ukuran kualitas yang dipakai untuk membandingkan solusi feasible.
- solusi optimal: solusi feasible dengan nilai fungsi objektif terbaik.
- knapsack problem: masalah memilih barang agar nilai maksimum tanpa melebihi kapasitas.
- fractional, 0/1, bounded, unbounded: varian knapsack menurut bolehnya barang dipecah dan jumlah satuannya.
- local optimum: solusi terbaik pada lingkungan lokal, belum tentu terbaik secara keseluruhan.
- job sequencing dengan deadline: penjadwalan pekerjaan agar profit maksimum sebelum batas waktu.

## Sumber

- `metode-greedy.local.pdf`, hlm. 2-7 (jenis masalah, prinsip greedy, ruang solusi)
- `metode-greedy.local.pdf`, hlm. 8-17 (knapsack problem)
- `metode-greedy.local.pdf`, hlm. 18-20 (penjadwalan job)
- `metode-greedy.local.pdf`, hlm. 38-43 (kegagalan greedy pada shortest path)
