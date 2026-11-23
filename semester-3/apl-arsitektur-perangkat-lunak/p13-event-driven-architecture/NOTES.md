# Pertemuan 13: Event-Driven Architecture

Catatan ini disusun dari deck `csse.uq.local/w5b-event_driven_architecture.pdf` (10 halaman, disebut "deck"). Nomor halaman dicantumkan pada tiap klaim, dan hal di luar deck ditandai sebagai tambahan.

## Mengapa EDA muncul

Deck membuka dengan definisi tegas: event-driven adalah asynchronous architectural style yang bereaksi terhadap event (hlm. 1). Pembandingnya adalah procedural flow of control, pola di mana pesan dikirim sebagai request dan pengirim menunggu balasan. Deck menarik paralel ke event handling di library GUI, tempat tombol ditekan lalu beberapa callback berjalan tanpa saling tahu.

Mekanismenya: event dikirim untuk ditangani, pengirim lanjut bekerja, dan kalau perlu handler mengirim pesan asinkron balik untuk melaporkan hasil. Tiap handler bisa hidup di execution environment sendiri sehingga diskalakan sesuai bebannya, dan boleh menerbitkan event sendiri untuk menandai apa yang sudah dikerjakan. Event itulah yang merangkai langkah sebuah business process.

Figure 1 (hlm. 1) menggambarkannya: client mengirim initiating event ke broker atau mediator, handler memproses dan menerbitkan processing event untuk langkah berikutnya, begitu seterusnya sampai proses selesai. Contohnya sistem lelang (hlm. 1 sampai 2): bid handler membandingkan bid dengan high bid lalu menerbitkan high bid event, dan dari satu event itu tiga handler bereaksi, yaitu page update, bid notification, dan rebid notification.

Dibanding rantai request-response, bedanya ada di tiga sumbu. Waktu: kedua pihak tidak harus hidup bersamaan. Alamat: pengirim tidak perlu tahu penerimanya. Sinkronisasi: pengirim tidak memblokir thread selama proses berjalan. Kerangka tiga sumbu ini tambahan saya.

## Event versus message

Deck memakai kata event hampir sepanjang dokumen. Kata message muncul hanya di tiga tempat: pesan yang dikirim sebagai request (hlm. 1), pesan asinkron balik ke pemrakarsa (hlm. 1), dan completion message dari handler ke mediator (hlm. 7). Deck tidak membedakan keduanya secara formal, jadi pembedaan berikut tambahan.

Event adalah pernyataan fakta yang sudah terjadi, ditulis dalam bentuk lampau, tanpa alamat tujuan. Ia bisa punya nol consumer (ProcessingEvent2 yang tidak ditangani siapa pun, hlm. 3 sampai 4), satu, atau banyak. Message adalah amplop yang dialamatkan ke penerima tertentu, isinya perintah atau data, biasanya berpasangan satu-satu, dan hilang dari antrean setelah diambil.

Ujinya: ubah nama menjadi kalimat lampau. `PlaceBid` adalah command, `BidPlaced` adalah event. Deck mendukung ini di hlm. 9. Pada broker topology yang beredar adalah `bid placed` dan `new high bid`, semuanya fakta, dan sebagian boleh diabaikan. Pada mediator topology mediator mengirim `place bid`, `notify bidders`, `pay for item`, yang berperilaku seperti command dan harus dieksekusi.

Satu jebakan: unit transport tetap disebut message meski isinya event, misalnya record Kafka atau message SQS.

## Anatomi

Broker topology punya lima elemen (hlm. 2 sampai 3): initiating event yang memulai alur, event broker yang punya event channel, event channel yang menampung event menunggu diproses, event handler yang menerima dan memproses, dan processing event yang dikirim handler setelah selesai.

Producer adalah pihak yang menerbitkan, bisa client di awal alur atau handler yang baru selesai bekerja (hlm. 2 sampai 3), consumer adalah event handler, dan broker adalah wadah channel beserta logika penyalurannya.

Deck memakai istilah channel untuk hal yang di Kafka disebut topic. Ada satu channel per jenis event, dan handler mendaftar hanya ke jenis yang bisa ia proses, sehingga tidak menerima broadcast yang tidak relevan (hlm. 3). Konsekuensinya sumber event harus mengirim ke channel yang benar, dan broker bisa memasang façade untuk mengarahkannya (hlm. 3). Topic sendiri nama logis, sedangkan partition adalah unit tempat urutan benar-benar dijamin (tambahan).

## Topologi

Broker topology adalah bentuk paling sederhana, dioptimalkan untuk performance, responsiveness, scalability, extensibility, fault tolerance, dan low coupling (hlm. 2). Alurnya sekuensial dan digerakkan handler, tidak ada pihak yang tahu keseluruhan proses. Karena itu broker disebut dumb pipe (hlm. 9): tidak menyimpan state proses dan tidak bisa error handling di tengah proses.

Extensibility-nya konkret: beberapa handler boleh mendengarkan satu jenis event, jadi fitur baru cukup ditambah sebagai handler baru (hlm. 4). Deck menunjukkan handler C yang mengirim ProcessingEvent2 padahal belum ada yang menanganinya, disengaja supaya nanti bisa disambung tanpa mengubah handler C; harganya lalu lintas event yang belum terpakai (hlm. 4).

Untuk skala, tiap handler adalah container terpisah dengan load balancer dan auto-scaling, dan broker-nya bisa difederasi sehingga tetap tampak satu titik akses (hlm. 4). Implementasi yang disebut deck: ActiveMQ, RabbitMQ, AWS SQS, Amazon MQ, Google Cloud Pub/Sub.

Channel punya dua gaya pengelolaan. Queue menambah event di ekor dan menghapusnya setelah diambil atau setelah selesai diproses; pilihan kedua butuh timeout agar event ditawarkan lagi kalau handler gagal, dan queue di memori kehilangan event saat broker mati (hlm. 5). Stream mengubah channel menjadi log permanen, dan karena permanen riwayat bisa diputar ulang atau diaudit (hlm. 5). Deck merangkum: queue cocok untuk langkah yang sudah diketahui, stream cocok untuk banyak handler yang boleh mengabaikan sebagian event, analitik perilaku, dan volume besar seperti monitoring IoT (hlm. 5 sampai 6).

Mediator topology menambah event queue dan event mediator (hlm. 7). Client mengirim initiating event ke event queue, mediator mengambilnya, lalu mediator sendiri yang mengirim processing event ke channel. Handler mengirim completion message, dan mediator memutuskan langkah berikutnya, sehingga conditional dan iterative logic bisa masuk (hlm. 7). Biasanya ada beberapa mediator per bagian domain, misalnya Customer, Browsing, Order, dan Inventory Events di Sahara, sehingga tiap mediator diskalakan sendiri dan kegagalan satu mediator tidak mematikan yang lain (hlm. 7). Implementasinya kode dengan Apache Camel atau Spring Integration, DSL seperti BPEL, atau BPM engine seperti jBPM (hlm. 8).

Pilihan mengikuti bentuk prosesnya: reaksi banyak tapi independen dan beban tinggi cocok untuk broker, sedangkan proses bercabang, butuh state, atau butuh kompensasi cocok untuk mediator, dengan catatan mediator butuh sedikit kopling ke handler dan pertanyaannya apakah logika proses cukup rumit untuk membenarkannya (hlm. 9). Arsitektur hibrida yang memakai keduanya juga dimungkinkan (hlm. 9).

## Choreography versus orchestration

Deck utama tidak memakai dua istilah ini. Deck microservices pelengkap memetakannya: choreography mirip event-driven broker, orchestration mirip event-driven mediator (bagian "Choreography & Orchestration"). Tabel berikut menggabungkannya dengan sifat kedua topologi di deck.

| Aspek | Choreography | Orchestration |
| --- | --- | --- |
| Kontrol | Tersebar di tiap handler | Terpusat di mediator |
| Visibilitas alur | Disusun ulang dari event yang beredar | Terbaca dari definisi proses |
| Kopling | Rendah, dependensinya hanya jenis event | Ada kopling mediator ke handler (hlm. 9) |
| Penanganan kegagalan | Mengandalkan redelivery dan handler yang tahan gagal | Mediator menyimpan state dan mengulang langkah (hlm. 9) |
| Kapan dipilih | Banyak reaksi independen, throughput tinggi | Proses bercabang, butuh kompensasi atau audit langkah (hlm. 7 sampai 8) |

## Pola dan mekanisme

Event notification (tambahan). Event hanya membawa penanda dan sedikit konteks, consumer memanggil balik sumbernya untuk detail.

Event-carried state transfer (tambahan). Event membawa seluruh data yang dibutuhkan sehingga consumer tidak perlu bertanya balik.

Event sourcing (deck, hlm. 6). Setiap event beserta state-nya disimpan, bukan state terkini saja, sehingga state di titik waktu mana pun bisa dibangun ulang dari riwayat.

CQRS (tambahan). Model tulis dan model baca dipisah, model baca dibangun dari proyeksi event, berguna saat kebutuhan baca dan tulis berbeda bentuk.

Saga (tambahan). Proses bisnis dipecah menjadi transaksi lokal berurutan, masing-masing dengan aksi kompensasi kalau langkah berikutnya gagal, sebagai ganti distributed transaction.

Idempotensi (tambahan). Handler menghasilkan efek yang sama walau event yang sama diproses dua kali. Istilahnya tidak dipakai deck, tapi kebutuhannya muncul dari mekanisme timeout dan penawaran ulang event di hlm. 5.

Dead letter queue (tambahan). Event yang berulang kali gagal dipindahkan ke antrean terpisah agar tidak menyumbat alur. Deck hanya menyiratkannya lewat timeout.

Outbox pattern (tambahan). Perubahan state dan catatan event ditulis dalam satu transaksi lokal, lalu event diterbitkan dari catatan itu, sehingga commit database dan pengiriman event tidak berbeda nasib.

## Trade-off

Eventual consistency. Pembaca bisa masih melihat data lama setelah event diterbitkan. Yang dirugikan adalah pengguna yang melihat harga atau status belum berubah, dan tim finance yang harus merekonsiliasi angka.

Duplikasi event. Jaminan yang realistis adalah at-least-once, jadi handler bisa berjalan dua kali. Yang dirugikan adalah efek samping yang tidak idempoten: email ganda, saldo terpotong dua kali, notifikasi dobel.

Debugging alur yang tersebar. Deck menyebut testing dan debugging komunikasi asinkron memang sulit, dan skala sistem memperparahnya (hlm. 10). Yang dirugikan adalah on-call engineer yang menerima alarm tanpa jejak alur, dan developer baru yang harus menyusun urutan kejadian dari log beberapa service.

Ordering. Tidak ada urutan global antar channel atau antar partisi, jadi handler yang mengasumsikan `created` selalu datang sebelum `updated` akan salah.

Biaya operasional. Broker, monitoring, evolusi skema event, dan perawatan dead letter queue menambah beban. Yang dirugikan adalah tim kecil dengan produk sederhana, sementara yang diuntungkan adalah tim dengan reaksi independen dan beban tidak rata (hlm. 4).

## Kaitan dengan WordPress

Deck kelompok sudah memetakan ini. Hlm. 7 memasangkan `do_action()` dengan `event(new X)` di Laravel, `add_action()` dengan `Event::listen()`, `add_filter()` dengan Pipeline, dan `save_post` dengan `saved` di Eloquent, dengan prinsip kunci Open-Closed Principle. Hlm. 8 menempatkan core sebagai subject lewat `do_action` dan `apply_filters`, callback plugin sebagai observer, `add_action` dan `add_filter` sebagai cara subscribe, dan `$wp_filter` sebagai registry, lalu menutup dengan kalimat yang sejalan dengan deck kuliah: core tidak tahu siapa yang mendengarkan, itulah implicit invocation.

Kesamaannya ada di pola: deck kuliah memakai observer pattern di bagian stream, channel sebagai subject dan handler sebagai observer (hlm. 5), dan WordPress melakukan hal yang sama dengan daftar callback di array global yang urutannya diatur angka priority.

Perbedaannya tajam, dan itu yang membuat hooks tidak bisa dipakai sebagai contoh lengkap EDA. Hooks berjalan sinkron di dalam satu proses PHP dan satu request; kalau satu callback melempar exception, seluruh request ikut gagal. Tidak ada persistensi, pengiriman ulang, atau dead letter queue, karena tidak ada pengiriman. Nama hook berupa string tanpa type safety, dan state-nya global sehingga sulit diuji. Slide hlm. 10 mencatat dampaknya sendiri: loose coupling dan ekstensibilitas sebagai keuntungan, hidden execution flow, priority yang sulit di-debug, dan global state sebagai tantangan. Semua itu baru muncul sebagai masalah ketika batas proses dan waktu dilewati, dan di titik itulah eventual consistency, at-least-once, serta backpressure ikut masuk.

## Yang perlu kucek lagi

- Apakah exactly once semantics bisa dijamin ujung ke ujung, atau hanya di dalam broker sementara consumer tetap bisa gagal setelah memproses.
- Bagaimana mediator menyimpan state proses dibanding BPM engine, karena deck menyebut keduanya di hlm. 8 tanpa membandingkan langsung.
- Apakah sebutan observer pattern untuk hooks tepat, atau lebih akurat publish-subscribe dengan registry.
- Nomor halaman ikut footer deck, dan beberapa klaim digabung dari dua halaman berurutan.

## Sumber

- `csse.uq.local/w5b-event_driven_architecture.pdf`, hlm. 1 sampai 10, untuk definisi dan contoh lelang (hlm. 1 sampai 2), broker topology termasuk queue dan stream (hlm. 2 sampai 6), mediator topology (hlm. 6 sampai 8), perbandingan keduanya (hlm. 9), dan kesulitan debugging (hlm. 10).
- `csse.uq.local/w6b-microservices.slides.pdf`, bagian "Choreography & Orchestration".
- `p13-evaluasi-hasil-kerja-kelompok-lain/slides.local/06-wordpress.pdf`, hlm. 6 sampai 10: padanan Laravel di hlm. 7, observer pattern dan implicit invocation di hlm. 8, action versus filter hook di hlm. 9, dampak arsitektural di hlm. 10.
- https://csse6400.uqcloud.net/ untuk posisi topik dalam jadwal (Event-Driven Architecture minggu 5, Message Queues minggu 6).
