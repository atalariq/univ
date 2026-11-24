# Pertemuan 6: Tugas pengganti

Pertemuan ini berisi tugas pengganti berupa studi kasus sistem manajemen kendaraan rental (hlm. 1). Perusahaan rental ingin mengelola Mobil, Motor, dan Bus. Semua kendaraan punya nomor kendaraan, merk, tahun produksi, dan status ketersediaan, tetapi masing-masing punya ciri tambahan: Mobil punya jumlah pintu, Motor punya tipe transmisi, dan Bus punya kapasitas penumpang. Ketiganya juga harus dapat menampilkan informasi, menghitung biaya sewa, dan mengubah status saat disewa atau dikembalikan.

Soal dibagi menjadi lima bagian (hlm. 1-2). Bagian A meminta identifikasi class utama beserta perannya, attribute dan method setiap class, perbedaan class dan object, serta tiga contoh object. Bagian B meminta penjelasan mengapa attribute kendaraan sebaiknya private, contoh akses lewat getter dan setter, serta manfaat encapsulation. Bagian C meminta penjelasan mengapa Kendaraan dijadikan abstract class, attribute dan method yang sebaiknya ada di dalamnya, pembedaan method berimplementasi dan abstract method, serta cara Mobil, Motor, dan Bus mewarisinya. Bagian D meminta fungsi interface Sewa, method yang harus ada di dalamnya, cara ketiga subclass mengimplementasikannya, dan akibat bila method wajib tidak ditulis. Bagian E meminta analisis hubungan abstract class, interface, dan class turunan, gambar UML, serta keuntungan keduanya dibanding class biasa.

Jawaban yang dikerjakan memilih lima tipe: Kendaraan sebagai abstract class dengan empat attribute umum, Mobil, Motor, dan Bus sebagai subclass dengan satu attribute khas masing-masing, serta Sewa sebagai interface berisi hitungBiaya dan tampilDetail. Abstract class Kendaraan memuat method berimplementasi seperti ubahStatus dan tampilInfo, serta method abstrak yang wajib ditulis ulang tiap subclass. Diagram kelas digambar dengan bahasa D2 lalu diekspor menjadi PNG dan SVG, dengan panah extends ke Kendaraan dan panah implements putus-putus ke Sewa.

Berkas jawaban tersedia dalam bentuk `main.typ` dan `PBOBB_P5_557554_Atalariq Barra Hadinugraha.pdf`. Diagramnya ada pada `uml.d2` beserta hasil ekspor `uml.png` dan `uml.svg`.

## Poin kunci

- Tugas berupa studi kasus rental kendaraan dengan lima bagian pertanyaan (hlm. 1-2).
- Kendaraan dijadikan abstract class dengan empat attribute umum.
- Mobil, Motor, dan Bus menjadi subclass dengan satu attribute khas.
- Interface Sewa memuat hitungBiaya dan tampilDetail.
- Class yang mengimplementasikan interface wajib menuliskan semua method-nya.
- UML digambar dengan D2 dan diekspor ke PNG serta SVG.

## Istilah

- abstract class: kelas yang tidak dapat diinstansiasi dan menjadi dasar subclass.
- abstract method: deklarasi method tanpa implementasi yang wajib ditulis subclass.
- interface: kontrak perilaku yang harus dipenuhi kelas pemakainya.
- extends: kata kunci pewarisan dari abstract class.
- implements: kata kunci pemenuhan interface.
- UML class diagram: diagram kelas beserta relasi pewarisan dan implementasi.

## Sumber

- `study-case.local.pdf`, hlm. 1-2
- `main.typ`
- `PBOBB_P5_557554_Atalariq Barra Hadinugraha.pdf`, hlm. 1-8
- `uml.d2`
