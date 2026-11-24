# Pertemuan 6: Branch and Bound untuk TSP

Materi membuka dengan menyatakan bahwa Travelling Salesman Problem masih menjadi persoalan yang belum tuntas karena kompleksitas waktunya, dan branch and bound ditawarkan sebagai pendekatan untuk menyelesaikannya (hlm. 2). Bedanya dengan shortest path ditegaskan: shortest path mencari rute terpendek dari satu simpul ke simpul lain, sedangkan TSP menuntut lintasan Hamilton, yaitu rute yang mengunjungi semua kota tepat satu kali lalu kembali ke kota asal.

Pemisalan yang dipakai adalah graf lengkap G=(V,E) dengan n simpul bernomor 1 sampai n, bobot sisi Cij, dan perjalanan yang selalu berawal serta berakhir di simpul 1 (hlm. 2). Ruang solusinya adalah S={1,π,1} dengan π permutasi dari 2 sampai n, sehingga solusi TSP berbentuk X=(1,x1,x2,...,xn-1,1). Representasi persoalan sebagai ruang pohon pencarian diperlihatkan pada graf empat kota: tiap tingkat pohon menetapkan kota berikutnya yang dikunjungi (hlm. 3).

Kunci perhitungannya adalah matriks nilai tereduksi (reduced cost matrix). Sebuah matriks disebut tereduksi bila setiap baris dan kolomnya mengandung paling sedikit satu nol dan semua elemen lain tidak negatif (hlm. 4). Reduksi dilakukan pada baris lebih dulu, lalu kolom. Pada contoh matriks 5x5, pengurang barisnya 10, 2, 2, 3, dan 4, sedangkan pengurang kolomnya 1 dan 3, sehingga totalnya 25 dan menjadi batas simpul akar, ĉ(root)=25 (hlm. 5-6).

Langkah menurunkan pohon dijelaskan untuk simpul S yang menjadi anak simpul R. Semua nilai pada baris i dan kolom j diubah menjadi tak hingga agar tidak ada lintasan keluar dari simpul i atau masuk ke simpul j, lalu A(j,1) juga dibuat tak hingga untuk mencegah pemakaian sisi (j,1) sebelum waktunya. Matriks kemudian direduksi kembali, dan batas simpul baru dihitung dengan ĉ(S)=ĉ(R)+A(i,j)+r, dengan r adalah jumlah seluruh pengurang pada reduksi tambahan itu (hlm. 7). Dengan aturan tersebut, pohon pencarian disusun bertahap dan setiap simpul diberi batas bawah.

Pada contoh 5 simpul, simpul akar berbobot 25. Empat anaknya diberi batas 35, 53, 25, dan 31 untuk pilihan kota kedua 2, 3, 4, dan 5 (hlm. 9-11). Simpul berbobot 25 kemudian bercabang menjadi 28, 50, dan 36, lalu simpul 28 bercabang lagi menjadi 52 dan 28, dan akhirnya simpul 28 terakhir bercabang menjadi 28 (hlm. 12-13). Matriks pada simpul terakhir seluruhnya tak hingga, yang menandakan perjalanan sudah lengkap. Urutan kunjungan yang terbentuk dari label cabang adalah 1-4-2-5-3-1 dengan total 28, meskipun deck tidak menuliskannya dalam kalimat (hlm. 11-13).

## Poin kunci

- TSP menuntut lintasan Hamilton yang mengunjungi setiap kota tepat sekali lalu kembali ke kota awal (hlm. 2).
- Solusi dinyatakan sebagai X=(1,x1,...,xn-1,1) dengan simpul 1 sebagai awal dan akhir (hlm. 2).
- Matriks tereduksi harus punya minimal satu nol di setiap baris dan kolom, dan tidak ada elemen negatif (hlm. 4).
- Batas simpul akar adalah jumlah seluruh pengurang baris dan kolom, yaitu 25 pada contoh (hlm. 6).
- Batas simpul anak dihitung dengan ĉ(S)=ĉ(R)+A(i,j)+r (hlm. 7).
- Baris i dan kolom j dinolkan dengan tak hingga, dan A(j,1) juga dibuat tak hingga untuk mencegah jalur kembali terlalu dini (hlm. 7).
- Pohon pencarian pada contoh berakhir di simpul dengan batas 28 dan matriks yang seluruhnya tak hingga (hlm. 12-13).

## Istilah

- branch and bound: pencarian solusi dengan memecah ruang solusi menjadi cabang dan memangkas cabang yang batasnya tidak menjanjikan.
- TSP: persoalan mencari rute terpendek yang mengunjungi semua kota tepat sekali dan kembali ke asal.
- lintasan Hamilton: lintasan yang melewati setiap simpul tepat satu kali.
- reduced cost matrix: matriks bobot yang setiap baris dan kolomnya sudah dikurangi sehingga memuat nol.
- matriks nilai-tereduksi: matriks hasil reduksi baris dan kolom pada metode ini.
- fungsi pembatas atau bound: batas bawah biaya perjalanan pada suatu simpul pohon pencarian.
- simpul akar, simpul anak, simpul daun: posisi simpul pada ruang pohon pencarian.
- tour: rangkaian perjalanan dari simpul awal sampai kembali ke simpul awal.

## Sumber

- `branch-and-bound-tsp.local.pdf`, hlm. 2-3 (pemisalan TSP dan pohon pencarian)
- `branch-and-bound-tsp.local.pdf`, hlm. 4-7 (reduksi matriks dan fungsi pembatas)
- `branch-and-bound-tsp.local.pdf`, hlm. 8-13 (contoh perhitungan dan pohon solusi)
