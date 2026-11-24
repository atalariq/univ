# Pertemuan 11: Package

Kuliah ini dibuka dengan pertanyaan apakah sebuah file Java boleh memuat dua kelas berbeda dengan nama yang sama (hlm. 2). Jawabannya tidak. Compiler akan mempermasalahkan dan menunjukkan adanya benturan penamaan tersebut (hlm. 3). Benturan muncul ketika dua kelas berbeda maksudnya memakai nama identik, sehingga nama itu tidak lagi menunjuk satu kelas tertentu. Persoalan itulah yang melatarbelakangi diperkenalkannya package.

Package dijelaskan sebagai cara menggabungkan kelas atau antarmuka ke dalam paket sendiri, dan pendekatan ini membantu menghindari konflik penamaan (hlm. 4). Dengan pengelompokan seperti itu, dua kelas dari dua package berbeda diperbolehkan memakai nama yang sama tanpa saling bertabrakan. Materi juga menyatakan bahwa setiap kelas di Java sebenarnya berada di dalam sebuah package, bukan berdiri bebas tanpa wadah.

Penggunaannya mengikuti empat langkah (hlm. 5-7). Pertama, buat package lebih dulu, atau package tersebut dibuat otomatis ketika proyek baru dibuat. Kedua, buat kelas di dalam package itu. Ketiga, impor package yang relevan ketika kelas tersebut hendak dipakai, dengan dua bentuk penulisan: `import package.name.Class;` untuk satu kelas saja atau `import package.name.*;` untuk seluruh isi package. Keempat, berhati-hatilah karena mengimpor semua package sekaligus dapat menimbulkan ambiguitas. Jika dua package memuat kelas bernama sama, sebaiknya tulis nama kelas lengkap, misalnya `com.views.Profile` dan `com.controllers.Profile`, bukan sekadar Profile. Pada contoh itu kedua kelas memang bernama sama, sehingga hanya nama lengkap yang dapat membedakan keduanya. Penulisan nama lengkap membuat package ikut disebut, sehingga kelas yang dimaksud tidak mungkin tertukar.

Selain mencegah konflik penamaan, package memiliki tiga kegunaan lain (hlm. 8): mengategorikan kelas agar mudah dikelola, memberikan perlindungan akses, dan memberikan kemampuan pemakaian ulang kode.

## Poin kunci

- Dua kelas dengan nama sama tidak boleh berada dalam satu file Java (hlm. 3).
- Package menggabungkan kelas atau antarmuka ke dalam satu wadah (hlm. 4).
- Dua package berbeda boleh memuat kelas dengan nama sama (hlm. 4).
- Setiap kelas Java berada di dalam sebuah package (hlm. 5).
- Import dapat dilakukan untuk satu kelas atau seluruh isi package (hlm. 6).
- Mengimpor seluruh package dapat menimbulkan ambiguitas, sehingga nama lengkap dipakai (hlm. 7).
- Package juga mengategorikan kelas, melindungi akses, dan mendukung pemakaian ulang (hlm. 8).

## Istilah

- package: wadah untuk mengelompokkan kelas dan antarmuka terkait.
- naming conflict: benturan karena dua kelas memakai nama yang sama.
- import: perintah untuk memakai kelas dari package lain.
- fully qualified name: nama kelas lengkap beserta nama package-nya.
- access protection: perlindungan akses terhadap kelas dalam package.
- code reuse: pemakaian kembali kode yang sudah tersedia.

## Sumber

- `2026-05-xx-package.local.pdf`, hlm. 2-8
