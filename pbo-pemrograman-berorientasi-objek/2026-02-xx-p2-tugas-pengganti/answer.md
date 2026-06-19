# Tugas Pengganti PBO Pertemuan 2

## 1. Identifikasi Class Utama

### 1.1 Class yang Diperlukan

Sistem memerlukan tiga class utama, yaitu `Buku`, `Anggota`, dan `Petugas`.

### 1.2 Alasan dan Peran Setiap Class

**Buku** - Class ini diperlukan karena buku merupakan entitas utama dalam sistem perpustakaan. Perannya adalah menyimpan informasi detail mengenai koleksi buku seperti kode, judul, dan penulis, serta mengelola status ketersediaan buku secara terkini.

**Anggota** - Class ini diperlukan untuk mendata pengguna yang memiliki hak mengakses layanan perpustakaan. Perannya adalah menyimpan identitas anggota meliputi ID, nama, dan kelas, serta mengelola jumlah peminjaman aktif yang sedang dilakukan.

**Petugas** - Class ini diperlukan untuk mengoordinasikan seluruh aktivitas peminjaman dan pengembalian buku. Perannya adalah memproses logika bisnis seperti memvalidasi peminjaman, mencatat transaksi pengembalian, dan memastikan aturan perpustakaan dipatuhi oleh setiap anggota.

### 1.3 Kategorisasi Class

- **Entity class**: `Buku` dan `Anggota`. Kedua class ini berfokus pada penyimpanan data dan perilaku dasar objek.
- **Control class**: `Petugas`. Class ini mengendalikan aliran informasi dan mengelola interaksi antar entity class.

## 2. Identifikasi Atribut (Properties)

### 2.1 Class Buku

| No  | Atribut    | Tipe Data | Kategori   | Level Akses |
| --- | ---------- | --------- | ---------- | ----------- |
| 1   | kodeBuku   | String    | Identitas  | Private     |
| 2   | judul      | String    | Deskriptif | Private     |
| 3   | penulis    | String    | Deskriptif | Private     |
| 4   | isTersedia | Boolean   | Status     | Private     |

**Alasan level akses**: Atribut bersifat private agar entitas luar tidak dapat memanipulasi status ketersediaan buku secara langsung tanpa melalui proses validasi yang sesuai.

### 2.2 Class Anggota

| No  | Atribut             | Tipe Data | Kategori   | Level Akses |
| --- | ------------------- | --------- | ---------- | ----------- |
| 1   | idAnggota           | String    | Identitas  | Private     |
| 2   | nama                | String    | Deskriptif | Private     |
| 3   | kelas               | String    | Deskriptif | Private     |
| 4   | jumlahPinjamanAktif | Integer   | Status     | Private     |

**Alasan level akses**: Akses private mencegah perubahan jumlah pinjaman secara sembarangan di luar prosedur peminjaman atau pengembalian yang sah.

### 2.3 Class Petugas

| No  | Atribut               | Tipe Data     | Kategori   | Level Akses |
| --- | --------------------- | ------------- | ---------- | ----------- |
| 1   | daftarBuku            | List<Buku>    | Status     | Private     |
| 2   | daftarAnggota         | List<Anggota> | Status     | Private     |
| 3   | batasPinjamanMaksimal | Integer       | Deskriptif | Private     |

**Alasan level akses**: Hanya class Petugas yang boleh mengelola koleksi data utama untuk menjaga konsistensi data seluruh sistem.

## 3. Identifikasi Method (Behavior)

### 3.1 Class Buku

| Method                     | Tipe Return | Kategori        | Akses  |
| -------------------------- | ----------- | --------------- | ------ |
| ubahStatus(boolean status) | void        | Manipulasi Data | Public |
| getInfoBuku()              | String      | Informasi       | Public |
| cekKetersediaan()          | Boolean     | Validasi        | Public |

**Refleksi Encapsulation**: Method memberikan antarmuka yang aman untuk mengubah status buku. Dengan memanggil `ubahStatus()`, sistem memastikan perubahan status hanya terjadi melalui proses yang benar, bukan manipulasi langsung dari luar class.

### 3.2 Class Anggota

| Method                      | Tipe Return | Kategori        | Akses   |
| --------------------------- | ----------- | --------------- | ------- |
| tambahPinjaman()            | void        | Manipulasi Data | Public  |
| kurangiPinjaman()           | void        | Manipulasi Data | Public  |
| getInfoAnggota()            | String      | Informasi       | Public  |
| cekBatasPinjaman(int batas) | Boolean     | Validasi        | Public  |
| validasiFormatId()          | Boolean     | Validasi        | Private |

**Refleksi Encapsulation**: Setiap perubahan pada jumlah pinjaman harus melalui method yang telah dirancang dengan validasi, bukan perubahan nilai variabel secara langsung. Hal ini mencegah inkonsistensi data.

### 3.3 Class Petugas

| Method                                | Tipe Return | Kategori        | Akses   |
| ------------------------------------- | ----------- | --------------- | ------- |
| tambahBuku(Buku b)                    | void        | Manipulasi Data | Public  |
| tambahAnggota(Anggota a)              | void        | Manipulasi Data | Public  |
| prosesPeminjaman(Anggota a, Buku b)   | boolean     | Manipulasi Data | Public  |
| prosesPengembalian(Anggota a, Buku b) | boolean     | Manipulasi Data | Public  |
| cariBuku(String kode)                 | Buku        | Informasi       | Public  |
| tampilkanDaftarBuku()                 | void        | Informasi       | Public  |
| validasiAnggota(String id)            | boolean     | Validasi        | Private |
| validasiBuku(String kode)             | boolean     | Validasi        | Private |

## 4. Identifikasi Object

### 4.1 Perbedaan Class dan Object

Class adalah blueprint atau kerangka abstrak yang mendefinisikan struktur data dan perilaku yang dimiliki oleh suatu objek. Class tidak memiliki ruang di memori sampai diinstansiasi.

Object adalah implementasi konkret dari class. Object tercipta dari class dan memiliki nilai atribut spesifik yang mengisi ruang memori. Dalam konteks sistem ini, class Buku adalah template, sedangkan buku dengan judul "Laskar Pelangi" dan kode "BK-001" adalah object.

### 4.2 Contoh Object Konkret

**Object 1:**

- Class: Buku
- Nilai atribut: kodeBuku="B-001", judul="Laskar Pelangi", penulis="Andrea Hirata", isTersedia=true

**Object 2:**

- Class: Anggota
- Nilai atribut: idAnggota="A-102", nama="Budi Santoso", kelas="XI IPA 2", jumlahPinjamanAktif=1

**Object 3:**

- Class: Buku
- Nilai atribut: kodeBuku="B-002", judul="Atomic Habits", penulis="James Clear", isTersedia=false

### 4.3 Alokasi Memori

Ketika sebuah object dibuat, sistem operasi mengalokasikan ruang di Heap Memory untuk menyimpan nilai-nilai atribut object tersebut. Variabel referensi yang digunakan di program utama ditempatkan di Stack Memory, dan variabel ini menyimpan alamat atau referensi menuju lokasi object di Heap. Ketika object tidak lagi digunakan, Java Garbage Collector akan membersihkan memori yang dipakai.

## 5. Relasi Antar Class

### 5.1 Hubungan Antar Class

Ya, terdapat hubungan antar class dalam sistem ini. Ketiga class saling berinteraksi untuk membentuk sistem yang fungsional.

### 5.2 Jenis-Jenis Hubungan

**Association** - Hubungan interaksi umum antara dua class yang saling membutuhkan namun tetap dapat berdiri sendiri. Anggota berinteraksi dengan Buku saat proses peminjam, namun keduanya tetap eksis secara mandiri meskipun tidak terjadi transaksi.

**Aggregation** - Hubungan "has-a" yang bersifat lemah. Petugas memiliki koleksi Buku dan Anggota. Jika sistem dihentikan, data buku dan anggota secara logis tetap ada dan dapat digunakan kembali.

**Composition** - Hubungan "part-of" yang bersifat kuat. Jika dalam pengembangan sistem dibuat class Halaman sebagai bagian dari Buku, maka Halaman tidak memiliki makna jika class Buku dihapus.

### 5.3 Diagram Relasi Sederhana

```
    Petugas
   /        \
  |          |
  v          v
Buku ---- Anggota
```

### 5.4 Analisis Multiplicity

- **Apakah satu anggota bisa memiliki lebih dari satu buku?** Ya, dapat. Hubungan antara Anggota dan peminjaman adalah one-to-many (1 ke 0..\*), artinya satu anggota diperbolehkan meminjam beberapa buku sekaligus sesuai dengan batas yang ditetapkan.

- **Apakah satu buku bisa dipinjam oleh lebih dari satu anggota secara bersamaan?** Tidak, tidak dapat. Satu eksemplar buku fisik hanya bisa dimiliki oleh satu peminjam pada satu waktu. Status isTersedia akan berubah menjadi false ketika buku sedang dipinjam.

## 6. Analisis Desain

### 6.1 Class Tambahan Jika Sistem Berkembang

Jika sistem berkembang menjadi lebih besar, beberapa class tambahan yang perlu dipertimbangkan antara lain:

- **Kategori/Genre** - Untuk mengklasifikasikan buku berdasarkan genre sehingga memudahkan pencarian dan filtering.
- **Pustakawan** - Untuk memisahkan hak akses antara petugas perpustakaan dan anggota.
- **Denda** - Untuk mencatat dan menghitung denda keterlambatan pengembalian buku.
- **Notifikasi** - Untuk mengirimkan pengingat kepada anggota tentang batas waktu pengembalian.

### 6.2 Perlunya Class Transaksi

Ya, class Transaksi sangat diperlukan. Sistem saat ini hanya mencatat perubahan status buku saat dipinjam atau dikembalikan. Pendekatan ini memiliki kelemahan karena tidak menyimpan rekam jejak historis peminjaman.

Dengan adanya class Transaksi, sistem dapat mencatat:

- Siapa yang meminjam buku tertentu
- Kapan buku tersebut dipinjam
- Kapan harus dikembalikan
- Riwayat lengkap peminjaman setiap anggota

Class Transaksi mengikat objek Buku dan Anggota dengan informasi tambahan seperti tanggal pinjam dan tanggal jatuh tempo. Pendekatan ini memastikan audit trail yang baik untuk kebutuhan pelaporan dan evaluasi.

### 6.3 Risiko Jika Semua Fungsi Dimasukkan ke Satu Class

Jika semua fungsi dimasukkan ke dalam satu class saja, akan muncul beberapa risiko serius:

- **God Class Anti-Pattern**: Class akan menjadi terlalu besar dan sulit untuk dibaca, dipahami, maupun di-debug ketika terjadi kesalahan.
- **Tidak Ada Separation of Concerns**: Perubahan pada satu fitur berpotensi merusak fitur lain yang tidak terkait.
- **Kode Tidak Reusable**: Semua logika tertanam dalam satu unit besar sehingga tidak dapat digunakan kembali di sistem lain.
- **Sulit Dikembangkan Secara Tim**: Banyak developer harus bekerja di file yang sama sehingga menyebabkan konflik.
- **Melanggar Single Responsibility Principle (SRP)**: Setiap class seharusnya hanya memiliki satu alasan untuk berubah, namun hal ini dilanggar ketika semua tanggung jawab dipaksakan dalam satu class.

## 7. Refleksi Konseptual

### 7.1 Mengapa OOP Lebih Cocok untuk Sistem Perpustakaan

OOP lebih cocok digunakan karena sistem perpustakaan memiliki banyak entitas dengan karakteristik dan perilaku masing-masing. Pendekatan OOP memungkinkan pemodelan data buku, data anggota, dan proses peminjaman sebagai objek yang memiliki data dan perilaku terintegrasi dalam satu unit.

Berbeda dengan pemrograman prosedural yang memisahkan data dari fungsi yang mengolahnya, OOP menyatukan keduanya. Pendekatan prosedural rentan terhadap ketidakkonsistenan data pada aplikasi berskala menengah hingga besar karena fungsi-fungsi tersebar tanpa keterkaitan yang jelas dengan data spesifik yang dimanipulasinya.

OOP juga mendukung prinsip pewarisan dan polimorfisme yang memungkinkan pengembangan sistem secara bertahap tanpa mengganggu kode yang sudah ada.

### 7.2 Dampak Jika Atribut Dapat Diakses Langsung dari Luar Class

Jika atribut seperti isTersedia pada class Buku dapat diubah secara langsung dari luar class, maka akan muncul masalah serius. Pihak luar dapat memanipulasi data tanpa melewati aturan bisnis yang telah ditetapkan.

Sebagai contoh, seseorang dapat mengubah status buku menjadi "tersedia" padahal buku tersebut secara fisik belum dikembalikan oleh anggota yang meminjam. Hal ini menciptakan inkonsistensi data yang serius dan dapat menyebabkan konflik peminjaman ganda.

Dengan encapsulation, setiap perubahan status hanya dapat dilakukan melalui method yang telah didesain dengan validasi yang tepat, sehingga integritas data tetap terjaga.

### 7.3 Bagaimana Konsep Object Membantu Merepresentasikan Dunia Nyata

Konsep object dalam OOP sangat membantu dalam merepresentasikan entitas dunia nyata karena mengikat state (data) dan behavior (perilaku) menjadi satu kesatuan logis.

Sebuah buku fisik di dunia nyata memiliki judul dan penulis (state) serta dapat dibaca atau dipinjam (behavior). Pemetaan langsung ini membuat program lebih mudah dipahami, bahkan oleh orang yang bukan programmer, karena konsepnya sesuai dengan pemahaman umum tentang objek di dunia nyata.

Inilah keunggulan utama OOP: kode yang ditulis dalam bahasa yang dekat dengan cara berpikir manusia tentang entitas di dunia nyata, sehingga proses pengembangan dan pemeliharaan menjadi lebih intuitif.
