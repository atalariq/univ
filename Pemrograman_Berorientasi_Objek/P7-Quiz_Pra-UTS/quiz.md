# Studi Kasus

Sebuah sekolah menjalankan program MBG (Makan Bergizi Gratis) untuk memastikan seluruh siswa mendapatkan asupan gizi yang cukup setiap hari.

Sistem yang akan dibuat harus mengelola:

Siswa → memiliki NIS, nama, dan kelas
MenuMakanan → memiliki nama menu, jumlah kalori, dan jenis makanan
DistribusiMakanan → mencatat pembagian makanan kepada siswa
Setiap siswa menerima satu menu makanan setiap hari. Sistem juga harus mampu:

Menampilkan informasi menu
Mencatat distribusi makanan
Menghitung total kalori yang diterima siswa

## Soal:

1. Identifikasi Class dan Object

Jelaskan:

a. Class apa saja yang diperlukan dalam sistem MBG tersebut (minimal 3 class).
b. Peran masing-masing class dalam sistem.
c. Berikan masing-masing 1 contoh object dari setiap class yang Anda buat.

2. Atribut dan Method

Untuk setiap class yang telah Anda tentukan:

a. Sebutkan minimal 3 atribut yang dimiliki.
b. Sebutkan minimal 2 method yang relevan.
c. Jelaskan hubungan antara atribut dan method dalam class tersebut.

3. Encapsulation

Jelaskan:

a. Apa yang dimaksud dengan encapsulation dalam OOP.
b. Mengapa atribut pada sistem MBG sebaiknya dibuat private.
c. Berikan contoh penggunaan getter dan setter pada salah satu class.

4. Abstract Class

Dalam sistem ini, Anda ingin membuat class MenuMakanan sebagai dasar untuk berbagai jenis menu.

Jelaskan:

a. Mengapa MenuMakanan cocok dijadikan abstract class.
b. Atribut dan method apa saja yang sebaiknya ada pada abstract class tersebut.
c. Berikan contoh class turunan (misalnya: MenuSehat, MenuDiet) beserta perannya.

5. Interface

Sistem ingin memastikan bahwa setiap proses distribusi memiliki fungsi tertentu.

Jelaskan:

a. Apa itu interface dalam OOP.
b. Buat contoh interface bernama Distribusi.
c. Method apa saja yang harus ada dalam interface tersebut.
d. Jelaskan bagaimana class DistribusiMakanan mengimplementasikan interface tersebut.

6. Relasi Antar Class

Jelaskan hubungan antara:

Class Siswa dan MenuMakanan
Class Siswa dan DistribusiMakanan
Sebutkan jenis relasinya (association, aggregation, atau lainnya) dan alasannya.

7. Analisis dan Pengembangan

Jawablah secara analitis:

a. Apa keuntungan menggunakan OOP dalam sistem MBG dibandingkan pendekatan prosedural?
b. Apa yang akan terjadi jika semua atribut dibuat public?
c. Jika sistem dikembangkan lebih lanjut (misalnya ada fitur laporan gizi bulanan), class apa yang perlu ditambahkan?

