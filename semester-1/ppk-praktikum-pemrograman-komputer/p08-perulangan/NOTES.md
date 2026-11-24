# Pertemuan 8: Perulangan

Bab ini membahas pengulangan dalam Python, dimulai dari `range()` yang dipakai untuk menghasilkan deret angka. Ada tiga bentuk pemakaian: `range(n)` menghasilkan 0 sampai n-1, `range(n, m)` menghasilkan n sampai m-1, dan `range(n, m, k)` menghasilkan deret dengan selisih k (hlm. 1-2). Hasil `range()` sebenarnya bukan list, sehingga perlu dibungkus `list()` bila ingin dilihat sebagai daftar; pengecualiannya saat dipakai langsung dalam `for` (hlm. 1-3).

`for` melakukan pencacahan elemen sebuah list satu per satu dari awal sampai akhir. Bila jumlah iterasi sudah diketahui, `for` dipasangkan dengan `range`, sedangkan `while` dipakai ketika banyaknya pengulangan belum diketahui tetapi syarat berhentinya jelas (hlm. 2-3). Contoh `while` menampilkan bilangan kuadrat sampai nilainya tidak melebihi 80, dan perulangan berhenti ketika pengecekan syarat gagal (hlm. 3-4). Modul juga membahas percabangan di dalam perulangan untuk menghitung banyak angka yang habis dibagi 3 atau 5 antara 0 dan 99 (hlm. 4).

Perulangan bersarang dijelaskan lewat analogi jarum jam: perulangan terdalam, seperti jarum detik, selesai lebih dahulu sebelum perulangan di luarnya bergerak satu langkah (hlm. 4). Contohnya mencetak tiga baris berisi sepuluh karakter pagar, dengan `print()` kosong di akhir setiap baris (hlm. 4-5). Ada pula `break` untuk menghentikan perulangan lebih awal, dan `continue` untuk melewati sisa perintah pada iterasi berjalan lalu lanjut ke iterasi berikutnya (hlm. 5). Praktik menghitung N faktorial dengan `range(1, N+1)` dan variabel penampung yang dimulai dari 1 (hlm. 5-6). Latihan meminta penentuan hari selesai membaca buku dan pencarian pasangan sisi segitiga siku-siku, sedangkan quiz meminta pengecekan bilangan prima serta dua pola gambar persegi dari tanda pagar (hlm. 7-8).

## Poin kunci

- `range()` memiliki tiga bentuk pemanggilan sesuai jumlah argumennya (hlm. 1-2).
- Hasil `range()` perlu dibungkus `list()` bila ingin ditampilkan sebagai list (hlm. 1).
- `for` cocok untuk iterasi yang jumlahnya diketahui, `while` untuk yang bergantung pada syarat berhenti (hlm. 2-3).
- Perulangan bersarang menyelesaikan iterasi terdalam lebih dahulu (hlm. 4).
- `break` menghentikan perulangan, `continue` melompat ke iterasi berikutnya (hlm. 5).
- Faktorial dihitung dengan penampung bernilai awal 1 yang dikalikan pada setiap iterasi (hlm. 5-6).

## Istilah

- iterasi: satu putaran dalam proses pengulangan.
- range: fungsi pembangkit deret angka.
- stopping criteria: syarat yang menentukan kapan perulangan berhenti.
- nested loop: perulangan yang berada di dalam perulangan lain.
- break: perintah untuk menghentikan perulangan.
- continue: perintah untuk melewati sisa blok pada iterasi saat ini.
- faktorial: hasil perkalian bilangan bulat dari 1 sampai N.

## Sumber

- `modul-6-perulangan.local.pdf`, hlm. 1-8
