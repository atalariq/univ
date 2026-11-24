# Pertemuan 5: Encapsulation

Encapsulation dijelaskan melalui dua gagasan yang digabung (hlm. 3). Yang pertama bundling, yaitu menyatukan sekumpulan attribute dan method dalam satu definisi kelas. Yang kedua information hiding, yaitu membuat variabel anggota tidak dapat diakses langsung dari luar kelas. Analogi yang dipakai: data sebuah objek diibaratkan kuning telur, sedangkan method adalah putih telurnya.

Penerapannya sederhana: attribute dibuat private, lalu disediakan accessor method untuk mengaksesnya (hlm. 5). Sebelum itu materi mengingatkan perlunya memahami constructor, yaitu method khusus yang dipakai menginisialisasi objek saat kelas dibuat (hlm. 6). Access modifier dijelaskan satu per satu pada hlm. 7: public dapat diakses kelas mana pun, protected dapat diakses subclass atau kelas dalam package yang sama, tanpa modifier hanya dapat diakses kelas dalam package yang sama, dan private hanya dapat diakses dari dalam kelas itu sendiri.

Accessor method dibagi dua. Getter dipakai melihat nilai variabel tanpa mengubahnya, sedangkan setter dipakai mengubah nilai variabel (hlm. 8-9). Pola yang dianjurkan adalah menetapkan instance variable sebagai private lalu menambahkan getter dan setter publik untuk masing-masing. Materi menambahkan contoh kasus penghitungan total gaji dan meminta mahasiswa memikirkan contoh lain (hlm. 10).

Manfaat encapsulation disebutkan pada hlm. 11, yaitu meningkatkan keamanan karena objek pemilik data dapat memeriksa apakah perubahan yang diminta diizinkan, dan membatasi dampak perubahan pada satu kelas terhadap kelas lain yang terkait. Bagian akhir kuliah beralih ke UML class diagram. Sebuah kelas terdiri atas nama unik yang biasanya berawalan huruf kapital, daftar attribute, dan daftar method (hlm. 13). Pada diagram, tingkat akses ditandai dengan tanda plus untuk public dan tanda minus untuk private (hlm. 14).

## Poin kunci

- Encapsulation menggabungkan bundling dan information hiding (hlm. 3).
- Cara menerapkannya adalah membuat attribute private dan menyediakan accessor method (hlm. 5).
- Getter hanya membaca nilai, setter mengubah nilai (hlm. 8-9).
- Empat tingkat akses: public, protected, tanpa modifier, dan private (hlm. 7).
- Encapsulation menjaga keamanan data dan membatasi dampak perubahan (hlm. 11).
- Pada UML, plus berarti public dan minus berarti private (hlm. 14).

## Istilah

- encapsulation: pembungkusan attribute dan method sekaligus pembatasan aksesnya.
- bundling: penyatuan attribute dan method dalam satu kelas.
- information hiding: penyembunyian data agar tidak diakses langsung dari luar kelas.
- access modifier: penentu tingkat akses anggota kelas.
- getter: method untuk membaca nilai attribute.
- setter: method untuk mengubah nilai attribute.
- UML class diagram: diagram kelas berisi nama, attribute, dan method beserta visibilitasnya.

## Sumber

- `2026-03-xx-encapsulation.local.pdf`, hlm. 3-11 (konsep, access modifier, getter dan setter)
- `2026-03-xx-encapsulation.local.pdf`, hlm. 13-15 (UML class diagram)
