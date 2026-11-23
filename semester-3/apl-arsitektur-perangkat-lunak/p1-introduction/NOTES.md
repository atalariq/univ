# Pertemuan 1: Introduction

## Ringkasan

Deck dosen merumuskan arsitektur sebagai perhatian pada struktur, bukan implementasi, dan sebagai keputusan untuk menghasilkan software bermutu dengan pilihan mahal yang diperkirakan lebih awal (slide 2). Arsitektur disebut langkah pertama proses desain. Definisi Kruchten dan kawan-kawan di slide 6 lebih luas: keputusan penting tentang organisasi sistem, elemen struktural beserta interface, komposisi menjadi subsistem, dan architectural style yang mengarahkannya.

Yang membedakan keputusan arsitektur dari desain detail adalah jangkauan akibatnya. Batas modul, sumber data, dan interface menyentuh pembagian tim, cara deploy, dan lama proyek; keputusan algoritme berhenti di satu fungsi.

Peran arsitek lebih banyak menimbang daripada menulis. Catatan CSSE6400 menyebut arsitek mengenali quality attribute yang penting lalu menyusun arsitektur dan principle yang memenuhinya (hlm. 3), termasuk memilih atribut mana yang menang saat atribut bertabrakan (hlm. 4).

## Konsep kunci

Level desain (slide 5). System architecture memuat business process. Software architecture memuat modularity, internal interface, data source berupa file dan database, serta external interface ke hardware. Detailed design mengurus algoritme dan struktur data.

Functional versus non-functional (slide 3). Functional menjawab apa yang bisa dilakukan sistem: melihat riwayat, membeli produk, memeriksa harga. Non-functional menjawab bagaimana sistem berperilaku: maintainability, scalability sampai melayani sejumlah klien, reliability yang online sepanjang waktu, efficiency berupa response time.

Quality attribute. CSSE6400 menyebut requirement non-fungsional sebagai sifat yang dibutuhkan proyek untuk berhasil, alias quality attribute (hlm. 3). Deck CSSE6400 menambahkan availability, extensibility, testability, modularity. Fitur bisa diuji lulus atau gagal, sedangkan quality attribute melekat pada seluruh sistem dan hanya tercapai lewat arsitektur. Karena itu Richards menyebut hukum pertama arsitektur: everything in software architecture is a trade-off (hlm. 4), dan Galster serta Angelov menamainya wicked architecture: tanpa masalah yang jelas, tanpa solusi benar atau salah, tanpa aturan kapan berhenti merancang (hlm. 4).

Stakeholder. Deck dosen tidak memakai kata ini; yang terdekat adalah pertanyaan slide 4 soal pentingnya requirement. CSSE6400 hlm. 1 menyebut tiga ukuran mutu: desain rapi bagi engineer, pengalaman memikat bagi pengguna, fitur tepat waktu dan sesuai anggaran bagi sponsor.

Pattern. Slide 11 menegaskan pattern belum sampai level kode, hanya generalisasi jawaban atas masalah umum. Contoh di slide 12: P2P, layered, client-server, master-slave, MVC, broker, event-bus. Slide 13 menambahkan atribut desain: reuse, modularity, information hiding, abstraction. Slide 14 meminta komponen bisa berubah, dipakai ulang, dan cocok dengan business process.

## Kekuatan dan batas keputusan arsitektur

Yang bisa diputuskan: batas modul, interface internal, sumber data, interface eksternal (slide 5), pattern (slide 12), atribut desain (slide 13). Semuanya mahal diubah karena mengikat banyak modul.

Yang jadi beban kalau terlalu dini. Slide 4 menyebut arsitektur yang terlalu canggih menghabiskan anggaran dan memperpanjang pengembangan tanpa jaminan requirement-nya penting; arsitektur yang terlalu sederhana juga gagal karena sistem tidak berperilaku sesuai kebutuhan. CSSE6400 menambahkan bahwa batasnya ditentukan constraint luar: time dan budget, technology, people, environment organisasi (hlm. 2). Contoh hlm. 2: aplikasi catatan mobile dengan penyimpanan lokal harus didesain ulang begitu diminta versi web dan desktop.

Pattern berhenti sebelum kode (slide 11), jadi memilih layered atau broker tidak menentukan framework atau skema tabel. Algoritme dan struktur data baru diputuskan di level tiga (slide 5).

## Kapan arsitektur perlu diubah

- Quality attribute baru naik jadi syarat utama. Slide 3 dan CSSE6400 sama-sama tidak memuat security (hlm. 3), padahal security kemudian jadi pertemuan tersendiri.
- Jangkauan produk atau constraint eksternal berubah: platform tambahan, data tersinkron, cloud yang diwajibkan, anggaran, orang yang tersedia (hlm. 2).
- Ukuran dan sebaran tim bertambah, sehingga dokumentasi dan batas modul harus lebih tegas (hlm. 3).
- Pattern masih dipakai padahal masalahnya sudah bergeser (slide 11).
- Trade-off lama tidak lagi berlaku; tambahan saya: latensi yang wajar di desktop bisa mahal di mobile.

## Kaitan dengan pertemuan lain

Pertemuan 2 membedah layered architecture dari daftar slide 12, jawaban atas big ball of mud, di [`../p2-layered-architecture/NOTES.md`](../p2-layered-architecture/NOTES.md). Pertemuan 12 memindahkannya ke skala deployment, dari monolith modular sampai microservices, di [`../p12-monolith-microservices/NOTES.md`](../p12-monolith-microservices/NOTES.md). Pertemuan 13 mengganti arah komunikasi menjadi event, sehingga siapa tahu apa ikut jadi keputusan arsitektur, di [`../p13-event-driven-architecture/NOTES.md`](../p13-event-driven-architecture/NOTES.md).

## Pertanyaan yang masih terbuka

- Definisi mana yang dipakai: rumusan Kruchten (slide 6), definisi sempit kuliah, atau definisi bercanda Johnson (`w1a` hlm. 1).
- Apa bedanya arsitektur dengan design dan engineering. Deck memisahkan tiga level desain (slide 5) tetapi tidak membagi kerja arsitek, designer, dan engineer.
- Slide 16 memuat sepuluh pertanyaan diskusi tanpa jawaban: bagaimana pola arsitektur terbentuk, kapan pemilihan arsitektur dilakukan, dan akibat arsitektur yang lebih sederhana dari kebutuhan (slide 4 hanya menjawab sebagian).
- Apa yang dibandingkan pada browser reference architecture di slide 7 sampai 10?

## Sumber

- `from-elok.local/arpl-p1-introduction.pdf`, deck dosen, 16 slide. Klaim: slide 2, 3, 4, 5, 6, 11, 12, 13, 14, 16.
- `csse.uq.local/w1a-architecture.pdf`, lecture notes, Brae Webb dan Richard Thomas, hlm. 1 sampai 5. Klaim: hlm. 1, 2, 3, 4.

Yang tidak terbaca: slide 7 sampai 10 hanya judul dan gambar, slide 13 dan 14 hanya butir tanpa penjelasan, slide 15 hanya penutup.
