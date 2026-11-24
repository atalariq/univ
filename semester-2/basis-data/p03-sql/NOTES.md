# Pertemuan 3: SQL

Deck ini memuat kuliah pengantar SQL dalam dua bagian. SQL disebut bahasa standar untuk query dan manipulasi data, sekaligus bahasa tingkat tinggi karena dapat dioptimasi sistem (hlm. 9). Perannya dibedakan menjadi Data Definition Language untuk mendefinisikan skema seperti create, alter, dan drop table, serta Data Manipulation Language untuk menyisipkan, mengubah, menghapus, dan menanyakan tuple (hlm. 10).

Secara formal, tabel atau relation adalah multiset tuple yang memiliki attribute sesuai skema (hlm. 11). Multiset berarti daftar tak berurut yang masih memperbolehkan duplikat. Attribute harus bertipe atomik, sehingga tabel bersifat flat, dan tipenya antara lain CHAR, VARCHAR, INT, BIGINT, SMALLINT, FLOAT, MONEY, serta DATETIME (hlm. 13-16). Jumlah tuple disebut cardinality, sedangkan jumlah attribute disebut arity (hlm. 15). Sebuah key adalah subset attribute minimal yang unik mengidentifikasi setiap tuple, digarisbawahi pada penulisan skema, dan nilainya boleh dibatasi NOT NULL (hlm. 17-19). Materi menyinggung bahwa constraint umum jarang ditulis karena alasan performa (hlm. 20).

Bentuk query yang menjadi inti adalah SELECT, FROM, WHERE, yang disebut SFW query (hlm. 25). Bagian SELECT menentukan attribute keluaran atau projection, WHERE menyaring tuple atau selection (hlm. 26-27). Perintah SQL tidak peka huruf besar-kecil, tetapi nilai string peka, dan konstanta ditulis dengan kutip tunggal (hlm. 29). Operator tambahan mencakup LIKE dengan pola `%` dan `_`, DISTINCT untuk menghapus duplikat, serta ORDER BY yang menaik secara bawaan dan dapat dibalik dengan DESC (hlm. 30-32).

Query banyak tabel memerlukan foreign key. Mahasiswa hanya boleh terdaftar pada mata kuliah jika ada di tabel Students, dan aturan itu dinyatakan lewat FOREIGN KEY pada CREATE TABLE (hlm. 36-37). Penghapusan data induk dapat ditolak atau diikuti dengan penghapusan data anak, bergantung pilihan DBA (hlm. 38). Join ditulis dengan menyebut beberapa tabel di FROM lalu menyamakan kolom di WHERE, dan bentuk JOIN ON setara dengannya (hlm. 40-42). Semantik join dijelaskan sebagai cross product, lalu penyaringan kondisi, lalu projection (hlm. 46-49); urutan ini adalah makna, bukan urutan eksekusi. Nama kolom yang sama di dua tabel diselesaikan dengan nama tabel atau alias (hlm. 44-45).

Kuliah kedua membahas operator himpunan dan subquery. UNION, INTERSECT, dan EXCEPT bekerja dengan semantik himpunan sehingga duplikat hilang, sedangkan UNION ALL mempertahankan multiset (hlm. 73-76). Contoh kegagalan INTERSECT muncul saat yang diiris adalah kota kantor pusat alih-alih nama perusahaan (hlm. 77-79). Subquery dapat bersarang karena SQL bersifat komposisional, dan dapat memakai IN, ANY, ALL, EXISTS, serta NOT EXISTS (hlm. 80-89).

Bagian akhir membahas agregasi dan NULL. SUM, COUNT, MIN, MAX, dan AVG bekerja pada multiset nilai kolom (hlm. 94), dan GROUP BY mengelompokkan tuple sebelum agregat dihitung dalam tiga langkah: FROM-WHERE, GROUP BY, lalu SELECT (hlm. 98-102). HAVING memberi syarat pada agregat, berbeda dari WHERE yang menyaring tuple (hlm. 103). Pendekatan GROUP BY disebut lebih efisien daripada subquery bersarang untuk kasus seperti menghitung penulis dengan minimal sepuluh dokumen (hlm. 107-108). NULL membuat logika bernilai tiga: true, false, dan unknown, sehingga baris dengan NULL tidak ikut terpilih dan perlu diuji dengan IS NULL (hlm. 114-119). Outer join dipakai agar tuple tanpa pasangan tetap muncul, dengan varian left, right, dan full (hlm. 120-124).

## Poin kunci

- SQL mencakup DDL untuk skema dan DML untuk data (hlm. 10).
- Tabel adalah multiset tuple dan setiap attribute harus bertipe atomik (hlm. 11-13).
- Key adalah subset attribute minimal yang unik untuk setiap tuple (hlm. 18).
- SFW query terdiri atas SELECT, FROM, dan WHERE (hlm. 25).
- Join bermakna cross product, lalu selection, lalu projection, dan itu bukan urutan eksekusi (hlm. 48-49).
- UNION, INTERSECT, dan EXCEPT membuang duplikat, sedangkan UNION ALL tidak (hlm. 74-76).
- GROUP BY dihitung setelah WHERE dan sebelum HAVING (hlm. 105-106).
- NULL memakai logika tiga nilai sehingga baris dengan NULL bisa tidak terpilih (hlm. 116-118).

## Istilah

- DDL: bagian SQL untuk mendefinisikan skema dan tabel.
- DML: bagian SQL untuk menyisipkan, mengubah, menghapus, dan menanyakan data.
- multiset: kumpulan tak berurut yang memperbolehkan duplikat.
- arity dan cardinality: jumlah attribute dan jumlah tuple pada relation.
- primary key dan foreign key: attribute unik pengidentifikasi tuple dan attribute yang merujuk key tabel lain.
- SFW query: query berbentuk SELECT-FROM-WHERE.
- selection dan projection: penyaringan baris dan pemilihan kolom.
- cross product: gabungan setiap tuple dari dua tabel.
- subquery: query yang bersarang di dalam query lain.
- correlated subquery: subquery yang memakai variabel dari query luar.
- aggregate function: fungsi seperti SUM, COUNT, MIN, MAX, dan AVG.
- GROUP BY dan HAVING: pengelompokan tuple dan penyaringan atas hasil agregat.
- three-valued logic: logika SQL dengan nilai true, false, dan unknown.
- outer join: join yang tetap memunculkan tuple tanpa pasangan.

## Sumber

- `sql.local.pdf`, hlm. 9-22 (pengantar, tabel, skema, key, constraint)
- `sql.local.pdf`, hlm. 25-33 (SFW, LIKE, DISTINCT, ORDER BY)
- `sql.local.pdf`, hlm. 36-55 (foreign key, join, semantik join)
- `sql.local.pdf`, hlm. 68-91 (operator himpunan dan subquery)
- `sql.local.pdf`, hlm. 94-110 (agregasi dan GROUP BY)
- `sql.local.pdf`, hlm. 112-126 (kuantifikasi, NULL, outer join)
