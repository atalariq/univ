# Kapita Selekta — Roadmap Curi Start

## Overview

Kapita Selekta (Capita Selecta) adalah matkul yang formatnya tidak seperti matkul lain: tidak ada silabus baku yang sama tiap tahun. Formatnya biasanya berupa kuliah tamu, seminar industri, atau sesi diskusi panel tentang topik-topik terkini di software engineering. Pembicaranya bisa datang dari industri, akademisi, atau peneliti — dan topiknya mengikuti apa yang sedang _hot_ di dunia SE saat itu.

Karena sifatnya yang variatif inilah, strategi belajarnya berbeda. Kamu tidak bisa "hapal materi" lalu selesai. Yang dibutuhkan adalah:

1. **Literasi tren** — kemampuan membaca arah perkembangan teknologi secara cepat dan kritis.
2. **Fondasi konsep** — pemahaman cukup dalam di beberapa topik inti SE modern, sehingga bisa mengikuti diskusi teknis tanpa lost.
3. **Skill presentasi & komunikasi teknis** — banyak kapsel yang mewajibkan presentasi, makalah, atau review paper.

Roadmap ini disusun dengan asumsi kamu mulai belajar sebelum kuliah dimulai (curi start), bukan di minggu UTS.

---

## Prasyarat

Sebelum masuk ke topik inti, pastikan kamu sudah punya landasan berikut:

- **Pemahaman dasar SDLC** (Software Development Life Cycle) — waterfall, agile, scrum cukup.
- **Konsep dasar rekayasa perangkat lunak** — requirements, design, testing, deployment.
- **Pemrograman umum** — minimal bisa baca kode Python atau JavaScript; tidak perlu ahli, cukup tidak buta.
- **Kemampuan membaca teks Inggris teknis** — mayoritas resource terbaik ada dalam bahasa Inggris.
- **Akun GitHub & Stack Overflow** — bukan prasyarat teknis, tapi kebiasaan aktif di komunitas ini sangat membantu.

Kalau ada yang belum dipenuhi, penuhi dulu sebelum lanjut. Topik inti di bawah akan sulit dicerna tanpa fondasi ini.

---

## Topik Inti (urutan belajar)

Urutan ini disusun dari yang paling fundamental ke yang paling spesifik. Pelajari secara berurutan; jangan loncat langsung ke AI kalau belum tahu apa itu cloud-native.

### 1. Cara Membaca Paper & Laporan Tren SE

Kapita Selekta sering melibatkan paper, artikel industri, atau laporan riset. Kemampuan membaca ini adalah _meta-skill_ yang berguna di semua topik lainnya.

Yang perlu dipelajari:

- Cara baca paper ilmiah: abstract → introduction → conclusion terlebih dahulu, baru detail.
- Cara membedakan klaim riset vs. marketing hype.
- Cara membaca laporan industri (ThoughtWorks Radar, Stack Overflow Survey, CNCF Survey) — pahami metodologi, bukan hanya headline.
- Cara mencatat insight dari paper secara terstruktur (gunakan format: Claim → Evidence → So What).

Latihan konkret: ambil satu laporan dari ThoughtWorks Technology Radar terbaru, baca, lalu buat ringkasan 1 halaman dalam bahasamu sendiri.

### 2. Landscape Software Engineering Modern

Sebelum mendalami satu subtopik, penting punya peta besar dulu. SE modern terbagi ke beberapa domain besar:

- **Frontend & Backend development** — dasar, tapi terus berevolusi.
- **DevOps & Platform Engineering** — dari CI/CD sampai Internal Developer Platforms (IDPs).
- **Cloud-Native** — container, Kubernetes, microservices, serverless.
- **AI/ML Engineering & LLMOps** — bagaimana AI diintegrasikan ke produk software.
- **Security Engineering & DevSecOps** — security bukan lagi urusan tim terpisah.
- **Empirical SE** — riset berbasis data tentang produktivitas, kualitas kode, proses.

Di tahap ini, cukup baca overview masing-masing domain. Tujuannya bukan hafal, tapi punya _mental model_ yang bisa dipakai waktu mendengarkan pembicara tamu.

### 3. AI/LLM dalam Software Engineering

Ini topik yang paling sering muncul di kapsel sejak 2023 dan kemungkinan besar akan terus relevan.

Yang perlu dipahami:

- Apa itu LLM (Large Language Model) dan bagaimana cara kerjanya secara konseptual — tidak perlu detail matematis, cukup tahu transformer, pre-training, fine-tuning.
- AI coding assistants: GitHub Copilot, Cursor, Claude Code — bagaimana mereka mengubah workflow developer.
- Vibe coding: apa itu, peluangnya, dan risikonya (code quality, security, maintainability).
- Retrieval-Augmented Generation (RAG) sebagai pola arsitektur umum untuk LLM apps.
- Agentic systems: AI agents yang bisa melakukan multi-step tasks secara otonom.
- LLMOps: monitoring, evaluasi, dan deployment model LLM di produksi.

Sumber utama baca: Latent Space newsletter/podcast, SE Radio episode tentang LLM apps, ThoughtWorks Radar vol. 33 (November 2025).

### 4. Cloud-Native & DevOps / Platform Engineering

Cloud-native bukan lagi tren — ini sudah menjadi standar industri. 82% pengguna container sudah menggunakan Kubernetes di produksi (CNCF Survey 2025).

Yang perlu dipahami:

- Container (Docker) dan container orchestration (Kubernetes) — konsep, bukan hafal perintah.
- CI/CD pipeline: dari push ke repo sampai deploy ke produksi secara otomatis.
- GitOps: infrastruktur sebagai kode yang dikelola via Git.
- Internal Developer Platform (IDP): platform yang menyatukan tooling developer di satu tempat.
- FinOps: manajemen biaya cloud — penting karena cloud bisa sangat mahal kalau tidak dikontrol.
- Observability: monitoring, logging, tracing sebagai satu kesatuan (bukan hanya "cek apakah server hidup").

CNCF adalah otoritas utama untuk topik ini. Laporan survei tahunan mereka adalah referensi wajib.

### 5. DevSecOps & Security Engineering

Security bukan fitur yang ditambah di akhir — ini prinsip yang harus ada dari awal desain (shift-left security).

Yang perlu dipahami:

- DevSecOps: integrasi security ke dalam pipeline DevOps — SAST, DAST, dependency scanning.
- Supply chain security: ancaman dari dependency pihak ketiga (misal kasus Log4Shell, event-stream).
- Zero-trust architecture: "never trust, always verify" sebagai model keamanan modern.
- AI-generated code dan security: riset menunjukkan AI sering menghasilkan kode dengan kerentanan.
- OWASP Top 10 sebagai baseline — bukan harus hafal semua, tapi harus tahu apa saja.

### 6. Sustainability & Green Software Engineering

Topik yang mulai sering muncul di konferensi SE seperti ICSE dan ASE:

- Dampak lingkungan dari software — konsumsi energi data center, carbon footprint AI training.
- Green Software Foundation: prinsip-prinsip pengembangan software yang efisien energi.
- Software carbon intensity (SCI) sebagai metrik baru.

Ini topik yang membedakan kamu dari kebanyakan mahasiswa yang hanya fokus ke "bisa jalan" tanpa memikirkan biaya lingkungan.

### 7. Empirical Software Engineering

Banyak pembicara di kapsel yang datang dari riset. Pahami dasar-dasarnya agar bisa berdialog:

- Apa itu empirical SE: riset berbasis pengukuran dan data nyata, bukan hanya teori.
- Jenis studi: controlled experiment, case study, survey, mining software repositories.
- Cara mengkritisi klaim riset: sample size, validity, generalizability.
- Conference penting: ICSE (International Conference on Software Engineering), MSR (Mining Software Repositories), ESEM (Empirical Software Engineering and Measurement).

### 8. Skill Presentasi & Komunikasi Teknis

Kapsel hampir selalu ada komponen presentasi. Skill ini sering dianggap remeh tapi sangat menentukan nilai akhir.

Yang perlu dipraktikkan:

- **Struktur presentasi teknis**: problem → why it matters → solution/approach → trade-offs → takeaway.
- **Slide design untuk konten teknis**: satu ide per slide, hindari bullet hell, pakai diagram.
- **Cara menjawab pertanyaan teknis** saat Q&A: kalau tidak tahu, katakan tidak tahu + arah pencariannya.
- **Technical writing**: menulis ringkasan paper, laporan, atau opini teknis dengan jelas dan padat.
- Latihan: record dirimu presentasi 5 menit tentang satu topik dari daftar di atas, tonton ulang, evaluasi.

---

## Resource Kurasi

### Kanonik

Sumber-sumber berikut adalah otoritas di bidangnya — dipakai oleh peneliti, industri, dan komunitas SE global. Gunakan untuk verifikasi klaim, mencari data, atau membaca deep-dive.

| Resource                                                                                                                                                                                                | Deskripsi                                                                                                                                                                | Bahasa | Harga                  | Format      |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------ | ---------------------- | ----------- |
| [ThoughtWorks Technology Radar](https://www.thoughtworks.com/radar)                                                                                                                                     | Snapshot dua kali setahun tentang tools, techniques, platforms, frameworks — dikurasi oleh 22 senior technologist Thoughtworks. Sumber terpercaya untuk tren SE praktis. | [EN]   | Gratis                 | Web/PDF     |
| [Stack Overflow Developer Survey](https://survey.stackoverflow.co/2025)                                                                                                                                 | Survei tahunan terbesar komunitas developer global (49.000+ responden, 177 negara). Data riil tentang bahasa, tools, AI adoption, dan sentimen developer.                | [EN]   | Gratis                 | Web         |
| [CNCF Annual Cloud Native Survey](https://www.cncf.io/reports/the-cncf-annual-cloud-native-survey/)                                                                                                     | Laporan tahunan Cloud Native Computing Foundation tentang adopsi Kubernetes, container, CI/CD, GitOps. Rujukan utama untuk topik cloud-native.                           | [EN]   | Gratis                 | Web/PDF     |
| [ICSE — ACM/IEEE International Conference on Software Engineering](https://conf.researchr.org/home/icse-2025)                                                                                           | Konferensi SE paling prestisius di dunia. Proceedings-nya tersedia di ACM Digital Library. Kalau mau tahu apa yang diteliti para ahli SE, mulai dari sini.               | [EN]   | Gratis (browse)        | Proceedings |
| [ACM Digital Library](https://dl.acm.org/)                                                                                                                                                              | Repository paper ilmiah ACM. Cari paper SE dengan keyword yang relevan. Akses penuh biasanya via institusi (coba login via akun UGM).                                    | [EN]   | Institusi              | Paper       |
| [Gartner Newsroom — Software Engineering Trends](https://www.gartner.com/en/newsroom/press-releases/2025-07-01-gartner-identifies-the-top-strategic-trends-in-software-engineering-for-2025-and-beyond) | Prediksi strategis dari Gartner untuk SE 2025 ke atas. Bukan untuk detail teknis, tapi untuk gambaran arah industri besar.                                               | [EN]   | Gratis (press release) | Artikel     |
| [State of AI Engineering — Datadog](https://www.datadoghq.com/state-of-ai-engineering/)                                                                                                                 | Laporan Datadog tentang adopsi AI di software engineering — berbasis data telemetri produksi nyata.                                                                      | [EN]   | Gratis                 | Web/PDF     |

### Hidden gems (verified by experts)

Resource di bawah ini bukan dari textbook — melainkan newsletter, podcast, dan blog yang direkomendasikan secara eksplisit oleh praktisi dan peneliti SE terkemuka. Masing-masing disertai siapa yang merekomendasikannya.

---

**1. The Pragmatic Engineer — Gergely Orosz**
[newsletter.pragmaticengineer.com](https://newsletter.pragmaticengineer.com/)
[EN] | Berbayar ($15/bulan, ada student discount) | Newsletter (Substack)

Newsletter SE paling dibaca di Substack (#1, 1 juta+ subscriber). Ditulis oleh Gergely Orosz, mantan engineering manager di Uber dan Skype/Microsoft. Terbit dua kali seminggu: Selasa untuk deep-dive teknis/karir, Kamis untuk perkembangan industri Big Tech & startup. Direkomendasikan oleh LinearB Blog ("best software engineering newsletter"), Augment Code, dan masuk dalam daftar rekomendasi SE Radio. ByteByteGo juga direkomendasikan langsung oleh The Pragmatic Engineer. Kalau hanya bisa langganan satu newsletter SE, ini pilihannya.

---

**2. Latent Space: The AI Engineer Podcast — swyx & Alessio Fanelli**
[latent.space](https://www.latent.space/)
[EN] | Gratis | Podcast + Newsletter (Substack)

Podcast #1 untuk AI Engineering, dengan 200.000+ subscriber aktif dan 10 juta+ kumulatif pembaca/pendengar. Di-host oleh swyx (Shawn Wang, mantan AWS & Temporal) dan Alessio Fanelli (partner di Decibel). Fokus murni engineering: foundation models, code generation, AI agents, GPU infra — tanpa debat AI safety yang tidak actionable. Direkomendasikan secara eksplisit oleh Chris Lattner (pembuat LLVM & Swift) sebagai "a wonderful chat diving much deeper into AI infra"; Jordan Schneider (ChinaTalk host) menyebutnya "the best AI podcast around." Andrej Karpathy (mantan Tesla AI & OpenAI) secara publik setuju dengan esai swyx "The Rise of the AI Engineer" yang menjadi asal-muasal podcast ini. Relevan langsung untuk topik AI/LLM in SE.

---

**3. Software Engineering Radio (SE Radio) — IEEE Computer Society**
[se-radio.net](https://se-radio.net/)
[EN] | Gratis | Podcast

Podcast SE tertua dan paling konsisten (sejak 2006), diproduksi oleh IEEE Computer Society dan IEEE Software magazine. Setiap episode (~60 menit) fokus pada satu topik spesifik dengan narasumber ahli — dari LLM apps, internal dev platforms, deterministic simulation testing, sampai Rust. Tidak mengikuti hype cycles; fokus pada substansi teknis jangka panjang. Direkomendasikan oleh LinearB Blog dan Augment Code sebagai "the podcast for professional software developers." Cocok untuk persiapan menghadapi pembicara teknis di kapsel.

---

**4. ByteByteGo Newsletter — Alex Xu**
[blog.bytebytego.com](https://blog.bytebytego.com/)
[EN] | Gratis (sebagian) + Berbayar | Newsletter (Substack) + YouTube

Newsletter system design dengan 1 juta+ subscriber. Ditulis oleh Alex Xu, penulis buku _System Design Interview_ yang menjadi standar referensi di industri. Terkenal dengan diagram yang sangat jelas untuk menjelaskan konsep kompleks (Kafka, Kubernetes, JWT, Redis, database indexing, API design). Direkomendasikan secara eksplisit oleh The Pragmatic Engineer dalam halaman rekomendasi Substacknya ([newsletter.pragmaticengineer.com/recommendations](https://newsletter.pragmaticengineer.com/recommendations)). Berguna untuk membangun mental model sistem sebelum mendengarkan pembicara industri.

---

**5. TLDR Dev Newsletter — Dan Ni**
[tldr.tech/dev](https://tldr.tech/dev)
[EN] | Gratis | Newsletter (Email harian)

Newsletter harian 5 menit untuk software engineers — ringkasan singkat berita terpenting di dunia programming, tools, dan web dev. Ditulis oleh engineers dari Google, Meta, dan perusahaan top lainnya. Jaringan TLDR kini punya 13 edisi dengan 7,2 juta+ total pembaca. Disebut sebagai "fastest daily tech digest" dan masuk tiga besar developer newsletter terbaik 2026 bersama The Pragmatic Engineer dan JavaScript Weekly, menurut Readless.app (review berbasis data open rate & subscriber). Bagus untuk _awareness_ harian supaya tidak ketinggalan isu baru yang mungkin dibahas pembicara tamu.

---

## Fokus Bank-Soal

Belum ada bank-soal untuk matkul ini di repo.

Ini wajar mengingat sifat matkul yang variatif — soal-soal "ujian" (kalau ada) biasanya berupa pertanyaan reflektif, esai pendek, atau review presentasi, bukan soal pilihan ganda dengan jawaban tetap. Fokuskan persiapan pada pemahaman konsep dan kemampuan mengargumentasikan pendapat, bukan menghafal.

---

## Estimasi Waktu

Asumsi: kamu mulai persiapan 4–6 minggu sebelum kuliah pertama, dengan alokasi sekitar 5–8 jam per minggu.

| Topik                                        | Estimasi Waktu                                        |
| -------------------------------------------- | ----------------------------------------------------- |
| Cara membaca paper & laporan tren SE         | 3–4 jam (baca panduan + latihan satu laporan)         |
| Landscape SE modern (overview semua domain)  | 4–6 jam (baca artikel/survey, bukan deep-dive)        |
| AI/LLM dalam Software Engineering            | 6–8 jam (baca + dengarkan 3–4 episode Latent Space)   |
| Cloud-Native & DevOps / Platform Engineering | 5–7 jam (baca CNCF survey + artikel TLDR Dev terkait) |
| DevSecOps & Security Engineering             | 3–4 jam (baca OWASP overview + 1–2 artikel industri)  |
| Sustainability & Green Software              | 2–3 jam (baca Green Software Foundation docs)         |
| Empirical Software Engineering               | 3–4 jam (baca 1–2 paper ICSE overview/keynote)        |
| Skill presentasi & komunikasi teknis         | Ongoing — latihan 1–2 kali/minggu sepanjang semester  |
| **Total persiapan awal**                     | **~26–36 jam (4–6 minggu × 5–8 jam/minggu)**          |

Setelah kuliah dimulai, alokasikan 2–3 jam per sesi untuk membaca background material pembicara sebelum kuliah tamu berlangsung. Ini investasi kecil yang membuat perbedaan besar dalam kualitas diskusi dan kesan yang kamu tinggalkan.
