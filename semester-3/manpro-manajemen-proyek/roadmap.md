# Manajemen Proyek — Roadmap Curi Start

## Overview

Mata kuliah ini membangun kemampuan merancang, menjadwalkan, dan mengendalikan proyek pengembangan perangkat lunak secara end-to-end — dari inisiasi sampai closing. Framework utamanya adalah PMBOK (PMI), dengan pengenalan Agile/Scrum sebagai metodologi alternatif yang makin dominan di industri. Soal ujian di prodi ini selalu berbasis studi kasus proyek fiktif, jadi kamu harus bisa **menulis dokumen nyata** (charter, WBS, network diagram, risk register), bukan sekadar hafal definisi.

---

## Prasyarat

- Pemahaman dasar siklus hidup pengembangan perangkat lunak (SDLC) — sudah cukup dari mata kuliah RPL
- Bisa membaca dan membuat diagram sederhana (bagan, tabel)
- Tidak ada prasyarat matematika tinggi; CPM/PERT hanya butuh aritmetika

---

## Topik Inti (urutan belajar)

1. **Dasar-dasar Manajemen Proyek** — Triple constraint (scope, time, cost), definisi proyek vs operasi, dan mengapa proyek IT sering gagal.
2. **Organisasi & Daur Hidup Proyek** — Tiga tipe struktur organisasi (fungsional, projektikal, matriks) dan model project life cycle yang sesuai tiap tipe.
3. **Process Groups PMBOK** — Lima kelompok proses (Initiating → Planning → Executing → Monitoring & Controlling → Closing) beserta aktivitas kunci di tiap tahap.
4. **Manajemen Inisiasi & Metodologi** — Menyusun Project Charter dan Project Requirement Document (PRD); memilih dan mempertahankan metodologi (waterfall vs Agile) sesuai karakteristik proyek.
5. **Manajemen Scope** — Membuat Scope Statement (in-scope, out-of-scope, deliverables, exclusions) dan menyusun WBS (Work Breakdown Structure) yang lengkap dan terstruktur.
6. **Manajemen Waktu / Scheduling** — Urutan kerja: WBS → activity list → dependency → Gantt chart → network diagram → hitung forward/backward pass → tentukan lintasan kritis (CPM) → estimasi durasi dengan PERT (optimistik/pesimistik/most likely).
7. **Manajemen Biaya** — Mengidentifikasi komponen biaya proyek TI (SDM, infrastruktur, lisensi, pelatihan, kontingensi) dan menyusun cost baseline.
8. **Manajemen Risiko** — Empat langkah: risk identification → qualitative/quantitative assessment → risk response planning (avoid, transfer, mitigate, accept untuk risiko negatif; exploit, share, enhance, accept untuk risiko positif) → monitoring.
9. **Manajemen Kualitas & Stakeholder** — Quality plan dan acceptance criteria; stakeholder register dan strategi komunikasi.
10. **Agile Project Management (Scrum)** — Roles (Product Owner, Scrum Master, Dev Team), artifacts (Product Backlog, Sprint Backlog, Increment), ceremonies (Sprint Planning, Daily Scrum, Review, Retrospective); kapan Scrum lebih tepat dari waterfall.

---

## Resource Kurasi

### Kanonik

- **Schwalbe, Kathy — _Information Technology Project Management_, 9th ed.**
  [EN] [Berbayar] — Cengage Learning
  Textbook standar untuk ITPM; satu-satunya buku yang secara eksplisit menerapkan semua 10 knowledge area PMBOK ke konteks proyek IT. Bab-babnya selaras langsung dengan CPMK mata kuliah ini. Versi lama (7th/8th ed.) bisa ditemukan di Internet Archive.

  > https://www.cengage.com/c/information-technology-project-management-9e-schwalbe/9781337101356/

- **PMI — _A Guide to the Project Management Body of Knowledge (PMBOK Guide)_, 7th ed. (2021)**
  [EN] [Gratis untuk member PMI ($139/tahun) / Berbayar untuk umum]
  Standar industri global; edisi ke-7 beralih dari process-based ke principles-based (12 prinsip, 8 performance domains). Untuk keperluan kuliah, edisi ke-6 (berbasis knowledge area) kadang lebih mudah dipetakan ke silabus dosen.

  > https://www.pmi.org/standards/pmbok

- **Google Project Management Professional Certificate — Coursera**
  [EN] [Gratis audit / Berbayar untuk sertifikat]
  6-course series dari Google; mencakup foundations, scheduling, Agile/Scrum, stakeholder management, dan project closure. Cocok sebagai pelengkap visual dan latihan template nyata. Audit gratis: klik "Enroll for Free" → pilih "Audit".
  > https://www.coursera.org/professional-certificates/google-project-management

---

### Hidden gems (verified by experts)

- **Rebel's Guide to Project Management — Elizabeth Harrin, FAPM**
  [EN] [Gratis] — Blog + free template library
  Blog aktif sejak 2006 oleh Elizabeth Harrin, Fellow of the Association for Project Management (APM) UK. Artikel praktis, langsung ke poin, dengan template gratis (charter, risk log, lessons learned). Sangat bagus untuk memahami "bagaimana PM benar-benar bekerja" di luar teori buku.
  Rekomendasi: ProjectManager.com memasukkan Harrin dalam daftar _"18 Most Influential People in Project Management"_-nya.

  > https://rebelsguidetopm.com/

- **OnlinePMCourses — Mike Clayton, PhD (YouTube Channel)**
  [EN] [Gratis] — 650+ video, 2 upload/minggu
  Dr. Mike Clayton, mantan Management Consultant Deloitte 12 tahun, kini full-time educator dan penulis 15 buku PM. Channel-nya mencakup semua topik inti (Gantt, CPM, risk, Agile) dalam format pendek yang padat. Playlist "Project Management Fundamentals" adalah titik masuk terbaik.
  Rekomendasi: Elizabeth Harrin (FAPM) menulis review positif di Rebel's Guide to PM: _"content is comprehensive and delivered with Mike's trademark straight talking."_

  > https://www.youtube.com/c/OnlinePMCourses

- **The Digital Project Manager (DPM)**
  [EN] [Gratis] — Artikel & guides teknikal mendalam
  Resource yang secara khusus bagus untuk artikel teknikal seperti CPM vs PERT, cara membaca network diagram, dan perbandingan metodologi. Artikelnya di-cite oleh komunitas PM global dan lebih mudah dibaca daripada white paper PMI.
  Rekomendasi: DPG (Development and People Group) memasukkan DPM dalam daftar _"8 Best PM Blogs You Should Be Following"_-nya (dpglearn.co.uk).
  > https://thedigitalprojectmanager.com/

---

## Fokus Bank-Soal

Berdasarkan analisis 3 soal ujian (UAS 2024/2025 — Ahmad Iwan Fadli; UAS 2021/2022 & UTS 2020/2021 — Dr. Sigit Priyanta):

**Format soal konsisten:** selalu ada studi kasus proyek fiktif (sistem perpustakaan, absensi QR, proyek yang kamu usulkan sendiri), lalu diminta membuat dokumen atau diagram nyata. Bukan soal pilihan ganda — murni essay dan praktik.

**Topik yang muncul di SEMUA soal (wajib kuasai penuh):**

| Topik           | Bentuk Soal                                | Tips                                                                                                        |
| --------------- | ------------------------------------------ | ----------------------------------------------------------------------------------------------------------- |
| Project Charter | Tulis dari awal untuk proyek fiktif        | Hafal komponen wajib: nama proyek, tujuan, deliverables, sponsor, stakeholder, timeline kasar, budget kasar |
| WBS             | Buat WBS untuk proyek yang diberikan       | Minimal 3 level; pastikan 100% rule terpenuhi                                                               |
| Scope Statement | Tulis in-scope, out-of-scope, deliverables | Gunakan format: objectives → deliverables → exclusions → assumptions → constraints                          |
| Risk Management | Identifikasi risiko + strategi respons     | Siapkan contoh risiko positif DAN negatif; sebut strateginya (mitigate, accept, dll)                        |
| Metodologi      | Pilih waterfall/Agile/Scrum + beri alasan  | Justify berdasarkan karakteristik proyek (durasi, kejelasan requirement, tim)                               |

**Topik yang muncul di 2 soal (kuasai setelah yang atas):**

| Topik                              | Catatan                                                                                                        |
| ---------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Network Diagram + CPM              | Gambar network diagram dari WBS → hitung forward pass, backward pass → tentukan lintasan kritis → hitung float |
| Process Groups (5 proses PMBOK)    | Jelaskan aktivitas di tiap fase dengan contoh dari proyek yang diberikan                                       |
| Project Requirement Document (PRD) | Biasanya digabung dengan Charter di satu soal                                                                  |

**Topik yang muncul 1 soal (pelajari jangan skip):**

- Komponen biaya proyek TI (SDM, infrastruktur, lisensi, training, kontingensi) — UAS 2024/2025
- Tipe organisasi proyek (fungsional, projektikal, matriks) — UTS 2020/2021
- Scrum: artifacts + ceremonies + roles — UTS 2020/2021

**Pola soal CPM yang sering bikin salah:** network diagram-nya harus digambar _dari WBS yang kamu buat sendiri di soal sebelumnya_, bukan dari template. Pastikan dependency antar aktivitas logis — reviewers memperhatikan konsistensinya.

---

## Estimasi Waktu

| Sesi      | Topik                                                     | Jam         |
| --------- | --------------------------------------------------------- | ----------- |
| 1         | Dasar manpro + tipe organisasi + project lifecycle        | 3           |
| 2         | Process Groups PMBOK (5 proses)                           | 3           |
| 3         | Inisiasi: Project Charter + PRD + pilih metodologi        | 4           |
| 4         | Scope: Scope Statement + WBS (latihan buat untuk 2 kasus) | 5           |
| 5         | Scheduling: Gantt + network diagram + CPM + PERT          | 6           |
| 6         | Cost: komponen biaya + cost estimation                    | 3           |
| 7         | Risk: identifikasi + respons positif & negatif            | 4           |
| 8         | Quality + Stakeholder management                          | 2           |
| 9         | Agile/Scrum end-to-end                                    | 4           |
| 10        | Latihan soal bank soal + simulasi tulis dokumen lengkap   | 6           |
| **Total** |                                                           | **~40 jam** |

Prioritas jika waktu terbatas: selesaikan sesi 3–5 dan 7 dulu — topik-topik itu muncul di semua soal dan bobotnya paling besar.
