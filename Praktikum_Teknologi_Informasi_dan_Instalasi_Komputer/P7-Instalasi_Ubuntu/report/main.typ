#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2 TRPL 2025",

  mata-kuliah: "Praktikum Teknologi Informasi dan Instalasi Komputer",
  kode-mata-kuliah: "PTIIK",
  nama-dosen-pengampu: "Imam Fahrurrozi, S.T., M.Cs.",
  no-pertemuan: "7",

  judul-praktikum: "Rufus dan Ubuntu",
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
#show figure.caption: set text(size: 0.8em)

#outline(title: "Daftar Gambar", target: figure.where(kind: image))
#pagebreak()

#set heading(numbering: "1.1.1.1")
#show heading: set block(below: 1em)

// helper function
#let img(path, caption: "", width: 7.5cm) = [
  #figure(
    image(path, width: width),
    caption: caption,
  )
]

= Tujuan Percobaan

+ Memahami dan mempraktikkan proses pembuatan media instalasi bootable menggunakan aplikasi Rufus untuk sistem operasi Ubuntu, termasuk konfigurasi parameter yang diperlukan agar flashdisk dapat digunakan sebagai media booting pada berbagai jenis sistem komputer.
+ Melakukan instalasi sistem operasi Ubuntu pada komputer fisik dengan memahami setiap tahapan proses instalasi, mulai dari konfigurasi BIOS/UEFI, pemilihan metode instalasi, partisi storage, hingga konfigurasi awal sistem operasi.
+ Mengembangkan keterampilan teknis dalam troubleshooting dan pemecahan masalah yang mungkin terjadi selama proses instalasi sistem operasi, serta memahami perbedaan fundamental antara instalasi pada mesin fisik dengan instalasi pada lingkungan virtual.

= Dasar Teori

== Sistem Operasi

Sistem operasi adalah perangkat lunak fundamental yang bertindak sebagai perantara antara pengguna dan perangkat keras komputer. Fungsi utamanya mencakup manajemen sumber daya sistem seperti prosesor, memori, perangkat input/output, serta menyediakan antarmuka bagi pengguna untuk berinteraksi dengan komputer. Sistem operasi modern seperti macOS, FreeBSD, dan berbagai distribusi Linux mengelola multitasking, keamanan sistem, dan alokasi sumber daya secara efisien untuk memastikan berbagai aplikasi dapat berjalan bersamaan tanpa konflik.

=== Ubuntu

Ubuntu adalah distribusi Linux berbasis Debian yang dikembangkan oleh Canonical Ltd. sejak tahun 2004. Filosofi Ubuntu berlandaskan pada prinsip perangkat lunak bebas dan sumber terbuka (free and open-source software), dengan moto "Linux for Human Beings" yang menekankan kemudahan penggunaan. Keunggulan utama Ubuntu meliputi dukungan komunitas yang luas, pembaruan keamanan reguler, repository perangkat lunak yang ekstensif, serta kompatibilitas hardware yang baik. Bagi pengembang, Ubuntu menyediakan lingkungan pengembangan yang lengkap dengan dukungan native untuk berbagai bahasa pemrograman dan tools development modern.

== BIOS

BIOS (Basic Input/Output System) adalah firmware tingkat rendah yang tersimpan dalam chip ROM pada motherboard, berfungsi untuk menginisialisasi dan menguji komponen perangkat keras saat komputer pertama kali dinyalakan. UEFI (Unified Extensible Firmware Interface) merupakan penerus BIOS yang menawarkan antarmuka grafis, dukungan untuk hard drive berkapasitas lebih dari 2TB, boot time yang lebih cepat, dan fitur keamanan seperti Secure Boot. Baik BIOS maupun UEFI berperan krusial dalam proses booting dengan melakukan POST (Power-On Self Test), mendeteksi perangkat keras, dan memuat bootloader dari media penyimpanan yang telah ditentukan dalam urutan boot priority.

== Bootable Device

Bootable device adalah media penyimpanan seperti flashdisk USB, DVD, atau external hard drive yang telah dikonfigurasi dengan bootloader dan file sistem operasi sehingga dapat digunakan untuk memulai (boot) komputer. Perangkat ini diperlukan untuk instalasi sistem operasi baru karena memungkinkan komputer untuk memuat lingkungan instalasi sebelum sistem operasi utama terpasang. Secara konseptual, bootable device bekerja dengan menyimpan master boot record (MBR) atau GUID Partition Table (GPT) yang berisi instruksi untuk memuat bootloader, yang selanjutnya akan memuat kernel sistem operasi dan menginisialisasi proses instalasi.

=== Rufus

Rufus (Reliable USB Formatting Utility) adalah aplikasi portabel gratis untuk Windows yang digunakan untuk memformat dan membuat flashdisk USB bootable dari file ISO. Dikembangkan oleh Pete Batard, Rufus dikenal karena kecepatannya yang dua kali lipat lebih cepat dibandingkan tools sejenis seperti UNetbootin atau Universal USB Installer. Kelebihan Rufus mencakup ukuran aplikasi yang sangat kecil (kurang dari 2MB), tidak memerlukan instalasi, mendukung berbagai skema partisi (MBR dan GPT), kompatibilitas dengan BIOS dan UEFI, serta kemampuan untuk membuat bootable drive dari berbagai jenis image file termasuk ISO, IMG, dan DD image.

#pagebreak()

= Hasil dan Pembahasan

== Membuat Bootable Flashdisk dengan Rufus

#img("assets/rufus-outsource.png", caption: "Membuat Bootable dengan Rufus")

+ Proses pembuatan bootable flashdisk menggunakan Rufus dimulai dengan persiapan flashdisk berkapasitas minimal 8GB dan file ISO Ubuntu yang telah diunduh dari situs resmi. 
+ Setelah menjalankan aplikasi Rufus, flashdisk target dipilih pada bagian Device, kemudian file ISO Ubuntu dimasukkan melalui tombol SELECT.
  #img("assets/rufus-1-select media.png", caption: "Pilih flashdisk yang akan dijadikan bootable")
  #img("assets/rufus-2-select ISO and configure format option.png", caption: "Pilih file ISO Ubuntu dan lakukan konfigurasi")
+ Konfigurasi partition scheme disesuaikan dengan sistem target, dimana GPT dipilih untuk sistem UEFI modern dan MBR untuk sistem BIOS legacy.
+ Target system secara otomatis akan menyesuaikan berdasarkan partition scheme yang dipilih.
+ File system dibiarkan pada pengaturan default FAT32 untuk kompatibilitas maksimal, dan cluster size tetap pada nilai default.
+ Setelah semua parameter dikonfigurasi, proses writing dimulai dengan menekan tombol START, yang akan memformat flashdisk dan menyalin seluruh konten ISO ke dalamnya dengan struktur yang memungkinkan booting.
  #img("assets/rufus-3-write ISO.png", caption: "Write file ISO")
  #img("assets/rufus-4-confirm.png", caption: "Konfirmasi prosedur writing")
  #img("assets/rufus-5-writing.png", caption: "Proses writing flashdisk menjadi bootable")

== Menginstal Ubuntu di PC

Proses instalasi sistem operasi Ubuntu pada komputer fisik melibatkan serangkaian langkah krusial yang dimulai dari konfigurasi firmware hingga pengaturan akhir sistem. Berikut adalah tahapan rinci yang telah dilakukan selama praktikum.

Langkah pertama dalam proses instalasi adalah mengakses menu BIOS/UEFI. Hal ini dilakukan dengan menekan tombol spesifik (umumnya F2, F10, atau Del) saat komputer pertama kali dinyalakan. Tujuan dari langkah ini adalah untuk mengubah urutan prioritas booting (_boot order_), memastikan komputer akan memuat sistem dari _flashdisk_ instalasi Ubuntu terlebih dahulu, bukan dari _hard drive_ atau SSD internal.
#img(
  "assets/01-masuk bios Medium.png",
  caption: "Mengakses menu BIOS/UEFI untuk mengubah urutan boot."
)

Pada menu _boot priority_ di BIOS/UEFI, _flashdisk_ yang telah dibuat _bootable_ dipindahkan ke posisi pertama dalam daftar _boot order_. Perubahan ini memastikan bahwa saat komputer melakukan _restart_, _firmware_ akan mencari dan memuat _bootloader_ dari _flashdisk_ terlebih dahulu.
#img(
  "assets/02-pilih booting ke flashdisk Medium.png",
  caption: "Memilih flashdisk sebagai prioritas boot utama."
)

Tampilan ini muncul karena media instalasi dibuat menggunakan Ventoy, yang mendukung _multi-boot_. Jika menggunakan Rufus secara standar, tahap ini akan dilewati dan sistem akan langsung memuat _bootloader_ Ubuntu. Dari menu ini, _file_ ISO Ubuntu dipilih untuk memulai proses.
#img(
  "assets/03-pilih ubuntu (soalnya pakai ventoy, kalau pakai rufus nanti langsung masuk gambar 04) Medium.png",
  caption: "Memilih image ISO Ubuntu dari menu Ventoy."
)

_Bootloader_ GRUB Ubuntu berhasil dimuat, menampilkan menu dengan opsi untuk mencoba Ubuntu tanpa instalasi (_Try Ubuntu_) atau langsung melakukan instalasi. Tahap ini mengonfirmasi bahwa _bootable device_ telah dibuat dengan benar dan sistem berhasil memuatnya.
#img(
  "assets/04-berhasil booting ke ubuntu Medium.png",
  caption: "Tampilan GRUB bootloader Ubuntu."
)

Layar pembuka instalasi Ubuntu muncul dengan pilihan bahasa. Pemilihan bahasa pada tahap ini akan menentukan lokalisasi sistem, termasuk format tanggal, waktu, dan mata uang.
#img(
  "assets/05-welcome to ubuntu Medium.png",
  caption: "Memilih bahasa untuk proses instalasi."
)

Ubuntu menawarkan dua opsi utama: "Try Ubuntu" untuk menjalankan sistem operasi langsung dari RAM tanpa mengubah _hard drive_ (_Live USB_), atau "Install Ubuntu" untuk melakukan instalasi permanen. Opsi instalasi langsung dipilih untuk melanjutkan.
#img(
  "assets/06-pilihan mau instal atau coba dulu Medium.png",
  caption: "Opsi untuk mencoba atau langsung menginstal Ubuntu."
)

Ubuntu memperkenalkan opsi instalasi interaktif dan otomatis (_scripted_). Instalasi interaktif dipilih untuk mendapatkan kontrol penuh atas setiap langkah dan kustomisasi selama proses.
#img(
  "assets/07-pilihan metode instalasi (interaktif vs scripted, kita pilih yang interaktif) Medium.png",
  caption: "Memilih metode instalasi interaktif."
)

_Installer_ menawarkan dua set aplikasi bawaan. Opsi minimal dipilih untuk menghemat ruang penyimpanan dan mempercepat proses instalasi, dengan pertimbangan aplikasi tambahan dapat diinstal kemudian sesuai kebutuhan.
#img(
  "assets/08-pilihan aplikasi bawaan (minimal vs extended, kita pilih yang minimal atau esensial) Medium.png",
  caption: "Memilih set aplikasi minimal (esensial)."
)

Opsi untuk menginstal perangkat lunak pihak ketiga (_proprietary_) untuk grafis dan WiFi tidak dicentang. Keputusan ini diambil karena sistem target tidak memerlukan _driver_ non-FOSS (seperti NVIDIA) dan untuk menjaga sistem tetap sepenuhnya _open-source_.
#img(
  "assets/09-pilihan proprietary software (di-uncheck, ini khusus buat yang pakai driver non-foss semisal nvidia) Medium.png",
  caption: "Melewati instalasi perangkat lunak proprietary."
)

Tahap krusial ini menentukan bagaimana Ubuntu akan diinstal pada media penyimpanan. Opsi "Erase disk and install Ubuntu" dipilih untuk melakukan instalasi bersih yang akan menghapus seluruh isi disk dan membuat partisi baru secara otomatis.
#img(
  "assets/10-pilihan konfigurasi storage (kita pilih yang instal ulang otomatis, soalnya yang manual nggak bisa waktu praktik) Medium.png",
  caption: "Memilih metode instalasi otomatis dengan menghapus disk."
)

Konfirmasi pemilihan _drive_ fisik (SSD) tempat Ubuntu akan diinstal. Verifikasi _drive_ yang benar sangat penting pada tahap ini untuk menghindari kehilangan data yang tidak diinginkan.
#img(
  "assets/11-pilih lokasi ssd pc Medium.png",
  caption: "Konfirmasi lokasi SSD untuk instalasi."
)

Konfigurasi kredensial pengguna pertama, yang akan memiliki hak akses administratif (_sudo_). Informasi yang dimasukkan mencakup nama, nama komputer (_hostname_), nama pengguna, dan kata sandi.
#img(
  "assets/12-setup akun (username dan password) Medium.png",
  caption: "Pengaturan akun pengguna dan kata sandi."
)

Pemilihan zona waktu (Asia/Jakarta) dilakukan untuk sinkronisasi waktu sistem yang akurat, yang memengaruhi _timestamp file_ dan penjadwalan tugas.
#img(
  "assets/13-pilih timezone (Asia-Jakarta) Medium.png",
  caption: "Memilih zona waktu."
)

Tinjauan akhir dari semua pengaturan yang telah dipilih ditampilkan sebelum proses instalasi dimulai. Ini adalah titik konfirmasi terakhir sebelum perubahan permanen diterapkan pada _drive_.
#img(
  "assets/14-konfirmasi instalasi ubuntu Medium.png",
  caption: "Ringkasan dan konfirmasi akhir instalasi."
)

_Installer_ mulai menyalin _file_ sistem dari media instalasi ke _hard drive_, memformat partisi, dan menginstal _bootloader_ GRUB. Proses ini berjalan secara otomatis.
#img(
  "assets/15-proses instalasi Medium.png",
  caption: "Proses penyalinan file dan instalasi sistem."
)

Notifikasi muncul menandakan bahwa proses instalasi telah berhasil diselesaikan. Sistem kini siap untuk di-_restart_ dan dijalankan dari _hard drive_.
#img(
  "assets/16-instalasi selesai, waktunya restart Medium.png",
  caption: "Instalasi telah selesai."
)

Sistem melakukan _restart_ dengan peringatan untuk mencabut media instalasi (_flashdisk_). Hal ini penting agar komputer tidak kembali melakukan _boot_ dari _installer_.
#img(
  "assets/17-restart ubuntu (ada warning buat nyabut flashdisk-nya) Medium.png",
  caption: "Peringatan untuk mencabut media instalasi saat restart."
)

_Booting_ pertama dari _hard drive_ berhasil dilakukan, menampilkan _desktop environment_ GNOME dari sistem operasi Ubuntu yang baru. Sistem kini sepenuhnya operasional dan siap digunakan.
#img(
  "assets/18-welcome to ubuntu part 2 (setelah berhasil instal di pc) Medium.png",
  caption: "Tampilan desktop Ubuntu setelah instalasi berhasil."
)

#pagebreak()

= Kesimpulan

Praktikum instalasi Ubuntu menggunakan Rufus sebagai tool pembuatan bootable device telah berhasil dilaksanakan dengan sempurna, mencapai seluruh tujuan pembelajaran yang ditetapkan. Melalui praktikum ini, telah dipraktikkan secara langsung proses pembuatan media instalasi bootable menggunakan Rufus, mulai dari pemilihan device, konfigurasi partition scheme yang sesuai dengan sistem target, hingga proses writing ISO ke flashdisk. Setiap tahapan instalasi Ubuntu pada komputer fisik juga telah dilalui dengan pemahaman mendalam, dimulai dari konfigurasi BIOS/UEFI untuk mengubah boot priority, pemilihan metode instalasi interaktif, konfigurasi storage dengan opsi erase and install, hingga setup user account dan konfigurasi timezone.

Pengalaman hands-on ini memberikan pemahaman praktis tentang perbedaan fundamental antara instalasi pada mesin fisik dibandingkan dengan virtual machine yang telah dipelajari pada pertemuan sebelumnya. Instalasi pada hardware fisik memerlukan pertimbangan tambahan seperti kompatibilitas driver, konfigurasi BIOS/UEFI yang berbeda antar manufacturer, dan pentingnya backup data sebelum melakukan instalasi. Keberhasilan instalasi yang ditandai dengan sistem Ubuntu yang berfungsi penuh mengkonfirmasi bahwa pemahaman tentang konsep sistem operasi, bootloader, dan proses booting telah terimplementasi dengan baik.

Keterampilan teknis yang diperoleh dari praktikum ini sangat valuable untuk pengembangan karir di bidang IT, terutama dalam administrasi sistem, DevOps, dan technical support. Kemampuan untuk melakukan instalasi sistem operasi dari scratch, troubleshooting boot issues, dan pemahaman tentang arsitektur sistem komputer modern merupakan fondasi penting untuk pembelajaran lebih lanjut dalam bidang teknologi informasi.

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
