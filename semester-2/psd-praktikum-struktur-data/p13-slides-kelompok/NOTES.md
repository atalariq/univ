# Pertemuan 13: Slides kelompok

Pertemuan ini berisi presentasi delapan kelompok, masing-masing membahas satu topik struktur data di luar materi praktikum sebelumnya. Folder ini tidak menyimpan modul dosen, jadi catatan merangkum delapan berkas slide kelompok beserta halaman rujukannya.

Kelompok 1 membahas algoritma Huffman: kompresi lossless dengan kode biner panjang variabel, di mana karakter yang sering muncul memperoleh kode pendek (hlm. 3). Prosesnya menghitung frekuensi, menyusun min-heap, menggabungkan dua node terjarang sampai terbentuk satu pohon, lalu memberi 0 pada cabang kiri dan 1 pada cabang kanan (hlm. 5-6). Contoh "LOGIKA ALGORITMA" menghasilkan 52 bit dari 128 bit, dengan compression rate 59,4% (hlm. 7). Implementasinya memakai heapq dengan kompleksitas O(n log n), dan pohon harus ikut disimpan agar data bisa di-decode (hlm. 8, 11).

Kelompok 2 membahas trie atau prefix tree: pohon yang menyimpan string per karakter, dengan children dan penanda is_end_of_word pada setiap node (hlm. 5). Kata berawalan sama berbagi jalur, sehingga insert dan search hanya bergantung pada panjang kata, bukan jumlah data (hlm. 10-13). Trie dipakai untuk autocomplete, kamus, dan spell checker, dengan kelemahan memori besar karena banyak node kosong (hlm. 15-16).

Kelompok 3 membahas graph: kumpulan vertex dan edge, berbeda dari tree karena boleh bersiklus dan tidak punya akar (hlm. 3). Representasi adjacency list hemat memori dengan kompleksitas O(V+E), dibandingkan adjacency matrix yang memakan O(V^2) (hlm. 5). BFS memakai queue FIFO dan menyebar per lapis, sedangkan DFS memakai stack atau rekursi LIFO dan menukik mendalam; keduanya membutuhkan visited untuk mencegah loop (hlm. 11-13). Studi kasusnya rekomendasi teman, yaitu teman dari teman pada lapis kedua BFS (hlm. 14).

Kelompok 4 membandingkan tiga algoritma searching. Linear search memeriksa elemen satu per satu, tidak memerlukan data terurut, dan berkompleksitas O(n) (hlm. 4). Binary search membuang separuh ruang pencarian setiap langkah, dengan syarat data terurut, dan berkompleksitas O(log n) (hlm. 7). Interpolation search menebak posisi lewat proporsi nilai, sangat cepat pada data merata dengan O(log log n), tetapi turun ke O(n) bila distribusi tidak merata (hlm. 10, 12).

Kelompok 5 mengulang stack dan queue: stack LIFO dengan push, pop, dan peek, sedangkan queue FIFO dengan enqueue, dequeue, dan front (hlm. 2-3). Studi kasusnya penukaran tiket konser: queue mengatur antrean penonton, stack menumpuk wristband, dan priority queue menentukan urutan kategori tiket (hlm. 26-27).

Kelompok 6 membahas selection, insertion, dan bubble sort. Ketiganya berkompleksitas O(n^2); selection sort paling sedikit melakukan pertukaran, insertion sort menjadi O(n) pada data yang hampir terurut, dan bubble sort membandingkan pasangan bertetangga (hlm. 6-8).

Kelompok 7 membahas linked list: node berisi data dan pointer next, tersebar di memori dan tidak berurutan (hlm. 4). Variannya singly, doubly, dan circular; insert dan delete murah, tetapi mengakses elemen ke-n harus traversal O(n) (hlm. 4-5, 15).

Kelompok 8 membahas binary tree: setiap node maksimal dua anak, dengan root, left child, dan right child (hlm. 4). Traversal pre-order, in-order, dan post-order dibedakan oleh posisi pencetakan root, dan in-order pada BST menghasilkan urutan terurut (hlm. 9). Studi kasusnya papan skor turnamen yang memakai BST dan in-order untuk menampilkan ranking (hlm. 10-11).

## Poin kunci

- Huffman memberi kode pendek pada karakter yang sering muncul dan mencapai 59,4% pada contoh (hlm. 5-7).
- Trie berbagi jalur untuk kata berawalan sama; biaya operasinya sepanjang kata, bukan jumlah data (hlm. 10-13).
- Adjacency list berkompleksitas O(V+E); BFS memakai FIFO dan DFS memakai LIFO (hlm. 5, 13).
- Binary search butuh data terurut, interpolation search butuh distribusi merata (hlm. 7, 10).
- Tiga sorting sederhana berkompleksitas O(n^2) (hlm. 6-8).
- Linked list murah untuk insert dan delete, tetapi akses elemen ke-n O(n) (hlm. 15).
- In-order traversal pada BST menghasilkan data terurut (hlm. 9).

## Istilah

- lossless: kompresi tanpa kehilangan data asli
- prefix-free code: kode yang tidak menjadi awalan kode lain
- min-heap: priority queue yang selalu mengeluarkan nilai terkecil
- trie: pohon penyimpan string per karakter
- adjacency list: daftar tetangga tiap simpul pada graph
- BFS: penelusuran graph melebar per lapis dengan queue
- DFS: penelusuran graph mendalam dengan stack atau rekursi
- interpolation search: pencarian dengan menebak posisi lewat proporsi nilai
- linked list: rangkaian node yang dihubungkan pointer
- traversal: penelusuran seluruh node tree menurut urutan tertentu

## Sumber

- `kelompok-1-huffman.local.pdf`, hlm. 2-12
- `kelompok-2_trie-prefix-tree.local.pdf`, hlm. 3-17
- `kelompok-3-graph.local.pdf`, hlm. 3-16
- `kelompok-4-searching.local.pdf`, hlm. 2-18
- `kelompok-5_stack-queue.local.pdf`, hlm. 2-34
- `kelompok-6_sorting.local.pdf`, hlm. 3-9
- `kelompok-7_linked-list.local.pdf`, hlm. 4-15
- `kelompok-8-binary-tree.local.pdf`, hlm. 4-11
