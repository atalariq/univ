# Kuliah

Arsip perkuliahan saya di Program Studi Teknologi Rekayasa Perangkat Lunak,
Sekolah Vokasi, Universitas Gadjah Mada. Isinya catatan kuliah, bahan belajar,
sumber laporan praktikum, dan sebagian kode yang menempel pada laporan.

Repo ini bukan buku teks dan bukan jawaban tugas. Anggap saja buku catatan yang
kebetulan terbuka untuk umum: isinya tidak lengkap, kadang salah, dan sering
berhenti di tengah jalan. Bagian yang belum sempat ditulis saya tandai apa
adanya daripada diisi karangan.

## Struktur

```
semester-1/
  ppk-praktikum-pemrograman-komputer/
    README.md
    00-materials/            materi yang berlaku sepanjang semester
    p01-algoritma-dan-flowchart/
      NOTES.md
    p02-tipe-dan-struktur-data/
      NOTES.md
```

Nama folder mata kuliah memakai pola `<singkatan>-<nama-lengkap>`, misalnya
`ppwl-praktikum-pemrograman-web-lanjut`. Di dalamnya ada satu `README.md` yang
menjelaskan isi mata kuliah dan peta pertemuannya.

Folder pertemuan memakai `pNN-<topik>` dengan nomor dua digit supaya urutannya
tetap benar saat diurutkan berdasarkan nama. Isinya `NOTES.md` dan, kalau ada,
berkas materi dari dosen.

## Cara membaca

Mulai dari `README.md` mata kuliah. Di sana ada tabel pertemuan dengan tiga
status:

- `catatan`: sudah ada tulisan yang bisa dibaca.
- `stub`: foldernya ada, isinya baru penanda belum ditulis.
- `materi saja`: yang tersedia hanya berkas materi, tanpa catatan.

Kalau kamu adik tingkat yang sedang mengambil mata kuliah yang sama, bagian yang
paling berguna biasanya tabel pertemuan dulu, untuk melihat topik apa saja yang
dibahas. Setelah itu baru catatan yang statusnya `catatan`.

Kolom tanggal di tabel pertemuan diberi akhiran `iirc` karena tanggalnya
diperkirakan dari riwayat commit atau tanggal unduh materi, bukan dari jadwal
resmi. Anggap sebagai petunjuk urutan, bukan patokan.

## Yang sengaja tidak ada di sini

Materi dari dosen, soal ujian, dan berkas laporan hasil kompilasi tidak
disertakan. Materi pihak ketiga punya hak cipta pemiliknya, soal ujian bukan
milik saya untuk disebarkan, dan PDF laporan bisa dibuat ulang dari sumbernya.
Berkas seperti itu saya simpan lokal dengan akhiran `.local` dan tidak pernah
masuk repo.

Karena itu, beberapa catatan merujuk berkas yang tidak akan kamu temukan saat
clone repo ini. Rujukan itu saya biarkan supaya saya sendiri masih bisa
menemukan berkasnya di mesin saya.

## Konvensi

- Nama berkas dan folder memakai huruf kecil dan tanda hubung.
- Berkas pribadi atau materi pihak ketiga diberi akhiran `.local` sebelum
  ekstensi, dan sudah diabaikan git.
- Laporan ditulis dengan Typst. Berkas sumbernya masuk repo, hasil PDF-nya
  tidak.
- Berkas di atas 2 MB, PDF, dokumen office, arsip, dan video ditolak oleh
  pemeriksaan sebelum commit.

## Menjalankan perkakas

Repo ini memakai [mise](https://mise.jdx.dev/) untuk menyiapkan perkakas.
Setelah clone:

```bash
mise install
mise run gate     # pasang pemeriksaan pre-commit
```

Perintah yang sering dipakai:

```bash
mise run sessions        # daftar pertemuan per mata kuliah beserta statusnya
mise run links           # periksa tautan relatif di semua catatan
mise run images          # kompres gambar yang baru ditambahkan
mise run new-session     # buat folder pertemuan baru beserta NOTES.md
mise run check           # jalankan semua pemeriksaan
```

## Memakai isi repo ini

Tulisan di sini dilisensikan [CC BY-SA 4.0](LICENSE). Kamu boleh membaca,
menyalin, dan mengubahnya untuk keperluan belajar, asalkan menyebut sumbernya
dan hasil turunannya memakai lisensi yang sama.

Yang perlu kamu ingat: catatan ini ditulis sambil belajar, jadi jangan dipakai
sebagai rujukan tunggal. Kalau ada yang janggal, percayai buku atau dokumentasi
resmi dulu, lalu kabari saya.

## Status

Ada 31 mata kuliah dari semester 1 sampai 3, dengan 194 folder pertemuan. Baru
39 di antaranya yang punya catatan berisi. Semester 4 belum dimulai.

Repo ini juga dipakai bersama agen pemrograman. Aturan kerjanya untuk agen ada
di `AGENTS.md`, dan tiap mata kuliah yang kodenya berada di repo terpisah punya
`AGENTS.md` sendiri yang menyebut lokasinya.
