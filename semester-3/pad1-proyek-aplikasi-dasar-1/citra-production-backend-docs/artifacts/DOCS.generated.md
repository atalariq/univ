Berikut adalah ekstraksi spesifikasi desain sistem berdasarkan dokumen proyek yang dilampirkan:

## 1. Aktor

| Aktor | Deskripsi singkat |
| --- | --- |
| **Client / Pengunjung** | Melihat katalog, melihat detail produk, melakukan pencarian/filter, melihat portofolio, melihat & memberi testimoni, mengajukan FAQ, dan menghubungi via WhatsApp. |
| **Admin** | Memiliki akses CMS untuk mengelola (CRUD) produk, kategori, portofolio, FAQ, testimoni, kontak/footer, serta melakukan *approval* konten. |

## 2. Proses bisnis / fitur

| Kode | Nama proses | Aktor terlibat | Input | Output |
| --- | --- | --- | --- | --- |
| BP-01 | Login CMS | Admin | Kredensial akun | Akses dashboard admin |
| BP-02 | Tambah Produk | Admin | Data detail produk, kategori, packaging | Data produk baru tersimpan |
| BP-03 | Upload Multiple Foto Produk | Admin | File foto, *alt text*/deskripsi foto | Foto terhubung ke produk |
| BP-04 | Edit Produk | Admin | Perubahan data produk | Data produk ter-update |
| BP-05 | Hapus Produk | Admin | Konfirmasi hapus (ID Produk) | Produk terhapus |
| BP-06 | Hide / Show Produk | Admin | Status *visibility* | Produk tampil/hilang di publik |
| BP-07 | Cari & Filter Produk | Client | *Keyword* pencarian, filter kategori | Daftar produk relevan |
| BP-08 | Tambah Kategori | Admin | Nama kategori | Kategori baru tersimpan |
| BP-09 | Edit Kategori | Admin | Perubahan nama kategori | Kategori ter-update |
| BP-10 | Hapus Kategori | Admin | Konfirmasi hapus | Kategori terhapus |
| BP-11 | Tambah Portofolio | Admin | Gambar portofolio, info pendukung | Portofolio baru tersimpan |
| BP-12 | Edit Portofolio | Admin | Gambar/info portofolio baru | Portofolio ter-update |
| BP-13 | Hapus Portofolio | Admin | Konfirmasi hapus | Portofolio terhapus |
| BP-14 | Hide / Show Portofolio | Admin | Status *visibility* | Portofolio tampil/hilang |
| BP-15 | Ajukan Pertanyaan (FAQ) | Client | Form isian pertanyaan | Pertanyaan *pending* |
| BP-16 | Approve / Reject FAQ | Admin | Status *approve/reject*, teks jawaban | FAQ tayang/ditolak |
| BP-17 | Memberi Testimoni | Client | Teks testimoni, Tag Produk (opsional) | Testimoni *pending* |
| BP-18 | Approve / Reject Testimoni | Admin | Status *approve/reject* | Testimoni tayang/ditolak |
| BP-19 | Dukung Testimoni (*Thumbs up*) | Client | *Click event* pada testimoni | Angka dukungan bertambah |
| BP-20 | Tambah Kontak/Link | Admin | Data teks kontak/link sosmed baru | Footer bertambah |
| BP-21 | Edit Footer / Kontak | Admin | Perubahan teks/link sosmed | Footer ter-update |
| BP-22 | Edit Profile | Admin | Data profil admin | Profil ter-update |

## 3. Entitas data kandidat

| Entitas | Atribut yang disebut eksplisit |
| --- | --- |
| **Produk** | Nama produk, rentang harga minimum, rentang harga maksimum, deskripsi, jenis *packaging*, status tampil/sembunyi. |
| **Foto Produk** | File foto, *alt text*/deskripsi foto. |
| **Kategori** | Nama Kategori. |
| **Portofolio** | Gambar portofolio, informasi pendukung gambar. |
| **FAQ (Pertanyaan)** | Pertanyaan client, teks informasi yang ditampilkan setelah disetujui (jawaban), status approval. |
| **Testimoni** | Isi testimoni [tersirat dari UI], jumlah dukungan/thumbs up [tersirat dari UI], status approval. |
| **Footer / Kontak** | Informasi kontak, informasi umum bisnis, placeholder/link media sosial. |
| **Admin** | Kredensial *login* (username, password) [tersirat dari UI], profil user [tersirat dari UI]. |

## 4. Relasi antar entitas

| Entitas A | Relasi | Entitas B | Cardinality (kalau disebut) |
| --- | --- | --- | --- |
| Produk | Memiliki | Foto Produk | 1 to N (Satu produk memiliki beberapa foto/*multiple upload*) |
| Kategori | Mengelompokkan | Produk | Tidak disebutkan (Mungkin 1 to N atau N to M) |
| Testimoni | Tag / Merujuk ke | Produk | N to 1 (Beberapa testimoni bisa men-tag 1 produk yang sama) |

## 5. Business rules & constraint

* Sistem hanya berfungsi sebagai katalog digital, tidak mencakup sistem pembayaran atau transaksi secara langsung (checkout diarahkan ke WhatsApp).
* Setiap pertanyaan (FAQ) baru yang disubmit oleh Client harus berstatus *pending* dan wajib melalui proses *approval* (disetujui/ditolak) oleh Admin sebelum tayang di halaman publik.
* Setiap testimoni baru dari Client harus berstatus *pending* dan wajib melalui proses *approval* oleh Admin sebelum tayang di halaman publik.
* Sistem/Website diprioritaskan untuk penggunaan melalui perangkat mobile (*mobile-responsive*).
* Setiap gambar/foto produk yang diunggah wajib memiliki *alt text* atau deskripsi foto.
* Semua data konten seperti informasi produk, portofolio, FAQ, dan kontak footer harus bersifat dinamis (dikelola via CMS), bukan *hardcode*.
* Antarmuka sistem (UI) hanya menggunakan Bahasa Indonesia.

## 6. Gap / pertanyaan yang harus dikonfirmasi ke PM atau UI/UX

* **GAP:** Apakah 1 produk hanya bisa dimasukkan ke dalam 1 kategori secara eksklusif (1 to N), atau bisa ditandai dengan lebih dari 1 kategori (N to N)? Tidak disebut eksplisit di dokumen.
* **GAP:** Atribut apa saja yang persisnya diminta pada *form* "Memberi Testimoni" bagi Client (misal: nama client, asal instansi, rating bintang)? Di *Activity Diagram* hanya tertera "User mengisi testimoni".
* **GAP:** Bagaimana *logic* atau *constraint* dari fitur "Dukung Testimoni" (*thumbs up*)? Karena Client tidak memiliki fitur *login*, apakah ada proteksi khusus (seperti validasi *session*/*cookies*/*IP Address*) agar 1 user tidak bisa melakukan *spam click* ribuan *thumbs up*?
* **GAP:** Pada halaman Portofolio, apakah hasil pekerjaan hanya ditampilkan sebagai daftar gambar (*list* biasa), atau perlu ada pengelompokan kategori (misal: portofolio plakat, portofolio samir)?
* **GAP:** Pada menu "kelola kontak" di IA Admin (INFORMATION ARCHITECTURE - ADMIN.png), terdapat aksi "tambah kontak/link". Apakah struktur kontak memungkinkan admin membuat daftar nomor/link yang tidak terbatas (berbentuk *array/list*), atau sekadar mengisi *fields* statis (WA 1, IG, Tiktok)?
