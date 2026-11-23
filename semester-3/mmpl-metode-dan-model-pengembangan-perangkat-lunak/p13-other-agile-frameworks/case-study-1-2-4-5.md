# Studi Kasus 1, 2, 4, dan 5

Catatan ini saya tulis untuk pemahaman sendiri, bukan lembar jawaban kelompok. Bagian resmi saya di tugas kelompok adalah Kasus 3, jadi empat kasus lain saya kerjakan di sini dengan pola yang sama seperti yang diminta dosen: pilih satu metode, tunjukkan mekanisme yang menjawab kondisi proyek, lalu tunjukkan mengapa alternatifnya kurang sesuai. Tujuannya supaya saya bisa menjelaskan pilihan anggota lain tanpa menghafal jawaban. Istilah teknis saya biarkan dalam bahasa Inggris.

## Kasus 1: Crystal dan Scrum

### Kondisi kunci

Enam developer mengerjakan aplikasi manajemen kegiatan mahasiswa, kebutuhan pengguna sering berubah, komunikasi tim sudah baik, dan tim meminta proses fleksibel tanpa banyak aturan formal. Dua hal yang menentukan: ukuran tim kecil dan permintaan eksplisit untuk sedikit upacara.

### Pilihan

Crystal, khususnya Crystal Clear. Rentangnya lead designer dengan 2 sampai 7 developer di satu ruangan, jadi enam developer masuk. Bobot prosesnya mengikuti ukuran tim dan criticality, dan aplikasi kegiatan mahasiswa termasuk kerugian rendah, sehingga tidak ada alasan memberatkan prosesnya.

### Mekanisme yang menjawab

Crystal Clear diikat tujuh properti: frequent delivery, reflective improvement, osmotic communication, personal safety, focus, easy access to expert users, dan technical environment. Kebutuhan yang sering berubah dijawab frequent delivery ditambah akses mudah ke expert user, karena tim bisa bertanya langsung sebelum menebak. Komunikasi yang sudah baik dipertahankan lewat osmotic communication. Information radiator seperti whiteboard menjaga status tetap terlihat tanpa alat baru. Crystal Clear memang menyebut peran (sponsor, lead designer, designer-programmer, expert user, coordinator, tester, writer), tetapi peran itu boleh dirangkap dan tidak ada event wajib dengan ritme tetap. Tim memilih praktiknya sendiri selama tujuh properti tercapai, dan di tim enam orang peran-peran itu jatuh ke orang yang sama.

### Kenapa alternatifnya kurang sesuai

Scrum membawa tiga peran dan lima event untuk semua ukuran tim. Pada tim enam orang yang komunikasinya sudah jalan, Sprint Planning, Daily Scrum, Sprint Review, dan Retrospective masuk sebagai ritme tetap, ditambah artefak seperti Product Backlog dan Sprint Backlog. Permintaan tanpa banyak aturan formal tidak dijawab oleh kerangka yang mengunci ritme dan artefaknya. Scrum memang bisa diringankan, tetapi yang diringankan adalah praktik di dalam kerangka, sementara kerangkanya tetap.

## Kasus 2: DSDM dan Crystal

### Kondisi kunci

Sistem pendaftaran mahasiswa baru harus selesai empat bulan karena dipakai pada periode penerimaan, sementara anggaran sudah ditetapkan dan tidak bisa ditambah. Dari 15 fitur yang direncanakan, hanya 8 yang wajib tersedia pada peluncuran pertama. Artinya tanggal dan biaya terkunci, sedangkan lingkup masih bisa ditawar.

### Pilihan

DSDM. Kerangka ini dibangun untuk kondisi waktu dan biaya tetap dengan fitur yang menyesuaikan.

### Mekanisme yang menjawab

Timebox membungkus setiap iterasi dengan durasi tetap, dan isi timebox tidak ditambah ketika waktu mepet; yang turun adalah cakupan. MoSCoW memisahkan 8 fitur Must have dari 7 sisanya sebagai Should have atau Could have, dengan effort Must have dijaga di bawah 60 persen agar masih ada kontingensi. Fase Feasibility dan Foundations memaksa universitas menyepakati prioritas sebelum pembangunan dimulai, bukan pada minggu terakhir. Minimum Usable SubseT dari MoSCoW menjadi definisi resmi peluncuran pertama: delapan fitur itu yang dijamin, sisanya dikerjakan bila waktu tersisa. Business case membuat keputusan menunda fitur bisa dipertanggungjawabkan ke sponsor.

### Kenapa alternatifnya kurang sesuai

Crystal mengatur berat proses menurut ukuran tim dan criticality, bukan menurut tenggat. Tidak ada mekanisme negosiasi lingkup di dalamnya, tidak ada business case formal, dan tidak ada aturan prioritas yang bisa dipakai memilih 8 dari 15 fitur. Kalau tenggat empat bulan meleset, Crystal tidak menyediakan cara memutuskan apa yang dilepas.

## Kasus 4: Nexus dan FDD

### Kondisi kunci

Empat Scrum Team mengerjakan satu platform dengan satu Product Backlog bersama. Tiap tim menyelesaikan pekerjaannya sendiri, tetapi saat digabungkan muncul konflik kode, ketidaksesuaian antarmuka, dan fitur yang tidak berjalan bersama. Gejalanya mengarah ke dua hal: definisi selesai yang berbeda antar tim, dan integrasi yang baru diuji di akhir.

### Pilihan

Nexus. Cakupannya tiga sampai sembilan tim pada satu produk dengan satu Product Owner dan satu Product Backlog, jadi empat tim masuk persis.

### Mekanisme yang menjawab

Nexus Integration Team memastikan Integrated Increment yang Done lahir setiap Sprint, dengan tugas menyorot dan mengelola dependensi. Satu Definition of Done untuk seluruh Nexus menutup celah selesai di tim saya, dan tim boleh lebih ketat tetapi tidak lebih longgar. Nexus Sprint Planning menghasilkan satu Nexus Sprint Backlog yang menandai dependensi antar tim, jadi ketergantungan terlihat sejak awal Sprint. Cross-Team Refinement memaksa kesepakatan antarmuka sebelum kode ditulis. Nexus Sprint Review menguji increment gabungan, sehingga konflik kode dan fitur yang tidak jalan bersama muncul pada Sprint itu juga, bukan menumpuk sampai rilis.

### Kenapa alternatifnya kurang sesuai

FDD tidak dirancang untuk menskalakan Scrum yang sudah berjalan. Memakainya berarti meninggalkan Scrum dan memodelkan ulang domain lewat lima prosesnya, sementara masalah di kasus ini adalah ritme integrasi lintas tim. Class ownership dan inspection FDD menjaga kualitas per class, tetapi tidak menjawab kapan empat tim harus menyatukan pekerjaan.

## Kasus 5: SAFe dan Nexus

### Kondisi kunci

Sekitar 100 developer dalam beberapa Agile Team, beberapa produk digital yang saling berkaitan, dan banyak unit bisnis. Tiap tim bekerja cukup baik, tetapi manajemen sulit menyelaraskan prioritas strategis, alokasi anggaran, dan rencana lintas tim. Persoalannya sudah melewati koordinasi teknis.

### Pilihan

SAFe. Ini persoalan penyelarasan lintas produk dan lintas unit bisnis.

### Mekanisme yang menjawab

PI Planning mengumpulkan seluruh Agile Release Train untuk menyepakati tujuan per increment dan menandai dependensi, dengan keluaran PI objectives dan planning board. Agile Release Train menjadi unit penyelarasan di atas tim, sehingga rencana lintas tim punya forum dan irama yang sama. Lean Portfolio Management menghubungkan strategi dan pendanaan ke eksekusi, termasuk keputusan investasi pada level portfolio. Peran di level portfolio memberi tempat bagi keputusan yang tidak mungkin diambil satu tim. Seratus developer masih masuk jangkauan satu atau beberapa Agile Release Train.

### Kenapa alternatifnya kurang sesuai

Nexus berhenti pada satu produk dengan tiga sampai sembilan tim. Ia tidak punya lapisan portfolio, tidak punya mekanisme anggaran, dan mengandaikan satu Product Backlog untuk satu produk. Kasus ini punya beberapa produk yang saling berkaitan plus banyak unit bisnis, jadi sebagian besar persoalan manajemen berada di luar jangkauan Nexus.

## Pola yang berulang

- Kerangka yang mengatur ritme dipilih ketika masalahnya konsistensi kerja tim. Scrum cukup untuk satu tim, Nexus dipakai ketika beberapa tim harus menyatu tiap Sprint.
- Kerangka yang mengatur prioritas dan tenggat dipilih ketika tanggal dan biaya sudah dijanjikan ke pihak luar. DSDM menjawabnya lewat timebox, MoSCoW, dan Minimum Usable SubseT.
- Lapisan skala baru dibutuhkan ketika persoalan berpindah dari koordinasi teknis ke penyelarasan strategi dan anggaran. Nexus berhenti di batas produk, SAFe menyediakan lapisan portfolio.
- Ukuran tim sering menjadi penentu pertama karena ia yang menentukan berapa banyak upacara masih terbayar. Pada tim enam atau tujuh orang, tambahan peran dan event lebih banyak menahan daripada membantu, dan itu yang terlihat di Kasus 1.

## Sumber

- <https://alistaircockburn.com/Articles/Crystal-the-un-methodology>
- <https://www.agilebusiness.org/dsdm-project-framework.html>
- <https://www.agilebusiness.org/dsdm-project-framework/moscow-prioritisation.html>
- <https://www.scrum.org/resources/online-nexus-guide>
- <https://framework.scaledagile.com/pi-planning>
- <https://framework.scaledagile.com/lean-portfolio-management>
