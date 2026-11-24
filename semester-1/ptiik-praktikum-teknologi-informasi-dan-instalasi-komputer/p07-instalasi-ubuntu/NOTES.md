# Pertemuan 7: Instalasi Ubuntu

Folder ini tidak berisi modul dosen, sehingga catatan disusun dari laporan praktikum yang ada di `report/`. Praktikum ini memasang Ubuntu pada komputer fisik, bukan pada virtual machine seperti pertemuan sebelumnya. Bagian dasar teori menjelaskan sistem operasi sebagai perantara antara pengguna dan perangkat keras, lalu memperkenalkan Ubuntu sebagai distribusi Linux berbasis Debian yang dikembangkan Canonical sejak 2004 dan menganut perangkat lunak bebas serta sumber terbuka. BIOS dan UEFI dijelaskan sebagai firmware yang menjalankan POST, mendeteksi perangkat keras, dan memuat bootloader sesuai urutan boot priority, sedangkan bootable device adalah media penyimpanan yang telah dikonfigurasi agar dapat memulai komputer (report, bagian Dasar Teori).

Media instalasi dibuat dengan Rufus, aplikasi portabel Windows untuk memformat flashdisk dan menuliskan berkas ISO. Langkahnya adalah menyiapkan flashdisk minimal 8 GB dan ISO Ubuntu, memilih device pada Rufus, memilih berkas ISO lewat tombol SELECT, menyesuaikan partition scheme dengan sistem target, yaitu GPT untuk UEFI modern dan MBR untuk BIOS legacy, membiarkan file system pada FAT32, lalu menekan START. Proses ini memformat flashdisk dan menyalin seluruh isi ISO sehingga media dapat dipakai untuk booting (report, bagian Membuat Bootable Flashdisk dengan Rufus). Pada pelaksanaan praktikum, media instalasi ternyata dibuat dengan Ventoy, sehingga muncul menu multi-boot untuk memilih berkas ISO sebelum bootloader GRUB Ubuntu dimuat.

Instalasi di komputer fisik dimulai dengan masuk BIOS atau UEFI memakai tombol seperti F2, F10, atau Del untuk memindahkan flashdisk ke urutan boot pertama. Setelah layar pembuka instalasi, dipilih bahasa dan opsi Install Ubuntu, lalu metode instalasi interaktif, set aplikasi minimal, dan tanpa perangkat lunak proprietary karena perangkat target tidak memerlukan driver non-FOSS. Konfigurasi storage memakai opsi yang menghapus disk dan memasang Ubuntu secara otomatis, dilanjutkan konfirmasi SSD tujuan, pembuatan akun beserta hostname dan kata sandi, serta pemilihan zona waktu Asia/Jakarta. Sebelum proses dimulai, seluruh pengaturan ditinjau ulang. Installer kemudian menyalin berkas sistem, memformat partisi, dan memasang bootloader GRUB; setelah selesai, komputer di-restart dengan peringatan agar flashdisk dicabut, dan booting pertama menampilkan desktop GNOME (report, bagian Menginstal Ubuntu di PC).

## Poin kunci

- Folder ini tidak memuat modul dosen; catatan bersumber dari laporan praktikum (report).
- Instalasi dilakukan pada komputer fisik, berbeda dari praktik sebelumnya di virtual machine (report).
- BIOS/UEFI mengatur boot priority agar komputer memuat installer dari flashdisk (report).
- Rufus menulis ISO ke flashdisk dengan skema GPT untuk UEFI dan MBR untuk BIOS legacy (report).
- Media yang dipakai saat praktik adalah Ventoy, yang menampilkan menu multi-boot (report).
- Opsi erase disk and install dipilih agar partisi dibuat otomatis (report).
- Zona waktu yang dipilih adalah Asia/Jakarta dan akun pertama memperoleh hak sudo (report).

## Istilah

- BIOS: firmware dasar yang menginisialisasi perangkat keras saat komputer dinyalakan.
- UEFI: penerus BIOS dengan antarmuka grafis dan dukungan disk besar.
- POST: pemeriksaan perangkat keras yang dijalankan saat booting.
- boot priority: urutan media yang dicari firmware untuk memuat sistem.
- bootable device: media yang sudah dikonfigurasi agar dapat dipakai booting.
- Rufus: aplikasi pembuat flashdisk bootable dari berkas ISO.
- Ventoy: alat pembuat media bootable multi-ISO.
- partition scheme: skema partisi, yaitu MBR atau GPT.
- GRUB: bootloader yang memuat sistem operasi Linux.
- ISO: berkas citra media instalasi.
- proprietary software: perangkat lunak berlisensi tertutup, misalnya driver non-FOSS.

## Sumber

- `report/main.typ`, bagian Dasar Teori dan Hasil dan Pembahasan
