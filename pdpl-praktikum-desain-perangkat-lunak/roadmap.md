# Praktikum Desain Perangkat Lunak — Roadmap Curi Start

## Overview

Lab pendamping kuliah Analisis & Desain PL — fokus praktik: membuat model UML dari studi kasus nyata, menerapkan design patterns, dan menyusun dokumen desain perangkat lunak. Output ujiannya selalu berupa diagram-diagram yang digambar langsung dari narasi user requirement, bukan teori hafalan.

## Prasyarat

- OOP dasar (class, inheritance, polymorphism, encapsulation) — sudah harus solid dari PBO/PPBO sem 1–2
- Pemahaman alur program dan logika prosedural — dari Alpro
- ERD dasar — dari mata kuliah Basis Data (karena ERD muncul di soal ujian lab ini)
- Pengenalan UML awal — biasanya sudah disinggung di PBO; kalau belum pernah lihat class diagram sama sekali, luangkan 1 jam baca dulu sebelum masuk topik inti

## Topik Inti (urutan belajar)

1. **Tooling UML** — setup dan eksplorasi PlantUML (text-based, version-control friendly), draw.io sebagai canvas visual cepat, dan StarUML untuk project UML yang lebih terstruktur; pilih satu yang nyaman lalu kuasai.
2. **Use Case Diagram** — identifikasi aktor dan use case dari narasi kebutuhan; pahami relasi `<<include>>`, `<<extend>>`, dan generalisasi aktor.
3. **Class Diagram** — memetakan class, atribut, method, dan relasi (association, aggregation, composition, dependency, inheritance/realization) langsung dari teks user requirement.
4. **Activity Diagram (Workflow)** — menggambarkan alur proses bisnis dengan swimlane, decision node, fork/join; ini yang paling konsisten muncul di soal ujian lab ini.
5. **Sequence Diagram** — memodelkan interaksi antar objek secara kronologis untuk satu skenario use case tertentu.
6. **Design Patterns Praktis** — kenali minimal: creational (Singleton, Factory Method), structural (Adapter, Decorator, Facade), behavioral (Observer, Strategy, Template Method); petakan ke contoh kasus nyata, jangan hafal struktur abstraknya.
7. **Dokumen Desain & Analisis User Story** — menyusun SRS/spesifikasi dari user story: identifikasi data yang diolah, cara mendapat data, dan list fitur; ini topik CPMK 7–8 yang muncul di soal UAS.

## Resource Kurasi

### Kanonik

| Resource                                                                                                                                | Tipe           | Bahasa | Harga                           |
| --------------------------------------------------------------------------------------------------------------------------------------- | -------------- | ------ | ------------------------------- |
| [UML Distilled, 3rd Ed. — Martin Fowler](https://martinfowler.com/books/uml.html)                                                       | Buku           | EN     | Berbayar                        |
| [Head First Design Patterns, 2nd Ed. — Freeman et al., O'Reilly](https://www.oreilly.com/library/view/head-first-design/9781492077992/) | Buku           | EN     | Berbayar                        |
| [refactoring.guru/design-patterns](https://refactoring.guru/design-patterns)                                                            | Website        | EN     | Gratis (web) / Berbayar (ebook) |
| [plantuml.com](https://plantuml.com)                                                                                                    | Tool + Docs    | EN     | Gratis                          |
| [draw.io / diagrams.net](https://app.diagrams.net)                                                                                      | Tool           | EN     | Gratis                          |
| [StarUML](https://staruml.io)                                                                                                           | Tool (desktop) | EN     | Gratis (trial) / Berbayar       |

### Hidden gems (verified by experts)

**1. _Applying UML and Patterns_ — Craig Larman**

- [O'Reilly](https://www.oreilly.com/library/view/applying-uml-and/0131489062/) | [EN, Berbayar, Buku]
- Direkomendasikan oleh **Martin Fowler** (author _UML Distilled_): _"People often ask me which is the best book to introduce them to the world of OO design. Ever since I came across it, Applying UML and Patterns has been my unreserved choice."_ — kutipan dari halaman Goodreads dan endorsement resmi buku tersebut.
- Kenapa worth it: menggabungkan UML, GRASP patterns, dan OOA/D dalam satu alur iteratif berbasis kasus — cocok banget untuk konteks lab yang case-driven. Kalau _UML Distilled_ Fowler terlalu ringkas, Larman yang isi gapnya.

**2. Derek Banas — Design Patterns Video Tutorial (YouTube Playlist)**

- [youtube.com/playlist?list=PLF206E906175C7E07](https://www.youtube.com/playlist?list=PLF206E906175C7E07) | [EN, Gratis, Video]
- Direkomendasikan secara luas di komunitas developer: muncul di [DEV.to](https://dev.to/airtucha/derek-banas-design-patterns-video-tutorial-536j), disebut di GitHub learning plan gists, dan dikutip di [CodeGym's coding skills guide](https://codegym.cc/groups/posts/483-coding-skills-levelup-part-3-where-to-learn-about-design-patterns) sebagai resource design patterns terbaik dari YouTube.
- Format: 29 video, satu video = satu GoF pattern, total ±7 jam — bisa ditonton selektif per pattern yang sedang dipelajari. Catatan: contoh dalam Java; pahami dasar UML dulu sebelum mulai.

**3. Khalil Stemmler — UML Cheatsheet**

- [khalilstemmler.com/articles/uml-cheatsheet/](https://khalilstemmler.com/articles/uml-cheatsheet/) | [EN, Gratis, Website]
- Dijadikan referensi bahan ajar di beberapa universitas (tercatat di CourseSidekick sebagai referensi mata kuliah software design); dibuat berdasarkan cheatsheet yang dipakai Stemmler sendiri saat mulai belajar OOD. Satu halaman, ringkas, visual — langsung ke relasi yang paling sering bikin bingung (aggregation vs composition, dependency vs association).

## Fokus Bank-Soal

Dari analisis **UTS 20/21 Praktikum PDPL** (kasus sistem hotel) dan **UAS 21/22 PDPL** (CPMK 6–8):

**Pola soal yang konsisten muncul:**

- **Kasus narasi → multi-diagram sekaligus**: Selalu ada narasi user requirement (sistem hotel reservasi, BPOM marketplace monitoring) yang diminta diwujudkan ke beberapa diagram dalam satu soal — bukan satu diagram per soal. Latihan harus mengikuti pola ini.

- **Activity diagram/workflow adalah inti soal ujian lab**: Selalu ada permintaan membuat workflow proses bisnis — contoh: "workflow booking berdasarkan jenis pelanggan" dan "workflow check-out/pembayaran". Kuncinya adalah bisa membedakan alur berdasarkan kondisi (anggota vs non-anggota, tamu menginap vs tidak) menggunakan decision node dan swimlane dengan benar.

- **Class diagram harus lengkap relasi-nya**: Tidak cukup gambar kotak class saja — soal UTS mengharapkan relasi yang tepat: inheritance untuk hierarki tipe pelanggan/kelas kamar, composition untuk minibar ↔ kamar (minibar tidak exist tanpa kamar), association untuk pelanggan ↔ layanan tambahan.

- **ERD berdampingan class diagram dari kasus yang sama**: Soal UTS minta keduanya dari narasi yang sama. Pahami perbedaan sudut pandang: class diagram = perspektif OOP (method, inheritance); ERD = perspektif relasional (primary key, foreign key, tabel). Entitasnya sering sama, relasinya berbeda notasi.

- **Analisis user story → data + cara dapat data + list fitur**: Soal UAS CPMK 7–8 memberikan satu user story (contoh: apoteker BPOM monitoring obat di marketplace) lalu meminta: (1) data apa yang diolah, (2) bagaimana cara mendapatkan data tersebut, (3) list fitur sistem. Latih membaca user story dan memecahnya secara sistematis — ini beda tipis dengan analisis kebutuhan di ADPL tapi lebih konkret ke implementasi.

- **Konsep HCI/UI (CPMK 6–7) di soal teori**: Visual hierarchy, user flow bercabang, prinsip affordance, desain dashboard — muncul di soal UAS. Cukup pahami definisi dan bisa beri contoh konkret; tidak perlu hafal deep.

**Tips praktis**: Ambil satu narasi user requirement, lalu buat semua diagramnya (use case → activity → class → ERD) dari narasi yang sama. Konsistensi antar diagram adalah yang dinilai — class yang muncul di class diagram harus konsisten dengan entitas di ERD dan aktor di use case.

## Estimasi Waktu

| Topik                                         | Estimasi    |
| --------------------------------------------- | ----------- |
| Setup tooling + eksplorasi PlantUML/draw.io   | 2 jam       |
| Use case diagram                              | 2 jam       |
| Class diagram (dengan latihan kasus)          | 4 jam       |
| Activity diagram / workflow                   | 4 jam       |
| Sequence diagram                              | 3 jam       |
| Design patterns (6–8 pattern inti)            | 6 jam       |
| Dokumen desain & analisis user story          | 3 jam       |
| Latihan soal dari bank soal (1–2 kasus penuh) | 4 jam       |
| **Total**                                     | **~28 jam** |
