#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2 TRPL 2025",

  mata-kuliah: "Praktikum Teknologi Informasi dan Instalasi Komputer",
  kode-mata-kuliah: "PTIIK",
  nama-dosen-pengampu: "Imam Fahrurrozi, S.T., M.Cs.",
  no-pertemuan: "8",

  judul-praktikum: "Kloning Harddisk dengan Clonezilla",
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

+ Memahami konsep dan kegunaan kloning disk.
+ Melakukan kloning disk secara langsung (_device-to-device_) menggunakan Clonezilla.
+ Memverifikasi hasil kloning disk pada lingkungan VirtualBox.

= Dasar Teori

Kloning disk adalah proses menyalin seluruh isi dari satu disk keras ke disk keras lainnya. Proses ini menyalin data secara bit-demi-bit. Kloning berbeda dari pencadangan (_backup_) file. Pencadangan file hanya menyalin berkas. Kloning menyalin semua data, termasuk Master Boot Record (MBR), tabel partisi, dan sistem operasi.

Proses ini penting untuk beberapa skenario. Skenario pertama adalah pemulihan sistem (_disaster recovery_). Jika disk utama rusak, disk kloning dapat langsung digunakan sebagai pengganti. Skenario kedua adalah migrasi sistem. Pengguna dapat memindahkan sistem operasi ke disk baru, misalnya dari HDD ke SSD. Skenario ketiga adalah duplikasi massal. Administrator sistem dapat menyiapkan satu komputer (master) lalu mengkloningnya ke banyak komputer lain. @clonezilla

== Clonezilla

Clonezilla adalah sebuah utilitas _open-source_ untuk kloning disk dan _imaging_. Clonezilla didasarkan pada Debian Linux dan mendukung berbagai jenis _file system_, seperti ext4, NTFS, dan HFS+.

Fungsi utamanya adalah untuk pencadangan dan pemulihan. Clonezilla dapat menyimpan _image_ dari sebuah disk ke penyimpanan lain. Clonezilla juga dapat melakukan kloning disk secara langsung, seperti yang dilakukan pada praktikum ini.

Clonezilla memiliki dua mode utama: _Beginner_ dan _Expert_. Mode _Beginner_ menggunakan opsi _default_ yang aman dan umum. Mode _Expert_ memberikan lebih banyak kustomisasi pada proses kloning. Pada praktikum ini, mode _Beginner_ digunakan untuk menyalin disk ke disk lokal.

#pagebreak()

= Hasil dan Pembahasan

== Setup Lingkungan Virtual

Praktikum ini menggunakan Oracle VM VirtualBox. @virtualbox-manual Dua buah disk virtual (VDI) disiapkan. disk pertama (master) berukuran 10 GB. disk ini berisi sistem operasi Windows 7 yang sudah terinstal. disk kedua (target) berukuran 12 GB. disk ini dalam keadaan kosong atau belum terpartisi.

Ukuran disk target harus sama atau lebih besar dari disk master. Ini adalah syarat untuk kloning _device-to-device_ pada Clonezilla.

Sebuah _file_ ISO Clonezilla (misalnya, `clonezilla-live-stable.iso`) diunduh. _File_ ISO ini di-mount ke _drive_ optik virtual pada VM. Urutan _boot_ VM diatur agar memprioritaskan _boot_ dari CD/DVD.

== Menjalankan Kloning dengan Clonezilla

+ VM dijalankan dan melakukan _boot_ dari ISO Clonezilla. Langkah-langkah kloning disk dilakukan mengikuti panduan mode _Beginner_.
+ Proses dimulai dengan memilih bahasa "en_US.UTF-8" dan konfigurasi _keyboard_ "Don't touch keymap". Selanjutnya, "Start Clonezilla" dipilih.
+ Mode kloning yang digunakan adalah `device-device`. Mode ini menyalin data langsung dari satu disk ke disk lain. Opsi `Beginner` dan `disk_to_local_disk` dipilih.
+ disk sumber (master) diidentifikasi sebagai `sda` (10 GB). disk target diidentifikasi sebagai `sdb` (12 GB). Opsi pemeriksaan disk sumber dilewati (`skip checking`) untuk mempercepat proses. Opsi untuk menyalin tabel partisi dari sumber dipilih (`use partition table from source disk`).
+ Proses kloning memerlukan dua kali konfirmasi. Konfirmasi ini penting karena seluruh data pada disk target (`sdb`) akan terhapus.
+ Clonezilla kemudian memulai proses kloning. Proses ini menyalin data blok-demi-blok, termasuk MBR dan tabel partisi. Setelah selesai, muncul notifikasi "Cloning finished". VM kemudian dimatikan.

== Verifikasi Hasil Kloning

Untuk memverifikasi hasil, disk master `sda` dilepas dari VM. VM dikonfigurasi ulang untuk melakukan _boot_ dari disk target `sdb`. Hasilnya, sistem operasi Windows 7 berhasil dijalankan dari disk kloning. Tampilan dan data disk ini identik dengan disk master.

Sebagai pengujian tambahan, perubahan kecil dilakukan pada sistem kloning. _Background desktop_ diubah. Perubahan ini tidak memengaruhi sistem pada disk master. Ini membuktikan bahwa kedua disk adalah entitas terpisah dan proses kloning telah berhasil.

// Daftar Gambar
#align(center)[
  #stack(
    dir: ttb,
    spacing: 1.5em,
    img("assets/1.png", caption: "Booting ke Clonezilla"),
    img("assets/2.png", caption: "Pilih bahasa"),
    img("assets/3.png", caption: "Konfigurasi keyboard layout"),
    img("assets/4.png", caption: "Start Clonezilla"),
    img("assets/5.png", caption: "Pilih device-device"),
    img("assets/6.png", caption: "Pilih Beginner (opsi default)"),
    img("assets/7.png", caption: "Pilih disk_to_local_disk"),
    img("assets/8.png", caption: "Pilih disk yang akan dikloning (source)"),
    img("assets/9.png", caption: "Pilih disk target"),
    img("assets/10.png", caption: "Pilih skip checking (opsi default)"),
    img("assets/11.png", caption: "Pilih partition table from the source disk"),
    img("assets/12.png", caption: "Pilih copy log files (opsi default)"),
    img("assets/13.png", caption: "Pilih 'choose' saat instalasi selesai"),
    img("assets/14.png", caption: "Konfirmasi untuk melanjutkan proses cloning (1)"),
    img("assets/15.png", caption: "Konfirmasi untuk melanjutkan proses cloning (2)"),
    img("assets/16.png", caption: "Proses cloning (1)"),
    img("assets/17.png", caption: "Proses cloning (2)"),
    img("assets/18.png", caption: "Proses cloning (3)"),
    img("assets/19.png", caption: "Proses cloning (4)"),
    img("assets/20.png", caption: "Proses cloning (5)"),
    img("assets/21.png", caption: "Cloning selesai"),
    img("assets/master.png", caption: "Tampilan disk Master (Windows 7)"),
    img("assets/cloned_before_change_bg.png", caption: "Hasil kloning (sebelum diubah)"),
    img("assets/cloned_after_change_bg.png", caption: "Hasil kloning (setelah diubah)"),
    img("assets/virtualbox.png", caption: "Konfigurasi VM dengan disk Master (10GB)"),
    img("assets/virtual_media_manager.png", caption: "Virtual Media Manager (Master 10GB dan Target 12GB)"),
  )
]

#pagebreak()

= Kesimpulan

Praktikum ini berhasil mendemonstrasikan proses kloning disk. Kloning dilakukan dari disk master 10 GB ke disk target 12 GB menggunakan Clonezilla di VirtualBox.

Clonezilla mode `device–device` terbukti efektif untuk duplikasi sistem operasi. disk hasil kloning dapat melakukan _boot_ Windows 7 dan beroperasi normal, identik dengan disk sumber.

Persyaratan utama agar proses berhasil adalah disk target harus memiliki ukuran yang sama atau lebih besar dari disk sumber.

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
