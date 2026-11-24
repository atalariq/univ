# Pertemuan 3: Class dan object

Kuliah ini melanjutkan pertemuan pertama dengan mengulang istilah dasarnya: pada pemrograman prosedural data disebut variabel dan perilaku disebut fungsi, sedangkan dalam istilah OO data disebut attribute dan perilaku disebut method (hlm. 2). Setelah itu seluruh sesi berjalan sebagai latihan membuat kelas dari studi kasus.

Kasus pertama adalah anjing yang menggonggong dan menggerakkan ekor. Tidak semua anjing punya ekor, dan ras serta usia memengaruhi bunyi gonggongannya (hlm. 3). Mahasiswa diminta mengidentifikasi class, attribute, dan method, lalu menggambar class diagram. Dari kasus ini diturunkan sintaks kelas Java: deklarasi `public class <nama>`, penulisan attribute dengan tipe dan nilai awal, penulisan method dengan atau tanpa parameter, serta constructor yang namanya sama dengan kelas (hlm. 5-8). Implementasi lengkap kelas Dog memuat attribute breed, age, color, dan size, serta method waggingTail dan bark (hlm. 9). Objek dibuat dengan `new`, misalnya `Dog hachiko = new Dog()` atau `Dog shiro = new Dog(1, "maltese")`, lalu attribute diisi dan method dipanggil melalui objek tersebut (hlm. 10-11).

Tiga kasus lain dipakai sebagai latihan mandiri. Kasus kedua meminta program yang menangani vertex dua dimensi dan dapat memindahkannya ke atas, bawah, kiri, dan kanan (hlm. 12). Kasus ketiga meminta program rak buku perpustakaan yang punya nomor id, dapat menambah dan mengambil buku, serta melaporkan sisa buku di rak (hlm. 13). Kasus keempat berkisah tentang Anna yang mengoleksi tas bermerek dan mencatat spesifikasinya di kertas, lalu ingin sistem inventaris yang juga dapat menyarankan tas sesuai kebutuhan pelanggan (hlm. 14). Ketiga kasus itu diminta diselesaikan dengan urutan yang sama: identifikasi class, attribute, dan method, lalu gambar class diagram.

Dari pola latihannya terlihat penekanan kuliah ini: menerjemahkan deskripsi masalah berbahasa sehari-hari menjadi daftar kelas, lalu menurunkan attribute dan method dari kata benda dan kata kerja yang muncul pada deskripsi tersebut.

## Poin kunci

- Data disebut attribute dan perilaku disebut method dalam istilah OO (hlm. 2).
- Kelas dideklarasikan dengan `public class`, diikuti attribute dan method (hlm. 5-7).
- Constructor adalah method khusus yang namanya sama dengan kelas (hlm. 8).
- Objek dibuat dengan `new` dan dapat memakai constructor tanpa atau dengan parameter (hlm. 10).
- Attribute diakses dan method dipanggil lewat nama objek (hlm. 11).
- Empat studi kasus dipakai sebagai latihan: anjing, vertex 2D, rak buku, dan inventaris tas (hlm. 3-14).

## Istilah

- class: template untuk membuat objek.
- attribute: variabel yang dimiliki sebuah kelas.
- method: fungsi atau perilaku yang dimiliki sebuah kelas.
- constructor: method khusus untuk menginisialisasi objek saat dibuat.
- instantiation: pembuatan objek dari kelas dengan kata kunci new.
- class diagram: diagram yang menunjukkan kelas beserta attribute dan method-nya.

## Sumber

- `2026-02-xx-classobject.local.pdf`, hlm. 2-11 (pengulangan istilah, sintaks kelas, objek)
- `2026-02-xx-classobject.local.pdf`, hlm. 12-14 (studi kasus latihan)
