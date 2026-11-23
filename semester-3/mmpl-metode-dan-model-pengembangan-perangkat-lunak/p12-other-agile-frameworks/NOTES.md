# Others Agile Frameworks

- Crystal Method
- DSDM
- FDD (bagianku)
- Nexus
- SAFe

## Feature Driven Development

Feature Driven Development (FDD) adalah framework agile yang dikembangkan Jeff De Luca dan Peter Coad, dipakai pada 1997 di sebuah bank besar Singapura, lalu diperkenalkan lewat buku Java Modeling In Color with UML. FDD bersifat client-centric dan architecture-centric: kemajuan diukur dari fitur kecil yang nilainya bisa dilihat, dicoba, atau diuji langsung klien, dan satu fitur dijaga maksimal dua minggu [^harness-fdd]. Model domain serta struktur dasar sistem ditetapkan di awal, lalu fitur dibangun berulang dalam siklus pendek, sehingga arsitektur tetap konsisten meski fitur terus ditambah.

Lima proses inti:

1. Develop an Overall Model: menyusun model domain per subject area, pembagian layer, dan rancangan awal basis data.
2. Build a Features List: memecah subject area menjadi business activity, lalu menurunkan fitur berpola action result object.
3. Plan by Feature: mengurutkan fitur menurut business value dan menetapkan feature set owner serta class owner.
4. Design by Feature: domain walkthrough, sequence diagram, dan design inspection sampai menghasilkan design package.
5. Build by Feature: class owner menulis kode dan unit test, lalu code inspection sebelum promosi ke main build.

Tiga proses pertama berjalan sekali di awal inisiatif, sedangkan dua terakhir berulang untuk setiap fitur. Versi lengkap beserta tabel perbandingan dan alur penjelasan lima menit ada di [fdd-expert-brief.md](../p13-other-agile-frameworks/fdd-expert-brief.md).

## Perbandingan lima framework

| Framework | Masalah utama yang diselesaikan | Skala tim | Irama kerja | Peran khas | Kapan dipilih |
| --- | --- | --- | --- | --- | --- |
| Crystal | Satu resep proses untuk semua proyek gagal di dua arah: tim kecil tenggelam dalam dokumentasi, tim besar kehilangan koordinasi | 2 sampai 7 developer plus lead designer di satu ruangan; varian berwarna sampai 50 orang | Pengiriman berkala, milestone berbasis waktu, Sprint tidak diwajibkan | Sponsor, Lead Designer, Designer-Programmer, Coordinator, Tester, Writer, Expert User | Tim kecil satu lokasi, criticality rendah sampai menengah, expert user mudah diakses, kebutuhan berubah |
| DSDM | Waterfall mengunci ruang lingkup di awal, lalu menutup selisih lewat biaya tambahan dan tanggal mundur | Tidak dirinci angkanya; prasyaratnya tim yang sudah diberi wewenang memutuskan | Timebox 2 sampai 4 minggu; waktu dan biaya tetap, cakupan yang menyesuaikan lewat MoSCoW | Business Sponsor, Business Visionary, Business Ambassador, Technical Coordinator, Project Manager, Team Leader | Tanggal dan anggaran sudah dijanjikan ke pihak luar, sponsor bisnis terlibat rutin, lingkup masih bisa ditawar |
| FDD | Iterasi cepat pada proyek besar tanpa gambaran arsitektur menghasilkan struktur tambal sulam, dan progres sulit diukur | Umumnya 15 sampai 50 developer | Siklus per fitur maksimal 2 minggu, laporan progres mingguan dari chief programmer | Chief architect, chief programmer, class owner, domain expert | Proyek besar dengan domain aturan bisnis kaya, kebutuhan dipahami di awal, ada arsitek kuat dan akses domain expert |
| Nexus | Scrum berhenti di level satu tim; dependensi antar tim tidak terlihat dan Integrated Increment tertunda | 3 sampai 9 tim Scrum pada satu produk | Sprint Scrum biasa, satu Integrated Increment tiap Sprint, ditambah event lintas tim | Nexus Integration Team berisi Product Owner, satu Scrum Master, dan anggota tim dengan skill relevan | Satu produk dengan dependensi antar tim yang nyata, setiap tim sudah menjalankan Scrum dengan baik |
| SAFe | Agile satu tim tidak menjawab komunikasi antar tim, dependensi tak terlihat, integrasi di akhir, dan ritme rilis yang berbeda | 50 sampai 125 orang per Agile Release Train; level Portfolio untuk enterprise | PI 8 sampai 12 minggu berisi sprint dua minggu dan satu Innovation and Planning iteration, dibuka PI Planning dua hari | Release Train Engineer, Product Management, System Architect, Solution Train Engineer, Lean Portfolio Management | 50 orang atau lebih dalam minimal lima tim yang saling bergantung, termasuk industri teregulasi, dengan dukungan manajemen senior |

## Berkas pendukung

- [crystal-method.md](../p13-other-agile-frameworks/crystal-method.md): keluarga metodologi Crystal, tujuh properti Crystal Clear, peran, dan batas pemakaiannya.
- [dsdm.md](../p13-other-agile-frameworks/dsdm.md): asal DSDM, lima fase, timebox, MoSCoW, delapan prinsip, dan peran kunci.
- [fdd-expert-brief.md](../p13-other-agile-frameworks/fdd-expert-brief.md): brief lengkap FDD, lima proses secara rinci, perbandingan dengan Scrum, Kanban, dan XP.
- [nexus.md](../p13-other-agile-frameworks/nexus.md): Scrum yang diperluas untuk 3 sampai 9 tim, peran Nexus Integration Team, dan event lintas tim.
- [safe.md](../p13-other-agile-frameworks/safe.md): SAFe 6.0, empat level, irama PI, dan kondisi yang membuatnya masuk akal.
- [quiz-kahoot.csv](../p13-other-agile-frameworks/quiz/quiz-kahoot.csv): sepuluh soal pilihan ganda FDD siap diimpor ke Kahoot.
- [quiz-answer-key.md](../p13-other-agile-frameworks/quiz/quiz-answer-key.md): kunci jawaban sepuluh soal beserta alasan dan rujukan bagian brief.

## Expert Brief

- Overview & Purpose
- Key characteristics
- Strenght & Limitation
- When should we use this approach?
- Comparison with others approaches

<https://docs.google.com/document/d/1IW7n22_AL-CBVF1OAbw4aOjFVAJkmGpRVfyuB3o9Y38/edit?tab=t.tbk22m46dt64>

## Reflection

Feature Driven Development (FDD) itu merupakan salah satu agile frameworks yang menitikberatkan pada pengembangan berbasis fitur-fitur kecil yang diprioritaskan berdasarkan business value tertinggi untuk bisa segera di-deliver. FDD diaplikasikan karena keterbatasan agile framework lain seperti Scrum pada project berskala besar. FDD bisa diibaratkan sebagai jembatan antara method tradisional dengan agile.

Yang masih mengganjal di pikiran saya:

- seberapa kecil definisi suatu fitur?
- kenapa struktur tim-nya hirarkis? Apa maksud dan tugas dari masing-masing role?
- best practice dan working example-nya bagaimana?

butuh lebih banyak waktu lagi untuk riset terkait FDD.

Tiga pertanyaan di atas sudah dijawab di [fdd-suplemen.md](../p13-other-agile-frameworks/fdd-suplemen.md), termasuk studi kasus industri dan analoginya.

[^harness-fdd]: <https://www.harness.io/harness-devops-academy/getting-started-with-feature-driven-development-a-comprehensive-guide>
[^wikipedia-fdd]: <https://en.wikipedia.org/wiki/Feature-driven_development>
[^umbrex-fdd]: <https://umbrex.com/resources/frameworks/project-management-frameworks/feature-driven-development-fdd/>
