# Catatan penyusunan laprak P8

## Kompilasi

Gunakan Typst 0.15.1 atau lebih baru, dengan font Arial dan Fira Code:

```sh
typst compile report.typ report.pdf
```

`lab-report.typ` merupakan salinan utuh template 3.0.0 dari `meta/template/report-typst`. Kode yang dibaca laporan berada di `snippets/`, sehingga kompilasi tidak memerlukan symlink `code.local`, clone Android di lokasi tertentu, maupun package Typst pribadi. `report.pdf` adalah hasil lokal yang diabaikan Git sesuai kebijakan repositori.

## Asal kode

Snapshot di `snippets/` diambil tanpa perubahan dari repository https://github.com/atalariq/pppbd-p8 pada commit `f2ce2a1d6ce6f265acd44db366b14c69d678d53f`. `snippets/manifest.json` memuat hash SHA-256 setiap file. Snapshot ini adalah bahan kutipan laporan, bukan project Android lengkap untuk dibuild. Gunakan repository MyShop untuk menjalankan aplikasi.

Potongan tahap perantara disusun mengikuti urutan modul. Riwayat repository hanya memuat project awal (`46b05cc`) dan implementasi praktikum (`f2ce2a1`); tidak ada klaim satu commit untuk setiap tahap.

## Gambar

Semua PNG di `assets/` diekstrak dari gambar yang tertanam dalam modul, tanpa mengubah berkas PDF sumber. Nama file menunjukkan kegunaannya. Pemetaan halaman: graph awal 3, Home 8, Checkout kosong 11, argumen produk 12, graph Address 15, spinner Address 17, pilihan Bengkulu di Address dan hasilnya di Checkout 19. Modul tidak menyediakan gambar terpisah untuk Home setelah tombol Selesai di Checkout ditekan. Caption dalam PDF menyebut sumber dan halaman. Tidak ada gambar yang diklaim sebagai hasil pengujian ulang aplikasi.

## Keputusan penyusunan

- Urutan langkah mengikuti modul, kemudian lima jawaban penugasan.
- Versi dependency mengikuti source repository, bukan diubah agar sama dengan versi lama modul.
- Kekeliruan nama resource/action dalam modul dilengkapi di instruksi agar konsisten dengan source.
- Source MyShop dipertahankan, termasuk keterbatasan lifecycle binding pada Home dan Checkout.
- Gaya bahasa mengikuti instruksi pengguna dan acuan laprak P6: instruksi langsung, hasil per langkah, penjelasan singkat yang terkait kode.
