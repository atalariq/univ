# Pertemuan 13: Event-Driven Architecture

## Yang sudah kupahami sebelum kelas

Sebelum kelas, pemahamanku soal event-driven architecture sebagian besar datang dari dua tempat: slide kelompok sendiri waktu memaparkan WordPress, dan pengalaman memakai event di Laravel.

Pertama, aku sudah cukup yakin bahwa inti event-driven adalah "sesuatu terjadi, lalu ada yang bereaksi", dan yang memberi tahu tidak perlu tahu siapa yang bereaksi. Di WordPress, core memanggil `do_action('save_post')` dan plugin mendaftarkan `add_action('save_post', 'notify')`. Core tidak pernah menyebut nama fungsi `notify` di mana pun. Itu yang di slide kelompok kami disebut implicit invocation, dan menurutku itu inti dari decoupling di gaya ini.

Kedua, soal asinkron. Aku pernah memakai queue di Laravel untuk mengirim email, dan yang kuingat: request HTTP selesai lebih cepat karena pengiriman email dikerjakan proses lain. Jadi dugaanku, event-driven architecture adalah versi lebih besar dari pola itu, dengan broker sebagai pengganti tabel `jobs` di database.

Ketiga, soal observer pattern. Aku paham pola ini dari mata kuliah desain perangkat lunak: subject menyimpan daftar observer, lalu memanggil semuanya saat state berubah. Aku menduga hooks WordPress adalah observer pattern yang dipasang lewat nama string, dengan `$wp_filter` sebagai daftar observer-nya.

Keempat, aku tahu nama Kafka, RabbitMQ, dan AWS SQS dari membaca-baca, tapi belum pernah memasang satu pun. Jadi pengetahuanku soal broker masih di tingkat "katanya".

Kelima, dan ini bagian yang paling kabur: aku belum paham beda queue dan stream. Setahuku queue menghapus event setelah diambil, sementara stream menyimpannya, tapi aku belum tahu konsekuensi praktisnya, misalnya soal biaya penyimpanan atau cara consumer yang tertinggal mengejar ketertinggalan.

## Dugaan yang perlu diuji di kelas

Dugaan-dugaan ini bisa salah, dan justru itu yang mau kucek.

1. Urutan event. Aku menduga event diproses sesuai urutan dikirim, first in first out. Kalau ada beberapa consumer, dugaanku urutan itu tetap terjaga per partisi atau per channel, tapi tidak dijamin antar channel.
2. Jaminan pengiriman. Aku menduga broker selalu menyimpan event sampai ada yang memprosesnya, jadi event tidak mungkin hilang. Ini kelihatannya terlalu enak, dan mungkin hanya berlaku kalau queuenya persistent.
3. Siapa tahu alamat siapa. Aku menduga publisher hanya tahu nama channel atau topic, dan sama sekali tidak tahu ada berapa handler di belakangnya. Kalau publisher harus tahu nama handler, decoupling-nya jadi palsu.
4. Exactly once. Aku menduga broker modern memberi jaminan exactly once secara default. Dugaanku ini lemah, karena aku sering dengar cerita event terproses dua kali.
5. Hooks WordPress dan broker. Aku menduga keduanya beda kelas: hooks sinkron dan hidup di dalam satu request PHP, sementara broker memisahkan proses dan waktu. Kalau ternyata ada versi asinkron dari hooks, dugaanku perlu direvisi.
6. Event dan message. Aku menduga dua istilah ini sinonim, hanya beda selera penulis.

## Pertanyaan untuk dibawa ke kelas

1. Kalau satu business process punya cabang kondisi dan langkah kompensasi, apakah itu sudah cukup jadi alasan pindah dari broker ke mediator, atau ada tanda lain yang lebih jelas?
2. Kalau mediator menyimpan state proses dan mengatur urutan langkah, apa bedanya mediator dengan monolith kecil yang dipotong-potong? Di mana batasnya?
3. Untuk alur yang tersebar di banyak service, bagaimana cara standar menelusuri satu event dari publisher sampai consumer terakhir? Apakah correlation id cukup, atau perlu trace terdistribusi?
4. Kalau satu event hilang di tengah jalan, siapa yang bertanggung jawab: publisher, broker, atau consumer? Apakah ada pola yang membagi tanggung jawab itu secara eksplisit?
5. Apakah event sourcing selalu harus dipasangkan dengan CQRS, atau bisa berdiri sendiri?
6. Untuk skala proyek kecil seperti plugin WordPress, kapan hooks sudah tidak cukup sehingga orang benar-benar butuh broker?
