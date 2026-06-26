# Metode dan Model Pengembangan Perangkat Lunak — Roadmap Curi Start

## Overview

Matkul ini membahas berbagai pendekatan dan kerangka kerja dalam membangun perangkat lunak secara terstruktur — mulai dari model sekuensial klasik (Waterfall) hingga metodologi iteratif modern (Agile, Scrum, XP, Kanban). Penting karena kamu akan paham _kapan dan mengapa_ memilih satu metode di atas yang lain, plus bisa menerapkannya di proyek nyata maupun capstone.

---

## Prasyarat

Refresh dulu hal-hal ini sebelum mulai semester:

- **Logika pemrograman & flowchart** — diperlukan untuk soal cyclomatic complexity (flow graph, jalur independen); kalau lupa baca ulang materi Algoritma & Pemrograman sem 1.
- **DFD dan Context Diagram** — sering muncul di soal desain sistem; pastikan paham notasi proses, entitas, dan alur data dari materi Sistem Informasi atau RPL dasar.
- **Konsep SDLC dasar** — tahu bahwa software punya siklus hidup (requirements → design → implementation → testing → maintenance) sebelum belajar variasi modelnya.

---

## Topik Inti (urutan belajar)

Urutan ini dari fondasi ke lanjutan — jangan lompat ke Scrum sebelum paham kenapa Waterfall tidak cukup.

1. **Software Process & SDLC** — konsep dasar siklus hidup perangkat lunak dan alasan diperlukannya proses yang terstruktur.
2. **Model Waterfall** — model sekuensial paling klasik; pelajari fase-fasenya, kelebihan, dan _mengapa_ ia kaku terhadap perubahan requirement.
3. **Model Prototyping** — pendekatan iteratif awal; fokus pada pembuatan _rough prototype_ untuk klarifikasi kebutuhan pengguna.
4. **Model RAD (Rapid Application Development)** — versi Waterfall yang dipercepat dengan komponen reuse; cocok untuk proyek dengan tenggat ketat.
5. **Model Incremental** — pengiriman software bertahap dalam increment; bedakan dengan Iterative.
6. **Model Spiral** — model berbasis manajemen risiko; pahami 4 kuadran dan kapan Spiral dipilih vs Waterfall.
7. **Perbandingan antar-model** — latihan tabel komparasi (sifat proyek, keuntungan, kekurangan) adalah soal UTS paling konsisten.
8. **Agile Manifesto** — 4 values dan 12 principles; baca langsung dari sumber aslinya di agilemanifesto.org. Ini fondasi semua yang ada di bawah.
9. **Extreme Programming (XP)** — practices seperti pair programming, TDD, continuous integration; kenali cara XP mengatasi bug dan miskomunikasi tim.
10. **Scrum Framework** — roles (Product Owner, Scrum Master, Dev Team), events (Sprint, Planning, Review, Retrospective), artifacts (Backlog, Burndown Chart).
11. **Scrum Values** — Commitment, Courage, Focus, Openness, Respect; hafal + bisa kasih contoh konkret.
12. **Sprint Planning** — siapa yang bertanggung jawab (Product Owner dominan dalam menentukan prioritas backlog), alur aktivitas lengkap.
13. **Burndown Chart & Kanban WIP Limit** — baca grafik Burndown, analisis situasi tim dalam 1 sprint; pahami logika membatasi Work in Progress di Kanban.
14. **Cyclomatic Complexity & White Box Testing** — hitung V(G), gambar flow graph, tentukan jalur independen, dan desain test case; ini soal hitungan paling teknis di ujian.
15. **User Acceptance Testing (Input–Proses–Output)** — pengujian dari sisi pengguna; pahami apa yang diuji di tiap layer.

---

## Resource Kurasi

### Kanonik

- **Roger S. Pressman & Bruce R. Maxim — _Software Engineering: A Practitioner's Approach_, 9th Ed.** (McGraw-Hill)
  Buku teks utama yang paling komprehensif di bidang ini. Mencakup semua model proses, Agile, testing (termasuk cyclomatic complexity), dan project management. Versi lama (7th/8th ed.) masih relevan dan banyak tersedia.
  [EN] [Berbayar] Buku cetak/digital

- **Ian Sommerville — _Software Engineering_, 10th Ed.** (Pearson)
  Pelengkap ideal Pressman; penjelasan lebih ringkas dan mudah dibaca. Baik untuk memahami model proses dan dependable systems.
  [EN] [Berbayar] Buku cetak/digital

### Hidden gems (verified by experts)

- **Henrik Kniberg — _Scrum and XP from the Trenches_, 2nd Ed.** (InfoQ, GRATIS)
  Kniberg adalah konsultan Agile di Spotify dan LEGO yang dikenal luas di komunitas praktisi. Buku ini direkomendasikan langsung oleh **Scrum.org** dalam daftar resmi "30 Books for Scrum Masters" mereka, dan muncul di virtually semua awesome-list Agile terkurasi. Bukan teori — ini laporan dari dalam: 40-orang tim, 1 tahun eksperimen nyata Scrum + XP. Cocok banget untuk memahami Sprint Planning, Burndown Chart, dan pair programming dari sudut pandang yang dipakai.
  URL: https://www.infoq.com/minibooks/scrum-xp-from-the-trenches-2/
  [EN] [Gratis] PDF/ebook

- **Manifesto for Agile Software Development — agilemanifesto.org** (GRATIS)
  Dokumen asli 2001 yang ditulis 17 praktisi software (termasuk Kent Beck, Martin Fowler, Ken Schwaber). Sumber primer untuk soal "jelaskan Agile Manifesto dan keuntungannya" — jangan belajar dari ringkasan orang lain kalau bisa baca aslinya dalam 2 menit.
  URL: https://agilemanifesto.org/ dan https://agilemanifesto.org/principles.html
  [EN] [Gratis] Web

- **Martin Fowler — _Agile Software Guide_ (martinfowler.com)** (GRATIS)
  Fowler adalah Chief Scientist di ThoughtWorks dan salah satu penandatangan Agile Manifesto 2001. Halaman agile guide-nya di martinfowler.com mengumpulkan artikel-artikel praktisi tentang Agile, XP, continuous integration, dan technical practices yang mendasari Agile. Direkomendasikan di komunitas ThoughtWorks dan sering dirujuk dosen-dosen SE internasional.
  URL: https://martinfowler.com/agile.html
  [EN] [Gratis] Web/artikel

- **The Scrum Guide — scrumguides.org** (GRATIS)
  Ditulis langsung oleh **Ken Schwaber dan Jeff Sutherland**, co-creators Scrum. Ini definisi resmi dan otoritatif framework Scrum — roles, events, artifacts, rules. Tersedia dalam bahasa Indonesia. Untuk soal Sprint Planning, Scrum Values, dan Burndown Chart, ini sumber paling akurat karena langsung dari pembuatnya. Versi terbaru: 2020.
  URL: https://scrumguides.org/
  [ID/EN] [Gratis] PDF/Web

---

## Fokus Bank-Soal

Berdasarkan analisis tiga soal ujian (UTS 21/22, UAS 21/22, UAS 24/25):

**Hampir pasti keluar (muncul di 2-3 ujian):**

- **Agile Manifesto** — jelaskan 4 values & keuntungannya, atau kaitkan dengan era disrupsi. Muncul di semua ujian.
- **Scrum Framework detail** — Scrum Values (+ contoh), Sprint Planning (siapa bertanggung jawab = Product Owner, alur aktivitasnya), dan Burndown Chart (baca grafik, analisis situasi tim).
- **Perbandingan model** — tabel atau esai perbandingan Waterfall vs Prototyping vs RAD vs Incremental vs Spiral vs Agile dari sisi sifat proyek, keuntungan, kekurangan. Soal UTS klasik.

**Sering keluar (muncul di 1-2 ujian):**

- **XP (Extreme Programming)** — pair programming sebagai solusi bug/miskomunikasi/kode buruk. Muncul di UAS 21/22 (implisit) dan UAS 24/25 (eksplisit).
- **Kanban & WIP Limit** — analisis manfaat dan tantangan membatasi Work in Progress; muncul di UAS 24/25.
- **Cyclomatic Complexity** — gambar flow graph dari potongan kode, hitung V(G) = E − N + 2P, tentukan jalur independen, desain test case. Soal hitungan teknis; muncul di UAS 21/22.
- **User Testing (Input–Proses–Output)** — uraikan apa yang diuji di tiap layer untuk sistem nyata.

**Soal desain sistem (variasi):**

- Model Prototyping + rough sketch navigasi sistem (UTS 21/22).
- Pemilihan model untuk kasus tertentu + User Requirement + Context Diagram + DFD Level 0 (UTS 21/22).

**Strategi belajar:**
Kuasai Agile Manifesto + Scrum Framework (terutama Sprint Planning dan Burndown Chart) lebih dalam dari yang lain — kedua topik ini berulang lintas tahun dan lintas dosen. Cyclomatic complexity butuh latihan hitungan, jangan skip.

---

## Estimasi Waktu

Untuk _head start_ yang solid sebelum semester dimulai atau sebelum UTS:

| Blok   | Topik                                                       | Estimasi |
| ------ | ----------------------------------------------------------- | -------- |
| Blok 1 | SDLC dasar + Waterfall + Prototyping + RAD                  | 3–4 jam  |
| Blok 2 | Incremental + Spiral + latihan tabel perbandingan model     | 2–3 jam  |
| Blok 3 | Agile Manifesto (baca aslinya) + karakteristik + keuntungan | 1–2 jam  |
| Blok 4 | XP practices (pair programming, TDD, CI)                    | 2 jam    |
| Blok 5 | Scrum: roles, events, artifacts, Scrum Values               | 3–4 jam  |
| Blok 6 | Sprint Planning detail + Burndown Chart + Kanban WIP Limit  | 2 jam    |
| Blok 7 | Cyclomatic Complexity: teori + latihan soal hitung          | 2–3 jam  |
| Blok 8 | User Testing + Context Diagram + DFD Level 0                | 2 jam    |

**Total: sekitar 17–22 jam** untuk head start yang benar-benar solid — atau sekitar 1 minggu jika dikerjakan 3 jam/hari.

Prioritaskan Blok 3–6 jika waktu terbatas; itu yang paling sering keluar di ujian.
