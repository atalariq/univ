#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2 TRPL 2025",

  mata-kuliah: "Praktikum Teknologi Informasi dan Instalasi Komputer",
  kode-mata-kuliah: "PTIIK",
  nama-dosen-pengampu: "Imam Fahrurrozi, S.T., M.Cs.",
  no-pertemuan: "5",

  judul-praktikum: "VirtualBox dan Ubuntu",
)

#set page(
  paper: "a4",
  margin: 2.54cm,
)

#set document(
  title: vars.judul-praktikum,
  author: vars.nama
)

#set text(
  font: "Times New Roman",
  size: 12pt,
)

// #1 Cover
#align(center)[
  #upper(
    text(size: 14pt, weight: "bold")[
      LAPORAN PRAKTIKUM \
      #vars.mata-kuliah  \
      PERTEMUAN #vars.no-pertemuan \
      #vars.judul-praktikum
    ]
  )

  #v(1fr)

  #image(
    "assets/logo-UGM.png",
    width: 6cm
  )

  #v(1fr)

  Disusun oleh:
  #table(
    columns: 3,
    align: left,
    stroke: none,
    [Nama], [:], [#vars.nama],
    [NIM], [:], [#vars.nim],
    [Kelas], [:], [#vars.kode-mata-kuliah\-#vars.kelas],
    [Dosen Pengampu], [:], [#vars.nama-dosen-pengampu]
  )

  #v(0.5fr)

  #upper(
    text(weight: "bold")[
      PROGRAM STUDI D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK \
      DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA \
      SEKOLAH VOKASI \
      UNIVERSITAS GADJAH MADA \
      YOGYAKARTA \
      2025
    ]
  )
]

#pagebreak()

// #2 Content

#set par(
  spacing: 1.5em,
  leading: 1.0em,
  justify: true,
)

#show outline: it => {
  show heading: set align(center)
  it
}

// Table of Contents
#outline(title: "Daftar Isi")
#pagebreak()

// Table of Image Figures
#set figure(
  supplement: "Gambar",
  numbering: "1.1",
)
#show figure.caption: set text(size: 0.75em, style: "italic")

#outline(title: "Daftar Gambar", target: figure.where(kind: image))
#pagebreak()

#set heading(numbering: "1.")
#show heading: set block(below: 1em)

= Tujuan Percobaan

+ Mengetahui apa itu Virtual Machine (VM), cara kerja, komponen, serta manfaatnya.
+ Melakukan instalasi dan konfigurasi VirtualBox serta Ubuntu.
+ Mengenali sistem operasi Ubuntu Linux dan penggunaannya.
+ Menggunakan Ubuntu Linux untuk menjalankan aplikasi dan menjalankan perintah-perintah dasar.

= Dasar Teori
// Tuliskan teori dasar sesuai modul/jurnal/referensi.

== Virtual Machine (VM)

=== Definisi
Mesin Virtual atau Virtual Machine (VM) adalah sebuah representasi virtual atau emulasi berbasis perangkat lunak dari sebuah sistem komputer fisik. VM berjalan di atas sistem operasi komputer fisik (_host_) dan memiliki akses ke sumber daya komputasi seperti CPU, memori, dan penyimpanan dari _host_ tersebut.

Sebuah VM adalah lingkungan virtual yang berfungsi sebagai sistem komputer virtual dengan CPU, memori, antarmuka jaringan, dan penyimpanannya sendiri, yang dibuat dari sistem perangkat keras fisik (terletak di lokasi atau di luar lokasi) @ibm_vm. Hal ini memungkinkan beberapa sistem operasi untuk dijalankan secara bersamaan pada satu mesin fisik tunggal.

=== Cara Kerja
- VM bekerja dengan memanfaatkan perangkat lunak yang disebut hypervisor atau Virtual Machine Monitor (VMM).
- Hypervisor bertugas untuk memisahkan sumber daya mesin fisik (CPU, RAM, penyimpanan) dan mengalokasikannya secara dinamis ke setiap VM sesuai kebutuhan.
- Ketika sebuah VM dijalankan, hypervisor menciptakan lingkungan yang terisolasi sepenuhnya untuk setiap VM.
- Ini berarti bahwa setiap VM beroperasi sebagai entitas yang terpisah dan independen, sehingga masalah atau kegagalan pada satu VM tidak akan memengaruhi VM lain yang berjalan pada host yang sama.
- Proses ini memungkinkan satu komputer fisik untuk menjalankan beberapa sistem operasi dan aplikasi seolah-olah mereka berjalan di komputer fisik yang berbeda.

=== Komponen-Komponen Penting
Sebuah lingkungan virtualisasi terdiri dari tiga komponen utama yang bekerja sama:

- Hypervisor\
  Perangkat lunak yang menjadi lapisan antara perangkat keras fisik dan VM. Peran utamanya adalah membuat, mengelola, dan mengisolasi VM, serta mengatur alokasi sumber daya fisik kepada setiap VM.
- Guest Operating System\
  Merupakan sistem operasi yang diinstal dan berjalan di dalam sebuah VM, seperti Windows atau Linux. Guest OS bertanggung jawab untuk mengelola aplikasi dan sumber daya yang telah dialokasikan untuk VM tersebut.
- Applications\
  Perangkat lunak atau program yang dijalankan di atas Guest OS di dalam lingkungan VM. Aplikasi ini berfungsi sebagaimana mestinya pada sistem komputer fisik, mencakup berbagai jenis perangkat lunak mulai dari server web hingga aplikasi perkantoran.

=== Manfaat
Penggunaan VM menawarkan berbagai keuntungan signifikan dalam komputasi modern, antara lain:

- Isolasi Sumber Daya\
  VM menyediakan isolasi sumber daya komputasi seperti CPU, RAM, dan penyimpanan antar-VM, sehingga mencegah konflik dan penggunaan sumber daya yang berlebihan.
- Efisiensi Biaya
  Melalui konsolidasi server, beberapa VM dapat dijalankan pada satu perangkat keras fisik, yang secara signifikan mengurangi biaya perangkat keras, konsumsi energi, dan biaya operasional lainnya.
- Kemudahan Migrasi\
  VM dapat dengan mudah dipindahkan atau dimigrasikan antar-server fisik atau infrastruktur cloud tanpa gangguan layanan yang berarti, memberikan fleksibilitas tinggi bagi organisasi.
- Skalabilitas\
  Jumlah VM dapat ditambah atau dikurangi dengan mudah sesuai dengan permintaan beban kerja tanpa perlu melakukan perubahan pada perangkat keras fisik, mendukung pertumbuhan bisnis yang fleksibel.

@modul

== VM Software
Terdapat berbagai perangkat lunak yang dapat digunakan untuk membuat dan mengelola mesin virtual. Beberapa yang populer di antaranya adalah VMware, VirtualBox, Hyper-V (milik Microsoft), dan KVM/QEMU.

=== Oracle VM VirtualBox
Oracle VM VirtualBox adalah perangkat lunak virtualisasi open-source dan lintas platform yang memungkinkan pengguna untuk membuat dan menjalankan mesin virtual pada sistem operasi host yang ada. Dengan VirtualBox, semua komponen perangkat keras dari mesin virtual disimulasikan oleh komputer host, sehingga memungkinkan instalasi berbagai sistem operasi tanpa memerlukan perangkat keras fisik tambahan.

== Sistem Operasi Linux
Untuk memahami sistem operasi Linux, penting untuk membedakan antara kernel, sistem operasi, dan distribusi:

- Kernel\
  Merupakan komponen inti dari sebuah sistem operasi @linux_kernel. Tugas utamanya adalah sebagai jembatan antara perangkat lunak (aplikasi) dan perangkat keras (CPU, memori, perangkat I/O), serta mengelola sumber daya sistem secara efisien. Linux sendiri pada dasarnya merujuk pada kernel ini.
- Sistem Operasi atau _Operating System_ (OS)\
  Sebuah OS adalah gabungan dari kernel dengan berbagai perangkat lunak sistem esensial lainnya (utilitas, libraries, dan daemons) yang memungkinkan komputer berfungsi dan dapat digunakan oleh pengguna.
- Distribusi Linux (Distro)\
  Sebuah distribusi Linux adalah sistem operasi lengkap yang dibangun di atas kernel Linux dan menyertakan kumpulan perangkat lunak, manajer paket, lingkungan desktop (desktop environment), dan aplikasi tambahan yang telah dikonfigurasi sebelumnya. Contoh distro populer adalah Ubuntu, Fedora, dan Debian.

=== Ubuntu Linux
Ubuntu adalah salah satu distribusi Linux berbasis Debian yang paling populer dan banyak digunakan di dunia, baik untuk komputer desktop maupun server. Dikembangkan oleh Canonical Ltd., Ubuntu dikenal karena kemudahan penggunaan, siklus rilis yang teratur, dan dukungan komunitas yang luas @ubuntu.

#pagebreak()

= Hasil dan Pembahasan

Pada praktikum ini, dilakukan prosedur instalasi Ubuntu Linux pada VirtualBox, eksplorasi fitur-fitur dasar Ubuntu, dan penggunaan aplikasi dasar seperti browser dan office (LibreOffice), serta penggunaan perintah dasar pada terminal.

// helper function
#let img(path, caption: "", width: 10cm) = [
  #figure(
    image(path, width: width),
    caption: caption,
  )
]

== Instalasi Ubuntu Linux pada VirtualBox

Proses instalasi Ubuntu 22.04 LTS pada VirtualBox dilakukan melalui beberapa tahapan konfigurasi awal sebelum instalasi sistem operasi secara otomatis dijalankan. Berikut adalah langkah-langkah utamanya:
+ Proses diawali dengan mendefinisikan nama mesin virtual, memilih folder penyimpanan, dan menautkan berkas citra ISO Ubuntu yang akan digunakan sebagai media instalasi.
  #img("assets/virtualbox-1.png", caption: "Konfigurasi Nama, Folder Penyimpanan, dan Berkas ISO")
+ Selanjutnya, dilakukan konfigurasi untuk instalasi otomatis, meliputi pembuatan nama pengguna (_username_), kata sandi (_password_), nama mesin (_hostname_), dan nama domain.
  #img("assets/virtualbox-2.png", caption: "Konfigurasi Nama Pengguna, Kata Sandi, dan Hostname")
+ Konfigurasi pengalokasian sumber daya perangkat keras virtual untuk VM, seperti jumlah memori utama (RAM) dan jumlah inti prosesor (CPU) yang akan digunakan.
  #img("assets/virtualbox-3.png", caption: "Alokasi Memori Utama (RAM) dan Prosesor (CPU)")
+ Pembuatan dan konfigurasi _virtual hard disk_ sebagai media penyimpanan untuk sistem operasi Ubuntu, termasuk menentukan ukurannya.
  #img("assets/virtualbox-4.png", caption: "Konfigurasi Ukuran Hard Disk Virtual")
+ Ringkasan dari seluruh konfigurasi yang telah diatur sebelum proses instalasi dimulai.
  #img("assets/virtualbox-5.png", caption: "Ringkasan Konfigurasi Mesin Virtual")
+ Setelah konfigurasi selesai, mesin virtual Ubuntu muncul di VirtualBox Manager dengan status "Powered Off", siap untuk dijalankan.
  #img("assets/virtualbox-6.png", caption: "VM Ubuntu Siap untuk Dijalankan")
+ Klik tombol "Start", VM akan melakukan _booting_ dari berkas ISO dan memulai proses instalasi sistem operasi Ubuntu secara otomatis.
  #img("assets/virtualbox-7.png", caption: "Memulai Proses Instalasi VM Ubuntu")
+ Sistem operasi Ubuntu berhasil terinstal secara otomatis pada mesin virtual.
  #img("assets/ubuntu-instalasi_otomatis.png", caption: "Penyelesaian Instalasi dan Pembaruan Perangkat Lunak", width: 9cm)
+ Sebagai tambahan, gambar berikut menunjukkan kondisi _storage_ virtual setelah proses instalasi selesai.
  #img("assets/virtualbox-kondisi storage setelah instalasi.png", caption: "Kondisi Penyimpanan Virtual Setelah Instalasi OS")

== Eksplorasi Aplikasi pada Ubuntu Linux

Setelah proses instalasi selesai, dilakukan eksplorasi terhadap berbagai aplikasi dan utilitas bawaan yang tersedia pada Ubuntu Desktop. Eksplorasi ini bertujuan untuk membiasakan diri dengan lingkungan desktop GNOME dan menguji fungsionalitas dasar sistem operasi sesuai dengan tugas pada modul praktikum. Beberapa aplikasi utama yang dieksplorasi antara lain:
- *Calculator*: Aplikasi kalkulator standar.
- *Files*: File manager atau file explorer untuk mengelola file dan folder.
- *System Monitor*: Utilitas untuk memantau proses dan penggunaan sumber daya sistem.
- *LibreOffice Suite*: Paket aplikasi perkantoran yang terdiri dari Writer, Calc, dan Impress. Alternatif dari Microsoft Office.
- *Firefox*: Web browser bawaan Ubuntu.
- *Cheese*: Aplikasi untuk mengambil foto dan video menggunakan _webcam_.
- *Sudoku*: Permainan sudoku bawaan.
- *Software & Updates*: Utilitas untuk mengelola repositori perangkat lunak dan pembaruan sistem.
- *Ubuntu Software*: Pusat aplikasi untuk mencari dan menginstal perangkat lunak baru.
- *Kitty*: Aplikasi terminal yang ringan dan cepat. Alternatif dari terminal bawaan yang tidak dapat dijalankan pada saat praktikum.

Berikut adalah dokumentasi dari proses eksplorasi aplikasi tersebut.

#img("assets/ubuntu-login_screen.png", caption: "Tampilan Layar Login Ubuntu")
#img("assets/ubuntu-desktop.png", caption: "Tampilan Desktop Ubuntu dengan Lingkungan GNOME")
#img("assets/ubuntu-display_settings.png", caption: "Mengakses Pengaturan Tampilan (Display Settings)")
#img("assets/ubuntu-launchpad_1.png", caption: "Membuka Launchpad untuk Melihat Aplikasi Terinstal (Halaman 1)")
#img("assets/ubuntu-launchpad_2.png", caption: "Melihat Aplikasi Terinstal (Halaman 2)")
#img("assets/ubuntu-calculator.png", caption: "Menggunakan Aplikasi Calculator")
#img("assets/ubuntu-file_manager.png", caption: "Mengeksplorasi Berkas dan Folder dengan File Manager")
#img("assets/ubuntu-task_manager_1.png", caption: "Membuka System Monitor (Task Manager)")
#img("assets/ubuntu-task_manager_2.png", caption: "Melihat Proses yang Sedang Berjalan")
#img("assets/ubuntu-task_manager_3.png", caption: "Melihat Penggunaan Sumber Daya (CPU, Memori, Jaringan)")
#img("assets/ubuntu-libreoffice.png", caption: "Tampilan Awal LibreOffice Suite")
#img("assets/ubuntu-libreoffice_writer.png", caption: "Membuat Dokumen Menggunakan LibreOffice Writer")
#img("assets/ubuntu-libreoffice_calc.png", caption: "Membuat Tabel Menggunakan LibreOffice Calc")
#img("assets/ubuntu-libreoffice_impress.png", caption: "Membuat Slide Presentasi Menggunakan LibreOffice Impress")
#img("assets/ubuntu-firefox.png", caption: "Membuka Peramban Web Firefox")
#img("assets/ubuntu-web_virtualbox.png", caption: "Mengunjungi Situs Web VirtualBox")
#img("assets/ubuntu-web_ubuntu.png", caption: "Mengunjungi Situs Web Ubuntu")
#img("assets/ubuntu-web_lichess.png", caption: "Mengakses Situs Web untuk Bermain Catur Online")
#img("assets/ubuntu-chesse.png", caption: "Menggunakan Aplikasi Webcam 'Cheese'")
#img("assets/ubuntu-sudoku.png", caption: "Bermain Sudoku")
#img("assets/ubuntu-software_and_updates.png", caption: "Mengelola Sumber Perangkat Lunak Melalui 'Software & Updates'")
#img("assets/ubuntu-appstore.png", caption: "Membuka Pusat Aplikasi 'Ubuntu Software'")
#img("assets/ubuntu-appstore_install_terminal.png", caption: "Mencari Aplikasi Terminal Alternatif (Kitty)")
#img("assets/ubuntu-appstore_install_kitty.png", caption: "Menginstal Terminal Kitty melalui 'Ubuntu Software'")
#img("assets/ubuntu-kitty_terminal.png", caption: "Terminal Kitty Berhasil Diinstal dan Dijalankan")

== Penggunaan Perintah Dasar pada Terminal

Bagian terakhir dari praktikum ini adalah menjalankan perintah-perintah dasar Linux pada terminal. Eksplorasi ini mencakup navigasi sistem berkas, manajemen pengguna, pemantauan sistem, manajemen paket, dan utilitas jaringan. Berikut adalah daftar perintah yang dijalankan beserta fungsinya.

=== Manajemen File
+ `touch`: Membuat sebuah berkas kosong.
+ `cat`: Menampilkan keseluruhan isi sebuah berkas.
+ `head` dan `tail`: Menampilkan beberapa baris pertama atau terakhir dari sebuah berkas.
+ `sort`: Mengurutkan isi dari sebuah berkas.
+ `cp`: Menyalin berkas atau direktori (_Copy_).
+ `mv`: Memindahkan atau mengubah nama berkas/direktori (_Move_).
+ `rm`: Menghapus berkas atau direktori (_Remove_).
#img("assets/cmd-mkdir,touh,mv,cp,rm.png", caption: "Manajemen Berkas: `mkdir`, `touch`, `mv`, `cp`, `rm`")
#img("assets/cmd-cat,head,tail.png", caption: "Melihat Isi Berkas: `cat`, `head`, `tail`")
#img("assets/cmd-cat,sort.png", caption: "Mengurutkan Isi Berkas dengan `sort`")
#img("assets/cmd-ln.png", caption: "Membuat Tautan (Symbolic Link) dengan `ln`")

=== Navigasi dan Manajemen Folder
+ `pwd`: Menampilkan direktori kerja saat ini (_Print Working Directory_).
+ `cd`: Mengubah direktori (_Change Directory_).
+ `ls`: Menampilkan isi dari sebuah direktori (_List_).
+ `mkdir`: Membuat direktori baru (_Make Directory_).
+ `rmdir`: Menghapus direktori kosong (_Remove Directory_).
#img("assets/cmd-pwd,cd,ls,mkdir,rmdir.png", caption: "Perintah Navigasi Dasar")
#img("assets/cmd-pwd.png", caption: "Verifikasi Direktori Saat Ini dengan `pwd`")
#img("assets/cmd-ls_lsa_lla.png", caption: "Penggunaan Opsi pada Perintah `ls`")

=== Manajemen Paket dan Akses Root
+ `apt`: Utilitas utama untuk mengelola paket (instalasi, pembaruan, penghapusan) pada sistem berbasis Debian/Ubuntu.
+ `su`: Beralih ke pengguna lain, termasuk pengguna _root_ (_Switch User_).
+ `sudo`: Menjalankan perintah dengan hak akses _root_ (_Superuser Do_).
#img("assets/cmd-su_apt_install.png", caption: "Instalasi Paket sebagai Root Menggunakan `su`")
#img("assets/cmd-sudo_apt (before editing sudoers).png", caption: "Upaya Menjalankan `sudo` oleh User yang Belum Terdaftar")
#img("assets/cmd-visudo.png", caption: "Mengedit Berkas `/etc/sudoers` dengan `visudo`")
#img("assets/cmd-visudo_sudoers.png", caption: "Menambahkan Hak Akses `sudo` untuk User")
#img("assets/cmd-sudo_apt.png", caption: "Berhasil Menjalankan Perintah dengan `sudo`")
#img("assets/cmd-sudo_apt_update.png", caption: "Memperbarui Daftar Paket dengan `sudo apt update`")

=== Utilitas Networking
+ `ip`: Menampilkan dan mengelola informasi alamat IP dan antarmuka jaringan.
+ `ping`: Menguji konektivitas ke sebuah host di jaringan.
+ `nmap`: Memindai jaringan untuk menemukan host dan layanan.
#img("assets/cmd-ip.png", caption: "Melihat Konfigurasi Jaringan dengan `ip`")
#img("assets/cmd-ping.png", caption: "Menguji Konektivitas dengan `ping`")
#img("assets/cmd-nmap.png", caption: "Memindai Port dengan `nmap`")

=== Utilitas `systemd`
+ `systemctl`: Mengelola layanan dan unit `systemd`.
+ `systemd-analyze`: Menganalisis waktu _boot-up_ sistem.
+ `journalctl`: Melihat _log_ yang dikumpulkan oleh `systemd`.
#img("assets/cmd-systemd-analyze.png", caption: "Menganalisis Waktu Boot dengan `systemd-analyze`")
#img("assets/cmd-systemd-analyze_blame.png", caption: "Melihat Layanan yang Memperlambat Boot")
#img("assets/cmd-journalctl.png", caption: "Melihat Log Sistem dengan `journalctl`")

=== Informasi Sistem
+ `uname`: Menampilkan informasi kernel dan sistem operasi.
+ `hostname`: Menampilkan nama _host_ dari sistem.
+ `du`: Menampilkan penggunaan disk oleh berkas/direktori (_Disk Usage_).
+ `df`: Menampilkan penggunaan disk pada sistem berkas (_Disk Free_).
#img("assets/cmd-uname,hostname.png", caption: "Menampilkan Informasi Sistem dan Hostname")
#img("assets/cmd-du,df.png", caption: "Memeriksa Penggunaan Disk dengan `du` dan `df`")

=== Manajemen User
+ `users`, `groups`, `id`: Menampilkan informasi mengenai pengguna yang sedang login, grup, dan ID pengguna/grup.
+ `useradd` dan `userdel`: Menambah dan menghapus akun pengguna.
#img("assets/cmd-users,groups,id.png", caption: "Manajemen Pengguna: `users`, `groups`, `id`")
#img("assets/cmd-useradd,userdel.png", caption: "Menambah dan Menghapus Pengguna")

=== Manajemen Proses
+ `ps`: Menampilkan proses yang sedang berjalan.
+ `kill`, `killall`: Menghentikan proses berdasarkan ID (PID) atau nama.
+ `top`, `htop`: Memantau penggunaan sumber daya dan proses secara interaktif.
+ `pstree`: Menampilkan proses dalam format pohon.
+ `jobs`, `bg`, `fg`: Mengelola proses yang berjalan di _background_ atau _foreground_.
#img("assets/cmd-ps,kill,killall.png", caption: "Manajemen Proses: `ps`, `kill`, `killall`")
#img("assets/cmd-top.png", caption: "Pemantauan Sistem dengan `top`")
#img("assets/cmd-htop.png", caption: "Pemantauan Sistem Interaktif dengan `htop`")
#img("assets/cmd-pstree.png", caption: "Visualisasi Proses dengan `pstree`")
#img("assets/cmd-jobs,bg,fg.png", caption: "Manajemen Jobs dengan `jobs`, `bg`, dan `fg`")

=== Lain-lain
- `fish`: _Shell_ alternatif yang interaktif dan ramah pengguna.
- `clear`: Membersihkan layar terminal.
- `echo`: Menampilkan teks atau nilai variabel ke terminal.
- `whereis`, `which`: Menemukan lokasi dari sebuah perintah.
- `whatis`, `man`: Menampilkan deskripsi singkat atau manual lengkap dari sebuah perintah.
- `export`: Menetapkan nilai sebuah _environment variable_.
- `nano/vi/vim/nvim`: Editor teks berbasis terminal.
- `git`: Sistem kontrol versi terdistribusi.
- `neofetch`: Menampilkan informasi sistem dan logo distro dalam format ASCII.
- `cmatrix`, `cbonsai`: Aplikasi hiburan visual di terminal.

#img("assets/cmd-clear.png", caption: "Membersihkan Layar Terminal dengan `clear`")
#img("assets/cmd-echo,export.png", caption: "Perintah `echo` dan `export`")
#img("assets/cmd-whereis,which,whatis,man.png", caption: "Mencari Bantuan dan Lokasi Perintah")
#img("assets/cmd-man_preview.png", caption: "Tampilan Halaman Manual dari Perintah `man`")
#img("assets/cmd-nano.png", caption: "Menggunakan Editor Teks `nano`")
#img("assets/cmd-neovim.png", caption: "Menggunakan Editor Teks `neovim`")
#img("assets/cmd-git_0.png", caption: "Menginisialisasi Repositori `git`")
#img("assets/cmd-git_1.png", caption: "Menambahkan Berkas ke Staging Area `git`")
#img("assets/cmd-git_2.png", caption: "Melakukan Commit pada `git`")
#img("assets/cmd-git_3.png", caption: "Melihat Riwayat Commit dengan `git log`")
#img("assets/cmd-git_4.png", caption: "Melihat Status Repositori `git`")
#img("assets/cmd-fish.png", caption: "Menggunakan `fish` Shell")
#img("assets/cmd-neofetch.png", caption: "Menampilkan Informasi Sistem dengan `neofetch`")
#img("assets/cmd-cmatrix.png", caption: "Tampilan Animasi `cmatrix`")
#img("assets/cmd-cbonsai.png", caption: "Tampilan Animasi `cbonsai`")

#pagebreak()

= Kesimpulan

Berdasarkan praktikum yang telah dilaksanakan, dapat ditarik beberapa kesimpulan sebagai berikut:
+ Praktikum ini berhasil memberikan pemahaman konseptual dan praktis mengenai Mesin Virtual (VM), termasuk definisi, cara kerja yang bergantung pada _hypervisor_, komponen utama, serta manfaatnya dalam efisiensi sumber daya dan isolasi lingkungan kerja.
+ Proses instalasi dan konfigurasi VirtualBox pada sistem operasi _host_ serta instalasi sistem operasi Ubuntu 22.04 LTS sebagai _guest OS_ di dalamnya dapat dilakukan dengan lancar dan berhasil, membuktikan bahwa virtualisasi adalah teknologi yang dapat diakses untuk membuat lingkungan komputasi terisolasi.
+ Eksplorasi pada lingkungan desktop GNOME di Ubuntu memberikan pengenalan yang efektif terhadap antarmuka pengguna, manajemen berkas, dan fungsionalitas dasar sistem operasi Linux, yang menunjukkan kemudahan penggunaannya untuk berbagai keperluan.
+ Penggunaan aplikasi bawaan seperti LibreOffice dan Firefox, serta eksekusi berbagai perintah dasar pada terminal, telah membuktikan bahwa VM Ubuntu dapat berfungsi penuh sebagai lingkungan kerja yang produktif dan fleksibel untuk pengembangan, administrasi sistem, maupun penggunaan sehari-hari.

#pagebreak()

// #3 Bibliography/References

// Make the title center
#show bibliography: it => {
  show heading: set align(center)
  it
}

#bibliography(
  "references.bib",
  title: "Daftar Pustaka",
  style: "ieee",
  full: true
)
