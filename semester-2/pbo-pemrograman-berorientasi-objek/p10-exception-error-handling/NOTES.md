# Pertemuan 10: Exception dan error handling

Materi membuka dengan pernyataan bahwa kesalahan tidak dapat dihindari selama pemrograman, lalu membaginya menjadi dua jenis: kesalahan saat kompilasi dan kesalahan saat program berjalan (hlm. 2). Kesalahan kompilasi mudah dideteksi karena compiler menunjukkan nomor baris dan deskripsi singkatnya (hlm. 4). Contoh pada hlm. 3 adalah pemanggilan method yang tidak diakhiri tanda titik koma. Meski mudah, materi mengakui jenis ini kadang sulit ditemukan dengan mata telanjang (hlm. 6).

Kesalahan saat eksekusi dinilai lebih menantang karena program berhasil dikompilasi tetapi menghasilkan hasil yang salah atau berhenti sebelum waktunya (hlm. 7). Di konsol muncul teks berwarna merah yang menandakan adanya exception di dalam main thread, dan jenis kesalahan ini harus ditangani programmer (hlm. 8). Exception didefinisikan sebagai peristiwa yang mengganggu jalannya program, dapat menjadi indikasi ada sesuatu yang salah, dan dapat terjadi otomatis maupun dilempar secara eksplisit ketika kondisi tertentu terpenuhi (hlm. 9).

Tiga jenis exception yang dibahas adalah NullPointerException, yang muncul saat program mengakses objek yang belum ada (hlm. 11), ArithmeticException, yang muncul pada kesalahan operasi aritmetika (hlm. 13), dan IndexOutOfBoundsException, yang muncul saat mengakses elemen di luar batas array (hlm. 15). Selain exception, ada Error yang teridentifikasi saat runtime, mewakili kesalahan yang tidak dapat dipulihkan, dan terutama terjadi karena kurangnya sumber daya sistem (hlm. 17). Contohnya StackOverflowError, OutOfMemoryError, kesalahan mesin virtual, AssertionError, dan kesalahan penautan (hlm. 18-19). Tabel pada hlm. 20 merangkum perbedaannya: Error adalah masalah serius di luar kendali program yang biasanya membuat program macet, sedangkan exception adalah masalah logika atau input yang dapat ditangkap dan ditangani.

Penanganannya memakai blok try/catch. Blok try membungkus kode yang rentan, blok catch menyatakan exception yang mungkin terjadi beserta tindakan lanjutannya, sehingga program tidak rusak (hlm. 22-28). Blok finally bersifat opsional dan dipakai memastikan program tetap berjalan sampai akhir. Materi juga menjelaskan hierarki exception dengan Throwable sebagai induk Error dan Exception (hlm. 30-31). Checked exception terdeteksi compiler dan wajib ditangani, misalnya FileNotFoundException, ObjectStreamException, dan ClassNotFoundException, sedangkan unchecked exception adalah runtime exception yang tidak diperiksa compiler. Bagian akhir mengajarkan pembuatan exception sendiri dengan mewarisi Throwable, melemparnya memakai throw dan throws, lalu menanganinya dengan try/catch karena compiler akan menuntutnya (hlm. 34-38).

## Poin kunci

- Kesalahan dibagi menjadi compile-time error dan runtime error (hlm. 2).
- Runtime error lolos kompilasi tetapi menghasilkan hasil salah atau berhenti mendadak (hlm. 7).
- NullPointer, Arithmetic, dan IndexOutOfBounds termasuk exception yang sering muncul (hlm. 11-15).
- Error tidak dapat dipulihkan dan biasanya disebabkan sumber daya sistem (hlm. 17-19).
- Blok try membungkus kode rentan, catch menangani exception, finally memastikan kelanjutan proses (hlm. 22-28).
- Throwable adalah induk dari Error dan Exception (hlm. 31).
- Checked exception wajib ditangani, unchecked tidak diperiksa compiler (hlm. 31).

## Istilah

- compile-time error: kesalahan yang terdeteksi saat kompilasi.
- runtime error: kesalahan yang baru muncul saat program dijalankan.
- exception: peristiwa yang mengganggu jalannya program.
- Error: kesalahan serius yang tidak dapat dipulihkan.
- try, catch, finally: blok untuk mencoba kode, menangani exception, dan menjalankan kode penutup.
- Throwable: kelas induk dari Error dan Exception.
- checked exception: exception yang diperiksa compiler dan wajib ditangani.
- unchecked exception: runtime exception yang tidak diperiksa compiler.
- throw dan throws: kata kunci untuk melempar exception dan menyatakan exception pada deklarasi method.
- custom exception: kelas exception buatan sendiri.

## Sumber

- `2026-05-xx-exception-error-handling.local.pdf`, hlm. 2-16 (jenis kesalahan dan exception umum)
- `2026-05-xx-exception-error-handling.local.pdf`, hlm. 17-20 (error dan perbandingannya)
- `2026-05-xx-exception-error-handling.local.pdf`, hlm. 22-31 (try, catch, finally, hierarki)
- `2026-05-xx-exception-error-handling.local.pdf`, hlm. 32-38 (checked exception dan custom exception)
