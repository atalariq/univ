#set page(paper: "a4", margin: (x: 2cm, y: 2cm))
#set text(font: "Times New Roman", size: 11pt)

#set enum(numbering: "a)")
#set table(align: center + horizon)
#show table.cell.where(y: 0): set text(weight: "bold")
#show table.cell.where(x: 0): set text(weight: "bold")

= Bagian 1: Dynamic Programming

== Soal 1: Distribusi Barang Antar Gudang
Sebuah perusahaan ekspedisi memiliki 5 gudang yang diberi label A, B, C, D, dan E. Sebuah truk harus berangkat dari gudang A, mengunjungi setiap gudang tepat satu kali, kemudian kembali ke gudang A.
Matriks jarak antar gudang (dalam km) diberikan sebagai berikut:

#table(
  columns: 6,
  [Gudang], [A], [B], [C], [D], [E],
  [A], [0], [12], [18], [25], [20],
  [B], [12], [0], [14], [17], [28],
  [C], [18], [14], [0], [16], [22],
  [D], [25], [17], [16], [0], [15],
  [E], [20], [28], [22], [15], [0]
)

*Pertanyaan:*
+ Formulasikan masalah menggunakan pendekatan Dynamic Programming (Held-Karp).
+ Hitung biaya minimum perjalanan yang dapat ditempuh truk.
+ Tentukan rute optimal yang diperoleh.

== Soal 2: Pengiriman Paket Antar Kota
Sebuah perusahaan logistik melayani pengiriman ke 6 kota yang diberi label P, Q, R, S, T, dan U. Kurir harus memulai perjalanan dari kota P dan kembali ke kota tersebut setelah mengunjungi seluruh kota lainnya tepat satu kali.
Matriks biaya perjalanan (dalam juta rupiah) adalah sebagai berikut:

#table(
  columns: 7,
  [Kota], [P], [Q], [R], [S], [T], [U],
  [P], [0], [8], [12], [15], [20], [10],
  [Q], [8], [0], [18], [14], [11], [17],
  [R], [12], [18], [0], [9], [13], [16],
  [S], [15], [14], [9], [0], [7], [12],
  [T], [20], [11], [13], [7], [0], [10],
  [U], [10], [17], [16], [12], [10], [0]
)

*Pertanyaan:*
+ Bangun model Dynamic Programming untuk menyelesaikan masalah TSP di atas.
+ Hitung seluruh state yang diperlukan untuk memperoleh solusi optimal.
+ Tentukan biaya minimum dan lintasan optimal.

== Soal 3: Rute Inspeksi Jaringan Telekomunikasi
Sebuah teknisi harus melakukan inspeksi pada 7 stasiun telekomunikasi yang diberi label A, B, C, D, E, F, dan G. Teknisi berangkat dari stasiun A, mengunjungi seluruh stasiun tepat satu kali, lalu kembali ke A.
Matriks waktu tempuh (menit):

#table(
  columns: 8,
  [], [A], [B], [C], [D], [E], [F], [G],
  [A], [0], [11], [14], [20], [18], [16], [22],
  [B], [11], [0], [9], [15], [13], [17], [21],
  [C], [14], [9], [0], [12], [10], [19], [18],
  [D], [20], [15], [12], [0], [8], [11], [14],
  [E], [18], [13], [10], [8], [0], [9], [12],
  [F], [16], [17], [19], [11], [9], [0], [7],
  [G], [22], [21], [18], [14], [12], [7], [0]
)

*Pertanyaan:*
+ Definisikan state DP yang digunakan pada algoritma Held-Karp.
+ Tunjukkan proses perhitungan hingga diperoleh solusi optimal.
+ Tentukan total waktu minimum dan urutan kunjungan stasiun yang optimal.

== Soal 4: Distribusi Produk E-Commerce
Sebuah kendaraan pengantar barang harus mengunjungi 6 pusat distribusi yang diberi label A, B, C, D, E, dan F.
Matriks biaya bahan bakar (liter) adalah sebagai berikut:

#table(
  columns: 7,
  [], [A], [B], [C], [D], [E], [F],
  [A], [0], [6], [14], [18], [11], [20],
  [B], [6], [0], [10], [12], [15], [16],
  [C], [14], [10], [0], [8], [13], [9],
  [D], [18], [12], [8], [0], [7], [11],
  [E], [11], [15], [13], [7], [0], [10],
  [F], [20], [16], [9], [11], [10], [0]
)

*Pertanyaan:*
+ Tuliskan relasi rekurens Dynamic Programming yang digunakan.
+ Hitung nilai minimum penggunaan bahan bakar.
+ Bandingkan kompleksitas waktu Dynamic Programming dengan Brute Force untuk kasus ini.

== Soal 5: Jalur Robot Pengantar di Pabrik
Sebuah robot otomatis harus mengunjungi 8 titik pemeriksaan yang diberi label A, B, C, D, E, F, G, dan H. Robot memulai dan mengakhiri perjalanan di titik A.
Matriks jarak (meter) diberikan sebagai berikut:

#table(
  columns: 9,
  [], [A], [B], [C], [D], [E], [F], [G], [H],
  [A], [0], [5], [12], [9], [14], [18], [20], [11],
  [B], [5], [0], [7], [13], [10], [16], [22], [15],
  [C], [12], [7], [0], [8], [9], [12], [17], [10],
  [D], [9], [13], [8], [0], [6], [11], [14], [7],
  [E], [14], [10], [9], [6], [0], [8], [13], [12],
  [F], [18], [16], [12], [11], [8], [0], [9], [10],
  [G], [20], [22], [17], [14], [13], [9], [0], [6],
  [H], [11], [15], [10], [7], [12], [10], [6], [0]
)

*Pertanyaan:*
+ Formulasikan penyelesaian menggunakan Dynamic Programming dengan representasi bitmask.
+ Hitung jumlah state dan estimasi kompleksitas yang diperlukan.
+ Tentukan rute optimal dan total jarak minimum yang harus ditempuh robot.
+ Jelaskan mengapa Dynamic Programming jauh lebih efisien dibandingkan Brute Force pada kasus ini.

= Bagian 2: Branch and Bound

== Soal 1: Distribusi Produk Farmasi
Sebuah perusahaan farmasi memiliki 6 pusat distribusi yang diberi label A, B, C, D, E, dan F. Sebuah kendaraan harus berangkat dari pusat distribusi A, mengunjungi seluruh pusat distribusi lainnya tepat satu kali, dan kembali ke A.
Matriks jarak antar pusat distribusi (km) adalah sebagai berikut:

#table(
  columns: 7,
  [Kota], [A], [B], [C], [D], [E], [F],
  [A], [0], [12], [18], [25], [16], [22],
  [B], [12], [0], [20], [17], [14], [28],
  [C], [18], [20], [0], [15], [24], [11],
  [D], [25], [17], [15], [0], [13], [19],
  [E], [16], [14], [24], [13], [0], [10],
  [F], [22], [28], [11], [19], [10], [0]
)

*Pertanyaan:*
+ Formulasikan permasalahan tersebut menggunakan algoritma Branch and Bound.
+ Hitung lower bound awal dan tunjukkan proses pencarian solusi.
+ Tentukan rute optimal dan total jarak minimum yang diperoleh.

== Soal 2: Pengiriman Barang E-Commerce
Sebuah perusahaan e-commerce harus mengirimkan barang ke 6 kota yang diberi label P, Q, R, S, T, dan U. Kurir berangkat dari kota P dan harus mengunjungi setiap kota tepat satu kali sebelum kembali ke kota asal.
Matriks biaya perjalanan (dalam juta rupiah):

#table(
  columns: 7,
  [Kota], [P], [Q], [R], [S], [T], [U],
  [P], [0], [9], [14], [21], [17], [24],
  [Q], [9], [0], [19], [16], [12], [26],
  [R], [14], [19], [0], [13], [22], [10],
  [S], [21], [16], [13], [0], [11], [15],
  [T], [17], [12], [22], [11], [0], [8],
  [U], [24], [26], [10], [15], [8], [0]
)

*Pertanyaan:*
+ Bangun pohon pencarian Branch and Bound hingga level kedua.
+ Hitung nilai bound untuk setiap cabang utama.
+ Tentukan biaya minimum perjalanan dan rute optimal.

== Soal 3: Jalur Inspeksi Teknisi Jaringan
Seorang teknisi harus melakukan inspeksi pada 7 stasiun jaringan yang diberi label A, B, C, D, E, F, dan G. Teknisi memulai perjalanan dari stasiun A dan harus kembali ke A setelah mengunjungi semua stasiun.
Matriks waktu tempuh (menit):

#table(
  columns: 8,
  [Kota], [A], [B], [C], [D], [E], [F], [G],
  [A], [0], [11], [16], [20], [18], [24], [15],
  [B], [11], [0], [14], [17], [12], [19], [21],
  [C], [16], [14], [0], [10], [15], [13], [18],
  [D], [20], [17], [10], [0], [8], [11], [14],
  [E], [18], [12], [15], [8], [0], [9], [13],
  [F], [24], [19], [13], [11], [9], [0], [7],
  [G], [15], [21], [18], [14], [13], [7], [0]
)

*Pertanyaan:*
+ Tentukan lower bound awal menggunakan metode reduksi matriks.
+ Gambarkan proses branching dan pruning yang terjadi.
+ Tentukan rute optimal dan total waktu minimum.

== Soal 4: Distribusi Makanan Beku
Sebuah perusahaan distribusi makanan beku memiliki 6 gudang yang diberi label A, B, C, D, E, dan F. Truk distribusi harus berangkat dari gudang A, mengunjungi seluruh gudang lain tepat satu kali, lalu kembali ke A.
Matriks jarak (km):

#table(
  columns: 7,
  [Kota], [A], [B], [C], [D], [E], [F],
  [A], [0], [13], [21], [19], [15], [27],
  [B], [13], [0], [18], [16], [11], [24],
  [C], [21], [18], [0], [14], [20], [9],
  [D], [19], [16], [14], [0], [12], [17],
  [E], [15], [11], [20], [12], [0], [8],
  [F], [27], [24], [9], [17], [8], [0]
)

*Pertanyaan:*
+ Formulasikan penyelesaian menggunakan Branch and Bound.
+ Hitung bound untuk setiap cabang yang muncul dari kota A.
+ Tentukan cabang-cabang yang dapat dipangkas (pruned).
+ Tentukan rute optimal beserta total jaraknya.

== Soal 5: Rute Robot Pengantar Barang
Sebuah robot otomatis di gudang pintar harus mengunjungi 7 titik pengambilan barang yang diberi label A, B, C, D, E, F, dan G. Robot harus memulai dan mengakhiri perjalanan di titik A.
Matriks jarak antar titik (meter):

#table(
  columns: 8,
  [Kota], [A], [B], [C], [D], [E], [F], [G],
  [A], [0], [8], [15], [18], [14], [20], [17],
  [B], [8], [0], [12], [16], [11], [19], [22],
  [C], [15], [12], [0], [9], [13], [10], [18],
  [D], [18], [16], [9], [0], [7], [12], [14],
  [E], [14], [11], [13], [7], [0], [8], [11],
  [F], [20], [19], [10], [12], [8], [0], [6],
  [G], [17], [22], [18], [14], [11], [6], [0]
)

*Pertanyaan:*
+ Bangun pohon Branch and Bound untuk dua level pertama.
+ Hitung lower bound awal dan lower bound untuk setiap node level pertama.
+ Tunjukkan proses pruning yang terjadi selama pencarian.
+ Tentukan rute optimal dan total jarak minimum yang harus ditempuh robot.
+ Bandingkan jumlah node yang dievaluasi menggunakan Branch and Bound dengan Brute Force.
