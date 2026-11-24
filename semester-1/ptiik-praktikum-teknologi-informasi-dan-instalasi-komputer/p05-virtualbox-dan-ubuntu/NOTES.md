# Pertemuan 5: VirtualBox dan Ubuntu

Pertemuan ini melanjutkan pengenalan virtual machine ke praktik pemasangan Oracle VM VirtualBox dan Ubuntu di dalamnya. Modul menjelaskan VirtualBox sebagai aplikasi open-source yang membuat mesin PC virtual berjalan independen di atas sistem operasi utama, dengan seluruh perangkat keras mesin virtual disimulasikan oleh host (hlm. 4). Instalasi di host dilakukan dengan mengunduh pemasang dari situs resmi VirtualBox, lalu membuat VM baru dan mengisikan nama, tipe, serta versi sistem operasi. Berkas ISO Ubuntu desktop ditambahkan lewat Settings dan Storage pada bagian Optical Drive, kemudian VM dijalankan dengan tombol Start (hlm. 5-7).

Laporan praktikum mencatat pemasangan Ubuntu 22.04 LTS secara otomatis pada VirtualBox. Tahapannya adalah menentukan nama VM, folder penyimpanan, dan berkas ISO, mengisi username, password, hostname, dan domain untuk instalasi otomatis, mengalokasikan RAM dan jumlah inti CPU, lalu menentukan ukuran virtual hard disk sebelum meninjau ringkasan konfigurasi dan menekan Start. Setelah instalasi selesai, VM muncul di VirtualBox Manager dengan status Powered Off dan siap dijalankan.

Eksplorasi lingkungan Ubuntu dilakukan pada desktop GNOME, mencakup Calculator, Files, System Monitor, LibreOffice Writer, Calc, dan Impress, Firefox, Cheese untuk webcam, Sudoku, Software & Updates, Ubuntu Software, serta terminal Kitty yang dipasang lewat pusat aplikasi (report, bagian Eksplorasi Aplikasi). Bagian terakhir praktikum menjalankan perintah dasar Linux di terminal, dikelompokkan menurut fungsinya: manajemen berkas seperti `touch`, `cat`, `head`, `tail`, `cp`, `mv`, dan `rm`; navigasi seperti `pwd`, `cd`, `ls`, `mkdir`, dan `rmdir`; manajemen paket dan hak akses seperti `apt`, `su`, `sudo`, dan `visudo`; utilitas jaringan `ip`, `ping`, dan `nmap`; layanan `systemctl`, `systemd-analyze`, dan `journalctl`; informasi sistem `uname`, `hostname`, `du`, dan `df`; manajemen pengguna `users`, `groups`, `id`, `useradd`, dan `userdel`; serta manajemen proses `ps`, `kill`, `top`, `htop`, `pstree`, `jobs`, `bg`, dan `fg` (report, bagian Penggunaan Perintah Dasar pada Terminal).

## Poin kunci

- VirtualBox adalah aplikasi open-source untuk membuat mesin virtual di atas host (hlm. 4).
- Berkas ISO dipasang pada Optical Drive melalui Settings dan Storage sebelum VM dijalankan (hlm. 5-6).
- Pembuatan VM di VirtualBox meminta username, password, dan hostname untuk instalasi otomatis (report).
- Alokasi RAM, jumlah inti CPU, dan ukuran virtual hard disk ditentukan saat membuat VM (report).
- Lingkungan Ubuntu yang dipakai adalah desktop GNOME dengan LibreOffice, Firefox, dan Files (report).
- `sudo` menjalankan perintah dengan hak root, sedangkan `visudo` dipakai mengedit berkas sudoers (report).
- Perintah Linux dikelompokkan menjadi manajemen berkas, navigasi, paket, jaringan, layanan, informasi sistem, pengguna, dan proses (report).

## Istilah

- host: komputer fisik tempat VirtualBox dan VM berjalan.
- guest: sistem operasi yang berjalan di dalam VM.
- ISO: berkas citra media instalasi.
- virtual hard disk: berkas yang berperan sebagai disk pada VM.
- unattended install: pemasangan otomatis memakai jawaban yang diisi di awal.
- GNOME: lingkungan desktop bawaan Ubuntu.
- sudo: perintah untuk menjalankan aksi dengan hak superuser.
- package manager: alat pengelola pemasangan dan pembaruan perangkat lunak.
- systemd: sistem init yang mengelola layanan pada Linux.

## Sumber

- `modul-praktikum.local.pdf`, hlm. 4-7 (identik dengan modul di p06)
- `report/main.typ`, bagian Hasil dan Pembahasan
