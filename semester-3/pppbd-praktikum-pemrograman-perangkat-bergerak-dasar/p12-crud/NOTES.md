# Pertemuan 12: CRUD dengan Room

Ringkasan tugas: mengubah aplikasi catatan dari praktikum sebelumnya menjadi
CRUD penuh dengan penyimpanan Room. Data yang disimpan adalah `id`, `title`, dan
`note`, dengan form tambah dan edit, lalu daftar yang menampilkan keduanya.

## Yang dibangun

Entitas `Note` memakai anotasi `@Entity` dengan `@PrimaryKey(autoGenerate = true)`
sehingga SQLite mengisi `id` sendiri. Kolomnya hanya `title` dan `note`, sesuai
kebutuhan tugas.

`NoteDao` memakai `@Dao` dengan empat operasi: `observeAll()` mengembalikan
`Flow<List<Note>>` dari query `SELECT * FROM notes ORDER BY id DESC`, lalu
`insert`, `update`, dan `delete` yang semuanya `suspend`. Karena memakai `Flow`,
daftar ikut berubah tanpa perlu memuat ulang manual.

`NoteDatabase` mengekstensi `RoomDatabase`, mendaftarkan entitas `Note`, dan
menyediakan singleton lewat pola double-checked locking supaya koneksi SQLite
tidak dibuka berkali-kali.

`NoteViewModel` menyimpan `StateFlow<List<Note>>` hasil `stateIn` dari Flow DAO.
Operasi simpan dan hapus dijalankan di `viewModelScope` memakai coroutine,
sehingga UI tidak menunggu I/O database.

`NotesScreen` menyusun `Scaffold` dengan `LazyColumn` untuk daftar, `Card` per
catatan, dan `FloatingActionButton` untuk menambah. Form tambah dan edit memakai
`AlertDialog` yang sama, dibedakan dari ada tidaknya objek yang sedang diedit.
Tombol hapus memunculkan dialog konfirmasi sebelum benar-benar menghapus.

## Alur data

Tombol pada UI memanggil ViewModel. ViewModel menjalankan coroutine yang memanggil
DAO. DAO menulis ke SQLite lewat Room. Room mengubah isi tabel, lalu query
`observeAll()` memancarkan daftar baru, `Flow` meneruskannya ke ViewModel,
`StateFlow` meneruskannya ke Compose, dan `LazyColumn` menggambar ulang. Tidak ada
satu pun bagian UI yang membaca database secara langsung.

## Berkas kunci

- `data/Note.kt`: entitas dan kolomnya.
- `data/NoteDao.kt`: query dan operasi tulis.
- `data/NoteDatabase.kt`: pendaftaran entitas dan singleton.
- `ui/NoteViewModel.kt`: `StateFlow`, coroutine, dan operasi simpan serta hapus.
- `ui/NotesScreen.kt`: daftar, form, dan dialog konfirmasi.
- `app/build.gradle.kts`: plugin KSP dan dependensi Room.

## Catatan pengerjaan

Kode ditulis di repo terpisah, `~/AndroidStudioProjects/pppbd-p12-notes`, mengikuti
konvensi yang tercatat di `AGENTS.md` mata kuliah ini. Build debug berhasil dengan
JDK 21 dan Android SDK 37. Screenshot aplikasi belum diambil karena emulator di
mesin ini tidak bisa merender Compose secara headless; pengambilan screenshot
dilakukan dari Android Studio.

## Istilah

- Room: lapisan abstraksi di atas SQLite yang memetakan tabel ke class.
- Entity: class yang direpresentasikan sebagai tabel.
- DAO: antarmuka berisi query dan operasi tulis.
- Flow: aliran data yang memancarkan nilai baru saat sumbernya berubah.
- stateIn: mengubah Flow menjadi StateFlow dengan nilai awal.
- Coroutine: mekanisme konkurensi untuk pekerjaan yang menunggu I/O.
