# Pertemuan 8: Inheritance

Inheritance didefinisikan sebagai mekanisme untuk merancang dua entitas atau lebih yang memiliki banyak ciri sama, sekaligus sebagai kemampuan sebuah kelas mewarisi attribute dan method kelas lain (hlm. 3). Masalah yang mendorongnya diperlihatkan lewat dua contoh. Anjing punya warna mata, warna bulu, ras, frekuensi gonggongan, dan kemampuan menggonggong, sedangkan kucing punya warna mata, warna bulu, ras, frekuensi mengeong, dan kemampuan mengeong (hlm. 4). Jika ditulis terpisah, attribute yang sama harus diulang di kedua kelas.

Contoh kedua membandingkan Mobil dan Motor (hlm. 5-7). Keduanya memiliki attribute model, tahun, warna, dan kecepatan, serta method onStart, onBrake, onStop, honk, turnLeft, turnRight, moveForward, dan moveBackward. Perbedaannya, Mobil menambahkan startWiper dan stopWiper, sedangkan Motor menambahkan putDownKickstand dan putUpKickstand. Daftar method yang hampir identik itu menunjukkan duplikasi yang tidak perlu.

Solusinya adalah kelas induk. Superclass atau parent class memuat seluruh attribute dan perilaku yang sama bagi kelas yang mewarisinya (hlm. 10), sedangkan subclass atau child class adalah perluasan superclass yang mewarisi attribute dan perilaku umum tersebut (hlm. 11). Ketika objek Dog atau Cat dibuat, objek itu memuat seluruh isi kelasnya sendiri ditambah seluruh isi kelas induknya (hlm. 8). Implementasinya memakai kata kunci extends, misalnya `class Dog extends Mammal` dan `class Cat extends Mammal` (hlm. 12).

Materi menutup dengan dua latihan. Latihan pertama meminta perancangan kelas untuk kamar sewa yang terdiri atas kamar reguler dan kamar spesial, dengan kamar spesial menyediakan toilet di dalam kamar dan parkir mobil, sedangkan kamar reguler hanya parkir motor (hlm. 13). Latihan kedua meminta hierarki serta attribute yang sesuai untuk kelas Person, Employee, Manager, Secretary, dan Customer (hlm. 14).

## Poin kunci

- Inheritance memungkinkan kelas mewarisi attribute dan method kelas lain (hlm. 3).
- Tanpa inheritance, attribute dan method yang sama harus ditulis ulang di setiap kelas (hlm. 4-7).
- Superclass memuat ciri yang sama bagi semua kelas turunannya (hlm. 10).
- Subclass adalah perluasan superclass yang mewarisi ciri umum tersebut (hlm. 11).
- Objek subclass memuat isi kelasnya sendiri dan seluruh isi kelas induknya (hlm. 8).
- Pewarisan ditulis dengan kata kunci extends (hlm. 12).

## Istilah

- inheritance: pewarisan attribute dan method dari kelas induk ke kelas turunan.
- superclass atau parent class: kelas induk yang memuat ciri umum.
- subclass atau child class: kelas turunan yang mewarisi ciri induknya.
- extends: kata kunci Java untuk menyatakan pewarisan.
- hierarchy: susunan kelas dari yang paling umum ke yang paling khusus.
- code reuse: pemakaian kembali kode yang sudah ada tanpa menulis ulang.

## Sumber

- `2026-04-xx-inheritance.local.pdf`, hlm. 3-9 (motivasi dan contoh duplikasi)
- `2026-04-xx-inheritance.local.pdf`, hlm. 10-12 (superclass, subclass, implementasi)
- `2026-04-xx-inheritance.local.pdf`, hlm. 13-14 (latihan kasus)
