# Pertemuan 12: Monolith dan Microservices

## Yang sudah kupahami sebelum kelas

Monolith berarti seluruh aplikasi dibangun, di-deploy, dan di-scale sebagai satu unit. Microservices berarti aplikasi dipecah jadi banyak service kecil yang di-deploy sendiri-sendiri dan saling bicara lewat jaringan. Sejauh ini aku tahunya microservices itu "versi modern" dari monolith, jadi kalau ada kesempatan seharusnya pindah ke sana. Batas antar service katanya mengikuti bounded context dari Domain Driven Design, istilah yang sudah pernah kudengar waktu belajar modularitas tapi belum pernah kupakai untuk benar-benar memotong sistem.

Aku juga sudah pernah bikin satu aplikasi web kecil: satu repo, satu database, satu proses deploy. Menurutku itu monolith biasa. Yang belum kupahami, apakah folder `controllers/`, `services/`, `models/` sudah bisa disebut modular, atau modular itu harus punya arti lain.

## Dugaan yang perlu diuji di kelas

1. Microservices selalu lebih skalabel. Menurutku kalau satu bagian ramai, tinggal tambah instance service itu saja. Yang belum kepikiran: kalau semua service berbagi database, apakah penambahan instance benar-benar menambah kapasitas, atau cuma memindahkan antrean.
2. Monolith itu warisan zaman lama. Deck menyebut banyak sistem legacy yang jadi mimpi buruk memang monolith, jadi mungkin monolith yang penyebabnya. Tapi mungkin juga sumber masalahnya modularitas yang tidak pernah dijaga.
3. Tim kecil pun sebaiknya langsung microservices supaya tidak perlu migrasi nanti. Dugaan yang bisa salah: biaya operasionalnya mungkin lebih besar dari manfaat yang bisa diambil tim kecil.
4. Memecah monolith itu pekerjaan menyalin kode ke repo baru. Mungkin sebenarnya lebih mirip menulis ulang sebagian sistem, dengan proxy yang mengarahkan trafik bertahap.
5. Modular monolith cuma monolith yang foldernya rapi. Ini yang paling ingin kuuji, karena kalau benar begitu, tidak ada bedanya dengan proyek pertamaku.

## Pertanyaan untuk dibawa ke kelas

- Apa tanda paling awal bahwa sebuah monolith sudah harus dipecah, dan tanda apa yang kelihatan mirip padahal bukan alasan yang sah?
- Kalau timnya tiga orang dan domainnya belum stabil, apakah modular monolith realistis, atau batas modulnya akan bocor juga?
- Berapa besar biaya operasional yang wajar ditanggung sebelum microservices masuk akal? Apakah ada angka minimum jumlah engineer?
- Service-based architecture yang di deck w4b punya 6 sampai 12 service dengan shared database itu masih dipakai orang, atau cuma tahap antara menuju microservices?
- Waktu sebuah service memanggil service lain secara sinkron, siapa yang harus menanggung latency tambahannya: pengguna, atau tim yang memilih desain itu?
- Kalau shared database dilarang di microservices, bagaimana cara memindahkan data yang sekarang dipakai bersama tanpa menghentikan sistem yang sedang jalan?
- Apakah strangler fig masih masuk akal kalau monolith-nya tidak punya API layer sama sekali di depan UI?
