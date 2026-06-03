# ANSWER.md

## Identifikasi Class Utama

1. Tiga class utama yang diperlukan dalam sistem adalah `Buku`, `Anggota`, dan `ManajerPeminjaman`.
2. Penjelasan alasan dan peran setiap class:
   * **Buku**: Diperlukan untuk merepresentasikan aset fisik atau digital perpustakaan. Perannya adalah menyimpan informasi spesifik mengenai suatu literatur dan melacak status ketersediaannya saat ini.
   * **Anggota**: Diperlukan untuk mendata individu yang memiliki hak akses perpustakaan. Perannya adalah menyimpan identitas peminjam dan mencatat batas kuota peminjaman yang sedang berjalan.
   * **ManajerPeminjaman**: Diperlukan untuk mengoordinasikan interaksi antara buku dan anggota. Perannya adalah memproses logika bisnis seperti validasi sebelum peminjaman, mencatat pengembalian, dan memastikan aturan perpustakaan dipatuhi.
3. Kategorisasi class:
   * **Entity class**: `Buku` dan `Anggota`. Class ini murni menyimpan data dan perilaku dasar dari objek itu sendiri.
   * **Control class**: `ManajerPeminjaman`. Class ini mengendalikan aliran informasi dan mengatur interaksi antar entity class.

## Identifikasi Atribut (Properties)

**Class Buku**
1. Atribut: `kodeBuku`, `judul`, `penulis`, `isTersedia`.
2. Pengelompokan:
   * Atribut identitas: `kodeBuku`
   * Atribut deskriptif: `judul`, `penulis`
   * Atribut status: `isTersedia`
3. Tipe data: `kodeBuku` (String), `judul` (String), `penulis` (String), `isTersedia` (Boolean).
4. Level akses: `Private`. Atribut harus bersifat private agar entitas luar tidak dapat memanipulasi status ketersediaan buku tanpa melewati proses validasi peminjaman.

**Class Anggota**
1. Atribut: `idAnggota`, `nama`, `kelas`, `jumlahPinjamanAktif`.
2. Pengelompokan:
   * Atribut identitas: `idAnggota`
   * Atribut deskriptif: `nama`, `kelas`
   * Atribut status: `jumlahPinjamanAktif`
3. Tipe data: `idAnggota` (String), `nama` (String), `kelas` (String), `jumlahPinjamanAktif` (Integer).
4. Level akses: `Private`. Akses private mencegah perubahan kuota pinjaman secara sewenang-wenang di luar prosedur pengembalian atau peminjaman yang sah.

**Class ManajerPeminjaman**
1. Atribut: `daftarBuku`, `daftarAnggota`, `batasPinjamanMaksimal`.
2. Pengelompokan:
   * Atribut identitas: Tidak ada atribut identitas tunggal, class ini bertindak sebagai sistem.
   * Atribut deskriptif: `batasPinjamanMaksimal`
   * Atribut status: `daftarBuku`, `daftarAnggota` (kumpulan data yang diatur).
3. Tipe data: `daftarBuku` (List/Array of Buku), `daftarAnggota` (List/Array of Anggota), `batasPinjamanMaksimal` (Integer).
4. Level akses: `Private`. Hanya control class yang boleh mengelola koleksi data utama ini untuk menjaga konsistensi.

## Identifikasi Method (Behavior)

**Class Buku**
1. Method yang diperlukan: `ubahStatus()`, `getInfoBuku()`, `cekKetersediaan()`.
2. Pengelompokan:
   * Manipulasi data: `ubahStatus()`
   * Menampilkan informasi: `getInfoBuku()`
   * Validasi: `cekKetersediaan()`
3. Aksesabilitas:
   * Boleh diakses dari luar (Public): `getInfoBuku()`, `cekKetersediaan()`, `ubahStatus()` (hanya boleh dipanggil oleh ManajerPeminjaman).
   * Internal (Private): Method pembantu untuk format teks jika ada.
4. Refleksi Encapsulation: Method memberikan antarmuka (interface) yang aman. Daripada sistem luar mengubah `isTersedia = false` secara langsung, sistem memanggil `ubahStatus()`.

**Class Anggota**
1. Method yang diperlukan: `tambahPinjaman()`, `kurangiPinjaman()`, `getInfoAnggota()`, `cekBatasPinjaman()`.
2. Pengelompokan:
   * Manipulasi data: `tambahPinjaman()`, `kurangiPinjaman()`
   * Menampilkan informasi: `getInfoAnggota()`
   * Validasi: `cekBatasPinjaman()`
3. Aksesabilitas:
   * Public: Semua method di atas perlu diakses oleh ManajerPeminjaman.
   * Internal: Validasi format ID anggota (Private).
4. Refleksi Encapsulation: Membatasi agar penambahan beban pinjaman selalu dievaluasi terlebih dahulu melalui method, bukan dengan menambah nilai integer variabel secara langsung.

## Identifikasi Object

1. Perbedaan: Class adalah kerangka abstrak (framework) yang mendefinisikan struktur data dan perilaku. Object adalah entitas konkret yang tercipta dari kerangka tersebut dan menempati memori dengan nilai data spesifik.
2. Contoh object konkret:
   * Object 1:
     * Class: Buku
     * Nilai atribut: kodeBuku="B-001", judul="Arsitektur Backend", penulis="Martin Fowler", isTersedia=true
   * Object 2:
     * Class: Anggota
     * Nilai atribut: idAnggota="A-102", nama="Budi", kelas="12 IPA", jumlahPinjamanAktif=1
   * Object 3:
     * Class: Buku
     * Nilai atribut: kodeBuku="B-002", judul="Pengantar Web3", penulis="Gavin Wood", isTersedia=false
3. Alokasi Memori: Saat sebuah object dibuat, sistem operasi mengalokasikan ruang di Heap Memory untuk menyimpan nilai-nilai atribut spesifik dari object tersebut. Sebuah referensi (pointer) kemudian dikembalikan ke Stack Memory untuk digunakan oleh program utama dalam memanggil object tersebut.

## Relasi Antar Class

1. Terdapat hubungan antar class yang saling berinteraksi untuk membentuk sebuah sistem fungsional.
2. Penjelasan jenis hubungan:
   * **Association**: Hubungan interaksi umum. `Anggota` berinteraksi dengan `Buku` saat proses meminjam, namun kedua entitas tetap eksis secara mandiri.
   * **Aggregation**: Hubungan "has-a" yang lemah. `ManajerPeminjaman` memiliki koleksi `Buku`. Jika sistem manajer dimatikan, data buku secara logis tetap ada.
   * **Composition**: Hubungan "part-of" yang kuat. Jika ada class `Halaman` di dalam `Buku`, maka halaman tidak memiliki makna logis jika class bukunya dihapus.
3. Deskripsi Relasi:
   * `Anggota` berelasi dengan `Buku` melalui tindakan peminjaman dengan rasio satu banding banyak (1 to 0..*).
   * `ManajerPeminjaman` berelasi agregasi terhadap daftar `Buku` dan `Anggota` (1 to *).
4. Analisis Multiplicity:
   * Satu anggota bisa memiliki lebih dari satu buku.
   * Satu unit fisik buku tidak bisa dipinjam oleh lebih dari satu anggota secara bersamaan.

## Analisis Desain

1. Jika sistem berkembang (misalnya menjadi LMS penuh), class tambahan yang diperlukan meliputi: `Pustakawan`, `Kategori/Genre`, `Denda`, dan `Notifikasi`.
2. Class `Transaksi` mutlak diperlukan. Deskripsi sistem dalam soal memiliki kelemahan arsitektural. Menyatakan bahwa "status buku berubah ketika dipinjam" adalah pendekatan yang rentan. Jika hanya status buku yang berubah, perpustakaan tidak memiliki rekam jejak historis. Class `Transaksi` mengikat `Buku` dan `Anggota` dengan atribut tambahan seperti tanggal pinjam dan batas kembali.
3. Risiko jika semua fungsi digabung (God Object Anti-Pattern): Sistem kehilangan modularitas. Satu perubahan kecil pada logika denda dapat merusak logika pencarian buku. Kode menjadi sangat sulit dipelihara, diuji secara independen, dan dikembangkan oleh lebih dari satu orang secara bersamaan.

## Refleksi Konseptual

1. OOP memodelkan sistem sebagai kumpulan entitas dunia nyata yang memiliki status dan perilaku spesifik. Pendekatan ini lebih cocok karena memusatkan logika buku berada pada class buku, berbeda dengan prosedural yang memisahkan data dengan fungsi yang mengolahnya, sehingga rentan terhadap ketidakkonsistenan data pada aplikasi berskala menengah hingga besar.
2. Jika atribut buku dapat diakses langsung, pihak luar dapat memanipulasi data tanpa melalui aturan bisnis. Contohnya, sistem lain bisa mengubah status buku menjadi "tersedia" padahal buku tersebut fisik belum dikembalikan oleh anggota, menciptakan bug state yang serius.
3. Konsep object mengikat state (data ketersediaan) dan behavior (proses meminjam) ke dalam satu unit, persis seperti objek di dunia nyata. Sebuah buku fisik memiliki judul (state) dan bisa dibaca (behavior) sebagai satu kesatuan logis, membantu perancangan perangkat lunak menjadi intuitif.

***

### Catatan Evaluasi & Rekomendasi Lanjutan

**Kritik terhadap Asumsi Desain Awal:**
Skenario awal mengasumsikan pencatatan peminjaman cukup dengan mengubah status buku. Pendekatan ini adalah *state mutation* yang buta huruf terhadap waktu (time-blind). Anda akan kehilangan audit trail. Selalu gunakan model pencatatan berbasis *event* (seperti class Transaksi) agar setiap interaksi terekam sebagai entitas terpisah.

**Rekomendasi Orde Kedua (Second-Order Recommendation):**
Setelah Anda menstrukturkan arsitektur OOP ini, tantangan yang sering diabaikan adalah isu *Concurrency*. Apa yang terjadi jika dua request datang di milidetik yang sama mencoba memanggil method `ubahStatus()` pada satu object buku yang sama? OOP dasar tidak menyelesaikan ini secara default. Anda harus memikirkan bagaimana mengelola integritas data saat class ini dipetakan ke dalam database relasional, misalnya dengan menerapkan pola *Optimistic Locking* atau *Pessimistic Locking* pada lapisan backend.
