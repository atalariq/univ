#import "@local/report:1.0.0": *

#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Struktur Data",
  course-code: "PSD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "5",
  title: "Implementasi Queue pada Sistem Drive-Thru",
  use-cover: false,
  bib: bibliography("references.bib"),
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
)

#set par(justify: true)
// #set par(first-line-indent: (amount: 0.5in, all: true))

// #daftar-isi()
//
// = Tujuan Praktikum
//
// + Memahami konsep struktur data Queue (FIFO — First-In, First-Out) sebagai Abstract Data Type.
// + Mengimplementasikan operasi dasar Queue: is_empty, is_full, enqueue, dequeue, peek, dan display.
// + Menerapkan batasan kapasitas (bounded queue) dengan batas maksimal 5 kendaraan pada konteks Drive-Thru.
// + Menyimulasikan sistem antrean Drive-Thru dengan skenario operasional nyata menggunakan prinsip FIFO.
//
= Dasar Teori

== Abstract Data Type (ADT)

_Abstract Data Type_ (ADT) adalah model matematis untuk suatu tipe data yang didefinisikan melalui perilakunya dari sudut pandang pengguna, bukan melalui detail implementasinya @cormen2022. ADT memisahkan antara antarmuka (operasi apa yang tersedia dan semantiknya) dengan implementasi (bagaimana operasi itu dijalankan di memori), sehingga memungkinkan penggantian implementasi tanpa memengaruhi kode yang bergantung padanya @aho1983.

Dalam konteks struktur data, Queue adalah salah satu ADT paling fundamental yang mendefinisikan pola akses data berbasis urutan masuk: elemen yang pertama masuk adalah yang pertama keluar.

== Queue sebagai ADT

Queue adalah ADT yang mengikuti disiplin akses _First In, First Out_ (FIFO): elemen yang pertama kali dimasukkan adalah yang pertama kali dikeluarkan @cormen2022. Prinsip ini mencerminkan perilaku antrean nyata, di mana pelanggan yang datang lebih dahulu akan dilayani lebih dahulu.

Operasi-operasi yang didefinisikan oleh ADT Queue adalah:

/ Enqueue: Menyisipkan elemen baru ke bagian belakang (_rear_) Queue.
/ Dequeue: Menghapus dan mengembalikan elemen dari bagian depan (_front_) Queue.
/ Front / Peek: Mengakses elemen di bagian depan tanpa menghapusnya.
/ isEmpty: Memeriksa apakah Queue tidak memiliki elemen.
/ isFull: Memeriksa apakah Queue telah mencapai kapasitas maksimum.

Berbeda dengan Stack yang hanya membutuhkan satu titik akses (_top_), Queue memerlukan dua pointer: satu ke ujung depan (_front_) untuk operasi Dequeue dan Peek, dan satu ke ujung belakang (_rear_) untuk operasi Enqueue @sedgewick2011. Kedua pointer bergerak maju secara independen seiring operasi yang dilakukan.

// == Bounded Queue
//
// _Bounded Queue_ atau Queue bercapacitas adalah variant Queue yang memiliki batasan maksimum jumlah elemen yang dapat ditampung. Konsep ini sangat relevan untuk sistem nyata seperti Drive-Thru, di mana keterbatasan lahan mensyaratkan pembatasan jumlah kendaraan yang dapat menunggu secara bersamaan.
//
// Ada dua pendekatan utama untuk mengimplementasikan bounded Queue:
//
// + Menggunakan array dengan dua pointer (circular buffer): front dan rear bergerak melingkar dalam array berukuran tetap. Keunggulan utama adalah penggunaan memori yang prediktabel.
// + Menggunakan dynamic structure (list/linked list) dengan pemeriksaan kapasitas manual: lebih fleksibel tetapi memerlukan pengecekan eksplisit sebelum enqueue.
//
// Untuk praktikum ini, pendekatan kedua dipilih dengan menggunakan Python list dan pemeriksaan kapasitas eksplisit pada setiap operasi enqueue.
//
== Python List sebagai Basis Implementasi

Python list adalah array dinamis yang mendukung penyisipan di akhir dalam waktu amortized O(1). Karakteristik ini menjadikannya pilihan praktis untuk implementasi Queue sederhana karena operasi append (enqueue) berjalan efisien tanpa perlu pengelolaan memori manual.

Namun, perlu diperhatikan bahwa operasi dequeue pada Python list bersifat O(n) karena memerlukan pergeseran semua elemen setelah elemen terdepan dihapus. Untuk use case dengan volume data sedang (dalam praktikum ini maksimal 5 elemen), overhead ini dapat diterima karena konstan dan tidak signifikan.


= Hasil dan Pembahasan

== Implementasi DriveThruItem

Komponen dasar dari sistem adalah kelas `DriveThruItem` yang merepresentasikan satu unit kendaraan dalam antrean. Setiap item menyimpan dua atribut: plat nomor kendaraan dan pesanan yang diproses.

#let source-code = ```py
class DriveThruItem:
    def __init__(self, plat_nomor, pesanan):
        self.plat_nomor = plat_nomor
        self.pesanan = pesanan

    def __str__(self):
        return f"Plat: {self.plat_nomor}. Pesanan: {self.pesanan}"

class DriveThruQueue:
    #? Constructor
    def __init__(self) -> None:
        self.antrean = list()

    #? IsEmpty
    def is_empty(self):
        return len(self.antrean) == 0

    #? IsFull
    def is_full(self):
        ANTRIAN_MAX = 5
        return len(self.antrean) == ANTRIAN_MAX

    #? Enqueue
    def tambah(self, plat_nomor, pesanan):
        if self.is_full():
            print("> Mohon maaf, jalur Drive-Thru penuh. Silakan parkir di dalam.")
            return
        new_antrean = DriveThruItem(plat_nomor, pesanan)
        print(f"+ Kendaraaan plat {new_antrean.plat_nomor} masuk antrean!")
        self.antrean.append(new_antrean)

    #? Dequeue
    def layani(self):
        if self.is_empty():
            print("> Tidak ada kendaraan di antrean.")
            return
        first = self.antrean[0]
        print(f"- Kendaraaan plat {first.plat_nomor} telah dilayani!")
        self.antrean = self.antrean[1:]

    #? Front
    def cek(self):
        if self.is_empty():
            print("> Tidak ada kendaraan di antrean.")
            return
        first = self.antrean[0]
        print("(i) Antrean pertama -> ", first)

    #? Display
    def tampilkan(self):
        if self.is_empty():
            print("> Tidak ada kendaraan di antrean.")

        print("Kendaraan dalam antrean saat ini:")
        for i in range(len(self.antrean)):
            print("*)", self.antrean[i])

if __name__ == "__main__":
    antrean = DriveThruQueue()
    antrean.tambah('AB 1234 CD', 'Es Teh 1x')
    antrean.tambah('AD 1964 SL', 'Martabak 1x')
    antrean.cek()

    antrean.tambah('AE 1358 GG', 'Ayam Crispy 1x')
    antrean.tambah('AA 2345 JG', 'Steak 1x')
    antrean.tambah('H 9999 AI', 'Es Jeruk 1x')

    antrean.tambah('B 6666 SK', 'Siomay 1x')
    antrean.tampilkan()

    antrean.cek()
    antrean.layani()
    antrean.cek()

    antrean.tambah('B 6666 SK', 'Siomay 1x')
    antrean.tampilkan()
```

#code(
  header: [drive_thru.py (baris 5-11)],
  line-range: (1, 7),
  indentation: 4,
  source-code,
)

Metode `__str__` memungkinkan pencetakan langsung objek dengan format yang mudah dibaca, seperti terlihat pada output `Plat: AB 1234 CD. Pesanan: Es Teh 1x`.

== Implementasi DriveThruQueue

Kelas `DriveThruQueue` mengimplementasikan Queue lengkap dengan semua operasi wajib. Berikut implementasikan konstruktor dan operasi pemeriksaan kondisi:

#code(
  header: [drive_thru.py],
  line-range: (9, 21),
  indentation: 4,
  source-code,
)

Konstanta `ANTRIAN_MAX = 5` hardcoded di dalam metode `is_full()` menetapkan batas maksimal kapasitas antrean. Pemeriksaan kondisi menggunakan `len()` yang mengembalikan jumlah elemen dalam list.

== Operasi Enqueue (tambah)

Operasi `tambah()` menyisipkan kendaraan baru ke bagian belakang antrean dengan pemeriksaan kapasitas terlebih dahulu:

#code(
  header: [drive_thru.py],
  line-range: (24, 30),
  indentation: 4,
  source-code,
)

Jika antrean sudah penuh (5 kendaraan), program menolak input dan mencetak pesan penolakan. Sebaliknya, kendaraan baru ditambahkan ke akhir list menggunakan metode `append()` yang berjalan dalam waktu amortized O(1).

== Operasi Dequeue (layani)

Operasi `layani()` mengeluarkan kendaraan di posisi terdepan untuk diproses:

#code(
  header: [drive_thru.py],
  line-range: (33, 39),
  indentation: 4,
  source-code,
)

Pemeriksaan `is_empty()` dilakukan terlebih dahulu untuk menangani kasus antrean kosong. Elemen terdepan diakses melalui indeks 0, kemudian list dibangun ulang tanpa elemen pertama menggunakan slicing `self.antrean[1:]`. Operasi ini berjalan dalam O(n) karena memerlukan alokasi memori baru untuk list hasil slicing.

== Operasi Peek (cek)

Operasi `cek()` menampilkan kendaraan di posisi terdepan tanpa mengeluarkannya dari antrean:

#code(
  header: [drive_thru.py],
  line-range: (42, 47),
  indentation: 4,
  source-code,
)

Sama seperti `layani()`, elemen diakses melalui indeks 0 tetapi struktur antrean tetap utuh setelah operasi.

== Operasi Display (tampilkan)

Operasi `tampilkan()` menampilkan seluruh kendaraan dalam antrean:

#code(
  header: [drive_thru.py],
  line-range: (50, 56),
  indentation: 4,
  source-code,
)

Iterasi menggunakan `range(len(self.antrean))` untuk mengakses setiap elemen berdasarkan indeks. Penggunaan `__str__` pada `DriveThruItem` memastikan output setiap kendaraan tercetak dengan format yang benar.

#pagebreak()

== Hasil Program

Bagian ini mendemonstrasikan fungsi lengkap sistem dengan menjalankan serangkaian operasi sesuai skenario Drive-Thru nyata:

#code(
  header: [Eksekusi],
  line-range: (58, 77),
  indentation: 4,
  source-code
)

#align(center, image("assets/output-drive_thru.png", width: 17cm))

Dari output dapat diamati beberapa hal penting:

+ *FIFO terpelihara*: Kendaraan `AB 1234 CD` yang masuk pertama adalah yang pertama dilayani, dan kendaraan `B 6666 SK` yang masuk setelah dequeuing menempati posisi terakhir.
+ *Batas kapasitas berfungsi*: Setelah 5 kendaraan (AB, AD, AE, AA, H) memasuki antrean, kendaraan B 6666 SK ditolak dengan pesan yang sesuai.
+ *Urutan tetap terjaga*: Setelah `layani()` mengeluarkan kendaraan terdepan, urutan kendaraan yang tersisa tidak berubah (AD, AE, AA, H).

== Analisis Kompleksitas

#tbl(
  caption: "Kompleksitas Waktu Operasi DriveThruQueue",
  columns: (1fr, auto, auto),
  [*Operasi*], [*Waktu*], [*Ruang*],
  [is_empty], [$O(1)$], [$O(1)$],
  [is_full], [$O(1)$], [$O(1)$],
  [tambah (Enqueue)], [$O(1)$], [$O(1)$],
  [layani (Dequeue)], [$O(n)$], [$O(n)$],
  [cek (Peek)], [$O(1)$], [$O(1)$],
  [tampilkan (Display)], [$O(n)$], [$O(1)$],
)

Analisis menunjukkan bahwa operasi `is_empty()`, `is_full()`, `tambah()`, dan `cek()` semuanya berjalan dalam waktu konstan O(1) karena hanya melakukan pemeriksaan atau akses langsung tanpa iterasi.

Operasi `layani()` berjalan dalam O(n) karena memerlukan pembuatan list baru melalui slicing untuk menghapus elemen terdepan. Untuk bounded queue dengan kapasitas kecil seperti dalam praktikum ini (maksimal 5 elemen), overhead ini tidak signifikan.

Operasi `tampilkan()` berjalan dalam O(n) karena memerlukan iterasi melalui seluruh elemen untuk mencetaknya. Kompleksitas ini optimal karena setiap elemen harus diproses untuk ditampilkan.


= Kesimpulan

Berdasarkan hasil implementasi dan analisis pada praktikum ini, dapat ditarik kesimpulan sebagai berikut:

+ Queue sebagai ADT FIFO berhasil diimplementasikan menggunakan Python list dengan prinsip urutan masuk-keluar yang terpelihara, di mana kendaraan pertama yang masuk (AB 1234 CD) adalah yang pertama dilayani.
+ Operasi dasar Queue (is_empty, is_full, enqueue, dequeue, peek, display) telah diimplementasikan dengan benar, masing-masing dengan penanganan kondisi khusus (antrean kosong atau penuh) sesuai spesifikasi.
+ Bounded queue dengan kapasitas maksimal 5 kendaraan telah diterapkan pada operasi enqueue, di mana kendaraan keenam ditolak dengan pesan "Mohon maaf, jalur Drive-Thru penuh. Silakan parkir di dalam."
+ Analisis kompleksitas menunjukkan bahwa sebagian besar operasi berjalan dalam O(1), kecuali dequeue dan display yang memerlukan O(n) karena karakteristik Python list. Untuk use case Drive-Thru dengan kapasitas terbatas, kinerja ini sudah memadai.
+ Sistem antrean Drive-Thru yang disimulasikan mendemonstrasikan penerapan nyata konsep FIFO dalam konteks pemrosesan transaksi secara berurutan, di mana pelanggan menunggu dalam antrean dan dilayani berdasarkan urutan kedatangannya.

= Source Code Lengkap (Lampiran)

#code(
  header: [drive_thru.py],
  indentation: 4,
  source-code
)

