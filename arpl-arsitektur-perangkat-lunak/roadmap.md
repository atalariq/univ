# Arsitektur Perangkat Lunak — Roadmap Curi Start

## Overview

Matkul ini membahas bagaimana sebuah sistem perangkat lunak dibentuk secara keseluruhan — mulai dari pemilihan gaya arsitektur (layered, microservices, event-driven), pemodelan kualitas sistem (_quality attributes_), dokumentasi desain, hingga evaluasi arsitektur secara sistematis menggunakan metode seperti ATAM. Ini adalah jembatan antara "menulis kode yang benar" dan "membangun sistem yang skalabel, maintainable, dan bisa dirawat jangka panjang."

## Prasyarat

- **OOP** — encapsulation, inheritance, polymorphism; kalau belum solid, pelajari ulang dulu
- **UML dasar** — class diagram, sequence diagram, use case diagram
- **Design patterns dasar** — minimal tahu MVC, Factory, Observer, dan prinsip SOLID (dari matkul ADPL/MMPL)
- **Rekayasa Kebutuhan** — pahami bedanya _functional_ dan _non-functional requirements_; non-functional requirement adalah cikal bakal _quality attributes_ di matkul ini
- **Pengalaman ngoding aplikasi nyata** — minimal 1 proyek kecil dengan lebih dari 1 layer/module

## Topik Inti (urutan belajar)

1. **Definisi arsitektur perangkat lunak** — apa yang dimaksud arsitektur, bedanya dengan desain detail, dan peran seorang arsitek di tim
2. **Quality attributes / karakteristik arsitektur** — _-ilities_ seperti availability, scalability, maintainability, performance, security, dan bagaimana mengidentifikasinya dari kebutuhan bisnis
3. **Architectural style: Layered (n-tier) dan Client-Server** — gaya paling umum, fondasi sebelum belajar yang lain, pahami coupling antar layer
4. **MVC dan variannya (MVP, MVVM)** — arsitektur presentasi yang paling sering ditemui di web dan mobile, serta kapan masing-masing cocok dipakai
5. **Service-Oriented Architecture (SOA)** — konsep dekomposisi layanan sebagai jembatan menuju microservices
6. **Microservices architecture** — cara memecah sistem, komunikasi antar layanan, dan tradeoff nyata yang ditanggung (network latency, distributed data, operasional complexity)
7. **Event-driven architecture** — event vs message, message broker, perbedaan _choreography_ dan _orchestration_
8. **Architectural views: model 4+1 (Kruchten)** — logical, development, process, physical view + scenarios; cara merepresentasikan arsitektur dari sudut pandang berbeda untuk stakeholder berbeda
9. **Desain dan dokumentasi arsitektur** — Architectural Decision Records (ADRs), C4 model (Simon Brown), arc42; cara mendokumentasikan _keputusan_ bukan hanya strukturnya
10. **Evaluasi arsitektur: ATAM** — langkah-langkah ATAM, utility tree, sensitivity point, tradeoff point, dan risk; cara menilai arsitektur secara sistematis sebelum dibangun
11. **Trade-off analysis** — bagaimana meningkatkan satu quality attribute bisa mengorbankan yang lain; latihan membuat keputusan arsitektur dengan justifikasi yang jelas

## Resource Kurasi

### Kanonik

- **"Software Architecture in Practice" (4th ed.)** — Len Bass, Paul Clements, Rick Kazman (Addison-Wesley/SEI)
  [EN] [Berbayar] Buku — buku teks standar akademik untuk matkul ini; bagus untuk quality attributes dan penjelasan ATAM yang paling lengkap

- **"Fundamentals of Software Architecture: An Engineering Approach"** — Mark Richards & Neal Ford (O'Reilly, 2020)
  [EN] [Berbayar] Buku — modern dan komprehensif; covers architectural characteristics, patterns, component design, hingga soft skills arsitek; ada 2nd edition (2025)

- **"Patterns of Enterprise Application Architecture"** — Martin Fowler (Addison-Wesley, 2002)
  [EN] [Berbayar] Buku — referensi klasik untuk patterns: MVC, layered, dan 40+ enterprise patterns dengan contoh kode; masih relevan sampai sekarang

- **Coursera: "Software Architecture"** — University of Alberta
  [EN] [Gratis/audit] MOOC — <https://www.coursera.org/learn/software-architecture>; bagus karena capstone project-nya mengerjakan ATAM secara langsung pada aplikasi Android nyata; bisa di-_audit_ gratis

### Hidden gems (verified by experts)

- **"Software Architecture Monday"** — Mark Richards (developertoarchitect.com)
  [EN] [Gratis] Video series — <https://www.developertoarchitect.com/lessons/>
  220+ video singkat (~15 menit/episode) yang terbit bulanan sejak 2018; tiap episode fokus ke satu topik spesifik seperti microservices data patterns, ADRs, atau architectural coupling. Direkomendasikan oleh **Alex Xu (ByteByteGo)** dalam _EP151: 24 Good Resources to Learn Software Architecture_: <https://blog.bytebytego.com/p/ep151-24-good-resources-to-learn>. Bagus untuk membangun _breadth_ sambil belajar, satu video per hari.

- **arc42 template** — Peter Hruschka & Gernot Starke
  [EN] [Gratis] Website + Template — <https://arc42.org/>
  Template open-source untuk dokumentasi arsitektur dengan 12 seksi terstruktur; dipakai luas di industri Eropa dan menjadi basis pelatihan sertifikasi **iSAQB CPSA-F** (sertifikasi arsitek internasional). Masuk daftar kurasi **simskij/awesome-software-architecture** di GitHub: <https://github.com/simskij/awesome-software-architecture>. Berguna saat harus mendokumentasikan arsitektur di tugas/proyek akhir.

- **"Software Architecture Patterns" (free O'Reilly report)** — Mark Richards (O'Reilly, 2015)
  [EN] [Gratis] PDF — <https://archive.org/details/software-architecture-patterns_202205>
  Laporan ~50 halaman yang membahas 5 pola utama (layered, event-driven, microkernel, microservices, space-based) lengkap dengan scorecard tradeoff per pola. Dulunya dijual O'Reilly, kini tersedia gratis di Internet Archive. Direkomendasikan di komunitas **mehdihadeli/awesome-software-architecture**: <https://github.com/mehdihadeli/awesome-software-architecture>. Cocok dibaca di awal semester sebagai orientasi cepat sebelum masuk buku tebal.

- **C4 model** — Simon Brown
  [EN] [Gratis] Website — <https://c4model.com/>
  Framework visual untuk mendokumentasikan arsitektur dengan 4 level zoom: Context, Container, Component, Code. Jauh lebih mudah dikomunikasikan ke stakeholder non-teknis dibanding UML deployment diagram. Direkomendasikan di **simskij/awesome-software-architecture** dan dipakai di banyak tim agile modern.

## Fokus Bank-Soal

Belum ada bank-soal untuk matkul ini di repo.

## Estimasi Waktu

| Fase                  | Kegiatan                                                        | Estimasi    |
| --------------------- | --------------------------------------------------------------- | ----------- |
| Orientasi             | Topik 1–3 (definisi, quality attributes, layered/client-server) | ~8 jam      |
| Patterns              | Topik 4–7 (MVC, SOA, microservices, event-driven)               | ~12 jam     |
| Views & Docs          | Topik 8–9 (4+1 views, C4, arc42, ADRs)                          | ~8 jam      |
| Evaluasi              | Topik 10–11 (ATAM, trade-off analysis)                          | ~8 jam      |
| Review & latihan soal | Baca ulang + bikin ringkasan sendiri                            | ~6 jam      |
| **Total**             |                                                                 | **~42 jam** |

Kalau mau _curi start_ sebelum semester dimulai, prioritaskan topik 1–5 (~20 jam) dan baca "Software Architecture Patterns" (free report) sebagai gambaran besar. Masuk kelas sudah punya kerangka mental yang cukup kuat.
