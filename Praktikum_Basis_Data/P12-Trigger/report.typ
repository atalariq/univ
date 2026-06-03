#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Basis Data",
  course-code: "PBD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "12",
  title: "Trigger",
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
#let img(path, ..args) = image-wrapper(read(path, encoding: none), width: 90%, ..args)

= Hasil dan Pembahasan

== Tugas 1: Trigger Backup Data Pegawai yang Dihapus

Pada tugas pertama, dibuat tabel `deleted_employees` untuk menyimpan data pegawai yang dihapus dari tabel `employees`. Tabel ini memiliki struktur yang serupa dengan tabel `employees`, dengan penambahan kolom `deleted_at` untuk mencatat waktu penghapusan dan kolom `deleted_by` untuk mencatat nama pengguna Oracle yang melakukan operasi penghapusan.

#code(numbering: false,
```sql
CREATE TABLE deleted_employees (
    employee_id   NUMBER(6)             NOT NULL,
    first_name    VARCHAR2(20 BYTE),
    last_name     VARCHAR2(25 BYTE)     NOT NULL,
    email         VARCHAR2(25 BYTE)     NOT NULL,
    phone         VARCHAR2(20 BYTE),
    hire_date     DATE                  NOT NULL,
    manager_id    NUMBER(6),
    job_title     VARCHAR2(35 BYTE),
    deleted_at    DATE                  NOT NULL,
    deleted_by    VARCHAR2(128)
);
```)

#img("assets/tugas-1.1-create_table.png", caption: [Tabel `deleted_employees` berhasil dibuat.])

Selanjutnya, dibuat _trigger_ `trg_employees_delete_backup` yang akan berjalan sebelum operasi `DELETE` pada tabel `employees`. _Trigger_ ini didefinisikan dengan tingkat `FOR EACH ROW` sehingga dapat mengakses _pseudorecord_ `:OLD` yang berisi nilai-nilai dari setiap baris yang akan dihapus.

#code(numbering: false,
```sql
CREATE OR REPLACE TRIGGER trg_employees_delete_backup
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO deleted_employees (
        employee_id,
        first_name,
        last_name,
        email,
        phone,
        hire_date,
        manager_id,
        job_title,
        deleted_at,
        deleted_by
    ) VALUES (
        :OLD.employee_id,
        :OLD.first_name,
        :OLD.last_name,
        :OLD.email,
        :OLD.phone,
        :OLD.hire_date,
        :OLD.manager_id,
        :OLD.job_title,
        SYSDATE,
        USER
    );
END;
/
```)

#img("assets/tugas-1.2-create_trigger.png", caption: [_Trigger_ `trg_employees_delete_backup` berhasil dibuat.])

Penggunaan `BEFORE DELETE` memastikan bahwa data pegawai disalin ke tabel `deleted_employees` sebelum baris tersebut benar-benar dihapus dari tabel `employees`. _Pseudorecord_ `:OLD` menyediakan akses terhadap nilai-nilai dari baris yang sedang diproses oleh operasi `DELETE`, termasuk `employee_id`, `first_name`, `last_name`, dan kolom-kolom lainnya. Fungsi bawaan `SYSDATE` digunakan untuk mencatat _timestamp_ saat penghapusan terjadi, sedangkan fungsi `USER` merekam nama pengguna Oracle yang melakukan operasi tersebut.

Untuk memverifikasi bahwa _trigger_ berfungsi dengan benar, dilakukan serangkaian operasi: pengecekan data pegawai sebelum penghapusan, eksekusi `DELETE`, verifikasi data pada tabel `deleted_employees`, eksekusi `ROLLBACK`, serta pengecekan ulang setelah transaksi dibatalkan.

#code(numbering: false,
```sql
-- Lihat data pegawai yang ada
SELECT employee_id, first_name, last_name, email
FROM employees
WHERE employee_id = 100;
```)

#img("assets/tugas-1.3a-query.png", caption: [Data pegawai `employee_id = 100` sebelum penghapusan.])

#code(numbering: false,
```sql
-- Hapus satu pegawai
DELETE FROM employees
WHERE employee_id = 100;
```)

#img("assets/tugas-1.3b-delete.png", caption: [Operasi `DELETE` pada pegawai `employee_id = 100`.])

#code(numbering: false,
```sql
-- Cek apakah data tersimpan di tabel backup
SELECT * FROM deleted_employees;
```)

#img("assets/tugas-1.3c-query_log.png", caption: [Data terbackup di `deleted_employees` setelah `DELETE`.])

Setelah data berhasil dicatat oleh _trigger_, dilakukan operasi `ROLLBACK` untuk membatalkan seluruh perubahan pada sesi transaksi.

#code(numbering: false,
```sql
-- ROLLBACK kalau cuma test
ROLLBACK;
```)

#img("assets/tugas-1.3d-rollback.png", caption: [Operasi `ROLLBACK` berhasil dieksekusi.])

#code(numbering: false,
```sql
-- Cek apakah data tersimpan di tabel backup setelah ROLLBACK
SELECT * FROM deleted_employees;
```)

#img("assets/tugas-1.3e-query_after_rollback.png", caption: [Data backup masih ada setelah `ROLLBACK`.])

#code(numbering: false,
```sql
-- Cek tabel log setelah rollback
SELECT * FROM deleted_employees;
```)

#img("assets/tugas-1.3f-log_now_clean.png", caption: [Tabel `deleted_employees` dalam kondisi kosong.])

#pagebreak()

== Tugas 2: Trigger Riwayat Perubahan Harga Produk

Pada tugas kedua, dibuat tabel `price_change` untuk menyimpan riwayat setiap perubahan harga yang terjadi pada tabel `products`. Tabel ini memiliki kolom `change_id` yang didefinisikan sebagai _identity column_ sehingga nilai unik dibangkitkan secara otomatis oleh _database engine_ untuk setiap baris yang disisipkan.

#code(numbering: false,
```sql
CREATE TABLE price_change (
    change_id     NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    product_id    NUMBER(6)   NOT NULL,
    date_updated  DATE        NOT NULL,
    old_price     NUMBER(9,2),
    new_price     NUMBER(9,2)
);
```)

#img("assets/tugas-2.1-create_table.png", caption: [Tabel `price_change` berhasil dibuat.])

Selanjutnya, dibuat _trigger_ `trg_products_price_change` yang akan berjalan sebelum operasi `UPDATE` pada kolom `list_price` tabel `products`. Klausa `BEFORE UPDATE OF list_price` memastikan _trigger_ hanya diaktifkan ketika kolom `list_price` ikut dimodifikasi, sehingga lebih efisien dibandingkan dengan _trigger_ yang bereaksi terhadap perubahan pada kolom lain.

#code(numbering: false,
```sql
CREATE OR REPLACE TRIGGER trg_products_price_change
BEFORE UPDATE OF list_price ON products
FOR EACH ROW
BEGIN
    IF :OLD.list_price != :NEW.list_price
       OR (:OLD.list_price IS NULL AND :NEW.list_price IS NOT NULL)
       OR (:OLD.list_price IS NOT NULL AND :NEW.list_price IS NULL)
    THEN
        INSERT INTO price_change (
            product_id,
            date_updated,
            old_price,
            new_price
        ) VALUES (
            :OLD.product_id,
            SYSDATE,
            :OLD.list_price,
            :NEW.list_price
        );
    END IF;
END;
/
```)

#img("assets/tugas-2.2-create_trigger.png", caption: [_Trigger_ `trg_products_price_change` berhasil dibuat.])

Di dalam body _trigger_, dilakukan pengecekan kondisi untuk memastikan harga benar-benar berubah sebelum mencatat ke tabel riwayat. Kondisi tersebut menangani tiga kemungkinan: nilai harga berbeda antara `:OLD` dan `:NEW`, nilai `NULL` pada `:OLD` yang diubah menjadi non-`NULL`, serta nilai non-`NULL` pada `:OLD` yang diubah menjadi `NULL`. _Pseudorecord_ `:OLD` berisi harga sebelum perubahan, sedangkan `:NEW` berisi harga setelah perubahan.

Untuk memverifikasi bahwa _trigger_ berfungsi dengan benar, dilakukan serangkaian operasi: pengecekan harga produk sebelum perubahan, eksekusi `UPDATE` harga, verifikasi data pada tabel `price_change`, pengembalian harga ke nilai semula, serta operasi `ROLLBACK`.

#code(numbering: false,
```sql
-- Lihat harga produk saat ini
SELECT product_id, product_name, list_price
FROM products
WHERE product_id = 1;
```)

#img("assets/tugas-2.3a-query.png", caption: [Harga produk `product_id = 1` sebelum perubahan.])

#code(numbering: false,
```sql
-- Update harga produk
UPDATE products
SET list_price = 999.99
WHERE product_id = 1;
```)

Setelah perubahan harga, dilakukan pengecekan pada tabel `price_change` untuk memastikan perubahan tercatat.

#code(numbering: false,
```sql
-- Cek riwayat perubahan harga
SELECT * FROM price_change;
```)

#img("assets/tugas-2.3c-query_log.png", caption: [Perubahan harga tercatat di `price_change`.])

Selanjutnya, harga produk dikembalikan ke nilai semula untuk menguji apakah _trigger_ kembali mencatat perubahan.

#code(numbering: false,
```sql
-- Kembalikan ke harga semula
UPDATE products
SET list_price = 640.99
WHERE product_id = 1;
```)

#img("assets/tugas-2.3d-update_like_before.png", caption: [Operasi `UPDATE` kedua mengembalikan harga ke `640.99`.])

#code(numbering: false,
```sql
-- Cek riwayat lagi (sekarang ada 2 baris)
SELECT * FROM price_change;
```)

#img("assets/tugas-2.3e-query_log_again.png", caption: [Dua baris riwayat perubahan harga di `price_change`.])

#code(numbering: false,
```sql
-- ROLLBACK kalau cuma test
ROLLBACK;
```)

#img("assets/tugas-2.3f-rollback.png", caption: [Operasi `ROLLBACK` berhasil dieksekusi.])

#code(numbering: false,
```sql
-- Cek riwayat lagi (sekarang ada 0 baris)
SELECT * FROM price_change;
```)

#img("assets/tugas-2.3g-log_now_clean.png", caption: [Tabel `price_change` dalam kondisi kosong.])
