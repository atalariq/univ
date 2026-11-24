# Pertemuan 6: VirtualBox dan Windows

Modul yang tersimpan di folder ini membahas virtual machine dari sisi konsep, sama seperti modul pertemuan sebelumnya. VM didefinisikan sebagai emulasi perangkat lunak dari komputer fisik yang memungkinkan beberapa sistem operasi berjalan bersamaan, dengan hypervisor sebagai pengelola alokasi CPU, RAM, dan penyimpanan (hlm. 1). Komponen yang disebut adalah hypervisor, guest OS, dan aplikasi, sedangkan manfaatnya meliputi isolasi sumber daya, efisiensi biaya, kemudahan migrasi, dan skalabilitas (hlm. 2-3). VirtualBox dipilih karena open-source dan menyimulasikan perangkat keras mesin virtual sehingga sistem operasi lain dapat dijalankan tanpa perangkat aslinya (hlm. 4). Bagian Windows sendiri tidak dibahas di modul, melainkan pada laporan praktikum.

Laporan mencatat pemasangan Windows 7 di VirtualBox. Prosesnya dimulai dari VirtualBox Manager: menentukan nama VM, folder penyimpanan, dan berkas ISO Windows 7, lalu mengisi nama pengguna dan kata sandi. Setelah itu dialokasikan RAM dan jumlah inti CPU, ditentukan kapasitas virtual hard disk, dan ditinjau ringkasan konfigurasi sebelum VM dijalankan pertama kali untuk memulai instalasi dari ISO. VM yang sudah jadi tampil di daftar VirtualBox Manager dan siap dinyalakan.

Eksplorasi Windows 7 mencakup desktop dengan antarmuka Aero, Start Menu, Control Panel, pengaturan resolusi layar, File Explorer, Disk Management, Calculator, WordPad, Paint, Windows Media Player, Internet Explorer, dan permainan bawaan (report, bagian Eksplorasi Windows 7). Praktikum dilanjutkan dengan perintah dasar Command Prompt, dibagi menjadi dua kelompok. Manajemen berkas dan direktori memakai `dir`, `cd`, `mkdir`, `rmdir`, `type nul >` untuk membuat berkas kosong, `copy`, `move`, `rename`, `type`, `fc` untuk membandingkan dua berkas, dan `find` untuk mencari teks dalam berkas. Utilitas sistem dan informasi memakai `cls`, `ver`, `hostname`, `whoami`, `date`, `time`, `ipconfig`, `ping`, `tree`, `help`, `where`, dan `exit` (report, bagian Perintah Dasar CMD Windows 7).

## Poin kunci

- Modul di folder ini sama dengan modul p05 dan membahas VM serta instalasi Ubuntu, bukan Windows (hlm. 1-7).
- Hypervisor mengatur pembagian CPU, RAM, dan penyimpanan untuk setiap VM (hlm. 1-2).
- VirtualBox menyimulasikan perangkat keras sehingga guest OS berjalan seperti pada mesin nyata (hlm. 4).
- Instalasi Windows 7 di VirtualBox dimulai dari konfigurasi nama VM, ISO, akun, RAM, CPU, dan virtual hard disk (report).
- Eksplorasi Windows 7 mencakup desktop, Start Menu, Control Panel, File Explorer, dan aplikasi bawaan (report).
- Perintah CMD untuk berkas antara lain `dir`, `cd`, `copy`, `move`, `rename`, `type`, `fc`, dan `find` (report).
- Perintah CMD untuk informasi sistem antara lain `ver`, `hostname`, `whoami`, `ipconfig`, `ping`, dan `tree` (report).

## Istilah

- guest OS: sistem operasi yang dipasang di dalam VM.
- virtual hard disk: berkas penyimpanan yang diperlakukan sebagai disk oleh VM.
- Aero: antarmuka grafis Windows 7 dengan efek transparansi.
- Command Prompt: antarmuka baris perintah pada Windows.
- CLI: antarmuka berbasis teks untuk menjalankan perintah.
- `dir`: perintah CMD untuk menampilkan isi direktori, padanan `ls` di Linux.
- `fc`: perintah CMD untuk membandingkan dua berkas, padanan `diff` di Linux.
- `ipconfig`: perintah CMD untuk menampilkan konfigurasi jaringan.

## Sumber

- `modul-praktikum.local.pdf`, hlm. 1-7 (identik dengan modul di p05)
- `report/main.typ`, bagian Hasil dan Pembahasan
