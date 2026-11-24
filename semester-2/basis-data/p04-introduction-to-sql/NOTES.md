# Pertemuan 4: Introduction to SQL

Materi pertemuan ini memakai dua bab dari Silberschatz, Korth, dan Sudarshan. Berkas pertama adalah Chapter 3 tentang pengantar SQL, berkas kedua Chapter 4 tentang SQL tingkat menengah. Keduanya melengkapi kuliah SQL sebelumnya dengan pembahasan yang lebih sistematis dan berbasis buku teks.

Chapter 3 dimulai dari Data Definition Language, yaitu bagian SQL yang menetapkan informasi tentang relation (hlm. 4). Domain type yang diperkenalkan mencakup char dan varchar untuk string, int, smallint, dan numeric untuk bilangan, float, real, dan double untuk pecahan, serta date dan time untuk waktu. Relation didefinisikan dengan perintah create table yang menyebut nama relation, nama attribute, dan tipenya (hlm. 6). Integrity constraint yang dapat dituliskan dalam create table meliputi not null, primary key, unique, check, dan foreign key (hlm. 7-9). Perubahan isi tabel dilakukan dengan insert, delete, dan update (hlm. 10).

Struktur query dasar terdiri atas select, from, dan where (hlm. 11). Klausa select menentukan attribute hasil dan berkaitan dengan operasi projection pada relational algebra, sedangkan where menyaring tuple dan berkaitan dengan selection (hlm. 12, 16). Materi menjelaskan distinct untuk menghilangkan duplikat, tanda bintang untuk semua attribute, serta ekspresi aritmetika pada select (hlm. 13-15). Klausa from memuat relation yang terlibat dan berkaitan dengan Cartesian product (hlm. 17). Rename dengan as dipakai untuk memberi nama hasil, termasuk untuk self join pada relation yang sama (hlm. 20-21). String matching memakai like dengan pola persen dan garis bawah, dan pencocokan bersifat peka huruf besar-kecil (hlm. 22-23). Order by mengurutkan hasil, sedangkan between menyatakan rentang nilai (hlm. 24-25).

Karena SQL memakai multiset, materi membahas berapa salinan tuple yang muncul pada hasil (hlm. 26-27). Operator himpunan union, intersect, dan except secara otomatis membuang duplikat (hlm. 28-30). Nilai null memunculkan logika tiga nilai, true, false, dan unknown, sehingga perbandingan dengan null tidak pernah bernilai true (hlm. 31-32). Fungsi agregat sum, count, min, max, dan avg bekerja pada multiset nilai kolom, dan group by mengelompokkan tuple sebelum agregat dihitung (hlm. 33-36). Having memberi syarat pada hasil agregat, berbeda dari where yang menyaring tuple, dan null diabaikan oleh sebagian besar agregat (hlm. 37-38).

Subquery dibahas panjang pada hlm. 39-57: uji keanggotaan dengan in dan not in, perbandingan himpunan dengan some dan all, uji kekosongan dengan exists dan not exists, uji duplikat dengan unique, subquery di klausa from, klausa with untuk relation sementara, dan scalar subquery di klausa select. Materi juga menunjukkan bahwa query yang memakai not exists dapat menyatakan “mahasiswa yang mengambil semua mata kuliah Biologi” (hlm. 50). Modifikasi data ditutup dengan delete, insert, update, serta case untuk pembaruan bersyarat (hlm. 58-65).

Chapter 4 melanjutkan ke join expression termasuk natural join dan outer join (hlm. 2-11), view dan materialized view (hlm. 12-22), transaksi sebagai satu unit kerja (hlm. 23), integrity constraint seperti check, referential integrity, dan cascading (hlm. 24-31), tipe data bawaan date, time, dan interval, index, user-defined type, domain, serta large object (hlm. 32-36), lalu otorisasi dengan grant, revoke, dan role (hlm. 37-43).

## Poin kunci

- create table menetapkan attribute, tipe, dan constraint sekaligus (hlm. 6-9).
- select berkaitan dengan projection dan where dengan selection (hlm. 12, 16).
- from berisi relation yang digabung dan berkaitan dengan Cartesian product (hlm. 17).
- union, intersect, dan except membuang duplikat karena SQL menyimpan multiset (hlm. 26-30).
- Perbandingan dengan null menghasilkan unknown, bukan true atau false (hlm. 32).
- Attribute di select yang bukan agregat wajib muncul di group by (hlm. 36).
- not exists dapat dipakai untuk menyatakan kuantifikasi universal (hlm. 50).
- View adalah relation virtual, sedangkan materialized view menyimpan hasilnya secara fisik (hlm. 12, 22).

## Istilah

- DDL: bagian SQL untuk mendefinisikan relation dan constraint.
- domain type: tipe data yang sah untuk sebuah attribute.
- integrity constraint: aturan yang menjaga kebenaran data, seperti not null dan foreign key.
- Cartesian product: gabungan setiap tuple dua relation.
- self join: join yang memakai relation yang sama lebih dari sekali.
- scalar subquery: subquery yang menghasilkan satu nilai.
- correlated subquery: subquery yang merujuk attribute query luar.
- view: relation virtual hasil definisi query.
- materialized view: view yang hasilnya disimpan sebagai tabel fisik.
- transaksi: satu unit kerja yang harus selesai seluruhnya atau dibatalkan.
- referential integrity: aturan bahwa nilai foreign key harus ada di relation yang dirujuk.
- cascading: penghapusan atau pembaruan yang ikut diterapkan pada tuple terkait.
- grant, revoke, dan role: pemberian, pencabutan, dan pengelompokan hak akses.

## Sumber

- `introduction-to-sql.local.pdf`, hlm. 4-10 (DDL dan perubahan tabel)
- `introduction-to-sql.local.pdf`, hlm. 11-38 (query dasar, himpunan, null, agregasi)
- `introduction-to-sql.local.pdf`, hlm. 39-65 (subquery dan modifikasi data)
- `sql-silberschatz-ch4-intermediate.local.pdf`, hlm. 2-43 (join, view, transaksi, constraint, otorisasi)
