// Cheatsheet Praktikum Struktur Data — v2
// Target: maksimum 2 lembar A4 bolak-balik = 4 halaman.
// Fokus ujian pilihan ganda: konsep, kompleksitas, syarat algoritma, traps.
// Basic dibuat ringkas; bagian rawan salah dibuat lebih verbose.

#set document(title: [Cheatsheet Praktikum Struktur Data v2])

#set page(
  paper: "a4",
  flipped: true,
  margin: (top: 4.8mm, bottom: 4.8mm, left: 5.6mm, right: 5.6mm),
  columns: 3,
)

#set text(
  font: "Times New Roman",
  size: 7.45pt,
  hyphenate: true,
)

#set par(
  justify: true,
  first-line-indent: 0pt,
  spacing: 0.35em,
  leading: 0.31em,
)

#set heading(numbering: "1.")
#show heading: it => block(spacing: auto, it)
#show heading.where(level: 1): it => {
  it
  box(width: 1fr, line(length: 100%, stroke: 0.35pt + black))
}
#show heading.where(level: 2): set text(size: 7.25pt)

#show raw: set text(font: "Fira Code Retina", size: 5.8pt)
#show raw.where(block: true): block.with(inset: 2.2pt, stroke: 0.18pt + black)

#let cbox(body) = block(
  stroke: 0.36pt + black,
  inset: 2.8pt,
  breakable: true,
  width: 100%,
  body,
)
#let warn(body) = block(
  stroke: 0.36pt + black,
  fill: luma(245),
  inset: 2.8pt,
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
// PAGE 1 — CORE MENTAL MODEL + BASIC DS
// ═══════════════════════════════════════

= Cara Menjawab PG Struktur Data

#cbox[
  Untuk pilihan ganda, jangan hafal definisi doang. Cocokkan *kata kunci soal* dengan: prinsip struktur data, syarat algoritma, operasi dominan, kompleksitas, dan edge case. Banyak soal jebakan biasanya ada di kata: *sorted*, *random access*, *FIFO/LIFO*, *balanced*, *visited*, *prefix*, *collision*, *frequency*.
]

== Peta Materi
#table(
  columns: (1.05fr, 2fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Basic, cukup tahu*],
  [Function, list, map, dict syntax dasar, istilah tree dasar],

  [*Medium*], [sorting sederhana, stack/queue/deque, linked list, hash table],
  [*Rawan PG*],
  [binary/interpolation search, BST, traversal, graph BFS/DFS, trie, Huffman],
)

== Kompleksitas Cepat
#table(
  columns: (auto, 1fr, 1.5fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Big-O*], [*Makna*], [*Contoh*],
  [`O(1)`], [konstan], [akses `a[i]`, `dict[k]` rata-rata],
  [`O(log n)`], [bagi dua], [binary search, BST balanced],
  [`O(n)`], [scan/traverse], [linear search, traversal list/tree/graph vertex],
  [`O(n log n)`],
  [divide and conquer],
  [merge sort, quick sort average, heap-based Huffman],

  [`O(n²)`], [nested loop], [selection, insertion worst, bubble worst],
  [`O(V+E)`], [graph], [BFS/DFS adjacency list],
  [`O(V²)`], [matrix graph], [adjacency matrix memory],
)

#warn[Kalau struktur data punya kondisi khusus, Big-O ikut berubah. BST `O(log n)` hanya kalau balanced. Hash table `O(1)` biasanya average, bukan worst.]

= Python Function, List, Map

== Function
```python
def f(x, default=0):
    if x is None:
        return None
    return x + default
```
*Return* dipakai kalau fungsi diminta menghasilkan nilai. *Print* hanya menampilkan ke layar. Pada soal code, cek apakah yang ditanya output print atau return value.

#warn[Default arg mutable: `def f(a=[])` rawan karena list yang sama dipakai antar pemanggilan. Aman: `def f(a=None): if a is None: a=[]`.]

== List Operasi Inti
#table(
  columns: (auto, auto, 1fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Operasi*], [*Time*], [*Catatan*],
  [`a[i]`], [`O(1)`], [random access karena array/list berbasis index],
  [`append(x)`], [`O(1)` avg], [tambah belakang],
  [`pop()`], [`O(1)`], [hapus belakang],
  [`insert(0,x)`], [`O(n)`], [geser elemen],
  [`pop(0)`], [`O(n)`], [jangan untuk queue],
  [`x in a`], [`O(n)`], [scan linear],
)

== `map()` vs List Comprehension
```python
nums = [1, 2, 3]
list(map(lambda x: x*x, nums))  # [1,4,9]
[x*x for x in nums]             # sering lebih readable
```
`map(func, iterable)` mengaplikasikan fungsi ke tiap elemen. Hasil `map` perlu diubah ke `list` kalau ingin langsung dilihat.

= Stack, Queue, Deque

#table(
  columns: (auto, auto, 1.25fr, 1.45fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*DS*], [*Prinsip*], [*Operasi*], [*Keyword Soal*],
  [Stack],
  [LIFO],
  [`push`, `pop`, `peek/top`],
  [undo/redo, call stack, validasi kurung],

  [Queue],
  [FIFO],
  [`enqueue`, `dequeue`, `front`],
  [antrean, printer queue, BFS],

  [Deque],
  [dua ujung],
  [`append`, `appendleft`, `pop`, `popleft`],
  [sliding window, bisa stack/queue],
)

```python
from collections import deque

# stack
s = []
s.append(x); top = s[-1]; x = s.pop()

# queue/deque
q = deque()
q.append(x)       # enqueue belakang
x = q.popleft()   # dequeue depan
q.appendleft(x); q.pop()
```

#warn[`list.pop(0)` untuk queue itu `O(n)`. Pakai `deque.popleft()` untuk `O(1)`.]

== Stack: Validasi Kurung
```python
def valid(expr):
    pairs = {')':'(', ']':'[', '}':'{'}
    st = []
    for ch in expr:
        if ch in '([{': st.append(ch)
        elif ch in ')]}':
            if not st or st.pop() != pairs[ch]:
                return False
    return not st
```
PG trap: stack kosong lalu `pop`, urutan kurung salah, atau sisa stack belum kosong.

== Queue vs Deque Use Case
#key[
  Queue cocok jika urutan kedatangan harus dipertahankan. Deque cocok jika soal menyebut tambah/hapus dari depan *dan* belakang. BFS memakai queue karena harus memproses node level sekarang dulu sebelum level berikutnya.
]

= Hash Table / Dictionary

#cbox[
  Hash table menyimpan pasangan *key → value*. Python `dict` adalah implementasi hash table. Key harus unik dan hashable; value bebas. Operasi insert/search/delete rata-rata `O(1)`.
]

```python
m = {}
m['Ari'] = 90              # insert/update
m.get('Ari', 0)            # aman jika key tidak ada
'Ari' in m                 # membership avg O(1)
for k, v in m.items():
    print(k, v)
del m['Ari']
```

== Collision
#cbox[
  *Collision* terjadi saat dua key menghasilkan index/hash bucket sama. Strategi umum: chaining atau open addressing. Untuk PG: collision tidak berarti data hilang; struktur menyimpan cara membedakan key.
]

#warn[`dict[k]` bisa `KeyError` jika key tidak ada. Untuk menghitung frekuensi, lebih aman pakai `get`, `defaultdict`, atau `Counter`.]


// ═══════════════════════════════════════
// PAGE 2 — SORTING + SEARCHING
// ═══════════════════════════════════════

= Sorting

== Kapan Sorting Penting?
Sorting membuat pencarian, analisis, dan tampilan data lebih mudah. Banyak algoritma searching cepat mensyaratkan data sudah sorted. Jadi sorting sering menjadi tahap prasyarat sebelum binary search atau interpolation search.

== Tabel Komparasi Sorting
#table(
  columns: (auto, 1.65fr, auto, auto, auto, auto),
  inset: 2pt,
  stroke: 0.21pt + black,
  [*Algoritma*], [*Ide Kerja*], [*Best*], [*Avg*], [*Worst*], [*Stable*],
  [Selection],
  [pilih minimum dari sisa array, swap ke posisi depan],
  [`O(n²)`],
  [`O(n²)`],
  [`O(n²)`],
  [Tidak],

  [Insertion],
  [ambil elemen, geser elemen kiri yang lebih besar, sisipkan],
  [`O(n)`],
  [`O(n²)`],
  [`O(n²)`],
  [Ya],

  [Bubble],
  [bandingkan tetangga, swap jika salah urutan],
  [`O(n)`],
  [`O(n²)`],
  [`O(n²)`],
  [Ya],

  [Merge],
  [pecah dua, sort rekursif, merge dua list terurut],
  [`O(n log n)`],
  [`O(n log n)`],
  [`O(n log n)`],
  [Ya],

  [Quick],
  [pilih pivot, partisi kecil/besar, rekursif],
  [`O(n log n)`],
  [`O(n log n)`],
  [`O(n²)`],
  [Tidak],
)
`*` Bubble best `O(n)` hanya jika implementasi punya flag `swapped` dan data sudah sorted.

== Selection Sort
```python
def selection(a):
    n = len(a)
    for i in range(n-1):
        m = i
        for j in range(i+1, n):
            if a[j] < a[m]:
                m = j
        a[i], a[m] = a[m], a[i]
    return a
```
*Keyword:* cari nilai terkecil dari sisa array. Jumlah swap sedikit, maksimal `n-1`, tapi perbandingan tetap banyak.

#warn[Selection sort tidak menjadi `O(n)` meskipun data sudah urut, karena loop dalam tetap mencari minimum.]

== Insertion Sort
```python
def insertion(a):
    for i in range(1, len(a)):
        key = a[i]
        j = i - 1
        while j >= 0 and a[j] > key:
            a[j+1] = a[j]
            j -= 1
        a[j+1] = key
    return a
```
*Keyword:* seperti menyusun kartu di tangan. Bagus untuk data kecil atau hampir sorted. Banyak soal PG menanyakan kenapa insertion bisa best `O(n)`: karena tidak perlu banyak geser jika sudah urut.

== Bubble Sort
```python
def bubble(a):
    n = len(a)
    for i in range(n-1):
        swapped = False
        for j in range(0, n-1-i):
            if a[j] > a[j+1]:
                a[j], a[j+1] = a[j+1], a[j]
                swapped = True
        if not swapped: break
    return a
```
*Keyword:* elemen besar/kecil bergerak bertahap lewat swap tetangga. Setelah tiap pass, satu posisi ujung sudah final.

== Stability dan In-place
#table(
  columns: (auto, 2fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Stable*],
  [Jika dua elemen punya key sama, urutan relatifnya tetap. Penting untuk data tuple/record.],

  [*In-place*],
  [Mengurutkan tanpa struktur bantu besar. Selection/insertion/bubble in-place. Merge biasanya butuh `O(n)` extra space.],
)

#warn[Quick sort average cepat, tapi worst `O(n²)` jika pivot buruk terus. Merge sort konsisten `O(n log n)`, tapi butuh memori ekstra.]

= Searching

== Tabel Komparasi Searching
#table(
  columns: (auto, 1.5fr, 1.3fr, 1.2fr),
  inset: 2pt,
  stroke: 0.21pt + black,
  [*Algoritma*], [*Syarat*], [*Complexity*], [*Keyword*],
  [Linear],
  [bebas, tidak perlu sorted],
  [best `O(1)`, worst `O(n)`],
  [cek satu per satu],

  [Binary], [data harus sorted], [`O(log n)`], [ambil tengah, buang setengah],
  [Interpolation],
  [sorted, numerik, distribusi merata],
  [avg `O(log log n)`, worst `O(n)`],
  [tebak posisi berdasar nilai],
)

== Linear Search
```python
def linear(a, x):
    for i, v in enumerate(a):
        if v == x:
            return i
    return -1
```
Pilih linear jika data kecil, belum sorted, atau struktur tidak mendukung akses tengah cepat. Linear search bisa dipakai pada list, linked list, hasil traversal, atau array acak.

== Binary Search
```python
def binary(a, x):
    lo, hi = 0, len(a)-1
    while lo <= hi:
        mid = (lo + hi) // 2
        if a[mid] == x: return mid
        elif a[mid] < x: lo = mid + 1
        else: hi = mid - 1
    return -1
```
#key[
  Loop memakai `lo <= hi` karena saat `lo == hi` masih ada satu elemen yang harus dicek. Setelah cek, batas digeser melewati `mid`: `lo = mid+1` atau `hi = mid-1`.
]

#warn[Binary search butuh random access dan sorted data. Pada linked list, binary search tidak cocok secara praktis karena akses tengah butuh traversal `O(n)`.]

== Interpolation Search
Rumus estimasi:
```python
pos = lo + ((x - a[lo]) * (hi - lo)) // (a[hi] - a[lo])
```
Cara kerja: bukan selalu ambil tengah, tapi menebak posisi target berdasarkan proporsi nilai target terhadap nilai ujung bawah dan atas.

```python
def interpolation(a, x):
    lo, hi = 0, len(a)-1
    while lo <= hi and a[lo] <= x <= a[hi]:
        if a[hi] == a[lo]:
            return lo if a[lo] == x else -1
        pos = lo + ((x-a[lo]) * (hi-lo)) // (a[hi]-a[lo])
        if a[pos] == x: return pos
        if a[pos] < x: lo = pos + 1
        else: hi = pos - 1
    return -1
```

#warn[Interpolation search sering jadi jebakan: wajib sorted, numerik, dan distribusi merata. Jika data tidak merata, bisa jatuh ke `O(n)` dan lebih ribet dari binary.]

= Pilih Search dari Skenario PG

#table(
  columns: (1.35fr, 1fr, 1.6fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Skenario*], [*Jawaban*], [*Alasan*],
  [nama pasien di list acak], [Linear], [tidak sorted],
  [nomor induk sorted], [Binary], [eliminasi setengah],
  [data angka 10,20,30,...,100000], [Interpolation], [sorted + merata],
  [linked list sorted], [Linear praktis], [tidak random access],
  [hash map by ID], [Dict lookup], [key-based avg `O(1)`],
)

= MCQ Sorting/Searching Traps
#cbox[
  1. `O(log n)` biasanya muncul dari proses membagi ruang pencarian.\
  2. `O(n²)` biasanya dari dua loop bersarang.\
  3. Selection: swap sedikit, comparison tetap banyak.\
  4. Insertion: bagus untuk hampir sorted.\
  5. Bubble: best `O(n)` hanya dengan early stop.\
  6. Binary/interpolation tidak boleh untuk data acak.\
  7. Interpolation bukan untuk string/random distribution.\
  8. Sorting dulu lalu searching hanya worth it jika pencarian dilakukan berkali-kali.
]


// ═══════════════════════════════════════
// PAGE 3 — LINKED LIST + TREE + BST + TRIE
// ═══════════════════════════════════════

= Linked List

== Mental Model
#cbox[
  Linked list adalah rangkaian node. Tiap node menyimpan `data` dan pointer ke node berikutnya (`next`). Node tidak harus bersebelahan di memori. Akses harus mulai dari `head`, lalu mengikuti pointer satu per satu.
]

#table(
  columns: (auto, 1.35fr, 1.35fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Jenis*], [*Pointer*], [*Ciri*],
  [Singly], [`next`], [traversal satu arah],
  [Doubly],
  [`prev` + `next`],
  [bisa maju-mundur, hapus lebih mudah jika punya node],

  [Circular], [tail menunjuk head], [tidak ada `None` di akhir],
)

```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None

    def prepend(self, data):
        n = Node(data)
        n.next = self.head
        self.head = n
```

== Operasi dan Kompleksitas
#table(
  columns: (auto, auto, auto, 1.4fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Operasi*], [*Array/List*], [*Linked List*], [*Catatan*],
  [akses index], [`O(1)`], [`O(n)`], [LL harus jalan dari head],
  [insert awal], [`O(n)`], [`O(1)`], [ubah head],
  [insert akhir],
  [`O(1)` avg append],
  [`O(n)` atau `O(1)` dengan tail],
  [tanpa tail harus traverse],

  [hapus awal], [`O(n)`], [`O(1)`], [ubah head],
  [search], [`O(n)`], [`O(n)`], [keduanya scan],
)

#warn[Linked list bukan otomatis lebih cepat dari array. Ia unggul untuk insert/delete kalau posisi node sudah diketahui, tapi buruk untuk random access.]

== Hapus Node Singly
```python
def delete(head, target):
    if head is None:
        return None
    if head.data == target:
        return head.next
    prev, cur = head, head.next
    while cur:
        if cur.data == target:
            prev.next = cur.next
            return head
        prev, cur = cur, cur.next
    return head
```
Edge cases: list kosong, target di head, target tidak ditemukan, hanya satu node.

= Tree Dasar

#cbox[
  Tree adalah struktur hierarkis. Root = node paling atas. Parent/child = relasi atas-bawah. Leaf = node tanpa child. Edge = hubungan. Depth = jarak dari root ke node. Height = jarak dari node ke leaf terdalam.
]

== Binary Tree
Binary tree: setiap node maksimal punya dua child, yaitu left child dan right child. Binary tree menjadi dasar BST, AVL tree, heap, expression tree, dan parser.

#table(
  columns: (auto, 1.8fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Jenis*], [*Ciri*],
  [Full], [setiap node punya 0 atau 2 child],
  [Complete], [semua level penuh kecuali level terakhir, diisi dari kiri],
  [Perfect], [semua internal punya 2 child dan semua leaf di level sama],
  [Balanced], [tinggi subtree kiri-kanan relatif seimbang],
  [Skewed], [miring satu sisi, mirip linked list],
)

== Traversal Tree
#table(
  columns: (auto, 1.2fr, 1.55fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Traversal*], [*Urutan*], [*Keyword*],
  [Preorder], [Root → Left → Right], [root dulu, copy/serialize],
  [Inorder], [Left → Root → Right], [BST menghasilkan urutan sorted],
  [Postorder], [Left → Right → Root], [hapus subtree, evaluasi postfix],
  [Level-order], [per level], [pakai queue, BFS tree],
)

```python
def inorder(n):
    if n:
        inorder(n.left)
        print(n.v)
        inorder(n.right)
```

#warn[Traversal DFS tree biasanya rekursif/stack. Level-order pakai queue. Jangan tertukar: inorder hanya memberi sorted order kalau tree-nya BST, bukan binary tree biasa.]

= Binary Search Tree (BST)

== Rule BST
#cbox[
  Untuk setiap node: semua nilai di subtree kiri lebih kecil dari node, semua nilai di subtree kanan lebih besar dari node. Duplicate harus punya policy: diabaikan, dihitung count, atau konsisten masuk kiri/kanan.
]

```python
class T:
    def __init__(self, v):
        self.v = v
        self.left = None
        self.right = None

def search(root, x):
    cur = root
    while cur:
        if x == cur.v: return True
        cur = cur.left if x < cur.v else cur.right
    return False
```

== Insert BST
```python
def insert(root, x):
    if root is None:
        return T(x)
    if x < root.v:
        root.left = insert(root.left, x)
    elif x > root.v:
        root.right = insert(root.right, x)
    return root
```

== Delete BST: 3 Kasus
#table(
  columns: (auto, 2fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Kasus*], [*Aksi*],
  [Leaf], [hapus langsung, parent menunjuk `None`],
  [1 child], [ganti node dengan child-nya],
  [2 child],
  [ganti value dengan inorder successor atau predecessor, lalu hapus node pengganti],
)

#warn[BST `O(log n)` hanya jika tinggi pohon `O(log n)`. Jika input sorted dimasukkan berurutan, BST bisa skewed dan search/insert jadi `O(n)`.]

= Trie / Prefix Tree

#cbox[
  Trie menyimpan kumpulan string sebagai jalur karakter. Setiap node biasanya punya `children` dan flag `end`/`is_end_of_word`. Cocok untuk autocomplete, spell checker, dictionary, dan prefix search.
]

```python
class TrieNode:
    def __init__(self):
        self.children = {}
        self.end = False

class Trie:
    def __init__(self):
        self.root = TrieNode()

    def insert(self, word):
        cur = self.root
        for ch in word:
            cur = cur.children.setdefault(ch, TrieNode())
        cur.end = True

    def search(self, word):
        cur = self.root
        for ch in word:
            if ch not in cur.children:
                return False
            cur = cur.children[ch]
        return cur.end

    def starts_with(self, prefix):
        cur = self.root
        for ch in prefix:
            if ch not in cur.children:
                return False
            cur = cur.children[ch]
        return True
```

#table(
  columns: (auto, auto, 1.5fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Operasi*], [*Time*], [*Catatan*],
  [insert], [`O(m)`], [`m` = panjang kata],
  [search word], [`O(m)`], [harus `end=True`],
  [prefix search], [`O(p)`], [`p` = panjang prefix],
  [space], [`O(total char)`], [bisa boros jika banyak cabang],
)

#warn[`starts_with("ca")` bisa true walau `search("ca")` false. Prefix ada belum tentu kata lengkap ada.]

// ═══════════════════════════════════════
// PAGE 4 — GRAPH + HUFFMAN + PG TRAPS
// ═══════════════════════════════════════

= Graph

== Definisi dan Jenis
#cbox[
  Graph `G = (V, E)` terdiri dari vertex/simpul dan edge/sisi. Berbeda dari tree, graph boleh punya cycle dan tidak wajib punya root. Cocok untuk relasi banyak-ke-banyak: peta, jaringan komputer, rekomendasi teman, dependency task.
]

#table(
  columns: (auto, 1.7fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Jenis*], [*Ciri*],
  [Undirected], [edge dua arah: A--B berarti A ke B dan B ke A],
  [Directed], [edge satu arah: A→B belum tentu B→A],
  [Weighted], [edge punya bobot: jarak, biaya, waktu],
  [Unweighted], [edge hanya menyatakan ada/tidak hubungan],
)

== Representasi Graph
#table(
  columns: (auto, 1fr, 1fr, 1.2fr),
  inset: 2pt,
  stroke: 0.21pt + black,
  [*Representasi*], [*Memory*], [*Cek Edge*], [*Cocok Untuk*],
  [Adjacency List], [`O(V+E)`], [`O(deg(u))`], [graph sparse, praktik Python],
  [Adjacency Matrix], [`O(V²)`], [`O(1)`], [graph dense, sering cek koneksi],
)

```python
g = {
  'Andi': ['Budi', 'Citra'],
  'Budi': ['Andi', 'Dewi', 'Eka'],
  'Citra': ['Andi', 'Eka', 'Fani'],
  'Dewi': ['Budi', 'Gita'],
  'Eka': ['Budi', 'Citra', 'Gita'],
  'Fani': ['Citra'],
  'Gita': ['Dewi', 'Eka'],
}
```

== BFS vs DFS
#table(
  columns: (auto, 1fr, 1.55fr, auto),
  inset: 2pt,
  stroke: 0.21pt + black,
  [*Algo*], [*Struktur*], [*Pola*], [*Time*],
  [BFS],
  [Queue/FIFO],
  [melebar per level; shortest path unweighted],
  [`O(V+E)`],

  [DFS],
  [Stack/recursion/LIFO],
  [masuk sedalam mungkin; cycle/dependency],
  [`O(V+E)`],
)

```python
from collections import deque

def bfs(g, start):
    q = deque([start])
    seen = {start}
    order = []
    while q:
        u = q.popleft()
        order.append(u)
        for v in g[u]:
            if v not in seen:
                seen.add(v)
                q.append(v)
    return order

def dfs(g, u, seen=None):
    if seen is None: seen = set()
    seen.add(u)
    print(u)
    for v in g[u]:
        if v not in seen:
            dfs(g, v, seen)
```

#warn[`visited/seen` wajib untuk graph bersiklus. Tanpa itu, BFS/DFS bisa infinite loop. Mark visited saat masuk queue/stack agar tidak dobel masuk.]

== BFS Shortest Path Unweighted
#key[
  BFS menemukan jalur terpendek pada graph tidak berbobot karena semua node jarak 1 diproses dulu, lalu jarak 2, lalu jarak 3. Untuk weighted graph, butuh algoritma lain seperti Dijkstra.
]

= Huffman Coding

== Intuisi
#cbox[
  Huffman adalah algoritma kompresi lossless berbasis frekuensi. Karakter yang sering muncul diberi kode pendek; karakter yang jarang muncul diberi kode panjang. Kodenya prefix-free, sehingga tidak ada kode karakter yang menjadi prefix kode karakter lain.
]

== Langkah Huffman
#table(
  columns: (auto, 2.3fr),
  inset: 2.1pt,
  stroke: 0.21pt + black,
  [*Step*], [*Aksi*],
  [1], [hitung frekuensi setiap karakter],
  [2], [buat node karakter dan masukkan ke min-heap / priority queue],
  [3], [ambil dua node frekuensi terkecil],
  [4], [gabungkan jadi parent dengan frekuensi jumlah keduanya],
  [5], [push parent kembali ke heap; ulangi sampai tersisa root],
  [6], [traverse tree: kiri = 0, kanan = 1; leaf menjadi kode karakter],
  [7], [encode teks menjadi bitstring; decode dengan tree/kamus kode],
)

```python
from collections import Counter
import heapq

freq = Counter(text)
heap = [[f, [ch, ""]] for ch, f in freq.items()]
heapq.heapify(heap)

while len(heap) > 1:
    lo = heapq.heappop(heap)
    hi = heapq.heappop(heap)
    for p in lo[1:]: p[1] = '0' + p[1]
    for p in hi[1:]: p[1] = '1' + p[1]
    heapq.heappush(heap, [lo[0]+hi[0]] + lo[1:] + hi[1:])

codes = dict(heap[0][1:])
```

== Huffman Complexity dan Trap
#table(
  columns: (auto, 2fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Aspek*], [*Catatan*],
  [Time], [`O(k log k + n)`; `k` = jumlah karakter unik, `n` = panjang teks],
  [Space], [`O(k)` untuk tree/kode plus output],
  [Optimal?], [optimal untuk prefix code berbasis frekuensi simbol],
  [Lossless], [hasil decode sama persis dengan input],
)

#warn[Huffman tidak selalu membuat file kecil. Untuk teks pendek atau frekuensi seragam, overhead menyimpan tree/kamus kode bisa lebih besar dari penghematan.]

= Pilih Struktur Data dari Kata Kunci

#table(
  columns: (1.35fr, 1fr, 1.55fr),
  inset: 2pt,
  stroke: 0.21pt + black,
  [*Kata Kunci Soal*], [*Jawaban*], [*Alasan*],
  [terakhir masuk keluar dulu], [Stack], [LIFO],
  [pertama datang dilayani dulu], [Queue], [FIFO],
  [hapus/tambah dua ujung], [Deque], [double-ended],
  [sering cari berdasarkan ID/key], [Dict/Hash], [lookup avg `O(1)`],
  [autocomplete/prefix], [Trie], [jalur per karakter],
  [hierarki folder/menu], [Tree], [parent-child],
  [data sorted, cari cepat], [Binary Search/BST], [eliminasi setengah],
  [relasi banyak-ke-banyak], [Graph], [vertex-edge],
  [shortest path unweighted], [BFS], [level-by-level],
  [kompresi karakter], [Huffman], [frekuensi + binary tree],
)

= High-Yield PG Traps

#cbox[
  1. `sorted` adalah syarat binary dan interpolation search.\
  2. Interpolation perlu data numerik dan distribusi merata.\
  3. `O(log n)` untuk BST hanya jika balanced.\
  4. Inorder traversal hanya sorted pada BST.\
  5. Binary tree bukan otomatis BST.\
  6. Linked list tidak punya akses index `O(1)`.\
  7. Queue di Python praktis pakai `deque`, bukan `list.pop(0)`.\
  8. Stack cocok untuk reversal, undo, matching bracket, recursion.\
  9. Hash table collision tidak menghapus data; ada resolusi collision.\
  10. Dict key harus unik dan hashable.\
  11. Trie prefix exists tidak sama dengan word exists.\
  12. Graph traversal butuh visited.\
  13. BFS = queue/FIFO; DFS = stack/recursion/LIFO.\
  14. BFS shortest path hanya untuk unweighted graph.\
  15. Huffman lossless, prefix-free, butuh tree/kode untuk decode.\
  16. Selection sort swap sedikit tapi tetap `O(n²)`.\
  17. Bubble best `O(n)` hanya jika early stop.\
  18. Insertion sort bagus untuk hampir sorted.\
  19. Merge sort stabil tapi butuh memori ekstra.\
  20. Quick sort bisa `O(n²)` saat pivot buruk.
]

= Last-Minute Checklist

#table(
  columns: (1fr, 2.2fr),
  inset: 2.2pt,
  stroke: 0.22pt + black,
  [*Topik*], [*Harus bisa jawab*],
  [Sorting],
  [mana yang stable, in-place, best/worst, cocok untuk hampir sorted],

  [Searching], [syarat linear/binary/interpolation dan update batas],
  [Stack/Queue], [LIFO vs FIFO dan implementasi Python],
  [Linked List], [head, next, operasi awal vs akses index],
  [Tree/BST], [traversal, rule BST, balanced vs skewed],
  [Trie], [word vs prefix, children dict, `O(m)`],
  [Graph], [adjacency list, BFS/DFS, visited, `O(V+E)`],
  [Huffman], [frekuensi, min-heap, prefix-free, lossless],
)
