#import "@preview/numbly:0.1.0": numbly
#import "@preview/zebraw:0.6.1": zebraw

// --- Pengaturan Dokumen ---
#set page(paper: "a4", margin: 1in)
#set document(title: "Praktikum Basis Data", author: "Atalariq Barra Hadinugraha")
#set text(font: "Times New Roman", size: 11pt)
#set par(justify: true, first-line-indent: (amount: 2em, all: true))
#set heading(numbering: numbly("{1:A}.", "{2}.", "{3:a}.", "{2}.{3}.{4}"))

#let code(
  caption: none,
  show-line-numbers: false,
  align: center,
  code,
) = {
  let code-content = zebraw(
    numbering: show-line-numbers,
    numbering-separator: show-line-numbers,
    hanging-indent: true,
    code,
  )

  if caption == none {
    code-content
  } else {
    figure(
      code-content,
      caption: caption,
      kind: image,
    )
  }
}

// --- Judul ---
#align(center)[
  #text(16pt, weight: "bold")[Tugas Praktikum Basis Data]\
  #text(14pt)[Instalasi RDBMS - PostgreSQL]
]
#line(length: 100%)

// ============================================================
// A. DEFINISI
// ============================================================
= Definisi

== Relational Database Management System (RDBMS)

Basis data (_database_) adalah kumpulan data yang terorganisir secara sistematis sehingga dapat diakses, dikelola, dan diperbarui secara efisien @date-db-intro. Data di dalamnya bukan sekadar kumpulan berkas acak, melainkan disusun dengan struktur yang terdefinisi dan hubungan antar-data yang eksplisit.

_Database Management System_ (DBMS) adalah perangkat lunak yang bertindak sebagai antarmuka antara pengguna dan basis data fisik. DBMS bertanggung jawab atas penyimpanan, pengambilan, pembaruan, dan penghapusan data, sekaligus mengelola aspek keamanan, konsistensi, dan pemulihan dari kegagalan @elmasri-navathe. Tanpa DBMS, aplikasi harus menangani semua kompleksitas I/O berkas dan konsistensi data secara manual.

_Relational_ DBMS (RDBMS) adalah kelas DBMS yang mengorganisir data ke dalam tabel dua dimensi (relasi), di mana setiap baris adalah sebuah rekaman (_record_) dan setiap kolom adalah sebuah atribut dengan tipe data tertentu @date-db-intro. Model relasional ini pertama kali dirumuskan oleh Edgar F. Codd pada tahun 1970 dan menjadi fondasi dari hampir semua sistem basis data yang digunakan saat ini.

RDBMS berkomunikasi menggunakan _Structured Query Language_ (SQL), sebuah bahasa standar yang didefinisikan oleh ISO/IEC 9075. SQL terdiri dari beberapa subbahasa: DDL (_Data Definition Language_) untuk mendefinisikan skema, DML (_Data Manipulation Language_) untuk memanipulasi data, DCL (_Data Control Language_) untuk mengelola hak akses, dan TCL (_Transaction Control Language_) untuk mengelola transaksi @elmasri-navathe.

Properti kunci yang dijamin oleh RDBMS modern dirangkum dalam akronim *ACID*:

- *Atomicity*: setiap transaksi diperlakukan sebagai satu unit yang tak terpisahkan. Seluruhnya berhasil atau seluruhnya dibatalkan.
- *Consistency*: setiap transaksi membawa basis data dari satu kondisi valid ke kondisi valid lainnya, mematuhi semua constraint yang terdefinisi.
- *Isolation*: transaksi yang dieksekusi secara bersamaan menghasilkan kondisi yang sama seolah-olah dieksekusi secara serial.
- *Durability*: setelah transaksi di-_commit_, perubahannya tersimpan secara permanen bahkan bila terjadi kegagalan sistem @date-db-intro.

== PostgreSQL

PostgreSQL adalah sistem manajemen basis data relasional-objek (_object-relational_) sumber terbuka yang dikembangkan sejak tahun 1986 sebagai bagian dari proyek POSTGRES di University of California, Berkeley @postgres-about. Nama "PostgreSQL" mencerminkan dukungannya terhadap SQL sebagai bahasa kueri, sebuah kemampuan yang ditambahkan pada versi generasi berikutnya yang bernama Postgres95 sebelum akhirnya berganti nama menjadi PostgreSQL pada tahun 1996.

Proyek ini kini dikelola oleh _The PostgreSQL Global Development Group_, sebuah komunitas global pengembang dan perusahaan yang merilis versi baru setiap tahun @postgres-official. Per Maret 2025, versi stabil terbaru adalah PostgreSQL 17.

Yang membedakan PostgreSQL dari RDBMS lain adalah pendekatannya yang _object-relational_: selain tabel relasional biasa, PostgreSQL mendukung tipe data yang didefinisikan pengguna (_user-defined types_), pewarisan tabel (_table inheritance_), dan fungsi yang dapat dipanggil dalam berbagai bahasa prosedural seperti PL/pgSQL, PL/Python, PL/Perl, dan PL/Tcl @postgres-features. Ini memberikan fleksibilitas yang jauh melebihi SQL standar.

Beberapa fitur unggulan PostgreSQL antara lain: dukungan penuh terhadap transaksi ACID, indeks yang sangat beragam (B-tree, Hash, GiST, SP-GiST, GIN, BRIN), _foreign data wrappers_ untuk mengakses sumber data eksternal, replikasi streaming bawaan, dukungan tipe data JSON dan JSONB untuk kebutuhan dokumen semi-terstruktur, serta ekstensi `PostGIS` untuk data geospasial @postgres-features. PostgreSQL juga dikenal memiliki kepatuhan yang tinggi terhadap standar SQL ISO.

== Perbandingan PostgreSQL dengan RDBMS Lain

Tabel berikut membandingkan PostgreSQL dengan tiga RDBMS populer lainnya: MySQL, SQLite, dan Oracle Database XE @db-engines-ranking @mysql-docs @sqlite-docs.

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    inset: 8pt,
    align: left,
    stroke: 0.5pt,
    table.header(
      [*Aspek*],
      [*PostgreSQL*],
      [*MySQL*],
      [*SQLite*],
      [*Oracle XE*],
    ),
    [Lisensi],
      [PostgreSQL License (open source)],
      [GPL v2 / Komersial],
      [Public Domain],
      [Gratis, proprietary],
    [Model],
      [Object-Relational],
      [Relasional],
      [Relasional],
      [Object-Relational],
    [Kepatuhan SQL],
      [Tinggi (SQL:2023)],
      [Sedang],
      [Sebagian],
      [Tinggi],
    [Transaksi ACID],
      [Penuh],
      [Penuh (InnoDB)],
      [Penuh],
      [Penuh],
    [Tipe data JSON],
      [JSON + JSONB (terindeks)],
      [JSON],
      [Tidak ada],
      [JSON],
    [Replikasi],
      [Streaming bawaan],
      [Bawaan],
      [Tidak ada],
      [Terbatas (XE)],
    [Stored Procedure],
      [Multi-bahasa (PL/pgSQL, Python, dll.)],
      [SQL / Prosedural],
      [Terbatas],
      [PL/SQL],
    [Batas kapasitas],
      [Tidak terbatas],
      [Tidak terbatas],
      [~281 TB per file],
      [12 GB (XE)],
    [Kasus penggunaan utama],
      [Aplikasi enterprise, analitik, geospasial],
      [Web, CMS, startup],
      [Embedded, pengujian, mobile],
      [Belajar Oracle SQL],
    [Dukungan komunitas],
      [Sangat aktif],
      [Sangat aktif],
      [Aktif],
      [Terbatas],
  ),
  caption: [Perbandingan PostgreSQL dengan MySQL, SQLite, dan Oracle Database XE],
)

Dari perbandingan di atas, PostgreSQL menonjol pada aspek kepatuhan SQL, fleksibilitas tipe data, dan tidak adanya batasan kapasitas yang artifisial. Oracle XE memang merupakan pilihan yang sering diwajibkan dalam kurikulum untuk memperkenalkan PL/SQL, namun batasan 12 GB dan ketersediaan paket yang terbatas di distribusi Linux non-mainstream menjadikan PostgreSQL pilihan yang lebih praktis tanpa mengorbankan kemampuan inti sistem relasional yang sesungguhnya dipelajari @postgres-about.


// ============================================================
// B. DESKRIPSI
// ============================================================
= Deskripsi

== Lingkungan Pengembangan: Arch Linux

Praktikum ini dilaksanakan pada sistem operasi *Arch Linux* dengan spesifikasi lingkungan sebagai berikut.

#figure(
  table(
    columns: (auto, 1fr),
    inset: 8pt,
    align: left,
    stroke: 0.5pt,
    table.header([*Komponen*], [*Detail*]),
    [Distribusi Linux], [Arch Linux (rolling release)],
    [Kernel],           [Linux 6.x (terkini saat instalasi)],
    [Shell],            [Zsh / Bash],
    [Package Manager],  [`pacman` + `yay` (AUR helper)],
    [Desktop],          [Opsional (dapat digunakan headless)],
    [Arsitektur],       [x86\_64],
  ),
  caption: [Spesifikasi lingkungan pengembangan],
)

Arch Linux adalah distribusi Linux yang mengikuti model _rolling release_, artinya tidak ada versi rilis tetap yang perlu di-_upgrade_ secara periodik @archlinux-wiki. Paket yang tersedia di repositori resmi maupun AUR (_Arch User Repository_) selalu diperbarui ke versi terbaru secepat mungkin. Filosofi desain Arch yang minimalis dan berorientasi pengguna tingkat lanjut memberikan kontrol penuh atas komponen apa saja yang terpasang di sistem.

Karena paket `oracle-xe` tidak tersedia di repositori resmi Arch Linux maupun AUR secara resmi, PostgreSQL dipilih sebagai alternatif RDBMS yang setara secara fungsional untuk mempelajari SQL dan manajemen basis data relasional. PostgreSQL tersedia di repositori resmi Arch Linux di bawah nama paket `postgresql` @postgres-arch-wiki.

== Metode Instalasi: Manual, Package Manager, dan Docker

Terdapat tiga pendekatan umum untuk menginstal perangkat lunak seperti RDBMS pada sistem Linux, masing-masing dengan karakteristik dan trade-off yang berbeda.

*Instalasi Manual* dilakukan dengan mengunduh kode sumber langsung dari situs resmi, mengkompilasi, dan mengkonfigurasi seluruh komponen secara manual. Pendekatan ini memberikan kontrol maksimal terhadap versi dan opsi kompilasi, namun membutuhkan waktu yang jauh lebih lama, rentan terhadap ketidakcocokan dependensi, dan tidak terintegrasi dengan sistem manajemen paket sehingga pembaruan dan penghapusan harus dilakukan secara manual pula. Pendekatan ini umumnya hanya dipilih untuk keperluan optimasi tingkat lanjut atau ketika versi tertentu tidak tersedia melalui saluran lain.

*Instalasi via Package Manager* (`pacman`) adalah cara yang direkomendasikan di Arch Linux untuk sebagian besar perangkat lunak @pacman-wiki. Pengelola paket menangani unduhan, verifikasi integritas, instalasi, konfigurasi dependensi, dan pembaruan secara otomatis. Hasilnya adalah instalasi yang terintegrasi rapi dengan sistem: layanan dapat dikelola melalui `systemd`, berkas konfigurasi mengikuti konvensi standar distribusi, dan pembaruan ke versi baru cukup dilakukan dengan satu perintah. Kekurangannya, versi yang tersedia bergantung pada jadwal pemaketan distribusi (meski di Arch ini biasanya sangat mutakhir) dan instalasi bersifat global di seluruh sistem.

*Instalasi via Docker (Containerization)* adalah pendekatan yang menempatkan PostgreSQL beserta seluruh dependensinya di dalam sebuah _container_ yang terisolasi dari sistem operasi host @docker-docs. Container dibangun dari sebuah _image_ yang sudah terdefinisi dan dapat direproduksi secara identik di mesin mana pun yang menjalankan Docker. Pendekatan ini sangat ideal untuk lingkungan pengembangan karena: versi PostgreSQL dapat diganti tanpa memengaruhi sistem host, beberapa instansi PostgreSQL dengan versi berbeda dapat berjalan bersamaan, lingkungan pengembangan dapat didistribusikan kepada seluruh anggota tim melalui satu berkas `docker-compose.yml`, dan penghapusan instansi PostgreSQL semudah menghapus container dan volume-nya @docker-compose-docs.

Pada praktikum ini, kedua metode kedua dan ketiga dipraktikkan secara berurutan: pertama menggunakan `pacman`, kemudian menggunakan Docker dengan `docker-compose`.


// ============================================================
// C. LANGKAH-LANGKAH
// ============================================================
= Langkah-Langkah Instalasi

== Cara 1: Package Manager (`pacman`)

=== Langkah 1: Memperbarui Sistem

Sebelum menginstal paket baru, sangat dianjurkan untuk memperbarui seluruh paket yang terinstal di sistem terlebih dahulu. Ini mencegah ketidakcocokan versi antara dependensi yang sudah ada dan paket baru @pacman-wiki. Jalankan perintah berikut di terminal:

#code(
  ```bash
  sudo pacman -Syu
  ```,
  caption: [Perintah pembaruan sistem Arch Linux sebelum instalasi],
)

// PETUNJUK: Ganti dengan tangkap layar terminal setelah menjalankan perintah ini.
#figure(
  image("assets/pacman-syu.png", width: 90%),
  caption: [Proses pembaruan sistem dengan `pacman -Syu`],
)

=== Langkah 2: Menginstal PostgreSQL

Instal paket `postgresql` dari repositori resmi Arch Linux @postgres-arch-wiki:

#code(
  ```bash
  sudo pacman -S postgresql
  ```,
  caption: [Perintah instalasi PostgreSQL menggunakan `pacman`],
)

`pacman` akan menampilkan daftar paket yang akan diinstal beserta ukurannya dan meminta konfirmasi. Ketik `Y` dan tekan Enter untuk melanjutkan.

// PETUNJUK: Ganti dengan tangkap layar proses instalasi pacman.
#figure(
  image("assets/pacman-install.png", width: 90%),
  caption: [Proses instalasi PostgreSQL dengan `pacman -S postgresql`],
)

Verifikasi instalasi dengan memeriksa versi PostgreSQL yang terpasang:

#code(
  ```bash
  psql --version
  ```,
  caption: [Verifikasi versi PostgreSQL yang terinstal],
)

// PETUNJUK: Ganti dengan tangkap layar output perintah psql --version.
#figure(
  image("assets/psql-version.png", width: 70%),
  caption: [Output verifikasi versi `psql`],
)

=== Langkah 3: Menginisialisasi Cluster Database

PostgreSQL membutuhkan inisialisasi direktori data (_cluster_) sebelum dapat dijalankan. Perintah `initdb` membuat struktur direktori, berkas konfigurasi awal, dan basis data sistem (`template0`, `template1`, `postgres`) @postgres-initdb. Di Arch Linux, direktori data PostgreSQL secara bawaan berada di `/var/lib/postgres/data`.

Pindah ke user `postgres` (user sistem yang dibuat secara otomatis saat instalasi paket) dan jalankan inisialisasi:

#code(
  ```bash
  # Masuk sebagai user postgres
  sudo -iu postgres

  # Inisialisasi cluster dengan locale dan encoding eksplisit
  initdb --locale=C.UTF-8 --encoding=UTF8 -D /var/lib/postgres/data
  ```,
  caption: [Inisialisasi cluster PostgreSQL dengan `initdb`],
)

Opsi `--locale=C.UTF-8` dan `--encoding=UTF8` direkomendasikan untuk kompatibilitas teks yang luas. Opsi `-D` menentukan direktori data target @postgres-initdb. Setelah selesai, keluarkan sesi user `postgres` dengan perintah `exit`.

// PETUNJUK: Ganti dengan tangkap layar output initdb (biasanya cukup panjang, tampilkan bagian akhir).
#figure(
  image("assets/initdb.png", width: 90%),
  caption: [Output `initdb` setelah inisialisasi cluster berhasil],
)

=== Langkah 4: Menjalankan dan Mengaktifkan Layanan PostgreSQL

Arch Linux menggunakan `systemd` sebagai init system dan manajer layanan. Gunakan `systemctl` untuk memulai layanan PostgreSQL dan mengaktifkannya agar berjalan otomatis setiap kali sistem dinyalakan @postgres-arch-wiki:

#code(
  ```bash
  # Mulai layanan PostgreSQL sekarang
  sudo systemctl start postgresql

  # Aktifkan agar berjalan otomatis saat boot
  sudo systemctl enable postgresql

  # Verifikasi status layanan
  sudo systemctl status postgresql
  ```,
  caption: [Manajemen layanan PostgreSQL menggunakan `systemctl`],
)

Output `systemctl status postgresql` yang menunjukkan `Active: active (running)` berarti layanan berjalan dengan benar.

// PETUNJUK: Ganti dengan tangkap layar output systemctl status postgresql.
#figure(
  image("assets/systemctl-status.png", width: 90%),
  caption: [Output `systemctl status postgresql` menunjukkan layanan aktif],
)

=== Langkah 5: Membuat Role dan Database

PostgreSQL menggunakan konsep _role_ untuk manajemen akses yang menggabungkan konsep "user" dan "group" dari sistem Unix @postgres-psql. Secara bawaan, hanya role `postgres` yang ada. Buat role baru yang sesuai dengan nama user Linux aktif agar dapat terhubung ke PostgreSQL tanpa perintah `sudo -iu postgres` setiap saat:

#code(
  ```bash
  # Masuk sebagai user postgres
  sudo -iu postgres

  # Buat role baru (ganti 'nama_user' dengan username Linux Anda)
  createuser --interactive nama_user

  # Atau menggunakan psql secara langsung
  psql -c "CREATE ROLE nama_user WITH LOGIN CREATEDB PASSWORD 'kata_sandi_anda';"
  ```,
  caption: [Membuat role PostgreSQL baru menggunakan `createuser`],
)

Selanjutnya, buat basis data baru yang dimiliki oleh role yang baru dibuat:

#code(
  ```bash
  # Masih sebagai user postgres (atau sudah exit, jalankan dengan -U postgres)
  createdb -O nama_user nama_database

  # Contoh konkret:
  createdb -O atalariq praktikum_bd
  ```,
  caption: [Membuat basis data baru dengan `createdb`],
)

// PETUNJUK: Ganti dengan tangkap layar proses createuser dan createdb.
#figure(
  image("assets/createuser-createdb.png", width: 85%),
  caption: [Proses pembuatan role dan database baru di PostgreSQL],
)

=== Langkah 6: Mengakses PostgreSQL dengan `psql`

`psql` adalah klien terminal interaktif bawaan PostgreSQL yang memungkinkan eksekusi perintah SQL dan meta-perintah khusus @postgres-psql. Hubungkan ke basis data yang baru dibuat:

#code(
  ```bash
  # Format: psql -U <role> -d <database>
  psql -U nama_user -d nama_database

  # Contoh:
  psql -U atalariq -d praktikum_bd
  ```,
  caption: [Menghubungkan ke PostgreSQL menggunakan klien `psql`],
)

Setelah terhubung, coba beberapa perintah SQL dan meta-perintah `psql` dasar untuk memverifikasi instalasi berjalan normal:

#code(
  ```sql
  -- Lihat daftar semua database
  \l

  -- Lihat daftar semua role
  \du

  -- Buat tabel percobaan
  CREATE TABLE mahasiswa (
      id       SERIAL PRIMARY KEY,
      nim      VARCHAR(20) NOT NULL UNIQUE,
      nama     VARCHAR(100) NOT NULL,
      angkatan INTEGER
  );

  -- Sisipkan data
  INSERT INTO mahasiswa (nim, nama, angkatan)
  VALUES ('25/557554/SV/26192', 'Atalariq Barra Hadinugraha', 2025);

  -- Tampilkan isi tabel
  SELECT * FROM mahasiswa;

  -- Keluar dari psql
  \q
  ```,
  caption: [Verifikasi instalasi dengan membuat tabel dan mengisi data di `psql`],
)

// PETUNJUK: Ganti dengan tangkap layar sesi psql lengkap dari koneksi hingga SELECT.
#figure(
  image("assets/psql-session.png", width: 90%),
  caption: [Sesi `psql`: koneksi, pembuatan tabel, insert data, dan query SELECT],
)

Instalasi PostgreSQL via `pacman` selesai dan terverifikasi berfungsi.

---

== Cara 2: Docker (Best Practice)

Pendekatan Docker lebih dianjurkan untuk lingkungan pengembangan karena menghasilkan konfigurasi yang terisolasi, reproducible, dan mudah dikelola @docker-docs. PostgreSQL berjalan di dalam container sehingga tidak ada perubahan global pada sistem host selain instalasi Docker itu sendiri.

=== Langkah 1: Menginstal Docker dan Docker Compose

Instal Docker Engine dan plugin Compose dari repositori resmi Arch Linux:

#code(
  ```bash
  sudo pacman -S docker docker-compose
  ```,
  caption: [Instalasi Docker Engine dan Docker Compose via `pacman`],
)

Setelah instalasi, jalankan daemon Docker dan aktifkan agar berjalan saat boot:

#code(
  ```bash
  sudo systemctl start docker
  sudo systemctl enable docker

  # Verifikasi Docker berjalan
  sudo systemctl status docker

  # Verifikasi versi Docker dan Compose
  docker --version
  docker compose version
  ```,
  caption: [Mengaktifkan daemon Docker dan memverifikasi instalasi],
)

// PETUNJUK: Ganti dengan tangkap layar systemctl status docker dan output versi.
#figure(
  image("assets/docker-status.png", width: 90%),
  caption: [Status daemon Docker dan verifikasi versi `docker` serta `docker compose`],
)

Agar dapat menjalankan perintah `docker` tanpa `sudo`, tambahkan user Anda ke grup `docker`:

#code(
  ```bash
  sudo usermod -aG docker $USER

  # Terapkan perubahan grup tanpa perlu logout (untuk sesi aktif)
  newgrp docker
  ```,
  caption: [Menambahkan user aktif ke grup `docker` untuk akses tanpa `sudo`],
)

// PETUNJUK: Ganti dengan tangkap layar proses usermod dan verifikasi dengan `docker ps`.
#figure(
  image("assets/docker-usermod.png", width: 85%),
  caption: [Penambahan user ke grup `docker` dan verifikasi akses tanpa `sudo`],
)

=== Langkah 2: Membuat Struktur Direktori Proyek

Buat direktori kerja khusus untuk proyek basis data ini. Penggunaan direktori terpisah per proyek adalah best practice yang memudahkan manajemen konfigurasi @docker-compose-docs:

#code(
  ```bash
  mkdir -p ~/Dev/PostgreSQL
  cd ~/Dev/PostgreSQL
  ```,
  caption: [Membuat dan masuk ke direktori proyek],
)

=== Langkah 3: Membuat Berkas `docker-compose.yml`

Berkas `docker-compose.yml` adalah deklarasi _infrastructure-as-code_ yang mendefinisikan semua layanan, jaringan, dan volume yang dibutuhkan oleh proyek @docker-compose-docs. Buat berkas ini di dalam direktori proyek:

#code(
  ```yaml
  # ~/Dev/PostgreSQL/docker-compose.yml
  services:
    postgres:
      image: postgres:17-alpine           # Image resmi, varian alpine lebih ringan
      container_name: praktikum-postgres
      restart: unless-stopped             # Restart otomatis kecuali dihentikan manual
      environment:
        POSTGRES_USER: atalariq           # Superuser PostgreSQL di dalam container
        POSTGRES_PASSWORD: rahasia123     # Ganti dengan password yang kuat
        POSTGRES_DB: praktikum_bd         # Database yang dibuat otomatis saat init
        PGDATA: /var/lib/postgresql/data  # Direktori data di dalam container
      ports:
        - "5432:5432"                     # host:container — expose port ke host
      volumes:
        - postgres_data:/var/lib/postgresql/data  # Volume persisten untuk data
        - ./init-scripts:/docker-entrypoint-initdb.d  # Script SQL inisialisasi
      healthcheck:
        test: ["CMD-SHELL", "pg_isready -U atalariq -d praktikum_bd"]
        interval: 10s
        timeout: 5s
        retries: 5

  volumes:
    postgres_data:                        # Volume bernama — dikelola oleh Docker
      driver: local
  ```,
  caption: [Isi berkas `docker-compose.yml` untuk PostgreSQL 17 dengan volume persisten],
)

Beberapa poin penting dari konfigurasi ini. Penggunaan _named volume_ (`postgres_data`) sangat direkomendasikan dibanding _bind mount_ langsung ke direktori host karena Docker mengelola siklus hidup dan izin berkas secara otomatis @postgres-volumes. Variabel `POSTGRES_USER`, `POSTGRES_PASSWORD`, dan `POSTGRES_DB` diproses oleh skrip entrypoint resmi image PostgreSQL untuk membuat role dan database secara otomatis saat container pertama kali dijalankan @postgres-docker-hub. Direktori `./init-scripts` dipetakan ke `/docker-entrypoint-initdb.d` sehingga berkas SQL atau shell apa pun di dalamnya dieksekusi secara otomatis saat inisialisasi pertama.

// PETUNJUK: Ganti dengan tangkap layar isi berkas docker-compose.yml di editor.
// #figure(
//   image("assets/compose-file.png", width: 90%),
//   caption: [Berkas `docker-compose.yml` yang sudah dibuat di direktori proyek],
// )

=== Langkah 4: Membuat Skrip Inisialisasi Database

Buat direktori dan skrip SQL inisialisasi yang akan dieksekusi otomatis saat container pertama kali dijalankan:

#code(
  ```bash
  mkdir -p init-scripts
  ```,
  caption: [Membuat direktori untuk skrip inisialisasi],
)

#code(
  ```sql
  -- init-scripts/01-schema.sql
  -- Script ini dieksekusi otomatis oleh PostgreSQL saat container pertama diinisialisasi

  -- Membuat tabel mahasiswa
  CREATE TABLE IF NOT EXISTS mahasiswa (
      id       SERIAL PRIMARY KEY,
      nim      VARCHAR(20)  NOT NULL UNIQUE,
      nama     VARCHAR(100) NOT NULL,
      angkatan INTEGER      NOT NULL,
      prodi    VARCHAR(50),
      email    VARCHAR(100)
  );

  -- Mengisi data awal (seed data)
  INSERT INTO mahasiswa (nim, nama, angkatan, prodi, email) VALUES
      ('25/557554/SV/26192', 'Atalariq Barra Hadinugraha', 2025,
       'Teknologi Informasi', 'atalariq@mail.ugm.ac.id'),
      ('25/111111/SV/10001', 'Budi Santoso', 2025,
       'Teknologi Informasi', 'budi@mail.ugm.ac.id'),
      ('24/222222/SV/20002', 'Citra Dewi',   2024,
       'Akuntansi',           'citra@mail.ugm.ac.id');
  ```,
  caption: [Skrip SQL inisialisasi `01-schema.sql` untuk membuat tabel dan mengisi data awal],
)

// PETUNJUK: Ganti dengan tangkap layar isi berkas 01-schema.sql.
// #figure(
//   image("assets/init-sql.png", width: 90%),
//   caption: [Isi berkas skrip inisialisasi `01-schema.sql`],
// )

=== Langkah 5: Menjalankan Container PostgreSQL

Jalankan seluruh layanan yang didefinisikan di `docker-compose.yml` dengan perintah berikut dari dalam direktori proyek:

#code(
  ```bash
  # Jalankan container di background (detached mode)
  docker compose up -d

  # Pantau log container untuk memastikan tidak ada error
  docker compose logs -f postgres
  ```,
  caption: [Menjalankan container PostgreSQL dengan `docker compose up`],
)

Perintah `docker compose up -d` akan mengunduh image `postgres:17-alpine` dari Docker Hub (jika belum ada di lokal), membuat volume `postgres_data`, dan menjalankan container @docker-docs. Flag `-f` pada perintah `logs` membuat output mengikuti log secara _real-time_. Tekan `Ctrl+C` untuk berhenti memantau log tanpa menghentikan container.

// PETUNJUK: Ganti dengan tangkap layar proses docker compose up dan output logs.
// #figure(
//   image("assets/compose-up.png", width: 90%),
//   caption: [Output `docker compose up -d` dan log container PostgreSQL saat inisialisasi],
// )

Verifikasi bahwa container berjalan dan dalam kondisi sehat (_healthy_):

#code(
  ```bash
  # Lihat status container yang sedang berjalan
  docker compose ps

  # Atau menggunakan docker ps langsung
  docker ps
  ```,
  caption: [Memverifikasi status container yang sedang berjalan],
)

// PETUNJUK: Ganti dengan tangkap layar output docker compose ps atau docker ps.
// #figure(
//   image("assets/docker-ps.png", width: 90%),
//   caption: [Output `docker compose ps` menunjukkan container dalam status `healthy`],
// )

=== Langkah 6: Mengakses PostgreSQL di dalam Container

Ada dua cara untuk mengakses PostgreSQL yang berjalan di dalam container.

*Cara A: Menggunakan `psql` di dalam container* (tidak memerlukan `psql` terinstal di host):

#code(
  ```bash
  # Eksekusi perintah psql di dalam container yang sedang berjalan
  docker compose exec postgres psql -U atalariq -d praktikum_bd
  ```,
  caption: [Mengakses `psql` melalui `docker compose exec`],
)

*Cara B: Menggunakan `psql` dari host* (karena port 5432 sudah dipetakan):

#code(
  ```bash
  # Hubungkan dari host ke PostgreSQL di container melalui port yang dipetakan
  psql -h localhost -p 5432 -U atalariq -d praktikum_bd
  ```,
  caption: [Mengakses PostgreSQL container dari host melalui port yang dipetakan],
)

Setelah terhubung dengan salah satu cara di atas, jalankan beberapa kueri untuk memverifikasi bahwa skrip inisialisasi telah berjalan dengan benar:

#code(
  ```sql
  -- Periksa tabel yang ada di database ini
  \dt

  -- Tampilkan semua data mahasiswa (dari skrip init)
  SELECT * FROM mahasiswa;

  -- Tambahkan satu baris data baru
  INSERT INTO mahasiswa (nim, nama, angkatan, prodi, email)
  VALUES ('25/333333/SV/30003', 'Deni Kusuma', 2025,
          'Teknologi Listrik', 'deni@mail.ugm.ac.id');

  -- Tampilkan ulang untuk memverifikasi INSERT berhasil
  SELECT id, nim, nama, angkatan FROM mahasiswa ORDER BY id;

  -- Keluar
  \q
  ```,
  caption: [Verifikasi data dan pengujian INSERT melalui sesi `psql` di container],
)

// PETUNJUK: Ganti dengan tangkap layar sesi psql lengkap di dalam container.
// #figure(
//   image("assets/docker-psql-session.png", width: 90%),
//   caption: [Sesi `psql` di dalam container: verifikasi tabel, data inisialisasi, dan INSERT baru],
// )

=== Langkah 7: Mengelola Siklus Hidup Container

Berikut ini adalah perintah-perintah `docker compose` yang perlu diketahui untuk mengelola container PostgreSQL sehari-hari @docker-compose-docs:

#code(
  ```bash
  # Menghentikan container (data di volume tetap tersimpan)
  docker compose stop

  # Menjalankan kembali container yang dihentikan
  docker compose start

  # Menghentikan DAN menghapus container (data di named volume TETAP ada)
  docker compose down

  # Menghentikan, menghapus container, DAN menghapus volume (HAPUS SEMUA DATA)
  # Hati-hati: perintah ini tidak dapat dibatalkan
  docker compose down -v

  # Restart container (berguna setelah mengubah konfigurasi)
  docker compose restart postgres

  # Melihat resource usage (CPU, RAM) container
  docker stats praktikum-postgres
  ```,
  caption: [Perintah-perintah manajemen siklus hidup container PostgreSQL],
)

// PETUNJUK: Ganti dengan tangkap layar beberapa perintah di atas (minimal stop dan start).
// #figure(
//   image("assets/docker-lifecycle.png", width: 90%),
//   caption: [Demonstrasi perintah `docker compose stop` dan `docker compose start`],
// )

Perlu dicatat bahwa data PostgreSQL tersimpan di dalam _named volume_ `postgres_data` yang dikelola Docker @postgres-volumes. Volume ini bertahan bahkan setelah container dihapus dengan `docker compose down`. Data baru hilang hanya jika secara eksplisit menggunakan flag `-v` pada perintah `down`. Ini adalah perbedaan penting yang menjamin keamanan data saat container didaur ulang atau diperbarui versinya.


// ============================================================
// D. KESIMPULAN
// ============================================================
= Kesimpulan

Praktikum ini berhasil menyelesaikan instalasi dan konfigurasi PostgreSQL di Arch Linux menggunakan dua metode yang berbeda secara fundamental.

Metode pertama melalui `pacman` menghasilkan instalasi PostgreSQL yang terintegrasi dengan sistem operasi host: layanan dikelola `systemd`, berkas konfigurasi mengikuti konvensi direktori standar Arch Linux, dan PostgreSQL siap digunakan sebagai layanan persisten di mesin yang sama. Metode ini cocok ketika PostgreSQL dibutuhkan sebagai layanan permanen yang selalu berjalan di sistem, misalnya pada server produksi berskala kecil atau mesin pengembangan tunggal yang tidak perlu berbagi konfigurasi dengan orang lain.

Metode kedua menggunakan Docker dan `docker-compose` menghasilkan instalasi yang terisolasi, _reproducible_, dan mudah dikelola. Seluruh konfigurasi terdokumentasi dalam satu berkas `docker-compose.yml` yang dapat di-_commit_ ke repositori Git, sehingga siapa pun dapat mereproduksi lingkungan yang identik hanya dengan satu perintah `docker compose up -d`. Data tersimpan aman di _named volume_ yang bertahan di luar siklus hidup container, dan pembaruan versi PostgreSQL semudah mengubah tag image lalu menjalankan ulang container.

Dari sisi pembelajaran SQL dan basis data relasional, kedua metode menghasilkan PostgreSQL yang fungsional identik. Namun untuk proyek pengembangan, metode Docker lebih direkomendasikan karena mengurangi risiko "works on my machine", memudahkan kolaborasi tim, dan tidak meninggalkan perubahan global pada sistem host.


#pagebreak()
#bibliography(
  "references.bib",
  title: "Referensi",
  style: "ieee",
  // full: true,
)
