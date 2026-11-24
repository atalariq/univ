# Pertemuan 1: Pretest

Folder ini tidak menyimpan modul atau slide, hanya `main.py` yang berisi jawaban empat soal pretest beserta blok `main()` untuk mencetak hasilnya. Catatan ini merangkum soal dan pendekatan yang dipakai di berkas tersebut.

Soal 1 meminta faktorial dengan for loop. Fungsi `fac(n)` mengalikan bilangan 1 sampai n lalu mengembalikan hasilnya, dan nilainya dicetak untuk n = 1 sampai 4 (baris 4-8, 55-56).

Soal 2 berjudul "Even Or Odd", tetapi fungsi `pos_neg(n)` sebenarnya menjumlahkan digit angka: nilai negatif langsung menghasilkan 0, sedangkan nilai lain dipecah dengan `% 10` dan `// 10` sampai habis (baris 12-20). Berkas mengujinya dengan -10, 0, 123, 149, 666, dan 777 (baris 59).

Soal 3 meminta Fibonacci dengan dua nilai awal bebas. `new_fib(n, a, b)` menyiapkan list berisi a dan b, lalu menambahkan hasil jumlah dua elemen terakhir sampai panjang list mencapai n (baris 24-28). Berkas menguji tiga pasangan awal, yaitu (1, 1), (2, 3), dan (12, 13) (baris 63-75).

Soal 4 menghitung gaji karyawan. `count_salary` memetakan tipe A sampai D ke tarif per jam 4000 sampai 7000, menghitung jam lembur sebagai jam kerja di atas 48, dan membayar lembur 3000 per jam (baris 32-50). Dua kasus diuji: Anis tipe A dengan 72 jam menghasilkan 264000, sedangkan Budi tipe D dengan 64 jam menghasilkan 384000 (baris 79-83).

Secara keseluruhan setiap soal dikerjakan sebagai satu fungsi terpisah, lalu dipanggil dari `main()` yang dijaga oleh `if __name__ == "__main__"` (baris 86-87). Pola ini memisahkan definisi fungsi dari pengujian dan memudahkan pengecekan keluaran tiap soal secara berurutan.

## Poin kunci

- Pretest berisi empat soal: faktorial, jumlah digit, Fibonacci dengan nilai awal bebas, dan gaji dengan lembur.
- Setiap soal dikerjakan sebagai fungsi terpisah dan diuji dari `main()`.
- Lembur hanya dihitung untuk jam kerja di atas 48, dengan tarif tetap 3000 per jam (baris 43-48).
- Fibonacci menerima dua nilai awal sebagai parameter, bukan hanya 0 dan 1 (baris 24-28).
- Nama fungsi `pos_neg` tidak sesuai perilakunya, yaitu menjumlahkan digit (baris 12-20).

## Istilah

- faktorial: hasil kali bilangan bulat 1 sampai n
- Fibonacci: barisan yang tiap sukunya adalah jumlah dua suku sebelumnya
- parameter: nilai yang diterima fungsi saat dipanggil
- return value: nilai yang dikembalikan fungsi
- lembur: jam kerja di luar 48 jam per pekan pada soal ini

## Sumber

- `main.py`, baris 4-87
