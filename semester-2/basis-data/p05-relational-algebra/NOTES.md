# Pertemuan 5: Relational Algebra

Relational algebra diperkenalkan sebagai bahasa prosedural dengan enam operator dasar: select, project, union, set difference, Cartesian product, dan rename (hlm. 1). Setiap operator menerima satu atau dua relation sebagai masukan dan menghasilkan relation baru, sehingga ekspresi dapat disusun bertingkat. Materi dari Silberschatz memakai notasi σ untuk select, Π untuk project, ∪ untuk union, tanda kurang untuk set difference, kali untuk Cartesian product, dan ρ untuk rename.

Operasi select ditulis σp(r) dengan p sebagai predikat yang tersusun dari suku perbandingan yang dihubungkan operator and, or, dan not (hlm. 2). Operasi ini menyaring baris tanpa mengubah skema. Project menuliskan daftar attribute yang dipertahankan dan menghapus kolom lain, serta membuang baris duplikat karena relation dipandang sebagai himpunan (hlm. 4). Union dan set difference mensyaratkan kedua relation memiliki arity sama dan domain attribute yang kompatibel (hlm. 6-8). Intersection bukan operator dasar, melainkan turunan dari selisih, yaitu r ∩ s = r − (r − s) (hlm. 10). Cartesian product memasangkan setiap tuple dari dua relation, dan bila nama attribute bertabrakan maka rename harus dipakai lebih dulu (hlm. 12). Rename ρ memberi nama pada hasil ekspresi atau mengganti nama attribute (hlm. 15).

Natural join dibahas sebagai operator penting. Hasilnya memiliki skema gabungan kedua relation, dan tuple dipasangkan hanya jika nilainya sama pada semua attribute yang namanya muncul di keduanya (hlm. 18-19). Materi menegaskan bahwa relational algebra bukan Turing complete, sehingga operasi seperti SUM, AVG, MAX, dan MIN tidak dapat dinyatakan langsung tanpa perluasan (hlm. 21). Ringkasan operator beserta contoh pemakaiannya diberikan pada hlm. 22.

Deck kedua menempatkan relational algebra dalam arsitektur RDBMS: query SQL yang deklaratif diterjemahkan menjadi rencana aljabar, dioptimasi menjadi rencana yang setara tetapi lebih murah, lalu dieksekusi operator demi operator (hlm. 18-19). Materi menyebut model relasional berasal dari Edgar Codd pada 1970 dan meraih Turing Award pada 1981 (hlm. 6). Skema, instance, arity, dan cardinality didefinisikan ulang dengan contoh tabel Students (hlm. 7-10).

Perbedaan formal dan praktik juga ditegaskan. Dalam pembahasan formal relation dianggap himpunan dan attribute dipandang dari namanya, bukan urutannya, sedangkan RDBMS nyata memakai multiset (hlm. 21). Karena itu operasi himpunan perlu didefinisikan ulang pada multiset, misalnya irisan memakai hitungan minimum dan gabungan memakai penjumlahan hitungan (hlm. 53-56). Operator turunan yang dibahas mencakup theta join, equi join, natural join, dan semi join, dengan semi join dipakai untuk mengurangi data yang dikirim pada basis data terdistribusi (hlm. 46-50). Keterbatasan terakhir yang disebut adalah ketidakmampuan menyatakan transitive closure, misalnya mencari seluruh kerabat langsung dan tidak langsung (hlm. 57).

## Poin kunci

- Enam operator dasar relational algebra: select, project, union, set difference, Cartesian product, dan rename (hlm. 1).
- Select menyaring baris, project memilih kolom sekaligus membuang duplikat (hlm. 2-4).
- Union dan set difference menuntut arity sama dan domain yang kompatibel (hlm. 6-8).
- Intersection didefinisikan sebagai r − (r − s) (hlm. 10).
- Cartesian product menuntut nama attribute yang berbeda, jika tidak harus di-rename (hlm. 12).
- Natural join memasangkan tuple yang nilainya sama pada attribute bernama sama (hlm. 18).
- Relational algebra bukan Turing complete dan tidak dapat menyatakan transitive closure (hlm. 21, 57).

## Istilah

- relational algebra: bahasa query prosedural yang beroperasi pada relation.
- selection (σ): penyaringan tuple berdasarkan predikat.
- projection (Π): pemilihan sejumlah attribute dan penghapusan duplikat.
- union dan set difference: gabungan dan selisih dua relation yang kompatibel.
- Cartesian product: pasangan setiap tuple dari dua relation.
- rename (ρ): pemberian nama baru pada hasil ekspresi atau attribute.
- natural join: join atas semua attribute bernama sama.
- theta join dan equi join: join dengan predikat umum dan join dengan kesamaan nilai.
- semi join: join yang hanya mengembalikan tuple dari satu sisi.
- multiset: kumpulan yang memperbolehkan duplikat, dipakai RDBMS nyata.
- transitive closure: penelusuran hubungan secara berantai yang tidak dapat dinyatakan relational algebra.

## Sumber

- `relational-algebra.local.pdf`, hlm. 1-22 (enam operator dasar, join, ringkasan)
- `relational-algebra-additional.local.pdf`, hlm. 6-21 (model relasional dan arsitektur RDBMS)
- `relational-algebra-additional.local.pdf`, hlm. 22-50 (operator dan join turunan)
- `relational-algebra-additional.local.pdf`, hlm. 53-57 (multiset dan keterbatasan)
