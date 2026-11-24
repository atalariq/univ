# Functional Requirement

Layanan:
- Konsultasi medis
- Diagnosis
- Perawatan
- Tindak lanjut

Butuh Sistem Manajemen Informasi
Manual -> Sistematis

Tujuan:
- Less Human error
- Efisiensi
- Sistem yg saling terhubung; terintegrasi dengan baik

Fungsional:
- pendaftaran pasien
- penjadwalan konsultasi
- pencatatan rekam medis
- pengelolaan stok obat
- penagihan
- pembayaran
- ---
- pendaftaran pasien
- manajemen jadwal dokter
- pencatatan rekam medis secara elektronik
- pengelolaan keuangan

Non-fungsional:
performance, security, availability, scalability, usability, maintainability, compliance

## Functional Requirement

> Pattern: `Sistem harus [action] agar [actor] bisa [goal]`

### Modul Pendaftaran Pasien

- Sistem dapat melakukan login/register
- Sistem dapat memanajemen data pasien
- Sistem dapat memvalidasi dan memproses check-in pasien yang sudah membuat janji temu lewat aplikasi
- Sistem dapat mengecek ketersediaan kuota poli tujuan sebelum mendaftarkan kunjungan
- Sistem dapat menambahkan pasien ke antrian setelah proses check-in selesai
- Sistem dapat mengirim notifikasi dan pengingat janji temu secara otomatis kepada pasien

### Modul Manajemen Jadwal Dokter

- Sistem dapat mengelola dan menampilkan jadwal praktik dokter spesialis secara fleksibel
- Sistem dapat mengelola ketersediaan, penyesuaian, dan pembatalan jadwal/janji temu
- Sistem dapat mengintegrasikan kalender dokter dan mengirim notifikasi ke pasien jika ada perubahan jadwal

### Modul Rekam Medis Elektronik (Electronic Medical Record/EMR)

- Sistem dapat menyimpan dan mengelola rekam medis pasien secara digital
- Sistem dapat memberikan akses data rekam medis kepada dokter sesuai hak akses (izin) yang berlaku
- Sistem dapat mencatat diagnosis, resep obat, dan rujukan (rawat inap/lab/fisioterapi)
- Sistem dapat menampilkan hasil laboratorium ke dalam rekam medis pasien

### Modul Penagihan dan Pembayaran

- Sistem dapat menghitung dan membuat tagihan otomatis atas layanan yang diterima pasien
- Sistem dapat mengirim tagihan/invoice ke pasien melalui email atau WhatsApp
- Sistem dapat memproses pembayaran tunai maupun non-tunai (transfer antar bank)
- Sistem dapat mengelola antrian tagihan atas layanan yang diterima pasien
- Sistem dapat membuat laporan keuangan (pendapatan dan pengeluaran klinik)

### Modul Laporan dan Analitik

- Sistem dapat menyediakan dashboard laporan operasional, keuangan, dan statistik kesehatan
- Sistem dapat menghasilkan laporan yang dapat disesuaikan (customizable) sesuai kebutuhan manajemen
