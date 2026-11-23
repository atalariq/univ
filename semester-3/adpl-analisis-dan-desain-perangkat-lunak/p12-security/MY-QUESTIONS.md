Perkenalkan saya Atalariq dari kelas BB. Izin bertanya terkait beberapa hal, Bu.

- Ancaman apa yang menurut Ibu masih diremehkan oleh banyak developer saat ini?
- Skill security apa yang paling dibutuhkan fresh graduate software engineer, tapi jarang diajarkan di kampus?

1. Assets yang perlu dilindungi:
   1. Data pribadi pelanggan (nama, alamat, nomor HP).
      Kalau bocor, berpotensi menjadi bahan penipuan atau dapat disalahgunakan pihak-pihak nakal.
   2. Data order dan riwayat transaksi (isi pesanan, harga, metode bayar).
      Data ini privasi pelanggan sekaligus data bisnis merchant. Data ini juga penting untuk mematuhi aturan perundang-undangan.
   3. Status pesanan dan info pengiriman.
      Kalau bisa diubah sembarangan, barang bisa tercatat "terkirim" padahal belum jalan.
   4. Kredensial dan sesi login (password, token).
      Kalau bocor, akun orang bisa dipakai siapa saja dan dapat disalahgunakan.
2. Aktor yang terlibat serta perizinannya:
  - Customer:
    - boleh melihat daftar order, detail order, dan tracking pengiriman milik dirinya sendiri.
    - tidak boleh melihat order orang lain dan tidak boleh mengubah status order.
  - Merchant:
    - boleh melihat order yang masuk ke toko miliknya dan mengubah status pemrosesan.
    - tidak boleh melihat order merchant lain dan tidak boleh mengubah data pelanggan.
  - Admin:
    - boleh mengelola akun, melakukan audit, dan membantu troubleshooting, tetapi setiap perubahan yang dilakukan wajib meninggalkan jejak log.
  - Kurir atau sistem logistik eksternal:
    - hanya boleh mengirim update status pengiriman lewat API untuk nomor resi terkait, dan tidak boleh mengakses data order di luar itu.
3. Security Requirements
  - SR-1: Setiap request untuk melihat order wajib dicek kepemilikannya di sisi server, yaitu order harus milik user yang sedang login. Sistem tidak boleh cuma percaya ID yang ada di URL.
  - SR-2: Merchant hanya boleh melihat dan mengubah order yang merchant_id-nya sama dengan akunnya. Perubahan status juga harus mengikuti alur yang valid (misalnya Diproses ke Dikirim ke Selesai), jadi tidak bisa loncat atau mundur sembarangan.
  - SR-3: Semua komunikasi wajib pakai HTTPS, data sensitif seperti alamat dan nomor HP ditampilkan seperlunya (masking), dan setiap perubahan status dicatat di audit log berisi siapa, kapan, dan dari status apa ke status apa.
4. Dua case/scenario yang dapat disalahgunakan
   - Customer iseng mengganti order_id di URL, misalnya dari /orders/1001 jadi /orders/1002, untuk mengintip pesanan orang lain. Kalau server tidak cek kepemilikan, data pelanggan lain langsung terbuka.
   - Merchant memanipulasi request update status untuk order milik toko lain, atau mengubah status jadi "Selesai" padahal barang belum dikirim supaya dana cair lebih cepat.
5. Architecural Security Control:
   Saya usulkan centralized authorization layer (RBAC plus ownership check) di API Gateway atau service layer. Semua endpoint order wajib lewat satu lapisan otorisasi ini, yang mengecek role (customer, merchant, admin) dan kepemilikan data (user_id atau merchant_id) sebelum query ke database. Dengan begitu aturan akses tidak tersebar di tiap endpoint dan tidak ada endpoint yang kelupaan dicek.
6. Contoh Security Test Case:
   - ID: TC-SEC-01
   - Tujuan: memastikan customer tidak bisa melihat order milik customer lain (mencegah IDOR atau Insecure Direct Object Reference)
   - Prasyarat:
     - Customer A (punya order #1001) dan Customer B (punya order #1002) sudah ada, serta
     - login sebagai Customer A
   - Langkah: kirim request GET /orders/1002 menggunakan token milik Customer A.
   - Hasil yang diharapkan: sistem menolak dengan 403 Forbidden (atau 404), tidak ada data order #1002 yang muncul, dan percobaan akses tercatat di log.
   - Hasil gagal: respons 200 dan detail order Customer B tampil.
