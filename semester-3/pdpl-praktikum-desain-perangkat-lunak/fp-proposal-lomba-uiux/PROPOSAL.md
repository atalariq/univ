# Proposal Katalog Souvenir Digital Citra Productions

Proposal ini mengajukan pengembangan antarmuka katalog souvenir Citra Productions untuk diikutsertakan dalam [nama lomba UI/UX]. Produk yang diusulkan sudah berjalan sebagai aplikasi web dan dipakai untuk menampilkan produk, portofolio, FAQ, testimoni, serta jalur konsultasi lewat WhatsApp.

| Isian | Keterangan |
| --- | --- |
| Nama lomba |  |
| Penyelenggara |  |
| Tenggat pengumpulan |  |
| Nama tim |  |
| Institusi |  |
| Kontak ketua tim |  |

## Latar belakang

Citra Productions adalah usaha percetakan dan cinderamata keluarga di Yogyakarta. Promosi berjalan dari mulut ke mulut, dan calon pembeli harus menghubungi admin atau datang ke lokasi hanya untuk mengetahui produk apa yang tersedia, variasi yang bisa dibuat, serta kisaran harganya. Wawancara dengan pemilik usaha menyebut belum ada katalog digital sebelumnya, sementara pertanyaan dasar yang sama terus berulang di WhatsApp.

Penggunanya terbagi menjadi dua. Pengunjung adalah calon client, baik individu maupun institusi seperti sekolah, kampus, panitia acara, dan perusahaan yang membutuhkan medali, plakat, samir, selempang, atau souvenir untuk acara dan penghargaan. Admin adalah pihak internal yang mengelola produk, kategori, portofolio, FAQ, testimoni, dan kontak. Pengunjung mayoritas memakai ponsel dan tidak punya akun. Admin bekerja lewat panel web yang memuat tabel dan formulir.

Masalah yang dijawab produk ada tiga. Calon client sulit menilai kesesuaian produk dan harga sebelum menghubungi admin. Pertanyaan operasional seperti waktu pengerjaan dan minimum order tidak punya tempat rujukan yang tetap. Bukti kualitas, berupa portofolio dan testimoni, tersebar dan tidak terpusat. Katalog ini menjawab ketiganya dengan halaman produk yang memuat foto, rentang harga, spesifikasi, dan kemasan, ditambah portofolio, FAQ, testimoni, serta tombol konsultasi WhatsApp.

Sistem tidak memproses pembayaran dan tidak menerima pesanan di dalam aplikasi. Pemesanan tetap dilakukan lewat percakapan WhatsApp, sesuai batas lingkup yang disepakati dengan pemilik usaha. Karena itu, keberhasilan antarmuka diukur sampai pengunjung memahami produk dan tahu cara menghubungi admin, bukan sampai transaksi selesai.

## Metode pengembangan

Metode yang dipakai adalah Design Thinking dengan lima tahap. Metode ini dipilih karena masalah utamanya adalah pemahaman pengguna yang masih tipis, bukan eksekusi visual. Waktunya terbatas dan keputusan desain perlu cepat diuji ke pengguna nyata. Urutan empati lalu definisi memaksa klaim tentang pengguna dibuktikan lebih dulu sebelum masuk ke prototipe.

| Tahap | Kegiatan | Keluaran |
| --- | --- | --- |
| Empathize | Wawancara pemilik usaha, wawancara calon client, pembacaan riwayat pertanyaan WhatsApp | Catatan kebutuhan, kutipan masalah, daftar tugas pengguna |
| Define | Perumusan persona pengunjung dan admin, pemilihan masalah utama, penyusunan BRD | Persona, pernyataan masalah, daftar fitur Must Have |
| Ideate | Penyusunan information architecture, user flow, dan prioritas fitur | Peta halaman, alur katalog sampai WhatsApp, daftar ide yang dipilih |
| Prototype | Wireframe low fidelity, desain UI high fidelity, prototipe Figma yang dapat diklik | Frame per layar dan prototipe untuk diuji |
| Test | Usability testing dengan Maze, analisis metrik, perbaikan desain | Laporan temuan dan daftar revisi |

Tahap Define dan Ideate memakai bahan yang sudah ada dari pengerjaan mata kuliah Proyek Aplikasi Dasar, yaitu wawancara pemilik usaha dan product brief. Bahan itu tidak dianggap final. Bagian yang belum terbukti, terutama preferensi calon client di luar jaringan relasi pemilik, diuji ulang pada tahap riset di bawah.

## Rencana UX research

Riset dibagi menjadi tiga kegiatan dengan tujuan berbeda.

| Kegiatan | Metode | Target responden | Jumlah | Keluaran |
| --- | --- | --- | --- | --- |
| Riset kebutuhan | Wawancara semi-terstruktur, 30 sampai 45 menit | Panitia acara sekolah atau kampus, staf instansi yang pernah memesan souvenir, dan admin Citra Productions | 3 sampai 5 orang, minimal 1 admin | Kutipan masalah, prioritas informasi, kosakata yang dipakai pengguna |
| Validasi awal | Survei singkat 8 sampai 10 pertanyaan | Calon client dari luar jaringan relasi pemilik | Target minimum 15 jawaban | Peringkat informasi yang dicari dan kanal kontak yang biasa dipakai |
| Evaluasi desain | Usability testing unmoderated di Maze | Pengunjung baru yang tidak pernah melihat situs | Minimal 5 orang | Metrik per mission dan jawaban post-test |

Jumlah di atas adalah target rencana, bukan jumlah responden yang sudah diperoleh. Rekrutmen memakai jaringan kampus, komunitas panitia acara, dan pengunjung situs yang bersedia dihubungi. Responden admin direkrut terpisah karena tugasnya berbeda.

Jadwal relatif riset:

| Waktu | Kegiatan |
| --- | --- |
| Minggu -4 | Menyusun panduan wawancara dan kuesioner, menghubungi calon responden |
| Minggu -3 | Wawancara dan survei, pengolahan catatan |
| Minggu -2 | Perbaikan persona dan prioritas fitur, penyusunan ulang alur |
| Minggu -1 | Uji coba mission di Maze, perbaikan prototipe, pengumpulan data |
| Minggu 0 | Analisis, revisi desain, penyusunan bahan submission |

## Status wireframe dan prototipe

Yang bisa dipastikan dari barang bukti saat ini:

- Tautan berkas Figma bernama PAD tersedia di <https://www.figma.com/design/xaHoBOzDl35WygmbbNBmeS/PAD>. Isi berkas belum diverifikasi.
- Aplikasi web sudah diimplementasikan dengan Vue 3 dan berjalan di <https://cp.atalariq.dev>. Halaman publiknya mencakup beranda, katalog, pencarian, dan detail produk. Panel admin mencakup produk, kategori, portofolio, testimoni, FAQ, dan kontak.
- Data demo produksi memuat 20 produk, 5 kategori, 8 portofolio, 10 FAQ, dan 4 produk unggulan. Angka ini menunjukkan skala isi, bukan hasil pengujian.
- Repo proyek tidak menyimpan ekspor wireframe, tangkapan layar prototipe, atau berkas desain. Yang tersimpan adalah kode, dokumen kebutuhan, dan diagram sistem.

Yang belum bisa dipastikan:

- Jumlah frame, kelengkapan alur, dan keadaan khusus seperti hasil pencarian kosong atau jawaban FAQ terbuka di berkas Figma. Isi berkas tidak dapat diperiksa tanpa akses login.
- Apakah wireframe low fidelity pernah dibuat terpisah atau langsung masuk ke desain high fidelity.
- Apakah seluruh frame sudah terhubung tanpa dead end dan siap diimpor ke Maze.

Karena itu proposal ini tidak mengklaim prototipe sudah lengkap. Statusnya: implementasi web sudah berjalan, berkas Figma tersedia, dan kelengkapan prototipe masih perlu diverifikasi pemilik sebelum dipakai untuk lomba maupun pengujian.

## Rencana usability testing

Pengujian memakai empat mission yang mencakup alur utama pengunjung: menemukan produk lewat kategori, mencari produk lewat kata kunci, menjawab pertanyaan operasional lewat FAQ, dan menghubungi admin lewat WhatsApp. Rincian mission, start screen, goal screen, pertanyaan post-test, dan tabel hasil ada di [RENCANA-MAZE.md](../p12-usability-testing/RENCANA-MAZE.md).

Pelaksanaannya memakai Maze Prototype Test, frame mobile yang tersedia di Figma, minimal 5 responden, dan tautan yang sama untuk semua orang. Metrik yang dikumpulkan adalah Direct Success, Indirect Success, Misclick Rate, dan Average Duration per mission, ditambah tujuh pertanyaan post-test. Analisis dilakukan dengan mengurutkan masalah berdasarkan dampak terhadap keberhasilan mission, bukan berdasarkan jumlah komentar.

Hasil pengujian dipakai untuk dua hal. Pertama, memperbaiki paling banyak tiga masalah dengan dampak terbesar sebelum bahan lomba dikirim. Kedua, menjadi bukti proses di bagian evaluasi proposal, bahwa keputusan desain diambil dari data pengguna, bukan selera tim.

## Timeline sampai deadline lomba

Tanggal absolut belum bisa ditetapkan karena tenggat lomba belum diketahui. Tabel memakai hitungan mundur dari hari pengumpulan.

| Waktu | Kegiatan | Keluaran |
| --- | --- | --- |
| H-28 | Verifikasi berkas Figma, perbaikan frame dan alur yang buntu | Prototipe siap diimpor ke Maze |
| H-21 | Penyusunan mission dan post-test di Maze, uji coba internal | Tautan Maze versi uji |
| H-14 | Rekrutmen dan pelaksanaan pengujian, minimal 5 responden | Data mentah Maze |
| H-10 | Analisis metrik dan kuesioner, penentuan prioritas perbaikan | Daftar temuan |
| H-7 | Revisi desain dan prototipe, pengambilan tangkapan layar | Prototipe final dan bukti visual |
| H-4 | Penyusunan dokumen dan video submission, pemeriksaan tautan | Berkas lomba versi pertama |
| H-2 | Uji baca oleh satu orang di luar tim, perbaikan terakhir | Berkas final |
| H-0 | Pengumpulan | Tautan dan berkas terkirim |

## Yang perlu dilengkapi pemilik

1. Nama lomba, penyelenggara, tingkat, dan kategori yang diikuti.
2. Tenggat pendaftaran, tenggat pengumpulan karya, dan tanggal pengumuman.
3. Ketentuan submission: format berkas, jumlah halaman atau slide, batas ukuran, kebutuhan video demo, dan tautan yang wajib dicantumkan.
4. Nama anggota tim, NIM, kelas, dan pembagian peran.
5. Nama institusi atau program studi, termasuk logo yang diizinkan dipakai.
6. Nama dosen pembimbing bila ketentuan lomba memintanya.
7. Kontak ketua tim yang aktif, berupa email dan nomor WhatsApp.
8. Status hak akses tautan Figma, dipastikan Anyone with the link can view, dan tautan Maze dalam keadaan aktif.
9. Kebenaran isi Figma: daftar frame, alur yang sudah terhubung, dan keadaan khusus yang tersedia, karena isi berkas tidak dapat diverifikasi dari repo.
10. Izin pemilik usaha untuk memakai nama, logo, foto produk, dan testimoni asli dalam karya lomba.
11. Nomor WhatsApp, akun Instagram, dan foto produk asli. Data yang dipakai sekarang masih placeholder.
12. Keputusan apakah alur admin ikut dilombakan atau hanya alur pengunjung.
13. Biaya pendaftaran dan metode pembayaran bila lomba memungut biaya.
14. Rubrik penilaian bila dipublikasikan, agar bukti proses bisa disesuaikan sejak awal.
