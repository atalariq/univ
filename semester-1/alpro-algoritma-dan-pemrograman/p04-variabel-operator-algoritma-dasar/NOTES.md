# Pertemuan 4: Variabel, operator, dan algoritma dasar

Pertemuan ini mengingatkan kembali variabel dan operator sebelum masuk ke algoritma dasar. Latihan pembuka meminta mahasiswa mengidentifikasi operator, operand, dan hasil pada setiap baris kode (hlm. 2). Setelah itu fokus berpindah ke instruksi pemilihan, yaitu instruksi untuk memilih satu aksi dari beberapa kemungkinan berdasarkan syarat (hlm. 4).

Bentuk if ditulis dengan kondisi di dalam tanda kurung dan blok statement untuk kondisi benar maupun salah (hlm. 5). Contoh elevator yang melewati lantai 13 menunjukkan bahwa else boleh dihilangkan bila tidak ada aksi yang perlu dilakukan pada cabang tersebut (hlm. 6-8). Contoh harga diskon memperlihatkan satu kondisi dengan satu aksi opsional (hlm. 9). Untuk lebih dari dua kemungkinan, beberapa if dapat digabung, dan pengujian berhenti begitu satu kondisi berhasil (hlm. 10-11). if juga dapat bersarang di dalam if lain (hlm. 12), sedangkan switch disebut sebagai gabungan beberapa if-then-else (hlm. 13).

Deck lalu meminta mahasiswa menentukan statement mana yang pasti dikerjakan dan mana yang tidak selalu dikerjakan pada potongan kode tertentu (hlm. 14-17). Dari situ masuk ke analisis algoritma sebagai alokasi sumber daya: waktu untuk running time dan space untuk memory. Setiap statement membutuhkan waktu, setiap variabel membutuhkan space, dan setiap operasi membutuhkan space (hlm. 18-20). Ketiga komponen biaya itu diperlakukan terpisah saat menghitung running time (hlm. 18). Untuk if tanpa else, best-case terjadi bila statement di dalam if tidak dikerjakan dan worst-case bila dikerjakan. Untuk if-else, running time memakai nilai maksimum dari kedua cabang pada worst-case (hlm. 21). Materi ditutup dengan pengantar struktur pengulangan (hlm. 23).

## Poin kunci

- Instruksi pemilihan memilih satu aksi dari beberapa kemungkinan berdasarkan syarat (hlm. 4).
- Else boleh dihilangkan bila cabang salah tidak memerlukan aksi (hlm. 8).
- Beberapa if dapat digabung untuk menangani lebih dari dua kasus, dan pengujian berhenti setelah satu kondisi berhasil (hlm. 10-11).
- if dapat bersarang, dan switch adalah gabungan beberapa if-then-else (hlm. 12-13).
- Analisis algoritma membagi sumber daya menjadi waktu (running time) dan ruang (memory) (hlm. 18).
- Pada if tanpa else, worst-case adalah saat statement di dalam if dikerjakan (hlm. 21).
- Pada if-else, running time worst-case memakai nilai maksimum dari kedua cabang (hlm. 21).

## Istilah

- Condition: syarat yang menentukan cabang mana yang dijalankan.
- Nested if: if yang berada di dalam if lain.
- Switch: struktur pemilihan banyak cabang yang digabungkan dari if-then-else.
- Running time: waktu eksekusi yang dibutuhkan sebuah algoritma.
- Space: memori yang dibutuhkan variabel dan operasi.
- Best-case: kondisi terbaik yang meminimalkan pekerjaan.
- Worst-case: kondisi terburuk yang memaksimalkan pekerjaan.
- Operand: nilai atau variabel yang dikenai operator.

## Sumber

- `2025-08-19-04-alpro.local.pdf`, hlm. 2-24
