# Jawaban: Studi Kasus Sistem Manajemen Perpustakaan Sederhana

---

## 1. Identifikasi Class Utama

### 1.1 Class-Class Utama yang Diperlukan

Sistem manajemen perpustakaan ini memerlukan minimal tiga class utama, yaitu
`Buku`, `Anggota`, dan `Perpustakaan`. Sebagai tambahan yang direkomendasikan,
class `Peminjaman` perlu dipertimbangkan sejak awal perancangan.

**Class `Buku`** diperlukan karena buku merupakan entitas inti dari sistem
perpustakaan. Setiap buku memiliki identitas unik, deskripsi, dan status yang
dapat berubah. Peran class ini adalah merepresentasikan data buku serta
mengelola status ketersediaannya secara mandiri.

**Class `Anggota`** diperlukan karena pengguna perpustakaan memiliki identitas
tersendiri dan dapat melakukan aksi peminjaman atau pengembalian buku. Peran
class ini adalah menyimpan data anggota dan menjadi aktor yang berinteraksi
dengan buku.

**Class `Perpustakaan`** diperlukan untuk mengelola koleksi buku dan daftar
anggota secara terpusat. Class ini berperan sebagai pengelola seluruh operasi
sistem, termasuk koordinasi antara anggota dan buku.

**Class `Peminjaman`** (direkomendasikan) diperlukan untuk merepresentasikan
transaksi peminjaman sebagai entitas tersendiri. Tanpa class ini, riwayat
peminjaman tidak dapat dicatat secara permanen.

### 1.2 Klasifikasi Class

- **Entity class** (class yang berfokus menyimpan dan merepresentasikan data):
  `Buku`, `Anggota`, dan `Peminjaman`.
- **Control class** (class yang mengatur alur logika dan proses bisnis):
  `Perpustakaan`, karena class ini mengkoordinasikan validasi, pencatatan, dan
  seluruh operasi antar entitas.

---

## 2. Identifikasi Atribut (Properties)

### 2.1 Class `Buku`

Atribut identitas:
- `kodeBuku` bertipe `String`, akses `private`. Kode ini bersifat unik dan
  tidak boleh diubah sembarangan dari luar class.

Atribut deskriptif:
- `judul` bertipe `String`, akses `private`.
- `penulis` bertipe `String`, akses `private`.

Atribut status:
- `tersedia` bertipe `boolean`, akses `private`. Status ini hanya boleh diubah
  melalui method resmi class, bukan secara langsung dari luar.

### 2.2 Class `Anggota`

Atribut identitas:
- `idAnggota` bertipe `String`, akses `private`.

Atribut deskriptif:
- `nama` bertipe `String`, akses `private`.
- `kelas` bertipe `String`, akses `private`.

Atribut status:
- `daftarPinjaman` bertipe `List<Buku>`, akses `private`. Daftar ini
  mencerminkan buku-buku yang sedang dipinjam oleh anggota tersebut.

### 2.3 Class `Peminjaman`

Atribut identitas:
- `idTransaksi` bertipe `String`, akses `private`.

Atribut deskriptif:
- `anggota` bertipe `Anggota`, akses `private`.
- `buku` bertipe `Buku`, akses `private`.
- `tanggalPinjam` bertipe `Date`, akses `private`.
- `tanggalKembali` bertipe `Date`, akses `private`.

Atribut status:
- `sudahDikembalikan` bertipe `boolean`, akses `private`.

### 2.4 Alasan Seluruh Atribut Bersifat `private`

Semua atribut pada ketiga class di atas dideklarasikan `private` sebagai
penerapan prinsip **encapsulation**. Data hanya dapat diakses atau dimodifikasi
melalui method yang telah dikontrol, sehingga mencegah perubahan data yang
tidak sah dari luar class.

---

## 3. Identifikasi Method (Behavior)

### 3.1 Class `Buku`

Method untuk manipulasi data:
- `pinjam()`, akses `public`. Method ini mengubah nilai `tersedia` menjadi
  `false` ketika buku dipinjam.
- `kembalikan()`, akses `public`. Method ini mengubah nilai `tersedia` menjadi
  `true` ketika buku dikembalikan.
- `setJudul(String judul)`, akses `public`. Setter dengan validasi internal
  agar nilai tidak kosong.

Method untuk menampilkan informasi:
- `getKodeBuku()`, `getJudul()`, `getPenulis()`, akses `public`. Getter standar
  untuk membaca atribut dari luar class.

Method untuk validasi:
- `isTersedia()`, akses `public`. Mengecek apakah buku dapat dipinjam.

### 3.2 Class `Anggota`

Method untuk manipulasi data:
- `pinjamBuku(Buku b)`, akses `public`. Menambahkan buku ke daftar pinjaman
  setelah validasi.
- `kembalikanBuku(Buku b)`, akses `public`. Menghapus buku dari daftar pinjaman
  dan memperbarui status buku.

Method untuk menampilkan informasi:
- `getDaftarPinjaman()`, akses `public`. Mengembalikan daftar buku yang sedang
  dipinjam.
- `getNama()`, `getIdAnggota()`, `getKelas()`, akses `public`.

Method untuk validasi (bersifat internal):
- `sudahMeminjamBuku(Buku b)`, akses `private`. Mengecek apakah anggota sudah
  meminjam buku yang sama.
- `melebihiBatasMaxPinjam()`, akses `private`. Mengecek apakah jumlah pinjaman
  sudah mencapai batas maksimum.

### 3.3 Class `Perpustakaan`

Method untuk manipulasi data:
- `tambahBuku(Buku b)`, akses `public`.
- `tambahAnggota(Anggota a)`, akses `public`.
- `prosesPeminjaman(Anggota a, Buku b)`, akses `public`.
- `prosesKembalikan(Anggota a, Buku b)`, akses `public`.

Method untuk menampilkan informasi:
- `cariBuku(String kode)`, akses `public`.
- `tampilkanSemuaBuku()`, akses `public`.
- `tampilkanRiwayatPeminjaman()`, akses `public`.

Method untuk validasi (bersifat internal):
- `validasiAnggota(String idAnggota)`, akses `private`.
- `validasiBuku(String kodeBuku)`, akses `private`.

### 3.4 Hubungan Method dengan Prinsip Encapsulation

Prinsip encapsulation tercermin pada cara method-method internal seperti
`sudahMeminjamBuku()` dan `melebihiBatasMaxPinjam()` tidak perlu diketahui
atau dipanggil dari luar class. Method-method tersebut hanya digunakan secara
internal oleh `pinjamBuku()`. Pihak luar hanya perlu tahu bahwa ada operasi
`pinjamBuku()`, tanpa peduli bagaimana validasinya bekerja di dalam. Pendekatan
ini menyembunyikan kompleksitas implementasi dan hanya memaparkan antarmuka
yang relevan.

---

## 4. Identifikasi Object

### 4.1 Perbedaan Class dan Object

Class adalah blueprint atau cetakan yang mendefinisikan struktur (atribut) dan
perilaku (method) dari suatu entitas. Class tidak menempati memori heap secara
langsung. Object adalah instansi konkret dari class yang dibuat saat program
berjalan. Dalam konteks sistem ini, `Buku` adalah class, sedangkan buku
berjudul "Laskar Pelangi" dengan kode "BK-001" adalah object.

### 4.2 Contoh Object Konkret

**Object 1:**
- Class: `Buku`
- Nilai atribut: `kodeBuku = "BK-001"`, `judul = "Laskar Pelangi"`,
  `penulis = "Andrea Hirata"`, `tersedia = true`

**Object 2:**
- Class: `Anggota`
- Nilai atribut: `idAnggota = "A-042"`, `nama = "Budi Santoso"`,
  `kelas = "XI IPA 2"`, `daftarPinjaman = []`

**Object 3:**
- Class: `Peminjaman`
- Nilai atribut: `idTransaksi = "TRX-2024-001"`,
  `anggota = [Object Budi Santoso]`, `buku = [Object Laskar Pelangi]`,
  `tanggalPinjam = 01/03/2024`, `sudahDikembalikan = false`

### 4.3 Yang Terjadi di Memori Saat Object Dibuat

Ketika sebuah object dibuat dengan perintah seperti
`Buku b1 = new Buku("BK-001", "Laskar Pelangi", "Andrea Hirata")`, dua area
memori terlibat. Pertama, variabel `b1` dialokasikan di **stack**, dan variabel
ini menyimpan referensi (alamat memori) ke object. Kedua, object `Buku` yang
sebenarnya dialokasikan di **heap**, di mana seluruh atributnya diinisialisasi
oleh constructor. Referensi di stack kemudian diarahkan ke lokasi object di
heap. Ketika object tidak lagi direferensikan, **garbage collector** akan
membebaskan memori heap yang ditempatinya.

---

## 5. Relasi Antar Class

### 5.1 Keberadaan Hubungan Antar Class

Ya, terdapat hubungan antar class dalam sistem ini. Hubungan tersebut meliputi
association, aggregation, dan composition.

### 5.2 Jenis-Jenis Hubungan

**Association** adalah hubungan di mana dua class saling berinteraksi tetapi
masing-masing dapat berdiri sendiri. Dalam sistem ini, `Anggota` berasosiasi
dengan `Buku` melalui proses peminjaman. Jika tidak ada proses peminjaman,
kedua class tetap eksis secara mandiri.

**Aggregation** adalah hubungan kepemilikan yang longgar, di mana bagian dapat
eksis tanpa keseluruhan. `Perpustakaan` memiliki koleksi `Buku` dan daftar
`Anggota`. Jika objek `Perpustakaan` dihapus, objek `Buku` dan `Anggota` masih
dapat eksis secara konseptual karena kepemilikannya tidak eksklusif.

**Composition** adalah hubungan kepemilikan yang kuat, di mana bagian tidak
dapat eksis tanpa keseluruhan. Class `Peminjaman` adalah komposisi dari
`Anggota` dan `Buku`. Tanpa referensi ke anggota dan buku yang valid, objek
`Peminjaman` tidak memiliki makna dan tidak dapat dibuat.

Ringkasan relasi:
- `Perpustakaan` memiliki banyak `Buku` (agregasi, `1` ke `*`)
- `Perpustakaan` memiliki banyak `Anggota` (agregasi, `1` ke `*`)
- `Anggota` terlibat dalam banyak `Peminjaman` (komposisi, `1` ke `0..*`)
- `Buku` terlibat dalam banyak `Peminjaman` (komposisi, `1` ke `0..*`)

### 5.3 Pertanyaan Lanjutan tentang Multiplicity

**Apakah satu anggota bisa meminjam lebih dari satu buku?** Ya. Relasi antara
`Anggota` dan `Peminjaman` bersifat `1` ke `0..*`, artinya satu anggota dapat
memiliki beberapa catatan peminjaman aktif. Perlu ada batasan bisnis, misalnya
maksimal tiga buku sekaligus, yang diimplementasikan melalui method validasi
internal.

**Apakah satu buku bisa dipinjam oleh lebih dari satu anggota secara
bersamaan?** Tidak. Atribut `tersedia` pada class `Buku` berubah menjadi
`false` ketika dipinjam, sehingga buku tersebut tidak dapat dipinjam oleh
anggota lain sampai dikembalikan. Satu eksemplar buku fisik hanya bisa dimiliki
oleh satu peminjam aktif pada satu waktu.

---

## 6. Analisis Desain

### 6.1 Class Tambahan Jika Sistem Berkembang

Jika sistem bertambah besar, beberapa class berikut perlu dipertimbangkan:

- `Kategori` atau `Genre`, untuk mengklasifikasikan buku sehingga fitur
  pencarian dan filter dapat berjalan.
- `Notifikasi`, untuk mengirimkan pengingat kepada anggota ketika tanggal jatuh
  tempo pengembalian mendekati.
- `Admin` atau `Petugas`, untuk memisahkan hak akses antara anggota biasa dan
  pengelola perpustakaan.
- `Laporan`, untuk menghasilkan statistik peminjaman, buku terpopuler, atau
  anggota paling aktif.
- `Denda`, untuk mencatat dan menghitung denda keterlambatan pengembalian.

### 6.2 Apakah Class `Peminjaman` Perlu Ditambahkan?

Ya, class `Peminjaman` perlu ditambahkan. Tanpa class ini, sistem tidak dapat
mencatat **riwayat peminjaman**. Ketika buku dikembalikan, data tentang siapa
yang meminjam, kapan dipinjam, dan kapan dikembalikan akan hilang. Class
`Peminjaman` juga menjadi fondasi untuk fitur denda (membutuhkan
`tanggalJatuhTempo`), laporan statistik, dan audit. Tanpa class ini, logika
peminjaman terpaksa dimasukkan ke dalam `Anggota` atau `Buku`, yang membuat
kedua class tersebut memiliki tanggung jawab yang melampaui batas seharusnya.

### 6.3 Risiko Semua Fungsi Dimasukkan ke Satu Class

Jika seluruh fungsi sistem dimasukkan ke dalam satu class, beberapa masalah
akan muncul:

- Class tersebut akan menjadi **God Class**, yaitu class yang terlalu besar
  dan mengetahui terlalu banyak hal, sehingga sulit dibaca dan di-debug.
- Tidak ada pemisahan tanggung jawab (*separation of concerns*). Perubahan pada
  satu fitur berisiko merusak fitur lain yang tidak terkait.
- Kode tidak dapat digunakan ulang (*reusable*) di sistem lain karena semua
  logika terikat dalam satu unit yang besar.
- Pengerjaan secara tim menjadi sulit karena banyak developer harus mengubah
  file yang sama secara bersamaan.
- Desain ini melanggar prinsip **Single Responsibility Principle (SRP)**, yaitu
  setiap class seharusnya hanya memiliki satu alasan untuk berubah.

---

## 7. Refleksi Konseptual

### 7.1 Mengapa OOP Lebih Cocok dari Pendekatan Prosedural?

Pendekatan prosedural memisahkan data dan fungsi. Data buku disimpan dalam
variabel terpisah, sedangkan fungsi-fungsi tersebar di seluruh program tanpa
keterkaitan yang jelas. Pada sistem perpustakaan yang memiliki banyak entitas
dengan perilaku masing-masing, pendekatan ini menghasilkan kode yang sulit
dipelihara ketika skala bertambah.

OOP menyatukan data dan perilaku dalam satu unit (class). Setiap entitas
bertanggung jawab atas dirinya sendiri. Menambah fitur baru cukup dengan
menambah atau memodifikasi class yang relevan tanpa harus menelusuri seluruh
program. OOP juga mendukung pewarisan (*inheritance*) dan polimorfisme yang
memungkinkan pengembangan sistem secara bertahap tanpa mengganggu kode yang
sudah berjalan.

### 7.2 Apa yang Terjadi Jika Atribut Buku Dapat Diakses Langsung dari Luar Class?

Jika atribut seperti `tersedia` dapat diubah langsung dari luar class, misalnya
dengan `buku.tersedia = true`, maka perubahan tersebut dapat terjadi tanpa
melalui proses validasi apapun. Seseorang dapat menandai buku sebagai tersedia
padahal buku itu masih dipinjam, atau sebaliknya. Akibatnya adalah
**inkonsistensi data**, yaitu kondisi di mana data dalam sistem tidak
mencerminkan keadaan nyata. Encapsulation mencegah hal ini dengan memastikan
setiap perubahan status hanya terjadi melalui method yang telah dirancang
dengan validasi yang tepat.

### 7.3 Bagaimana Konsep Object Membantu Merepresentasikan Dunia Nyata?

Object adalah cerminan langsung dari entitas nyata. Buku fisik di rak
perpustakaan memiliki judul, pengarang, dan status ketersediaan. Object `Buku`
dalam program memiliki atribut yang sama. Anggota nyata memiliki nama, kelas,
dan dapat melakukan aksi peminjaman. Object `Anggota` merepresentasikan hal
yang sama. Pemetaan langsung antara entitas nyata dan object dalam kode membuat
program lebih mudah dipahami, bahkan oleh orang yang bukan programmer, asalkan
mereka memahami domain masalahnya. Inilah kekuatan utama OOP: kode yang ditulis
dalam bahasa yang dekat dengan dunia nyata.
