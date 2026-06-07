# Trigger pada Oracle Database — Guided Learning

## Daftar Isi

1. [Apa itu Trigger?](#1-apa-itu-trigger)
2. [Jenis-Jenis Trigger](#2-jenis-jenis-trigger)
3. [Struktur Dasar Trigger](#3-struktur-dasar-trigger)
4. [Trigger Event: BEFORE vs AFTER](#4-trigger-event-before-vs-after)
5. [Trigger FOR EACH ROW vs FOR EACH STATEMENT](#5-trigger-for-each-row-vs-for-each-statement)
6. [Pseudorecord :OLD dan :NEW](#6-pseudorecord-old-dan-new)
7. [Contoh-Contoh Trigger](#7-contoh-contoh-trigger)
8. [Best Practices & Pitfalls](#8-best-practices--pitfalls)

---

## 1. Apa itu Trigger?

Secara sederhana: **Trigger adalah PL/SQL block yang otomatis jalan (fire) ketika suatu event terjadi pada tabel/view.**

Bayangin kayak **"alarm"** atau **"sensor"** di database:

- Kamu setup suatu aturan: *"Kalau ada data pegawai yang dihapus, simpan dulu data lamanya ke tabel backup."*
- Trigger yang akan **nge-detect event DELETE** di tabel `employees`, lalu **otomatis menjalankan kode** untuk insert ke `deleted_employees`.
- Kamu gak perlu panggil manual — trigger jalan sendiri setiap kali event-nya terjadi.

### Kenapa pake Trigger?

| Situasi | Tanpa Trigger | Dengan Trigger |
|----------|---------------|----------------|
| Mau backup data yang dihapus | Tulis INSERT manual di setiap DELETE statement | Trigger jalan otomatis |
| Mau catat perubahan harga | Harus ingat update 2 tabel tiap kali | Trigger handle sendiri |
| Validasi kompleks | Logic tersebar di kode app | Terpusat di DB |
| Audit trail | Rawan lupa/logika bocor | Konsisten & reliable |

### Kapan Trigger Cocok?

- **Audit & logging**: catat siapa ngapain dan kapan
- **Enforce business rules**: validasi yang terlalu kompleks untuk constraint biasa
- **Maintain derived data**: update kolom summary, stock, dll
- **Security**: cegah operasi di jam tertentu

> **⚠️ Peringatan:** Trigger itu **silent**. Karena jalan otomatis, kalau ada bug di trigger, user/app gak bakal sadar — query mereka tiba-tiba error atau lambat. **Gunakan dengan hati-hati.**

---

## 2. Jenis-Jenis Trigger

Oracle punya beberapa kategori trigger. Yang penting untuk praktikum:

### Berdasarkan Timing (kapan jalan)

| Timing | Arti |
|--------|------|
| **BEFORE** | Jalan **sebelum** operasi DML dieksekusi |
| **AFTER** | Jalan **setelah** operasi DML selesai |
| **INSTEAD OF** | Jalan **menggantikan** operasi DML (khusus VIEW) |

### Berdasarkan Level (berapa kali jalan)

| Level | Arti |
|-------|------|
| **FOR EACH ROW** | Jalan **sekali per baris** yang terpengaruh → bisa akses :OLD/:NEW |
| **FOR EACH STATEMENT** | Jalan **sekali per statement** → gak bisa akses :OLD/:NEW |

### Berdasarkan Event

- **INSERT** — data baru ditambahkan
- **UPDATE** — data diubah
- **DELETE** — data dihapus
- **INSERT OR UPDATE OR DELETE** — kombinasi

### Variasi Lain

- **Compound Trigger**: gabungan BEFORE/AFTER + row/statement level dalam 1 trigger (advanced)
- **DDL Trigger**: fire pas CREATE/ALTER/DROP (jarang di praktikum)
- **System/DB Event Trigger**: fire pas STARTUP/SHUTDOWN/LOGON

---

## 3. Struktur Dasar Trigger

```sql
CREATE [OR REPLACE] TRIGGER nama_trigger
{BEFORE | AFTER | INSTEAD OF}
{INSERT | UPDATE | DELETE}
[OF column_name]
ON table_name
[FOR EACH ROW]
[WHEN (condition)]
DECLARE
    -- deklarasi variabel (opsional)
BEGIN
    -- PL/SQL logic
END;
/
```

### Penjelasan per bagian

| Bagian | Penjelasan |
|--------|------------|
| `CREATE OR REPLACE` | Buat baru / ganti yg lama. Best practice biar gak error kalau udah ada. |
| `BEFORE / AFTER` | Kapan trigger jalan? |
| `INSERT / UPDATE / DELETE` | Event apa yang memicu? |
| `OF column_name` | Khusus UPDATE: trigger cuma jalan kalau kolom tertentu di-update |
| `FOR EACH ROW` | Wajib kalau mau akses `:OLD` / `:NEW` |
| `WHEN (condition)` | Filter tambahan: trigger cuma jalan kalau kondisi terpenuhi |
| `BEGIN ... END;` | Body trigger: PL/SQL code yang dijalankan |

---

## 4. BEFORE vs AFTER — Kapan Pilih yang Mana?

### BEFORE Trigger

**Jalan SEBELUM data ditulis ke disk.**

Cocok untuk:
- **Validasi**: cegah operasi yang melanggar aturan bisnis
- **Set nilai default/modifikasi data**: ubah nilai kolom SEBELUM disimpan
- **Enforce constraint yang gak bisa pake CHECK constraint biasa**

```sql
-- Contoh: otomatis set tanggal 1 ke first day of month
CREATE OR REPLACE TRIGGER trg_employees_before_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    :NEW.hire_date := TRUNC(:NEW.hire_date, 'MM');
END;
/
```

### AFTER Trigger

**Jalan SETELAH data ditulis ke disk.**

Cocok untuk:
- **Audit & logging**: data sudah aman di tabel, tinggal catat
- **Replicate/sync ke tabel lain**: mirip backup
- **Update aggregate data**: stok barang, jumlah pesanan, dll

```sql
-- Contoh: catat log setelah delete
CREATE OR REPLACE TRIGGER trg_employees_after_delete
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO audit_log(table_name, action, record_id, timestamp)
    VALUES ('EMPLOYEES', 'DELETE', :OLD.employee_id, SYSDATE);
END;
/
```

### Rule of Thumb

| Situasi | Pilih |
|---------|-------|
| Mau **memodifikasi** nilai yg di-INSERT/UPDATE | **BEFORE** |
| Mau **validasi dan raise error** kalau gak lolos | **BEFORE** |
| Mau **catat ke tabel audit** | **AFTER** |
| Mau **sinkron data ke tabel backup** | **AFTER** |
| Data di tabel utama harus **dulu lengkap** sebelum aksi | **AFTER** |

---

## 5. FOR EACH ROW vs FOR EACH STATEMENT

### FOR EACH ROW

Fire **sekali per baris**. Kalau UPDATE mempengaruhi 5 baris, trigger jalan 5x.

✅ Bisa akses `:OLD` dan `:NEW`
✅ Cocok untuk operasi per-baris
❌ Lebih lambat kalau banyak baris

### FOR EACH STATEMENT (default)

Fire **sekali per SQL statement**, berapa pun baris yang terpengaruh.

❌ Gak bisa akses `:OLD` / `:NEW`
✅ Lebih efisien untuk operasi batch
✅ Satu-satunya pilihan untuk DDL / system event trigger

```sql
-- FOR EACH STATEMENT: log bahwa ada yg delete dari employees
-- TAPI gak tau baris mana aja yg kehapus
CREATE OR REPLACE TRIGGER trg_employees_delete_stmt
AFTER DELETE ON employees
BEGIN
    INSERT INTO audit_log(table_name, action, timestamp)
    VALUES ('EMPLOYEES', 'DELETE', SYSDATE);
END;
/
```

**Untuk tugas praktikum, 99% pakenya FOR EACH ROW** karena butuh akses `:OLD` / `:NEW`.

---

## 6. Pseudorecord :OLD dan :NEW

Ini konsep paling penting di trigger row-level.

| Pseudorecord | INSERT | UPDATE | DELETE |
|--------------|--------|--------|--------|
| **:OLD** | NULL (gak ada data lama) | Nilai sebelum update | Nilai sebelum dihapus |
| **:NEW** | Nilai yang akan di-insert | Nilai yang akan di-update | NULL (gak ada) |

### Cara Akses

Pake tanda colon (`:`) di awal:

```sql
:OLD.column_name
:NEW.column_name
```

**⚠️ Penting:**

- `:OLD` dan `:NEW` **READ-ONLY** di AFTER trigger
- `:NEW` bisa **diubah** di BEFORE trigger kalau mau override nilai
- `:OLD` gak bisa diubah kapan pun
- Kolom yang gak relevan akan NULL (misal `:NEW.hire_date` di DELETE trigger)

### Contoh Praktis

**INSERT trigger:**
```sql
:OLD = NULL
:NEW = data baru yang masuk
```

**UPDATE trigger:**
```sql
:OLD = data sebelum update    (misal: harga = 10000)
:NEW = data setelah update    (misal: harga = 12000)
```

**DELETE trigger:**
```sql
:OLD = data yang akan dihapus (misal: semua kolom employee)
:NEW = NULL
```

---

## 7. Contoh-Contoh Trigger

### Contoh 1: Audit Delete (mirip tugas 1 kamu)

```sql
-- Buat tabel backup dulu
CREATE TABLE deleted_employees AS
SELECT * FROM employees WHERE 1 = 0;

-- Trigger untuk backup data yang dihapus
CREATE OR REPLACE TRIGGER trg_employees_backup
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO deleted_employees
    VALUES (
        :OLD.employee_id,
        :OLD.first_name,
        :OLD.last_name,
        :OLD.email,
        :OLD.phone,
        :OLD.hire_date,
        :OLD.manager_id,
        :OLD.job_title,
        :OLD.department_id,
        SYSDATE  -- tambah timestamp kapan dihapus
    );
END;
/
```

### Contoh 2: Track Perubahan Harga (mirip tugas 2)

```sql
CREATE TABLE price_change (
    change_id     NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    product_id    NUMBER(6) NOT NULL,
    date_updated  DATE NOT NULL,
    old_price     NUMBER(9,2),
    new_price     NUMBER(9,2)
);

CREATE OR REPLACE TRIGGER trg_products_price_log
BEFORE UPDATE OF list_price ON products
FOR EACH ROW
BEGIN
    INSERT INTO price_change(
        product_id, date_updated, old_price, new_price
    ) VALUES (
        :OLD.product_id,
        SYSDATE,
        :OLD.list_price,
        :NEW.list_price
    );
END;
/
```

### Contoh 3: Validasi — Cegah DELETE di Jam Kerja

```sql
CREATE OR REPLACE TRIGGER trg_employees_no_delete_office_hours
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    IF TO_CHAR(SYSDATE, 'HH24:MI') BETWEEN '08:00' AND '17:00' THEN
        RAISE_APPLICATION_ERROR(-20001,
            'Tidak bisa menghapus data pegawai selama jam kerja!');
    END IF;
END;
/
```

### Contoh 4: Auto-generate ID

```sql
CREATE OR REPLACE TRIGGER trg_products_before_insert
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    SELECT products_seq.NEXTVAL INTO :NEW.product_id FROM DUAL;
END;
/
```

---

## 8. Best Practices & Pitfalls

### ✅ Best Practices

1. **Beri nama trigger yang deskriptif**
   - `trg_{tabel}_{event}` atau `{tabel}_{before|after}_{insert|update|delete}`
   - Contoh: `trg_employees_audit_delete`

2. **Jaga body trigger tetap sederhana**
   - Trigger bukan tempat buat logic 100 baris. Kalau terlalu kompleks, pindahin ke prosedur yang dipanggil dari trigger.

3. **Test trigger secara terpisah**
   - Coba INSERT/UPDATE/DELETE yang normal dulu, baru pasang trigger
   - Uji juga edge case: UPDATE yang gak ngubah apa-apa, DELETE baris yang gak ada, dll.

4. **Dokumentasi**
   - Kasih komentar di trigger yang menjelaskan **kenapa** trigger ini ada, bukan **apa** yang dilakukan.

5. **Pertimbangkan mutating table**
   - Di FOR EACH ROW, trigger gak bisa SELECT dari tabel yang sama (mutating table error). Gunakan compound trigger atau temporary table kalau perlu.

### ❌ Common Pitfalls

| Pitfall | Masalah | Solusi |
|---------|---------|--------|
| **Mutating Table** | Trigger FOR EACH ROW coba SELECT dari tabel sendiri | Pake compound trigger atau after statement |
| **Recursive Trigger** | Trigger insert ke tabel yang punya trigger lagi → infinite loop | Pake trigger variable atau nolak state |
| **Side Effect Tersembunyi** | App dikasih error aneh gara-gara trigger gagal | Error handling di trigger |
| **Performa** | Trigger FOR EACH ROW di tabel besar | Minimalisir logic; pake FOR EACH STATEMENT kalau bisa |
| **Lupa BEFORE/AFTER** | Mau pakai :NEW tapi di AFTER trigger → read-only | Pake BEFORE trigger kalau mau modif :NEW |

### Debugging Trigger

Oracle menyediakan beberapa cara:

```sql
-- 1. Lihat semua trigger di schema
SELECT trigger_name, table_name, status
FROM user_triggers
ORDER BY trigger_name;

-- 2. Cek body trigger
SELECT trigger_body
FROM user_triggers
WHERE trigger_name = 'TRG_EMPLOYEES_BACKUP';

-- 3. Enable/disable trigger
ALTER TRIGGER trg_employees_backup DISABLE;
ALTER TRIGGER trg_employees_backup ENABLE;

-- 4. Drop trigger
DROP TRIGGER trg_employees_backup;
```

### Ringkasan Mental Model

```
[User executes DML]
       │
       ▼
┌─────────────────┐      ┌──────────────────────┐
│ BEFORE STATEMENT │ ──►  │ FOR EACH STATEMENT   │
│ trigger (if any) │      │ trigger fire (1x)    │
└─────────────────┘      └──────────────────────┘
       │
       ▼
  ┌──────────┐     ┌──────────────────────┐
  │ BEFORE   │ ──► │ FOR EACH ROW trigger │
  │ EACH ROW │     │ fire (per baris)     │
  │ trigger  │     └──────────────────────┘
  └──────────┘              │
       │                    ▼
       ▼              ┌──────────┐
  ┌──────────┐        │ AFTER    │
  │ DML     │ ───────►│ EACH ROW │
  │ execute │         │ trigger  │
  └──────────┘        └──────────┘
       │
       ▼
┌─────────────────┐
│ AFTER STATEMENT │
│ trigger (if any)│
└─────────────────┘
       │
       ▼
    [DONE]
```

---

*Referensi: [Oracle Tutorial — Trigger](https://www.oracletutorial.com/plsql-tutorial/oracle-trigger)*
