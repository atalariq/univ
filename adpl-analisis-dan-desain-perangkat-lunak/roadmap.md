# Analisis dan Desain Perangkat Lunak — Roadmap Curi Start

## Overview

Mata kuliah ini membahas seluruh siklus analisis dan desain sistem perangkat lunak berbasis objek — mulai dari menggali kebutuhan, memodelkan sistem dengan UML, menerapkan design patterns, hingga menghasilkan dokumen SRS dan wireframe antarmuka yang siap presentasi ke klien. Topiknya lebar tapi alurnya linear: pahami metodologi dulu, baru modeling UML, lalu desain (patterns + UI), lalu dokumentasi.

---

## Prasyarat

Kamu perlu refresh hal-hal berikut sebelum mulai topik inti agar tidak kepentok di tengah jalan:

| Konsep                                                                  | Sumber Refresh                                                     |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------ |
| OOP dasar — class, object, inheritance, encapsulation, polymorphism     | Materi kuliah PBO / PPBO semester sebelumnya                       |
| Konsep SDLC sederhana (waterfall, agile)                                | Kuliah MMPL jika sudah ambil, atau baca ringkasan di GeeksforGeeks |
| ERD dasar — entitas, atribut, relasi                                    | Materi kuliah Basis Data                                           |
| Basic UML — pernah lihat class diagram atau use case, tidak perlu fasih | Cukup ingat konsepnya                                              |

Kalau OOP-mu masih goyang, luangkan 2–3 jam dulu untuk review sebelum masuk ke OOAD.

---

## Topik Inti (urutan belajar)

Urutan ini dirancang supaya setiap topik membangun di atas yang sebelumnya. Jangan loncat-loncat.

1. **SDLC & Metodologi Pengembangan PL** — Pahami fase-fase development (requirements, analysis, design, implementation, testing), model waterfall vs iterative, dan kenapa fase analisis adalah yang paling kritis untuk keberhasilan proyek.

2. **Faktor Kegagalan Sistem & Antisipasi** — Pelajari penyebab umum gagalnya pengembangan sistem di tahap analisis (komunikasi buruk, scope creep, legacy system tidak terdokumentasi) dan bagaimana cara analis sistem mengantisipasinya.

3. **Legacy System & Migrasi** — Memahami dampak sistem lama terhadap proses pengembangan baru, tantangan integrasi, dan strategi migrasi bertahap.

4. **OOP Refresh — Objek, Kelas, dan Tanggung Jawab** — Kuatkan ulang konsep objek sebagai "entitas dengan state dan behavior", basis dari semua diagram UML yang akan datang.

5. **Object-Oriented Analysis (OOA) — Identifikasi Aktor & Use Case** — Latih kemampuan membaca kebutuhan klien dan mengidentifikasi siapa yang pakai sistem dan apa yang mereka lakukan.

6. **UML Use Case Diagram** — Gambarkan aktor, use case, relasi include/extend/generalization; ini adalah diagram pertama yang dibuat dari kebutuhan klien.

7. **UML Class Diagram** — Identifikasi kelas, atribut, operasi, dan relasi antar kelas (association, aggregation, composition, inheritance); fondasi arsitektur OO.

8. **UML Sequence Diagram** — Gambarkan aliran pesan antar objek untuk skenario tertentu (misalnya: proses login, integrasi API pihak ketiga); sangat sering muncul di soal integrasi sistem.

9. **UML Activity Diagram** — Modelkan alur proses bisnis atau alur kerja sistem; berguna untuk menjelaskan logika kompleks ke klien non-teknis.

10. **Diagram Basis Data (ERD)** — Rancang entitas, atribut, dan relasi untuk skema database; beda dengan class diagram tapi sering dikerjakan paralel.

11. **SOLID Principles** — Lima prinsip desain OO yang membuat kode maintainable; pelajari sebelum design patterns karena patterns dibangun di atas prinsip ini.

12. **Design Patterns — GoF (Creational, Structural, Behavioral)** — Pelajari minimal 8–10 pattern yang paling sering dipakai: Singleton, Factory, Observer, Strategy, Decorator, Facade, Adapter, Template Method; fokus pada _kapan dipakai_ bukan hafal kodenya.

13. **Konsep HCI (Human-Computer Interaction)** — Prinsip usability, affordance, feedback, dan model mental pengguna; fondasi untuk membuat keputusan desain UI yang bisa diargumentasikan.

14. **Desain Antarmuka — Wireframing & Prototyping** — Rancang layout dan alur navigasi menggunakan wireframe (bisa Figma, Balsamiq, atau bahkan paper); pelajari prinsip visual hierarchy, konsistensi, dan aksesibilitas.

15. **Dokumen SRS (Software Requirements Specification)** — Pelajari struktur SRS standar IEEE 830: purpose, scope, overall description, specific requirements (functional & non-functional), use case yang ditulis dalam format teks.

---

## Resource Kurasi

### Kanonik

Ini resource standar industri/akademik yang bisa kamu jadikan referensi utama. Tidak perlu baca semua dari cover ke cover — baca bagian yang relevan per topik.

1. **UML Distilled: A Brief Guide to the Standard Object Modeling Language (3rd Ed.)** — Martin Fowler
   Buku paling ringkas dan padat untuk UML 2.0; cocok sebagai referensi cepat untuk semua jenis diagram.
   [EN] [Berbayar] Buku
   https://www.oreilly.com/library/view/uml-distilled-a/0321193687/

2. **Applying UML and Patterns: An Introduction to OO Analysis and Design (3rd Ed.)** — Craig Larman
   Textbook OOAD paling komprehensif dengan pendekatan case study iteratif; direkomendasikan oleh Martin Fowler sendiri sebagai "unreserved choice" untuk belajar OOAD.
   [EN] [Berbayar] Buku
   https://www.oreilly.com/library/view/applying-uml-and/0131489062/

3. **Design Patterns: Elements of Reusable Object-Oriented Software** — Gamma, Helm, Johnson, Vlissides (GoF)
   Buku acuan klasik untuk 23 design patterns; berat untuk dibaca langsung, tapi wajib kamu tahu eksistensinya dan gunakan sebagai referensi per-pattern.
   [EN] [Berbayar] Buku
   https://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612

4. **Software Engineering (10th Ed.)** — Ian Sommerville
   Textbook rekayasa perangkat lunak yang dipakai di banyak universitas; bagian tentang requirements engineering dan software design langsung relevan ke ADPL.
   [EN] [Berbayar] Buku

5. **NPTEL: Object-Oriented Analysis and Design** — Prof. Partha Pratim Das, IIT Kharagpur
   Kursus video gratis 8 minggu dari IIT Kharagpur (universitas teknik terbaik India); terstruktur dengan baik dari software complexity hingga case study OOAD lengkap.
   [EN] [Gratis] Video Course
   https://nptel.ac.in/courses/106105153

---

### Hidden gems (verified by experts)

Resource di bawah ini kurang mainstream di kalangan mahasiswa Indonesia tapi kualitasnya tinggi dan bisa mempercepat pemahaman secara signifikan.

---

**1. refactoring.guru — Design Patterns & SOLID Principles**
Website oleh Alexander Shvets yang menjelaskan 22 design patterns klasik dengan ilustrasi komik, pseudocode multi-bahasa, dan analisis pro-cons tiap pattern. Developer Kristian Lentino di DEV Community menulis: _"this resource has proved to be of great quality, the examples are very simple and easy to understand being all taken from real cases"_ (https://dev.to/kristianlentino99/a-very-useful-resource-about-design-patterns-be7). Versi website-nya gratis sepenuhnya; ada buku _Dive Into Design Patterns_ jika ingin format offline.
[EN] [Gratis] Website
https://refactoring.guru/design-patterns

---

**2. ArjanCodes — Design Patterns in Python (YouTube Playlist)**
Playlist oleh Arjan Egges, seorang dosen CS dan software developer dengan 20+ tahun pengalaman. Setiap video menunjukkan _kenapa_ sebuah pattern dibutuhkan dengan memulai dari kode yang bermasalah, bukan langsung ke definisi abstrak. Direkomendasikan dalam artikel _"Best YouTube Channels to Learn Python"_ (softspacesolutions.com) sebagai resource terbaik untuk refactoring dan design patterns. Cocok sebagai pelengkap refactoring.guru karena lebih bersifat hands-on.
[EN] [Gratis] YouTube
https://www.youtube.com/playlist?list=PLC0nd42SBTaNf0bVJVd9e2oBV-mcUuxS0

---

**3. "Requirements Engineering" Open Textbook — Rebus Community (Appendix C & D: IEEE 830 Template + Sample)**
Open textbook berbasis komunitas yang menyertakan template SRS lengkap berformat IEEE 830 (Appendix C) dan contoh SRS terisi penuh (Appendix D). Ini adalah resource gratis paling praktis untuk langsung memulai menulis SRS — cukup ganti teks dalam tanda `< >` dengan informasi proyekmu. Diterbitkan di Rebus Community Press sebagai open educational resource (OER).
[EN] [Gratis] Open Textbook / Template
Template: https://press.rebus.community/requirementsengineering/back-matter/appendix-c-ieee-830-template/
Sample: https://press.rebus.community/requirementsengineering/back-matter/appendix-d-ieee-830-sample/

---

**4. OOAD Course — University of Colorado Boulder (Coursera, audit gratis)**
Kursus dari CU Boulder yang cover OOAD foundations, UML, dan design patterns dalam dua seri (Foundations & Concepts + Patterns & Principles). Direkomendasikan di Class Central (platform kurasi kursus online oleh Dhawal Shah) sebagai salah satu kursus OOAD terbaik yang tersedia gratis. Bisa diaudit tanpa biaya; sertifikat berbayar jika diperlukan.
[EN] [Gratis untuk audit] Video Course
https://www.coursera.org/learn/object-oriented-analysis-and-design-foundations-and-concepts

---

## Fokus Bank-Soal

Analisis dari soal UTS dan UAS 2021/2022:

**UTS 2021/2022 — Pola soal:**

- **CPMK1** (5%): Jelaskan efek positif dan negatif pemanfaatan perangkat lunak dengan 5 kasus nyata. Mudah tapi jangan remehkan — siapkan 5 contoh konkret yang bisa kamu elaborasi.
- **CPMK2**: Faktor kegagalan pengembangan sistem di _tahap analisis_ + cara antisipasi analis sistem + dampak ke tahap programming. Soal ini berulang dan prediktif — hafal minimal 4–5 faktor (komunikasi, incomplete requirements, scope creep, legacy constraint, dll) plus dampaknya ke kode.
- **CPMK3**: Legacy system — pengaruh terhadap pengembangan baru dan migrasi. Pelajari konsep big-bang migration vs incremental/phased migration.
- **CPMK4,5,8** (soal utama, bobot besar): Kasus HRIS terintegrasi — integrasi sistem presensi mobile (fingerprint + GPS) dan tunjangan kesehatan dari provider eksternal. Diminta **menjelaskan DAN menggambarkan solusi** — artinya harus bisa gambar UML (sequence/class/component diagram) untuk alur integrasi API/data. Persiapkan diri untuk menggambar diagram integrasi sistem.

**UAS 2021/2022 — Pola soal (Responsi Praktikum):**

- **CPMK7**: Redesign landing page MovieBox (www.moviebox.co.id) — diminta analisis konten dan layout baru. Ini bukan hanya "gambar wireframe" tapi harus ada **analisis** dulu (identifikasi pain point, target pengguna, konten yang perlu ditonjolkan). Dokumentasikan alasan setiap keputusan desain.
- **CPMK8**: Dokumen SRS singkat berdasarkan hasil redesign. Bukan SRS penuh — tapi harus punya struktur yang benar (purpose, scope, functional requirements dari redesign yang dilakukan).

**Takeaway untuk belajar:**

- Latih menggambar sequence diagram untuk skenario integrasi API (ini berulang di soal sistem SDM).
- Siapkan template SRS singkat yang bisa kamu isi cepat saat ujian/responsi.
- Setiap pertanyaan "jelaskan dan gambarkan" selalu butuh dua bagian — jangan lupa gambarnya.
- Soal UTS bersifat open book, jadi yang diuji bukan hafalan tapi kemampuan _mengaplikasikan_ konsep ke studi kasus baru.

---

## Estimasi Waktu

Asumsi: kamu sudah punya dasar OOP dan pernah lihat UML sekilas.

| Topik                                         | Estimasi    |
| --------------------------------------------- | ----------- |
| SDLC, metodologi, faktor kegagalan sistem     | 3 jam       |
| Legacy system & migrasi                       | 2 jam       |
| OOA — identifikasi aktor, use case, kebutuhan | 3 jam       |
| UML Use Case Diagram                          | 3 jam       |
| UML Class Diagram                             | 4 jam       |
| UML Sequence & Activity Diagram               | 4 jam       |
| ERD / diagram basis data                      | 2 jam       |
| SOLID Principles                              | 2 jam       |
| Design Patterns (8–10 pattern kunci)          | 6 jam       |
| Konsep HCI & prinsip usability                | 2 jam       |
| Wireframing & desain antarmuka                | 4 jam       |
| Dokumen SRS (struktur + latihan tulis)        | 4 jam       |
| Latihan soal bank soal (UTS + UAS)            | 3 jam       |
| **Total**                                     | **~42 jam** |

Kalau masih semester awal atau baru pertama kali lihat UML secara serius, tambahkan 10–15 jam buffer. Prioritaskan UML (Use Case + Class + Sequence) dan SRS karena itu bobot terbesar di ujian dan paling sering muncul di tugas.
