#set document(title: "Praktikum 12: CRUD dengan Room")
#set page(paper: "a4", margin: (x: 2.2cm, y: 2cm), numbering: "1")
#set text(lang: "id", size: 10pt)
#set par(justify: true, leading: 0.62em)
#show heading.where(level: 1): it => block(above: 1.2em, below: 0.6em)[
  #text(size: 14pt, weight: "bold")[#it.body]
]
#show heading.where(level: 2): it => block(above: 0.9em, below: 0.4em)[
  #text(size: 11.5pt, weight: "bold")[#it.body]
]

#let src(path, lang: "kotlin") = block(
  width: 100%,
  inset: 8pt,
  radius: 3pt,
  fill: luma(246),
  stroke: 0.5pt + luma(210),
)[
  #text(size: 8pt, fill: luma(90))[#path]
  #linebreak()
  #raw(read(path), lang: lang, block: true)
]

// Ubah ke true setelah enam screenshot diisi di assets/.
#let with-shots = false

#align(center)[
  #text(size: 17pt, weight: "bold")[Praktikum 12: CRUD dengan Room]
  #v(0.2em)
  #text(size: 11pt)[Praktikum Pemrograman Perangkat Bergerak Dasar]
  #v(1em)
]

#table(
  columns: (auto, 1fr),
  stroke: none,
  inset: (x: 2pt, y: 3pt),
  [Nama], [Atalariq Barra Hadinugraha],
  [NIM], [25/557554/SV/26192],
  [Kelas], [B2],
  [Repository], [github.com/atalariq/pppbd-p12],
)

= Ringkasan

Tugas pertemuan 12 meminta aplikasi catatan yang menyimpan `id`, `title`, dan
`note`, lengkap dengan form tambah dan edit serta daftar yang menampilkan
keduanya. Aplikasi dibuat dari template Notes kosong, jadi seluruh lapisan data
disusun dari awal memakai Room.

Bagian tersulit bukan menulis kodenya, melainkan memastikan perubahan data
benar-benar mengalir ke UI tanpa pemuatan ulang manual. Karena itu daftar
dibaca sebagai `Flow` dari DAO, diubah menjadi `StateFlow` di ViewModel, lalu
dikoleksi Compose. Dengan pola ini, operasi tambah, edit, dan hapus cukup
menulis ke database, dan `LazyColumn` menggambar ulang sendiri.

= Dasar Teori

== Room dan SQLite

Room adalah lapisan abstraksi di atas SQLite. SQLite menyimpan data dalam berkas
lokal, sedangkan Room memetakan tabel ke class Kotlin dan memeriksa query saat
kompilasi. Kesalahan nama kolom atau tipe data tertangkap saat build, bukan saat
aplikasi berjalan.

== Entity, DAO, dan Database

Entity adalah class yang ditandai `@Entity` dan direpresentasikan sebagai tabel.
DAO adalah antarmuka berisi query dan operasi tulis. Database adalah class
abstrak yang mendaftarkan entity dan menyediakan DAO. Ketiganya dihubungkan oleh
Room lewat generator kode, karena itu proyek memakai plugin KSP.

== Flow, StateFlow, dan Coroutine

`Flow` adalah aliran data yang memancarkan nilai baru setiap sumbernya berubah.
Room dapat mengembalikan `Flow` dari query `SELECT`, sehingga perubahan tabel
otomatis sampai ke pemanggil. `stateIn` mengubahnya menjadi `StateFlow` yang
punya nilai terakhir, cocok untuk Compose. Semua operasi tulis dijalankan dalam
coroutine karena menyentuh disk.

== LazyColumn

`LazyColumn` hanya menyusun item yang terlihat di layar. Untuk daftar catatan
yang jumlahnya bisa bertambah, ini lebih hemat daripada `Column` yang menyusun
semua item sekaligus.

= Implementasi

== Entitas dan DAO

#src("snippets/Note.kt")
#src("snippets/NoteDao.kt")

== Database dan ViewModel

#src("snippets/NoteDatabase.kt")
#src("snippets/NoteViewModel.kt")

== Antarmuka

#src("snippets/NotesScreen.kt")

= Hasil

Build debug berhasil dengan JDK 21 dan Android SDK 37. Keluaran berupa
`app-debug.apk` berukuran sekitar 12 MB. Alur yang berjalan: daftar kosong,
tambah catatan lewat form, catatan muncul di daftar, edit mengubah isi, dan hapus
meminta konfirmasi sebelum menghapus.

#v(0.5em)

#if with-shots [
  #figure(image("assets/01-kosong.png", width: 45%), caption: [Daftar kosong sebelum ada catatan.])
  #figure(image("assets/02-form-tambah.png", width: 45%), caption: [Form tambah catatan terisi.])
  #figure(image("assets/03-daftar.png", width: 45%), caption: [Daftar setelah catatan disimpan.])
  #figure(image("assets/04-form-edit.png", width: 45%), caption: [Form edit memuat data yang sudah ada.])
  #figure(image("assets/05-konfirmasi-hapus.png", width: 45%), caption: [Dialog konfirmasi sebelum menghapus.])
  #figure(image("assets/06-setelah-hapus.png", width: 45%), caption: [Daftar setelah catatan dihapus.])
] else [
  #block(
    width: 100%,
    inset: 12pt,
    radius: 4pt,
    fill: luma(242),
    stroke: 0.5pt + luma(200),
  )[
    Screenshot belum diambil. Enam gambar yang dibutuhkan:
    `assets/01-kosong.png`, `02-form-tambah.png`, `03-daftar.png`,
    `04-form-edit.png`, `05-konfirmasi-hapus.png`, `06-setelah-hapus.png`.
    Setelah diisi, ubah `with-shots` menjadi `true` di berkas ini lalu kompilasi
    ulang.
  ]
]

= Kesimpulan

Room menghilangkan pekerjaan menulis `SQLiteOpenHelper` dan `Cursor` secara
manual, tetapi bukan berarti lapisan data jadi dangkal. Yang tetap harus
diputuskan adalah bentuk entity, query yang dipakai, dan bagaimana perubahan
data sampai ke UI. Pada tugas ini, `Flow` dari DAO ditambah `StateFlow` di
ViewModel menjadi jalur yang paling sedikit kode dan paling sedikit bug, karena
tidak ada tempat di mana UI harus mengingat untuk memuat ulang data.

= Referensi

- Android Developers, "Save data in a local database using Room".
- Android Developers, "StateFlow and SharedFlow".
- Android Developers, "Lazy lists in Compose".
- Dokumentasi Kotlin Coroutines.
