# Rencana Usability Testing dengan Maze

Dokumen ini menyiapkan pengujian prototipe Figma PAD untuk Sistem Katalog Souvenir Citra Productions. Isinya mission untuk fitur Prototype Test di Maze, pertanyaan post-test, dan tabel kosong untuk menampung hasil. Angka hasil tidak ditulis di sini karena pengujian belum dijalankan.

## Ruang lingkup

- Produk yang diuji: katalog souvenir publik Citra Productions, dari beranda sampai konsultasi lewat WhatsApp.
- Aktor yang diuji: pengunjung tanpa akun. Alur admin tidak diuji pada sesi ini karena responden dan tugasnya berbeda.
- Prototipe: <https://www.figma.com/design/xaHoBOzDl35WygmbbNBmeS/PAD>. Atur aksesnya ke Anyone with the link can view sebelum tautan Maze disebar.
- Perangkat: frame mobile di Figma, 390x844 bila frame dibuat dari awal. Wawancara pemilik usaha menyebut mayoritas client memakai ponsel.
- Peserta: minimal 5 responden, sesuai ketentuan tugas. Responden tidak perlu pernah memakai situs ini.
- Metrik: Direct Success, Indirect Success, Misclick Rate, dan Average Duration dari Maze, ditambah jawaban post-test.

## Persiapan sebelum publikasi

1. Samakan nama frame di Figma dengan nama layar pada tabel di bawah. Nama frame yang dipakai Maze adalah nama layar, bukan nama halaman Figma.
2. Pastikan setiap alur punya layar tujuan yang berbeda. Keadaan seperti jawaban FAQ terbuka atau konfirmasi WhatsApp perlu frame sendiri, bukan hanya perubahan di layar yang sama, karena Maze menandai goal berdasarkan perpindahan layar.
3. Periksa seluruh tautan antar frame dan hilangkan dead end. Mission yang berhenti di layar buntu akan tercatat sebagai gagal padahal masalahnya ada di prototipe.
4. Siapkan satu tautan Maze yang sama untuk semua responden agar kondisi pengujian setara.
5. Uji sendiri setiap mission satu kali sebelum tautan dibagikan.
6. Nama produk dan isi jawaban pada mission mengacu ke data demo, yaitu Plakat Akrilik Wisuda dan jawaban waktu pengerjaan. Ganti dengan produk dan jawaban yang benar-benar ada di prototipe.

| Nama layar di Maze | Isi yang diharapkan |
| --- | --- |
| Beranda | Hero, produk pilihan, navigasi ke katalog, portofolio, testimoni, FAQ, kontak |
| Katalog | Daftar produk dengan kategori dan kartu produk |
| Pencarian | Kolom kata kunci dan hasil pencarian |
| Detail Produk | Foto, judul, rentang harga, spesifikasi, packaging, deskripsi, tombol WhatsApp |
| FAQ Terbuka | Daftar pertanyaan dengan satu jawaban dalam keadaan terbuka |
| Konfirmasi WhatsApp | Layar perantara sebelum pengunjung diarahkan ke aplikasi WhatsApp |

## Mission

### Mission 1: Menemukan samir untuk acara wisuda

- Tujuan yang diukur: kemampuan menemukan produk lewat kategori dan membuka detailnya tanpa bantuan.
- Instruksi: "Kamu panitia wisuda dan butuh samir untuk peserta. Cari satu samir yang tersedia, lalu buka halamannya untuk melihat kisaran harga dan pilihan kemasannya."
- Start Screen: Beranda.
- Goal Screen: Detail Produk, salah satu produk kategori samir.
- Metrik yang diharapkan: Direct Success dan Indirect Success untuk keberhasilan, Misclick Rate untuk kebingungan memilih kategori, Average Duration untuk efisiensi. Klik ke portofolio, testimoni, atau FAQ sebelum mencapai detail dihitung sebagai misclick.

### Mission 2: Mencari plakat lewat kata kunci

- Tujuan yang diukur: kemampuan memakai pencarian ketika nama produk tidak diketahui persis.
- Instruksi: "Kamu perlu plakat untuk hadiah lomba dan pernah melihat Citra Productions membuat plakat akrilik. Temukan plakat akrilik itu dan lihat kisaran harganya."
- Start Screen: Beranda.
- Goal Screen: Detail Produk, produk Plakat Akrilik Wisuda.
- Metrik yang diharapkan: Direct Success dan Indirect Success, Misclick Rate pada pemakaian filter yang tidak perlu, Average Duration. Membuka kategori lain atau menggulir katalog tanpa memakai pencarian tetap dihitung sebagai misclick bila melewati jalur yang diharapkan.

### Mission 3: Menjawab pertanyaan waktu pengerjaan

- Tujuan yang diukur: kemampuan menemukan jawaban operasional tanpa menghubungi admin.
- Instruksi: "Kamu ingin memesan 30 medali untuk lomba minggu depan dan perlu tahu apakah pesanan sebesar itu masih bisa selesai tepat waktu. Temukan jawabannya di situs ini."
- Start Screen: Beranda.
- Goal Screen: FAQ Terbuka, jawaban untuk pertanyaan waktu pengerjaan.
- Metrik yang diharapkan: Direct Success dan Indirect Success, Misclick Rate pada bagian testimoni atau kontak, Average Duration. Mission ini juga menunjukkan apakah label FAQ cukup jelas bagi pengunjung baru.
- Catatan: isi jawaban harus memuat perkiraan waktu pengerjaan. Bila prototipe belum punya jawaban itu, lengkapi dulu sebelum mission dijalankan.

### Mission 4: Menghubungi Citra Productions

- Tujuan yang diukur: kemampuan menemukan jalur konsultasi setelah memilih produk.
- Instruksi: "Kamu sudah menemukan produk yang cocok dan ingin menanyakan ketersediaan warna lain sebelum memesan. Hubungi Citra Productions untuk menanyakannya."
- Start Screen: Detail Produk, produk Samir Wisuda Emerald.
- Goal Screen: Konfirmasi WhatsApp.
- Metrik yang diharapkan: Direct Success dan Indirect Success, Misclick Rate pada tombol bagikan atau navigasi lain, Average Duration. Mission ini mengukur apakah tombol WhatsApp cukup terlihat di layar detail.
- Catatan: bila prototipe langsung membuka aplikasi WhatsApp tanpa layar perantara, jangan jalankan mission ini di Maze. Ukur pemahaman jalur kontak lewat pertanyaan post-test nomor 3.

## Post-Test Questionnaire

Pertanyaan berikut muncul setelah seluruh mission selesai. Skala memakai 1 sampai 5 dengan label di kedua ujung.

| No | Pertanyaan | Jenis |
| --- | --- | --- |
| 1 | Seberapa mudah kamu menemukan produk yang kamu cari di situs ini? (1 sangat sulit, 5 sangat mudah) | Skala 1 sampai 5 |
| 2 | Seberapa jelas informasi harga, spesifikasi, dan kemasan pada halaman produk? (1 sangat tidak jelas, 5 sangat jelas) | Skala 1 sampai 5 |
| 3 | Seberapa mudah kamu mengetahui cara menghubungi Citra Productions? (1 sangat sulit, 5 sangat mudah) | Skala 1 sampai 5 |
| 4 | Bagian mana yang paling membingungkan saat kamu memakai situs ini? | Pilihan ganda: kategori, pencarian, detail produk, FAQ, tombol WhatsApp, tidak ada |
| 5 | Apa yang membuat kamu ragu untuk menghubungi atau memesan setelah melihat produk? | Terbuka |
| 6 | Informasi apa yang masih kurang di halaman produk? | Terbuka |
| 7 | Satu hal apa yang paling ingin kamu perbaiki dari tampilan situs ini? | Terbuka |

## Yang harus diisi setelah pengujian

Tabel di bawah diisi dari dashboard Maze dan rekap jawaban responden. Jangan mengisi sebelum pengujian dijalankan.

### Metrik per mission

| Mission | Jumlah responden | Direct Success (%) | Indirect Success (%) | Misclick Rate (%) | Average Duration |
| --- | --- | --- | --- | --- | --- |
| 1. Menemukan samir |  |  |  |  |  |
| 2. Mencari plakat |  |  |  |  |  |
| 3. Menjawab pertanyaan waktu pengerjaan |  |  |  |  |  |
| 4. Menghubungi Citra Productions |  |  |  |  |  |

### Rekap kuesioner skala

| No | Pertanyaan | Rata-rata | Sebaran jawaban 1 sampai 5 | Jumlah jawaban |
| --- | --- | --- | --- | --- |
| 1 | Kemudahan menemukan produk |  |  |  |
| 2 | Kejelasan harga, spesifikasi, dan kemasan |  |  |  |
| 3 | Kemudahan mengetahui cara menghubungi |  |  |  |

### Rekap pertanyaan terbuka

| No | Pertanyaan | Tema yang muncul | Jumlah responden yang menyebut | Kutipan representatif |
| --- | --- | --- | --- | --- |
| 4 | Bagian paling membingungkan |  |  |  |
| 5 | Alasan ragu menghubungi atau memesan |  |  |  |
| 6 | Informasi yang masih kurang |  |  |  |
| 7 | Usulan perbaikan |  |  |  |

### Temuan dan rekomendasi

| Temuan | Bukti dari metrik atau kuesioner | Rekomendasi perbaikan | Prioritas |
| --- | --- | --- | --- |
|  |  |  |  |
|  |  |  |  |
|  |  |  |  |

## Batasan

- Seluruh sel hasil di bagian "Yang harus diisi setelah pengujian" harus tetap kosong sampai Maze selesai dijalankan. Angka yang diisi lebih awal tidak bisa dipertanggungjawabkan dan membuat laporan tidak sah.
- Definisi Direct Success, Indirect Success, Misclick Rate, dan Average Duration mengikuti dashboard Maze saat ekspor dilakukan. Jangan menurunkan rumus sendiri tanpa mencatat versinya.
- Jumlah responden minimal 5. Dengan jumlah itu hasilnya deskriptif, bukan bukti statistik, sehingga laporan memakai kata "sebagian besar" atau "mayoritas" hanya bila angkanya memang mendukung.
- Isi dan nama frame Figma belum dapat diverifikasi dari repo ini. Penyesuaian nama layar wajib dilakukan sebelum tautan Maze dipublikasikan.
- Mission 3 dan 4 bergantung pada frame yang mungkin belum ada. Bila frame belum tersedia, jangan memaksakan mission; catat sebagai keterbatasan pengujian.
- Alur admin dan pengujian di desktop tidak termasuk cakupan rencana ini.
