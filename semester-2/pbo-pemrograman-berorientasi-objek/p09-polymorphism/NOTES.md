# Pertemuan 9: Polymorphism

Kuliah dibuka dengan mengulang hierarki kelas dari latihan pertemuan sebelumnya: Person dengan attribute nama, usia, tanggal lahir, dan NIK, lalu Customer dan Employee sebagai turunannya, dengan Salesman dan Manager di bawah Employee (hlm. 2-4). Employee memiliki baseSalary, NIP, jobdesc, department, dan isReceivingBonus, sedangkan Salesman menambahkan target, realisasi, dan potonganGaji, serta Manager menambahkan anakBuah dan totalTarget.

Polymorphism dijelaskan dari akar katanya: poly berarti banyak dan morph berarti bentuk, sehingga istilah ini berkaitan dengan satu nama yang memiliki banyak bentuk (hlm. 6). Kasus latarnya adalah kelas Animal dengan method sound, yang diwarisi Dog dan Cat, padahal keduanya bersuara berbeda. Anjing dan kucing juga mengeluarkan bunyi berbeda kepada orang yang berbeda, atau mengulang bunyinya sesuai frekuensi tertentu (hlm. 7).

Materi membedakan dua cara mewujudkannya. Overriding dipakai ketika kelas anak ingin mendefinisikan ulang atau mengubah perilaku kelas induk (hlm. 8). Contohnya Animal memiliki method sound yang mencetak "Baaaaa", sedangkan Dog menuliskan ulang method sound untuk mencetak "Woof woof" (hlm. 9). Overloading terjadi ketika dua method atau lebih dalam kelas yang sama memakai nama sama tetapi signature berbeda, dengan signature berarti jumlah, tipe, dan urutan parameter (hlm. 10). Contohnya Dog punya sound() dan sound(String personType); versi kedua memeriksa jenis orang lalu mengeluarkan bunyi "wuuuuffff" atau "grrrrrrr" (hlm. 11). Materi lalu memberi beberapa potongan kode dan meminta mahasiswa menilai apakah termasuk overloading atau bukan (hlm. 12-14).

Kata kunci super dijelaskan sebagai rujukan ke objek induk. Fungsinya memanggil method superclass atau mengakses constructor induk, dan biasanya dipakai untuk menghilangkan kebingungan ketika induk dan anak memiliki method bernama sama (hlm. 15). Kuliah ditutup dengan tugas membuat kelas e-money dengan id, balance, dan edition, lalu menurunkan flazzy card yang memberi bonus 10% setiap top up dan opalo yang memberi bonus 20% pada periode promosi atau 5% di luar periode serta diskon 10% saat pembayaran (hlm. 16). Mahasiswa diminta menerapkan overloading dan overriding sekaligus menjelaskan bagian mana yang termasuk keduanya.

## Poin kunci

- Polymorphism berarti satu nama dengan banyak bentuk (hlm. 6).
- Overriding menulis ulang perilaku kelas induk pada kelas anak (hlm. 8-9).
- Overloading memakai nama method sama dengan signature berbeda (hlm. 10).
- Signature ditentukan oleh jumlah, tipe, dan urutan parameter (hlm. 10).
- super merujuk objek induk untuk memanggil method atau constructor induk (hlm. 15).
- Tugas e-money meminta penerapan overloading dan overriding sekaligus (hlm. 16).

## Istilah

- polymorphism: kemampuan satu nama atau method tampil dalam banyak bentuk.
- overriding: penulisan ulang method induk pada kelas turunan.
- overloading: beberapa method bernama sama dengan parameter berbeda dalam satu kelas.
- method signature: jumlah, tipe, dan urutan parameter sebuah method.
- super: kata kunci yang merujuk pada objek atau constructor kelas induk.
- inheritance: pewarisan yang menjadi prasyarat overriding.

## Sumber

- `2026-04-xx-polymorphism.local.pdf`, hlm. 2-7 (pengulangan hierarki dan pengertian polymorphism)
- `2026-04-xx-polymorphism.local.pdf`, hlm. 8-15 (overriding, overloading, super)
- `2026-04-xx-polymorphism.local.pdf`, hlm. 16 (tugas e-money)
