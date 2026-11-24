# Pertemuan 7: Prosedur dan fungsi

Materi dibuka dengan kutipan Al-Khuwarizmi tentang membagi tujuan besar menjadi tujuan kecil yang dapat dicapai (hlm. 2). Dari situ masuk ke teknik pemrograman modular: program dipecah menjadi subprogram yang lebih kecil. Subprogram kadang independen dari program utama sehingga dapat dirancang tanpa mempertimbangkan konteks pemakaiannya, bahkan oleh orang lain. Modularisasi memberi dua keuntungan, yaitu menghindari penulisan teks program yang sama berulang kali dan memudahkan penulisan serta pencarian kesalahan atau debug (hlm. 3).

Prosedur didefinisikan sebagai modul program yang mengerjakan tugas spesifik dan menghasilkan efek netto. Efek netto diketahui dengan membandingkan keadaan sebelum dan sesudah prosedur dijalankan, sehingga setiap prosedur harus mendefinisikan keadaan awal dan keadaan akhir (hlm. 5). Prosedur berisi instruksi yang dapat dipanggil. Pada Python, prosedur dideklarasikan dengan def namaprosedur() diakhiri titik dua, dan dipanggil dengan menuliskan namaprosedur() (hlm. 6). Prosedur dapat diakses dari program pemanggil, dan prototipe perlu dideklarasikan agar pemanggil mengenal nama serta cara mengaksesnya (hlm. 7).

Fungsi dijelaskan sama seperti prosedur, dengan perbedaan bahwa fungsi mengembalikan nilai lewat return. Return tidak harus langsung di-print karena pemanggilan fungsi dapat dibungkus dalam print (hlm. 9). Prosedur dan fungsi dapat menerima parameter, sehingga pemanggil memberi input bagi variabel yang diproses di dalamnya, dan hasilnya dapat ditampung ke variabel (hlm. 11). Nama lokal adalah nama yang dideklarasikan di dalam prosedur dan hanya berlaku di prosedur tersebut, sedangkan nama global dideklarasikan di program utama dan dapat dipakai di mana pun (hlm. 13).

Contoh yang ditampilkan adalah fungsi PANGKATKAN dengan parameter a dan n yang mengembalikan hasil perpangkatan, lalu dipakai di program utama VOLUME_BOLA untuk menghitung V = 4/3 pi r^3 (hlm. 15). Deck ditutup dengan arahan bahwa materi berikutnya adalah rekursi (hlm. 17).

## Poin kunci

- Pemrograman modular memecah program menjadi subprogram yang lebih kecil (hlm. 3).
- Modularisasi menghindari duplikasi teks program dan memudahkan debug (hlm. 3).
- Prosedur mengerjakan tugas spesifik dan menghasilkan efek netto (hlm. 5).
- Setiap prosedur harus mendefinisikan keadaan awal dan keadaan akhir (hlm. 5).
- Prosedur Python dideklarasikan dengan def dan dipanggil dengan namanya (hlm. 6).
- Fungsi sama dengan prosedur tetapi mengembalikan nilai lewat return (hlm. 9).
- Nama lokal hanya berlaku di dalam prosedur, nama global berlaku di seluruh program (hlm. 13).

## Istilah

- Modular programming: teknik memecah program menjadi subprogram.
- Subprogram: bagian program yang lebih kecil, disebut juga modul atau routine.
- Procedure: modul yang mengerjakan tugas spesifik tanpa wajib mengembalikan nilai.
- Function: modul yang mengembalikan nilai lewat return.
- Net effect: perbedaan keadaan sebelum dan sesudah prosedur dijalankan.
- Parameter: nilai masukan yang diberikan saat memanggil prosedur atau fungsi.
- Prototype: deklarasi awal agar pemanggil mengenal prosedur.
- Local name: nama yang hanya berlaku di dalam prosedur tempat ia dideklarasikan.
- Global name: nama yang dideklarasikan di program utama dan berlaku luas.
- Debug: upaya menemukan dan memperbaiki kesalahan program.

## Sumber

- `2025-08-19-07-alpro.local.pdf`, hlm. 2-17
