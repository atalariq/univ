# Praktikum Pengujian Perangkat Lunak — Roadmap Curi Start

## Overview

Praktikum ini adalah tangan-tangan dari mata kuliah Verifikasi & Validasi (V&V): kalau V&V mengajarkan _kenapa_ dan _apa_ pengujian itu penting, praktikum ini mengajarkan _bagaimana_ menulisnya secara nyata. Kamu akan menulis test case, menjalankan test suite otomatis, dan menyentuh pipeline CI — semua hal yang di dunia kerja langsung dipakai hari pertama. Fokus utamanya adalah membangun keyakinan bahwa kode yang kamu tulis bekerja sesuai spesifikasi.

## Prasyarat

Sebelum mulai, pastikan kamu nyaman dengan hal-hal berikut (tidak perlu ahli, tapi harus bisa jalan):

- **Pemrograman & OOP** — minimal bisa nulis class, method, inheritance, dan interface di bahasa yang dipakai praktikum (Java/Python/JavaScript). Kalau masih ragu, baca ulang PPBO/PBO dulu.
- **Konsep testing dari V&V** — sudah tahu perbedaan verification vs validation, apa itu black-box vs white-box testing, dan apa tujuan pengujian perangkat lunak secara teoritis.
- **Penggunaan terminal & project setup** — bisa jalankan perintah CLI, tahu cara install dependency (Maven/Gradle/pip/npm), dan familiar dengan IDE (IntelliJ/VS Code/PyCharm).
- **Git dasar** — clone, commit, push. Berguna saat praktikum nyentuh CI.

## Topik Inti (urutan belajar)

Urutan ini dirancang supaya setiap topik membangun di atas yang sebelumnya — jangan loncat ke tengah.

1. **Test case design** — Pelajari teknik merancang test case secara sistematis: equivalence partitioning, boundary value analysis, dan decision table; ini fondasi sebelum nulis satu baris kode test pun.
2. **Unit testing framework** — Kenali framework yang dipakai praktikum (JUnit 5 untuk Java, pytest untuk Python, atau Jest untuk JavaScript) dan pahami struktur dasar test: arrange–act–assert.
3. **Assertions & test doubles (mocking)** — Pelajari cara menulis assertion yang ekspresif dan kapan harus pakai mock, stub, spy, atau fake untuk mengisolasi unit yang diuji.
4. **Test coverage** — Pahami metrik cakupan kode (statement, branch, condition/decision coverage) dan cara menggunakannya sebagai indikator kualitas test suite, bukan tujuan akhir.
5. **Integration testing** — Uji interaksi antar komponen (misalnya service + database, atau dua modul berbeda) tanpa menjalankan seluruh aplikasi.
6. **E2E testing & automation** — Tulis skenario pengujian end-to-end yang mengoperasikan aplikasi seperti pengguna nyata menggunakan Selenium WebDriver atau Cypress.
7. **CI dasar** — Integrasikan test suite ke pipeline CI (GitHub Actions atau GitLab CI) supaya test dijalankan otomatis setiap ada push.

## Resource Kurasi

### Kanonik

Resource di bawah ini adalah rujukan utama — dokumentasi resmi dan buku standar industri.

- **JUnit 5 User Guide** — dokumentasi resmi JUnit, mencakup semua fitur dari annotation dasar hingga parameterized test.
  [https://junit.org/junit5/docs/current/user-guide/](https://junit.org/junit5/docs/current/user-guide/) [EN][Gratis][Docs]

- **pytest documentation** — dokumentasi resmi pytest, ringkas tapi lengkap; mulai dari _Get Started_ lalu baca bagian _How-to Guides_.
  [https://docs.pytest.org/en/stable/](https://docs.pytest.org/en/stable/) [EN][Gratis][Docs]

- **Cypress Documentation** — dokumentasi resmi Cypress untuk E2E testing berbasis JavaScript, termasuk panduan komponen dan API.
  [https://docs.cypress.io/app/get-started/why-cypress](https://docs.cypress.io/app/get-started/why-cypress) [EN][Gratis][Docs]

- **Selenium Documentation** — dokumentasi resmi Selenium WebDriver, tersedia contoh Python dan Java.
  [https://www.selenium.dev/documentation/webdriver/](https://www.selenium.dev/documentation/webdriver/) [EN][Gratis][Docs]

- **Kent Beck — _Test-Driven Development: By Example_** — buku klasik oleh pencipta TDD dan Extreme Programming; meskipun judulnya TDD, bab-bab awalnya adalah pengantar unit testing terbaik yang ada.
  [https://www.oreilly.com/library/view/test-driven-development/0321146530/](https://www.oreilly.com/library/view/test-driven-development/0321146530/) [EN][Berbayar][Buku]

- **Real Python — pytest Tutorial** — tutorial praktis pytest yang menjelaskan fixtures, parametrize, dan markers dengan contoh nyata; bagus sebagai pelengkap docs resmi.
  [https://realpython.com/pytest-python-testing/](https://realpython.com/pytest-python-testing/) [EN][Gratis][Tutorial]

- **Martin Fowler — Software Testing Guide** — halaman indeks semua tulisan Fowler tentang testing; berguna sebagai peta untuk tahu artikel mana yang relevan per topik.
  [https://martinfowler.com/testing/](https://martinfowler.com/testing/) [EN][Gratis][Artikel]

### Hidden gems (verified by experts)

Resource di bawah ini kurang mainstream tapi kualitasnya diakui oleh praktisi terkemuka — bukan sekadar populer di media sosial.

- **Martin Fowler — "Mocks Aren't Stubs"** (2004, diperbarui 2007)
  Artikel ini menjelaskan perbedaan presisi antara mock, stub, spy, fake, dan dummy — terminologi yang sering dikacaukan di kuliah testing. Konsep _state verification_ vs _behavior verification_ di sini adalah kunci memahami kapan harus pakai mocking dan kapan tidak. **Direkomendasikan oleh Steve Freeman & Nat Pryce** sebagai bacaan fondasi dalam buku mereka _Growing Object-Oriented Software, Guided by Tests_ — keduanya pencipta jMock framework.
  [https://martinfowler.com/articles/mocksArentStubs.html](https://martinfowler.com/articles/mocksArentStubs.html) [EN][Gratis][Artikel]

- **Ham Vocke — "The Practical Test Pyramid"** di martinfowler.com (2018)
  Artikel paling komprehensif tentang test pyramid dengan contoh kode nyata (Java + Spring), jauh lebih dalam dari artikel TestPyramid asli Fowler. Menjelaskan cara membagi unit/integration/E2E test secara proporsional di proyek nyata. **Dipublikasikan di situs Martin Fowler** setelah melalui review editorial Fowler sendiri — jaminan kualitas yang kuat.
  [https://martinfowler.com/articles/practical-test-pyramid.html](https://martinfowler.com/articles/practical-test-pyramid.html) [EN][Gratis][Artikel]

- **Google Testing Blog — seri "Testing on the Toilet" (TotT)**
  Blog resmi tim engineering Google yang awalnya dicetak dan ditempel di toilet kantor Google untuk membudayakan testing. Setiap entri adalah artikel pendek (~2 menit baca) dengan satu pelajaran konkret: cara menulis assertion yang jelas, kapan _tidak_ menggunakan mock, cara membuat test data yang bersih, dll. **Direkomendasikan secara eksplisit dalam buku _Software Engineering at Google_** (Winters, Manshreck, Wright) sebagai bagian dari budaya testing Google.
  [https://testing.googleblog.com/](https://testing.googleblog.com/) [EN][Gratis][Blog]

- **Titus Winters, Tom Manshreck, Hyrum Wright — _Software Engineering at Google_, Bab 11–14**
  Bab 11 (Testing Overview), 12 (Unit Testing), 13 (Test Doubles), dan 14 (Larger Testing) memberikan perspektif skala besar tentang testing yang tidak kamu temukan di tutorial biasa — bagaimana Google berpikir soal keseimbangan antara fidelity, speed, dan maintainability. Buku ini tersedia **gratis secara resmi** oleh O'Reilly dalam format HTML di bawah lisensi Creative Commons.
  [https://abseil.io/resources/swe-book](https://abseil.io/resources/swe-book) [EN][Gratis][Buku]

- **Steve Freeman & Nat Pryce — _Growing Object-Oriented Software, Guided by Tests_ (GOOS)**
  Buku ini menunjukkan bagaimana TDD, mock objects, dan desain OOP yang baik saling mendukung melalui satu proyek nyata dari awal sampai akhir. **Foreword ditulis oleh Kent Beck** sendiri; Michael Feathers menyebutnya "the book you need to understand the state of the art in TDD." Cocok dibaca setelah kamu sudah paham dasar unit testing dan ingin naik level.
  [https://growing-object-oriented-software.com/](https://growing-object-oriented-software.com/) [EN][Berbayar][Buku]

## Fokus Bank-Soal

Belum ada bank-soal untuk matkul ini di repo.

## Estimasi Waktu

Estimasi kasar untuk mempersiapkan diri sebelum praktikum dimulai — bukan target untuk hafalkan semua:

| Topik                                     | Estimasi       |
| ----------------------------------------- | -------------- |
| Test case design (teori + latihan)        | 3–4 jam        |
| Unit testing framework (setup + tutorial) | 4–5 jam        |
| Assertions & mocking                      | 3–4 jam        |
| Test coverage (tools + interpretasi)      | 2–3 jam        |
| Integration testing                       | 3–4 jam        |
| E2E testing (Selenium/Cypress)            | 4–6 jam        |
| CI dasar (GitHub Actions)                 | 2–3 jam        |
| **Total persiapan**                       | **~21–29 jam** |

Kalau waktu terbatas, prioritaskan topik 1–4 dulu — itu yang paling sering muncul di tugas awal praktikum. E2E dan CI biasanya datang belakangan.
