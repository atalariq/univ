# Pertemuan 7: Quiz pra UTS

Pertemuan ini dipakai untuk quiz pra UTS, bukan kuliah materi. Soal berbentuk satu studi kasus tentang program Makan Bergizi Gratis (MBG) di sebuah sekolah, yang harus mengelola Siswa dengan NIS, nama, dan kelas, MenuMakanan dengan nama menu, jumlah kalori, dan jenis makanan, serta DistribusiMakanan yang mencatat pembagian makanan kepada siswa. Setiap siswa menerima satu menu setiap hari, dan sistem harus dapat menampilkan informasi menu, mencatat distribusi, serta menghitung total kalori yang diterima siswa.

Soal terdiri atas tujuh bagian. Bagian pertama meminta identifikasi minimal tiga class beserta peran dan satu contoh object untuk masing-masing. Bagian kedua meminta minimal tiga attribute dan dua method per class, serta penjelasan hubungan antara attribute dan method. Bagian ketiga meminta penjelasan encapsulation, alasan attribute dibuat private, dan contoh getter serta setter. Bagian keempat meminta alasan MenuMakanan dijadikan abstract class, attribute dan method yang sebaiknya ada di dalamnya, serta contoh class turunan seperti MenuSehat dan MenuDiet. Bagian kelima meminta penjelasan interface, contoh interface Distribusi, method yang harus ada, dan cara DistribusiMakanan mengimplementasikannya. Bagian keenam meminta jenis relasi antara Siswa dan MenuMakanan serta antara Siswa dan DistribusiMakanan. Bagian ketujuh meminta analisis keuntungan OOP, akibat bila semua attribute public, dan class yang perlu ditambahkan bila ada fitur laporan gizi bulanan.

Jawaban yang dikerjakan memakai tiga class utama: Siswa, MenuMakanan, dan DistribusiMakanan. MenuMakanan dijadikan abstract class dengan method abstrak hitungTotalKalori, lalu diturunkan menjadi MenuSehat dan MenuDiet. Interface Distribusi dideklarasikan dan diimplementasikan oleh DistribusiMakanan. Pada bagian relasi, hubungan Siswa dengan MenuMakanan dinyatakan sebagai association, sedangkan Siswa dengan DistribusiMakanan dinyatakan sebagai aggregation karena catatan distribusi tetap bermakna meski objek siswa diganti.

Berkas jawaban tersedia dalam bentuk `main.typ` dan `PBOBB_P7_557554_Atalariq Barra Hadinugraha.pdf`.

## Poin kunci

- Quiz berisi satu studi kasus MBG dengan tujuh bagian pertanyaan.
- Tiga class utama: Siswa, MenuMakanan, dan DistribusiMakanan.
- MenuMakanan dijadikan abstract class dengan method abstrak hitungTotalKalori.
- Class turunan yang dicontohkan: MenuSehat dan MenuDiet.
- Interface Distribusi diimplementasikan oleh DistribusiMakanan.
- Relasi Siswa ke MenuMakanan disebut association, ke DistribusiMakanan disebut aggregation.

## Istilah

- encapsulation: pembungkusan data dan perilaku dengan pembatasan akses.
- getter dan setter: method pembaca dan pengubah nilai attribute.
- abstract class: kelas dasar yang tidak dapat diinstansiasi langsung.
- abstract method: method tanpa implementasi yang wajib ditulis subclass.
- interface: kontrak method yang harus dipenuhi kelas pemakainya.
- association: relasi umum antar class yang saling berhubungan.
- aggregation: relasi memiliki yang tidak mengikat keberadaan bagian.

## Sumber

- `quiz.md`
- `main.typ`
- `PBOBB_P7_557554_Atalariq Barra Hadinugraha.pdf`, hlm. 1-5
