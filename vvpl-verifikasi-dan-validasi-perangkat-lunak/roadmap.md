# Verifikasi dan Validasi Perangkat Lunak — Roadmap Curi Start

## Overview

Mata kuliah ini membahas teknik dan metode untuk memastikan perangkat lunak bekerja sesuai spesifikasi (verification) dan benar-benar memenuhi kebutuhan pengguna (validation). Kamu akan mempelajari cara mendesain test case secara sistematis dengan pendekatan black-box dan white-box, menganalisis kualitas kode melalui static testing, serta mengelola proses pengujian dari unit testing hingga acceptance testing dalam siklus pengembangan perangkat lunak.

---

## Prasyarat

Refresh materi ini sebelum masuk ke topik inti:

- **Pemrograman dasar** (sem 1–2): paham alur kontrol — kondisi `if/else`, loop, fungsi, dan rekursi. Dibutuhkan untuk memahami path/coverage testing dan menulis unit test.
- **Logika Boolean & Matematika Diskrit** (sem 2–3): operator AND/OR/NOT, truth table. Dibutuhkan langsung di decision table testing dan cyclomatic complexity.
- **Software Engineering basics** (sem 2–3): SDLC (Waterfall, Agile), requirement, diagram UML sederhana (use case, activity). Dibutuhkan untuk memahami posisi V&V dalam proses pengembangan.
- **Pemrograman Berorientasi Objek** (sem 2–3): paham class, method, dependency. Dibutuhkan untuk memahami unit testing dan mocking.

---

## Topik Inti (urutan belajar)

Urutan ini disusun dari konsep paling abstrak ke paling teknis — jangan lompat-lompat.

1. **Konsep dasar V&V** — perbedaan verification vs validation, definisi error/fault/failure, dan kenapa kualitas perangkat lunak itu susah.
2. **Static vs Dynamic Testing** — static = analisis tanpa menjalankan kode; dynamic = eksekusi nyata; tahu kapan pakai masing-masing.
3. **Reviews & Inspections** — walkthrough, technical review, formal inspection (Fagan method); ini adalah static testing yang sering diremehkan tapi sangat efektif.
4. **Dasar-dasar test design** — test case, test suite, test oracle, test coverage sebagai ukuran seberapa "dalam" pengujian kamu.
5. **Black-box: Equivalence Partitioning (EP)** — bagi domain input ke kelas-kelas ekuivalen supaya tidak menulis test case redundan.
6. **Black-box: Boundary Value Analysis (BVA)** — kebanyakan bug muncul di batas partisi; teknik ini melengkapi EP secara langsung.
7. **Black-box: Decision Table Testing** — untuk input dengan kombinasi kondisi Boolean; sangat efektif untuk business logic yang kompleks.
8. **Black-box: State Transition Testing** — untuk sistem yang punya state/state machine (login flow, e-commerce checkout, dsb.).
9. **White-box: Statement, Branch, dan Path Coverage** — ukur seberapa banyak kode yang "tersentuh" oleh test suite kamu.
10. **White-box: Cyclomatic Complexity** — cara hitung kompleksitas logika kode (McCabe); digunakan untuk menentukan jumlah minimum test case untuk basis path testing.
11. **Unit Testing** — teknik isolasi dan pengujian modul terkecil; paham konsep mocking/stubbing.
12. **Integration Testing** — strategi top-down, bottom-up, big-bang, dan sandwich/hybrid; kapan dan kenapa pilih masing-masing.
13. **System Testing & Acceptance Testing** — functional dan non-functional testing, alpha/beta testing, User Acceptance Testing (UAT).
14. **Test Management** — test plan, test report, defect lifecycle, traceability matrix; menghubungkan test case ke requirement.
15. **Software Quality Assurance (SQA)** — SQA vs testing, process audit, standar kualitas (ISO/IEC 25010), quality metrics.

---

## Resource Kurasi

### Kanonik

Ini resource yang paling sering dijadikan referensi di kelas dan industri — mulai dari sini.

- **ISTQB CTFL Syllabus v4.0.1** — International Software Testing Qualifications Board.
  Referensi terminologi dan konsep standar industri global. PDF bisa diunduh gratis langsung dari situs resmi. Baca sebagai "peta" topik sebelum masuk ke buku.
  [EN] [Gratis] [PDF]
  <https://istqb.org/certifications/certified-tester-foundation-level-ctfl-v4-0/>

- **The Art of Software Testing, 3rd ed.** — Glenford J. Myers, Corey Sandler, Tom Badgett. Wiley, 2011.
  Buku klasik yang pertama kali mempopulerkan test design thinking. Singkat (256 hal) tapi padat — bab tentang black-box dan white-box design masih relevan.
  [EN] [Berbayar] [Buku]

- **Lessons Learned in Software Testing: A Context-Driven Approach** — Cem Kaner, James Bach, Bret Pettichord. Wiley, 2001.
  293 pelajaran praktis dari tiga veteran dengan total 50+ tahun pengalaman. Bukan buku teks kering — ditulis dalam format "tip + penjelasan" yang mudah dicerna.
  [EN] [Berbayar] [Buku]

- **Software Testing: A Craftsman's Approach, 5th ed.** — Paul C. Jorgensen & Byron DeVries. CRC Press.
  Paling lengkap untuk coverage teknis: black-box, white-box, path testing, hingga OO testing. Dilengkapi contoh kode konkret. Cocok sebagai textbook utama.
  [EN] [Berbayar] [Buku]

---

### Hidden gems (verified by experts)

Resource di bawah ini kurang terkenal di kalangan mahasiswa Indonesia, tapi direkomendasikan secara eksplisit oleh komunitas dan pakar pengujian.

- **BBST® Open Course Materials** — Cem Kaner & Rebecca Fiedler. Association for Software Testing (AST).
  Video lecture + slides gratis, lisensi Creative Commons Attribution. Dikembangkan dengan dana NSF (National Science Foundation) AS dan direkomendasikan oleh AST sebagai alternatif ISTQB yang lebih mengutamakan pemahaman konseptual daripada hafalan. Tersedia empat topik: Foundations, Bug Advocacy, Test Design, dan Exploratory Testing. Cocok untuk belajar mandiri setelah baca ISTQB syllabus.
  [EN] [Gratis] [Video + Slides]
  <https://bbst.courses/videos/>

- **DevelopSense Blog** — Michael Bolton.
  Michael Bolton adalah co-creator Rapid Software Testing (RST) bersama James Bach, dan dinobatkan BrowserStack sebagai #IconsOfQuality. Blognya berisi artikel mendalam tentang testing philosophy, perbedaan "checking vs testing", defect reporting, dan exploratory testing — topik yang hampir tidak pernah muncul di buku teks tapi sering keluar dalam diskusi akademis dan wawancara industri.
  [EN] [Gratis] [Blog]
  <https://developsense.com/blog>

- **Satisfice.com — James Bach**
  James Bach adalah co-author _Lessons Learned in Software Testing_ dan salah satu praktisi yang paling vokal soal test strategy dan exploratory testing. Situs ini berisi artikel, presentasi, dan materi RST yang memberi perspektif "kenapa" di balik teknik yang kamu pelajari di kelas.
  [EN] [Gratis (materi dasar)] [Artikel + Slides]
  <https://www.satisfice.com>

---

## Fokus Bank-Soal

Belum ada bank-soal untuk matkul ini di repo.

---

## Estimasi Waktu

| Fase              | Kegiatan                                                              | Estimasi       |
| ----------------- | --------------------------------------------------------------------- | -------------- |
| Orientasi         | Baca ISTQB syllabus, highlight topik utama                            | 6–8 jam        |
| Fondasi V&V       | Topik 1–4 (konsep dasar, static/dynamic, reviews, test design basics) | 8–10 jam       |
| Test Design       | Topik 5–10 (black-box + white-box techniques + cyclomatic complexity) | 14–18 jam      |
| Testing Lifecycle | Topik 11–13 (unit, integration, system, acceptance)                   | 8–10 jam       |
| Management & QA   | Topik 14–15 (test management, SQA)                                    | 5–7 jam        |
| Review & latihan  | Baca ulang, rangkum, kerjakan soal latihan ISTQB                      | 8–10 jam       |
| **Total**         |                                                                       | **~50–60 jam** |

Untuk curi start minimum (sebelum UTS misalnya): fokus ke topik 1–10 dulu, estimasi **30–35 jam**.
