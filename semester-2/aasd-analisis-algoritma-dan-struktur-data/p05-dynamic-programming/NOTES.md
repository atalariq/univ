# Pertemuan 5: Dynamic Programming

Dynamic programming diperkenalkan sebagai jalan tengah antara greedy yang hanya memberi solusi cukup baik dan complete calculation yang menjamin optimal tetapi terlalu mahal (hlm. 2). Metode ini dipakai bila solusi sebuah problem dapat dipandang sebagai deretan keputusan. Masalah dipecah menjadi subproblem yang saling berpotongan, lalu subsolusi optimal setiap subproblem dihitung dan disimpan.

Fibonacci dipakai untuk memperlihatkan masalahnya. Versi rekursif naif memanggil fungsi berkali-kali untuk nilai yang sama, sehingga f(5) butuh 15 pemanggilan dan f(100) butuh sekitar 1,14 x 10^21 pemanggilan (hlm. 3-5). Penyebabnya adalah redundansi, yaitu pekerjaan yang diulang padahal pernah dilakukan (hlm. 6). Memoization mengatasinya dengan mencatat hasil perhitungan di array, dan jumlah pemanggilan untuk f(100) turun menjadi 199 (hlm. 7-8). Materi menekankan bahwa kecepatan ditukar dengan memori, lalu membedakan pendekatan top-down yang rekursif dari bottom-up yang berperulangan (hlm. 10). Versi bottom-up yang hanya menyimpan dua nilai terakhir diperkenalkan sebagai penghemat memori (hlm. 11-12).

Coin change problem dipakai sebagai kasus berikutnya: dengan koin 3, 5, dan 12, materi menanyakan apakah 23 dapat dibentuk, berapa koin minimal untuk membentuknya, dan berapa banyak kombinasi yang mungkin (hlm. 13-14). Dua gaya pengisian tabel dibedakan. Metode Pull menentukan status nilai n dengan melihat status n-3, n-5, dan n-12, sedangkan metode Push mengunjungi n lalu memperbarui status n+3, n+5, dan n+12 (hlm. 15-16). Ketiga pertanyaan dijawab dengan tiga pseudocode yang berdekatan: penandaan bisa atau tidak bisa, penyimpanan jumlah koin minimal, dan penjumlahan banyaknya kombinasi. Hasilnya, 23 dapat dibentuk, butuh minimal 4 koin, dan ada 24 kombinasi (hlm. 24, 39, 49). Nilai 1, 2, 4, dan 7 tidak dapat dibentuk (hlm. 24).

Multistage graph problem membahas graf berarah berbobot dengan satu source, satu sink, dan node yang terbagi ke beberapa stage, dengan edge hanya mengarah ke stage berikutnya (hlm. 50-51). Metode forward menghitung cost dari node ke sink mulai dari stage k-2 dengan cost(i,j)=min{c(j,k)+cost(i+1,k)}, sedangkan metode backward menghitung bcost dari source ke node (hlm. 52, 63). Keduanya pada contoh 12 node menghasilkan lintasan terpendek 21 dengan rute A-C-G-I-L, dan rute itu ditemukan dengan menelusuri kembali perhitungan dari bawah ke atas (hlm. 60-62, 71-73).

Bagian akhir memuat dua penerapan klasik. Pada 0/1 knapsack, tabel K[i,w] diisi dengan membandingkan membawa atau tidak membawa barang ke-i; untuk kapasitas 6 kg dan empat barang, keuntungan maksimalnya $13 dari barang ke-4 dan ke-2, dan barang yang dibawa dilacak mundur dari pojok kanan bawah tabel (hlm. 74-81). Biayanya O(nW), jauh lebih baik daripada menghitung semua solusi feasible yang O(2^n) (hlm. 83). Travelling salesman problem diselesaikan dengan p(i,L)=min[c(j,i)+p(j,L-{j})], yaitu panjang lintasan menuju node i setelah melewati himpunan L (hlm. 84-85). Untuk graf empat kota, hasilnya 44 dengan rute A-C-B-D-A (hlm. 92-94), dan latihan berikutnya memberi 47 dengan rute A-D-B-C-A (hlm. 95).

## Poin kunci

- DP dipakai saat solusi dapat diuraikan menjadi deretan keputusan atas subproblem yang berpotongan (hlm. 2).
- Redundansi membuat Fibonacci rekursif meledak, dan memoization menekan pemanggilan f(100) dari 10^21 menjadi 199 (hlm. 5-8).
- Gaya Pull membaca status sebelumnya, gaya Push memperbarui status berikutnya (hlm. 15-16).
- Dengan koin 3, 5, dan 12, nilai 23 butuh 4 koin dan dapat dibentuk dengan 24 kombinasi (hlm. 39, 49).
- Forward dan backward pada multistage graph memberi hasil sama, 21, dengan rute A-C-G-I-L (hlm. 60-73).
- 0/1 knapsack dengan DP berbiaya O(nW), bukan O(2^n) (hlm. 83).
- Rute terpendek TSP dibaca mundur dari perhitungan p(i,L) yang menghasilkan nilai minimum (hlm. 93-94).

## Istilah

- dynamic programming: penyelesaian masalah dengan menyimpan solusi subproblem yang berpotongan.
- subproblem: bagian masalah yang lebih kecil dan dihitung terpisah.
- memoization: pencatatan hasil perhitungan agar tidak diulang.
- top-down dan bottom-up: penyelesaian dari masalah besar ke kecil secara rekursif, atau dari nilai awal menuju solusi.
- Pull dan Push: dua arah pengisian tabel pada DP.
- coin change problem: masalah membentuk nilai tertentu dari pecahan koin yang tersedia.
- multistage graph: graf berarah berbobot yang node-nya terbagi ke beberapa stage.
- cost dan bcost: panjang lintasan dari node ke sink, dan dari source ke node.
- 0/1 knapsack: knapsack yang setiap barangnya hanya boleh diambil utuh satu kali.
- TSP: pencarian rute yang mengunjungi semua kota tepat sekali lalu kembali ke kota awal.

## Sumber

- `dynamic-programming.local.pdf`, hlm. 2-12 (pengantar, Fibonacci, memoization)
- `dynamic-programming.local.pdf`, hlm. 13-49 (coin change problem)
- `dynamic-programming.local.pdf`, hlm. 50-73 (multistage graph)
- `dynamic-programming.local.pdf`, hlm. 74-83 (0/1 knapsack)
- `dynamic-programming.local.pdf`, hlm. 84-95 (TSP dengan DP)
