#set page(paper: "a4", margin: 2.0cm)
#set text(size: 11pt, lang: "id", font: "Times New Roman")
#set par(justify: true)
#set heading(numbering: none)

#align(center)[
  #text(size: 14pt, weight: "bold")[Waterfall Model]\
  #text(size: 9pt)[Tugas pengganti kuliah minggu ke-3 MMPL]\
  #text(size: 10pt)[Atalariq Barra Hadinugraha (25/557554/SV/26192)]
]

#v(0.4em)

== Asal-Usul Model Waterfall
- Royce (1970) memformalkan tujuh fase: _system requirements, software requirements, analysis, program design, coding, testing,_ dan _operations_. Tiap fase memakai hasil fase sebelumnya.
- Ia menyarankan siklus dijalankan setidaknya dua kali. Putaran pertama sebagai simulasi produk akhir, putaran kedua menghasilkan sistem yang lebih kuat.
- Naskah Royce tidak memuat kata waterfall. Istilah itu muncul dan dipopularkan oleh Bell dan Thayer (1976).
- Kritik kekakuan dan persentase kegagalan proyek merujuk pada versi linear yang disederhanakan. Usulan awal Royce sudah memuat pengulangan dan umpan balik.

== Bentuk-Bentuk Model Waterfall di Berbagai Literatur
- Tujuh fase Royce hampir selalu disederhanakan menjadi lima, dengan penamaan beda tiap sumber.
  - Petersen et al. (2009): _requirements engineering, design dan implementation, testing, release, maintenance_.
  - Sommerville (2011, 2016): _requirements, design, implementation dan unit testing, integration dan system testing, operation_ dan _maintenance_.
  - Andrei et al. (2019): _requirements, design, coding, testing, operations_.
- Saravanos (2025) merangkum empat varian hubungan antarfase: linear, _two-pass_, _feedback_ ke fase tepat sebelumnya, _feedback_ ke fase mana pun yang lebih awal.
- Ciri penerapan di industri adalah _quality gate_. Di Ericsson, dokumen tiap fase harus lolos daftar periksa sebelum lanjut, contohnya requirement harus sudah dipahami dan disepakati sebelum masuk desain.

== Masalah pada Model Waterfall (Studi Kasus Ericsson AB)
- Konteks: tiga subsistem, total sekitar 2 juta baris kode dari sistem utama di atas 5 juta baris, 33 responden lintas peran (Petersen et al. 2009).
- Waktu proyek: _requirements_ 41%, desain dan implementasi 17%, verifikasi 19%, perilisan 23%.
- _Requirements_ lama di pasar yang cepat berubah: sekitar 26% kebutuhan yang sudah di-_review_ akhirnya dibuang atau dikerjakan ulang.
- _Testing_ menumpuk di akhir: 31% kesalahan yang ketemu di _system test_ seharusnya ketemu di _unit test_. Waktu _testing_ dipangkas kalau _development_ molor, dan kesalahan yang berada di akhir sulit diperbaiki karena akarnya di arsitektur.
- Empat masalah yang belum ada di literatur sebelumnya: bingung versi requirement mana yang diimplementasikan, beban koreksi setelah rilis tinggi, kompetensi menyempit karena tersekat per fase, kesalahan antar subsistem lama dilokalisasi karena komunikasi tersendat.

== Kapan Model Waterfall Masih Relevan dan Dipakai?
- Masih dipakai banyak pengembang perangkat lunak.
  - Andrei et al. (2019): porsi pemakaian 28,1% dibanding metode Agile.
  - Survei PMI (2020): 56% organisasi masih memakai pendekatan tradisional.
- Kondisi yang pas: requirement stabil dan butuh keterlacakan (_traceability_), contohnya di bidang pertahanan, kedirgantaraan, dan kesehatan. Struktur jelas membantu estimasi biaya dan jadwal, dokumentasi lengkap membantu perawatan dan pemenuhan regulasi.
- Bentuk hybrid: alur sekuensial dipakai di level perencanaan dan pemenuhan regulasi, tim bekerja Agile di level sprint. Contoh yang dicatat literatur: Waterfall-Agile atau Agilefall, Waterfall-iterative atau Waterative, Pipeline, Water-Scrum-Fall, dan Scrumbanfall.
- Kegagalan waterfall umumnya berasal dari pemakaian di requirement yang belum jelas atau cepat berubah.

// == Kesimpulan
// Waterfall masih relevan karena dapat diadaptasi dan dipadukan dengan model lain seperti Agile dan Iterative.
// Dengan memadukan beberapa metodologi, tim dapat memanfaatkan kelebihan masing-masing model.
