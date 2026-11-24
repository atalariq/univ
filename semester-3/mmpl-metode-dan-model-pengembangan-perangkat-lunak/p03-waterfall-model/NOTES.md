# Pertemuan 3: Waterfall Model

Slide kuliah membuka dengan asal model: Royce pada 1970, disebut juga siklus kehidupan klasik, mengusulkan pengembangan perangkat lunak yang sistematis dan sekuensial (hlm. 3). Konsep kuncinya tiga: hasil tiap fase berupa satu atau lebih dokumen yang disetujui, fase berikutnya tidak boleh mulai sebelum fase sebelumnya selesai, dan tujuannya mengirim seluruh sistem sekaligus (hlm. 4).

Kelebihannya sederhana, terdokumentasi baik, urutan fase tegas, mudah dikelola karena memungkinkan departementalisasi, dan peserta mudah diganti (hlm. 5). Kekurangannya tidak fleksibel, sulit menerima perubahan kebutuhan, pelanggan hanya terlibat di awal, biaya dan usaha tinggi, kesalahan yang tidak dibersihkan di satu fase menjalar ke keseluruhan, serta kebutuhan tidak terpelihara sehingga banyak fitur tidak terimplementasi (hlm. 6). Bagian modified waterfall menampilkan variasi: model dengan umpan balik, Sashimi yang memungkinkan fase tumpang tindih, dan V-Model yang menekankan verifikasi serta validasi lebih awal dengan empat level pengujian (hlm. 7-13).

Dua paper memberi bukti empiris. Saravanos (2025) mencatat Royce memformalkan tujuh fase, dari system requirements sampai operations, dan menyarankan siklus dijalankan setidaknya dua kali; istilah waterfall sendiri baru dipopulerkan Bell dan Thayer pada 1976 (hlm. 138). Empat pandangan struktural dirangkum: linear, two-pass, umpan balik ke fase tepat sebelumnya, dan umpan balik ke fase mana pun yang lebih awal (hlm. 139-140). Studi Petersen dkk. (2009) di Ericsson memeriksa tiga subsistem berukuran total sekitar 2 juta baris kode dengan 33 responden (hlm. 391-392). Requirements menghabiskan 41% waktu, implementasi dan desain 17%, verifikasi 19%, dan rilis 23% (hlm. 398); sekitar 26% kebutuhan yang sudah di-review menjadi usang, dan 31% kesalahan yang ditemukan di system test seharusnya tertangkap di unit test (hlm. 398).

Slide lalu membandingkan temuan studi kasus dengan literatur. Masalah requirement yang paling menonjol adalah lamanya menentukan lingkup, kebutuhan yang berubah karena pasar TI bergerak cepat, jarak ke pelanggan, dan lingkup yang terlalu besar bagi sumber daya yang ada (hlm. 18). Pada sisi QA, pengujian menumpuk di akhir sehingga terburu-buru ketika pengembangan molor, cakupan kualitas kurang diperhatikan, dan sebagian hal diuji berulang akibat masalah koordinasi (hlm. 19). Saravanos menyimpulkan waterfall masih dipakai, dengan 28,1% pemakaian menurut Andrei dkk. (2019) dan 56% organisasi memakai pendekatan tradisional menurut survei PMI 2020, serta bertahan sebagai komponen pendekatan hybrid seperti Water-Scrum-Fall (hlm. 141-142).

## Poin kunci

- Royce 1970, tujuh fase, dan saran menjalankan siklus minimal dua kali (hlm. 138).
- Tiga konsep kunci: dokumen tiap fase, fase berurutan, pengiriman sekaligus (hlm. 4).
- Sashimi menumpuk fase, V-Model menggeser verifikasi ke awal (hlm. 10-13).
- Requirements memakan 41% waktu proyek Ericsson (hlm. 398).
- 26% kebutuhan menjadi usang dan 31% kesalahan lolos ke system test (hlm. 398).
- Waterfall bertahan di pendekatan hybrid, bukan sebagai metode tunggal (hlm. 141-142).

## Istilah

- Waterfall model: model pengembangan sekuensial dengan fase berurutan.
- Sashimi model: varian waterfall dengan fase yang boleh tumpang tindih.
- V-Model: varian yang memasangkan tiap fase konstruksi dengan level pengujian.
- Quality gate: pemeriksaan dokumen sebelum fase berikutnya boleh dimulai.
- Fault slip: kesalahan yang seharusnya tertangkap di pengujian lebih awal.
- Hybrid approach: campuran metode tradisional dan Agile dalam satu organisasi.

## Sumber

- `papers/A brief History of the waterfall model Past Present and Future.local.pdf`, hlm. 138-143.
- `papers/The Waterfall Model in Large-Scale development.local.pdf`, hlm. 386-400.
- `00-materials/3-waterfall-v_model.pdf`, hlm. 3-19.
- `report.typ`, laporan tugas pengganti kuliah minggu ke-3.
