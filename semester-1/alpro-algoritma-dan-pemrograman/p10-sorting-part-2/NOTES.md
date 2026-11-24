# Pertemuan 10: Sorting part 2

Heap sort dijelaskan sebagai metode pengurutan angka pada array dengan cara menyerupai binary tree. Array divisualisasikan menjadi binary tree, lalu nilai pada masing-masing indeks diurutkan. Bagian-bagian heap sort adalah node, edge, leaf, dan root (hlm. 2). Ada dua kondisi heap: max-heap menempatkan nilai tertinggi di root dan setiap child bernilai lebih kecil dari parent, sedangkan min-heap menempatkan nilai terkecil di root dan setiap child bernilai lebih besar dari parent. Heap sort memakai max-heap (hlm. 4).

Visualisasi array menjadi heap tree memakai rumus left child 2i, right child 2i+1, dan parent floor(i/2). Deck mencontohkan array A = 4, 1, 3, 2, 16, 9, 10, 14, 8, 7 yang belum memenuhi kondisi max-heap (hlm. 5-6). Dua metode dipakai untuk memperbaikinya: Build-Max-Heap untuk membangun heap dari array, dan Max-Heapify untuk mengoreksi posisi indeks yang dipilih agar parent lebih tinggi dari child (hlm. 7-9). Setelah proses selesai, array terurut dari nilai terkecil sampai terbesar (hlm. 10). Deck juga menampilkan flowchart dan implementasi (hlm. 11-12).

Shell sort ditemukan Donald Shell pada 1959 dan disebut sebagai algoritma pertama yang memecahkan batas waktu kuadratik. Algoritma ini membandingkan elemen yang berjauhan, bukan elemen yang bersebelahan (hlm. 14). Shell sort memakai increment sequence h1, h2, ..., ht dengan syarat h1 = 1, dan bertujuan memperbaiki efisiensi insertion sort dengan memindahkan nilai ke tujuannya lebih cepat (hlm. 15-16). Kelebihannya adalah cepat untuk daftar berukuran sedang dan menjadi yang tercepat di antara algoritma O(N^2). Kekurangannya, algoritma ini lebih rumit dan masih lebih lambat daripada merge, heap, dan quick sort; shell sort cocok untuk daftar di bawah 5000 item (hlm. 17-18). Contoh perhitungan memakai increment floor(n/2) sampai increment 1, yang pada fase terakhir pada dasarnya adalah insertion sort (hlm. 19-22).

Radix sort memperlakukan setiap data sebagai string karakter dan tidak memakai perbandingan antar data. Pada setiap iterasi, data dikelompokkan menurut karakter berikutnya, lalu kelompok-kelompok tersebut digabungkan untuk iterasi selanjutnya (hlm. 26-27). Kompleksitasnya O(n) per iterasi, dan karena jumlah iterasi adalah d, yaitu jumlah digit atau karakter maksimum, kompleksitas totalnya O(dn) (hlm. 30). Deck menutup dengan tabel perbandingan berbagai algoritma sorting dan ringkasan kompleksitas shell sort: worst-case kurang dari atau sama dengan O(n^2), best-case O(n log n), average O(n log n), dan space O(1) (hlm. 31-32).

## Poin kunci

- Heap sort memvisualisasikan array sebagai binary tree dan memakai max-heap (hlm. 2-4).
- Pada heap tree, left child = 2i, right child = 2i+1, dan parent = floor(i/2) (hlm. 5).
- Build-Max-Heap membangun heap, sedangkan Max-Heapify mengoreksi posisi node (hlm. 7-9).
- Shell sort membandingkan elemen berjauhan dan memakai increment sequence dengan h1 = 1 (hlm. 14-15).
- Shell sort cepat untuk daftar sedang tetapi lebih lambat dari merge, heap, dan quick sort (hlm. 17).
- Radix sort tidak membandingkan data, tetapi mengelompokkan berdasarkan karakter (hlm. 26).
- Kompleksitas radix sort adalah O(dn) dengan d jumlah digit maksimum (hlm. 30).

## Istilah

- Heap: struktur tree dengan aturan nilai parent dan child.
- Max-heap: heap dengan nilai terbesar di root.
- Min-heap: heap dengan nilai terkecil di root.
- Node: titik pada tree yang menyimpan nilai.
- Root: node paling atas pada tree.
- Leaf: node yang tidak memiliki child.
- Build-Max-Heap: prosedur membangun max-heap dari array.
- Max-Heapify: prosedur memperbaiki posisi node agar memenuhi sifat max-heap.
- Increment sequence: urutan jarak perbandingan pada shell sort.
- Radix sort: pengurutan tanpa perbandingan berdasarkan digit atau karakter.

## Sumber

- `2025-09-29-10-alpro.local.pdf`, hlm. 2-32
