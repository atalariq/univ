# Pertemuan 8 sampai 11: Group Assessment

## Cara sesi ini berjalan

Pertemuan 8, 9, dan 10 dipakai untuk tiga tahap group assessment. Tiap kelompok menganalisis arsitektur satu produk nyata, lalu menyusun deck yang menjelaskan gaya arsitektur, komponen, alur request, dan trade-off yang dipilih. Pertemuan 11 berisi presentasi tiap kelompok dan diskusi, termasuk menilai hasil kerja kelompok lain. Delapan deck di `../p13-evaluasi-hasil-kerja-kelompok-lain/slides.local/` adalah objek penilaian itu: deck yang dipresentasikan, dibaca ulang untuk menilai kekuatan argumen dan bukti yang dibawa.

## Delapan deck yang dinilai

| Berkas | Produk | Gaya arsitektur yang diklaim | Poin kuat yang dibawa deck | Pertanyaan yang layak diajukan |
|---|---|---|---|---|
| `01-kai.pdf` | Access by KAI | Layered empat tier, plus microservices (Golang dan Spring Boot), Kafka, Redis, Kubernetes | Pemisahan tier jelas, delapan entitas data, mitigasi double-booking dan waiting room | Kalau microservices, service mana yang benar-benar deploy terpisah dan mana yang masih satu basis kode? |
| `02-gitlab.pptx` | GitLab | Modular monolith Rails dengan komponen berperan tunggal, empat lapisan | Tanggung jawab tiap komponen, Gitaly dan Praefect untuk HA, model deployment dan sizing | Apakah batas modul lewat Packwerk sudah berjalan atau masih rencana? |
| `03-steam.pdf` | Steam | Client-server sebagai pola utama, sistem terdistribusi, berlapis dengan API | Jujur soal bagian internal yang tidak terdokumentasi, detail SteamPipe dan tiket autentikasi | Bukti apa yang akan menaikkan klaim dari client-server ke microservices? |
| `04-halodoc.pdf` | Halodoc | Microservices (150+ service Java dan Go di EKS), event-driven dengan broker SNS/Kafka, layered, pipe-filter | Tabel pola yang dipetakan ke bukti, migrasi monolith ke microservices, target SLA | Bagaimana konsistensi data dijaga saat choreography menggantikan orchestration? |
| `05-wikipedia.pdf` | Wikipedia dan MediaWiki | Hybrid distributed, modular monolith MediaWiki, empat lapisan infrastruktur | Jalur baca dan tulis dipisah, alasan cache hit di atas 90 persen, tumpukan teknologi konkret | Bagaimana invalidasi cache dijaga konsisten di Varnish, Memcached, dan MariaDB? |
| `06-wordpress.pdf` | WordPress | Monolith tiga tier dengan event-driven hooks (observer, implicit invocation), opsi headless dan strangler | Hooks dan skema EAV dijelaskan dalam, ada tangga evolusi monolith, cache, headless, strangler | Pada skala berapa query EAV benar-benar menjadi bottleneck, dan apa angkanya? |
| `07-moodle.pdf` | Moodle | Client-server, modular monolith berbasis plugin, empat lapisan | Aturan core tidak memanggil plugin, DML/DDL lintas DBMS, syarat versi PHP dan database | Bagaimana batas plugin ditegakkan kalau semuanya berjalan di satu proses PHP? |
| `08-traveloka.pdf` | Traveloka, modul pemesanan hotel | Tiga lapisan (presentation, business logic, data access) untuk rancangan sendiri; produk aslinya disebut microservices dan event-driven | Ruang lingkup dibatasi satu modul, pessimistic lock plus CHECK, cache dihapus setelah commit | Rancangan ini monolith satu aplikasi. Apa yang berubah kalau SearchService dipisah seperti saran deck? |

## Pola yang berulang di delapan deck

Semua delapan deck memakai layered atau pembagian tier sebagai cara pertama menjelaskan sistem. KAI memakai empat tier, GitLab empat lapisan, Steam menyebut "berlapis dan API", Halodoc menempatkan layered sebagai salah satu dari enam pola, Wikipedia empat lapisan, WordPress tiga tier, Moodle empat lapisan, Traveloka tiga lapisan. Layered jelas menjadi bahasa bersama mata kuliah ini, bahkan ketika deck akhirnya berbicara tentang pola lain.

Empat deck berhenti di level monolith atau modular monolith: WordPress, Moodle, GitLab, dan inti MediaWiki di Wikipedia. Steam tidak sampai ke microservices dan menyatakan buktinya belum cukup. Jadi separuh deck ini menempatkan monolith sebagai jawaban yang sah, bukan sekadar tahap yang harus dilewati.

Microservices diklaim eksplisit oleh dua deck, KAI dan Halodoc. Traveloka menyebutnya sebagai konteks produk asli, sementara rancangan yang dipresentasikan justru monolith tiga lapis. WordPress membahas microservices sebagai opsi yang tidak selalu perlu. Yang membedakan klaim kuat dari klaim lemah adalah bukti: Halodoc menyebut 150+ service Java dan Go di EKS, KAI menulis microservices tanpa menyebut jumlah service atau batas datanya.

Event-driven muncul di lima deck dengan kedalaman berbeda. Halodoc memperlakukannya sebagai gaya arsitektur utama, lengkap dengan event-bus, choreography, dan broker SNS/Kafka. WordPress dan Wikipedia memakai hooks sebagai mekanisme ekstensi, bukan arsitektur keseluruhan. KAI memakai Kafka untuk antrean tiket, Traveloka mempublikasikan `BookingCreated` untuk menghapus cache. Hanya satu deck yang membahas konsekuensi event-driven secara serius.

## Kriteria menilai presentasi arsitektur

- Klaim gaya arsitektur punya bukti, bukan hanya label di judul slide.
- Batas antara yang terdokumentasi resmi dan yang diinferensi disebut terang.
- Komponen dijelaskan lewat tanggung jawab, bukan hanya nama dan logo.
- Alur request ditelusuri ujung ke ujung, termasuk jalur gagal dan jalur tulis.
- Trade-off disebut berpasangan dengan harganya, bukan hanya sisi baiknya.
- Klaim skala disertai angka dan sumber, bukan perkiraan tanpa dasar.
- Rancangan sendiri dibedakan dari sistem nyata yang sedang dianalisis.
- Pertanyaan audiens dijawab dengan rujukan, bukan dialihkan ke slide lain.

## Sumber

Semua deck ada di `../p13-evaluasi-hasil-kerja-kelompok-lain/slides.local/`: `01-kai.pdf`, `02-gitlab.pptx`, `03-steam.pdf`, `04-halodoc.pdf`, `05-wikipedia.pdf`, `06-wordpress.pdf`, `07-moodle.pdf`, `08-traveloka.pdf`.
