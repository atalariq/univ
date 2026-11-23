# Suplemen: tiga pertanyaan yang belum terjawab

Tiga pertanyaan lanjutan dari [fdd-expert-brief.md](fdd-expert-brief.md): seberapa kecil sebuah fitur, mengapa strukturnya hierarkis, dan seperti apa praktiknya.

## Seberapa kecil sebuah fitur

Patokan pertama adalah durasi pengerjaan. De Luca memakai no more than 10 days rule, dan laporan praktisi menyebut rentang 1 sampai 10 hari kerja per fitur, mayoritas 1 sampai 3 hari (Grant Cause, Methods & Tools). Sepuluh hari kerja setara dua minggu kalender.

Patokan kedua adalah nilai klien. Fitur ditulis dengan template action result object, misalnya "Calculate the total of a sale", sehingga kalimatnya bisa diucapkan ke pemilik bisnis tanpa penerjemahan. Kalimat yang tidak lulus uji itu umumnya task teknis: "membuat tabel database nasabah" tidak punya nilai klien, sedangkan "Create a customer record" punya. Yang pertama tetap dikerjakan, tetapi tempatnya di dalam design package.

Konteks berjenjangnya: satu fitur selesai dalam dua minggu, satu feature set kira-kira sebulan, satu major feature set kira-kira tiga bulan. Angka sebulan dan tiga bulan berasal dari Palmer dan Felsing, belum saya verifikasi ke teks buku, jadi perlu dicek.

Konsekuensi aturan ini tegas: bila sebuah fitur melewati dua minggu, yang dipecah adalah fiturnya, sementara tenggat tetap. Dibanding user story Scrum, story boleh seukuran fitur, tetapi FDD lebih kaku soal format nama dan batas durasi.

## Kenapa strukturnya hierarkis

Alasannya teknis. Pada proyek 50 orang, banyak developer menyentuh class yang sama. Tanpa pemilik tunggal, setiap perubahan menuntut negosiasi ulang. FDD menjawabnya dengan class ownership: satu class punya satu owner yang menjaga konsistensi, performa, dan conceptual integrity. Ketika sebuah fitur menyentuh beberapa class, para owner-nya bekerja bersama sebagai feature team.

Peran di atasnya membagi dua jenis keputusan. Chief architect memegang standar teknis dan model domain: memandu develop an overall model, menetapkan pembagian layer, dan menengahi dua subject area yang modelnya bertabrakan. Chief programmer memegang urutan kerja: menyusun plan by feature menurut business value dan ketergantungan teknis, membentuk feature team, dan menulis laporan progres mingguan.

Yang hilang dibanding tim self-organizing ala Scrum cukup nyata. Tim tidak memilih caranya sendiri, dan rasa memiliki terhadap proses lebih tipis karena urutan kerja datang dari atas. Risikonya terkonsentrasi: hampir semua keputusan besar melewati dua orang, sehingga bila salah satunya pergi, sakit, atau menjadi bottleneck, aliran kerja berhenti. Hierarki ini merugikan saat tim di bawah 15 orang, saat arsitektur awal ternyata salah, atau saat chief programmer berubah menjadi koordinator penuh waktu yang berhenti menyentuh kode.

## Praktik lapangan

Beberapa praktik berulang di laporan praktisi, masing-masing dengan gejala yang muncul bila ditinggalkan.

Feature list ditempel di dinding sebagai parking lot chart: kotak besar per subject area, kotak kecil per business activity, dan angka jumlah fitur. Bila papan ini hilang, dua orang mengerjakan fitur yang sama dan prioritas berubah menurut siapa yang bicara terakhir.

Fitur yang ditunda disimpan di bagian terpisah dan tidak dihapus. Bila dibuang diam-diam, fitur itu muncul lagi saat user acceptance test sebagai "katanya dulu dikerjakan".

Laporan progres mingguan memakai persentase penyelesaian per fitur. Bila berhenti, progres berubah menjadi opini dan keterlambatan baru terlihat di minggu terakhir.

Design inspection dan code inspection dibatasi waktunya dan dipimpin satu moderator. Inspection yang melebar berubah menjadi sesi desain ulang, dan siklus fitur melewati dua minggu.

Domain walkthrough dilakukan bersama domain expert yang sebenarnya. Bila diperantarai analis, nama fitur kembali ke bahasa IT dan rework muncul di UAT.

Tiga sampai lima fitur pertama dikerjakan sebagai pilot untuk mengkalibrasi template nama dan estimasi. Tanpa pilot, kesalahan penamaan terulang di seluruh feature list.

Cycle time per fitur dipakai sebagai alarm. Bila satu fitur konsisten melewati dua minggu, sumbernya biasanya di hulu: model domain bolong atau antrean inspection menumpuk, dan menambah orang tidak memperbaikinya.

## Studi kasus

Kasus yang paling sering dirujuk adalah proyek sebuah bank besar di Singapura pada 1997, yang oleh sebagian laporan disebut sebagai United Overseas Bank. Proyek ini berjalan 15 bulan dengan sekitar 50 orang dan menjadi tempat FDD pertama kali dipakai. Angka 1997, 15 bulan, 50 orang, dan sebutan "large Singapore bank" terverifikasi di tiga sumber yang bisa dibuka (agilemodeling.com, Wikipedia, Planview). Nama United Overseas Bank belum saya temukan di sumber primer yang bisa dibuka; identifikasi itu beredar sebagai laporan Jeff De Luca dan perlu dicek.

Proyeknya bergerak di domain lending, sesuai sebutan De Luca sebagai "Singapore Lending project". Model domain di proyek ini bukan dokumen seremonial. Model itu menjadi kosakata bersama: fitur dinamai terhadap class dan relationship di dalamnya, dan satu fitur pada problem domain layer setara dengan satu method pada sebuah class. Konsekuensinya, feature list tetap konsisten meski berisi ratusan item, dan domain expert bisa meninjau daftar itu tanpa belajar notasi UML.

Setelah proyek pertama, FDD dipakai pada inisiatif lanjutan berdurasi 18 bulan dengan 250 orang, masih menurut agilemodeling.com dan Planview. Pemakaian lain yang terdokumentasi: sistem otomatis design and assign untuk provisioning jaringan di sebuah perusahaan telekomunikasi, dengan lebih dari 500 fitur pada problem domain layer saja; dan sistem entri data uji klinis di situs investigator untuk penelitian obat. Keduanya didokumentasikan De Luca sendiri di forum FDD pada 2003.

Temuan yang jujur: studi kasus FDD yang bisa diverifikasi publik jauh lebih sedikit dibanding Scrum. Sebagian besar bukti berasal dari penulis metode itu atau konsultan yang menjualnya, dan banyak organisasi tidak mengizinkan feature list-nya dibuka karena memuat rincian bisnis.

## Analogi untuk pemaparan

FDD seperti kontraktor yang menyelesaikan master plan dan gambar struktur sebelum membangun unit, lalu menyerahkan bangunan per unit dengan mandor dan tukang berspesialisasi. Master plan menjelaskan letak pondasi dan jalur pipa; unit diserahkan satu per satu, diperiksa dulu, dan mandor melaporkan berapa yang selesai minggu ini.

Batas analoginya perlu disebut. Unit bangunan biasanya identik dan gambar struktur jarang berubah, sedangkan fitur berbeda dan kebutuhan bergerak selama proyek. Karena itu gambar pada FDD sengaja dangkal, cukup untuk menamai fitur dan memperkirakan urutan, tidak untuk mengunci detail. Inspection di FDD adalah peer review desain dan kode, sedangkan inspeksi bangunan dilakukan pihak ketiga.

## Referensi

- Ambler, FDD and Agile Modeling: <https://agilemodeling.com/essays/fdd.htm>
- Arsip FDD: <https://featuredrivendevelopment.com/>
- Wikipedia, FDD: <https://en.wikipedia.org/wiki/Feature-driven_development>
- Palmer dan Felsing, A Practical Guide to Feature-Driven Development, 2002
- Grant Cause, Delivering Real Business Value using FDD: <https://www.methodsandtools.com/archive/archive.php?id=19>
- Planview, FDD in Agile: <https://www.planview.com/resources/articles/fdd-agile/>
- De Luca, contoh feature list, 2003: <https://web.archive.org/web/20191230234915/http://www.featuredrivendevelopment.com/node/622>
