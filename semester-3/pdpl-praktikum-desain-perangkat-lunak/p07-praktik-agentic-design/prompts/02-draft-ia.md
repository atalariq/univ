Bertindaklah sebagai UX Architect yang profesional dan berpengalaman dalam menyusun [user flow / sitemap] untuk sebuah produk digital.

## Konteks Produk

Saya sedang mengembangkan [nama produk], yaitu [jelaskan singkat jenis produk: website company profile / mobile app / web system] dengan tujuan utama [tujuan produk].

Jenis output yang dibutuhkan, (pilih salah satu)
- Sitemap : jika project berupa website (informasional, company profile, landing page multi-halaman)
- User Flow : jika project berupa system/app dengan interaksi dan proses (transaksi, login, form multi-step, dashboard)

## Dokumen Terlampir

1. User Persona (file:[nama-file-persona.pdf/png]) Gunakan sebagai acuan: siapa pengguna, tujuan mereka mengakses produk, dan halaman/fitur apa yang paling mereka butuhkan lebih dulu.
2. BRD (file:[nama-file-brd.pdf]) Gunakan sebagai acuan: seluruh fitur dan requirement yang wajib tercermin dalam struktur navigasi/alur, sesuai skala prioritas (Must Have / Should Have / Nice to Have).

## Ketentuan Struktur

### Jika Sitemap:

- Tampilkan struktur hierarki halaman (Home sebagai root, turunan menu utama, sub-halaman)
- Sertakan label navigasi yang jelas untuk tiap halaman
- Tunjukkan hubungan antar halaman (parent-child) dan halaman yang bisa diakses dari mana saja (misal footer/global nav)
- Tandai halaman yang membutuhkan autentikasi/login (jika ada)

### Jika User Flow:

- Tampilkan alur dari entry point (misal: splash/login) hingga goal akhir sesuai tujuan utama persona
- Gunakan notasi standar: rectangle (screen), diamond (decision point), arrow (alur/transisi)
- Sertakan alternative flow (misal: gagal validasi, cancel, error state)
- Tandai titik keputusan penting (decision point) yang menentukan percabangan alur Instruksi Pengerjaan
- Prioritaskan alur/struktur berdasarkan kebutuhan utama di User Persona (apa yang paling sering/penting mereka lakukan)
- Pastikan semua fitur "Must Have" dari BRD tercermin dalam struktur ini, jangan ada requirement yang tidak punya tempat dalam alur/sitemap
- Jika ada requirement dari BRD yang ambigu untuk dipetakan ke alur, tandai sebagai “PERLU KONFIRMASI”
- Susun secara logis dan tidak berlebihan, hindari langkah/halaman yang tidak perlu (minimize friction)

## Eksekusi Figma

Karena kamu sudah terkoneksi dengan Figma, buatkan struktur ini langsung sebagai board/diagram di file Figma saya:
- Gunakan sticky note atau shape sederhana (rectangle/diamond) untuk merepresentasikan setiap halaman/screen/decision point, jangan membuat tampilan UI, layout, atau komponen visual apa pun
- Hubungkan antar elemen dengan connector/arrow FigJam sesuai alur
- Beri label teks yang jelas pada setiap shape dan connector
- Gunakan warna berbeda untuk membedakan: flow utama, alternative flow, dan decision point (cukup dengan warna shape/sticky note, bukan styling visual)
- Susun layout diagram secara rapi (top-to-bottom atau left-to-right, konsisten), dikelompokkan per section jika strukturnya besar
- Jangan tambahkan detail visual seperti button styling, image placeholder, spacing presisi, atau elemen desain lain, cukup representasi logis alur/struktur

## Output
- Ringkasan struktur dalam bentuk teks (list/tree hierarki) di chat
- Diagram FigJam (murni shape + connector + label) di file yang sedang aktif
