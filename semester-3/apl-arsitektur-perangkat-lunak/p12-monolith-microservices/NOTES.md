# Pertemuan 12: Monolith dan Microservices

Pertemuan ini menggabungkan dua deck: `w6b-microservices.slides.pdf` (61 hlm., microservices sebagai gaya arsitektur) dan `w11c-decompose-monolith.slides.pdf` (36 hlm., cara keluar dari monolith). Deck `w4b-service-based.pdf` jadi jembatan dari SOA, dan `w5b-event_driven_architecture.pdf` menjelaskan komunikasi asinkron yang membuat service tidak saling tunggu. Pertanyaan praktisnya: kapan pakai yang mana, dan siapa menanggung biayanya.

## Rentang pilihan

**Monolith.** Satu basis kode, satu artefak deploy, satu proses, satu database. Modul saling memanggil di memori, jadi tidak ada network hop dan tidak ada data yang tertinggal antar service. Ciri pembedanya: unit deploy sama dengan unit sistem. Deck `w11c` menyebut tiga keuntungan langsungnya, yaitu deployment sederhana, komunikasi antar modul sederhana, dan testing serta debugging sederhana (hlm. 3 sampai 5).

**Modular monolith.** Satu artefak deploy juga, tetapi batas modul dipaksakan mekanisme, bukan kesepakatan. Tiap modul punya interface publik dan menyembunyikan sisanya; modul lain tidak bisa memanggil kelas internalnya karena build gagal. Ciri pembedanya: batasnya punya penjaga otomatis yang tetap hidup setelah tim berganti orang.

**Service-based.** Sistem dipotong per domain bisnis, tiap domain jadi service yang di-deploy terpisah, dan UI memanggil semuanya lewat API layer. Cirinya: sudah terdistribusi tetapi service-nya tetap kasar (`coarse-grained`), biasanya enam sampai dua belas service, dan banyak yang masih berbagi satu database (deck `w4b`, hlm. 3). Titik tengah yang sering dilewati karena terlihat seperti microservices setengah jadi.

**Microservices.** Service kecil di sekitar bounded context, tiap service punya datanya sendiri, di-deploy sendiri, dan komunikasi lewat REST atau event. Cirinya: batas service adalah batas kepemilikan data. Begitu dua service masih menulis ke tabel yang sama, yang ada di depan kita bukan microservices.

## Kekuatan dan biaya microservices

Sisi kuatnya nyata. Deck `w6b` menyebut heterogenitas: tiap service boleh memakai teknologi implementasi berbeda (hlm. 39), dan skalabilitas per service sebagai alasan memakai event queue di sistem besar (hlm. 52). Deployment terpisah berarti satu tim bisa merilis tanpa menunggu tim lain. Otonomi tim ini biasanya alasan sebenarnya orang pindah, dan alasannya organisatoris, bukan teknis.

Biayanya juga nyata, dan tidak jatuh ke orang yang sama.

- **Distributed data.** Tiap service punya database sendiri, jadi konsistensi lintas service menjadi eventual. Transaksi yang dulu satu `BEGIN` sekarang rangkaian langkah yang bisa gagal di tengah. Yang menanggung: tim backend yang menulis dan merawat kompensasi, plus tim data yang harus mendamaikan angka antar service.
- **Latensi jaringan.** Panggilan yang dulu beberapa nanodetik jadi milidetik. Deck `w6b` menyebut latency berlipat sebagai salah satu masalah logika sinkron, bersama rantai kegagalan yang ikut berlipat (hlm. 22). Yang menanggung: pengguna, lewat halaman yang lebih lambat, dan tim on-call yang harus menebak service mana yang lambat.
- **Observability.** Satu request melewati banyak service, jadi satu stack trace tidak cukup. Perlu distributed tracing, korelasi log, dan dashboard per service. Yang menanggung: platform team, dan anggaran infrastruktur karena penyimpanan log serta tracing tidak gratis.
- **Biaya operasional.** Lebih banyak artefak deploy, pipeline, alert, dan versi library. Deck `w6b` membuka dengan pertanyaan menohok: kalau belum pernah mengirim satu service, bagaimana bisa mengirim selusin (hlm. 14). Yang menanggung: seluruh organisasi, lewat orang dan waktu yang habis untuk urusan yang tidak menambah fitur.
- **Duplikasi model.** Batas domain yang tegas membuat entitas sama muncul di beberapa domain dengan bentuk berbeda, dan datanya harus dipetakan (hlm. 36). Yang menanggung: developer yang menulis kode konversi, dan siapa pun yang nanti mencari kenapa angka pelanggan berbeda di dua halaman.

## Kapan monolith masih jawaban yang benar

Empat kondisi membuat monolith lebih murah.

Tim kecil. Kalau yang mengerjakan tiga sampai lima orang, biaya koordinasi microservices lebih besar dari manfaat otonomi yang bisa diambil. Deck `w4b` mencatat shared database mempermudah menjaga integritas dan konsistensi data (hlm. 3), dan pada tim kecil itu keuntungan besar.

Domain belum jelas. Batas service yang salah lebih mahal daripada tidak punya batas service, karena memindahkan service jauh lebih repot daripada memindahkan folder. Fowler menulis di `MicroservicePremium` bahwa ia tidak akan mempertimbangkan microservices kecuali sistemnya terlalu kompleks untuk dikelola sebagai monolith, dan sebagian besar sistem sebaiknya dibangun sebagai satu aplikasi monolith dengan modularitas yang dijaga. Simon Brown punya versi lebih tajam, yang dikutip Fowler: kalau tidak bisa membangun monolith yang terstruktur baik, apa dasarnya berpikir bisa membangun kumpulan microservices yang terstruktur baik.

Butuh kecepatan. Fase awal produk lebih sering berubah arah daripada berubah skala. Deck `w6b` menyebut kegagalan pola ini sebagai "getting caught up in the technology" (hlm. 13), dan itu persis yang terjadi kalau tim menghabiskan kuartal pertama membangun pipeline alih-alih fitur.

Batas modul belum stabil. Kalau kamu masih ragu sebuah konsep masuk domain mana, memaksanya jadi service sekarang berarti mengunci keputusan yang belum matang.

Kasus praktisi: Segment memindahkan lebih dari 140 service kembali menjadi satu service pada 2018. Biaya operasional naik linear tiap kali menambah destination, sampai tiga engineer penuh hanya untuk menjaga sistem hidup. Mereka juga jujur soal harganya: isolasi kegagalan sulit, cache in-memory kurang efektif, dan satu versi dependency bisa merusak banyak destination sekaligus (Alexandra Noonan, "Goodbye Microservices", 2018).

## Modular monolith

Modular monolith bukan monolith dengan folder rapi. Bedanya ada di penegakan: kalau sebuah modul masih bisa mengimpor kelas internal modul lain tanpa ada yang gagal, batasnya hanya dekorasi.

Tanda batas yang benar-benar ditegakkan:

- Ada daftar interface publik per modul, dan sisanya tidak terlihat dari luar.
- Build atau lint gagal kalau ada impor lintas modul yang melanggar, jadi pelanggaran ketahuan di CI.
- Data dimiliki per modul. Modul lain membaca lewat interface, tidak menyambung ke tabelnya.
- Modul bisa dites sendiri tanpa menyalakan seluruh aplikasi.

Fowler menyebut batas modul tegas di dalam monolith itu mungkin tetapi menuntut disiplin, dan microservices menaikkan peluang modularitas yang lebih baik tanpa menjaminnya. Itu penjelasan kenapa modular monolith masuk akal sebagai titik awal: kamu membayar disiplin, bukan biaya jaringan.

## Cara memecah monolith

Deck `w11c` memberi urutan konkret.

1. Identifikasi bounded context dulu (hlm. 24). Ini pekerjaan pemetaan domain, bukan memotong kode.
2. Ambil service paling sederhana lebih dulu, contohnya authentication, dan usahakan dependensi dari service baru ke monolith sekecil mungkin (hlm. 25 sampai 26).
3. Kurangi coupling antar bounded context, lalu decouple secara vertikal: satu service menangani satu bounded context utuh, dan datanya lepas dari monolith (hlm. 27 sampai 28).
4. Fokus ke pain point: bagian yang jadi bottleneck atau paling sering berubah (hlm. 29).
5. Tulis ulang, jangan salin. Logika yang rumit boleh dipakai ulang, infrastrukturnya didesain baru (hlm. 30).

Polanya strangler fig (hlm. 16 sampai 20): bikin API di depan UI, pasang proxy yang mencegat panggilan, arahkan sebagian panggilan ke service baru, lalu ganti monolith sedikit demi sedikit. Deck itu menyebut `shadow` dan `blue-green` deployment sebagai pendamping supaya peralihan bisa dibandingkan sebelum dipercaya.

Dua pola lain yang disebut deck: `atomic decomposition`, memindahkan satu fungsi aplikasi utuh ke service dan menghapus logikanya dari monolith (hlm. 31), dan `stepwise decomposition`, mengganti satu fungsi per satu waktu (hlm. 32). Memecah berdasarkan business capability atau subdomain berasal dari literatur umum microservices (Newman, Richards dan Ford), bukan dari deck ini; deck memakai istilah bounded context.

Deck memberi dua label untuk hasil antara. `Macroservice` adalah service terpisah yang masih mencakup lebih dari satu domain atau berbagi database dengan monolith (hlm. 33). `Nanoservice` bergantung pada service lain dan tidak bisa di-deploy sendiri karena konteksnya terlalu kecil (hlm. 34). Keduanya label jujur untuk keadaan di tengah migrasi.

## Tabel keputusan

| Sinyal yang kuamati | Pilihan yang masuk akal | Biaya yang harus diterima |
| --- | --- | --- |
| Tim di bawah 5 orang, satu produk, rilis mingguan | Monolith atau modular monolith | Satu build besar; merge conflict dan blast radius rilis tetap besar |
| Batas domain masih berubah tiap sprint | Modular monolith | Butuh disiplin dan tooling penegak batas; tidak ada isolasi data |
| Satu komponen jelas paling mahal secara komputasi | Pisahkan komponen itu saja, sisanya tetap monolith | Dua model deployment; sinkronisasi data komponen itu dengan sisanya |
| Lima sampai sepuluh tim, masing-masing punya backlog sendiri | Service-based atau microservices per domain | API layer, observability, dan koordinasi versi antar tim |
| Bagian sistem butuh stack dan siklus rilis berbeda | Service terpisah untuk bagian itu | Duplikasi model data, biaya integrasi, latensi jaringan |
| Database jadi bottleneck dan tidak bisa di-scale vertikal | Pisahkan data per service | Kehilangan transaksi lintas tabel; eventual consistency harus dirawat |
| Beban tidak rata dan mahal kalau seluruh aplikasi di-scale | Microservices atau setidaknya komponen terpisah | Auto-scaling per service, tuning resource yang rumit |
| Sudah punya platform, tracing, pipeline, dan on-call | Microservices layak dicoba | Biaya orang dan infrastruktur tetap ada, hanya tersebar |

## Jebakan umum

Distributed monolith. Service-nya banyak, tapi semuanya harus di-deploy bersamaan karena saling bergantung erat. Gejalanya: setiap rilis selalu melibatkan semua service. Hasilnya semua biaya distribusi tanpa satu pun manfaatnya.

Shared database. Deck `w4b` memakai shared database sebagai keputusan sadar untuk service-based, dan itu wajar karena service-nya kasar. Masalah muncul kalau pola yang sama dibawa ke microservices: tiap service menulis ke tabel yang sama, jadi perubahan skema menyentuh semua service dan testability turun (hlm. 4).

Rantai panggilan sinkron. Deck `w6b` mendaftar akibatnya: rantai kegagalan, kegagalan berlipat, latency berlipat, deployment susah, scaling susah, dan desain malas (hlm. 22). Ringkasnya (hlm. 34): rantai request tidak scale. Kalau satu request butuh enam service yang memanggil berurutan, availability totalnya hasil kali availability masing-masing. Deck `w5b` menyebut alternatifnya: event asinkron, pengirim tidak menunggu handler (hlm. 2).

Chatty service. Satu layar butuh dua puluh panggilan ke service yang sama. Fungsional, tapi latensinya menumpuk dan biayanya naik. Obatnya menggabungkan endpoint atau memindahkan sebagian data ke sisi pemanggil.

Entity service. Deck `w6b` menyebut ini anti-pattern (hlm. 20): service dibentuk mengikuti entitas database, bukan proses bisnis. Akibatnya satu operasi bisnis menyentuh banyak service, dan muncullah rantai panggilan sinkron.

Service terlalu kecil. `Nanoservice` (hlm. 34) tidak bisa di-deploy sendiri, jadi label microservices-nya hanya klaim. Ukuran yang benar biasanya mengikuti satu bounded context, bukan satu tabel.

## Sumber

Deck mata kuliah:

- `w6b-microservices.slides.pdf`, 61 hlm. Klaim: hlm. 13, 14, 20, 22, 24, 26 sampai 27, 34, 36, 39, 44, 50, 59, 60.
- `w11c-decompose-monolith.slides.pdf`, 36 hlm. Klaim: hlm. 3 sampai 5, 7 sampai 10, 12 sampai 13, 16 sampai 20, 24 sampai 30, 31 sampai 32, 33 sampai 34.
- `w4b-service-based.pdf`, 8 hlm. Klaim: hlm. 1, 3, 4, 6, 8.
- `w5b-event_driven_architecture.pdf`, 12 hlm. Klaim: hlm. 1 sampai 2, 4, 9 sampai 11.

Sumber lain:

- Martin Fowler, "MicroservicePremium" dan "MonolithFirst", martinfowler.com.
- Martin Fowler, "Microservice Trade-Offs", martinfowler.com.
- Alexandra Noonan, "Goodbye Microservices", Twilio Segment blog, 10 Juli 2018.
- Situs kuliah <https://csse6400.uqcloud.net/schedule>: week 6 microservices dan message queues, week 11 decomposing monoliths.

Yang tidak terbaca: hlm. 60 deck `w6b` hanya mengeluarkan daftar atribut (modularity, extensibility, reliability, interoperability, scalability, security, deployability, testability, simplicity); nilai pros dan cons-nya ada di gambar. Diagram hlm. 16 sampai 19, 41 sampai 43, 46 sampai 47, dan 53 sampai 55 juga tanpa teks, jadi keterangannya kukutip dari judul saja. Deck `w11c` terbaca penuh; ekstraksi kosong sebelumnya gagal karena metodenya, bukan PDF-nya.
