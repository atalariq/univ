# Pertemuan 2: Entity Relationship Diagram

Entity Relationship Model memandang sebuah enterprise sebagai kumpulan entity dan relationship (hlm. 3). Entity adalah objek yang dapat dibedakan dari objek lain dan dijelaskan oleh sekumpulan attribute, sedangkan relationship adalah asosiasi antara beberapa entity. Model ini dibuat agar perancangan basis data dapat dimulai dari skema enterprise yang menggambarkan struktur logis keseluruhan, lalu dipetakan ke skema konseptual. Materi menyebut tiga konsep dasarnya, yaitu entity set, relationship set, dan attribute, dengan representasi grafis berupa ER diagram yang berfungsi untuk perancangan, komunikasi, dan dokumentasi (hlm. 4). Notasi yang dipakai dalam kuliah adalah notasi Chen.

Entity set adalah himpunan entity sejenis yang berbagi properti sama, misalnya instructor dengan (ID, name, street, city, salary) atau course dengan (course_id, title, credits) (hlm. 6). Sebagian attribute membentuk primary key yang membedakan setiap anggota himpunan dan biasanya digarisbawahi. Materi juga membedakan weak entity set, yang keberadaannya bergantung pada identifying entity dan memakai discriminator alih-alih primary key, dari strong entity set (hlm. 7). Entity yang diletakkan di antara dua entity untuk memecah relasi M:N disebut associative entity dan juga tergolong weak entity.

Attribute dibedakan menjadi lima jenis: multivalued yang boleh bernilai lebih dari satu, derived yang nilainya dihitung dari attribute lain, composite yang tersusun dari attribute lain, simple yang tunggal dan atomik, serta key yang dipakai mengidentifikasi entity (hlm. 8). Relationship set didefinisikan sebagai relasi matematis atas n entity, dan derajatnya dibedakan menjadi binary yang paling umum dan ternary yang jarang (hlm. 9-10). Mapping cardinality menjelaskan berapa entity yang boleh berpasangan melalui satu relationship, dengan empat kemungkinan: one to one, one to many, many to one, dan many to many (hlm. 11-13).

Bagian kedua deck membahas simbol dan pemetaan ERD ke tabel. Simbol membedakan partisipasi mandatory dan optional, jenis attribute, serta cardinality, dan materi mengingatkan bahwa banyak gaya notasi dapat tercampur dalam satu diagram (hlm. 16-21). Aturan pemetaannya: strong entity dengan attribute sederhana menjadi satu tabel dengan key attribute sebagai primary key (hlm. 23), attribute composite tetap menghasilkan satu tabel dengan attribute sederhananya saja (hlm. 24), sedangkan attribute multivalued menuntut dua tabel (hlm. 26). Relationship set menjadi satu tabel berisi primary key entity yang terlibat ditambah attribute deskriptifnya (hlm. 28), dan empat kasus cardinality dipetakan satu per satu (hlm. 30-34).

Modul Oracle Academy menambahkan bahwa model ER bersifat implementation-free, yaitu tetap sama apa pun jenis basis data yang akhirnya dipakai (modul 2-3, hlm. 5). Empat tujuannya adalah menangkap seluruh data yang dibutuhkan, memastikan data hanya muncul sekali, tidak memodelkan data yang dapat diturunkan, dan menempatkan data pada lokasi yang logis (hlm. 8).

## Poin kunci

- ER model dibangun dari entity set, relationship set, dan attribute (hlm. 4).
- Primary key membedakan setiap entity dan digarisbawahi pada diagram (hlm. 6).
- Weak entity bergantung pada identifying entity dan memakai discriminator (hlm. 7).
- Ada lima jenis attribute: multivalued, derived, composite, simple, dan key (hlm. 8).
- Empat mapping cardinality: one to one, one to many, many to one, many to many (hlm. 11-13).
- Strong entity dengan attribute sederhana dipetakan menjadi satu tabel (hlm. 23).
- Attribute multivalued memerlukan dua tabel, sedangkan relationship set menjadi tabel tersendiri (hlm. 26-28).

## Istilah

- entity: objek atau hal yang dapat dibedakan dari objek lain.
- entity set: himpunan entity sejenis yang berbagi properti.
- instance: satu kemunculan tunggal dari sebuah entity.
- attribute: keterangan yang menjelaskan, mengukur, atau mengklasifikasi entity.
- primary key: attribute yang unik mengidentifikasi setiap entity.
- weak entity dan strong entity: entity yang bergantung pada entity lain dan yang berdiri sendiri.
- identifying relationship: relationship yang mengaitkan weak entity dengan identifying entity.
- associative entity: entity penghubung untuk memecah relasi many to many.
- relationship set: himpunan asosiasi antar entity.
- degree: jumlah entity set yang terlibat dalam satu relationship.
- mapping cardinality: jumlah entity yang dapat berpasangan melalui suatu relationship.
- ERD: diagram yang menggambarkan entity, attribute, dan relationship.

## Sumber

- `entity-relationship-diagram.local.pdf`, hlm. 3-14 (konsep, entity, attribute, relationship, cardinality)
- `entity-relationship-diagram.local.pdf`, hlm. 16-34 (simbol dan pemetaan ke tabel)
- `00-materials/oracle-academy-database-design/dd_2_2-entities-instances-attributes-and-identifiers.local.pdf`, hlm. 6-13
- `00-materials/oracle-academy-database-design/dd_2_3-erd-modeling.local.pdf`, hlm. 5-8
