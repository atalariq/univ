# Pertemuan 4: Security

Catatan dari deck `from-elok.local/arpl-p4-security.pdf` (42 hlm., materi CSSE6400 oleh Guangdong Bai), dilengkapi `csse.uq.local/w2a-security.pdf` (8 hlm., Brae Webb). Nomor halaman mengacu ke deck kecuali disebut `w2a`.

## Ringkasan

Deck dibuka dengan dua kegagalan: Heartbleed pada 2014 (hlm. 3) dan laporan bahwa tidak ada yang bisa menjaga catatan online tetap aman (hlm. 4). Sebabnya tajam: hampir semua kegagalan keamanan berasal dari software vulnerability (hlm. 5). Security lalu jadi quality attribute yang dibawa sejak desain, sejajar performance atau availability.

Rumusannya: software memberi functionality, security adalah pengaturan akses terhadap asset, informasi maupun fungsi (hlm. 7). Setiap functionality membawa risiko, misalnya pengawasan ujian online yang menginstal agen di komputer mahasiswa. Keputusan tentang penyimpanan data dan siapa boleh membacanya menentukan batas masalah sebelum kode ditulis.

## Konsep kunci

CIA triad (hlm. 8): stealing information melanggar confidentiality, memodifikasi informasi atau fungsi melanggar integrity, menolak akses melanggar availability. Desainnya: masking dan kriptografi (hlm. 10), hashing serta resource locking (hlm. 13), replication dan failover (hlm. 18 sampai 19).

Threat model tidak muncul di deck, jadi ini tambahan saya: asset apa yang dilindungi, aktor mana yang ingin menyentuhnya, jalur mana yang bisa dipakai. Bahannya ada di pembahasan asset (hlm. 7) dan asumsi trust yang keliru (hlm. 39).

Attack surface adalah titik yang bisa disentuh penyerang. Least privilege memperkecilnya (`w2a` hlm. 2), dependency pihak ketiga memperlebarnya (hlm. 39).

Empat prinsip deck (hlm. 21): favor simplicity karena sistem kompleks sulit dianalisis (hlm. 23); trust with reluctance dengan trusted computing base kecil dan least privilege (hlm. 27 sampai 29); defend in depth dengan lapisan berkarakter berbeda (hlm. 35); monitor and trace karena serangan tak terdeteksi sama saja dengan yang berhasil (hlm. 38).

Fail secure dari `w2a`: akses ditolak sampai diberikan eksplisit (hlm. 2), dan kegagalan tidak boleh menciptakan celah baru (hlm. 3). Outage Facebook 2021: gagal terbuka memudahkan perbaikan, gagal terkunci menjaga data tetapi menyulitkan pemulihan. Separation of duties tidak dibahas tuntas; `w2a` menyebut separation of privilege sebagai prinsip yang tidak dibahas (hlm. 7), dan deck mendekatinya lewat compartmentalization (hlm. 33).

## Titik rawan yang dibahas deck

Heartbleed (hlm. 3) hanya muncul sebagai judul; detailnya tambahan: bug out-of-bounds read di OpenSSL mengirim isi memori server, termasuk private key, ke klien.

Top 10 design flaws (hlm. 39): trust diasumsikan tanpa diberikan, autentikasi bisa dilewati, otorisasi tanpa konteks, data dicampur instruksi kontrol, validasi tidak menyeluruh, kriptografi salah pakai, data sensitif tidak diidentifikasi, pengguna diabaikan, komponen eksternal tanpa hitung attack surface, perubahan terlalu kaku.

Kriptografi salah (hlm. 40): jangan menulis algoritme sendiri, enkripsi tidak menjaga integrity, key jangan disimpan di binary. Dictionary attack (hlm. 15) menjelaskan mengapa hash polos rapuh; salted hash (hlm. 16) menolong asalkan salt unik dan acak.

Trust is transitive (hlm. 30): mail client menyerahkan penyuntingan ke editor, editor bisa escape ke shell, jadi mail client ikut mengizinkan eksekusi kode. Flow restriction di admisi UQ (hlm. 32): PDF hanya dilihat di browser supaya tidak ada salinan di komputer admin.

## Taktik dan pola arsitektural

Autentikasi dan otorisasi. MFA masuk sebagai lapisan defense in depth (hlm. 35). Pembagian role dan batas akses antar komponen di level arsitektur, pemeriksaan izin tiap operasi di level kode (hlm. 39).

Isolasi. Compartmentalization menaruh komponen di sandbox (hlm. 33), misalnya Flash Player lewat fork, exec, seccomp-bpf (hlm. 34), dan microkernel yang memindahkan device driver keluar kernel (hlm. 28).

Enkripsi. Symmetric (hlm. 11) atau asymmetric (hlm. 12) menentukan di mana key berada. Penempatan key, rotasi, dan KMS atau HSM keputusan arsitektur; pemanggilan API yang benar pekerjaan kode.

Audit logging. Event relevan dicatat dan log digabung lintas aplikasi supaya sebab sebuah breach bisa dilacak (hlm. 38). Input validation (hlm. 31) dan sanitisation (`w2a` hlm. 4) di level kode.

## Trade-off

Usability. MFA yang terus meminta ulang membuat pengguna memasang alat bypass (`w2a` hlm. 4). Deck menyebutnya kelelahan pengguna (hlm. 26).

Performance. Enkripsi menambah kerja CPU, TLS menambah round trip, logging menambah I/O.

Biaya operasional. Key rotation, manajemen secret, retensi log, dan patch dependency menuntut orang, bukan hanya alat (hlm. 37).

Availability. Fail secure menutup akses saat sistem bermasalah, dan bisa lebih mahal daripada insiden yang dicegah (`w2a` hlm. 3).

Kompleksitas. Schneier dikutip di deck: makin banyak opsi dan interaksi, makin sulit keamanannya dianalisis (hlm. 23).

## Kapan desain ini gagal

- Default permisif supaya demo lancar, lalu tidak pernah diubah.
- Satu akun database untuk baca dan tulis (`w2a` hlm. 2).
- Validasi hanya di client, endpoint menerima apa pun.
- Kriptografi buatan sendiri, enkripsi dianggap menjaga integrity (hlm. 40).
- Key di-hardcode di repository atau binary.
- Log tidak dirancang, insiden diketahui dari laporan pengguna (hlm. 38).
- Dependency tanpa pin versi dan tanpa review (`w2a` hlm. 5).
- Sandbox dianggap cukup padahal service di dalamnya saling percaya.

## Kaitan dengan pertemuan lain

Di `../p12-monolith-microservices/NOTES.md`, perpindahan ke microservices mengubah batas kepercayaan. Panggilan fungsi dalam satu proses menjadi panggilan jaringan, dan tiap batas butuh autentikasi serta otorisasi sendiri. Shared database memudahkan konsistensi sekaligus menghapus batas akses.

Di `../p13-event-driven-architecture/NOTES.md`, event adalah fakta dari pihak lain dan tidak boleh dipercaya begitu saja. Siapa pun yang bisa menerbitkan event bisa menggerakkan alur bisnis, jadi broker, skema event, dan identitas publisher masuk ke attack surface (hlm. 30).

## Sumber

- `from-elok.local/arpl-p4-security.pdf`, deck CSSE6400 Quality attribute: Security, 42 hlm.
- `csse.uq.local/w2a-security.pdf`, Security Principles, Brae Webb, 8 hlm.
- Detail Heartbleed dan CVE tambahan di luar deck, yang hanya menyebutnya di hlm. 3.
- Hlm. 25 dan 42 tidak menghasilkan teks; keduanya gambar tanpa keterangan.
