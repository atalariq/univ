# Pertemuan 7 - Viewpoint-Oriented Requirements Definition (VORD)

1. Pelajari materi VORD
2. Dengan menggunakan studi kasus Proyek PAD kelompok anda lakukan analisis berbasis VORD:
   1. Identifikasi semua stakeholders - viewpoints
   2. Pilih 2 view point kemudian buat daftar service list masing-masing
   3. Pilih 3 service dalam proyek PAD anda, buat analisis viewpoint data/control
   4. Pilih 1 service dan buat analisis dengan VORD templates
   Buat hasil analisis dalam file pdf untuk dikumpukan dalam assignment


---

## Draft VORD

Stakeholders / Viewpoints
- Direct:
  - Customer
    - View products
    - View detail product
    - Search specific product -> data control: query
    - Filter product by category
    - Contact seller/admin
    - Ask questions
  - Admin
    - Manage product catalogue -> data control: detail product
    - Manage category -> data control: detail category
    - Manage asked questions approval -> data control: questions' status/state
    - Manage contacts -> data control -> detail contact information
- Indirect: - (Regulasi?, Cybersecurity?)

---

## 1. Identifikasi Semua Stakeholders - Viewpoints

* **Direct Viewpoints**
    * **Calon Client / Pengunjung:** Target pengguna yang mencakup individu maupun instansi (seperti perusahaan, sekolah, panitia acara, dan penyelenggara kompetisi) yang mengunjungi website untuk mencari produk souvenir.
    * **Admin:** Pihak internal Citra Production yang bertanggung jawab menggunakan CMS sistem untuk mengelola informasi produk dan seluruh konten website.
* **Indirect Viewpoints**
    * **Pemilik Bisnis / Keluarga Citra Production:** Stakeholder yang berkepentingan terhadap sistem sebagai wadah digital untuk memperkenalkan bisnis dan menjadikannya sebagai portofolio bisnis.
    * **Penyedia Hosting / Pengelola Infrastruktur:** Pihak operasional teknis yang berkepentingan terhadap penyediaan lingkungan *deployment* sistem (misalnya pengelolaan Docker image untuk server).

## 2. Daftar Service List Berdasarkan Viewpoint

**Viewpoint 1: Calon Client / Pengunjung**
* Melihat katalog produk souvenir secara publik tanpa memerlukan registrasi.
* Melihat detail produk yang mencakup foto *multiple* (carousel), rentang harga, deskripsi, dan jenis packaging.
* Mencari dan memfilter produk berdasarkan kategori (seperti samir, medali, plakat, dll).
* Melihat portofolio hasil produksi dalam bentuk gambar.
* Mengajukan pertanyaan umum secara langsung melalui fitur form FAQ.
* Melihat dan memberikan testimoni mandiri (termasuk memberikan dukungan pada testimoni lain).
* Menghubungi admin Citra Production secara langsung melalui tombol CTA WhatsApp.

**Viewpoint 2: Admin**
* Melakukan login ke dalam *dashboard* admin (CMS).
* Mengelola data produk yang meliputi menambah, melihat, mengubah, menghapus, serta menyembunyikan (*hide/show*) produk.
* Mengelola foto produk (*multiple upload*) beserta deskripsi/alt text untuk setiap foto.
* Mengelola kategori produk dan konten portofolio bisnis.
* Mengelola status FAQ dengan memberikan persetujuan (*approval*) atau penolakan serta menjawab pertanyaan sebelum ditampilkan kepada publik.
* Mengelola informasi yang berada di *footer* serta detail kontak secara dinamis.

## 3. Analisis Viewpoint Data/Control

**Service 1: Pencarian dan Filter Produk**
* **Viewpoint:** Calon Client / Pengunjung.
* **Data/Control Input:** *Query* berupa kata kunci pencarian dan perintah kontrol pemilihan kategori (seperti pin, trofi, atau plakat) yang dipilih oleh pengguna.
* **System Action/Output:** Sistem memproses kriteria *filter* dan menyajikan pembaruan daftar katalog produk yang relevan.

**Service 2: Mengajukan Pertanyaan melalui FAQ**
* **Viewpoint:** Calon Client / Pengunjung.
* **Data/Control Input:** Data berupa input teks pertanyaan dari pengguna yang dikirimkan melalui form.
* **System Action/Output:** Sistem menerima data, mengubah status pertanyaan menjadi *pending approval* (menunggu persetujuan admin), dan menyimpannya di *database*.

**Service 3: Melakukan Approval FAQ**
* **Viewpoint:** Admin.
* **Data/Control Input:** Perintah kontrol (*approve* atau *reject*) dari admin terhadap pertanyaan yang diajukan oleh pengguna, serta data berupa teks jawaban dari admin.
* **System Action/Output:** Sistem mengubah status informasi pertanyaan di *database* agar dapat dirender secara publik di halaman website untuk dibaca pengguna lain.

## 4. Analisis dengan VORD Template (Service: Mengelola Data Produk)

| Atribut VORD | Deskripsi Analisis |
| --- | --- |
| **Reference** | SRV-01 |
| **Service Name** | Mengelola Data Produk (CRUD & Hide/Show) |
| **Viewpoint** | Admin |
| **Rationale / Tujuan** | Admin membutuhkan sistem yang terstruktur untuk mengelola dan memperbarui informasi dasar katalog produk ke dalam website, sehingga calon pembeli tidak lagi perlu bertanya secara manual kepada admin untuk melihat detail ketersediaan. |
| **Data / Control Provided** | Data yang dimasukkan mencakup: nama produk, kategori, foto *multiple* beserta *alt text*, harga minimum, harga maksimum, deskripsi, jenis *packaging*, serta kontrol status visibilitas (tampil/sembunyi). |
| **System Event / Action** | Sistem akan memvalidasi input dari *Content Management System* (CMS), mengeksekusi operasi basis data (tambah, ubah, hapus, atau ubah status tayang), dan memastikan perubahan data tampil secara dinamis (*bukan hardcode*) di halaman klien. |
| **Non-Functional Req.** | Antarmuka CMS harus responsif dan diprioritaskan untuk mudah digunakan melalui perangkat *mobile*. Sistem juga wajib menggunakan bahasa antarmuka Bahasa Indonesia. |
