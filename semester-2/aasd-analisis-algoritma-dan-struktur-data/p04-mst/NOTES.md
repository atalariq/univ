# Pertemuan 4: Minimum Spanning Tree

Deck ini dibuka dengan membedakan graph dan tree. Pada tree setiap node hanya punya satu parent, sedangkan pada graph sebuah node boleh punya banyak edge ke node lain (hlm. 1). Dengan menghilangkan sebagian edge, sebuah graph dapat diubah menjadi bermacam-macam tree. Materi memakai graf X berisi lima node sebagai contoh dan menunjukkan dua tree berbeda yang berasal dari graf yang sama (hlm. 1-2). Ditegaskan bahwa bentuk gambar bukan penentu: tree Y dan Z pada ilustrasi 6.3 tetap tree meski digambar ulang pada ilustrasi 6.4 (hlm. 2).

Selanjutnya diperkenalkan weighted graph, yaitu graph yang setiap edge-nya memiliki bobot. Total weight adalah jumlah bobot seluruh edge, misalnya 5+3+7+11+6+9=41 pada graph K (hlm. 3). Spanning tree didefinisikan sebagai tree yang dibuat dari sebuah graph dengan menghilangkan sebagian edge tetapi tetap memuat semua node (hlm. 3). Yang membedakan tree dari graph hanyalah adanya jalur putaran, sehingga jalur itulah yang harus dihilangkan (hlm. 4). Karena tiap kombinasi menghasilkan total weight berbeda, problem Minimum Spanning Tree mencari spanning tree dengan total weight terkecil (hlm. 5).

Materi menyebut dua metode greedy untuk masalah ini, keduanya dinamai menurut penemunya: algoritma Prim-Dijkstra, yang ditemukan Robert C. Prim pada 1957 dan Edsger Dijkstra pada 1959, serta algoritma Kruskal yang ditemukan Joseph Kruskal pada 1956 (hlm. 5).

Algoritma Prim-Dijkstra bertolak dari satu node awal. Dari semua edge yang menyentuh node awal dipilih bobot terkecil, edge itu ditandai hijau, dan node di ujungnya menjadi node aktif (hlm. 6). Pada langkah berikutnya dibandingkan seluruh edge hitam yang terhubung ke kumpulan node aktif, lalu dipilih yang terkecil. Edge yang kedua ujungnya sudah tersentuh jalur hijau ditandai merah karena akan membentuk jalur putaran dan melanggar syarat tree (hlm. 6). Proses diulang sampai semua node terlewati, dan jalur hijau itulah MST-nya. Contoh pada ilustrasi 6.6 memakai graf delapan node A sampai H; pemilihan pertama adalah edge AD dengan bobot 7 karena paling kecil di antara edge yang menyentuh node A (hlm. 7-11).

Algoritma Kruskal tidak memakai node awal. Semua edge hitam dibandingkan, edge dengan bobot terkecil ditandai hijau, lalu edge yang kedua ujungnya sudah terhubung ditandai merah (hlm. 12). Langkah itu diulang dari perbandingan seluruh edge hitam, bukan hanya yang menyentuh satu kumpulan node, sampai semua node terlewati (hlm. 13-17). Pada graf yang sama, pemilihan pertamanya adalah edge EH dengan bobot 4.

Bagian penutup mengulang kasus shortest path dari pertemuan sebelumnya untuk menunjukkan batas metode greedy. Dari A ke F, greedy memilih AD lalu DC lalu CF sehingga totalnya 36 (hlm. 18-21), padahal jalur ADEBF hanya 30 (hlm. 22). Materi menjelaskan bahwa greedy hanya melihat jarak lokal, misalnya DC 12 lebih kecil dari DE 15, tanpa melihat akibatnya pada lintasan keseluruhan, sehingga solusinya local optimum (hlm. 23).

## Poin kunci

- Spanning tree memuat semua node graph dan tidak boleh mengandung jalur putaran (hlm. 3-4).
- MST adalah spanning tree dengan total bobot edge paling kecil (hlm. 5).
- Prim-Dijkstra tumbuh dari satu node awal dan hanya membandingkan edge yang menyentuh node aktif (hlm. 6).
- Kruskal membandingkan seluruh edge yang tersisa dan memilih bobot terkecil secara global (hlm. 12).
- Edge yang kedua ujungnya sudah terhubung ditandai merah untuk mencegah jalur putaran (hlm. 6, 12).
- Greedy gagal pada shortest path karena hanya mengejar jarak terkecil di setiap titik, bukan total lintasan (hlm. 22-23).

## Istilah

- weighted graph: graph yang setiap edge-nya memiliki nilai atau bobot.
- spanning tree: tree yang berasal dari graph dan memuat semua node graph.
- total weight: jumlah bobot seluruh edge pada suatu tree.
- Minimum Spanning Tree (MST): spanning tree dengan total weight minimum.
- node aktif: node yang sudah terhubung oleh edge terpilih pada algoritma Prim-Dijkstra.
- jalur putaran atau cycle: lintasan yang kembali ke node asal dan harus dihilangkan pada tree.
- Prim-Dijkstra: algoritma MST yang tumbuh dari satu node awal.
- Kruskal: algoritma MST yang memilih edge terkecil dari seluruh edge tersisa.
- local optimum: solusi terbaik pada lingkup lokal saja.

## Sumber

- `mst.local.pdf`, hlm. 1-5 (graph, tree, spanning tree, MST)
- `mst.local.pdf`, hlm. 6-11 (algoritma Prim-Dijkstra)
- `mst.local.pdf`, hlm. 12-17 (algoritma Kruskal)
- `mst.local.pdf`, hlm. 18-23 (shortest path dan batas greedy)
