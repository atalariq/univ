# Arsitektur Perangkat Lunak: Peta dan Keputusan Cepat

Halaman ini untuk dipindai, bukan dibaca berurutan. Isinya tiga hal: bahan mana yang membahas pertemuan apa, ciri pembeda tiap gaya arsitektur, dan sinyal yang menentukan pilihan desain. Penjelasan panjangnya ada di catatan per pertemuan atau di deck sumber.

## Bahan per pertemuan

| Pertemuan | Topik | Berkas catatan | Deck sumber |
| --- | --- | --- | --- |
| 1 | Introduction | [p1-introduction/NOTES.md](p1-introduction/NOTES.md) (masih kerangka lama) | `from-elok.local/arpl-p1-introduction.pdf`, `w1a-architecture.pdf` |
| 2 | Layered Architecture | [p2-layered-architecture/NOTES.md](p2-layered-architecture/NOTES.md) | `arpl-p2-layered.pdf`, `w1b-layered.pdf` |
| 3 | Introduction to Patterns | [p3-architectural-patterns/NOTES.md](p3-architectural-patterns/NOTES.md) | `arpl-p3-architectural-patterns.pdf` |
| 4 | Security | [p4-security/NOTES.md](p4-security/NOTES.md) | `arpl-p4-security.pdf`, `w2a-security.pdf` |
| 5 | Container | [p5-containers/NOTES.md](p5-containers/NOTES.md) | `arpl-p5-containers.pdf`, `w3a-containers.pdf` |
| 6 | Infrastructure as Code | [p6-infrastructure-as-code/NOTES.md](p6-infrastructure-as-code/NOTES.md) | `arpl-p6-iac.pdf`, `w4a-iac.pdf` |
| 7 | Midterm test | [p7-midterm/NOTES.md](p7-midterm/NOTES.md) | `uts.local/` |
| 8 sampai 10 | Group assessment I sampai III | [p8-p11-group-assessment/NOTES.md](p8-p11-group-assessment/NOTES.md) | `p13-evaluasi-hasil-kerja-kelompok-lain/slides.local/` |
| 11 | Group assessment presentation | [p8-p11-group-assessment/NOTES.md](p8-p11-group-assessment/NOTES.md) | sama dengan di atas |
| 12 | Monolith dan Microservices | [p12-monolith-microservices/NOTES.md](p12-monolith-microservices/NOTES.md) | `w4b-service-based.pdf`, `w6b-microservices.slides.pdf`, `w11c-decompose-monolith.slides.pdf` |
| 13 | Event-Driven Architecture | [p13-event-driven-architecture/NOTES.md](p13-event-driven-architecture/NOTES.md) | `w5b-event_driven_architecture.pdf` |

Deck yang belum jelas masuk pertemuan mana tetapi relevan: `w2b-architecture_views.pdf` (4+1 views), `w2c-adr.pdf`, `w3b-microkernel.pdf`, `w7b-serverless.slides.pdf`, `w8b-monitoring-logging.slides.pdf`, `w11b-deployment.slides.pdf`, `w12-technical-documentation.pdf`.

## Gaya arsitektur sekilas

| Gaya | Ciri pembeda | Kekuatan | Biaya utama |
| --- | --- | --- | --- |
| Layered | Lapisan bertingkat, tiap lapisan bicara ke lapisan di bawahnya | Mudah dipahami, batas tanggung jawab jelas | Perubahan menembus banyak lapisan, sering jadi monolith lapisan |
| Pipeline | Data mengalir melewati filter berurutan | Tiap langkah bisa diganti sendiri | Cocok untuk alur tetap, canggung untuk interaksi bercabang |
| Microkernel | Inti kecil plus plugin | Variasi fitur tanpa mengubah inti | Kontrak plugin harus stabil sejak awal |
| Service-based | Beberapa service kasar, database bersama masih boleh | Lebih sederhana dari microservices, otonomi cukup | Batas domain yang longgar mudah goyah |
| Monolith | Satu unit deploy, satu basis kode | Kecepatan awal, debugging dan transaksi sederhana | Blast radius rilis besar, scaling hanya menyeluruh |
| Modular monolith | Satu unit deploy, batas modul ditegakkan di dalam kode | Refactor murah, batas tetap terjaga | Butuh disiplin dan tooling penegak batas |
| Microservices | Service kecil, deploy sendiri, data sendiri | Scaling dan rilis per bagian | Data terdistribusi, latensi jaringan, biaya observability |
| Event-driven, broker | Event disiarkan, handler bereaksi sendiri | Penambahan consumer tanpa mengubah pengirim | Alur sulit dibaca, konsistensi eventual |
| Event-driven, mediator | Mediator mengatur urutan langkah | Alur bercabang dan kompensasi terbaca | Mediator jadi titik kopling dan titik gagal |
| Serverless | Fungsi dikelola platform, bayar per pemakaian | Tanpa server yang dirawat, scaling otomatis | Cold start, batas waktu eksekusi, vendor lock-in |

## Keputusan cepat

| Sinyal yang kamu amati | Pilihan yang masuk akal | Yang harus kamu terima |
| --- | --- | --- |
| Tim di bawah 5 orang, satu produk, rilis mingguan | Monolith atau modular monolith | Satu build besar, blast radius rilis tetap besar |
| Batas domain masih berubah tiap sprint | Modular monolith | Butuh disiplin penegak batas, tanpa isolasi data |
| Satu komponen jelas paling mahal secara komputasi | Pisahkan komponen itu saja | Dua model deployment, sinkronisasi data |
| Lima sampai sepuluh tim dengan backlog masing-masing | Service-based atau microservices per domain | API layer, observability, koordinasi versi |
| Database jadi bottleneck dan tidak bisa di-scale vertikal | Pisahkan data per service | Kehilangan transaksi lintas tabel, eventual consistency |
| Banyak reaksi independen atas satu kejadian | EDA broker topology | Alur tidak terbaca dari satu tempat, debugging sulit |
| Proses bercabang dengan kompensasi dan audit langkah | EDA mediator topology atau orchestration | Mediator jadi kopling dan titik gagal |
| Beban tidak rata dan mahal kalau seluruh aplikasi di-scale | Microservices atau komponen terpisah | Auto-scaling per service, tuning resource rumit |
| Sudah ada platform, tracing, pipeline, on-call | Microservices layak dicoba | Biaya orang dan infrastruktur tetap ada, hanya tersebar |

## Empat pertanyaan sebelum memilih

1. Apa yang sebenarnya mahal sekarang: waktu rilis, biaya komputasi, atau biaya koordinasi antar tim?
2. Apakah batas domain sudah stabil, atau masih berubah tiap sprint?
3. Siapa yang akan menanggung biaya operasional pilihan ini, dan apakah orangnya ada?
4. Kalau pilihan ini salah, seberapa mahal jalan pulangnya?

## Jebakan yang berulang

Distributed monolith (service banyak tetapi harus rilis bersamaan), shared database di bawah microservices, rantai panggilan sinkron yang membuat availability berlipat turun, nanoservice yang tidak bisa di-deploy sendiri, dan event tanpa idempotensi. Rinciannya ada di [p12-monolith-microservices/NOTES.md](p12-monolith-microservices/NOTES.md) dan [p13-event-driven-architecture/NOTES.md](p13-event-driven-architecture/NOTES.md).
