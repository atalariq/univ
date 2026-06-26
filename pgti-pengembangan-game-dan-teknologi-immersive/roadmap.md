# Pengembangan Game dan Teknologi Immersive — Roadmap Curi Start

## Overview

Mata kuliah ini membahas dua domain besar: **game design** (teori desain, story, karakter, gameplay, GDD, manajemen produksi) dan **teknologi immersive XR** (sejarah AR/VR/MR, perangkat, hingga merancang aplikasi XR secara utuh). Berdasarkan bank soal, course ini lebih berat ke **konsep dan desain** daripada implementasi kode engine — UTS fokus ke game design teori + project GDD, UAS berupa laporan take-home rancangan aplikasi XR.

---

## Prasyarat

Refresh sebelum mulai agar tidak ketinggalan di tengah jalan:

- **Pemrograman & OOP** — paham class, object, inheritance; tidak perlu mahir scripting engine tapi perlu bisa membaca pseudocode dan flowchart interaksi game.
- **Matematika dasar & vektor** — operasi vektor 2D/3D (posisi, arah, dot product) untuk memahami fisika game dan spatial computing di XR.
- **Kemampuan menulis dokumen** — sebagian besar output course ini adalah dokumen (GDD, laporan XR); latih kemampuan menulis terstruktur dari sekarang.

---

## Topik Inti (urutan belajar)

1. **Sejarah & Elemen Game** — pahami definisi permainan, komponen formal game (rules, goals, procedures, conflict, boundary), evolusi platform dari arcade ke mobile/VR, dan klasifikasi genre.

2. **Game Design Fundamentals** — pelajari kerangka desain (lensa desain Schell, formal/dramatic/dynamic systems Fullerton) untuk membedah mengapa sebuah game berhasil atau gagal.

3. **Story & Karakter Design** — kuasai struktur naratif (three-act, hero's journey), character sheet, world-building, dan bagaimana narasi memperkuat imersi player terutama di genre RPG/adventure.

4. **Gameplay Design & Player Experience** — rancang core loop, sistem level, mekanik interaksi, dan feedback loop; pahami konsep flow state Csikszentmihalyi dalam konteks game.

5. **Game Design Document (GDD)** — buat dan baca GDD secara lengkap (concept, story, gameplay mechanics, level design, art/sound direction, tech specs); ini output utama project semester.

6. **Produksi & Manajemen Tim** — pelajari tahap produksi game (pre-production, production, post), pembagian peran tim (designer, programmer, artist, producer), dan manajemen biaya/jadwal.

7. **Dasar-dasar XR: AR, VR, MR** — pelajari sejarah XR (Sensorama, HMD Sutherland, sampai Meta Quest/Apple Vision Pro), spectrum reality Milgram-Kishino, dan perangkat keras (headset, tracker, controller, sensor).

8. **Merancang Aplikasi XR** — latih penulisan laporan desain XR: SWOT teknologi yang dipilih, cara kerja/mekanik aplikasi, matriks desain (interaction matrix, feature-requirement matrix), serta pertimbangan UX khusus XR (motion sickness, spatial UI).

---

## Resource Kurasi

### Kanonik

**Game Design Teori:**

- **The Art of Game Design: A Book of Lenses** — Jesse Schell (3rd ed., Taylor & Francis, 2019)
  Referensi paling komprehensif untuk desain game; mencakup 113 "lensa" desain dari psikologi, arsitektur, narasi, hingga matematika. Dipakai di ratusan program game design universitas.
  [EN] [Berbayar — buku teks]

- **Game Design Workshop: A Playcentric Approach** — Tracy Fullerton (5th ed., CRC Press, 2024)
  Pendekatan hands-on berbasis playtesting; cocok untuk project berbasis dokumen karena bab-babnya persis mengikuti alur dari konsep → prototipe → iterasi → GDD.
  URL: https://www.routledge.com/Game-Design-Workshop/Fullerton/p/book/9781032607009
  [EN] [Berbayar — buku teks]

- **GDC YouTube Channel** — Game Developers Conference
  Arsip ribuan talk dari developer profesional, mencakup game design, narasi, level design, XR, dan production. Ratusan video tersedia gratis.
  URL: https://www.youtube.com/@GDC
  [EN] [Gratis]

**XR / AR / VR:**

- **Extended Reality for Everybody Specialization** — University of Michigan, Coursera (instruktur: Michael Nebeling, Associate Professor U. of Michigan)
  3 course: fondasi XR → desain UX XR → implementasi teknis (WebXR, Unity, Unreal). Bisa diaudit gratis.
  URL: https://www.coursera.org/specializations/extended-reality-for-everybody
  [EN] [Gratis — audit]

- **Unity Learn: Create with VR** — Unity Technologies
  Course resmi Unity untuk membangun aplikasi VR dari nol; mencakup XR Interaction Toolkit, spatial UI, teleportasi, interaksi objek. Tidak butuh headset fisik (pakai XR Device Simulator).
  URL: https://learn.unity.com/course/create-with-vr
  [EN] [Gratis]

- **Godot Engine Official Documentation** — Godot Foundation
  Dokumentasi resmi Godot (engine open-source alternatif Unity); mulai dari "Step by Step" sampai tutorial game 2D/3D pertama. Relevan jika project menggunakan Godot.
  URL: https://docs.godotengine.org/en/stable/
  [EN] [Gratis]

---

### Hidden Gems (verified by experts)

- **A Theory of Fun for Game Design** — Raph Koster (O'Reilly, 2nd ed. 2013)
  Buku tipis (~250 hal.) bergaya komik yang menjelaskan mengapa otak manusia merasa "fun" — intinya: game adalah mesin pembelajaran pola, dan fun muncul dari proses _grokking_ tantangan. Direkomendasikan oleh **Cory Doctorow** (Boing Boing, co-author _Little Brother_): _"Does for games what Understanding Comics did for sequential art"_; dan oleh **Noah Falstein** (freelance game designer, mantan Nintendo/LucasArts): _"I expect this book to become an instant classic."_ Koster sendiri adalah lead designer _Ultima Online_ dan _Star Wars Galaxies_.
  URL: https://www.theoryoffun.com/
  [EN] [Berbayar — buku; ~$20]

- **Game Maker's Toolkit (GMTK)** — Mark Brown (YouTube)
  Channel video esai tentang game design dari jurnalis game & konsultan desain yang pernah bekerja dengan **PlayStation, EA, dan Remedy**. Analisis mendalam tentang core loop, level design, mekanik inovatif, dan aksesibilitas. Episode "How Games Teach You to Play" dan "What Makes a Good Puzzle?" sangat relevan untuk CPMK3.
  URL: https://www.youtube.com/@GMTK
  [EN] [Gratis]

- **GDC Talk: "One-Page Designs"** — Stone Librande (GDC 2010, via GDC Vault)
  Talk 30 menit oleh lead designer Diablo III yang menunjukkan bahwa GDD one-page lebih efektif dari dokumen panjang — lebih cepat diiterasi, lebih mudah dikomunikasikan ke tim. Relevan langsung untuk tugas GDD di CPMK4.
  Direkomendasikan oleh situs **gamedesignthinking.com** sebagai satu dari 5 GDC talk terbaik untuk game designer.
  URL: https://gdcvault.com/play/1012356/One-Page
  [EN] [Gratis — sebagian video GDC Vault gratis tanpa login]

---

## Fokus Bank-Soal

Analisis dari dua soal (UTS 2024/2025 dan UAS 2024/2025):

**Engine yang Terdeteksi:**
Tidak ada engine spesifik yang disebut di soal ujian — course ini tidak menguji scripting atau koding engine. Namun CPMK6 (merancang aplikasi XR) mengimplikasikan Unity sebagai platform yang paling mungkin dipakai di praktikum, mengingat dosen pengampu (Airlangga Adi Hermawan) dan ketersediaan Unity XR Interaction Toolkit serta kursus Unity Learn resmi.

**UTS — Titik Berat:**

| No. | CPMK  | Nilai | Fokus Soal                                                                                                                               |
| --- | ----- | ----- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | CPMK1 | 15    | Definisi dan **tujuan permainan** — hafal dan mengerti konsep dari perspektif formal (goals, rules, conflict)                            |
| 2   | CPMK2 | 35    | **Nama game + cerita + genre + karakter** dari project yang sudah dibuat sepanjang semester — ini terbesar, siapkan GDD-mu               |
| 3   | CPMK3 | 30    | **Faktor keberhasilan game selain narasi** — tahu bahwa gameplay mechanics, audio/visual feedback, pacing, dan monetization juga krusial |
| 4   | CPMK4 | 20    | **Peran anggota tim** + peer assessment berdasarkan kontribusi — pahami pipeline produksi & roles                                        |

Catatan: UTS bersifat **Open Book** — bawa GDD project dan catatan tentang elemen game.

**UAS — Titik Berat:**

| No. | CPMK  | Nilai | Fokus Soal                                                                                                           |
| --- | ----- | ----- | -------------------------------------------------------------------------------------------------------------------- |
| 1   | CPMK5 | 25    | **Teknologi AR/VR yang sudah ada** (bab pendahuluan + tinjauan pustaka laporan XR) — sejarah, jenis, perangkat keras |
| 2   | CPMK6 | 75    | **Rancangan aplikasi XR** dalam format laporan: SWOT, cara kerja game/aplikasi, dan **matriks desain**               |

Catatan: UAS bersifat **Take Home** — ada waktu lebih, tapi kualitas tulisan dan kedalaman analisis yang dinilai. "Matriks yang digunakan" kemungkinan merujuk ke **interaction design matrix** atau **feature-requirement matrix** — cek referensi dari dosen.

**Pola Kritis:**

- Course ini project-based — soal CPMK2 UTS secara eksplisit merujuk "narasi yang pernah dibuat." Mulai GDD sejak awal semester, jangan nunggu dekat ujian.
- CPMK6 senilai 75% dari UAS — laporan XR adalah output terbesar dan terberat secara bobot.
- Koneksi antara UTS dan UAS: UTS membangun GDD (game project), UAS membangun laporan XR (teknologi immersive) — dua track paralel dari awal.

---

## Estimasi Waktu

| Topik                                                          | Estimasi Jam |
| -------------------------------------------------------------- | ------------ |
| Sejarah & Elemen Game                                          | 3 jam        |
| Game Design Fundamentals (Schell lenses, Fullerton frameworks) | 6 jam        |
| Story & Karakter Design                                        | 4 jam        |
| Gameplay Design & Player Experience                            | 5 jam        |
| Game Design Document (GDD) — baca contoh + bikin draft         | 6 jam        |
| Produksi & Manajemen Tim                                       | 3 jam        |
| Dasar-dasar XR: AR/VR/MR (teori + sejarah + hardware)          | 5 jam        |
| Merancang Aplikasi XR (SWOT, mekanik, matriks desain)          | 8 jam        |
| Latihan soal + review bank soal                                | 3 jam        |
| **Total**                                                      | **~43 jam**  |

Kalau waktu terbatas, prioritaskan: **GDD project (CPMK2 UTS 35%)** dan **laporan rancangan XR (CPMK6 UAS 75%)** — keduanya adalah output paling berat di ujian.
