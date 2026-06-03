#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Basis Data",
  course-code: "PBD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "7",
  title: "Pembuatan Tabel dan Manipulasi Data dengan SQL",
)

#show: report.with(
  ..metadata,
  association: (
    program: "D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK",
    department: "DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA",
    faculty: "SEKOLAH VOKASI",
    university: "UNIVERSITAS GADJAH MADA",
    city: "YOGYAKARTA",
    logo: image("assets/logo.png", width: 6cm),
  ),
  year: 2026,
  use-cover: true,
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
  bib: bibliography("references.bib"),
)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), ..args)

#daftar-isi()

= Tujuan Praktikum

+ Memahami konsep database relasional dan peran RDBMS dalam pengelolaan data terstruktur.
+ Mengimplementasikan pembuatan tabel menggunakan perintah DDL `CREATE TABLE` beserta definisi tipe data dan primary key pada PostgreSQL.
+ Memasukkan data ke dalam tabel menggunakan perintah DML `INSERT INTO`.
+ Menampilkan data dari tabel menggunakan perintah DML `SELECT`.

= Dasar Teori

== Database Relasional dan RDBMS

Database relasional adalah model penyimpanan data yang mengorganisasi informasi ke dalam satu atau lebih tabel, di mana setiap tabel merepresentasikan satu entitas dengan kolom sebagai atribut dan baris sebagai rekaman. Relational Database Management System (RDBMS) adalah perangkat lunak yang mengimplementasikan model tersebut sekaligus menyediakan mekanisme untuk mendefinisikan struktur data, memanipulasi isinya, dan menjaga integritasnya @ramakrishnan2003. PostgreSQL merupakan salah satu RDBMS open-source yang mendukung penuh standar SQL serta menyediakan tipe data tambahan seperti array, JSON, dan tipe buatan pengguna @silberschatz2020.

== SQL, DDL, dan DML

Structured Query Language (SQL) adalah bahasa standar untuk berinteraksi dengan database relasional. SQL terbagi menjadi beberapa sub-bahasa, dua di antaranya yang relevan dalam praktikum ini @silberschatz2020:

/ *Data Definition Language* (DDL): perintah yang mendefinisikan atau mengubah struktur objek database, mencakup `CREATE`, `ALTER`, dan `DROP`.
/ *Data Manipulation Language* (DML): perintah yang memanipulasi isi data dalam tabel, mencakup `INSERT`, `UPDATE`, `DELETE`, dan `SELECT`.

Pemisahan ini penting secara konseptual karena DDL bekerja pada level skema (struktur), sedangkan DML bekerja pada level instansi (data aktual) @ramakrishnan2003.

== Tipe Data pada PostgreSQL

Pemilihan tipe data yang tepat berdampak langsung pada efisiensi penyimpanan, validasi otomatis, dan performa query. Tipe data yang digunakan dalam skema `employees` pada praktikum ini antara lain @postgresql2024:

/ `INTEGER`: bilangan bulat 4 byte. PostgreSQL tidak mengenal konstruksi lebar tampilan seperti `INT(11)` pada MySQL; kapasitas sepenuhnya ditentukan oleh tipe, bukan argumennya.
/ `VARCHAR(n)`: string dengan panjang variabel hingga $n$ karakter; hanya mengalokasikan ruang sesuai panjang aktual.
/ `CHAR(n)`: string dengan panjang tetap $n$ karakter; cocok untuk kode terstruktur seperti `dept_no` yang selalu terdiri dari tepat empat karakter.
/ `DATE`: tanggal tanpa komponen waktu, disimpan sebagai 4 byte.
/ Tipe ENUM kustom (`CREATE TYPE ... AS ENUM`): PostgreSQL mengimplementasikan ENUM sebagai tipe database mandiri yang harus didefinisikan sebelum digunakan sebagai tipe kolom, berbeda dengan MySQL yang mendefinisikannya secara inline.

== Primary Key, Composite Key, dan Index

Primary key adalah satu atau lebih kolom yang secara unik mengidentifikasi setiap baris dalam tabel dan secara implisit menolak nilai `NULL`. Ketika primary key terdiri dari lebih dari satu kolom, disebut composite key @ramakrishnan2003. Skema `employees` menggunakan composite key pada tabel-tabel junction seperti `dept_emp` karena seorang karyawan dapat berada di satu departemen pada satu periode, dan kombinasi `emp_no` dengan `dept_no` baru membentuk identitas yang unik.

Index adalah struktur data tambahan, umumnya berupa B-tree, yang mempercepat operasi pencarian dengan mengorbankan sedikit ruang penyimpanan dan overhead pada operasi tulis. PostgreSQL secara otomatis membuat index untuk setiap kolom yang dideklarasikan sebagai primary key atau unique @postgresql2024. Index tambahan perlu dibuat secara eksplisit menggunakan `CREATE INDEX` untuk kolom yang sering digunakan sebagai filter dalam query.

== Perangkat Lunak: PostgreSQL dan DBeaver

PostgreSQL adalah sistem manajemen basis data relasional-objek (ORDBMS) open-source yang dikembangkan oleh PostgreSQL Global Development Group. PostgreSQL mendukung fitur lanjutan seperti tipe data kustom, fungsi window, CTE, dan kepatuhan penuh terhadap standar ACID @postgresql2024.

DBeaver adalah aplikasi manajemen database berbasis GUI yang mendukung ratusan jenis database melalui driver JDBC. DBeaver Community Edition bersifat open-source dan menyediakan antarmuka untuk menulis dan mengeksekusi query SQL, melihat struktur skema secara visual, serta mengelola koneksi ke berbagai DBMS termasuk PostgreSQL.

#img("assets/dbeaver-postgresql.png", width: 90%, caption: [Tampilan DBeaver])

= Hasil dan Pembahasan

== Pembuatan Tabel

Sebelum mendefinisikan tabel `employees`, tipe ENUM untuk kolom `gender` perlu didefinisikan terlebih dahulu sebagai tipe kustom tingkat database menggunakan `CREATE TYPE`.

#code(
  header: [DDL — Definisi Tipe dan Pembuatan Tabel],
  ```sql
  -- Tipe ENUM kustom untuk kolom gender
  CREATE TYPE gender_type AS ENUM ('M', 'F');

  -- Tabel employees: satu baris per karyawan
  CREATE TABLE employees (
      emp_no     INTEGER      NOT NULL,
      birth_date DATE         NOT NULL,
      first_name VARCHAR(14)  NOT NULL,
      last_name  VARCHAR(16)  NOT NULL,
      gender     gender_type  NOT NULL,
      hire_date  DATE         NOT NULL,
      PRIMARY KEY (emp_no)
  );

  -- Tabel departments: satu baris per departemen
  CREATE TABLE departments (
      dept_no   CHAR(4)     NOT NULL,
      dept_name VARCHAR(40) NOT NULL,
      PRIMARY KEY (dept_no),
      UNIQUE (dept_name)
  );

  -- Tabel dept_emp: riwayat karyawan per departemen
  CREATE TABLE dept_emp (
      emp_no    INTEGER NOT NULL,
      dept_no   CHAR(4) NOT NULL,
      from_date DATE    NOT NULL,
      to_date   DATE    NOT NULL,
      PRIMARY KEY (emp_no, dept_no)
  );
  CREATE INDEX idx_dept_emp_emp_no  ON dept_emp (emp_no);
  CREATE INDEX idx_dept_emp_dept_no ON dept_emp (dept_no);

  -- Tabel dept_manager: riwayat manajer per departemen
  CREATE TABLE dept_manager (
      dept_no   CHAR(4)  NOT NULL,
      emp_no    INTEGER  NOT NULL,
      from_date DATE     NOT NULL,
      to_date   DATE     NOT NULL,
      PRIMARY KEY (dept_no, emp_no)
  );
  CREATE INDEX idx_dept_manager_emp_no  ON dept_manager (emp_no);
  CREATE INDEX idx_dept_manager_dept_no ON dept_manager (dept_no);

  -- Tabel salaries: riwayat gaji karyawan
  CREATE TABLE salaries (
      emp_no    INTEGER NOT NULL,
      salary    INTEGER NOT NULL,
      from_date DATE    NOT NULL,
      to_date   DATE    NOT NULL,
      PRIMARY KEY (emp_no, from_date)
  );
  CREATE INDEX idx_salaries_emp_no ON salaries (emp_no);

  -- Tabel titles: riwayat jabatan karyawan
  CREATE TABLE titles (
      emp_no    INTEGER     NOT NULL,
      title     VARCHAR(50) NOT NULL,
      from_date DATE        NOT NULL,
      to_date   DATE,
      PRIMARY KEY (emp_no, title, from_date)
  );
  CREATE INDEX idx_titles_emp_no ON titles (emp_no);
  ```,
)

Terdapat beberapa aspek penting dalam DDL di atas. Pertama, `gender_type` didefinisikan di luar tabel karena PostgreSQL mengimplementasikan ENUM sebagai tipe database mandiri, bukan sebagai atribut kolom seperti pada MySQL. Konsekuensinya, tipe ini dapat digunakan kembali di tabel lain dalam database yang sama jika diperlukan.

Kedua, `INT(11)` dari diagram asli (sintaks MySQL) dikonversi menjadi `INTEGER` pada PostgreSQL. Angka `11` pada MySQL hanya menyatakan lebar tampilan, bukan kapasitas penyimpanan, sehingga tidak memiliki padanan fungsional di PostgreSQL.

Ketiga, composite primary key digunakan pada tabel-tabel junction. Pada `dept_emp`, kombinasi `(emp_no, dept_no)` membentuk primary key karena seorang karyawan dapat berpindah departemen seiring waktu -- `emp_no` saja tidak cukup mengidentifikasi baris secara unik. Hal yang sama berlaku pada `salaries` dengan `(emp_no, from_date)` dan `titles` dengan `(emp_no, title, from_date)`.

Keempat, index tambahan dibuat secara eksplisit pada kolom `emp_no` dan `dept_no` di tabel junction. PostgreSQL hanya membuat index otomatis untuk kolom primary key; kolom non-leading lainnya tidak mendapat index secara otomatis. Query yang memfilter berdasarkan `emp_no` saja (misalnya, mencari semua riwayat gaji seorang karyawan) tidak dapat memanfaatkan composite primary key secara efisien karena `emp_no` bukan kolom terdepan pada semua tabel.

#img("assets/create.png", caption: "Hasil eksekusi DDL pada DBeaver", width: 90%)

== Penambahan Data

Data dummy dimasukkan menggunakan perintah `INSERT INTO`. Tabel yang tidak bergantung pada data tabel lain (`employees` dan `departments`) diisi terlebih dahulu, diikuti oleh tabel junction yang mereferensikan keduanya.

#code(
  header: [DML — INSERT INTO],
  ```sql
  -- employees (5 karyawan)
  INSERT INTO employees VALUES
  (10001, '1953-09-02', 'Georgi',    'Facello',  'M', '1986-06-26'),
  (10002, '1964-06-02', 'Bezalel',   'Simmel',   'F', '1985-11-21'),
  (10003, '1959-12-03', 'Parto',     'Bamford',  'M', '1986-08-28'),
  (10004, '1954-05-01', 'Chirstian', 'Koblick',  'M', '1986-12-01'),
  (10005, '1955-01-21', 'Kyoichi',   'Maliniak', 'M', '1989-09-12');

  -- departments (5 departemen)
  INSERT INTO departments VALUES
  ('d001', 'Marketing'),
  ('d002', 'Finance'),
  ('d003', 'Human Resources'),
  ('d004', 'Production'),
  ('d005', 'Development');

  -- dept_emp
  INSERT INTO dept_emp VALUES
  (10001, 'd005', '1986-06-26', '9999-01-01'),
  (10002, 'd002', '1996-08-03', '9999-01-01'),
  (10003, 'd004', '1995-12-03', '9999-01-01'),
  (10004, 'd004', '1986-12-01', '9999-01-01'),
  (10005, 'd003', '1989-09-12', '9999-01-01');

  -- dept_manager
  INSERT INTO dept_manager VALUES
  ('d001', 10001, '1991-10-01', '9999-01-01'),
  ('d002', 10002, '1989-08-17', '9999-01-01'),
  ('d003', 10003, '1992-03-21', '9999-01-01'),
  ('d004', 10004, '1988-09-09', '9999-01-01'),
  ('d005', 10005, '1990-01-03', '9999-01-01');

  -- salaries (emp_no 10001 memiliki dua entri riwayat gaji)
  INSERT INTO salaries VALUES
  (10001, 60117, '1986-06-26', '1987-06-26'),
  (10001, 62102, '1987-06-26', '9999-01-01'),
  (10002, 65828, '1996-08-03', '9999-01-01'),
  (10003, 40006, '1995-12-03', '9999-01-01'),
  (10004, 40054, '1986-12-01', '9999-01-01'),
  (10005, 78228, '1989-09-12', '9999-01-01');

  -- titles (emp_no 10004 memiliki dua riwayat jabatan)
  INSERT INTO titles VALUES
  (10001, 'Senior Engineer', '1986-06-26', '9999-01-01'),
  (10002, 'Staff',           '1996-08-03', '9999-01-01'),
  (10003, 'Senior Engineer', '1995-12-03', '9999-01-01'),
  (10004, 'Engineer',        '1986-12-01', '1995-12-01'),
  (10004, 'Senior Engineer', '1995-12-01', '9999-01-01'),
  (10005, 'Senior Staff',    '1996-09-12', '9999-01-01');
  ```,
)

PostgreSQL mendukung sintaks multi-row `INSERT` (satu perintah dengan banyak baris nilai), yang lebih efisien dibandingkan menjalankan satu perintah `INSERT` per baris karena mengurangi jumlah round-trip ke server.

Nilai `'9999-01-01'` pada kolom `to_date` merupakan konvensi sentinel untuk merepresentasikan status "masih aktif". Pendekatan ini umum digunakan pada tabel yang menyimpan riwayat temporal sebagai alternatif dari `NULL`, yang secara semantik ambigu: `NULL` dapat berarti "tidak diketahui" atau "tidak berlaku", sedangkan `'9999-01-01'` secara eksplisit menyatakan "belum berakhir".

Perlu diperhatikan bahwa `emp_no 10001` pada tabel `salaries` dan `emp_no 10004` pada tabel `titles` memiliki dua baris masing-masing. Ini bukan duplikasi, melainkan representasi riwayat yang sah karena composite primary key mencakup `from_date` atau `title` sebagai bagian dari kunci, sehingga kedua baris tersebut unik.

#img("assets/insert.png", caption: "Hasil eksekusi INSERT pada DBeaver", width: 90%)

#pagebreak()

== Penampilan Data

Data yang telah dimasukkan ditampilkan menggunakan perintah `SELECT` untuk memverifikasi hasil insert.

#code(
  header: [DML — SELECT],
  ```sql
  SELECT * FROM employees;
  SELECT * FROM departments;
  SELECT * FROM dept_emp;
  SELECT * FROM dept_manager;
  SELECT * FROM salaries;
  SELECT * FROM titles;
  ```,
)

Perintah `SELECT *` mengambil seluruh kolom dari tabel yang ditentukan. Wildcard `*` berarti semua kolom dikembalikan tanpa seleksi eksplisit. Pada praktikum ini, `SELECT *` digunakan untuk memverifikasi bahwa data tersimpan dengan benar sesuai tipe dan nilai yang didefinisikan.

Dalam konteks produksi, penggunaan `SELECT *` umumnya dihindari karena mengembalikan kolom yang mungkin tidak diperlukan, meningkatkan beban transfer data, dan membuat query rentan terhadap perubahan skema. Namun untuk tujuan verifikasi pasca-insert seperti pada praktikum ini, penggunaannya sudah sesuai.

#img("assets/select.png", caption: "Hasil eksekusi SELECT pada DBeaver", width: 90%)

#pagebreak()

= Kesimpulan

+ Database relasional mengorganisasi data dalam tabel berstruktur dengan tipe data yang terdefinisi secara ketat. PostgreSQL sebagai RDBMS menegakkan validasi tersebut secara otomatis, termasuk penolakan nilai yang tidak sesuai tipe ENUM saat `INSERT` dijalankan.
+ Perintah DDL `CREATE TABLE` mendefinisikan skema tabel termasuk tipe data tiap kolom dan primary key. Pada PostgreSQL, tipe ENUM harus didefinisikan terlebih dahulu sebagai tipe kustom menggunakan `CREATE TYPE` sebelum dapat digunakan sebagai tipe kolom.
+ Composite primary key digunakan pada tabel junction (`dept_emp`, `dept_manager`, `salaries`, `titles`) karena tidak ada kolom tunggal yang cukup mengidentifikasi baris secara unik. Kombinasi dua atau lebih kolom baru membentuk identitas yang valid, sekaligus memungkinkan representasi data historis pada tabel yang sama.
+ Perintah DML `INSERT INTO` dengan sintaks multi-row memungkinkan pengisian data secara efisien. Urutan insert perlu memperhatikan dependensi data antar tabel meskipun foreign key belum didefinisikan pada tahap ini.
+ Perintah `SELECT` memverifikasi bahwa data tersimpan dengan benar sesuai tipe dan nilai yang didefinisikan, mengonfirmasi bahwa seluruh DDL dan DML berfungsi sebagaimana mestinya pada PostgreSQL melalui antarmuka DBeaver.
