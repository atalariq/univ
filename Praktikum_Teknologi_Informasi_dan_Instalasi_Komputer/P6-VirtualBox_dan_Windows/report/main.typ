#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2 TRPL 2025",

  mata-kuliah: "Praktikum Teknologi Informasi dan Instalasi Komputer",
  kode-mata-kuliah: "PTIIK",
  nama-dosen-pengampu: "Imam Fahrurrozi, S.T., M.Cs.",
  no-pertemuan: "6",

  judul-praktikum: "VirtualBox dan Windows OS",
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

// #set par(first-line-indent: 1.5em)

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

// helper function
#let img(path, caption: "", width: 8cm) = [
  #figure(
    image(path, width: width),
    caption: caption,
  )
]

= Tujuan Percobaan

+ Mengetahui instalasi sistem operasi Windows menggunakan VirtualBox.
+ Melakukan eksplorasi fitur-fitur dasar yang tersedia pada Windows 7
+ Mempelajari perintah-perintah dasar Command Prompt atau CMD pada Windows 7.

= Dasar Teori

== Virtual Machine (VM)

=== Definisi
Virtual Machine merupakan emulasi perangkat lunak dari sebuah sistem komputer fisik, memungkinkan sebuah perangkat meniru perangkat lain. Sebuah VM beroperasi di atas sistem operasi utama (_host_) dan diberikan akses virtual ke sumber daya perangkat keras _host_ tersebut, seperti CPU, memori, dan media penyimpanan.

Menurut IBM, VM adalah lingkungan virtual yang berfungsi layaknya komputer independen dengan sumber dayanya sendiri, yang diemulasikan dari sebuah sistem perangkat keras fisik @ibm_vm. Teknologi ini memungkinkan satu komputer fisik untuk menjalankan beberapa sistem operasi secara simultan dan terisolasi satu sama lain.

=== Cara Kerja

VM dapat bekerja karena adanya perangkat lunak yang disebut _hypervisor_ atau _Virtual Machine Monitor_ (VMM). _Hypervisor_ berfungsi sebagai lapisan abstraksi yang memisahkan sumber daya perangkat keras fisik dari mesin virtual. Ia bertanggung jawab untuk mengalokasikan sumber daya ini secara dinamis ke setiap VM yang berjalan. Dengan menciptakan lingkungan yang terisolasi sepenuhnya, _hypervisor_ memastikan bahwa setiap VM berfungsi sebagai entitas mandiri. Konsekuensinya, isu atau kegagalan yang terjadi pada satu VM tidak akan berdampak pada VM lainnya yang berjalan di _host_ yang sama.

#img("assets/vm-cara_kerja.png", caption: "Cara kerja VM" ,width: 6cm)

=== Komponen-Komponen Penting

Lingkungan virtualisasi ditopang oleh tiga komponen fundamental:
- Hypervisor\
  Perangkat lunak yang menjadi manajer utama VM, mengendalikan alokasi sumber daya fisik, serta menciptakan dan mengisolasi setiap lingkungan virtual.
- Guest Operating System (Guest OS)\
  Sistem operasi (misalnya Windows atau Linux) yang diinstal dan berjalan di dalam sebuah VM. _Guest OS_ mengelola aplikasi dan sumber daya yang telah dialokasikan untuk VM tersebut.
- Applications\
  Perangkat lunak yang dijalankan di atas _Guest OS_. Aplikasi ini berfungsi normal seolah-olah berjalan di atas perangkat keras fisik.

=== Manfaat

#img("assets/vm-benefits.jpg", caption: "Keuntungan menggunakan VM", width: 8cm)

Virtualisasi menawarkan sejumlah keunggulan strategis dalam komputasi modern:
- Isolasi Sumber Daya\
  Setiap VM beroperasi dalam lingkungan terisolasi, mencegah konflik sumber daya dan meningkatkan stabilitas sistem secara keseluruhan.
- Efisiensi Biaya\
  Dengan konsolidasi server—menjalankan beberapa VM pada satu server fisik—biaya perangkat keras, konsumsi daya, dan operasional dapat ditekan secara signifikan.
- Kemudahan Migrasi\
  VM bersifat portabel dan dapat dengan mudah dipindahkan (_migrated_) antar server fisik atau ke infrastruktur _cloud_ dengan _downtime_ minimal.
- Skalabilitas\
  Sumber daya pada VM dapat ditambah atau dikurangi secara fleksibel (_on-demand_) tanpa perlu melakukan intervensi pada perangkat keras fisik, memungkinkan adaptasi yang cepat terhadap perubahan beban kerja.

== Oracle VM VirtualBox

#img("assets/virtualbox-interface.png", caption: "Antarmuka awal aplikasi VirtualBox", width: 8cm)

Oracle VM VirtualBox adalah perangkat lunak virtualisasi _open-source_ populer yang bersifat _cross-platform_. VirtualBox merupakan hypervisor tipe 2 yang memungkinkan pengguna untuk membuat dan menjalankan beberapa mesin virtual dengan sistem operasi yang berbeda secara bersamaan pada satu komputer _host_.

== Windows Operating System

#img("assets/win-logo.png", caption: "Logo Windows 7", width: 6cm)

Microsoft Windows adalah suatu sistem operasi berorientasi grafis (GUI) yang dikembangkan dan dipasarkan oleh Microsoft. Sejak rilis pertamanya pada tahun 1985, Windows telah menjadi sistem operasi paling populer untuk PC di seluruh dunia @lenovo_windows. Sistem operasi ini dikenal karena antarmukanya yang ramah pengguna.

Windows 7, yang dirilis pada tahun 2009, adalah salah satu versi paling sukses dalam sejarah Windows. Ia menjadi penerus Windows Vista dan membawa banyak perbaikan dalam hal performa, stabilitas, dan antarmuka pengguna, termasuk pengenalan taskbar yang didesain ulang dan fitur Aero Snap. Meskipun dukungan resmi untuk Windows 7 telah berakhir pada Januari 2020, sistem operasi ini tetap menjadi contoh penting dalam evolusi OS modern.

#pagebreak()

= Hasil dan Pembahasan

Pada praktikum ini, dilakukan beberapa prosedur untuk memahami dasar-dasar Windows 7, mulai dari instalasi Windows 7 menggunakan VirtualBox, melakukan eksplorasi aplikasi pada Windows 7, hingga mempraktikan _command-command_ dasar pada Command Prompt Windows 7.

== Instalasi Windows 7 pada VirtualBox

Proses instalasi Windows 7 pada VirtualBox diawali dengan serangkaian konfigurasi pada VirtualBox Manager untuk mempersiapkan lingkungan virtual. Langkah-langkah yang dilakukan adalah sebagai berikut:
+ Konfigurasi Awal nama VM, menentukan lokasi penyimpanan, dan memilih berkas ISO Windows 7 sebagai media instalasi.
  #img("assets/virtualbox-1.png", caption: "Konfigurasi Nama, Folder Penyimpanan, dan Berkas ISO")
+ Konfigurasi nama pengguna dan kata sandi.
  #img("assets/virtualbox-2.png", caption: "Konfigurasi Nama Pengguna dan Kata Sandi")
+ Konfigurasi alokasi sumber daya VM, mulai dari menentukan jumlah memori (RAM) dan jumlah _core_ prosesor (CPU) yang akan digunakan oleh VM.
  #img("assets/virtualbox-3.png", caption: "Alokasi Memori Utama (RAM) dan Prosesor (CPU)")
+ Konfigurasi _virtual hard disk_ dengan menentukan kapasitas penyimpanan VM Windows 7.
  #img("assets/virtualbox-4.png", caption: "Konfigurasi Ukuran Hard Disk Virtual")
+ Meninjau kembali ringkasan dari seluruh pengaturan yang telah dibuat sebelum memulai instalasi.
  #img("assets/virtualbox-5.png", caption: "Ringkasan Konfigurasi VM")
+ Setelah melakukan setup, VM Windows 7 muncul di daftar VirtualBox Manager, menandakan bahwa lingkungan virtual telah siap.
  #img("assets/virtualbox-6.png", caption: "VM Windows Siap untuk Dijalankan")
+ Menjalankan VM untuk pertama kalinya, yang akan memulai proses _booting_ dari berkas ISO dan menjalankan instalasi Windows 7.
  #img("assets/virtualbox-7.png", caption: "Memulai Proses Instalasi Windows 7 di VirtualBox")

== Eksplorasi Windows 7

Setelah instalasi berhasil, dilakukan eksplorasi terhadap antarmuka dan aplikasi bawaan Windows 7. Proses ini meliputi familiarisasi dengan desktop, Start Menu, Control Panel, dan beberapa utilitas dasar untuk memahami fungsionalitas sistem operasi.

#let two(img1, img2) = [
  #grid(
    columns: (1fr, 1fr),
    gutter: 1cm,
    img1,
    img2
  )
]

#img("assets/win-booting.png", caption: "Tampilan Layar Booting Windows 7"),

#two(
  img("assets/win-desktop.png", caption: "Desktop Windows 7 dengan Antarmuka Aero"),
  img("assets/win-start.png", caption: "Membuka Start Menu untuk Mengakses Program")
)

#two(
  img("assets/win-control-panel.png", caption: "Control Panel sebagai Pusat Pengaturan Sistem"),
  img("assets/win-change display resolution.png", caption: "Mengubah Resolusi Layar Melalui Control Panel")
)

#two(
  img("assets/win-file_explorer.png", caption: "Mengelola Berkas Menggunakan File Explorer"),
  img("assets/win-disk_management.png", caption: "Utilitas Disk Management untuk Mengelola Partisi")
)

#two(
  img("assets/win-calculator.png", caption: "Menggunakan Aplikasi Kalkulator Bawaan"),
  img("assets/win-wordpad.png", caption: "Membuat Dokumen Sederhana dengan WordPad")
)

#two(
  img("assets/win-paint.png", caption: "Menggambar Menggunakan Microsoft Paint"),
  img("assets/win-wmp.png", caption: "Membuka Windows Media Player")
)

#img("assets/win-ie.png", caption: "Menjalankan Peramban Internet Explorer")

#two(
  img("assets/win-games.png", caption: "Melihat Daftar Permainan Bawaan"),
  img("assets/win-minesweeper.png", caption: "Bermain Minesweeper")
)

#two(
  img("assets/win-purble_place.png", caption: "Bermain Purble Place"),
  img("assets/win-solitare.png", caption: "Bermain Solitaire")
)

#img("assets/win-cmd.png", caption: "Membuka Command Prompt (CMD)")

== Perintah Dasar CMD Windows 7

Eksplorasi dilanjutkan dengan penggunaan _Command Line Interface_ Windows, yaitu Command Prompt (CMD). Berbagai perintah dasar dijalankan untuk melakukan tugas-tugas seperti navigasi direktori, manajemen berkas, dan pengecekan sistem. @lifewire_cmd

=== Manajemen Berkas dan Direktori
- `dir`: Menampilkan daftar berkas dan subdirektori dalam sebuah direktori. Mirip perintah `ls` di Linux.
- `cd`: Mengubah direktori aktif (_Change Directory_).
- `mkdir`: Membuat sebuah direktori baru.
- `rmdir`: Menghapus sebuah direktori.
- `type nul > [namafile]`: Cara untuk membuat berkas kosong, setara dengan perintah `touch` di Linux.
- `copy`: Menyalin satu atau lebih berkas ke lokasi lain. Ekuivalen dengan perintah `cp`.
- `move`: Memindahkan berkas dari satu direktori ke direktori lain. Ekuivalen dengan perintah `mv`.
- `rename`: Mengubah nama sebuah berkas.
- `type`: Menampilkan isi dari sebuah berkas teks. Mirip dengan perintah `cat` di Linux.
- `fc`: Membandingkan dua berkas dan menampilkan perbedaannya (_File Compare_). Mirip dengan perintah `diff` di Linux.
- `find`: Mencari string teks dalam sebuah berkas.

#two(
  img("assets/cmd-dir.png", caption: "Menampilkan Isi Direktori dengan `dir`"),
  img("assets/cmd-cd.png", caption: "Berpindah Direktori Menggunakan `cd`")
)

#two(
  img("assets/cmd-mkdir.png", caption: "Membuat Direktori Baru dengan `mkdir`"),
  img("assets/cmd-creating_file (touch equivalent).png", caption: "Membuat Berkas Kosong")
)

#two(
  img("assets/cmd-copy.png", caption: "Menyalin Berkas dengan `copy`"),
  img("assets/cmd-move.png", caption: "Memindahkan Berkas dengan `move`")
)

#two(
  img("assets/cmd-rename.png", caption: "Mengubah Nama Berkas dengan `rename`"),
  img("assets/cmd-type.png", caption: "Menampilkan Isi Berkas dengan `type`")
)

#two(
  img("assets/cmd-fc.png", caption: "Membandingkan Dua Berkas dengan `fc`"),
  img("assets/cmd-find.png", caption: "Mencari Teks dalam Berkas dengan `find`")
)

#img("assets/cmd-pushd,popd,rmdir.png", caption: "Menggunakan `pushd`, `popd`, dan `rmdir`")

=== Utilitas Sistem dan Informasi

- `cls`: Membersihkan layar Command Prompt.
- `ver`: Menampilkan versi Windows yang sedang digunakan.
- `hostname`: Menampilkan nama _host_ komputer.
- `whoami`: Menampilkan pengguna yang sedang login.
- `date`: Menampilkan atau mengatur tanggal sistem.
- `time`: Menampilkan atau mengatur waktu sistem.
- `ipconfig`: Menampilkan informasi konfigurasi jaringan IP.
- `ping`: Mengirim paket ICMP untuk menguji konektivitas ke _host_ lain.
- `tree`: Menampilkan struktur direktori secara grafis.
- `help`: Menampilkan informasi bantuan untuk perintah-perintah sistem.
- `where`: Mencari lokasi sebuah berkas.
- `exit`: Menutup jendela Command Prompt.

#two(
  img("assets/cmd-cls.png", caption: "Membersihkan Layar dengan `cls`"),
  img("assets/cmd-ver.png", caption: "Melihat Versi OS dengan `ver`")
)

#two(
  img("assets/cmd-hostname.png", caption: "Melihat Nama Host dengan `hostname`"),
  img("assets/cmd-whoami.png", caption: "Melihat User Saat Ini dengan `whoami`")
)

#two(
  img("assets/cmd-date.png", caption: "Menampilkan Tanggal dengan `date`"),
  img("assets/cmd-time.png", caption: "Menampilkan Waktu dengan `time`")
)

#two(
  img("assets/cmd-ipconfig.png", caption: "Melihat Konfigurasi Jaringan dengan `ipconfig`"),
  img("assets/cmd-ping.png", caption: "Menguji Konektivitas Jaringan dengan `ping`")
)

#two(
  img("assets/cmd-tree.png", caption: "Menampilkan Struktur Folder dengan `tree`"),
  img("assets/cmd-help.png", caption: "Menampilkan Daftar Perintah dengan `help`")
)

#two(
  img("assets/cmd-help_copy.png", caption: "Melihat Bantuan Spesifik untuk Perintah `copy`"),
  img("assets/cmd-where.png", caption: "Mencari Lokasi Berkas dengan `where`")
)

#two(
  img("assets/cmd-cmd,exit.png", caption: "Membuka dan Menutup CMD"),
  img("assets/cmd-echo.png", caption: "Menampilkan Pesan dengan `echo`")
)

#two(
  img("assets/cmd-more.png", caption: "Menampilkan Output per Halaman dengan `more`"),
  img("assets/cmd-help-more.png", caption: "Menggabungkan `help` dan `more`")
)

#img("assets/cmd-pkgmgr.png", caption: "Mencoba Package Manager (pkgmgr)")

#pagebreak()

= Kesimpulan

Berdasarkan praktikum yang telah dilaksanakan, kesimpulan yang diperoleh adalah sebagai berikut:
+ Proses instalasi sistem operasi Windows 7  menggunakan VirtualBox telah berhasil dilakukan. Hal ini menunjukkan penerapan praktis teknologi virtualisasi untuk menciptakan sistem komputer yang terisolasi dan fungsional di atas perangkat keras yang sudah ada.
+ Eksplorasi antarmuka grafis Windows 7, termasuk desktop, Start Menu, Control Panel, dan aplikasi bawaan, berhasil memberikan pemahaman mengenai fitur dan fungsionalitas dasar dari sistem operasi tersebut.
+ Penggunaan Command Prompt (CMD) untuk menjalankan berbagai perintah dasar telah memberikan wawasan mengenai manajemen sistem berbasis teks pada Windows. Perintah untuk manajemen berkas, direktori, serta utilitas sistem dan jaringan berhasil dijalankan, membuktikan bahwa CLI merupakan alat yang kuat untuk administrasi sistem.

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
  full: true,
)
