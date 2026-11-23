# Kunci Jawaban Post-Test FDD

Soal dan kunci ini diturunkan dari `fdd-expert-brief.md`. Rujukan bagian memakai judul bagian di brief tersebut.

| No | Jawaban benar | Alasan | Bagian brief |
| --- | --- | --- | --- |
| 1 | 1. Calculate the total of a sale | Fitur FDD dinamai dengan pola action result object, dan brief memakai kalimat ini sebagai contohnya. Pilihan lain hanya nama modul atau berkas, tanpa pola tersebut. | Key characteristics |
| 2 | 3. Memecah fitur menjadi lebih kecil | Satu fitur dibatasi maksimal dua minggu; bila melebihi, fitur harus dipecah, bukan ditambah orang atau digeser. | Key characteristics |
| 3 | 2. Develop an Overall Model, Build a Features List, Plan by Feature | Tiga proses pertama membentuk fondasi di awal inisiatif, dan urutannya model dulu, lalu daftar fitur, lalu rencana. | Proses inti |
| 4 | 4. Design by Feature dan Build by Feature | Proses keempat dan kelima berulang dalam siklus pendek untuk setiap fitur, sedangkan tiga proses awal hanya sekali di awal. | Proses inti, bagian pembuka |
| 5 | 2. Struktur dasar sistem dan rancangan awal basis data | Keluaran fase ini adalah model domain per subject area ditambah pembagian layer UI, problem domain, data management, system interface, serta entitas, tabel, dan relasi basis data. | Proses inti, Develop an Overall Model |
| 6 | 3. Chief programmer | Plan by Feature dijalankan chief programmer, yang menyusun urutan fitur sekaligus menetapkan feature set owner dan class owner. Chief architect memandu pembuatan model, bukan pembagian kepemilikan class. | Proses inti, Plan by Feature |
| 7 | 1. Design inspection lulus | Design inspection yang lulus adalah milestone Design by Feature, dan pada titik itu fitur dihitung sekitar 44 persen selesai. | Proses inti, Design by Feature |
| 8 | 3. Code inspection | Build by Feature ditutup code inspection sebelum kode dipromosikan ke main build. Design inspection terjadi lebih awal, di Design by Feature. | Proses inti, Build by Feature |
| 9 | 4. FDD menyusun model domain di awal, Scrum emergent | FDD menetapkan model domain dan skema basis data lebih dulu, sementara Scrum membiarkan desain muncul selama iterasi. Pair programming dan sprint adalah ciri XP dan Scrum. | Comparison with other models |
| 10 | 3. Proyek besar 15 sampai 50 developer dengan aturan bisnis kaya | FDD ditujukan untuk proyek besar dan kompleks dengan domain seperti perbankan atau asuransi, ditambah arsitek kuat dan akses rutin ke domain expert. | When should we use this framework/model |

## Catatan untuk pemandu

Tiga hal yang paling sering salah dipahami teman sekelas:

1. "FDD itu waterfall karena modelnya dibuat di awal." Yang benar: hanya tiga proses pertama yang sekali jalan. Design by Feature dan Build by Feature tetap berulang per fitur dalam siklus maksimal dua minggu, jadi FDD tetap iteratif, hanya fondasi arsitekturnya sengaja dikunci lebih dulu.
2. "44 persen berarti hampir separuh kode sudah ditulis." Yang benar: angka itu tercapai tepat saat design inspection lulus, sebelum implementasi di Build by Feature. Yang sudah ada pada titik itu adalah design package, bukan kode.
3. "Class owner dan chief architect itu peran yang sama." Yang benar: chief architect memandu walkthrough dan penyusunan overall model, sedangkan chief programmer yang menyusun rencana serta menetapkan feature set owner dan class owner. Class owner sendiri yang mengimplementasikan class miliknya di Build by Feature.
