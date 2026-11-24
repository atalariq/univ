# Pertemuan 2: Divide and Conquer

Teknik divide and conquer memecahkan masalah dengan membaginya menjadi sejumlah submasalah yang lebih kecil (hlm. 2). Masalah kecil dianggap lebih mudah diselesaikan, dan pembagian berlangsung berulang secara rekursif sampai bagian terkecil tidak dapat dibagi lagi. Setelah semua submasalah selesai, solusinya digabung kembali menjadi solusi lengkap. Materi menyebut pengurutan dan pencarian sebagai penerapan paling populer dari pendekatan ini.

Materi lalu menyurvei enam algoritma pengurutan: selection, insertion, bubble, heap, merge, dan quick (hlm. 3). Selection sort mencari nilai terkecil, memilihnya, lalu menempatkannya di posisi terdepan, dan diulang untuk posisi berikutnya (hlm. 4-9). Seluruh langkahnya ditelusuri pada satu array tujuh elemen yang sama, mulai dari 16, 22, 25, 3, 9, 14, 23. Insertion sort bekerja dengan menyisipkan satu per satu bilangan ke posisi yang benar dengan menggeser elemen di sebelah kanannya (hlm. 10-14). Bubble sort menganalogikan angka sebagai gelembung: elemen terkecil naik ke permukaan melalui pertukaran berpasangan dari ujung array (hlm. 15-23). Ketiganya berkompleksitas O(n²).

Merge sort adalah contoh divide and conquer yang utuh. Array dibagi dua terus-menerus sampai tersisa satu elemen, lalu modul Merge2 menggabungkan dua bagian terurut (hlm. 24-26). Dua penunjuk, Lcnt dan Rcnt, mencatat berapa elemen dari masing-masing bagian yang sudah dipindahkan ke array hasil, sehingga penggabungan berjalan linear (hlm. 31-33). Quick sort memilih satu nilai sebagai pivot, memisahkan array menjadi bagian less, equal, dan more, lalu memproses bagian less dan more secara rekursif (hlm. 34-38). Materi mendaftar lima cara memilih pivot: elemen depan, tengah, belakang, nilai tengah dari ketiganya, dan acak (hlm. 35). Pemilihan acak disebut berguna untuk memperkecil peluang kasus terburuk. Kedua algoritma ini O(n log n) (hlm. 29, 39).

Perbandingan di akhir menyatakan bahwa selection, insertion, dan bubble sort selalu lebih lambat daripada quick sort karena berbeda orde, sedangkan heap, merge, dan quick setara secara orde (hlm. 40). Quick sort disebut umumnya lebih baik di antara ketiganya, dengan catatan perbandingan itu berlaku untuk algoritma dasar tanpa optimasi tambahan.

Bagian terakhir membahas pencarian. Sequential search memeriksa elemen satu per satu (hlm. 42-43). Binary search memperbaikinya dengan mensyaratkan array sudah terurut, lalu memakai iLow, iHigh, dan iMid untuk membelah area pencarian menjadi dua di setiap langkah (hlm. 44-48). Contoh penelusuran mencari angka 9 pada tujuh elemen dan selesai dalam tiga langkah.

## Poin kunci

- Divide and conquer membagi masalah secara rekursif sampai bentuk terkecil, lalu menggabungkan solusinya (hlm. 2).
- Selection, insertion, dan bubble sort semuanya O(n²) (hlm. 5, 14, 15-23).
- Merge sort membagi array sampai satu elemen, lalu menggabungkannya dengan dua penunjuk (hlm. 24-33).
- Quick sort bekerja dengan pivot, dan kinerjanya sangat ditentukan cara memilih pivot (hlm. 34-37).
- Pivot yang membagi array menjadi dua bagian sama panjang adalah pivot yang baik (hlm. 36).
- Quick sort, merge sort, dan heap sort sama-sama O(n log n), tetapi quick sort disebut lebih baik di antara algoritma dasar (hlm. 40).
- Binary search hanya bisa dipakai pada array terurut dan membelah area pencarian di setiap langkah (hlm. 42-47).

## Istilah

- divide and conquer: teknik memecah masalah menjadi submasalah, menyelesaikannya secara rekursif, lalu menggabungkan hasilnya.
- ascending dan descending: urutan dari kecil ke besar dan dari besar ke kecil.
- pivot: nilai acuan untuk membagi array pada quick sort.
- merge: proses menggabungkan dua bagian terurut menjadi satu bagian terurut.
- sequential search: pencarian dengan memeriksa elemen satu per satu.
- binary search: pencarian dengan membelah array terurut menjadi dua berulang kali.
- kompleksitas O(n²) dan O(n log n): orde pertumbuhan waktu proses terhadap jumlah elemen.

## Sumber

- `devide-and-conquer.local.pdf`, hlm. 2-3 (pengertian dan daftar algoritma)
- `devide-and-conquer.local.pdf`, hlm. 4-23 (selection, insertion, bubble sort)
- `devide-and-conquer.local.pdf`, hlm. 24-39 (merge sort dan quick sort)
- `devide-and-conquer.local.pdf`, hlm. 40-48 (perbandingan dan pencarian)
