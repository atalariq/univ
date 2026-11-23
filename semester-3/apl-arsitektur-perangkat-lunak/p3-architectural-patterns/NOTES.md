# Pertemuan 3: Introduction to Patterns

Deck `arpl-p3-architectural-patterns.pdf` hanya 14 halaman dan separuhnya gambar. Teksnya cuma definisi pola (hlm. 2), tabel architecture vs design (hlm. 3), daftar pola (hlm. 4), client-server (hlm. 6), dan broker (hlm. 9 sampai 10). Sisanya diagram tanpa narasi, jadi bagian kosong saya isi dari pembacaan diagram dan dua berkas CSSE.

## Ringkasan

Definisi yang dikutip deck: architectural pattern adalah solusi reusable untuk masalah yang sering muncul pada konteks tertentu, cakupannya lebih luas daripada design pattern (hlm. 2). Alurnya Problems -> Solutions -> General solution -> Pattern. Dua peringatan: tidak semua pola cocok untuk semua masalah, dan satu masalah bisa punya lebih dari satu pola.

Batas dengan design ada di hlm. 3. Architecture itu struktural (apa yang diimplementasikan, interaksi modul), strategis, mahal, dan trade-off-nya signifikan. Design itu code dan look (algoritma, UI), taktis, murah, dan trade-off kecil. Pola arsitektur mengubah bentuk sistem; design pattern mengubah susunan kelas.

Batas dengan gaya arsitektur lebih kabur: deck menaruh layered, pipe-filter, microservice, dan event-bus dalam daftar "Example of Patterns" (hlm. 4). Literatur memisahkan gaya (keluarga struktur) dari pola (solusi pada konteks); deck memakai keduanya sebagai sinonim. Gunanya: memberi nama pada struktur yang terbukti.

## Anatomi pola

Literatur memakai lima bagian, dan deck tidak memakai kelima istilahnya.

- Nama: sebutan pendek yang memicu bayangan struktur (hlm. 4).
- Konteks: situasi tempat masalah muncul, "within a given context" (hlm. 2).
- Masalah: kekuatan yang bertabrakan, "commonly occurring problem" (hlm. 2).
- Solusi: struktur umum penyelesaiannya, "General solution -> Pattern" (hlm. 2).
- Konsekuensi: keuntungan dan harga. Deck tidak punya bagian ini; yang terdekat trade-off di hlm. 3.

Konsekuensi paling sering hilang saat pola disalin dari artikel, dan tanpanya pola jadi resep.

## Pola yang dibahas

### Client-server

Masalah: banyak pengguna butuh data yang sama. Solusi: satu host server menyimpan data dan menawarkan akses, client mengirim permintaan lewat jaringan (hlm. 5 sampai 6). Konsekuensi: data terpusat dan konsistensinya terjaga, tetapi server jadi titik konsentrasi beban dan kegagalan.

### Peer-to-peer

Deck hanya dua gambar, tanpa satu kalimat pun (hlm. 7 sampai 8). Yang pertama membandingkan keduanya pada lima perangkat; label kapasitas terpakai bergeser dari 20% ke 50%. Yang kedua BitTorrent dengan tracker, seeder, leecher, swarm. Masalah yang tersirat: satu server pusat terlalu mahal untuk isi besar. Solusi: beban dibagi antar peer. Konsekuensi: kapasitas naik seiring peserta, tetapi koordinasi dan kepercayaan lebih sulit.

### Broker

Client mengakses fungsi server lewat broker: server mendaftarkan layanannya, broker meneruskan request ke server yang tepat dan mengembalikan hasilnya (hlm. 9). Broker memegang detail tiap server dan layanannya (hlm. 10). Masalah: client tidak perlu tahu alamat dan jumlah server. Solusi: komponen perantara yang tahu lokasi dan routing. Konsekuensi: client dan server saling lepas, tetapi broker jadi komponen kritis; kalau mati, komunikasi berhenti.

### Layered

Hlm. 11 menampilkan enam kotak bertumpuk: User Interface, Presentation, Application, Domain Model, Persistence, Data, dengan Infrastructure (framework, logging) sebagai sidecar. Masalah: kode UI, logika bisnis, dan akses data bercampur sehingga perubahan kecil menyebar. Solusi: pemisahan per lapisan dengan aturan komunikasi. Konsekuensi: lapisan bisa diganti asal kontraknya tetap, tetapi satu permintaan melewati beberapa lapisan jadi lebih mahal (`w1b-layered.pdf` hlm. 10).

### Model-view-controller

Hlm. 12 hanya gambar. Controller disebut brain: memutuskan bagaimana data ditampilkan, memulai view, mengubah model, sementara view mengirim pembaruan lewat setter dan event handler. Masalah: tampilan dan logika data terikat. Solusi: tiga peran terpisah dengan arah interaksi jelas. Konsekuensi: tampilan bisa diganti tanpa menyentuh model, tetapi controller cenderung membengkak.

### Pola yang hanya disebut namanya

Hlm. 4 mendaftar master-slave, interpreter, event-bus, pipe-filter, blackboard, dan microservice tanpa penjelasan. Pipe-filter dilengkapi dari `w2d-pipeline.pdf` (tambahan): filter dihubungkan pipa, data mengalir satu arah, dan filter tidak bergantung pada filter lain (hlm. 2 sampai 3). Filter jadi bisa dipakai ulang, tetapi buruk untuk aplikasi interaktif karena hasil tidak kembali ke sumber.

## Kekuatan dan jebakan pemakaian pola

Over-engineering. Pola menambah komponen dan kontrak. Untuk skrip 300 baris atau CRUD satu tabel, layered ditambah broker hanya menambah berkas. Deck mengingatkan bahwa tidak semua pola cocok untuk semua masalah (hlm. 2).

Pola di luar konteksnya. Broker masuk akal kalau ada banyak server dan client tidak boleh tahu lokasinya; kalau servernya satu, broker hanya menambah titik gagal. Data milik tiap pengguna yang harus jalan tanpa jaringan lebih dekat ke peer-to-peer.

Biaya belajar. Setiap pola punya kosakata dan aturan yang harus dipahami bersama. Memakai namanya tanpa memahami konsekuensinya membuat tim merasa sepakat padahal membayangkan struktur berbeda.

## Kapan pola membantu dan kapan justru merusak

Sinyal pola membantu:

- Masalahnya sudah muncul di proyek lain.
- Beberapa tim harus memahami struktur yang sama.
- Trade-off-nya bisa disebut konkret, misalnya menerima satu hop ekstra agar lapisan data bisa diganti.
- Pola menjawab kendala di requirements.

Sinyal pola merusak:

- Komponen yang ditambahkan lebih banyak daripada masalah yang diselesaikan.
- Tidak ada konsekuensi pola yang bisa disebutkan tim.
- Pola dipakai karena namanya terdengar matang.
- Pola dipilih untuk menghindari percakapan soal batas modul.

## Kaitan dengan pertemuan lain

Pertemuan 2 membahas layered architecture dengan prinsip layer isolation, neighbour communication, dan downward dependency; hlm. 11 di deck ini versi ringkasnya, `../p2-layered-architecture/NOTES.md` versi panjangnya. Pertemuan 2 bertanya bagaimana lapisan berperilaku, pertemuan 3 bagaimana pola dipilih.

Hlm. 4 menempatkan microservice sebagai pola, dan `../p12-monolith-microservices/NOTES.md` melengkapi konsekuensinya: distributed data, latensi jaringan, observability, biaya operasional.

## Sumber

- `from-elok.local/arpl-p3-architectural-patterns.pdf`: hlm. 2, 3, 4, 5 sampai 6, 7 sampai 8, 9 sampai 10, 11, 12, 14.
- `csse.uq.local/w1b-layered.pdf`: hlm. 10 (biaya message passing).
- `csse.uq.local/w2d-pipeline.pdf`: hlm. 2 sampai 3 (one direction principle).
