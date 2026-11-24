# Pertemuan 9: Sorting

Deck sorting membagi algoritma menjadi dua kelompok: iteratif dan rekursif. Kelompok iteratif berisi selection sort, bubble sort, dan insertion sort, sedangkan kelompok rekursif berisi merge sort dan quick sort (hlm. 2).

Selection sort bekerja dengan mencari nilai terbesar pada rentang [0..n-1], menukarnya dengan bilangan pada posisi n-1, lalu mengurangi n satu per satu dan mengulangi langkah yang sama (hlm. 3). Ilustrasi pada deck menunjukkan pertukaran nilai terbesar ke posisi terakhir dan penanda bilangan yang sudah terurut (hlm. 4). Bubble sort membandingkan dua bilangan bersebelahan, menukarnya bila belum terurut, dan mengulangi sampai bilangan terakhir sehingga nilai terbesar berada di posisi terakhir; analoginya adalah gelembung yang menggelembung ke atas (hlm. 6). Insertion sort dijelaskan lewat analogi menyusun kartu poker: mulai dari satu kartu di tangan, ambil kartu lain, lalu urutkan, dan ulangi untuk semua kartu (hlm. 9-10).

Merge sort memakai ide menggabungkan pasangan elemen menjadi himpunan berukuran 2, lalu pasangan himpunan 2 menjadi 4, dan seterusnya sampai dua himpunan berukuran n/2 tergabung menjadi satu himpunan terurut (hlm. 11). Metodenya adalah divide and conquer: masalah besar dibagi menjadi masalah kecil, masalah kecil diselesaikan secara rekursif, lalu hasilnya digabung (hlm. 12-13). Ilustrasi menunjukkan array dibagi dua, masing-masing bagian diurutkan, lalu digabung (hlm. 14-17). Kelebihan merge sort adalah performanya terjamin dan cocok untuk input sangat besar karena dapat bekerja per bagian. Kekurangannya adalah implementasi tidak mudah dan membutuhkan penyimpanan tambahan O(n) saat penggabungan (hlm. 19).

Quick sort juga memakai divide and conquer, tetapi berbeda pada langkah conquer. Pada divide step dipilih pivot p, lalu elemen dipartisi menjadi dua bagian: yang lebih kecil dari p dan yang lebih besar atau sama dengan p. Kedua bagian diurutkan secara rekursif, sedangkan conquer step tidak melakukan apa pun (hlm. 20). Deck membandingkan bahwa merge sort menghabiskan banyak waktu di conquer step dan sedikit di divide step, sedangkan quick sort sebaliknya (hlm. 20). Ilustrasi memilih elemen pertama sebagai pivot dan menunjukkan posisi pivot pada hasil akhir (hlm. 21), lalu ditutup dengan contoh dan implementasi (hlm. 22-23).

## Poin kunci

- Sorting dibagi menjadi iteratif (selection, bubble, insertion) dan rekursif (merge, quick) (hlm. 2).
- Selection sort mencari nilai terbesar lalu menukarnya ke posisi terakhir secara berulang (hlm. 3).
- Bubble sort menukar pasangan bersebelahan yang belum terurut (hlm. 6).
- Insertion sort bekerja seperti menyusun kartu poker (hlm. 9).
- Merge sort membagi array, mengurutkan tiap bagian, lalu menggabungkannya (hlm. 11-14).
- Merge sort butuh memori tambahan O(n) dan tidak mudah diimplementasikan (hlm. 19).
- Quick sort mempartisi array di sekitar pivot, lalu mengurutkan kedua bagian secara rekursif (hlm. 20).

## Istilah

- Selection sort: pengurutan dengan memilih nilai ekstrem lalu menukarnya ke posisi akhir.
- Bubble sort: pengurutan dengan menukar elemen bersebelahan yang salah urutan.
- Insertion sort: pengurutan dengan menyisipkan elemen ke posisi yang tepat.
- Merge sort: pengurutan divide and conquer yang menggabungkan bagian-bagian terurut.
- Quick sort: pengurutan divide and conquer dengan pivot dan partisi.
- Divide and conquer: strategi membagi masalah, menyelesaikan bagian kecil, lalu menggabungkan hasil.
- Pivot: elemen acuan untuk mempartisi array pada quick sort.
- Partition: pembagian elemen menjadi kelompok kecil dan besar terhadap pivot.
- Complexity: ukuran biaya waktu atau ruang sebuah algoritma.

## Sumber

- `2025-08-19-09-alpro.local.pdf`, hlm. 2-23
