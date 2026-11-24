# Pertemuan 4: Abstract class dan interface

Abstract class dijelaskan sebagai kelas yang biasanya sangat umum sehingga sebenarnya tidak ada niat membuat objek darinya (hlm. 2). Kelas ini tetap menyimpan attribute dan method untuk keperluan pemakaian ulang. Contoh yang disebut adalah Mamalia, Shape, dan perangkat elektronik (hlm. 3). Karena tidak dapat diinstansiasi langsung, abstract class harus diturunkan ke subclass lebih dulu. Analoginya adalah cetak biru yang menjadi kerangka dasar bagi kelas turunannya (hlm. 4).

Syarat pentingnya, abstract class harus memuat setidaknya satu abstract method, yaitu method yang hanya berupa deklarasi tanpa implementasi (hlm. 5). Kelas yang memperluas abstract class disebut kelas konkret. Kasus mahasiswa dipakai untuk menjelaskan: seorang mahasiswa bisa berupa mahasiswa sarjana atau pascasarjana, sehingga Mahasiswa wajar dijadikan abstract class (hlm. 9-10). Abstract method juga tepat dipakai ketika semua subclass wajib melakukan suatu operasi tetapi superclass tidak dapat menyediakan implementasi bawaan (hlm. 11). Materi menutup bagian ini dengan pertanyaan tinjauan, antara lain apakah abstract class boleh berisi field dan apakah objeknya bisa dibuat langsung (hlm. 12-13).

Interface didefinisikan sebagai kontrak perilaku, mirip template kelas karena menentukan apa yang harus dilakukan tanpa menjelaskan caranya (hlm. 14). Interface berisi judul method publik tanpa implementasi, dan kelas yang mengimplementasikannya wajib menuliskan semua method tersebut (hlm. 19). Materi juga memperkenalkan interface sebagai callback untuk proses asinkron: pengontrol profil meminta data ke layanan pengguna, layanan melakukan panggilan API yang butuh waktu, lalu memberi kabar kembali lewat interface agar pengontrol dapat memproses hasilnya (hlm. 20-25).

Perbandingan keduanya diringkas pada hlm. 26. Abstract class memakai extends dan hanya dapat diwarisi satu kelas, sedangkan interface memakai implements dan dapat diimplementasikan banyak kelas sekaligus. Abstract class boleh memiliki method berimplementasi maupun tanpa implementasi, variabel instance, dan konstruktor. Interface pada awalnya hanya memuat deklarasi method, tetapi sejak Java 8 boleh memiliki default method dan static method.

## Poin kunci

- Abstract class tidak dapat diinstansiasi dan harus diturunkan lebih dulu (hlm. 4).
- Abstract class wajib memiliki minimal satu abstract method tanpa implementasi (hlm. 5).
- Kelas yang memperluas abstract class disebut kelas konkret (hlm. 5).
- Abstract method dipakai saat semua subclass harus melakukan operasi yang sama tanpa implementasi bawaan (hlm. 11).
- Interface mendefinisikan perilaku tanpa menyebut cara melakukannya (hlm. 14).
- Kelas yang implements interface wajib menuliskan semua method-nya (hlm. 19).
- Abstract class memakai extends dan tunggal, interface memakai implements dan jamak (hlm. 26).

## Istilah

- abstract class: kelas yang tidak dapat diinstansiasi dan menjadi dasar kelas turunan.
- abstract method: deklarasi method tanpa isi implementasi.
- concrete class: kelas yang dapat diinstansiasi karena semua method-nya terdefinisi.
- interface: kontrak berisi judul method yang wajib diimplementasikan kelas pemakainya.
- implements: kata kunci untuk menyatakan kelas memenuhi sebuah interface.
- callback: mekanisme memanggil kembali kode pemanggil setelah proses selesai.
- default method: method berimplementasi di dalam interface sejak Java 8.

## Sumber

- `2026-03-xx-abstract-class-interface.local.pdf`, hlm. 2-13 (abstract class)
- `2026-03-xx-abstract-class-interface.local.pdf`, hlm. 14-25 (interface dan callback)
- `2026-03-xx-abstract-class-interface.local.pdf`, hlm. 26-27 (perbandingan)
