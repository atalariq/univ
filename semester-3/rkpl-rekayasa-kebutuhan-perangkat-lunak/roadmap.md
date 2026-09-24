# Rekayasa Kebutuhan Perangkat Lunak — Roadmap Curi Start

## Overview

Mata kuliah ini membahas seluruh siklus hidup kebutuhan perangkat lunak — dari menggali kebutuhan stakeholder (elicitation), menganalisis, mendokumentasikan dalam SRS, hingga memvalidasi dan mengelolanya. Output utama yang diharapkan adalah kemampuan membuat dokumen SRS yang layak dan diagram UML pendukungnya.

---

## Prasyarat

Tidak banyak, tapi pastikan kamu masih ingat hal-hal berikut dari semester 1–2:

- **OOP dasar** — Memahami class, object, inheritance, encapsulation, polymorphism, abstraction (muncul langsung di soal UAS 21/22 sebagai "5 prinsip dasar Object Orientation")
- **SDLC** — Tahu urutan fase: planning → analysis → design → implementation → testing → maintenance; RE hidup di fase analysis
- **UML intro** — Pernah lihat diagram use case atau activity diagram di mata kuliah MMPL / ADPL; di sini kamu akan mendalaminya
- **Kemampuan membaca studi kasus** — Soal UAS sering berbentuk narasi sistem nyata, perlu diekstrak kebutuhannya

---

## Topik Inti (urutan belajar)

Urutan berikut dirancang dari fondasi konseptual ke aplikasi praktis. Jangan skip langkah awal — soal UAS yang terlihat "gampang menggambar diagram" sering gugur karena fondasi konsepnya copas tanpa mengerti.

### 1. Pengenalan Requirements Engineering

Apa itu RE, kenapa proyek software gagal karena requirements buruk, dan posisi RE di dalam SDLC — ini konteks yang bikin semua topik berikutnya masuk akal.

### 2. Tipe-Tipe Requirement

Membedakan _functional requirements_ (apa yang sistem harus lakukan), _non-functional requirements_ (kualitas: performa, keamanan, keandalan), dan _constraints_ (batasan teknis/bisnis) sebelum terjebak mendokumentasikan semuanya jadi satu.

### 3. Teknik Elicitation (Pengumpulan Kebutuhan)

Cara menggali kebutuhan dari stakeholder: wawancara terstruktur, observasi langsung, kuesioner, prototyping, dan workshop — plus teknik mana yang cocok untuk konteks mana.

### 4. Requirement Analysis

Lima jenis analisis kebutuhan yang sering diuji: problem analysis, root cause analysis, requirements classification, feasibility analysis, dan risk analysis — disertai cara mendeteksi kebutuhan yang ambigu, konflik, atau tidak lengkap.

### 5. Prinsip OOP untuk Requirement Modeling

Lima prinsip dasar object orientation (encapsulation, inheritance, polymorphism, abstraction, dan message passing) sebagai fondasi untuk memahami kenapa modeling berbasis objek dipakai dalam analisis kebutuhan modern.

### 6. Use Case Modeling

Memodelkan interaksi aktor–sistem menggunakan use case diagram: cara mendefinisikan actor, use case, relasi `<<include>>` dan `<<extend>>`, plus menulis use case description (main flow, alternative flow, precondition, postcondition).

### 7. Activity Diagram

Menggambarkan alur proses dan workflow menggunakan simbol-simbol UML standar: initial node, action, decision node, fork/join, swimlane, hingga final node — simbol-simbol ini pernah muncul langsung sebagai soal di UAS 24/25.

### 8. Dokumen SRS (Software Requirements Specification)

Menyusun SRS lengkap mengikuti struktur standar: introduction, overall description, functional requirements, non-functional requirements, external interface requirements, dan constraints — bisa merujuk IEEE 830 atau template Volere.

### 9. Requirement Prioritization

Teknik mengurutkan prioritas kebutuhan menggunakan MoSCoW (Must have, Should have, Could have, Won't have), serta aspek pertimbangan saat prioritasi: business value, cost, risk, time-to-market, dan stakeholder needs — topik ini naik signifikan di UAS 24/25 (bobot 35%).

### 10. Verifikasi dan Validasi Kebutuhan

Membedakan verifikasi ("apakah requirement ditulis dengan benar?") vs validasi ("apakah requirement yang benar sudah ditulis?") — beserta teknik masing-masing: inspeksi, walkthrough, review, prototyping, acceptance testing. **Topik ini muncul di SEMUA 3 soal UAS yang dianalisis — hafal perbedaannya beserta contoh kasus konkret.**

---

## Resource Kurasi

### Kanonik

Buku dan course mainstream yang jadi referensi standar di program software engineering dunia.

---

**[Buku] Software Requirements, 3rd Edition**
Karl Wiegers & Joy Beatty — Microsoft Press, 2013
[EN] [Berbayar] [Buku cetak/digital]
Referensi paling komprehensif di bidang ini — mencakup seluruh siklus RE dari elicitation hingga management, dengan contoh teknik praktis yang notation-agnostic. Cocok sebagai buku pegangan utama, tapi tebal; gunakan selektif per bab.
https://www.amazon.com/Software-Requirements-Developer-Best-Practices/dp/0735679665

---

**[Buku] Mastering the Requirements Process: Getting Requirements Right, 3rd Edition**
Suzanne Robertson & James Robertson — Addison-Wesley, 2012
[EN] [Berbayar] [Buku cetak]
Pasangan yang lebih proses-oriented dari Wiegers; sangat kuat di bagian menulis fit criteria untuk non-functional requirements dan memodelkan system context. Penulisnya juga yang membuat Volere Template yang dipakai banyak universitas.
https://www.volere.org/

---

**[Course] Requirements Engineering: Secure Software Specifications**
University of Colorado System — Coursera Specialization
[EN] [Gratis dengan audit] [Online, ~4 minggu, 5–10 jam/minggu]
Specialization 4 kursus yang membahas RE dari elicitation hingga spesifikasi; bisa di-audit gratis tanpa sertifikat. Cukup untuk membangun mental model yang lengkap sebelum membaca buku.
https://www.coursera.org/specializations/requirements-engineering-secure-software

---

### Hidden Gems (verified by experts)

Resource di bawah ini kurang populer di kalangan mahasiswa Indonesia, tapi kualitasnya diakui oleh praktisi dan lembaga yang bisa diidentifikasi. Tiap entri menyertakan siapa yang merekomendasikan.

---

**[PDF Gratis] IREB CPRE Foundation Level Handbook**
IREB — International Requirements Engineering Board
[EN] [Gratis] [PDF, ~80 hal]

Direkomendasikan oleh: **IREB sendiri** sebagai official study material sertifikasi profesional CPRE (Certified Professional for Requirements Engineering) yang digunakan praktisi di lebih dari 60 negara. Bukan sekadar materi ujian — isinya adalah distilasi best practice RE global yang terstruktur sangat rapi: dari fundamentals, elicitation, documentation, modeling, sampai validation & negotiation. Jauh lebih dense dan terstruktur dibanding slide kuliah biasa.

Download langsung di halaman resmi IREB (semua materials gratis, no signup):
https://cpre.ireb.org/en/downloads-and-resources/downloads

---

**[Artikel PDF Gratis] Free Articles oleh Karl Wiegers — ProcessImpact.com**
Karl Wiegers — Process Impact
[EN] [Gratis] [Artikel PDF pendek, 4–12 hal per artikel]

Direkomendasikan oleh: **Karl Wiegers sendiri**, yang mempublikasikan artikel-artikel ini secara gratis untuk komunitas practitioners di situsnya. Wiegers adalah penulis buku kanonik "Software Requirements" dan dianggap sebagai otoritas utama di bidang ini. Tiga artikel yang paling relevan untuk mata kuliah ini:

- "Writing Quality Requirements" — cara menulis requirement yang unambiguous
- "In Search of Excellent Requirements" — checklist kualitas requirement
- "10 Requirements Traps to Avoid" — pitfall yang sering terjadi di proyek nyata

Halaman publikasi lengkap: https://processimpact.com/pubs.html
Artikel langsung: https://processimpact.com/articles/qualreqs.pdf

---

**[Template Gratis untuk Mahasiswa] Volere Requirements Specification Template**
James Robertson & Suzanne Robertson — Atlantic Systems Guild
[EN] [Gratis untuk mahasiswa .ac.id] [Word + PDF]

Direkomendasikan oleh: **Penulis "Mastering the Requirements Process"** (Robertson & Robertson) yang juga menciptakan template ini dan mendistribusikannya gratis ke institusi pendidikan. Template ini digunakan di ratusan universitas di seluruh dunia sebagai kerangka SRS. Isinya mencakup semua section yang perlu ada di dokumen requirements yang serius: functional requirements, non-functional requirements, project constraints, project issues, dan fit criteria.

Untuk mendapatkan versi gratis, kirim email dari alamat `.ac.id` ke alamat yang tersedia di halaman berikut:
https://www.volere.org/templates/volere-requirements-specification-template/

---

**[Podcast] SE Radio Ep. 604: Karl Wiegers & Candase Hokanson on Software Requirements Essentials**
SE Radio — IEEE Computer Society & IEEE Software Magazine, Februari 2024
[EN] [Gratis] [Podcast, ~55 menit]

Direkomendasikan oleh: **IEEE Computer Society** melalui platform SE Radio yang mereka kurasi sejak 2006 sebagai podcast untuk software developers profesional. Episode ini membahas 5 area RE (planning, elicitation, analysis, specification, validation) secara conversational — cocok didengarkan sambil nugas sebagai "big picture review" sebelum UAS. Wiegers menjelaskan perbedaan verifikasi vs validasi dan requirement prioritization dengan bahasa yang sangat mudah dipahami.

https://se-radio.net/2024/02/se-radio-604-karl-wiegers-and-candase-hokanson-on-software-requirements-essentials/

---

## Fokus Bank-Soal

Berdasarkan analisis 3 soal UAS (2019/20, 2021/22, 2024/25):

**Prioritas Tinggi — muncul di hampir semua tahun:**

1. **Verifikasi vs Validasi** _(muncul di KETIGA soal UAS — 19/20, 21/22, 24/25)_
   Wajib bisa: (a) definisi keduanya, (b) perbedaan yang jelas, (c) teknik untuk masing-masing, (d) contoh kasus konkret. Di 24/25 soalnya sudah dipisah jadi dua pertanyaan berbeda — definisi+perbedaan terpisah dari teknik.

2. **Use Case Diagram + Activity Diagram** _(21/22 dan 24/25)_
   Harus bisa: menggambar dari studi kasus, menuliskan aktor, relasi include/extend, dan menyebutkan semua simbol activity diagram beserta fungsinya.

**Prioritas Menengah — tren dan bobot besar:**

3. **Requirement Prioritization** _(24/25, bobot 35%)_
   Definisi, fungsi/tujuan prioritasi, aspek pertimbangan (business value, cost, risk, dependencies, stakeholder needs). Ini tren terbaru — kemungkinan besar muncul di soal berikutnya.

4. **Struktur Dokumen SRS** _(21/22, bobot 25%)_
   Hafal section-section utama SRS dan bisa menjelaskan isi tiap section dengan contoh.

5. **5 Jenis Requirement Analysis + 5 Prinsip OOP** _(21/22)_
   Sebutkan dan jelaskan — soal langsung tipe hafalan, jangan skip.

**Prioritas Pelengkap:**

6. **Elicitation dari studi kasus** _(19/20)_
   Diberi skenario sistem nyata → identifikasi kebutuhannya. Latihan dengan beberapa studi kasus berbeda domain.

7. **Analisis & validasi aplikasi nyata** _(19/20)_
   Pernah minta download + review app sungguhan. Format ini mungkin tidak terulang tapi membangun kemampuan analisis requirement dari produk jadi.

---

## Estimasi Waktu

| Topik                                            | Estimasi    |
| ------------------------------------------------ | ----------- |
| Pengenalan RE + Tipe Requirement                 | 3 jam       |
| Teknik Elicitation                               | 3 jam       |
| Requirement Analysis + OOP Principles            | 4 jam       |
| Use Case Modeling (diagram + deskripsi)          | 5 jam       |
| Activity Diagram (gambar + simbol)               | 3 jam       |
| Dokumen SRS (baca template + latihan nulis)      | 5 jam       |
| Requirement Prioritization                       | 3 jam       |
| Verifikasi dan Validasi (+ latihan contoh kasus) | 4 jam       |
| Review soal UAS 3 tahun + latihan jawab          | 4 jam       |
| **Total**                                        | **~34 jam** |

Dengan 34 jam belajar terfokus (sekitar 4–5 jam/hari selama 7 hari), kamu sudah punya coverage yang cukup untuk semua topik yang terbukti muncul di bank soal. Alokasi terbesar di bagian Use Case + SRS karena keduanya butuh latihan praktis, bukan sekadar membaca.
