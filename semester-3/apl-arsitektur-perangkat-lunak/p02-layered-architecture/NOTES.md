# Pertemuan 2: Layered Architecture

## Ringkasan

Layered architecture membagi software menjadi kumpulan komponen yang dikelompokkan per lapisan, lalu membatasi komunikasi antar lapisan (hlm. 3 deck CSSE6400). Batasnya sering tidak ditegakkan teknologi, hanya kebijakan arsitektur: tidak ada yang menghentikan sebuah kelas memanggil kelas di lapisan lain kecuali kesepakatan tim. Komunikasi lintas batas lewat contract yang jelas, sehingga tiap lapisan tahu bagaimana ia boleh dipakai dan bisa diganti.

Gaya ini muncul sebagai jawaban atas big ball of mud, kondisi saat semua komponen bebas saling memanggil sehingga satu perubahan bisa merusak bagian mana pun (slide 3 sampai 5). Modularitas saja belum cukup karena tanpa disiplin modul tetap saling memanggil sesukanya (slide 7). Layered architecture mengatur arah panggilan itu (slide 8).

Yang dijanjikan: perubahan satu lapisan tidak merembet ke lapisan lain selama interface-nya tetap, dan developer cukup memahami interface publik untuk memakainya (hlm. 11). Janji itu bersyarat, hanya berlaku kalau aturan aksesnya dipegang.

## Konsep kunci

Bentuk standarnya empat lapis (slide 9 sampai 13, hlm. 3). Presentation memformat data bagi manusia dan menerima input. Business memegang logika inti, menerima event atau query dari presentation, lalu menentukan update yang diperlukan. Persistence adalah wrapper atas database yang membuat akses data lebih abstrak. Database adalah aplikasi komersial seperti MySQL atau Postgres.

Lima prinsip mengatur aksesnya (slide 16 sampai 20, hlm. 7 sampai 9):

- Layer Isolation: lapisan hanya bergantung pada interface, bukan detail implementasi lapisan lain.
- Neighbour Communication: komunikasi hanya lewat lapisan tetangga langsung, tidak melompati lapisan.
- Downward Dependency: lapisan atas bergantung pada lapisan bawah, tidak sebaliknya. Yang dibatasi dependensi dan pemakaian, bukan aliran data atau kontrol.
- Upward Notification: lapisan bawah memberi kabar ke atas lewat interface umum, callback, atau event.
- Sidecar Spanning: lapisan samping berisi interface untuk komunikasi kompleks atau layanan eksternal seperti logging.

Prinsip ketiga dan keempat terlihat bertabrakan, dan di situ letak sulitnya: lapisan bawah perlu memberi tahu lapisan atas bahwa data berubah tanpa memakai apa pun miliknya. Solusinya interface umum seperti Subject dan Observer (hlm. 8). Dalam satu proses exception masih bisa dipakai; begitu lapisan dipisah ke mesin lain, perlu callback (hlm. 8).

Closed layer adalah default: komunikasi melewati setiap lapisan, sehingga perubahan contract paling banyak menyentuh satu lapisan lain. Open layer membolehkan lapisan lain melompatinya, dan deck CSSE6400 menilai pilihan itu sebaiknya dihindari karena merusak isolasi (hlm. 10). Di luar kedua deck, Richards dan Ford menyebutnya relaxed layering.

Deck dosen memperkenalkan PCBMER, varian yang memecah business layer menjadi Controller, Bean, Mediator, dan Entity, dengan Resource sebagai akses data (slide 24 sampai 29). J2EE memecahnya serupa, dengan DAO sebagai persistence (hlm. 9).

Tiap lapisan bisa dideploy terpisah. Database paling sering dipisah lebih dulu karena contract-nya jelas dan tidak terikat bahasa, lalu presentation, seperti pada aplikasi web (hlm. 4 sampai 5).

Layered architecture berbeda dari client-server. Client dan server adalah dua peran dalam satu interaksi request-response yang bisa berada di mesin berbeda; layering adalah pembagian tanggung jawab di dalam satu sistem dan tetap berlaku di dalam server. Aplikasi web memakai keduanya: client-server untuk deployment, layered untuk isi servernya (hlm. 5 sampai 6).

## Kekuatan dan biaya

Yang didapat:

- Implementasi satu lapisan bisa diganti tanpa menyentuh lapisan lain selama interface tetap, misalnya aplikasi command line yang jadi GUI dengan mengganti presentation (hlm. 3 dan 11).
- Perubahan interface paling banyak merembet ke satu lapisan.
- Lapisan bawah bisa jadi layanan umum lintas aplikasi, misalnya persistence untuk berbagai database.
- Lapisan bisa dideploy dan diskalakan terpisah (hlm. 11).

Yang dibayar:

- Latensi. Satu permintaan melewati empat lapisan sebelum sampai database (hlm. 11). Yang menanggung: pengguna.
- Boilerplate. Tiap lapisan butuh DTO, mapper, dan interface yang isinya sering hanya meneruskan panggilan. Yang menanggung: developer yang menulisnya.
- Disiplin yang tidak otomatis. Tidak ada yang menggagalkan build kalau presentation memanggil persistence langsung, jadi pelanggaran baru ketahuan saat review (hlm. 11). Yang menanggung: reviewer dan tim penerus.
- Kembali jadi big ball of mud. Lapisan yang dirancang buruk memaksa orang melanggar aturan supaya sistem jalan (hlm. 11). Yang menanggung: seluruh tim.

## Kapan dipakai

Sinyal yang mengarah ke sini: domain cukup jelas sehingga lapisan bisa dinamai, beberapa cara akses perlu berbagi logika yang sama (web, CLI, API), dan ada rencana mengganti database atau UI.

Sinyal yang menjauhkan: latensi sangat ketat, karena rantai panggilan berlapis menambah waktu. Tim kecil dengan satu UI dan satu database, karena lapisan hanya menambah file. Domain yang masih berubah cepat, karena batas lapisan ikut bergeser. Kalau masalah utamanya skalabilitas per komponen, layering tidak menjawabnya.

## Kaitan dengan pertemuan lain

Pertemuan 3 menempatkan layered architecture sebagai salah satu architectural pattern yang dibandingkan dengan client-server, broker, dan pipe-filter. Di pertemuan 12 pola yang sama muncul lagi: monolith modular adalah layered architecture di dalam satu artefak deploy, dan microservices memindahkan batas lapisan menjadi batas service, sehingga biaya yang tadinya satu pemanggilan fungsi berubah jadi network hop. Uraiannya ada di [`../p12-monolith-microservices/NOTES.md`](../p12-monolith-microservices/NOTES.md).

## Sumber

- `from-elok.local/arpl-p2-layered.pdf`, 30 slide. Klaim: slide 3 sampai 8, 9 sampai 13, 16 sampai 20, 24 sampai 29.
- `from-elok.local/arpl-p1-introduction.pdf`, daftar pattern (client-server terpisah dari layered).
- `csse.uq.local/w1b-layered.pdf`, 12 hlm., lecture notes bukan slide. Klaim: hlm. 1, 3, 4 sampai 6, 7 sampai 10, 11.

Yang tidak terbaca: slide 9 sampai 13 hanya label empat lapisan dan caption gambar. Slide 22 dan 23 hanya caption figure J2EE dan PCBMER. Slide 14 dan 15 pertanyaan tanpa jawaban tertulis. Nomor definisi di slide 16 sampai 20 tercetak sebagai "Definition 0" karena counter beamer, jadi rujukannya memakai nomor slide.
