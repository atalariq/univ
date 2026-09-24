#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Struktur Data",
  course-code: "PSD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "8",
  title: "Implementasi Tree untuk Pohon Silsilah Keluarga",
)

#show: report.with(
  ..metadata,
  use-cover: false,
  bib: none,
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
)

// Simple header
#align(center)[
  #text(1.25em, weight: "bold")[
    #metadata.course \
    #metadata.title
  ]

  #text(0.8em)[
    #metadata.author (#metadata.id)
  ]
]
#line(length: 100%)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), ..args)

= Pendahuluan

Pohon (_Tree_) adalah struktur data hierarkis yang terdiri dari simpul (_node_)
yang terhubung satu sama lain dengan menggunakan sisi (_edge_). Setiap simpul
dalam pohon memiliki satu simpul induk (_parent_), kecuali simpul teratas yang disebut akar
(_root_). Sisi yang terhubung ke simpul di bawahnya disebut cabang (_branch_) atau anak (_child_),
sedangkan simpul yang tidak memiliki anak disebut daun (_leaf_).

Selain itu, ada juga beberapa terminologi umum yang berkaitan dengan konsep _Tree_:

- *_Prodecessor_*: node yang berada diatas node tertentu.
- *_Successor_*: node yang berada di bawah node tertentu.
- *_Ancestor_*: seluruh node yang terletak sebelum node tertentu dan terletak pada jalur yang sama.
- *_Descendant_*: seluruh node yang terletak sesudah node tertentu dan terletak pada jalur yang sama.
- *_Parent_*: predecssor satu level di atas suatu node.
- *_Child_*: successor satu level di bawah suatu node.
- *_Sibling_*: node-node yang memiliki parent yang sama dengan suatu node.
- *_Subtree_*: bagian dari tree yang berupa suatu node beserta descendantnya dan memiliki semua karakteristik   dari tree tersebut.
- *_Size_*: banyaknya node dalam suatu tree.
- *_Height_*: banyaknya tingkatan/level dalam suatu tree.
- *_Root_*: satu-satunya node khusus dalam tree yang tak punya predecessor.
- *_Leaf_*: node-node dalam tree yang tak memiliki successor.
- *_Degree_*: banyaknya child yang dimiliki suatu node.

= Implementasi

Agar lebih mudah memahami konsep _Tree_,
pada praktikum ini diberikan studi kasus untuk membuat pohon silsilah keluarga
dengan mengimplementasikan struktur data _Tree_ pada bahasa pemrograman Python.

#img("assets/pohon-silsilah.png", width: 56%, caption: [Contoh Tree untuk menjelaskan silsilah keluarga])

== Kode Program

#include-code("./src/tree.py")

== Penjelasan

Program `tree.py` tersebut mengimplementasikan struktur data _N-ary Tree_, pohon dengan jumlah anak tidak terbatas per node.
Kode ini memodelkan relasi hierarki, yang dalam kasus ini didemonstrasikan melalui silsilah keluarga.

Kelas `Tree` merepresentasikan sebuah node yang memiliki atribut `data` untuk menyimpan nilai berupa string (`str`)
dan `children` berupa _list_ untuk menyimpan referensi ke node anak (_child_).

Metode `add_child()` dan `remove_child()` berfungsi untuk memanipulasi relasi antar node _parent_ dengan node _child_,
memungkinkan penambahan dan penghapusan referensi node anak pada atribut `children`.
Selain itu, metode ini juga mengembalikan nilai `self` yang berguna untuk penerapan _method chaining_,
di mana pemanggilan beberapa metode dapat dilakukan dalam satu baris kode secara berurutan.

Metode `print_children()` bertugas menampilkan struktur pohon menggunakan pendekatan rekursif.
Metode ini mencetak data node saat ini beserta data node anak-anaknya langsung,
lalu memanggil dirinya sendiri pada setiap anak yang ada di dalam list `children`.
Kondisi berhentinya (base case) adalah ketika list `children` kosong.

Pada fungsi `main()` dilakukan pembuatan beberapa instance objek `Tree` yang merepresentasikan anggota keluarga.
Relasi dibentuk _parent-child_ dengan menggunakan metode `add_child()` pada instance objek parent:
- `grandparent` memiliki anak `parent`
- `parent` memiliki anak `big_bro`, `big_sis`, `me`, dan `lil_bro`.
  Dapat dilihat juga implementasi _method chaining_ pada saat menambahkan children dari node `parent` ini.

=== Output

#img("assets/output.png", width: 80%, caption: [Output program `tree.py`])

== Hasil Analisis

Berikut ini Predecessor, Successor, Ancestor, Descendant, Parent, Child, Sibling, Subtree, Size, Height, Root, Leaf, Degree dari Node `Barra`:

- Predecessor: node `Kakek--Nenek` dan `Ayah--Ibu`
- Successor: Tidak ada, sebab node `Barra` merupakan _leaf_, tidak memiliki _child_
- Ancestor: node `Kakek--Nenek` dan `Ayah--Ibu`
- Descendant: Tidak ada, sebab node `Barra` merupakan _leaf_, tidak memiliki _child_
- Parent: node `Ayah--Ibu`
- Child: Tidak ada, sebab node `Barra` merupakan _leaf_, tidak memiliki _child_
- Sibling: node `Mas`, `Mbak`, dan `Adik`
- Subtree: Tidak ada. Sebab node `Barra` merupakan _leaf_, tidak memiliki _child_
- Size: 6 (node `Kakek--Nenek`, `Ayah--Ibu`, `Mas`, `Mbak`, `Barra`, dan `Adik`)
- Height: 3
- Root: node `Kakek--Nenek`
- Leaf: node `Mas`, `Mbak`, `Barra`, dan `Adik`
- Degree: 0, Sebab node `Barra` merupakan _leaf_, tidak memiliki _child_

