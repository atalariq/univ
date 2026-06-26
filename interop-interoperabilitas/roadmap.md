# Interoperabilitas — Roadmap Curi Start

## Overview

Mata kuliah ini membahas bagaimana sistem-sistem yang berbeda bisa saling berkomunikasi dan bertukar data — mulai dari konsep sistem terdistribusi, format data standar (JSON/XML), web services (REST & SOAP), sampai merancang dan mengimplementasikan API nyata. Ujian lebih banyak berbentuk studi kasus (rancang arsitektur, beri argumen), bukan hafalan teori murni.

---

## Prasyarat

Refresh sebelum mulai — tidak perlu dalam, cukup ingat dasarnya:

- **Pemrograman web** — HTTP request/response, cara kerja browser-server, minimal pernah bikin endpoint sederhana
- **Basis data** — query SQL dasar, tahu apa itu tabel dan relasi
- **Jaringan dasar** — TCP/IP, DNS, port, perbedaan LAN vs WAN, konsep client-server

---

## Topik Inti (urutan belajar)

Urutan ini penting — tiap topik jadi fondasi topik berikutnya.

1. **Konsep interoperabilitas** — definisi dan beda tiga hal yang sering disamakan: interoperabilitas, sistem informasi terdistribusi, dan file terdistribusi.
2. **Arsitektur sistem terdistribusi** — pola client-server, peer-to-peer, karakteristik sistem terdistribusi, kasus keterbatasan koneksi/jaringan.
3. **Distributed File System (DFS)** — konsep, arsitektur (sentralisasi vs replikasi), contoh implementasi nyata (NFS, HDFS), kasus multi-datacenter.
4. **Standarisasi format data** — mengapa format harus distandarisasi, perbandingan JSON vs XML vs CSV, kapan pakai yang mana.
5. **Web Services & SOAP** — arsitektur web service, WSDL, SOAP envelope, use case perusahaan multi-cabang.
6. **REST & RESTful API** — prinsip REST (stateless, uniform interface, resource-based), HTTP methods (GET/POST/PUT/DELETE), status codes.
7. **API Design** — penamaan resource, versioning, request/response structure, dokumentasi dengan OpenAPI/Swagger.
8. **Pola Integrasi Enterprise (EIP)** — message channel, message queue, middleware, pola routing dan transformasi pesan.
9. **Rancangan arsitektur interoperabilitas** — cara menggabungkan jaringan + protokol + format data dalam satu diagram arsitektur terpadu.
10. **Studi kasus domain nyata** — implementasi interoperabilitas di UMKM, e-government, Healthtech, Fintech; manfaat dan hambatan masing-masing.
11. **Testing API** — unit test, integration test, acceptance test; cara memastikan kontrak API terpenuhi.
12. **Proyek API (UAS)** — rancangan, implementasi, evaluasi dengan format IMRAD (Introduction, Methods, Results, Discussion, Reference).

---

## Resource Kurasi

### Kanonik

| Resource                                                                                                                                                                  | Keterangan                                                                                                     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Maarten van Steen & Andrew S. Tanenbaum, _Distributed Systems_ 3rd ed. (2017) — [distributed-systems.net](https://www.distributed-systems.net/index.php/books/ds3/)       | Buku teks utama sistem terdistribusi; edisi ke-3 tersedia gratis resmi dari penulis. [EN] [Gratis] [PDF/Cetak] |
| Gregor Hohpe & Bobby Woolf, _Enterprise Integration Patterns_ (Addison-Wesley, 2003) — [enterpriseintegrationpatterns.com](https://www.enterpriseintegrationpatterns.com) | Referensi standar 65 pola integrasi sistem; versi website-nya gratis. [EN] [Berbayar buku / Gratis website]    |
| OpenAPI Specification 3.x — [swagger.io/specification](https://swagger.io/specification/)                                                                                 | Standar resmi dokumentasi REST API, bacaan wajib sebelum bikin proyek API. [EN] [Gratis] [Dokumentasi standar] |
| W3C SOAP Specification — [w3.org/TR/soap/](https://www.w3.org/TR/soap/)                                                                                                   | Spesifikasi resmi SOAP, referensi saat soal ujian tanya detail protokol. [EN] [Gratis] [Spesifikasi teknis]    |
| REST API Best Practices — [swagger.io/resources/articles/best-practices-in-api-design](https://swagger.io/resources/articles/best-practices-in-api-design/)               | Ringkasan praktik terbaik desain REST dari tim Swagger. [EN] [Gratis] [Artikel web]                            |

### Hidden gems (verified by experts)

**1. Brendan Burns, _Designing Distributed Systems_ (O'Reilly, 2018)**
Direkomendasikan langsung via [Microsoft Open Source Blog](https://opensource.microsoft.com/blog/2018/03/26/new-oreilly-e-book-on-designing-distributed-systems-available-for-free-download/) oleh **Brendan Burns** (co-creator Kubernetes, Partner Architect di Microsoft Azure). PDF resmi tersedia gratis dari Microsoft: [info.microsoft.com/.../EN-CNTNT-eBook-DesigningDistributedSystems.pdf](https://info.microsoft.com/rs/157-GQE-382/images/EN-CNTNT-eBook-DesigningDistributedSystems.pdf). Fokus ke pola-pola desain (sidecar, ambassador, scatter-gather) yang sangat relevan untuk soal rancang arsitektur. [EN] [Gratis] [PDF]

**2. Roy T. Fielding, _Architectural Styles and the Design of Network-based Software Architectures_ (disertasi PhD, UC Irvine, 2000)**
Ini adalah sumber asli konsep REST — direkomendasikan oleh seluruh komunitas REST API termasuk **Subbu Allamaraju** (Platform Architect eBay, author _RESTful Web Services Cookbook_) dan **Gregor Hohpe** sebagai bacaan foundational sebelum mempelajari API design. URL resmi: [ics.uci.edu/~fielding/pubs/dissertation/top.htm](https://ics.uci.edu/~fielding/pubs/dissertation/top.htm). Bab 5 paling relevan (cukup baca bab itu, tidak perlu seluruh disertasi). [EN] [Gratis] [PDF/HTML]

**3. Martin Fowler, _Microservices_ article + guide — [martinfowler.com/microservices](https://martinfowler.com/microservices/)**
Artikel seminal ditulis bersama James Lewis, direkomendasikan oleh komunitas software architecture global dan disebut sebagai definisi referensi microservices. **Martin Fowler** adalah salah satu software architect paling berpengaruh (ThoughtWorks), menulis foreword buku Enterprise Integration Patterns. Relevan untuk soal menggabungkan dua sistem berbeda dan merancang komunikasi antar layanan. [EN] [Gratis] [Artikel web]

---

## Fokus Bank-Soal

Analisis lintas 4 file (UTS 21/22, UTS 23/24, UAS 21/22, UAS 24/25):

**Pola yang muncul berulang (prioritas tinggi):**

- **Bedakan tiga konsep** (hampir pasti keluar di UTS): interoperabilitas ≠ sistem informasi terdistribusi ≠ file terdistribusi — siapkan definisi + argumen untuk masing-masing dengan acuan gambar arsitektur.
- **Distributed File System (DFS)** — muncul dengan bobot 20% di UTS 21/22; siapkan penjelasan konsep, arsitektur (centralized vs replicated), dan minimal 2 contoh implementasi nyata (NFS untuk jaringan enterprise, HDFS untuk big data).
- **Arsitektur web service untuk perusahaan multi-cabang** — soal naratif "perusahaan X punya beberapa cabang, cabang Y punya koneksi terbatas" → jelaskan solusi berbasis web service + format data.
- **Standarisasi format data** — jelaskan mengapa perlu (interoperabilitas antar sistem), berikan contoh JSON, XML, CSV dengan snippet data nyata.
- **Studi kasus rancang arsitektur** — soal 23/24 dan 21/22 keduanya meminta rancangan arsitektur dengan menggabungkan dua sistem (Healthtech + Fintech, atau sistem A + B via mekanisme interoperabilitas); latih menggambar komponen + anak panah + label protokol/format.
- **UMKM & e-government** — jenis soal "berikan manfaat, hambatan, dan solusi interoperabilitas untuk [domain]" — siapkan template jawaban dengan 3 manfaat + 3 hambatan + solusinya masing-masing.

**Pola UAS (praktik):**

- **UAS 24/25**: satu soal besar format IMRAD (4 halaman A4 minimal) — rancangan, implementasi, dan testing sistem berbasis API dari proyek kelompok. Latih menulis laporan teknis dengan struktur Introduction-Methods-Results-Discussion-Reference.
- **Testing API** — CPMK4 eksplisit di UAS: unit test + integration test + acceptance test. Pahami perbedaan ketiganya dan bisa jelaskan bagaimana memastikan kontrak API terpenuhi.
- **Kontribusi anggota tim** — selalu ada soal pembagian tugas/tanggung jawab; dokumentasikan kontribusi masing-masing dengan jelas sejak awal proyek.

---

## Estimasi Waktu

| Fase                          | Topik                                         | Estimasi    |
| ----------------------------- | --------------------------------------------- | ----------- |
| Fondasi (sebelum UTS)         | Topik 1–5 (konsep + DFS + format data + SOAP) | ~25 jam     |
| API & Integrasi (sebelum UTS) | Topik 6–9 (REST + design + EIP + arsitektur)  | ~20 jam     |
| Studi kasus & latihan soal    | Topik 10 + drilling bank-soal UTS             | ~10 jam     |
| Persiapan UAS                 | Topik 11–12 + testing + penulisan IMRAD       | ~20 jam     |
| **Total**                     |                                               | **~75 jam** |

Prioritas curi start: mulai dari Topik 1–4 (fondasi) + baca bab 5 Fielding dissertation untuk REST, lalu langsung latihan soal UTS 21/22 sebagai benchmark pemahaman.
