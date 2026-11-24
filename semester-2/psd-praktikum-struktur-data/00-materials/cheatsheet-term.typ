// Cheatsheet Praktikum Struktur Data — v3
// Target: maksimum 3 lembar A4 bolak-balik = 6 halaman.
// Fokus ujian PG: konsep, terminologi, cara kerja, trade-offs, use cases, traps.
// Kode Python dibuat minimal; detail pointer/iterasi panjang sengaja dikurangi.

#set document(title: [Cheatsheet Praktikum Struktur Data v3])

#set page(
  paper: "a4",
  flipped: true,
  margin: (top: 4.6mm, bottom: 4.6mm, left: 5.4mm, right: 5.4mm),
  columns: 3,
)

#set text(
  font: "Times New Roman",
  size: 7.35pt,
  hyphenate: true,
)

#set par(
  justify: true,
  first-line-indent: 0pt,
  spacing: 0.34em,
  leading: 0.30em,
)

#set heading(numbering: "1.")
#show heading: it => block(spacing: auto, it)
#show heading.where(level: 1): it => {
  it
  box(width: 1fr, line(length: 100%, stroke: 0.35pt + black))
}
#show heading.where(level: 2): set text(size: 7.15pt)

#show raw: set text(font: "Fira Code Retina", size: 5.65pt)
#show raw.where(block: true): block.with(inset: 2.0pt, stroke: 0.18pt + black)

#let cbox(body) = block(
  stroke: 0.36pt + black,
  inset: 2.7pt,
  breakable: true,
  width: 100%,
  body,
)
#let warn(body) = block(
  stroke: 0.36pt + black,
  fill: luma(245),
  inset: 2.7pt,
  breakable: true,
  width: 100%,
  [*Trap PG:* #body],
)
#let key(body) = block(
  stroke: 0.25pt + black,
  fill: luma(250),
  inset: 2.4pt,
  breakable: true,
  width: 100%,
  body,
)

// ═══════════════════════════════════════
// PAGE 1 — STRATEGI PG + PYTHON + CORE DS
// ═══════════════════════════════════════

= Strategi PG Struktur Data

#cbox[
  Jawab soal PG dengan mencocokkan *kata kunci* ke lima hal: prinsip struktur data, syarat algoritma, operasi dominan, kompleksitas waktu, dan kompleksitas memori. Kata pemicu paling sering: *sorted*, *random access*, *FIFO/LIFO*, *balanced*, *visited*, *prefix*, *collision*, *frequency*, *stable*, *in-place*, *extra memory*.
]

== Peta Prioritas
#table(
  columns: (1.05fr, 2fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Basic, cukup ringkas*],
  [function, list syntax, tree terminology, operasi stack/queue dasar],

  [*Medium*], [sorting sederhana, linked list, deque, hash table, map function],
  [*Rawan PG*],
  [stable sorting, auxiliary space, binary/interpolation search, BST balanced vs skewed, BFS/DFS memory, trie prefix vs word, heap/priority queue, Huffman],
)

== Big-O dan Auxiliary Space
#table(
  columns: (auto, 1.15fr, 1.75fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Notasi*], [*Makna*], [*Contoh*],
  [`O(1)`], [konstan], [akses `a[i]`, `dict[k]` average, peek heap/root],
  [`O(log n)`],
  [membagi ruang kerja],
  [binary search, heap push/pop, BST balanced],

  [`O(n)`], [scan/traverse], [linear search, loop list, tree traversal],
  [`O(n log n)`],
  [sort efisien umum],
  [merge sort, quick avg, Timsort avg/worst],

  [`O(n²)`], [nested comparison], [selection, bubble worst, insertion worst],
  [`O(V+E)`], [graph list], [BFS/DFS adjacency list],
  [`O(V²)`], [matrix graph], [adjacency matrix memory],
)

#key[
  *Auxiliary space* = memori tambahan selain input. Jangan dicampur dengan ukuran output. Contoh: merge sort butuh array bantu `O(n)`, quick sort in-place tetap punya call stack, DFS rekursif punya stack.
]

#warn[Kompleksitas sering bersyarat. BST `O(log n)` hanya kalau balanced. Hash table `O(1)` hanya average. Bubble best `O(n)` hanya kalau implementasi punya early stop.]

= Python-Specific Concepts & Traps

== Function dan Mutability
```python
def f(x, default=0):
    return x + default
```
`return` menghasilkan nilai; `print` hanya menampilkan. Untuk soal tracing, cek yang ditanya output layar atau nilai balik fungsi.

#warn[Default argument mutable rawan: `def f(a=[])` memakai list yang sama antar pemanggilan. Aman: `def f(a=None): ...`.]

== List Operasi Inti
#table(
  columns: (auto, auto, 1.45fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Operasi*], [*Time*], [*Catatan*],
  [`a[i]`], [`O(1)`], [random access berbasis index],
  [`append(x)`], [`O(1)` avg], [tambah belakang],
  [`pop()`], [`O(1)`], [hapus belakang],
  [`insert(0,x)`], [`O(n)`], [geser banyak elemen],
  [`pop(0)`], [`O(n)`], [jangan untuk queue besar],
  [`x in a`], [`O(n)`], [scan linear],
)

== `map()` Lazy Evaluation
#cbox[
  `map(func, iterable)` di Python menghasilkan *lazy iterator*, bukan list langsung. Elemen baru dihitung saat iterator dikonsumsi, misalnya saat dipanggil `list(map(...))`, di-loop, atau diambil dengan `next`. Karena lazy, `map` hemat memori untuk pipeline besar, tetapi hasilnya tidak bisa langsung di-index seperti list.
]

```python
m = map(lambda x: x*x, [1, 2, 3])
list(m)  # [1, 4, 9]
```

#warn[Iterator bisa habis. Setelah `list(m)` pertama, iterator `m` sudah terkonsumsi. Pemanggilan kedua bisa kosong.]

= Stack, Queue, Deque

#table(
  columns: (auto, auto, 1.35fr, 1.45fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*DS*], [*Prinsip*], [*Operasi*], [*Keyword Soal*],
  [Stack],
  [LIFO],
  [`push`, `pop`, `peek/top`],
  [undo/redo, call stack, matching bracket],

  [Queue],
  [FIFO],
  [`enqueue`, `dequeue`, `front`],
  [antrean, printer queue, BFS],

  [Deque],
  [dua ujung],
  [`appendleft`, `popleft`, `append`, `pop`],
  [sliding window, bisa stack/queue],
)

```python
from collections import deque
s = []; s.append(x); x = s.pop()
q = deque(); q.append(x); x = q.popleft()
```

#warn[`list.pop(0)` untuk queue adalah `O(n)` karena elemen digeser. `deque.popleft()` adalah `O(1)`.]

== Kapan Pakai Apa?
#table(
  columns: (1.25fr, 1fr, 1.6fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Skenario*], [*Pilih*], [*Alasan*],
  [validasi tanda kurung], [Stack], [pasangan terakhir harus ditutup dulu],
  [antrean pelanggan], [Queue], [yang datang dulu dilayani dulu],
  [BFS graph/tree], [Queue], [proses per level/jarak],
  [undo/redo], [Stack], [aksi terakhir dibatalkan dulu],
  [tambah/hapus dua ujung], [Deque], [operasi depan-belakang sama-sama penting],
)

= Hash Table / Dictionary

#cbox[
  Hash table menyimpan pasangan *key -> value*. Python `dict` adalah hash table. Key harus unik dan hashable; value bebas. Operasi insert/search/delete rata-rata `O(1)` karena key diubah oleh hash function menjadi lokasi internal.
]

#table(
  columns: (1fr, 1.1fr, 1.7fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Operasi*], [*Average*], [*Trap*],
  [`d[k]`], [`O(1)`], [`KeyError` jika key tidak ada],
  [`d.get(k,0)`], [`O(1)`], [aman untuk default value],
  [`k in d`], [`O(1)`], [cek key, bukan value],
  [`for k,v in d.items()`], [`O(n)`], [traverse semua pasangan],
  [`del d[k]`], [`O(1)` avg], [`KeyError` jika key hilang],
)

== Collision dan Worst-Case
#cbox[
  *Collision* terjadi saat banyak key jatuh ke bucket/index internal yang sama. Collision tidak berarti data hilang; hash table punya resolusi collision seperti chaining atau probing. Namun jika collision ekstrem, operasi yang biasanya average `O(1)` bisa memburuk menjadi worst-case `O(n)` karena harus membedakan banyak key dalam bucket/rantai yang sama.
]

#warn[Soal PG sering bilang "hash table selalu O(1)". Yang benar: average/amortized `O(1)`, worst-case `O(n)` pada collision ekstrem atau distribusi hash buruk.]


// ═══════════════════════════════════════
// PAGE 2 — SORTING + STABILITY + PYTHON TIMSORT
// ═══════════════════════════════════════

= Sorting: Mental Model

#cbox[
  Sorting = mengurutkan data berdasarkan key tertentu, misalnya angka naik, nama alfabetis, atau record berdasarkan field. Sorting penting karena banyak operasi lain menjadi lebih mudah: binary search, grouping, ranking, median, dedup terurut, laporan, dan analisis data.
]

== Tiga Pertanyaan PG Sorting
#table(
  columns: (1.25fr, 2fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Pertanyaan*], [*Yang Dicek*],
  [Sudah sorted atau hampir sorted?],
  [insertion/bubble optimized bisa lebih cepat],

  [Butuh stabilitas?], [multi-kriteria dan record dengan key sama],
  [Boleh pakai memori tambahan?],
  [merge/Timsort butuh extra space; selection/insertion/bubble in-place],

  [Worst-case penting?], [merge konsisten; quick bisa buruk kalau pivot jelek],
)

= Stable vs Unstable Sorting

== Definisi Stable Sorting
#cbox[
  Sorting disebut *stable* jika dua elemen dengan key yang sama tetap mempertahankan urutan relatif aslinya setelah diurutkan. Stabilitas bukan soal hasil angka benar atau salah, tetapi soal urutan record yang key-nya sama.
]

== Kenapa Stable Penting?
#key[
  Stable sorting penting untuk *multi-kriteria sorting*. Misal data mahasiswa sudah diurutkan berdasarkan `nama`, lalu di-sort lagi berdasarkan `kelas`. Jika sort kedua stable, urutan `nama` di dalam kelas yang sama tetap rapi.
]

Contoh record:
```text
(Ana, B), (Budi, A), (Cici, B), (Dian, A)
```
Sort by kelas stable menghasilkan:
```text
(Budi, A), (Dian, A), (Ana, B), (Cici, B)
```
Urutan Budi sebelum Dian dan Ana sebelum Cici tetap sesuai urutan awal di kelompok key yang sama.

== Stable atau Tidak?
#table(
  columns: (auto, auto, 2fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Algoritma*], [*Stable?*], [*Alasan Inti*],
  [Insertion],
  [Ya],
  [elemen digeser, elemen dengan key sama tidak perlu ditukar melewati satu sama lain],

  [Bubble],
  [Ya],
  [jika hanya swap saat `>` bukan `>=`, elemen setara tidak tertukar],

  [Merge], [Ya], [saat merge, pilih elemen kiri dulu ketika key sama],
  [Selection],
  [Tidak],
  [swap minimum ke depan bisa melompati record dengan key sama],

  [Quick],
  [Umumnya tidak],
  [partisi dan swap pivot/elemen bisa memindahkan elemen setara melewati urutan awal],

  [Heap],
  [Tidak],
  [heap hanya menjaga prioritas root, bukan urutan relatif elemen setara],

  [Python Timsort], [Ya], [dirancang stable untuk `list.sort()` dan `sorted()`],
)

#warn[Stable tidak sama dengan in-place. Merge sort biasanya stable tapi tidak in-place karena butuh array bantu. Selection sort in-place tapi tidak stable.]

= Tabel Sorting: Time dan Space

#table(
  columns: (auto, auto, auto, auto, auto),
  inset: 1.9pt,
  stroke: 0.20pt + black,
  [*Algo*], [*Best*], [*Avg*], [*Worst*], [*Aux Space*],
  [Selection], [`O(n²)`], [`O(n²)`], [`O(n²)`], [`O(1)`],
  [Insertion], [`O(n)`], [`O(n²)`], [`O(n²)`], [`O(1)`],
  [Bubble], [`O(n)`], [`O(n²)`], [`O(n²)`], [`O(1)`],
  [Merge], [`O(n log n)`], [`O(n log n)`], [`O(n log n)`], [`O(n)`],
  [Quick], [`O(n log n)`], [`O(n log n)`], [`O(n²)`], [`O(log n)` avg stack],
  [Heap],
  [`O(n log n)`],
  [`O(n log n)`],
  [`O(n log n)`],
  [`O(1)` sort, `O(n)` heap data],

  [Timsort], [`O(n)`], [`O(n log n)`], [`O(n log n)`], [`O(n)` worst],
)
`*` Bubble best `O(n)` hanya dengan flag early stop dan data sudah sorted.

#warn[Quick sort in-place partition sering disebut auxiliary `O(log n)` karena recursion stack rata-rata. Worst-case stack bisa `O(n)` jika partisi sangat tidak seimbang terus.]

= Cara Kerja Algoritma Sorting

== Selection Sort
#cbox[
  Ide: cari elemen minimum dari bagian belum terurut, lalu tukar ke posisi depan. Setelah pass ke-`i`, posisi `0..i` sudah final. Keunggulan: jumlah swap sedikit. Kelemahan: tetap mencari minimum meski data sudah sorted, jadi best tetap `O(n²)`.
]

== Insertion Sort
#cbox[
  Ide: bangun bagian kiri yang sudah sorted. Ambil satu elemen, geser elemen kiri yang lebih besar, lalu sisipkan di posisi benar. Sangat bagus untuk data kecil atau hampir sorted karena perpindahan sedikit; best `O(n)` saat data sudah urut.
]

== Bubble Sort
#cbox[
  Ide: bandingkan pasangan tetangga dan swap jika salah urutan. Elemen terbesar "menggelembung" ke akhir setelah satu pass. Tanpa early stop, tetap `O(n²)` meski sudah sorted. Dengan early stop, best bisa `O(n)`.
]

== Merge Sort
#cbox[
  Ide: divide and conquer. Pecah array jadi dua, sort masing-masing, lalu merge dua list terurut. Time konsisten `O(n log n)` dan stable, tetapi butuh memori tambahan `O(n)` untuk proses merge.
]

== Quick Sort
#cbox[
  Ide: pilih pivot, partisi data menjadi elemen lebih kecil dan lebih besar, lalu rekursi. Cepat secara praktik dan average `O(n log n)`, tetapi unstable dan bisa worst `O(n²)` jika pivot terus buruk, misalnya selalu memilih elemen terkecil/terbesar.
]

= Python Sorting: Timsort

#cbox[
  Python `list.sort()` dan `sorted()` memakai *Timsort*, algoritma hybrid dari merge sort dan insertion sort. Sifat penting untuk PG: stable, best `O(n)` pada data yang sudah/hampir terurut, average/worst `O(n log n)`, dan auxiliary space worst `O(n)`.
]

#table(
  columns: (auto, 2fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [`a.sort()`],
  [mengubah list asli secara in-place dari perspektif API dan return `None`],

  [`sorted(a)`], [membuat list baru, input asli tidak berubah],
  [`key=`], [menentukan field/aturan sort, misal `key=lambda r: r[1]`],
  [`reverse=True`], [descending],
)

#warn[`list.sort()` disebut in-place karena objek list yang sama diurutkan, tetapi algoritma internal Timsort tetap dapat memakai auxiliary memory. Jangan campur API in-place dengan auxiliary space algoritma.]

= Kapan Pakai Sorting X?

#table(
  columns: (1.45fr, 1fr, 1.55fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Kondisi Soal*], [*Cocok*], [*Alasan*],
  [data kecil/hampir sorted], [Insertion], [best `O(n)`, sederhana],
  [butuh stable + worst konsisten], [Merge/Timsort], [`O(n log n)` stabil],
  [memori sangat terbatas], [Selection/Insertion], [aux `O(1)`],
  [swap mahal], [Selection], [jumlah swap sedikit],
  [praktik Python], [`sort/sorted`], [Timsort stable dan optimized],
  [belajar divide-and-conquer cepat], [Quick], [average bagus, tapi worst risk],
)


// ═══════════════════════════════════════
// PAGE 3 — SEARCHING + HEAP / PRIORITY QUEUE
// ═══════════════════════════════════════

= Searching

#cbox[
  Searching = mencari apakah target ada dan/atau posisinya. Kecepatan search sangat tergantung kondisi data. Data acak biasanya linear. Data sorted membuka peluang binary/interpolation. Data berbasis key lebih cocok hash table. Data prefix lebih cocok trie.
]

== Tabel Searching
#table(
  columns: (auto, 1.45fr, 1.25fr, 1.35fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Algo*], [*Syarat*], [*Time*], [*Keyword*],
  [Linear],
  [bebas, tidak perlu sorted],
  [best `O(1)`, worst `O(n)`],
  [cek satu-satu],

  [Binary],
  [sorted + random access],
  [`O(log n)`],
  [ambil tengah, buang setengah],

  [Interpolation],
  [sorted + numerik + merata],
  [avg `O(log log n)`, worst `O(n)`],
  [tebak posisi dari nilai],

  [Dict lookup], [key hashable], [avg `O(1)`, worst `O(n)`], [cari by key/ID],
  [Trie], [string/prefix], [`O(m)`], [autocomplete/prefix],
)

== Linear Search
#cbox[
  Linear search memeriksa elemen dari awal sampai target ditemukan atau data habis. Tidak butuh data sorted dan cocok untuk list kecil, data acak, linked list, atau struktur yang tidak punya random access. Worst-case `O(n)` terjadi saat target di akhir atau tidak ada.
]

== Binary Search
#cbox[
  Binary search hanya valid pada data sorted dan struktur dengan akses tengah cepat. Cara kerja: ambil `mid`; jika target lebih kecil, buang kanan; jika lebih besar, buang kiri. Tiap langkah mengurangi ruang pencarian kira-kira setengah, maka `O(log n)`.
]

#key[
  Loop binary search biasanya memakai kondisi `lo <= hi` karena saat `lo == hi` masih ada satu elemen yang perlu diperiksa. Setelah cek `mid`, batas harus bergerak melewati `mid`: `lo = mid + 1` atau `hi = mid - 1`.
]

#warn[Binary search pada linked list sorted tidak praktis. Walau datanya sorted, mencari node tengah butuh traversal, sehingga keuntungan `O(log n)` hilang.]

== Interpolation Search
#cbox[
  Interpolation search menebak posisi target berdasarkan proporsi nilainya terhadap nilai ujung bawah dan atas. Ia bisa sangat cepat pada data numerik yang sorted dan terdistribusi merata, tetapi bisa jatuh ke `O(n)` pada data tidak merata.
]

```python
pos = lo + ((x-a[lo]) * (hi-lo)) // (a[hi]-a[lo])
```

#warn[Interpolation search bukan "binary search yang lebih cepat untuk semua kasus". Syaratnya lebih ketat: sorted, numerik, dan distribusi relatif merata.]

= Sorting vs Searching Trade-off

#table(
  columns: (1.45fr, 1.1fr, 1.65fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Skenario*], [*Pilih*], [*Alasan*],
  [sekali cari di data acak kecil], [Linear], [sorting dulu tidak worth it],
  [banyak query pada data statis], [Sort + Binary], [biaya sort dibayar sekali],
  [sering cari by ID unik], [Hash table], [langsung key -> value],
  [autocomplete kata], [Trie], [berdasarkan prefix, bukan numeric order],
  [range query sorted],
  [Sorted list/BST],
  [butuh urutan, bukan sekadar exact key],
)

== Rumus Cost Intuitif
#key[
  Sorting dulu membutuhkan `O(n log n)`. Kalau cuma satu kali search, linear `O(n)` sering lebih masuk akal. Kalau search dilakukan berkali-kali, sort sekali lalu binary search `O(log n)` per query bisa lebih hemat.
]

= Priority Queue / Heap Basics

== Apa itu Priority Queue?
#cbox[
  Priority queue adalah struktur data yang mengeluarkan elemen berdasarkan prioritas, bukan berdasarkan urutan datang. Elemen dengan prioritas tertinggi atau terendah diproses dulu. Implementasi umum: binary heap.
]

== Heap Mental Model
#cbox[
  Heap adalah binary tree yang biasanya *complete* dan memenuhi *heap property*. Pada min-heap, parent selalu lebih kecil atau sama dengan child, sehingga root adalah elemen terkecil. Pada max-heap, root adalah elemen terbesar. Heap bukan BST: subtree kiri/kanan tidak menjamin urutan pencarian seperti BST.
]

== `heapq` Python
#table(
  columns: (auto, auto, 1.6fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Operasi*], [*Time*], [*Catatan*],
  [`heapq.heapify(a)`], [`O(n)`], [ubah list menjadi min-heap],
  [`heappush(h,x)`], [`O(log n)`], [insert lalu perbaiki heap],
  [`heappop(h)`], [`O(log n)`], [ambil root terkecil],
  [`h[0]`], [`O(1)`], [peek elemen terkecil],
)

```python
import heapq
h = [5, 1, 9]
heapq.heapify(h)
heapq.heappush(h, 2)
smallest = heapq.heappop(h)  # 1
```

#warn[`heapq` bawaan Python adalah *min-heap*. Untuk max-heap klasik, biasanya simpan nilai negatif, misal `-priority`.]

== Heap Use Cases
#table(
  columns: (1.35fr, 1fr, 1.6fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Use Case*], [*Kenapa Heap*], [*Catatan*],
  [ambil top-k], [root cepat], [tidak perlu sort semua],
  [scheduler task], [prioritas], [tugas prioritas tinggi keluar dulu],
  [Dijkstra], [min distance], [weighted shortest path],
  [Huffman], [dua frekuensi terkecil], [min-heap dipakai berulang],
  [median streaming], [dua heap], [advanced, tapi konsep prioritas],
)

#warn[Heap bagus untuk ambil min/max berulang, bukan untuk mencari elemen arbitrary. Search sembarang nilai di heap tetap bisa `O(n)`.]


// ═══════════════════════════════════════
// PAGE 4 — LINKED LIST + TREE + BST
// ═══════════════════════════════════════

= Linked List

== Mental Model
#cbox[
  Linked list adalah rangkaian node. Tiap node menyimpan data dan pointer ke node berikutnya. Node tidak harus bersebelahan di memori. Akses selalu mulai dari `head`, lalu mengikuti pointer satu per satu.
]

#table(
  columns: (auto, 1.35fr, 1.55fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Jenis*], [*Pointer*], [*Ciri*],
  [Singly], [`next`], [traversal satu arah],
  [Doubly],
  [`prev` + `next`],
  [bisa maju-mundur; delete lebih mudah jika node diketahui],

  [Circular],
  [tail ke head],
  [tidak ada `None` di akhir; hati-hati infinite loop],
)

== Linked List vs Array/List
#table(
  columns: (auto, auto, auto, 1.5fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Operasi*], [*Array/List*], [*Linked List*], [*Catatan*],
  [akses index], [`O(1)`], [`O(n)`], [LL tidak random access],
  [insert awal], [`O(n)`], [`O(1)`], [LL cukup ubah head],
  [hapus awal], [`O(n)`], [`O(1)`], [LL cukup geser head],
  [insert akhir], [`O(1)` avg], [`O(n)` / `O(1)` tail], [tergantung ada tail],
  [search value], [`O(n)`], [`O(n)`], [keduanya scan],
)

#warn[Linked list bukan otomatis lebih cepat. Ia unggul saat banyak insert/delete di posisi yang node-nya sudah diketahui, tetapi buruk untuk random access dan cache locality.]

== Pointer Edge Cases untuk PG
#cbox[
  Edge case linked list: list kosong, satu node, target di head, target tidak ditemukan, circular list tanpa kondisi berhenti, dan lupa menjaga pointer `prev` pada doubly linked list. Untuk PG konseptual, cukup tahu bahwa insert/delete adalah operasi mengubah pointer, bukan menggeser array.
]

= Tree Dasar

#cbox[
  Tree adalah struktur hierarkis. Root = node paling atas. Parent/child = relasi atas-bawah. Leaf = node tanpa child. Edge = hubungan. Depth = jarak dari root ke node. Height = jarak dari node ke leaf terdalam. Subtree = tree yang berakar pada node tertentu.
]

== Binary Tree Terminology
#table(
  columns: (auto, 2fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Istilah*], [*Ciri*],
  [Binary Tree], [setiap node maksimal punya dua child],
  [Full], [setiap node punya 0 atau 2 child],
  [Complete],
  [semua level penuh kecuali terakhir; level terakhir diisi dari kiri],

  [Perfect], [semua internal punya 2 child dan semua leaf di level sama],
  [Balanced], [tinggi subtree relatif seimbang],
  [Skewed], [miring satu sisi; mirip linked list],
)

#warn[Binary tree bukan otomatis BST. BST adalah binary tree dengan aturan ordering khusus.]

= Tree Traversal dan Space

#table(
  columns: (auto, 1.25fr, 1.6fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Traversal*], [*Urutan*], [*Keyword PG*],
  [Preorder], [Root -> Left -> Right], [root dulu; serialize/copy tree],
  [Inorder], [Left -> Root -> Right], [BST menghasilkan sorted order],
  [Postorder], [Left -> Right -> Root], [hapus subtree; evaluasi postfix],
  [Level-order], [per level kiri ke kanan], [BFS tree; pakai queue],
)

== Traversal Memory
#table(
  columns: (auto, 1.15fr, 1.75fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Traversal*], [*Aux Space*], [*Alasan*],
  [DFS recursive], [`O(h)`], [`h` = height; call stack mengikuti kedalaman],
  [DFS iterative], [`O(h)` avg tree], [pakai stack eksplisit],
  [BFS / level-order], [`O(w)`], [`w` = width; queue menyimpan node satu level],
)

#warn[DFS tree sering disebut `O(h)` space, bukan selalu `O(n)`. Pada tree skewed, `h = n`, jadi bisa menjadi `O(n)`. Pada tree balanced, `h = log n`.]

= Binary Search Tree (BST)

== Rule BST
#cbox[
  BST: untuk setiap node, semua nilai di subtree kiri lebih kecil dari node, semua nilai di subtree kanan lebih besar dari node. Duplicate harus punya policy: diabaikan, dihitung `count`, atau konsisten masuk kiri/kanan.
]

== Operasi BST
#table(
  columns: (auto, auto, auto, 1.45fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Operasi*], [*Balanced*], [*Skewed*], [*Intuisi*],
  [Search], [`O(log n)`], [`O(n)`], [bandingkan lalu turun kiri/kanan],
  [Insert], [`O(log n)`], [`O(n)`], [cari posisi leaf kosong],
  [Delete], [`O(log n)`], [`O(n)`], [cari node + perbaiki link],
  [Inorder], [`O(n)`], [`O(n)`], [kunjungi semua node sorted],
)

== Delete BST: 3 Kasus Konseptual
#table(
  columns: (auto, 2.1fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Kasus*], [*Aksi*],
  [Leaf], [hapus langsung; parent menunjuk `None`],
  [1 child], [ganti node dengan child-nya],
  [2 child],
  [ganti value dengan inorder successor atau predecessor, lalu hapus node pengganti],
)

#warn[Input sorted yang dimasukkan berurutan bisa membuat BST skewed. Akibatnya BST kehilangan keuntungan binary search dan menjadi mirip linked list.]

== BST vs Binary Search Array
#table(
  columns: (1.2fr, 1fr, 1.6fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Kebutuhan*], [*Pilih*], [*Alasan*],
  [data statis sorted],
  [Array + Binary Search],
  [search cepat, memori sederhana],

  [sering insert/delete sorted], [BST balanced], [struktur tetap terurut],
  [range traversal sorted], [BST], [inorder menghasilkan urutan],
  [akses index ke-k], [Array/List], [BST biasa tidak indexable],
)


// ═══════════════════════════════════════
// PAGE 5 — GRAPH BFS/DFS + REPRESENTATION
// ═══════════════════════════════════════

= Graph

== Definisi
#cbox[
  Graph `G = (V, E)` terdiri dari vertex/simpul dan edge/sisi. Berbeda dari tree, graph boleh punya cycle, boleh tidak connected, dan tidak wajib punya root. Graph cocok untuk relasi banyak-ke-banyak: peta jalan, jaringan komputer, social network, dependency, rute, dan rekomendasi.
]

== Jenis Graph
#table(
  columns: (auto, 2fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Jenis*], [*Ciri*],
  [Undirected], [edge dua arah: A--B berarti A ke B dan B ke A],
  [Directed], [edge satu arah: A -> B belum tentu B -> A],
  [Weighted], [edge punya bobot: jarak, biaya, waktu],
  [Unweighted], [edge hanya menyatakan ada/tidak hubungan],
  [Connected], [semua vertex dapat dijangkau dari vertex lain],
  [Cyclic], [ada path yang kembali ke node awal],
  [DAG], [directed acyclic graph; umum untuk dependency/topological order],
)

= Representasi Graph

#table(
  columns: (auto, 1fr, 1fr, 1.35fr),
  inset: 1.9pt,
  stroke: 0.20pt + black,
  [*Representasi*], [*Memory*], [*Cek Edge*], [*Cocok Untuk*],
  [Adjacency List],
  [`O(V+E)`],
  [`O(deg(u))`],
  [sparse graph, praktik Python, traversal],

  [Adjacency Matrix],
  [`O(V²)`],
  [`O(1)`],
  [dense graph, sering cek koneksi langsung],

  [Edge List],
  [`O(E)`],
  [`O(E)`],
  [algoritma berbasis daftar edge, sorting edge],
)

#key[
  Graph sparse: edge jauh lebih sedikit dari `V²`, adjacency list lebih hemat. Graph dense: edge mendekati `V²`, adjacency matrix kadang masuk akal karena cek edge cepat.
]

#warn[Untuk undirected graph di adjacency list, edge A--B biasanya disimpan dua kali: A punya B dan B punya A.]

= BFS vs DFS

#table(
  columns: (auto, 1fr, 1.55fr, auto),
  inset: 1.9pt,
  stroke: 0.20pt + black,
  [*Algo*], [*Struktur*], [*Pola*], [*Time*],
  [BFS],
  [Queue/FIFO],
  [melebar per level; jarak terpendek unweighted],
  [`O(V+E)`],

  [DFS], [Stack/recursion/LIFO], [sedalam mungkin lalu backtrack], [`O(V+E)`],
)

== Memory BFS/DFS
#table(
  columns: (auto, 1fr, 1.75fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Konteks*], [*Aux Space*], [*Catatan*],
  [Tree DFS], [`O(h)`], [call stack/stack sedalam height],
  [Tree BFS], [`O(w)`], [queue selebar level terbesar],
  [Graph DFS], [`O(V)`], [visited set + stack bisa sebesar vertex],
  [Graph BFS], [`O(V)`], [visited set + queue bisa sebesar vertex],
)

#warn[User request sering menekankan DFS `O(h)` dan BFS `O(w)` untuk tree. Untuk graph umum, karena ada visited set, space biasanya ditulis `O(V)`.]

== BFS Use Cases
#cbox[
  BFS cocok untuk shortest path pada graph tidak berbobot, pencarian level-order, mencari jarak minimum langkah, crawling layer demi layer, dan flood fill sederhana. Kenapa shortest? Semua node jarak 1 diproses sebelum jarak 2, jarak 2 sebelum jarak 3, dst.
]

== DFS Use Cases
#cbox[
  DFS cocok untuk eksplorasi semua kemungkinan, cycle detection, topological sort pada DAG, connected components, maze/backtracking, dan traversal tree preorder/inorder/postorder. DFS masuk sedalam mungkin lalu mundur.
]

#warn[BFS shortest path hanya benar untuk unweighted graph. Jika edge punya bobot, gunakan algoritma weighted shortest path seperti Dijkstra, bukan BFS biasa.]

= Visited / Seen

#cbox[
  Pada graph yang bisa memiliki cycle, `visited` wajib agar traversal tidak mengulang node tanpa akhir. Praktik aman: tandai node sebagai visited saat dimasukkan ke queue/stack, bukan setelah dikeluarkan, supaya node tidak masuk struktur berkali-kali dari parent berbeda.
]

== Graph Scenario Table
#table(
  columns: (1.35fr, 1fr, 1.55fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Skenario*], [*Jawaban*], [*Alasan*],
  [rute minimum jumlah langkah], [BFS], [unweighted shortest path],
  [cek semua node reachable], [BFS/DFS], [keduanya `O(V+E)`],
  [maze/backtracking], [DFS], [eksplorasi jalur dalam],
  [dependency tanpa cycle], [DAG], [topological order],
  [jaringan padat sering cek edge], [Matrix], [cek koneksi `O(1)`],
  [social network besar sparse], [Adj. List], [memori `O(V+E)`],
)


// ═══════════════════════════════════════
// PAGE 6 — TRIE + HUFFMAN + FINAL PG TRAPS
// ═══════════════════════════════════════

= Trie / Prefix Tree

#cbox[
  Trie menyimpan kumpulan string sebagai jalur karakter. Setiap node biasanya memiliki `children` dan flag `is_end_of_word`. Trie sangat cocok untuk autocomplete, spell checker, dictionary, pencarian prefix, dan routing/prefix matching.
]

== Word vs Prefix
#table(
  columns: (auto, 1.45fr, 1.45fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Operasi*], [*Makna*], [*Trap*],
  [`search("ca")`], [cek kata lengkap], [butuh flag end pada node `a`],
  [`starts_with("ca")`], [cek apakah prefix ada], [tidak perlu end true],
  [`insert("cat")`], [buat jalur c-a-t], [node terakhir diberi end true],
)

#warn[`starts_with("ca")` bisa true walau `search("ca")` false. Prefix ada belum tentu kata lengkap ada.]

== Trie Complexity
#table(
  columns: (auto, auto, 1.75fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Operasi*], [*Time*], [*Catatan*],
  [insert word], [`O(m)`], [`m` = panjang kata],
  [search word], [`O(m)`], [cek karakter + end flag],
  [prefix search], [`O(p)`], [`p` = panjang prefix],
  [space], [`O(total char)`], [bisa boros jika banyak cabang],
)

== Trie vs Hash Table
#table(
  columns: (1.2fr, 1fr, 1.65fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Kebutuhan*], [*Pilih*], [*Alasan*],
  [exact lookup kata], [Hash/Set], [average `O(1)` lebih simpel],
  [autocomplete prefix], [Trie], [cukup traverse prefix],
  [semua kata berawalan `pre`], [Trie], [node prefix menjadi akar subhasil],
  [memori minim], [Hash/Set], [trie bisa boros node],
)

= Huffman Coding

== Intuisi
#cbox[
  Huffman adalah algoritma kompresi lossless berbasis frekuensi. Karakter yang sering muncul diberi kode pendek; karakter yang jarang muncul diberi kode panjang. Hasilnya adalah prefix-free code: tidak ada kode karakter yang menjadi prefix kode karakter lain, sehingga decoding tidak ambigu.
]

== Langkah Huffman
#table(
  columns: (auto, 2.25fr),
  inset: 2.0pt,
  stroke: 0.21pt + black,
  [*Step*], [*Aksi*],
  [1], [hitung frekuensi tiap karakter],
  [2], [masukkan node karakter ke min-heap berdasarkan frekuensi],
  [3], [ambil dua node dengan frekuensi terkecil],
  [4], [gabungkan menjadi parent dengan frekuensi jumlah keduanya],
  [5], [push parent kembali ke heap; ulangi sampai tersisa root],
  [6], [beri kode dari root ke leaf, misal kiri `0`, kanan `1`],
  [7], [encode dengan kode; decode dengan tree/kamus],
)

== Huffman dan Heap
#key[
  Huffman membutuhkan priority queue/min-heap karena pada setiap langkah harus mengambil dua frekuensi terkecil. Operasi extract dua minimum dan insert parent dilakukan berulang sampai tersisa satu tree.
]

#table(
  columns: (auto, 2fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Aspek*], [*Catatan*],
  [Lossless], [decode menghasilkan input asli persis],
  [Prefix-free], [kode tidak saling menjadi prefix],
  [Optimal], [optimal untuk prefix code berbasis frekuensi simbol],
  [Time], [`O(k log k + n)`, `k` = karakter unik, `n` = panjang teks],
  [Space], [`O(k)` untuk tree/kode, plus output bitstring],
)

#warn[Huffman tidak selalu membuat ukuran akhir lebih kecil. Untuk data sangat pendek atau frekuensi hampir seragam, overhead menyimpan tree/kamus bisa mengalahkan penghematan bit.]

= Pilih Struktur Data dari Kata Kunci

#table(
  columns: (1.35fr, 1fr, 1.55fr),
  inset: 1.9pt,
  stroke: 0.20pt + black,
  [*Kata Kunci Soal*], [*Jawaban*], [*Alasan*],
  [terakhir masuk keluar dulu], [Stack], [LIFO],
  [pertama datang dilayani dulu], [Queue], [FIFO],
  [hapus/tambah dua ujung], [Deque], [double-ended],
  [cari berdasarkan ID/key], [Dict/Hash], [lookup avg `O(1)`],
  [collision ekstrem], [Hash worst `O(n)`], [bucket/rantai panjang],
  [autocomplete/prefix], [Trie], [jalur per karakter],
  [prioritas terkecil/terbesar], [Heap/PQ], [root sesuai prioritas],
  [hierarki folder/menu], [Tree], [parent-child],
  [data sorted, cari cepat], [Binary Search/BST], [eliminasi setengah],
  [relasi banyak-ke-banyak], [Graph], [vertex-edge],
  [shortest path unweighted], [BFS], [level-by-level],
  [kompresi karakter], [Huffman], [frekuensi + min-heap],
)

= High-Yield PG Traps

#cbox[
  1. `sorted` adalah syarat binary dan interpolation search.\
  2. Interpolation perlu data numerik dan distribusi merata.\
  3. Hash table average `O(1)`, worst `O(n)` pada collision ekstrem.\
  4. Dict membership `k in d` mengecek key, bukan value.\
  5. `map()` lazy iterator; hasil baru dihitung saat dikonsumsi.\
  6. Python `sort()` dan `sorted()` memakai stable Timsort.\
  7. Stable menjaga urutan relatif key yang sama.\
  8. Stable tidak sama dengan in-place.\
  9. Merge sort stable tapi aux `O(n)`.\
  10. Quick sort biasanya unstable dan worst `O(n²)`.\
  11. Quick sort aux stack avg `O(log n)`, worst `O(n)`.\
  12. Heap bukan BST; search arbitrary tetap `O(n)`.\
  13. `heapq` Python adalah min-heap.\
  14. BST `O(log n)` hanya jika balanced.\
  15. Inorder traversal sorted hanya pada BST.\
  16. Binary tree bukan otomatis BST.\
  17. Linked list tidak punya akses index `O(1)`.\
  18. Queue praktis pakai `deque`, bukan `list.pop(0)`.\
  19. Trie prefix exists tidak sama dengan word exists.\
  20. BFS = queue/FIFO; DFS = stack/recursion/LIFO.\
  21. Tree DFS space `O(h)`; tree BFS space `O(w)`.\
  22. Graph traversal butuh visited.\
  23. BFS shortest path hanya untuk unweighted graph.\
  24. Huffman lossless, prefix-free, dan memakai min-heap.\
  25. Sorting dulu baru search worth it jika query dilakukan berkali-kali.
]

= Last-Minute Checklist

#table(
  columns: (1fr, 2.2fr),
  inset: 2.1pt,
  stroke: 0.22pt + black,
  [*Topik*], [*Harus Bisa Jawab*],
  [Sorting],
  [stable/unstable, in-place/API, aux space, best/avg/worst, Timsort],

  [Searching],
  [syarat linear/binary/interpolation, random access, repeated query trade-off],

  [Python], [`map` lazy, `sort` vs `sorted`, list vs deque, dict edge cases],
  [Stack/Queue], [LIFO vs FIFO, use cases, `deque.popleft()`],
  [Linked List], [head, next, random access buruk, insert/delete pointer],
  [Tree/BST], [traversal, `O(h)` vs `O(w)`, balanced vs skewed, delete cases],
  [Heap], [min-heap, priority queue, push/pop `O(log n)`, heap bukan BST],
  [Trie], [word vs prefix, `children`, `end`, `O(m)`],
  [Graph], [adjacency list vs matrix, BFS/DFS, visited, `O(V+E)`],
  [Huffman], [frequency, min-heap, prefix-free, lossless, overhead],
)
