# Pertemuan 1: Pengantar Basis Data

Kuliah ini dibuka dengan pertanyaan apa itu basis data, mengapa dibutuhkan, mengapa dipelajari, dan apa saja fokusnya (hlm. 2). Definisi yang dikutip dari Elmasri dan Navathe menyebut basis data sebagai kumpulan data yang saling berhubungan, dengan data berarti fakta yang dapat dicatat dan memiliki makna tersirat (hlm. 3). Definisi kedua dari Oracle menambahkan bahwa basis data biasanya dikendalikan oleh database management system, dan data, DBMS, serta aplikasinya bersama-sama disebut database system.

Alasan memakai basis data diuraikan pada hlm. 4: mampu menyimpan sangat banyak record secara efisien, pencarian informasi cepat dan mudah, pengelolaan lebih sederhana karena penambahan, penyuntingan, dan penghapusan data tidak rumit, data dapat dicari dan diurutkan, integritas data terjaga sehingga bisa diimpor ke aplikasi lain, banyak orang dapat mengakses data yang sama pada waktu bersamaan, dan ada alasan keamanan. Materi pendukung Oracle Academy membedakan data dari informasi: data adalah fakta yang terkumpul, sedangkan informasi adalah hasil penggabungan, perbandingan, dan perhitungan atas data tersebut (modul 1-2, hlm. 5-6). Modul itu juga menyebut DBMS sebagai perangkat lunak yang mengendalikan penyimpanan, pengorganisasian, dan pengambilan data, dengan unsur berupa manajemen memori dan penyimpanan, data dictionary, serta query language (hlm. 10).

Fokus perkuliahan disebutkan pada hlm. 6: kegunaan dan jenis basis data, perancangan basis data untuk menampung kebutuhan, pembangunan dan pemakaian query language, serta pembaruan data yang aman. Jenis basis data yang didaftar mencakup relational, object-oriented, distributed, data warehouse, NoSQL, graph, dan OLTP (hlm. 7). Basis data relasional disebut dominan sejak 1980-an dan menyusun data sebagai tabel berkolom dan baris.

Bagian sejarah mencatat empat periode (hlm. 8-10). Pada 1950-an dan awal 1960-an, pengolahan data memakai magnetic tape dengan akses berurutan dan kartu berlubang sebagai masukan. Pada akhir 1960-an dan 1970-an, hard disk memungkinkan akses langsung, model network dan hierarchical populer, lalu Ted Codd merumuskan model relasional yang membuatnya meraih ACM Turing Award, disusul prototipe System R di IBM Research dan Ingres di UC Berkeley. Dekade 1980-an membawa SQL sebagai standar industri, sistem paralel dan terdistribusi, serta basis data berorientasi objek. Dekade 1990-an dan 2000-an ditandai data warehouse multi-terabyte, data mining, perdagangan lewat web, standar XML dan XQuery, serta sistem penyimpanan raksasa seperti Google BigTable.

## Poin kunci

- Basis data adalah kumpulan data yang saling berhubungan dan memiliki makna (hlm. 3).
- Data berbeda dari informasi: informasi adalah hasil pengolahan data (modul 1-2, hlm. 5-6).
- DBMS mengendalikan penyimpanan, pengorganisasian, dan pengambilan data (modul 1-2, hlm. 10).
- Keunggulan basis data meliputi kapasitas besar, pencarian cepat, integritas, multi-access, dan keamanan (hlm. 4).
- Basis data relasional menyusun data sebagai tabel berbaris dan berkolom (hlm. 7).
- Model relasional diperkenalkan Ted Codd dan menjadi dasar SQL sebagai standar industri (hlm. 8-10).

## Istilah

- database: kumpulan data terstruktur yang saling berhubungan.
- data: fakta yang tercatat dan memiliki makna tersirat.
- information: hasil penggabungan, perbandingan, dan perhitungan atas data.
- DBMS: perangkat lunak pengendali penyimpanan, pengorganisasian, dan pengambilan data.
- data dictionary: unsur DBMS yang menyimpan keterangan tentang struktur data.
- query language: bahasa untuk mengambil dan mengolah data.
- relational database: basis data yang menyusun data dalam tabel berbaris dan berkolom.
- NoSQL: basis data nonrelasional untuk data tak terstruktur atau semiterstruktur.
- data warehouse: pusat penyimpanan data yang dirancang untuk query dan analisis cepat.
- OLTP: basis data untuk transaksi berjumlah besar oleh banyak pengguna.

## Sumber

- `pengantar-basis-data.local.pdf`, hlm. 2-13
- `00-materials/oracle-academy-database-foundations/dfo_1_2-database-intro.local.pdf`, hlm. 5-10
