# Proyek Aplikasi Dasar 1 — Roadmap Curi Start

## Overview

PAD 1 adalah matkul berbasis proyek di D-IV TRPL SV UGM — mahasiswa membangun aplikasi (umumnya berkelompok) dengan menerapkan siklus rekayasa perangkat lunak lengkap, dari requirements hingga demo. Nilai utama matkul ini bukan hanya kode yang jalan, tapi **proses**: bagaimana tim berkolaborasi, merencanakan, dan mendokumentasikan pekerjaan secara terstruktur.

---

## Prasyarat

Refresh materi dari semester 1–2 sebelum mulai proyek:

- **Pemrograman (OOP)** — class, inheritance, method overriding, encapsulation; pastikan semua anggota tim bisa baca dan tulis kode OOP dengan nyaman.
- **Basis Data** — ER diagram, normalisasi (1NF–3NF), SQL dasar: `SELECT … JOIN`, `INSERT`, `UPDATE`, `DELETE`; kalau belum lancar JOIN, ini akan jadi bottleneck.
- **Web** — HTTP request-response cycle, konsep client-server, HTML/CSS dasar, sedikit JavaScript atau framework yang akan dipakai.
- **Tools** — Terminal/CLI, IDE (VS Code / IntelliJ), package manager bahasa yang dipilih (`npm`, `composer`, `pip`, `maven`, dll.).

---

## Topik Inti (urutan belajar)

1. **Scoping Ide** — Tetapkan domain problem, batasan fitur yang realistis dalam 1 semester, dan deliverable akhir yang bisa didemonstrasikan; scope creep adalah penyebab utama proyek semester gagal selesai.
2. **Requirements Engineering** — Elicit kebutuhan dari "klien" (dosen/brief matkul), tulis use case atau user stories, dan pisahkan kebutuhan fungsional vs non-fungsional secara eksplisit.
3. **Desain Sistem** — Gambar ERD, diagram use case, dan wireframe/mockup antarmuka _sebelum_ menulis satu baris kode; desain yang buruk di sini mahal untuk diubah nanti.
4. **Setup Repo & Kolaborasi Git** — Init repo di GitHub/GitLab, tetapkan branch strategy (minimal: `main`, `develop`, feature branches), sepakati konvensi commit dari hari pertama, dan setup `.gitignore` yang benar.
5. **Implementasi (Pilih Stack)** — Pilih stack yang paling familiar di tim dan sesuai scope; hindari memakai teknologi baru yang belum pernah disentuh anggota manapun karena kurva belajarnya akan memakan waktu proyek.
6. **Testing** — Tulis test case untuk alur bisnis kritis (approval, transaksi); manual testing minimal happy path + edge case yang mewakili skenario nyata.
7. **Demo & Dokumentasi** — Siapkan slide demo yang fokus pada fitur utama, README yang bisa dibaca orang lain tanpa penjelasan tambahan, dan dokumentasi singkat modul/API sesuai kebutuhan dosen.

---

## Resource Kurasi

### Kanonik

- **Pro Git** — Scott Chacon & Ben Straub (Apress). Referensi Git paling komprehensif dan tersedia gratis online; Chapters 1–5 sudah cukup untuk semua kebutuhan kolaborasi tim. [EN][Gratis]
  → <https://git-scm.com/book/en/v2>

- **Software Requirements, 3rd Ed.** — Karl Wiegers & Joy Beatty (Microsoft Press). Panduan requirements engineering klasik yang notation-agnostic: cara elicit, dokumentasikan, prioritaskan, dan manage perubahan requirement di proyek nyata. [EN][Berbayar]
  → <https://www.microsoftpressstore.com/store/software-requirements-9780735679665>

- **The Pragmatic Programmer, 20th Anniversary Ed.** — Andrew Hunt & David Thomas (Pragmatic Bookshelf). Fondasi berpikir sebagai software engineer profesional: DRY, broken windows theory, pragmatic automation; banyak kampus menjadikannya buku wajib. [EN][Berbayar]
  → <https://pragprog.com/titles/tpp20/the-pragmatic-programmer-20th-anniversary-edition/>

---

### Hidden gems (verified by experts)

- **The Missing Semester of Your CS Education — Version Control (Git)** — Dibuat dan diajarkan oleh instruktur MIT: Anish Athalye, Jon Gjengset, dan Jose Javier Gonzalez Ortiz. Ini bukan tutorial Git biasa — kursus ini mengajarkan model data Git dari bawah ke atas (DAG, blob, tree, commit) sehingga kamu paham _kenapa_ perintah-perintah Git bekerja seperti itu, bukan sekadar hafal command. Pro Git secara eksplisit direkomendasikan di sini sebagai bacaan lanjutan. [EN][Gratis]
  → <https://missing.csail.mit.edu/2020/version-control/>

- **Dicoding — Belajar Dasar Git dengan GitHub** — Kursus Git berbahasa Indonesia yang dikurasi oleh Dicoding (mitra resmi Google Developer). Cocok untuk onboarding cepat anggota tim yang belum familiar Git; ada latihan kolaborasi tim langsung di platform. [ID][Gratis]
  → <https://www.dicoding.com/academies/317>

- **Conventional Commits** — Spesifikasi format commit message yang diadopsi oleh tim Angular (Google) dan dipakai di proyek-proyek besar seperti Vue.js dan React. Format `type(scope): description` ini kecil usahanya tapi dampaknya besar: riwayat repo jadi mudah dibaca, changelog bisa digenerate otomatis, dan review PR lebih cepat. Wajib sepakati di tim dari sprint pertama. [EN][Gratis]
  → <https://www.conventionalcommits.org/en/v1.0.0/>

- **Trunk-Based Development** — Dikelola oleh Paul Hammant; diadvokasi oleh Thoughtworks Technology Radar (ring _Adopt_ selama beberapa edisi) dan Martin Fowler (artikel _FeatureBranch_). Situs ini mendokumentasikan mengapa long-lived feature branches menyebabkan merge hell, dan bagaimana tim kecil bisa berkolaborasi dengan branch yang hidup dalam hitungan jam, bukan minggu. Relevan banget untuk tim proyek semester yang sering kena merge conflict parah. [EN][Gratis]
  → <https://trunkbaseddevelopment.com/>

---

## Fokus Bank-Soal

Berdasarkan analisis UTS TA 2021/2022 (SVPL214307, dosen: Fitriansyah/Dinar):

Seluruh ujian terdiri dari **satu soal besar bernilai 100** dengan konteks sistem inventori (4 role: Staff, Supervisor, Manager, Direktur). Sub-pertanyaan yang diuji:

- **Workflow approval** adalah inti ujian — tiga pola yang harus dikuasai:
  - _Paralel_: semua pihak yang diperlukan harus approve, urutan bebas.
  - _Hirarki (sequential)_: approval harus berurutan ketat; level berikutnya tidak bisa approve sebelum level sebelumnya selesai.
  - _Substitusi_: satu pihak wajib, sisanya cukup salah satu (OR logic).
    Pelajari notasi flowchart sederhana atau BPMN — gambar jelas, label tiap state dan transisi.

- **Struktur tim** — pembagian peran dalam tim pengembangan (frontend, backend, DBA, PM, tester); bukan hanya menyebut nama role tapi juga tanggung jawab per role terkait sistem yang dibangun.

- **Timeplan detail** — breakdown modul dari master hingga transaksi dengan estimasi durasi per modul; format Gantt chart atau tabel milestone+durasi keduanya diterima, tapi harus _detail_ dan masuk akal.

- **ERD untuk proses approval** — bukan ERD seluruh sistem, hanya entitas terkait approval: siapa yang mengajukan, siapa yang menyetujui, kapan, dengan status apa; perhatikan kardinalitas dan atribut yang relevan.

- Semua sub-soal berasal dari **satu kasus domain** — pahami domain problem-nya dulu secara menyeluruh sebelum menjawab sub-bagian manapun.

---

## Estimasi Waktu

| Fase      | Kegiatan                                       | Estimasi       |
| --------- | ---------------------------------------------- | -------------- |
| 1         | Scoping & requirements gathering               | 4–6 jam        |
| 2         | Desain (ERD, use case, wireframe)              | 6–10 jam       |
| 3         | Setup repo, git workflow, onboarding tim       | 2–3 jam        |
| 4         | Implementasi (bergantung scope & jumlah modul) | 30–60 jam      |
| 5         | Testing & bug fixing                           | 4–8 jam        |
| 6         | Demo prep & dokumentasi                        | 3–5 jam        |
| **Total** |                                                | **~50–90 jam** |

> Estimasi per orang dalam tim. Proyek 4–5 orang dengan scope wajar: target selesai dalam 8–10 minggu dengan ~8–10 jam/minggu/orang.
