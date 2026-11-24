# Quiz

Di suruh bikin:
1. Use case
2. Use case scnenarion/description (3 buah)
   Masing" wajib memiliki atleast 1 alternative flow
3. Berdasarkan poin 2, pilih 2 untuk dijadikan activity diagram, dengan minimal 2 swim lane.

Nanti di upload di e-Lok


## Case Study

Rumah Sakit Lekas Sembuh -> Sistem Informasi
-> Dokumentasi aktifitas sejak pasien masuk hingga pulang

```
Mulai
-> Pasien disambut CS
-> CS cek reservasi -> (tidak tersedia) buat reservasi

NOTE:  Reservasi terdiri dari nama pasien, nama doketer, dan waktu periksa (range 1jam).

Lanjut
-> Pasien menunggu di ruang tunggu -> waktu periksa perawat akan memanggil pasien sesuai urutan waktu kedatangan pasien
-> Perawat cek suhu dan tekanan darah -> simpan sebagai preliminary examination
-> pasien masuk ruang periksa dan kosul ke doketr
-> doker cek histori pemeriksaan, termasuk histori obat dan diagnosa (rekam medis)
-> masukkan diagnosa dan obat berdasarakan hasil periksa
-> data pasien masuk farmasi
-> menyiapkan obat (sampai siap)
-> panggil pasien
-> menyerahkan obat
-> pasien konfirmasi penerimaan
-> pulang
-> Selesai
```

## Analisis

Actor:
- Pasien
- CS
- Perawat
- Dokter
- Farmasi
