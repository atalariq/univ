# Pertemuan 11: Searching

Searching diartikan sebagai menemukan data dari sekumpulan data yang lokasinya belum diketahui. Deck menyebut tiga metode dasar: sequential search, binary search, dan hashing (hlm. 2). Sequential search atau pencarian linear dapat dilakukan pada data yang belum terurut maupun yang sudah terurut. Caranya menelusuri data satu per satu dan mencocokkannya dengan data yang dicari; bila tidak sama, penelusuran dilanjutkan, dan bila sama, penelusuran dihentikan karena data ditemukan (hlm. 3). Implementasi Python-nya ditampilkan pada halaman berikutnya (hlm. 4).

Binary search hanya dapat dilakukan pada data yang sudah terurut. Pendekatannya membagi jangkauan nilai yang dicari: bila nilai yang dicari lebih kecil dari elemen tengah, pencarian dilanjutkan ke kelompok kiri; bila lebih besar, ke kelompok kanan (hlm. 5). Keuntungannya adalah waktu pencarian yang lebih cepat, sedangkan kerugiannya metode ini tidak bisa dipakai pada data yang belum diurutkan (hlm. 5). Deck lalu menampilkan representasi binary search tree, operasi delete dan insert, serta tree traversal (hlm. 6-10).

Bagian hashing menjelaskan hash table sebagai ADT untuk menyimpan data berukuran besar. Ukuran hash table biasanya lebih besar dari jumlah data yang disimpan, dan load factor adalah perbandingan antara data yang disimpan dengan ukuran tabel (hlm. 12). Hashing dipakai untuk penambahan, penghapusan, dan pencarian dengan constant average time. Key dari data dipetakan oleh fungsi hash ke bilangan dalam rentang 0 sampai H-size-1 (hlm. 13). Fungsi hash harus mudah dihitung, memakai seluruh key, dan menyebarkan key secara merata (hlm. 16). Contoh fungsi hash memetakan nama penulis menjadi nilai, dan terlihat beberapa key menempati posisi yang sama (hlm. 17).

Collision terjadi ketika dua key dipetakan ke posisi yang sama dan sangat mungkin terjadi (hlm. 18). Resolusinya dapat memakai linear probing, quadratic probing, double hashing, atau separate chaining (hlm. 19). Insert dilakukan dengan menerapkan fungsi hash, mencoba menempatkan key, lalu menangani collision (hlm. 20). Contoh linear probing menempatkan Aho, Kruse, Standish, Horowitz, dan Langsam pada tabel berukuran 7 (hlm. 21-25). Pencarian memakai urutan yang sama: hitung posisi, lihat isi posisi, lalu tangani collision (hlm. 26-28). Linear probing punya masalah kecepatan, kecenderungan clustering saat tabel setengah penuh, dan penghapusan record yang memakan banyak kerja (hlm. 30). Deck melanjutkan dengan quadratic probing, double hashing, dan chaining (hlm. 31-38).

## Poin kunci

- Searching adalah menemukan data pada kumpulan data yang lokasinya belum diketahui (hlm. 2).
- Sequential search menelusuri data satu per satu dan dapat dipakai pada data belum terurut (hlm. 3).
- Binary search hanya untuk data terurut dan membagi jangkauan pencarian (hlm. 5).
- Hash table memetakan key ke indeks 0 sampai H-size-1 lewat fungsi hash (hlm. 13).
- Load factor membandingkan jumlah data dengan ukuran hash table (hlm. 12).
- Collision terjadi saat dua key menempati posisi yang sama (hlm. 18).
- Linear probing rawan clustering dan penghapusannya memakan banyak kerja (hlm. 30).

## Istilah

- Sequential search: pencarian dengan menelusuri data satu per satu.
- Binary search: pencarian dengan membagi dua jangkauan data terurut.
- Binary search tree: pohon biner yang mendukung operasi pencarian, insert, dan delete.
- Traversal: penelusuran seluruh node pada tree.
- Hash table: struktur data yang memetakan key ke posisi tertentu.
- Load factor: rasio jumlah data terhadap ukuran hash table.
- Hash function: fungsi yang mengubah key menjadi indeks tabel.
- Collision: dua key yang dipetakan ke posisi yang sama.
- Linear probing: resolusi collision dengan mencari posisi kosong berikutnya secara berurutan.
- Quadratic probing: resolusi collision dengan lompatan kuadratik.
- Double hashing: resolusi collision memakai fungsi hash kedua.
- Separate chaining: resolusi collision dengan menyimpan beberapa data pada satu posisi.

## Sumber

- `2025-09-29-11-alpro.local.pdf`, hlm. 2-38
