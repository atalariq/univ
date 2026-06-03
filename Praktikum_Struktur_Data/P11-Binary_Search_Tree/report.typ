#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Struktur Data",
  course-code: "PSD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "11",
  title: "Binary Search Tree, Depth First Search, dan Breadth First Search",
)

#show: report.with(
  ..metadata,
  association: (
    program: "Teknologi Rekayasa Perangkat Lunak",
    department: "Teknik Elektro dan Informatika",
    faculty: "Sekolah Vokasi",
    university: "Universitas Gadjah Mada",
    city: "Yogyakarta",
    logo: image("assets/logo.png", width: 6cm),
  ),
  year: 2026,
  use-cover: true,
  bib: bibliography("references.bib", style: "ieee"),
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
)

#set par(justify: true, first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), header: [#path.split("/").at(-1)], ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), ..args)

#daftar-isi()

= Tujuan Praktikum

+ Memahami konsep _search tree_ dan _Binary Search Tree_ (BST) serta manfaatnya dalam proses pencarian data.
+ Mengimplementasikan struktur BST menggunakan pendekatan pemrograman berorientasi objek dalam bahasa Python.
+ Melakukan operasi dasar BST, meliputi penyisipan (_insert_), pencarian (_search_), serta pencarian nilai minimum dan maksimum.
+ Melakukan _traversal_ pada BST menggunakan tiga metode, yaitu _inorder_, _preorder_, dan _postorder_.
+ Memahami dan mengimplementasikan algoritma _Depth-First Search_ (DFS) pada struktur graf berbasis _dictionary_.
+ Memahami dan mengimplementasikan algoritma _Breadth-First Search_ (BFS) pada struktur graf berbasis _dictionary_.

= Dasar Teori

== Search Tree

_Search tree_ atau pohon pencarian merupakan struktur data hierarkis yang digunakan untuk menyimpan dan mengelola data secara terstruktur dalam ilmu komputer.
Setiap simpul (_node_) dalam pohon pencarian menyimpan suatu nilai dan dihubungkan dengan simpul-simpul lainnya melalui cabang (_edge_), membentuk relasi induk-anak (_parent-child_).
Prinsip kerja pohon pencarian didasarkan pada pengorganisasian data sedemikian rupa sehingga proses pencarian dapat dilakukan dengan mengeliminasi sebagian besar ruang pencarian pada setiap langkah.
Keunggulan utama dari struktur ini terletak pada kemampuannya dalam mempercepat proses pencarian data, di mana kompleksitas waktu pencarian dapat direduksi menjadi $O(h)$ dengan $h$ merupakan tinggi pohon.
Dalam konteks pemrograman, pohon pencarian dimanfaatkan dalam berbagai aplikasi seperti sistem basis data, algoritma kompresi data, representasi ekspresi matematika, dan pengambilan keputusan pada sistem cerdas @cormen2022introduction.

== Binary Search Tree (BST)

_Binary Search Tree_ merupakan jenis pohon pencarian biner yang memenuhi properti khusus, yaitu untuk setiap simpul, seluruh nilai pada _subtree_ kiri lebih kecil dari nilai simpul tersebut, dan seluruh nilai pada _subtree_ kanan lebih besar dari nilai simpul tersebut @gfg_bst.
Properti ini memungkinkan proses pencarian dilakukan dengan membandingkan nilai target terhadap nilai simpul saat ini, kemudian memutuskan arah pencarian ke _subtree_ kiri atau kanan, sehingga mengurangi ruang pencarian secara signifikan pada setiap langkah.

Operasi-operasi dasar pada BST meliputi penyisipan (_insert_), pencarian (_search_), dan pencarian nilai minimum dan maksimum.
Seluruh operasi tersebut memiliki kompleksitas waktu rata-rata $O(log n)$ pada BST yang seimbang dan $O(n)$ pada kasus terburuk ketika pohon menjadi tidak seimbang @cormen2022introduction.
Selain itu, BST mendukung tiga metode _traversal_ utama, yaitu:

+ _Inorder traversal_: mengunjungi _subtree_ kiri, simpul saat ini, kemudian _subtree_ kanan. Hasil dari metode ini adalah nilai-nilai dalam urutan terurut menaik (_sorted ascending_).
+ _Preorder traversal_: mengunjungi simpul saat ini, _subtree_ kiri, kemudian _subtree_ kanan. Metode ini berguna untuk menyalin struktur pohon.
+ _Postorder traversal_: mengunjungi _subtree_ kiri, _subtree_ kanan, kemudian simpul saat ini. Metode ini berguna untuk menghapus pohon dari memori.

== Depth-First Search (DFS)

_Depth-First Search_ merupakan algoritma _traversal_ atau pencarian pada struktur data graf yang bekerja dengan menelusuri cabang sedalam mungkin sebelum melakukan _backtracking_.
Algoritma DFS menggunakan struktur data _stack_ (tumpukan) untuk menyimpan simpul-simpul yang akan dikunjungi, baik secara eksplisit melalui _stack_ iteratif maupun implisit melalui mekanisme rekursi @gfg_dfs.
Prinsip kerja DFS adalah dengan mengunjungi simpul awal, kemudian menelusuri tetangga pertama secara rekursif hingga mencapai simpul yang tidak memiliki tetangga lagi, lalu kembali (_backtrack_) ke simpul sebelumnya untuk menelusuri cabang lainnya.

Kompleksitas waktu DFS adalah $O(V + E)$ dengan $V$ merupakan jumlah simpul (_vertices_) dan $E$ merupakan jumlah sisi (_edges_) pada graf.
Algoritma ini banyak digunakan dalam berbagai aplikasi, seperti deteksi siklus pada graf, _topological sorting_, pemecahan labirin (_maze solving_), dan analisis keterhubungan graf.

== Breadth-First Search (BFS)

_Breadth-First Search_ merupakan algoritma _traversal_ graf yang bekerja dengan mengunjungi seluruh simpul pada satu tingkat (_level_) sebelum berpindah ke tingkat berikutnya.
Algoritma BFS menggunakan struktur data _queue_ (antrean) untuk menyimpan simpul-simpul yang akan dikunjungi, sehingga simpul yang pertama ditemukan akan dikunjungi lebih dahulu (_First In First Out_) @gfg_bfs_vs_dfs.
Proses BFS dimulai dengan mengunjungi simpul awal, kemudian seluruh tetangga langsung dari simpul tersebut dikunjungi, lalu dilanjutkan ke tetangga-tetangga dari tetangga tersebut, dan seterusnya.
Kompleksitas waktu BFS sama dengan DFS, yaitu $O(V + E)$.
BFS unggul dalam menemukan jalur terpendek pada graf tidak berbobot dan banyak digunakan dalam aplikasi seperti _web crawling_, analisis jejaring sosial, dan navigasi @cormen2022introduction.

== Perbandingan DFS dan BFS

DFS dan BFS memiliki perbedaan mendasar dalam strategi penelusuran yang berdampak pada karakteristik dan penggunaannya.
DFS lebih hemat memori pada graf yang dalam karena hanya menyimpan satu jalur penelusuran dalam satu waktu, sedangkan BFS menyimpan seluruh simpul pada satu tingkat sehingga membutuhkan lebih banyak memori pada graf yang lebar.
Dalam hal jaminan pencarian, BFS menjamin ditemukannya jalur terpendek pada graf tidak berbobot, sedangkan DFS tidak menjamin hal tersebut.
Sebaliknya, DFS lebih cocok digunakan pada graf yang sangat dalam dan lebar karena penggunaan memorinya yang lebih efisien @gfg_bfs_vs_dfs.

#pagebreak()

= Hasil dan Pembahasan

== Tugas 1: Konsep Search Tree

_Search tree_ atau pohon pencarian merupakan struktur data hierarkis yang digunakan untuk menyimpan dan mengelola data secara terstruktur.
Setiap simpul dalam pohon pencarian dapat memiliki nol atau lebih simpul anak yang terhubung melalui cabang, membentuk struktur seperti pohon terbalik dengan akar (_root_) di bagian atas.
Prinsip utama dari pohon pencarian adalah pengorganisasian data berdasarkan nilai tertentu, sehingga proses pencarian dapat dilakukan secara efisien dengan membandingkan nilai target terhadap nilai simpul yang sedang dikunjungi.

Manfaat pohon pencarian dalam ilmu komputer sangat beragam.
Pertama, pohon pencarian memungkinkan pencarian data dilakukan dalam kompleksitas waktu logaritmik $O(log n)$ pada kondisi rata-rata, jauh lebih cepat dibandingkan pencarian linier $O(n)$ pada struktur data linier.
Kedua, pohon pencarian mendukung operasi penyisipan dan penghapusan data secara dinamis tanpa memerlukan penggeseran elemen seperti pada larik (_array_).
Ketiga, struktur hierarkis pohon pencarian secara alami merepresentasikan data yang memiliki relasi hierarkis, seperti struktur organisasi, klasifikasi biologis, dan pohon keputusan dalam kecerdasan buatan @cormen2022introduction.

Dalam konteks pencarian data, pohon pencarian memungkinkan eliminasi setengah dari ruang pencarian pada setiap langkah (pada BST yang seimbang), sehingga proses pencarian menjadi sangat efisien bahkan untuk kumpulan data yang besar.
Pendekatan _divide-and-conquer_ ini merupakan dasar dari berbagai algoritma pencarian modern @gfg_bst.

#pagebreak()

== Tugas 2: Algoritma BST, DFS, dan BFS

=== Binary Search Tree (BST)

Algoritma BST didasarkan pada properti fundamental bahwa untuk setiap simpul, seluruh nilai pada _subtree_ kiri lebih kecil dan seluruh nilai pada _subtree_ kanan lebih besar.
Operasi penyisipan dimulai dari akar: jika nilai yang akan disisipkan lebih kecil dari nilai akar, pencarian dilanjutkan ke _subtree_ kiri; jika lebih besar, ke _subtree_ kanan.
Proses ini diulang secara rekursif hingga ditemukan posisi kosong yang sesuai, kemudian simpul baru ditempatkan di posisi tersebut.
Pencarian nilai mengikuti logika yang serupa: nilai target dibandingkan dengan nilai simpul saat ini dan pencarian dilanjutkan ke kiri atau kanan sesuai hasil perbandingan hingga nilai ditemukan atau mencapai simpul kosong.
Pencarian nilai minimum dilakukan dengan menelusuri _subtree_ kiri secara terus-menerus hingga mencapai simpul paling kiri, sedangkan pencarian nilai maksimum dilakukan dengan menelusuri _subtree_ kanan hingga mencapai simpul paling kanan.
Ketiga metode _traversal_ -- inorder, preorder, dan postorder -- masing-masing memiliki karakteristik dan kegunaan yang berbeda seperti telah dijelaskan pada bagian Dasar Teori @cormen2022introduction.

=== Depth-First Search (DFS)

Algoritma DFS menggunakan prinsip LIFO (_Last In First Out_) yang diimplementasikan dengan struktur data _stack_.
Langkah-langkah algoritma DFS adalah sebagai berikut:
+ Simpul awal dimasukkan ke dalam _stack_.
+ Selama _stack_ tidak kosong, simpul dikeluarkan dari _stack_.
+ Jika simpul tersebut belum dikunjungi, simpul ditandai sebagai telah dikunjungi.
+ Seluruh tetangga dari simpul tersebut yang belum dikunjungi dimasukkan ke dalam _stack_.
+ Proses diulang hingga _stack_ kosong @gfg_dfs.

=== Breadth-First Search (BFS)

Algoritma BFS menggunakan prinsip FIFO (_First In First Out_) yang diimplementasikan dengan struktur data _queue_.
Langkah-langkah algoritma BFS adalah sebagai berikut:
+ Simpul awal dimasukkan ke dalam _queue_.
+ Selama _queue_ tidak kosong, simpul dikeluarkan dari _queue_.
+ Jika simpul tersebut belum dikunjungi, simpul ditandai sebagai telah dikunjungi.
+ Seluruh tetangga dari simpul tersebut yang belum dikunjungi dimasukkan ke dalam _queue_.
+ Proses diulang hingga _queue_ kosong @gfg_bfs_vs_dfs.

#pagebreak()

== Tugas 3: Diagram BST dari Nilai yang Diberikan

Dari nilai-nilai yang diberikan, yaitu `[50, 30, 70, 20, 40, 60, 80, 100]`, struktur BST yang terbentuk adalah sebagai berikut:

#img("assets/ss-bst-diagram.png", caption: [
  Struktur BST yang terbentuk dari penyisipan nilai [50, 30, 70, 20, 40, 60, 80, 100]
])

Proses pembentukan BST tersebut dilakukan dengan menyisipkan setiap nilai secara berurutan:
+ Nilai 50 menjadi akar (_root_).
+ Nilai 30 ditempatkan di _subtree_ kiri dari 50.
+ Nilai 70 ditempatkan di _subtree_ kanan dari 50.
+ Nilai 20 ditempatkan di _subtree_ kiri dari 30.
+ Nilai 40 ditempatkan di _subtree_ kanan dari 30.
+ Nilai 60 ditempatkan di _subtree_ kiri dari 70.
+ Nilai 80 ditempatkan di _subtree_ kanan dari 70.
+ Nilai 100 ditempatkan di _subtree_ kanan dari 80.

Setiap penyisipan mengikuti properti BST di mana nilai yang lebih kecil ditempatkan di _subtree_ kiri dan nilai yang lebih besar ditempatkan di _subtree_ kanan.
Hasil _traversal_ inorder dari BST tersebut menghasilkan urutan `[20, 30, 40, 50, 60, 70, 80, 100]` yang merupakan urutan menaik sempurna, membuktikan bahwa struktur BST telah terbentuk dengan benar.

#pagebreak()

== Tugas 4: Implementasi BST dalam Python

Implementasi BST dilakukan menggunakan pendekatan pemrograman berorientasi objek dengan dua kelas, yaitu `Node` dan `BST`.
Kelas `Node` merepresentasikan setiap simpul dalam pohon yang menyimpan atribut `key` (nilai), `left` (simpul kiri), dan `right` (simpul kanan).
Kelas `BST` mengelola seluruh operasi pohon dengan menyimpan referensi ke simpul akar melalui atribut `root`.

#include-code("src/bst.py", line-range: (1, 11))

=== Operasi Penyisipan (_Insert_)

Operasi penyisipan pada BST menggunakan algoritma rekursif.
Metode publik `insert()` menerima nilai yang akan disisipkan dan memanggil metode privat `_insert()` yang bekerja secara rekursif.
Pada setiap level rekursi, nilai yang akan disisipkan dibandingkan dengan nilai simpul saat ini: jika lebih kecil, pencarian dilanjutkan ke _subtree_ kiri; jika lebih besar, ke _subtree_ kanan; jika sama, nilai tidak perlu disisipkan kembali (_duplicate_ diabaikan).
Ketika simpul kosong (`None`) ditemukan, simpul baru dibuat dan dikembalikan.

#include-code("src/bst.py", line-range: (12, 23))

=== Operasi Pencarian (_Search_), Minimum, dan Maksimum

Operasi pencarian menggunakan algoritma rekursif yang membagi ruang pencarian menjadi dua pada setiap langkah.
Metode `search()` akan mengembalikan simpul jika nilai ditemukan atau `None` jika tidak ditemukan.
Pencarian nilai minimum dilakukan dengan menelusuri _subtree_ kiri secara iteratif hingga mencapai simpul paling kiri, sedangkan pencarian nilai maksimum menelusuri _subtree_ kanan hingga simpul paling kanan.
Seluruh operasi ini memiliki kompleksitas waktu $O(h)$ dengan $h$ merupakan tinggi pohon.

#include-code("src/bst.py", line-range: (25, 58))

=== Metode Traversal

Tiga metode _traversal_ diimplementasikan menggunakan algoritma rekursif dengan pola yang simetris.
Perbedaan mendasar terletak pada urutan operasi: _inorder_ mengunjungi kiri-akar-kanan, _preorder_ mengunjungi akar-kiri-kanan, dan _postorder_ mengunjungi kiri-kanan-akar.
Hasil _traversal_ disimpan dalam sebuah daftar (_list_) dan dikembalikan sebagai nilai akhir.

#include-code("src/bst.py", line-range: (60, 94))

=== Hasil Eksekusi Program

Program dijalankan dengan memasukkan nilai `[50, 30, 70, 20, 40, 60, 80, 100]`, kemudian menampilkan seluruh operasi yang telah diimplementasikan.

#img("assets/ss-bst.png", caption: [
  Output program BST yang menampilkan hasil pencarian nilai minimum dan maksimum, pengujian pencarian, serta hasil tiga metode traversal
])

Dari hasil eksekusi, dapat diamati bahwa _traversal_ inorder menghasilkan nilai dalam urutan menaik, _traversal_ preorder menghasilkan urutan yang sesuai dengan urutan penyisipan berdasarkan struktur pohon, dan _traversal_ postorder menghasilkan urutan dari simpul daun menuju akar.
Seluruh operasi berjalan sesuai dengan teori BST yang telah dijelaskan pada bagian Dasar Teori.

#pagebreak()

== Tugas 5: Implementasi DFS dan BFS pada Graf

=== Representasi Graf

Graf direpresentasikan menggunakan struktur data _dictionary_ (_adjacency list_), di mana setiap simpul (_vertex_) dipetakan ke daftar (_list_) tetangganya.
Graf yang digunakan dalam implementasi ini memiliki struktur seperti pohon biner dengan tujuh simpul: `A` sebagai akar yang terhubung ke `B` dan `C`; `B` terhubung ke `D` dan `E`; `C` terhubung ke `F` dan `G`.
Simpul `D`, `E`, `F`, dan `G` merupakan simpul daun yang tidak memiliki tetangga.

#include-code("src/graph_search.py", line-range: (3, 12))

=== Implementasi DFS

Fungsi `dfs()` mengimplementasikan algoritma DFS menggunakan struktur data _stack_ (daftar Python dengan metode `pop()`).
Simpul awal dimasukkan ke dalam _stack_, kemudian selama _stack_ tidak kosong, simpul dikeluarkan dari _stack_ menggunakan `pop()`.
Jika simpul tersebut belum dikunjungi, simpul ditambahkan ke daftar `visited` dan seluruh tetangganya dimasukkan ke dalam _stack_.
Urutan tetangga dibalik menggunakan `reversed()` agar penelusuran sesuai dengan urutan _adjacency list_ (dari kiri ke kanan).
Kompleksitas waktu DFS adalah $O(V + E)$.

#include-code("src/graph_search.py", line-range: (15, 27))

=== Implementasi BFS

Fungsi `bfs()` mengimplementasikan algoritma BFS menggunakan struktur data _queue_ dari modul `collections.deque`.
Simpul awal dimasukkan ke dalam _queue_, kemudian selama _queue_ tidak kosong, simpul dikeluarkan dari _queue_ menggunakan `popleft()`.
Jika simpul tersebut belum dikunjungi, simpul ditambahkan ke daftar `visited` dan seluruh tetangganya dimasukkan ke dalam _queue_.
Penggunaan `popleft()` memastikan bahwa simpul yang pertama kali ditemukan akan dikunjungi lebih dahulu (FIFO).
Kompleksitas waktu BFS sama dengan DFS, yaitu $O(V + E)$.

#include-code("src/graph_search.py", line-range: (30, 41))

=== Hasil Eksekusi Program

Program dijalankan dengan simpul awal `A` untuk kedua algoritma.

#img("assets/ss-graph.png", caption: [
  Output program DFS dan BFS yang menampilkan representasi graf serta hasil traversal dari simpul A
])

Hasil eksekusi menunjukkan perbedaan karakteristik DFS dan BFS:
+ DFS dari A: `['A', 'B', 'D', 'E', 'C', 'F', 'G']` -- menelusuri cabang A-B secara mendalam terlebih dahulu hingga mencapai simpul daun, kemudian _backtrack_ ke cabang A-C.
+ BFS dari A: `['A', 'B', 'C', 'D', 'E', 'F', 'G']` -- mengunjungi simpul berdasarkan tingkat (_level_), dimulai dari A (level 0), kemudian B dan C (level 1), kemudian D, E, F, G (level 2).

Perbedaan ini sesuai dengan teori bahwa DFS menelusuri kedalaman terlebih dahulu sedangkan BFS menelusuri tingkat per tingkat @gfg_bfs_vs_dfs.

#pagebreak()

= Kesimpulan

Berdasarkan hasil praktikum yang telah dilakukan, dapat disimpulkan beberapa hal sebagai berikut:

+ Konsep _search tree_ dan BST telah dipahami dengan baik, di mana struktur data ini memungkinkan pencarian data dilakukan secara efisien melalui pengorganisasian data secara hierarkis dengan kompleksitas waktu $O(h)$.
+ Struktur BST berhasil diimplementasikan menggunakan pendekatan pemrograman berorientasi objek dalam bahasa Python melalui kelas `Node` dan `BST`.
+ Operasi dasar BST, meliputi penyisipan (_insert_), pencarian (_search_), serta pencarian nilai minimum dan maksimum, berhasil diimplementasikan dan diuji menggunakan data `[50, 30, 70, 20, 40, 60, 80, 100]` dengan hasil yang sesuai dengan teori BST.
+ Tiga metode _traversal_ BST, yaitu _inorder_, _preorder_, dan _postorder_, berhasil diimplementasikan dan menghasilkan urutan nilai yang berbeda sesuai dengan karakteristik masing-masing metode.
+ Algoritma DFS berhasil diimplementasikan pada struktur graf berbasis _dictionary_ menggunakan struktur data _stack_, dengan hasil _traversal_ yang menelusuri cabang secara mendalam terlebih dahulu sebelum melakukan _backtracking_.
+ Algoritma BFS berhasil diimplementasikan pada struktur graf berbasis _dictionary_ menggunakan struktur data _queue_, dengan hasil _traversal_ yang mengunjungi simpul berdasarkan tingkat (_level_) secara berurutan.

#pagebreak()

#heading(level: 1, numbering: none)[Lampiran]
#heading(level: 2, numbering: none, outlined: false)[Source Code BST (`bst.py`)]
#include-code("src/bst.py")

#heading(level: 2, numbering: none, outlined: false)[Source Code DFS dan BFS (`graph_search.py`)]
#include-code("src/graph_search.py")
