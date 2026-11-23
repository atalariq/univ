# Crystal Method

## Apa itu Crystal Method

Crystal adalah keluarga metodologi dari Alistair Cockburn. Tidak ada satu metode bernama Crystal. Ia menyebutnya human-powered, adaptive, ultra-light, dan stretch-to-fit.

Warna menunjukkan ukuran tim dan criticality. Sumbu criticality memakai Cockburn Scale, yaitu kerugian terburuk akibat defect: loss of comfort (C), loss of discretionary money (D), loss of essential money (E), dan loss of life (L). Cockburn (2024) menyebut tiga warna yang dipakai, Clear, Yellow, Orange, untuk tim sampai 50 orang. Varian yang lebih berat dinamai Red, Maroon, Sapphire, dan Diamond, tetapi batasnya perlu dicek.

Crystal Clear untuk tim kecil di satu tempat: seorang lead designer bersama 2 sampai 7 developer, di satu ruangan atau ruangan bersebelahan, dengan information radiator seperti whiteboard.

## Masalah yang diselesaikan

Satu resep untuk semua proyek gagal di dua arah. Tim lima orang tenggelam dalam dokumentasi yang tidak menambah apa pun. Tim empat puluh orang dengan proses selonggar itu kehilangan koordinasi. Crystal menjawab dengan aturan penyesuaian: makin besar tim dan makin mahal akibat kegagalan, makin berat prosesnya. Karena itu Crystal ditulis sebagai kumpulan properti: tim memilih caranya sendiri asal tujuh properti tercapai.

## Karakteristik kunci

Tujuh properti Crystal Clear:

- Frequent delivery: software yang berfungsi sampai ke pengguna secara berkala.
- Reflective improvement: tim meninjau cara kerjanya lewat reflection workshop.
- Osmotic communication: informasi mengalir karena orang duduk berdekatan.
- Personal safety: orang berani mengaku salah tanpa takut disalahkan.
- Focus: satu prioritas pada satu waktu.
- Easy access to expert users: pengguna yang paham domain mudah dihubungi.
- Technical environment: automated test, configuration management, integrasi rutin.

Peran di Crystal Clear: Sponsor, Expert User dan Business Expert, Lead Designer, Designer-Programmer, Coordinator, Tester, Writer. Di tim kecil beberapa peran dirangkap, misalnya Tester dan Writer oleh designer-programmer. Information radiator berupa whiteboard atau kartu di dinding jadi alat bantu utama.

## Kapan dipakai dan kapan tidak

Cocok dipakai ketika:

- tim kecil sampai sedang, 2 sampai 7 developer plus lead designer, di satu ruangan;
- criticality rendah sampai menengah;
- kebutuhan berubah dan tim sanggup menentukan praktik teknisnya;
- expert user mudah diakses.

Sebaiknya tidak dipakai ketika:

- tim tersebar lintas lokasi, osmotic communication kehilangan medianya;
- sistem life-critical, kecuali prosesnya dinaikkan beratnya secara sadar;
- organisasi menuntut proses seragam dan audit formal;
- jumlah orang jauh di atas 50;
- tim belum punya disiplin engineering, Crystal tidak memberi resep teknis.

## Perbandingan singkat

- Terhadap Scrum: Scrum memberi event dan peran tetap untuk semua tim. Crystal menyesuaikan berat proses dan tidak mewajibkan Sprint.
- Terhadap XP: XP menetapkan pair programming dan TDD. Crystal hanya menuntut automated test dan configuration management.
- Terhadap FDD: FDD memakai lima proses dan milestone berbasis fitur. Crystal memakai properti dan milestone berbasis waktu.

## Pertanyaan lanjutan untuk ahlinya

1. Bagaimana proses direntangkan saat criticality naik dari D ke E? Saya belum menemukan contoh konkret perubahannya.
2. Berapa batas orang untuk Yellow dan Orange? Angkanya berbeda di tiap sumber.
3. Apakah osmotic communication masih tercapai di tim hybrid, dan lewat saluran apa?
4. Siapa memegang Coordinator ketika Lead Designer menjadi bottleneck teknis?
5. Bagaimana Crystal menangani keputusan arsitektur yang harus disepakati sebelum coding, misalnya integrasi dengan sistem rumah sakit?
6. Bisakah tujuh properti diukur, atau hanya dirasakan tim?

## Catatan

Brief kelompok terbaca di `feedback-expert-brief.local/SAUFA AINI Crystal Method 2.pdf`. Yang saya pakai: daftar tujuh properti, kelebihan dan keterbatasan, contoh penerapan. Peran, Cockburn Scale, dan warna diambil dari sumber kanonik karena tidak ada di brief.

Belum terverifikasi: batas orang per warna selain Clear, daftar resmi varian berat, dan tahun awal proyek di IBM (satu sumber menyebut 1991).

## Referensi

- <https://alistaircockburn.com/Articles/Crystal-the-un-methodology>
- <https://en.wikipedia.org/wiki/Cockburn_Scale>
- <https://www.informit.com/store/crystal-clear-a-human-powered-methodology-for-small-9780132800075>
- <https://www.agilemasters.org/crystal>
