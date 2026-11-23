# DSDM (Dynamic Systems Development Method)

## Apa itu DSDM

DSDM (Dynamic Systems Development Method) dimulai pada 1994 di Inggris, ketika 16 organisasi berkumpul membentuk DSDM Consortium untuk menyusun proses RAD yang tidak terikat vendor. Versi pertama terbit 1995. Sejak 2007 DSDM tersedia bebas untuk dilihat dan dipakai, dan sejak 2016 Consortium berganti nama menjadi Agile Business Consortium. Bentuknya kerangka pengendalian (framework of controls) untuk RAD, dengan proses dan produk di level tinggi agar mudah ditailor. Abrahamsson dkk. (2002) menyebutnya kerangka RAD nomor satu di Inggris.

## Masalah yang diselesaikan

Proyek waterfall mengunci ruang lingkup di awal, lalu menutup selisih lewat tambahan biaya dan mundurnya tanggal. DSDM membalik pengaturannya: waktu, biaya, dan kualitas ditetapkan di akhir fase fondasi, sementara fitur yang menyesuaikan. Ketika jadwal terancam, requirement berprioritas rendah dilepas dan proyek tetap menyerahkan Minimum Usable SubseT. Kriteria penerimaannya fitness for business purpose: solusi dinilai dari kemampuannya menopang proses bisnis.

## Karakteristik kunci

Lima fase versi klasik: Feasibility (kelayakan bisnis dan teknis, kecocokan dengan RAD), Business Study (proses bisnis, arsitektur, prioritas requirement), Functional Model Iteration (prototipe fungsional untuk mengunci pemahaman), Design and Build Iteration (memperkeras prototipe agar memenuhi non-functional requirement), Implementation (handover, pelatihan, review increment). Dua fase pertama berjalan sekali dan berurutan; tiga berikutnya berulang dan inkremental. Handbook 2014 memadatkannya menjadi Feasibility, Foundations, Evolutionary Development, dan Deployment.

Setiap iterasi dibungkus timebox 2 sampai 4 minggu. Isi timebox tidak ditambah ketika waktu mepet; yang turun adalah cakupan. Prioritas diatur MoSCoW: Must have dijaga maksimal 60 persen effort, Could have minimal 20 persen, dan kontingensi disimpan pada Should have.

Handbook 2014 menetapkan delapan prinsip: focus on the business need, deliver on time, collaborate, never compromise quality, build incrementally from firm foundations, develop iteratively, communicate continuously and clearly, demonstrate control. Daftar sembilan butir yang biasa beredar di materi kuliah berasal dari DSDM 4.2. Beberapa butir versi lama itu lebih tepat dibaca sebagai asumsi tentang lingkungan proyek, misalnya pengguna yang bersedia terlibat aktif, tim yang sudah diberi wewenang memutuskan, requirement yang hanya dibaseline di level tinggi, dan perubahan yang harus bisa dibalik.

## Peran dan produk

Peran kunci: Business Sponsor (pemilik business case), Business Visionary (penjaga arah bisnis), Business Ambassador (detail kebutuhan harian), Business Advisor (sudut pandang pengguna tertentu), Technical Coordinator, Project Manager, Business Analyst, Team Leader, Solution Developer, dan Solution Tester. Produk penting: Terms of Reference, Business Case, Feasibility Assessment, Foundations Summary, Prioritised Requirements List, Solution Architecture Definition, Delivery Plan, Timebox Plan, dan Evolving Solution.

## Kapan dipakai dan kapan tidak

Cocok ketika tanggal dan anggaran sudah dijanjikan ke pihak luar, ada sponsor bisnis yang mau terlibat rutin, lingkupnya masih bisa ditawar, dan solusinya harus menyatu dengan proses bisnis yang sudah berjalan.

Kurang cocok ketika regulasi menuntut spesifikasi lengkap di muka, pengguna tidak bisa menyediakan waktu, tim tersebar tanpa jalur komunikasi setara, atau organisasi menolak mendelegasikan keputusan ke tingkat tim.

## Perbandingan singkat

Scrum mengatur cara tim bekerja di dalam sprint, tanpa fase kelayakan atau business case formal. DSDM menaruh keduanya di depan proyek, sehingga lebih mudah dipertanggungjawabkan pada kontrak dan audit. FDD bergerak dari daftar fitur dengan peran chief programmer dan penekanan teknis, sedangkan DSDM menekankan keputusan bisnis dan urutan prioritas. Di antara ketiganya, DSDM paling dekat ke RAD dan satu-satunya yang fase kelayakannya eksplisit.

## Pertanyaan lanjutan untuk ahlinya

1. Brief kelompok menulis sembilan prinsip, sedangkan handbook 2014 menyebut delapan. Butir mana yang dihapus, dan bagaimana Anda memisahkan prinsip dari asumsi DSDM?
2. Kalau Must have dibatasi 60 persen effort, bagaimana angka itu diuji, dan siapa yang berwenang menurunkan requirement saat timebox mepet?
3. Pada proyek kecil, apakah Feasibility dan Foundations masih layak dijalankan sebagai fase terpisah?
4. Bagaimana DSDM menangani arsitektur yang terlanjur salah, mengingat prinsip perubahan reversible?
5. Apa bedanya Business Visionary dengan Product Owner di Scrum?

## Referensi

- https://www.agilebusiness.org/wp-content/uploads/2026/05/DSDM-Agile-Project-Framework-Handbook.pdf
- https://agilepm.wiki/dsdm-agile-project-framework/principles/
- https://www.agilebusiness.org/about-us/
- https://www.informit.com/store/dsdm-business-focused-development-9780321112248
