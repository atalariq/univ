# Pertemuan 6: Infrastructure as Code

Deck utama `arpl-p6-iac.pdf` (55 slide) bercerita tentang pergeseran dari server fisik ke infrastruktur sebagai file. Catatan UQ `w4a-iac.pdf` mengisi bagian yang tidak sempat dibahas di kelas, terutama state.

## Ringkasan

Sebelum tahun 2000, menambah mesin dibatasi kecepatan membeli dan mengirim barang (slide 3). Sehari konfigurasi masih masuk akal karena mesinnya sangat mahal dan satu developer hanya memegang beberapa mesin.

Virtualisasi memutus kaitan itu. Satu mesin fisik menampung banyak mesin virtual, mesin baru tersedia dalam hitungan menit, dan satu developer tiba-tiba memegang puluhan mesin. Sehari konfigurasi per mesin berubah dari wajar menjadi pemborosan. Jawaban deck ada di slide 9: ketika menghadapi kompleksitas, otomatiskan.

Provisioning adalah satu simpul dalam rantai lebih panjang (slide 10 sampai 17), dari server config sampai database migration. Bacaan UQ membedakan machine configuration (dependency, environment variable) dari stack configuration (resource arsitektur). Mata kuliah ini fokus ke stack configuration; machine configuration diserahkan ke containerisasi.

## Konsep kunci

Infrastructure code adalah kode yang menyediakan dan mengelola infrastructure resources: compute, networking, dan storage (slide 18 sampai 19). Bentuknya lebar, dari shell script dan Python sampai Terraform dan Ansible (slide 20 sampai 23).

Imperatif versus deklaratif. Shell dan Python menyuruh API melakukan langkah satu per satu: buat security group, ambil id-nya, jalankan instance. Terraform hanya menyebut resource yang diinginkan dan membiarkan engine mencari selisih antara keadaan yang diinginkan dan keadaan nyata (slide 25 sampai 26). Deck mencatat bahasa khusus infrastruktur cenderung deklaratif (slide 30).

Idempotensi muncul dari model deklaratif itu: apply dua kali pada kode yang sama seharusnya tidak mengubah apa pun. Deck tidak memakai kata idempotent, jadi ini tambahan dariku.

State paling mudah diremehkan. Catatan UQ bagian 4.2 menjelaskan `terraform.tfstate` memetakan resource di kode ke objek nyata di cloud. File itu berubah sering dan harus sinkron antar developer, jadi menaruhnya di version control umumnya ide buruk. Solusinya remote state di luar infrastruktur yang dikelola, misalnya bucket S3, diperlakukan sebagai cache.

Provisioning membuat resource yang belum ada, configuration management merapikan isi mesin yang sudah ada. Deck memisahkannya di slide 10. Ansible condong ke sisi kedua, Terraform ke sisi pertama, walau batasnya tidak tegas.

Immutable infrastructure tidak muncul di deck ini; yang terdekat adalah peringatan snowflake (slide 41), mesin unik yang tidak bisa dibangun ulang.

Deck membedakan infrastructure code (kodenya) dari Infrastructure as Code (praktik memperlakukannya seperti kode biasa) di slide 31 sampai 32.

## Alur kerja

Deck tidak memberi urutan operasional bernama, tetapi bahannya ada. Bacaan UQ bagian 4.3 menyebut dua cara pipeline menjaga konsistensi: gagal kalau kode akan mengubah kenyataan, atau melakukan perubahan itu di dalam pipeline.

Urutan yang masuk akal: tulis, review, plan, apply, verifikasi. Review terjadi di pull request, atas diff file. Plan menerjemahkan kode menjadi rencana perubahan resource, apply mengeksekusinya, verifikasi memastikan hasilnya benar. Deck memberi contoh test end-to-end yang membuka URL hasil deploy lalu memeriksa responsnya (slide 52). Lapisan bawah piramida test diisi validate dan compliance (slide 51).

Manusia tetap dibutuhkan di tiga titik. Membaca plan, terutama baris yang menandai resource akan dihapus. Memutuskan kapan state boleh disentuh, karena state rusak tidak bisa dipulihkan dengan revert git. Dan menilai apakah perubahan kecil di kode membawa lompatan biaya bulanan.

## Kekuatan dan biaya

Sisi kuatnya diberi label di deck: reproducible (slide 42), restorable dan accountable lewat version control (slide 44), consistent lewat automation (slide 46), reuse (slide 48), serta trust dari testing (slide 54). Satu file menghasilkan lingkungan yang sama, dan mesin rusak bisa dibangun ulang tanpa menebak apa yang dulu dipasang.

Biayanya juga nyata. State bisa rusak atau tertinggal, dan apply berikutnya berpotensi menghapus resource yang masih dipakai. Kurva belajarnya curam: bahasa khusus, konsep provider, dan model mental tentang diff. Deck sendiri jujur di slide 33: IaC masih awal dan cukup buruk. Bacaan UQ menutup dengan tiga masalah terbuka: mengimpor infrastruktur lama, memperbaiki manajemen state, dan refactoring yang layak.

Plan kecil bisa berarti penggantian database, jadi wajib dibaca.

## Kapan dipakai

Sinyal yang mengarah ke IaC: mesin lebih banyak dari yang bisa diingat, lebih dari satu environment, kebutuhan audit, orang lain yang harus bisa membangun ulang lingkunganmu, atau disaster recovery yang harus diuji.

Kondisi yang membuatnya berlebihan: satu VPS untuk aplikasi kecil, prototipe yang mungkin dibuang bulan depan, atau tim yang belum pernah punya lingkungan kedua untuk direproduksi. Pada skala itu, skrip setup biasa lebih murah, dan biaya state serta kurva belajar tidak terbayar.

## Kaitan dengan pertemuan lain

`../p5-containers/NOTES.md` menutup bagian yang sengaja dilepas di sini. Bacaan UQ bagian 1 menyatakan mata kuliah ini bergantung pada containerisasi seperti Docker untuk machine configuration, sedangkan IaC mengurus stack configuration. Keduanya bertemu di satu titik: image container adalah artefak yang bisa dibangun ulang, begitu juga infrastruktur yang menjalankannya.

`../p12-monolith-microservices/NOTES.md` menjelaskan kenapa topik ini mendesak. Memecah monolith menjadi microservices melipatgandakan artefak deploy dan resource per service, jadi pekerjaan manual berubah dari merepotkan menjadi mustahil. Batas service yang sekaligus batas kepemilikan data membuat tiap service cenderung butuh resource sendiri.

## Sumber

Deck mata kuliah:

- `arpl-p6-iac.pdf`, 55 slide. Klaim: slide 3, 9, 10 sampai 17, 18 sampai 20, 25 sampai 26, 30 sampai 33, 40 sampai 42, 44, 46, 48, 51 sampai 54.

Catatan pendamping:

- `w4a-iac.pdf`, lecture notes 4 hlm. Klaim: bagian 1, 2, 4.1 sampai 4.3, kesimpulan hlm. 4.

Yang tidak terbaca: slide 4 sampai 6 dan 8 hanya berisi gambar tanpa teks, jadi isi Iron Age dan Cloud Age kusimpulkan dari slide 3, 7, dan 9. Diagram piramida di slide 50 dan 51 hanya mengeluarkan label lapisan, tanpa keterangan gambar.
