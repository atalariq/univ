# Proyek Aplikasi Dasar 2 — Roadmap Curi Start

## Overview

PAD2 adalah lanjutan langsung dari PAD1, naik level ke proyek yang lebih kompleks: scope lebih besar, tim lebih terstruktur, penerapan SDLC penuh dari requirements sampai deployment, dan integrasi lintas teknologi (web + mobile + database + API). Kalau di PAD1 kamu bikin aplikasi sendiri atau berdua, di PAD2 kamu akan bekerja dalam tim — artinya koordinasi, pembagian kerja, dan version control yang benar menjadi krusial.

## Prasyarat

Refresh ini sebelum mulai, bukan belajar dari nol:

- **PAD1 selesai** — portfolio proyek sederhana sudah ada, pahami ulang keputusan teknologi yang dipakai
- **Web/mobile dasar** — HTML/CSS/JS atau framework yang dipakai di PAD1 (Laravel, Django, React, Flutter, dll.), pastikan masih ingat alurnya
- **Basis data** — SQL dasar, relasi antar tabel (one-to-many, many-to-many), ORM dasar; bisa buat skema dari kebutuhan fungsional
- **Git** — sudah bisa commit, branch, merge; kalau belum pernah resolve conflict atau bikin pull request, langsung latihan sekarang

## Topik Inti (urutan belajar)

1. **Scoping proyek yang lebih besar** — belajar mendefinisikan MVP vs full feature, menulis user story dan acceptance criteria yang jelas supaya tim tidak muter-muter di tengah sprint.
2. **Arsitektur aplikasi multi-tier** — pahami pemisahan lapisan (presentasi, logika bisnis, data), kenali pola MVC dan layered architecture sebelum mulai koding.
3. **Kolaborasi tim & Git workflow** — pilih dan terapkan branching strategy (GitHub Flow atau GitFlow), atur conventional commits, dan biasakan pull request + code review sejak hari pertama.
4. **Implementasi multi-tier** — bangun backend API, frontend, dan database secara bertahap dalam satu proyek terpadu; pastikan setiap layer bisa dikerjakan paralel oleh anggota tim yang berbeda.
5. **Integrasi API** — konsumsi third-party API (payment gateway, map, notifikasi) dan rancang REST API sendiri dengan desain endpoint yang konsisten dan autentikasi JWT.
6. **Testing** — tulis unit test dan integration test sejak awal, bukan di akhir; pahami coverage dan cara isolasi dependency dengan mock.
7. **Deployment** — containerisasi aplikasi dengan Docker Compose, deploy ke platform cloud (Railway, Render, VPS), dan otomasi build/test dengan GitHub Actions CI/CD dasar.
8. **Dokumentasi & demo** — tulis README yang menjelaskan cara setup dan run proyek, dokumentasikan API (Swagger/OpenAPI), dan siapkan demo yang bisa dijalankan dari laptop siapapun.

## Resource Kurasi

### Kanonik

**1. Full Stack Open — University of Helsinki**

- URL: <https://fullstackopen.com/en/>
- Format: online course, project-based, bersertifikat ECTS
- [EN] [Gratis]
- Kurikulum universitas yang mengajarkan React, Node.js, REST API, TypeScript, testing (Jest, Playwright, Cypress), CI/CD, dan containerisasi Docker dalam satu program terpadu. Bagian 11 (CI/CD) dan bagian 12 (Docker) sangat relevan untuk PAD2.

**2. The Odin Project**

- URL: <https://www.theodinproject.com/>
- Format: online curriculum open source, project-based
- [EN] [Gratis]
- Kurikulum full-stack yang pendekatannya "bangun proyek dulu, pahami teori sambil jalan." Cocok sebagai latihan tambahan, terutama bagian NodeJS dan deployment.

**3. Atlassian Git Tutorials: Comparing Workflows**

- URL: <https://www.atlassian.com/git/tutorials/comparing-workflows>
- Format: seri artikel teknis
- [EN] [Gratis]
- Penjelasan lengkap GitFlow, Feature Branch, GitHub Flow, dan Trunk-Based Development — termasuk trade-off tiap strategi untuk ukuran tim dan release cycle yang berbeda.

**4. Docker Official Workshop: Get Started**

- URL: <https://docs.docker.com/get-started/workshop/>
- Format: guided tutorial resmi
- [EN] [Gratis]
- Tutorial resmi Docker mulai dari containerize app sederhana, Docker Compose multi-container, sampai panduan deploy ke production. Sumber utama sebelum pakai Docker di proyek.

**5. roadmap.sh — Backend Developer & Full Stack Roadmap**

- URL: <https://roadmap.sh/backend> dan <https://roadmap.sh/full-stack>
- Format: peta visual interaktif
- [EN] [Gratis]
- Peta belajar yang diverifikasi komunitas — bagus untuk audit diri: apa yang sudah dikuasai, apa yang masih perlu dipelajari sebelum mulai proyek. Proyek ke-6 di GitHub dengan ratusan ribu star.

**6. Modern Full-Stack React Projects — Daniel Bugl (Packt, 2023)**

- URL: <https://www.packtpub.com/en-us/product/modern-full-stack-react-projects-9781837637954>
- Format: buku teknis
- [EN] [Berbayar]
- Membangun dua proyek nyata (blog app + chat app) dengan stack MERN, termasuk unit test, end-to-end test, dan deployment. Cocok sebagai referensi ketika bingung cara menyusun proyek multi-tier.

---

### Hidden gems (verified by experts)

**1. Architecture Patterns with Python ("Cosmic Python") — Harry Percival & Bob Gregory (O'Reilly, 2020)**

- URL (gratis online): <https://www.cosmicpython.com/>
- Format: buku (gratis online CC BY-NC-ND, juga tersedia cetak)
- [EN] [Gratis (online) / Berbayar (O'Reilly/cetak)]
- Direkomendasikan oleh: **Kevin Scott (CTO Microsoft)** — _"This book should be required reading for software engineers."_ Juga dibahas komunitas engineers di Hacker News: <https://news.ycombinator.com/item?id=43501989>
- Isinya: cara menyusun aplikasi yang testable dan maintainable — Repository pattern, Service layer, Domain-Driven Design (DDD), dan event-driven architecture dalam Python idiomatis. Kelihatannya berat, tapi dua bab pertama saja sudah cukup untuk mengubah cara kamu menyusun kode proyek tim.

**2. Hussein Nasser — Backend Engineering (YouTube)**

- URL: <https://www.youtube.com/@hnasr>
- Format: YouTube channel
- [EN] [Gratis]
- Direkomendasikan oleh: **MasteringBackend blog** (<https://blog.masteringbackend.com/top-5-backend-development-you-tube-channels>) dan diindeks **Class Central** sebagai kursus backend engineering berkualitas. Hussein Nasser adalah ex-engineer Uber.
- Bedanya dengan tutorial biasa: dia menjelaskan _kenapa_ suatu desain dipilih di level production — HTTP internals, database connection pooling, trade-off arsitektur API. Kalau mau bikin REST API yang bukan sekadar CRUD, tonton dulu seri Backend Engineering-nya.

**3. The Architecture of Open Source Applications (AOSA)**

- URL: <https://aosabook.org/en/index.html>
- Format: buku kumpulan esai (gratis online, Creative Commons)
- [EN] [Gratis]
- Direkomendasikan di **Hacker News Ask HN thread "Which are the best resources to learn software architecture?"** (<https://news.ycombinator.com/item?id=22202769>) oleh komunitas engineers — _"has good case studies to read."_
- Esai-esai dari orang yang membangun Git, Nginx, Firefox, dan proyek besar lainnya — menjelaskan keputusan arsitektur yang mereka buat, dan kenapa. Tidak perlu dibaca habis; pilih proyek yang mirip dengan yang akan kamu bangun, baca satu esai, lalu bawa wawasannya ke diskusi arsitektur tim.

## Fokus Bank-Soal

Belum ada bank-soal untuk matkul ini di repo.

## Estimasi Waktu

Total estimasi untuk "curi start" sebelum/awal semester: **45–65 jam**

| Topik                                      | Estimasi  |
| ------------------------------------------ | --------- |
| Scoping & user story                       | 3–4 jam   |
| Arsitektur multi-tier                      | 5–8 jam   |
| Git workflow tim (baca + latihan)          | 4–6 jam   |
| Implementasi multi-tier (praktik langsung) | 15–20 jam |
| REST API design & integrasi                | 6–8 jam   |
| Testing dasar (unit + integration)         | 5–8 jam   |
| Docker + deployment + CI/CD                | 5–8 jam   |
| Dokumentasi & demo                         | 3–4 jam   |

Estimasi di atas mengasumsikan kamu sudah punya dasar dari PAD1. Prioritaskan Git workflow tim dan Docker lebih dulu — keduanya paling sering jadi bottleneck di proyek kelompok.
