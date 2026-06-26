# Praktikum Sistem Administrasi dan Informasi Terdistribusi — Roadmap Curi Start

---

## Overview

Berdasarkan analisis bank-soal UTS & UAS TA 2021/2022, praktikum ini lebih ke arah
**web backend + database + sysadmin ringan**, bukan distributed systems teori berat.
Fokus utamanya: bikin REST API, sambungkan ke database MySQL, test dengan Postman,
deploy di Ubuntu Server.

**Topik yang terdeteksi dari bank-soal:**

- Database relasional: DDL (CREATE TABLE, PK, FK, Auto Increment), DML (INSERT, UPDATE, DELETE), SQL JOIN
- REST API: arsitektur client-server, HTTP methods (GET/POST/PUT/DELETE), response JSON, CRUD
- API testing: Postman
- Backend language: PHP atau Python (pilihan bebas)
- Server/OS: Ubuntu Linux — API harus berjalan di server terpisah (bukan localhost saja)
- Client program: HTML Table yang memanggil API
- GUI tools database: DBeaver, phpMyAdmin, SQLyog

**Verifikasi ke silabus terbaru** — mungkin ada topik tambahan seperti Docker,
authentication (JWT), atau network configuration yang tidak muncul di soal 21/22.

---

## Prasyarat

Hal-hal ini diasumsikan sudah kamu tahu atau perlu kamu _refresh cepat_ sebelum mulai:

- **Jaringan dasar**: apa itu IP address, port, HTTP request/response, perbedaan GET vs POST di browser
- **Sistem operasi**: konsep file system (path, permission), proses, user & group
- **Command line dasar**: `ls`, `cd`, `mkdir`, `cp`, `mv`, `rm` — cukup yang ini dulu

Kalau salah satunya bolong, jangan langsung skip — karena soal UAS mensyaratkan deploy di
Ubuntu Server, dan kamu perlu navigasi terminal dengan percaya diri.

---

## Topik Inti (urutan belajar)

Urutkan dari sini — jangan loncat karena tiap topik jadi fondasi yang berikutnya.

1. **Command line Linux dasar** — navigasi terminal, permission file, user management; wajib sebelum menyentuh Ubuntu Server
2. **Database design** — normalisasi, entity-relationship, primary key vs foreign key, tipe data SQL
3. **MySQL & SQL** — DDL (`CREATE TABLE`, `DROP`, `ALTER`), DML (`INSERT`, `SELECT`, `UPDATE`, `DELETE`), `JOIN` (INNER/LEFT), constraint FK
4. **Konsep REST API** — apa itu REST, HTTP methods dan mapping ke CRUD, status code (200/201/400/404/500), format JSON
5. **Implementasi REST API dengan PHP** — koneksi MySQL via PDO, routing manual, output `header('Content-Type: application/json')`, `json_encode()`
6. **Implementasi REST API dengan Python/Flask** — alternatif PHP; `@app.route()`, `jsonify()`, koneksi MySQL lewat `flask-mysql` atau `mysql-connector-python`
7. **API testing dengan Postman** — buat request (GET/POST/PUT/DELETE), set headers, kirim body JSON, baca response
8. **Client program** — HTML + JavaScript (fetch) atau PHP/Python yang memanggil API dan menampilkan data dalam `<table>`
9. **Setup Ubuntu Server** — install Ubuntu Server (bisa VM/VirtualBox), konfigurasi network, `apt`, setup LAMP stack (Apache + MySQL + PHP) atau Python environment
10. **Deploy API ke Ubuntu Server** — upload file, konfigurasi Apache virtual host atau Flask run, pastikan API bisa diakses dari mesin lain (UAS: "server berbeda")

---

## Resource Kurasi

### Kanonik

Resource standar yang terbukti jelas dan selalu relevan.

| Resource                                                                                                                            | Format                   | Bahasa | Harga  |
| ----------------------------------------------------------------------------------------------------------------------------------- | ------------------------ | ------ | ------ |
| [MySQLTutorial.org](https://www.mysqltutorial.org/)                                                                                 | Web tutorial terstruktur | EN     | Gratis |
| [W3Schools MySQL](https://www.w3schools.com/MYSQL/default.asp)                                                                      | Web + latihan interaktif | EN     | Gratis |
| [REST API Tutorial (restapitutorial.com)](https://www.restapitutorial.com/)                                                         | Quick reference + konsep | EN     | Gratis |
| [Postman Academy — API Beginner Path](https://academy.postman.com/path/api-beginner)                                                | Course resmi Postman     | EN     | Gratis |
| [Ubuntu Server Tutorial — Official Docs](https://documentation.ubuntu.com/server/tutorial/)                                         | Tutorial resmi Canonical | EN     | Gratis |
| [GeeksForGeeks — Building a REST API with PHP and MySQL](https://www.geeksforgeeks.org/php/building-a-rest-api-with-php-and-mysql/) | Artikel hands-on         | EN     | Gratis |
| [Developing RESTful APIs with Python and Flask (Auth0 Blog)](https://auth0.com/blog/developing-restful-apis-with-python-and-flask/) | Artikel hands-on         | EN     | Gratis |

**Catatan penggunaan:**

- Mulai dari W3Schools untuk drill SQL cepat karena ada editor langsung di browser.
- `restapitutorial.com` paling berguna untuk hafal HTTP methods + status code — simpan halaman
  [HTTP Methods](https://www.restapitutorial.com/introduction/httpmethods) dan
  [REST Quick Tips](https://www.restapitutorial.com/introduction/restquicktips).
- Postman Academy API Beginner Path selesai dalam 1-2 jam dan langsung bisa dipakai untuk UTS.

---

### Hidden gems (verified by experts)

Resource yang jarang muncul di list mainstream tapi direkomendasikan oleh praktisi nyata.

---

**1. Build APIs You Won't Hate** — Phil Sturgeon

- URL: [leanpub.com/build-apis-you-wont-hate](https://leanpub.com/build-apis-you-wont-hate) | [apisyouwonthate.com/books/build-apis-you-wont-hate](https://apisyouwonthate.com/books/build-apis-you-wont-hate/)
- Format: e-book (PDF/EPUB) | Bahasa: EN | Harga: Berbayar (~$9–$12 di Leanpub, ada sample gratis)
- **Direkomendasikan oleh**: komunitas developer di Goodreads (rating 4.2/5 dari 800+ review), dan diulas positif oleh blog Javarevisited (salah satu blog teknis paling terpercaya di komunitas Java/Python developer)
- **Kenapa gem**: Tutorial biasa berhenti setelah CRUD jalan. Buku ini cover hal yang selalu bikin API buruk di dunia nyata: desain URL yang benar, format error yang konsisten, pagination, versioning — semua ditulis dengan gaya percakapan santai oleh orang yang sudah bikin API selama bertahun-tahun. Sangat relevan untuk project UAS agar tidak sekadar "jalan" tapi "benar".

---

**2. REST APIs with Flask and Python** — Jose Salvatierra (Teclado)

- URL: [udemy.com/course/rest-api-flask-and-python](https://www.udemy.com/course/rest-api-flask-and-python/) | mirror Teclado: [teclado.com/rest-apis-flask-python](https://teclado.com/rest-apis-flask-python/)
- Format: Video course | Bahasa: EN | Harga: Berbayar (Udemy, sering diskon jadi ~$15–20; versi Teclado lebih mahal tapi ada teks dan kode per lecture)
- **Direkomendasikan oleh**: Javarevisited — review independen tersedia di [javarevisited.blogspot.com](https://javarevisited.blogspot.com/2023/05/udemy-course-review-is-rest-apis-with.html); 146.000+ mahasiswa terdaftar di Udemy dengan rating 4.5/5 dari 25.000+ review
- **Kenapa gem**: Satu-satunya course yang cover REST API Python dari nol sampai deploy — termasuk Flask, SQLAlchemy, JWT authentication, Docker, dan database migrations. Kalau kamu memilih Python untuk project UAS, ini yang paling komprehensif. Instructor Jose Salvatierra juga menjaga course-nya tetap update.

---

**3. LearnLinux.tv — Linux Crash Course Series** — Jay LaCroix

- URL: [learnlinux.tv/category/linux-crash-course](https://www.learnlinux.tv/category/linux-crash-course/)
- Format: Video (YouTube + website) | Bahasa: EN | Harga: Gratis
- **Direkomendasikan oleh**: Jay LaCroix adalah Linux system administrator dengan pengalaman lebih dari satu dekade, menulis buku tentang Linux administration, dan dikenal luas di komunitas sysadmin Linux (kanal YouTube dengan ratusan ribu subscriber)
- **Kenapa gem**: Video per-episode singkat (10–20 menit) dengan fokus skenario nyata sysadmin — bukan teori. Cocok untuk belajar setup Ubuntu Server sebelum UAS karena langsung ke hal-hal yang akan kamu kerjakan: package management, user management, SSH, file permissions, service management dengan `systemctl`.

---

## Fokus Bank-Soal

Analisis soal UTS dan UAS TA 2021/2022 (dosen: Dr. Ganjar Alfian & Fitriansyah):

### UTS — Soal 1 (20%): DDL MySQL

- Buat 3 tabel: `mahasiswa` (nim PK varchar, nama, alamat, tanggal_lahir date), `matakuliah` (kode_mk PK varchar, nama_mk, sks int), `perkuliahan` (id_perkuliahan PK Auto Increment, nim FK, kode_mk FK, nilai double)
- Poin penilaian: tipe data tepat, FK terpasang benar, tool GUI bebas dipilih (DBeaver/phpMyAdmin/SQLyog)
- **Tip**: latih CREATE TABLE dengan FK dulu sampai hafal syntax, karena ini soal paling cepat selesai kalau sudah terbiasa

### UTS — Soal 2 (10%): DML + SQL JOIN

- INSERT data ke tiga tabel
- Buat SQL JOIN yang menghasilkan output gabungan semua kolom dari ketiga tabel
- **Tip**: pola JOIN-nya adalah `mahasiswa JOIN perkuliahan ON mahasiswa.nim = perkuliahan.nim JOIN matakuliah ON matakuliah.kode_mk = perkuliahan.kode_mk` — hafal pola ini

### UTS — Soal 3 (50%): REST API CRUD — BOBOT TERBESAR

- Buat JSON API (PHP atau Python) dengan 5 endpoint:
  - GET semua nilai mahasiswa
  - GET nilai by `nim` (query parameter)
  - POST masukkan nilai baru
  - PUT update nilai by `nim` + `kode_mk`
  - DELETE hapus nilai by `nim` + `kode_mk`
- Test tiap endpoint dengan Postman + screenshot
- **Tip**: karena bobotnya 50%, pastikan 5 endpoint ini semua jalan dan response-nya JSON valid sebelum mengerjakan soal lain

### UTS — Soal 4 (20%): Client Program

- Buat program (bebas bahasa) yang memanggil API GET semua nilai dan menampilkan hasilnya dalam HTML Table
- **Tip**: paling simpel pakai PHP dengan `file_get_contents()` atau `curl`, decode JSON, loop ke dalam `<table>` HTML

### UAS — Soal 1 (40%): Project Mandiri di Ubuntu Server

- REST API harus **berjalan di server terpisah** (Ubuntu OS, misalnya VirtualBox di jaringan lokal atau VPS)
- Client mengakses API via IP/hostname server, bukan localhost
- **Ini yang membuat UAS beda dari UTS** — pastikan setup Ubuntu Server dan deploy API sudah dicoba jauh sebelum ujian

### UAS — Soal 2 (30%): Laporan Teknis

- Format: Halaman Judul → Pendahuluan → Analisis dan Desain Sistem → Implementasi dan Pembahasan → Kesimpulan
- **Tip**: tulis paralel dengan ngerjain kode, jangan di-defer sampai terakhir

### UAS — Soal 3 (30%): Video Demo (max 5 menit)

- Tunjukkan aplikasi sukses mengakses REST API yang terinstal di server Ubuntu
- **Tip**: rekam screen saat Postman atau browser mengakses API lewat IP server, bukan localhost

---

## Estimasi Waktu

Ini estimasi untuk masuk ke setiap topik sampai bisa mengerjakan soal sejenisnya — bukan sampai jago.

| Topik                                   | Estimasi       |
| --------------------------------------- | -------------- |
| Command line Linux dasar                | 3–5 jam        |
| Database design (konsep)                | 2–3 jam        |
| MySQL & SQL (DDL + DML + JOIN)          | 5–8 jam        |
| Konsep REST API                         | 2–3 jam        |
| Implementasi REST API (PHP atau Python) | 6–10 jam       |
| Postman — testing API                   | 1–2 jam        |
| Client program (HTML/fetch)             | 2–4 jam        |
| Setup Ubuntu Server (VM)                | 4–6 jam        |
| Deploy API ke Ubuntu Server             | 3–5 jam        |
| **Total**                               | **~28–46 jam** |

Kalau mau efisien: kerjakan Topik 1–7 dulu sampai bisa ngerjakan soal model UTS, baru lanjut ke
Topik 8–9 untuk UAS. Jangan belajar semuanya bersamaan — tiap topik perlu praktek langsung,
bukan cuma dibaca.
