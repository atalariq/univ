# Pertemuan 1: Pengantar

Folder ini tidak menyimpan modul atau slide pengantar. Isinya tiga latihan Java di `src/`, masing-masing satu berkas `latihan1.java` sampai `latihan3.java` dengan kelas `Main`, method `main`, dan satu method statis pembantu.

`latihan1.java` mendeklarasikan tiga variabel int (panjang, lebar, tinggi), memanggil `HitungVolumeBalok`, lalu mencetak hasilnya. Method itu mengembalikan hasil kali ketiga parameter (baris 3-14).

`latihan2.java` menghitung luas segitiga. Alas dan tinggi disimpan sebagai int, method `HitungLuasSegitiga` mengembalikan double dari (alas * tinggi) / 2, dan hasilnya dicetak (baris 3-10).

`latihan3.java` mengonversi gallon ke liter dengan faktor 3.7854. Method `konversi` menerima int dan mengembalikan double, sehingga hasilnya tidak dibulatkan (baris 3-9).

Ketiga berkas memakai pola yang sama: nilai masukan ditulis sebagai variabel lokal di `main`, perhitungan dipindah ke method statis, dan keluaran dicetak dengan `System.out.println`. Latihan ini melatih deklarasi variabel beserta tipe datanya, pemanggilan method dengan argumen, nilai kembalian bertipe int atau double, serta penggabungan teks dan nilai pada `println`. Karena tidak ada berkas lain di folder ini, tidak ada bahan tertulis untuk bagian teori pengantar.

## Poin kunci

- Folder berisi tiga latihan: volume balok, luas segitiga, dan konversi gallon ke liter.
- Semua perhitungan berada di method statis yang dipanggil dari `main` (baris 7 dan 12-14 pada `latihan1.java`).
- Tipe kembalian dibedakan: int untuk volume, double untuk luas dan konversi.
- Masukan ditulis sebagai variabel lokal, bukan dibaca dari pengguna.
- Tidak ada modul atau slide di folder ini.

## Istilah

- class: wadah yang memuat method dan data
- method: blok kode yang dapat dipanggil
- static: method yang dapat dipanggil tanpa membuat objek
- parameter: nilai yang diterima method saat dipanggil
- return type: tipe nilai yang dikembalikan method
- variabel lokal: variabel yang dideklarasikan di dalam method

## Sumber

- `src/Latihan1/latihan1.java`, baris 1-16
- `src/Latihan2/latihan2.java`, baris 1-12
- `src/Latihan3/latihan3.java`, baris 1-11
