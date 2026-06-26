# Metodologi Penelitian — Roadmap Curi Start

## Overview

Mata kuliah ini mengajarkan cara merancang dan melaksanakan penelitian di bidang rekayasa perangkat lunak — dari identifikasi masalah, studi literatur, pemilihan metode, sampai penulisan laporan ilmiah. Ini bukan mata kuliah hafalan; ujian selalu berbasis praktik tulis (parafrasa referensi, daftar pustaka IEEE, menulis abstrak, analisis kritis laporan). Semua yang kamu pelajari di sini langsung dipakai di Proyek Akhir.

---

## Prasyarat

- **Bahasa Indonesia & penulisan ilmiah** — kemampuan menulis paragraf koheren dan melakukan parafrasa; meski terdengar sepele, soal UTS 40% bobotnya ada di sini
- **Statistika dasar** — rata-rata, standar deviasi, dan cara membaca hasil kuesioner; tidak perlu uji statistik lanjutan untuk UTS/UAS, tapi muncul di soal analisis data UAS
- **Membaca teks bahasa Inggris** — sebagian besar jurnal dan buku referensi berbahasa Inggris; tidak perlu fasih, asal bisa memahami abstrak dan metodologi sebuah paper

---

## Topik Inti (urutan belajar)

1. **Hakikat penelitian** — definisi penelitian ilmiah, karakteristiknya, dan perbedaan tujuan penelitian **vokasi (terapan)** vs akademik/sarjana (teoritik).
2. **Jenis-jenis penelitian** — kuantitatif, kualitatif, mixed methods, R&D; plus jenis khusus SE: eksperimen, studi kasus, survei, action research.
3. **Proses penelitian & identifikasi masalah** — gap analysis, cara menemukan novelty, perumusan masalah dan pertanyaan penelitian (research question).
4. **Elemen bagian pendahuluan** — fungsi dan struktur masing-masing: latar belakang, rumusan masalah, pertanyaan penelitian, tujuan, manfaat, batasan penelitian.
5. **Literature review vs Systematic Literature Review (SLR)** — perbedaan mendasar, protokol SLR (planning–conducting–reporting), strategi pencarian, kriteria inklusi/eksklusi, PRISMA flowchart.
6. **Menulis tinjauan pustaka** — teknik sintesis dan parafrasa, membangun paragraf koheren dari beberapa sumber, menghindari plagiarisme.
7. **Sitasi dan gaya referensi** — IEEE style (in-text `[1]`, daftar pustaka terurut kemunculan); APA style sebagai pembanding; cara menyusun entri untuk jurnal, konferensi, dan buku.
8. **Metode pengumpulan data** — kuesioner (skala Likert), wawancara, observasi, eksperimen; kapan masing-masing dipakai.
9. **Instrumen penelitian** — validitas isi dan konstruk, reliabilitas (Cronbach's alpha), desain kuesioner yang benar, pilot testing.
10. **Analisis data kuantitatif** — statistik deskriptif, interpretasi hasil kuesioner, membaca tabel hasil dengan kritis.
11. **Analisis data kualitatif** — open/axial coding, kategorisasi, thematic analysis.
12. **Penulisan karya ilmiah** — struktur IMRaD (Introduction–Methods–Results–Discussion), komponen abstrak, penulisan diskusi dan kesimpulan.
13. **Etika penelitian** — integritas data, plagiarisme vs parafrasa vs kutipan langsung, self-plagiarism, fabrication & falsification.

---

## Resource Kurasi

### Kanonik

- **Sugiyono — _Metode Penelitian Kuantitatif, Kualitatif, dan R&D_**
  [ID] [Berbayar] — Alfabeta, Bandung (edisi 2019/2022)
  Referensi wajib metopen Indonesia; mencakup tiga paradigma penelitian beserta instrumen dan analisis datanya. Menjadi acuan utama bagi dosen dan juri sidang di lingkup perguruan tinggi Indonesia. Tersedia di perpustakaan kampus.

- **Creswell, J. W. & Creswell, J. D. — _Research Design: Qualitative, Quantitative, and Mixed Methods Approaches_, 6th ed.**
  [EN] [Berbayar] — SAGE Publications
  Standar internasional untuk desain penelitian; bab-babnya urut sesuai alur membuat proposal: pertanyaan penelitian → review literatur → teori → metode. Bab 5 (Introduction) dan Bab 2 (Literature Review) sangat relevan untuk soal UTS.

  > https://collegepublishing.sagepub.com/products/research-design-6-270550

- **Zobel, Justin — _Writing for Computer Science_, 3rd ed.**
  [EN] [Berbayar] — Springer
  Panduan menulis ilmiah yang dirancang khusus untuk peneliti CS/SE: cara menyusun argumen, menulis algoritma, membuat grafik/tabel, menulis review, sampai menyusun tesis. Ini bukan buku "cara menulis umum" — semua contohnya dari paper CS nyata.

  > https://link.springer.com/book/10.1007/978-1-4471-6639-9

- **Kitchenham, B. & Charters, S. — _Guidelines for Performing Systematic Literature Reviews in Software Engineering_ (EBSE Technical Report EBSE-2007-01)**
  [EN] [Gratis] — Keele University & Durham University, 2007
  Dokumen foundational yang membawa metodologi SLR dari dunia medis ke SE. Tiga fase (planning, conducting, reporting) yang dipakai di seluruh dunia — dan yang dirujuk saat dosen membahas SLR di kuliah ini.

  > https://www.researchgate.net/publication/258968007

---

### Hidden gems (verified by experts)

- **Romi Satria Wahono — "Systematic Literature Review: Pengantar, Tahapan dan Studi Kasus"**
  [ID] [Gratis] — romisatriawahono.net, 2016
  Panduan SLR berbahasa Indonesia paling lengkap dan paling banyak dikutip di lingkup peneliti Indonesia. Wahono adalah Ph.D. Software Engineering (Saitama University, Japan; Universiti Teknikal Malaysia Melaka), founder IlmuKomputer.Com, mantan peneliti LIPI — bukan sekadar blogger. Artikel ini mencakup framework PICOC, protokol pencarian, quality assessment, dan studi kasus dari penelitian defect prediction milik Wahono sendiri. Jika kamu kesulitan memahami SLR dari paper Kitchenham yang padat, mulai dari sini dulu.
  _Direkomendasikan oleh: dijadikan referensi resmi di modul kuliah Research Methodology beberapa PT negeri, dan tercantum di silabus kuliah RM Wahono sendiri di romisatriawahono.net/rm/_

  > https://romisatriawahono.net/2016/05/15/systematic-literature-review-pengantar-tahapan-dan-studi-kasus/

- **Simon Peyton Jones — "How to Write a Great Research Paper" (slides + video)**
  [EN] [Gratis] — Microsoft Research Cambridge
  Presentasi 7 prinsip menulis paper penelitian oleh Principal Researcher Microsoft (GHC, Haskell). Bukan tentang grammar — tentang **cara berpikir** saat menulis: mengidentifikasi kontribusi utama, menyusun narasi, menulis untuk pembaca bukan untuk diri sendiri. Berlaku penuh untuk skripsi dan proposal proyek akhir.
  _Direkomendasikan oleh: Matt Might (Professor CS, University of Utah; kini di NIH) dalam daftar kuratnya "Books and Papers Every Graduate Student Should Read" — matt.might.net/articles/books-papers-materials-for-graduate-students/_

  > https://simon.peytonjones.org/great-research-paper/
  > Video (34 menit): https://www.microsoft.com/en-us/research/video/phd-how-to-write-a-great-research-paper/

- **Serge Demeyer — "Tutorial: Research Methods in Computer Science" (PDF slides)**
  [EN] [Gratis] — Universiteit Antwerpen
  Materi kuliah PhD yang sudah dipresentasikan di ASE 2010, ICSM 2011, Ulster University 2022, dan GRASCOMP 2024 — bukan bahan kelas biasa. Mencakup taksonomi metode penelitian di CS (feasibility study, case study, comparative study, literature survey), cara menulis paper yang layak review, dan simulasi program committee. Sangat bagus untuk memahami bagaimana tipe-tipe penelitian SE dibedakan secara konseptual.
  _Direkomendasikan oleh: materi ini dipakai di PhD school SE internasional; disebut dalam ResearchGate discussion "Which are good books on research methodology for computer science students?" sebagai resource yang sering direkomendasikan supervisor ke doktorand_

  > https://win.uantwerpen.be/~sdemey/Tutorial_ResearchMethods/

---

## Fokus Bank-Soal

Berdasarkan analisis **UTS 2024/2025** (10 April 2025) dan **UAS 2024/2025** (12 Juni 2025), keduanya dosen: **Divi Galih Prasetyo Putri, Ph.D.** — kode MK SVPL214703.

**Format soal:** essay uraian terbuka, sifat catatan terbuka (_open book_). Tidak ada pilihan ganda. Soal selalu kontekstual dan berbasis praktik tulis — kamu diminta _menghasilkan_ teks atau menganalisis teks orang lain, bukan mendefinisikan istilah.

---

**Topik dengan bobot tertinggi (prioritas utama):**

| Topik                                   | Ujian     | Bobot               | Bentuk soal konkret                                                                      |
| --------------------------------------- | --------- | ------------------- | ---------------------------------------------------------------------------------------- |
| **IEEE referencing style**              | UTS CPMK3 | 40%                 | Diberikan metadata 3 referensi → tulis 1 paragraf tinjauan pustaka + daftar pustaka IEEE |
| **Menulis abstrak**                     | UAS CPMK5 | 55% (dibagi 2 soal) | Dari proposal proyek akhir milikmu sendiri                                               |
| **Rumusan masalah & metode evaluasi**   | UAS CPMK5 | 55% (dibagi 2 soal) | Dari proposal proyek akhir milikmu sendiri                                               |
| **Critical reading laporan penelitian** | UAS CPMK4 | 25%                 | Diberikan teks laporan hasil kuesioner → temukan ≥3 kekurangan metodologis               |
| **Elemen pendahuluan & fungsinya**      | UTS CPMK2 | 25%                 | Sebutkan dan jelaskan fungsi elemen-elemen di bagian pendahuluan                         |

**Topik pendukung (tetap keluar, jangan skip):**

| Topik                          | Ujian     | Bobot | Tips                                                                       |
| ------------------------------ | --------- | ----- | -------------------------------------------------------------------------- |
| SLR untuk identifikasi masalah | UTS CPMK2 | 20%   | Jelaskan _mekanisme_ bagaimana SLR membantu menemukan gap penelitian       |
| Jenis-jenis metode penelitian  | UAS CPMK4 | 20%   | Minimal kuantitatif, kualitatif, mixed, R&D — bonus jika sebut SE-specific |
| Vokasi vs akademik/sarjana     | UTS CPMK1 | 15%   | Tekankan: vokasi = terapan/practical, akademik = teoritis/generalisasi     |

---

**Pola soal yang perlu diwaspadai:**

- **UTS killer:** Soal CPMK3 (40%) memberimu metadata lengkap 3 referensi dan teks asli dalam bahasa Indonesia. Kamu harus: (1) menulis satu paragraf tinjauan pustaka yang _koheren_ menggunakan teknik parafrasa — bukan tempel kutipan langsung, (2) membuat daftar pustaka dengan format IEEE yang benar. Latihannya: ambil 3 paper acak, tulis paragraf sintesis, lalu buat daftar pustakanya.
- **UAS killer:** Soal CPMK5 (55%) langsung menggunakan _proposal proyek akhir yang sudah kamu buat di luar ujian_. Artinya kualitas jawaban di UAS sangat bergantung pada seberapa matang proposalmu jauh sebelum ujian. Jangan datang ke UAS dengan proposal yang masih kasar.
- **Soal critical reading (UAS CPMK4, 25%):** Berdasarkan contoh soal, diberikan teks laporan yang mengandung klaim berlebihan ("pasti akan sukses"), generalisasi dari data kecil, dan bias dalam interpretasi. Latih diri untuk membaca kritis: apakah klaim didukung data? Apakah ukuran sampel cukup? Apakah ada bias konfirmasi?

---

## Estimasi Waktu

| Sesi      | Topik                                                                              | Jam         |
| --------- | ---------------------------------------------------------------------------------- | ----------- |
| 1         | Hakikat penelitian + jenis-jenis + perbedaan vokasi vs sarjana                     | 2           |
| 2         | Proses penelitian, gap analysis, identifikasi masalah, pertanyaan penelitian       | 3           |
| 3         | Elemen bagian pendahuluan: struktur + fungsi masing-masing                         | 2           |
| 4         | SLR: protokol, PICOC, strategi pencarian, inklusi/eksklusi, PRISMA                 | 4           |
| 5         | Menulis tinjauan pustaka: sintesis, parafrasa, koherensi paragraf (latihan aktif)  | 4           |
| 6         | IEEE style: format jurnal, konferensi, buku; latihan buat daftar pustaka           | 3           |
| 7         | Jenis metode penelitian SE: eksperimen, studi kasus, survei, R&D                   | 3           |
| 8         | Instrumen & pengumpulan data: kuesioner Likert, validitas, reliabilitas            | 3           |
| 9         | Analisis data + latihan critical reading laporan penelitian                        | 3           |
| 10        | Penulisan artikel: IMRaD, komponen abstrak, kesimpulan                             | 3           |
| 11        | Etika penelitian: plagiarisme, parafrasa, integritas data                          | 1           |
| 12        | Simulasi: tulis tinjauan pustaka + IEEE dari soal UTS; perbaiki proposal + abstrak | 5           |
| **Total** |                                                                                    | **~36 jam** |

Prioritas jika waktu mepet: selesaikan sesi 5–6 (parafrasa + IEEE) dan sesi 10 (abstrak + IMRaD) dulu — bobotnya 55% di UAS dan 40% di UTS. Pastikan proposal proyek akhirmu sudah punya rumusan masalah yang jelas sebelum masuk sesi 12.
