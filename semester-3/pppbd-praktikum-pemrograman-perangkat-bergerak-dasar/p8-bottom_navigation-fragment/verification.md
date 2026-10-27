# Pemeriksaan laprak P8

Tanggal pemeriksaan: 27 Oktober 2026.

## Dokumen

- `report.typ` berhasil dikompilasi menggunakan Typst 0.15.1 tanpa warning.
- PDF berisi 30 halaman A4. Seluruh halaman dirender ke PNG dan diperiksa secara visual, termasuk caption, lanjutan blok kode, footer, dan halaman daftar pustaka.
- Pemeriksaan koordinat karakter PDF tidak menemukan teks di luar batas margin yang diperiksa.
- Baris panjang pada kutipan akhir dipecah pada batas ekspresi. Blok panjang dibagi dengan header `(lanjutan)` dan penomoran baris berlanjut.
- Teks hasil ekstraksi PDF memuat setiap baris nonkosong dari graph akhir, Home, Checkout, dan Address setelah normalisasi whitespace. Pemeriksaan ini juga mencakup bagian akhir listener dan `onDestroyView()`, sehingga tidak hanya memeriksa awal blok kode.
- Ada 11 bagian langkah praktikum berurutan, diikuti lima jawaban penugasan.
- Delapan gambar diambil dari modul dan diberi caption sumber. Dua gambar halaman 19 menunjukkan Address dengan pilihan Bengkulu dan Checkout yang menerima Bengkulu; keduanya bukan gambar Home.

## Snapshot dan portabilitas

- Hash SHA-256 seluruh 34 file snapshot cocok dengan `snippets/manifest.json` dan source commit `f2ce2a1d6ce6f265acd44db366b14c69d678d53f`.
- Pemeriksaan whitespace dokumen baru lolos. Snapshot mempertahankan whitespace asal: empat vector drawable memiliki spasi pada baris kosong, dan version catalog memiliki baris kosong di akhir. Bagian tersebut tidak dinormalisasi agar hash snapshot tetap sama dengan source.
- Semua XML snapshot dapat diparse. ID tiga menu cocok dengan destination graph, Home merupakan start destination, dan setiap action menunjuk destination yang terdaftar.
- Salinan template lokal sama persis dengan template `lab-report` 3.0.0 dalam repositori Kuliah.
- Laporan berhasil dikompilasi lagi dari salinan terpisah di `/tmp` tanpa `code.local`, `module.local.pdf`, package Typst pribadi, atau PDF hasil sebelumnya. Teks pada seluruh halaman hasilnya sama dengan PDF utama.

## Aplikasi

Source MyShop tetap sama dengan commit acuan; perubahan dalam repository aplikasi hanya README. Perintah berikut dicoba dengan JDK 25, SDK yang tersedia, serta cache Gradle terpisah:

```sh
./gradlew :app:assembleDebug --no-daemon
```

Gradle Wrapper berhenti ketika mengunduh distribusi Gradle 9.8.0 karena `SocketTimeoutException` pada batas waktu 10 detik. Unduhan terpisah dengan batas waktu 240 detik juga terhenti sebelum selesai. Retry lanjutan dihentikan; source dan konfigurasi Gradle tidak diubah.

Artinya, kompilasi APK belum terverifikasi. Tidak dilakukan pengujian runtime di emulator atau perangkat. Gambar modul tidak digunakan sebagai bukti bahwa pemeriksaan runtime tersebut telah dilakukan.

## Integritas PDF yang diperiksa

SHA-256 PDF:

```text
20ec88b186df56885a1df01fe98a92e01171f4765ad4d2bd8a1aac1ed48205de
```

Hash ini merujuk PDF lokal yang diperiksa, bukan jaminan hasil kompilasi berikutnya identik secara biner karena metadata waktu kompilasi dapat berbeda. PDF tidak masuk Git sesuai aturan `**/report.pdf`; seluruh bahan untuk membuatnya kembali masuk Git.
