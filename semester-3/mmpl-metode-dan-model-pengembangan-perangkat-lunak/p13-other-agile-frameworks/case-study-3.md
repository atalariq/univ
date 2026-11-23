# Studi Kasus 3: FDD atau DSDM untuk Sistem Polis dan Klaim
Atalariq Barra Hadinugraha - FDD

## Kondisi kunci dari kasus

- Aturan bisnis polis dan klaim kompleks: batas pertanggungan, pengecualian, masa tunggu, dan syarat klaim saling terkait.
- Kebutuhan utama sudah cukup jelas, jadi arah sistem tidak perlu dicari.
- Proyek melibatkan 30 developer, terlalu banyak untuk koordinasi informal.
- Beberapa domain expert tersedia untuk menjelaskan aturan.
- Manajemen menuntut struktur kerja yang jelas dan progres per fitur yang terukur.

## Pilihan: FDD

FDD yang lebih tepat dipakai di sini. Penilaian memakai tiga kriteria: kemampuan membagi pekerjaan untuk 30 developer, cara formal memodelkan aturan bisnis yang rumit, dan angka penyelesaian per fitur yang bisa dibaca manajemen. DSDM memenuhi sebagian kebutuhan tata kelola, tetapi hanya FDD yang menjawab ketiganya. FDD ditujukan untuk inisiatif 15 sampai 50 developer dengan domain kaya aturan, dan menyebut perbankan serta asuransi sebagai contoh.

## Mekanisme FDD yang menjawab kasus

- Develop an Overall Model dengan domain walkthrough. Domain expert menjelaskan scope, chief architect memandu walkthrough, lalu kelompok kecil menyusun model domain per subject area untuk di-peer review. Aturan polis dan klaim dipetakan sebagai class dan relasi sebelum coding, sehingga pengecualian dan masa tunggu tidak ditemukan satu per satu saat fitur berjalan. Fase ini juga menetapkan struktur layer sistem.
- Feature list dan prioritas business value. Domain dipecah menjadi subject area, business activity, lalu fitur berformat action result object seperti Hitung total premi polis baru. Karena kebutuhan utama sudah jelas, dekomposisi selesai di awal dan menjadi daftar kerja. Plan by Feature mengurutkan fitur menurut business value dan ketergantungan teknis.
- Class ownership dan feature team. Setiap class punya satu owner yang menjaga konsistensi dan performanya, sedangkan fitur yang menyentuh beberapa class dikerjakan feature team berisi para owner itu. Untuk 30 developer, batas tanggung jawab menjadi jelas dan tabrakan perubahan berkurang.
- Design inspection dan code inspection. Design package diperiksa sebelum coding, kode diperiksa sebelum masuk main build. Salah tafsir aturan di satu class bisa menjalar ke perhitungan klaim, jadi pemeriksaan berlapis ini menjaga arti aturan tetap sama.
- Persentase penyelesaian per fitur sebagai laporan. Tiap fitur melewati enam milestone berbobot tetap; domain walkthrough 1 persen, design 40 persen, dan design inspection 3 persen, sehingga saat coding dimulai fitur tercatat 44 persen selesai. Manajemen membaca angka per fitur, dan chief programmer melaporkannya tiap minggu.

## Mengapa DSDM kurang sesuai di sini

DSDM dioptimalkan untuk waktu dan biaya yang dikunci, dengan lingkup sebagai variabel yang ditawar lewat MoSCoW di dalam timebox 2 sampai 4 minggu. Kasus ini tidak menyebut tenggat maupun anggaran tetap, dan menyatakan kebutuhan utama sudah jelas. Kendala sebenarnya adalah kerumitan aturan dan kebutuhan mengukur progres, dua hal yang tidak diselesaikan oleh mekanisme penawar lingkup.

DSDM juga tidak menyediakan metrik progres per fitur. Produknya Prioritised Requirements List, Delivery Plan, dan Timebox Plan, sehingga kemajuan dibaca dari selesainya timebox. Untuk 30 developer dan ratusan fitur, status per timebox terlalu kasar bagi manajemen. DSDM tidak mengenal class ownership dan inspection sebagai praktik wajib; kualitas dijaga lewat prinsip never compromise quality dan pengujian tiap iterasi.

Fokus DSDM adalah kontrol bisnis: business case, sponsor, dan keputusan prioritas di tingkat manajemen. Itu berguna untuk pertanggungjawaban anggaran, tetapi tidak menyentuh kerumitan teknis aturan polis. Pada sistem dengan aturan saling terkait, model domain dan pemilik class dibutuhkan lebih dahulu, dan DSDM menyerahkan keduanya pada praktik tim.

## Catatan bantahan

Bagian ini boleh dihapus sebelum dikumpulkan.

- "DSDM lebih rapi untuk tata kelola perusahaan asuransi." Jawaban: kerapian itu ada pada business case dan timebox, bukan pada model aturan polis. Kasus ini tidak menyinggung audit atau kontrak, dan FDD tetap punya milestone serta laporan mingguan.
- "DSDM lebih cepat karena timebox." Jawaban: timebox mempercepat keputusan melepas fitur, bukan mempercepat pemahaman aturan. Pada aturan rumit, melepas fitur berprioritas rendah tidak mengurangi kerja memodelkan domain.

## Sumber

- https://agilemodeling.com/essays/fdd.htm
- https://en.wikipedia.org/wiki/Feature-driven_development
- https://en.wikipedia.org/wiki/Dynamic_systems_development_method
