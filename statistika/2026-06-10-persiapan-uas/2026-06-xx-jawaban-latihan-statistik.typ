#set document(
  title: "Jawaban Tugas Statistika 6 Juni 2026",
  author: "Atalariq Barra Hadinugraha"
)
#set page(
  paper: "a4",
  margin: 1in,
)
#set text(font: "Times New Roman", size: 12pt, lang: "id")
#set par(justify: true, leading: 0.65em)

// #show heading: it => {
//   set text(size: 12pt, weight: "bold")
//   it
// }
#show math.equation: math.display

// Header
#align(center)[
  #text(weight: "bold", size: 13pt)[JAWABAN TUGAS STATISTIKA] \
  #v(0.3em)
  #text(size: 11pt)[
    Atalariq Barra Hadinugraha\
    (25/557554/SV/26192)
  ]
]
//
// #line(length: 100%, stroke: 0.5pt)
// #v(0.5em)
//
// #grid(
//   columns: (3cm, auto),
//   row-gutter: 0.4em,
//   [*Nama*], [: \\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_],
//   [*NIM*],  [: \\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_],
//   [*Kelas*],[: \\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_\\_],
// )
//
// #v(0.4em)
// #line(length: 100%, stroke: 0.5pt)
// #v(1em)
//
// ══════════════════════════════════════════════════════════════
// BAGIAN I: DISTRIBUSI PROBABILITAS
// ══════════════════════════════════════════════════════════════

#align(center)[#text(weight: "bold")[BAGIAN I: DISTRIBUSI PROBABILITAS]]
#v(0.5em)

// ── Soal 1 ──────────────────────────────────────────────────

== Soal 1
Apa yang dimaksud dengan *distribusi probabilitas*, dan mengapa konsep tersebut penting dalam statistika?

== Jawaban 1

=== Definisi

Distribusi probabilitas adalah suatu fungsi yang menggambarkan seluruh kemungkinan nilai dari suatu variabel acak beserta probabilitas (peluang) terjadinya masing-masing nilai tersebut. Dengan kata lain, distribusi probabilitas memberikan "peta peluang" yang lengkap: untuk setiap nilai yang mungkin muncul, fungsi ini menyatakan seberapa besar kemungkinan nilai tersebut terjadi.

Secara matematis, setiap distribusi probabilitas harus memenuhi dua syarat fundamental. Pertama, setiap nilai probabilitas harus berada dalam rentang 0 hingga 1. Tidak mungkin suatu kejadian memiliki peluang negatif atau lebih dari 100%. Kedua, jumlah seluruh probabilitas dari semua kemungkinan nilai harus tepat sama dengan 1. Untuk variabel diskrit, syarat ini dinyatakan sebagai penjumlahan:

$ sum P(X = x) = 1 $

sedangkan untuk variabel kontinu, syaratnya dinyatakan sebagai integral:

$ integral_(-oo)^(oo) f(x) thin d x = 1 $

Kedua syarat ini memastikan bahwa distribusi probabilitas merupakan model matematis yang konsisten dan lengkap.

=== Pentingnya dalam Statistika

Distribusi probabilitas menjadi fondasi utama statistika inferensial karena beberapa alasan. Pertama, distribusi probabilitas menyediakan model matematis yang dapat menggambarkan perilaku data dalam populasi tanpa harus mengumpulkan seluruh anggota populasi tersebut. Dengan mengetahui bahwa suatu data mengikuti distribusi tertentu, kita dapat membuat inferensi tentang populasi berdasarkan sampel yang relatif kecil.

Kedua, distribusi probabilitas memungkinkan perhitungan peluang berbagai kejadian secara kuantitatif. Ini menjadi sangat penting dalam pengambilan keputusan di bawah ketidakpastian, misalnya dalam manajemen risiko, quality control di industri manufaktur, dan berbagai aplikasi machine learning.

Ketiga, hampir seluruh metode statistika inferensial dibangun di atas konsep distribusi probabilitas. Pengujian hipotesis menggunakan distribusi sampling untuk menentukan apakah suatu hasil signifikan secara statistik. Estimasi parameter dan pembentukan selang kepercayaan juga bergantung pada sifat-sifat distribusi probabilitas dari estimator yang digunakan.

#v(0.5em)

// ── Soal 2 ──────────────────────────────────────────────────

== Soal 2
Jelaskan perbedaan antara *variabel acak diskrit* dan *variabel acak kontinu*. Berikan masing-masing dua contoh dalam kehidupan sehari-hari.

== Jawaban 2

=== Variabel Acak Diskrit

Variabel acak diskrit adalah variabel yang hanya dapat mengambil nilai-nilai tertentu yang terhitung (countable). Nilai-nilai ini biasanya berupa bilangan bulat dan terdapat "celah" di antara satu nilai dengan nilai berikutnya. Artinya, variabel diskrit tidak dapat mengambil nilai di antara dua nilai yang berdekatan.

Karakteristik utama variabel acak diskrit adalah bahwa probabilitas dapat dihitung pada titik tertentu, yaitu $P(X = x) > 0$ untuk nilai $x$ yang masuk dalam ruang sampel. Fungsi yang menggambarkan probabilitas pada setiap titik disebut fungsi massa probabilitas (probability mass function, PMF).

Contoh dalam kehidupan sehari-hari: (1) jumlah anak dalam sebuah keluarga, yang hanya dapat bernilai 0, 1, 2, 3, dan seterusnya, tidak mungkin 2,5 anak; (2) jumlah mobil yang melewati gerbang tol dalam satu jam, yang merupakan bilangan cacah.

=== Variabel Acak Kontinu

Variabel acak kontinu adalah variabel yang dapat mengambil semua nilai dalam suatu interval atau rentang tertentu. Nilai-nilainya tidak terhitung (uncountable) karena di antara dua nilai manapun selalu terdapat tak hingga banyak nilai lainnya.

Karakteristik penting variabel kontinu adalah bahwa probabilitas pada satu titik tunggal selalu nol, yaitu $P(X = x) = 0$. Probabilitas hanya bermakna ketika dihitung pada suatu interval, misalnya $P(a < X < b)$. Fungsi yang menggambarkan probabilitas pada variabel kontinu disebut fungsi kepadatan probabilitas (probability density function, PDF), dan probabilitas diperoleh melalui integral fungsi tersebut pada interval yang diinginkan.

Contoh dalam kehidupan sehari-hari: (1) tinggi badan seseorang, yang dapat bernilai 165,3 cm, 165,34 cm, 165,341 cm, dan seterusnya; (2) waktu tempuh perjalanan dari rumah ke kampus, yang dapat bernilai 15,7 menit, 15,72 menit, dan sebagainya.

=== Tabel Perbandingan

#table(
  columns: (auto, auto),
  stroke: 0.4pt,
  inset: 6pt,
  [*Variabel Acak Diskrit*], [*Variabel Acak Kontinu*],
  [Nilai terhitung dan terpisah satu sama lain.], [Nilai kontinu dalam suatu interval.],
  [$P(X = x) > 0$ untuk titik tertentu dalam ruang sampel.], [$P(X = x) = 0$, hanya $P(a < X < b) > 0$.],
  [Menggunakan fungsi massa probabilitas (PMF).], [Menggunakan fungsi kepadatan probabilitas (PDF).],
  [Contoh: jumlah kecelakaan per hari.], [Contoh: suhu udara harian.],
)

#v(0.5em)

// ── Soal 3 ──────────────────────────────────────────────────

== Soal 3
Sebuah dadu enam sisi dilempar sekali. Buatlah tabel distribusi probabilitas untuk variabel acak yang menyatakan angka yang muncul.

== Jawaban 3

=== Langkah

Pertama, kita tentukan ruang sampel dari percobaan pelemparan sebuah dadu enam sisi. Ruang sampelnya adalah himpunan semua sisi dadu yang mungkin muncul, yaitu $S = {1, 2, 3, 4, 5, 6}$. Terdapat 6 kemungkinan hasil yang saling lepas (mutually exclusive) dan bersama-sama mencakup seluruh kemungkinan (exhaustive).

Karena dadu diasumsikan setimbang (fair), maka setiap sisi memiliki peluang yang sama untuk muncul. Dengan demikian, peluang munculnya setiap angka adalah satu per enam, atau $1/6$. Variabel acak $X$ kita definisikan sebagai angka yang muncul pada sisi atas dadu setelah pelemparan.

=== Tabel Distribusi Probabilitas

#table(
  columns: (auto, auto),
  stroke: 0.4pt,
  inset: 6pt,
  align: (center, center),
  [*$x$*], [*$P(X = x)$*],
  [1], [$1/6 approx 0,1667$],
  [2], [$1/6 approx 0,1667$],
  [3], [$1/6 approx 0,1667$],
  [4], [$1/6 approx 0,1667$],
  [5], [$1/6 approx 0,1667$],
  [6], [$1/6 approx 0,1667$],
  [*Total*], [*1*],
)

=== Verifikasi

Untuk memastikan bahwa tabel di atas merupakan distribusi probabilitas yang sah, kita periksa kedua syarat distribusi probabilitas. Pertama, setiap nilai $P(X = x)$ berada dalam rentang 0 sampai 1, yaitu $1/6 approx 0,1667$, yang jelas memenuhi. Kedua, jumlah seluruh probabilitas harus sama dengan 1:

$ sum_(x=1)^6 P(X = x) = 6 times 1/6 = 1 $

Kedua syarat terpenuhi, sehingga tabel tersebut merupakan distribusi probabilitas yang sah. Distribusi ini disebut distribusi uniform diskrit karena setiap nilai memiliki peluang yang sama.

#v(0.5em)

// ── Soal 4 ──────────────────────────────────────────────────

== Soal 4
Sebuah permainan memberikan hadiah Rp10.000 jika muncul angka genap dan Rp20.000 jika muncul angka ganjil pada pelemparan dadu. Hitung *nilai harapan* dari hadiah yang diperoleh pemain.

== Jawaban 4

=== Rumus

Nilai harapan (expected value) dari suatu variabel acak diskrit $X$ didefinisikan sebagai rata-rata tertimbang dari seluruh kemungkinan nilai variabel tersebut, di mana bobot untuk setiap nilai adalah probabilitas nilai itu terjadi. Secara matematis, rumusnya adalah:

$ E[X] = sum_(i=1)^n x_i dot P(X = x_i) $

di mana $x_i$ adalah nilai-nilai yang mungkin dari variabel acak, dan $P(X = x_i)$ adalah probabilitas masing-masing nilai tersebut. Konsep nilai harapan sangat penting karena memberikan gambaran tentang hasil rata-rata yang diharapkan dalam jangka panjang jika percobaan dilakukan berkali-kali.

=== Langkah

Kita identifikasi terlebih dahulu himpunan angka genap dan ganjil pada dadu enam sisi. Angka genap pada dadu adalah 2, 4, dan 6. Angka ganjil pada dadu adalah 1, 3, dan 5. Masing-masing kelompok terdiri dari 3 angka, dan setiap angka memiliki peluang $1/6$.

Karena terdapat 3 angka genap dan 3 angka ganjil, maka peluang munculnya angka genap adalah $3/6 = 0,5$ dan peluang munculnya angka ganjil juga $3/6 = 0,5$. Aturan hadiah menyatakan bahwa jika muncul angka genap, pemain mendapat Rp10.000; jika muncul angka ganjil, pemain mendapat Rp20.000.

Dengan demikian, variabel acak "Hadiah" hanya memiliki dua kemungkinan nilai: Rp10.000 dengan peluang 0,5 dan Rp20.000 dengan peluang 0,5.

=== Perhitungan

Kita substitusikan nilai-nilai tersebut ke dalam rumus nilai harapan:

$
E["Hadiah"] &= sum x dot P(X = x) \
  &= 10.000 dot P("genap") + 20.000 dot P("ganjil") \
  &= 10.000 dot 3/6 + 20.000 dot 3/6 \
  &= 10.000 dot 0,5 + 20.000 dot 0,5 \
  &= 5.000 + 10.000 \
  &= 15.000
$

=== Hasil

$ therefore $ Nilai harapan hadiah yang diperoleh pemain adalah *Rp15.000,00*.

Interpretasi dari hasil ini adalah sebagai berikut: jika permainan tersebut dilakukan berulang kali dalam jumlah yang sangat besar (misalnya ribuan kali), maka rata-rata hadiah yang diterima pemain per satu kali pelemparan akan mendekati Rp15.000. Nilai ini tidak berarti bahwa setiap pemain pasti mendapat Rp15.000 dalam satu kali permainan (pada kenyataannya, hadiah hanya Rp10.000 atau Rp20.000). Namun, dalam jangka panjang, ekspektasi rata-ratanya adalah Rp15.000.

#v(0.5em)

// ── Soal 5 ──────────────────────────────────────────────────

== Soal 5
Apa perbedaan antara *nilai harapan*, *varians*, dan *standar deviasi* dalam distribusi probabilitas? Mengapa varians diperlukan selain nilai harapan?

== Jawaban 5

=== Nilai Harapan $E[X]$

Nilai harapan (expected value) adalah ukuran pemusatan (central tendency) dari suatu distribusi probabilitas. Nilai ini merupakan rata-rata tertimbang dari seluruh kemungkinan nilai variabel acak, dengan bobot berupa probabilitas masing-masing nilai. Secara intuitif, $E[X]$ menunjukkan "pusat massa" dari distribusi, yaitu titik keseimbangan di mana distribusi akan stabil jika percobaan diulang tak hingga kali.

Untuk variabel diskrit, nilai harapan dihitung dengan:

$ E[X] = sum x dot P(X = x) $

Untuk variabel kontinu, nilai harapan dihitung dengan:

$ E[X] = integral_(-oo)^(oo) x dot f(x) thin d x $

=== Varians $"Var"(X)$

Varians adalah ukuran sebaran (dispersion) yang mengukur rata-rata kuadrat selisih antara setiap nilai variabel acak dengan nilai harapannya. Semakin besar varians, semakin tersebar (menyebar lebar) data di sekitar nilai harapannya. Varians dihitung dengan rumus:

$ "Var"(X) = E[(X - mu)^2] = E[X^2] - (E[X])^2 $

di mana $mu = E[X]$. Rumus $E[X^2] - (E[X])^2$ seringkali lebih mudah digunakan dalam perhitungan praktis karena tidak memerlukan perhitungan selisih setiap nilai terhadap rata-rata.

=== Standar Deviasi $sigma$

Standar deviasi adalah akar kuadrat dari varians:

$ sigma = sqrt("Var"(X)) $

Keunggulan utama standar deviasi dibandingkan varians adalah satuannya. Varians memiliki satuan kuadrat dari satuan asli variabel (misalnya, jika variabel bersatuan rupiah, varians bersatuan rupiah kuadrat), sedangkan standar deviasi memiliki satuan yang sama dengan variabel aslinya. Hal ini membuat standar deviasi jauh lebih mudah diinterpretasikan secara intuitif.

=== Mengapa Varians Diperlukan?

Nilai harapan saja tidak cukup untuk menggambarkan suatu distribusi probabilitas karena dua distribusi dapat memiliki nilai harapan yang persis sama, tetapi memiliki sebaran yang sangat berbeda. Sebagai ilustrasi, perhatikan dua distribusi berikut:

+ Distribusi A: variabel selalu bernilai tepat 50 (probabilitas 1 untuk nilai 50). Tidak ada variasi sama sekali.
+ Distribusi B: variabel dapat bernilai 0 dengan peluang 0,5, atau bernilai 100 dengan peluang 0,5.

Kedua distribusi memiliki nilai harapan yang sama, yaitu $E[X] = 50$. Namun, risikonya sangat berbeda. Pada distribusi A, hasilnya selalu pasti 50. Pada distribusi B, hasilnya bisa 0 (rugi total) atau 100 (untung maksimal), sehingga ketidakpastiannya jauh lebih besar.

Varians dan standar deviasi menangkap perbedaan krusial ini. Varians distribusi A adalah 0 (tidak ada variasi), sedangkan varians distribusi B adalah $(0 - 50)^2(0,5) + (100 - 50)^2(0,5) = 2500$. Informasi tentang sebaran ini sangat esensial dalam berbagai aplikasi, seperti manajemen risiko keuangan, quality control di industri, dan inferensi statistik secara umum.

#v(0.5em)

// ── Soal 6 ──────────────────────────────────────────────────

== Soal 6
Sebuah perusahaan mengetahui bahwa peluang produk cacat adalah 5%. Jika dipilih 20 produk secara acak, berapakah probabilitas *tepat 2 produk* yang cacat?

== Jawaban 6

=== Identifikasi Distribusi

Kasus ini memenuhi semua syarat untuk dimodelkan dengan distribusi binomial. Distribusi binomial digunakan untuk menghitung probabilitas banyaknya "sukses" dalam serangkaian percobaan Bernoulli yang independen. Empat syarat distribusi binomial terpenuhi di sini:

Pertama, jumlah percobaan tetap, yaitu $n = 20$ produk yang dipilih. Kedua, setiap percobaan bersifat independen, artinya hasil pemeriksaan satu produk tidak memengaruhi hasil pemeriksaan produk lainnya (produk dipilih secara acak dari populasi yang besar). Ketiga, setiap percobaan hanya memiliki dua kemungkinan hasil: sukses (produk cacat) atau gagal (produk tidak cacat). Keempat, peluang sukses konstan di setiap percobaan, yaitu $p = 0,05$ atau 5%.

Variabel acak $X$ didefinisikan sebagai banyaknya produk cacat di antara 20 produk yang dipilih. Kita ingin menghitung $P(X = 2)$.

=== Rumus

Probabilitas tepat $k$ sukses dalam $n$ percobaan binomial diberikan oleh rumus:

$ P(X = k) = binom(n, k) dot p^k dot (1 - p)^(n - k) $

di mana $binom(n, k)$ adalah koefisien binomial yang menyatakan banyaknya cara memilih $k$ objek dari $n$ objek tanpa memperhatikan urutan, dan dihitung dengan:

$ binom(n, k) = (n!) / (k! dot (n - k)!) $

=== Langkah Perhitungan

Diketahui parameter sebagai berikut: $n = 20$, $k = 2$, $p = 0,05$, dan $1 - p = 0,95$.

Tahap pertama, kita hitung koefisien binomial $binom(20, 2)$:

$ binom(20, 2) = (20!) / (2! dot 18!) = (20 dot 19) / (2 dot 1) = 190 $

Tahap kedua, kita hitung $p^k = (0,05)^2 = 0,0025$.

Tahap ketiga, kita hitung $(1 - p)^(n-k) = (0,95)^18$. Perhitungan ini lebih kompleks dan memerlukan alat bantu hitung:

$ (0,95)^18 approx 0,3972 $

=== Perhitungan Akhir

Sekarang kita substitusikan semua komponen ke dalam rumus binomial:

$
P(X = 2) &= 190 dot 0,0025 dot 0,3972 \
  &= 190 dot 0,0009929 \
  &approx 0,1887
$

=== Hasil

$ therefore $ Probabilitas bahwa tepat 2 produk cacat dari 20 produk yang dipilih adalah *0,1887* atau sekitar *18,87%*.

Interpretasi: jika perusahaan berulang kali mengambil sampel 20 produk secara acak dari lini produksinya, maka sekitar 18,87% dari seluruh sampel tersebut akan mengandung tepat 2 produk cacat. Probabilitas ini cukup substansial, menunjukkan bahwa meskipun tingkat cacat hanya 5%, peluang menemukan tepat 2 cacat dalam sampel 20 produk bukanlah kejadian yang langka.

#v(0.5em)

// ── Soal 7 ──────────────────────────────────────────────────

== Soal 7
Sebuah pusat layanan pelanggan menerima rata-rata 4 panggilan per jam. Berapakah probabilitas menerima *tepat 6 panggilan* dalam satu jam tertentu?

== Jawaban 7

=== Identifikasi Distribusi

Kasus ini paling tepat dimodelkan dengan distribusi Poisson. Distribusi Poisson digunakan untuk menghitung probabilitas banyaknya kejadian yang terjadi dalam suatu interval waktu atau ruang tertentu, dengan asumsi bahwa kejadian-kejadian tersebut terjadi secara independen dan dengan rata-rata yang konstan.

Tiga syarat utama distribusi Poisson terpenuhi dalam kasus ini. Pertama, kita menghitung jumlah kejadian (panggilan masuk) dalam interval waktu yang tetap, yaitu satu jam. Kedua, kejadian-kejadian tersebut bersifat independen; satu panggilan tidak memengaruhi kapan panggilan berikutnya masuk. Ketiga, rata-rata kejadian per interval waktu diketahui, yaitu $lambda = 4$ panggilan per jam. Variabel acak $X$ didefinisikan sebagai banyaknya panggilan yang diterima dalam satu jam tertentu, dan kita ingin menghitung $P(X = 6)$.

=== Rumus

Probabilitas tepat $k$ kejadian pada distribusi Poisson dengan rata-rata $lambda$ diberikan oleh:

$ P(X = k) = (lambda^k dot e^(-lambda)) / (k!) $

di mana $e$ adalah bilangan Euler ($e approx 2,71828$) dan $k!$ adalah faktorial dari $k$. Parameter $lambda$ merupakan rata-rata sekaligus varians dari distribusi Poisson.

=== Langkah Perhitungan

Diketahui $lambda = 4$ dan $k = 6$. Kita hitung komponen-komponen rumus satu per satu.

Komponen pertama: $lambda^k = 4^6$. Untuk menghitungnya, $4^1 = 4$, $4^2 = 16$, $4^3 = 64$, $4^4 = 256$, $4^5 = 1024$, dan $4^6 = 4096$.

Komponen kedua: $k! = 6! = 6 times 5 times 4 times 3 times 2 times 1 = 720$.

Komponen ketiga: $e^(-lambda) = e^(-4)$. Menggunakan alat bantu hitung, $e^(-4) approx 0,01832$.

=== Perhitungan Akhir

Sekarang kita substitusikan ketiga komponen ke dalam rumus Poisson:

$
P(X = 6) &= (4^6 dot e^(-4)) / (6!) \
  &= (4096 dot 0,01832) / (720) \
  &= (75,02) / (720) \
  &approx 0,1042
$

=== Hasil

$ therefore $ Probabilitas pusat layanan menerima tepat 6 panggilan dalam satu jam tertentu adalah *0,1042* atau sekitar *10,42%*.

Interpretasi: jika kita mengamati pusat layanan tersebut selama banyak periode satu jam yang independen, sekitar 10,42% dari periode-periode tersebut akan mencatat tepat 6 panggilan masuk. Dengan kata lain, kejadian menerima tepat 6 panggilan dalam satu jam bukanlah kejadian yang sangat langka, tetapi juga bukan yang paling umum (mengingat rata-ratanya adalah 4 panggilan per jam).

#v(0.5em)

// ── Soal 8 ──────────────────────────────────────────────────

== Soal 8
Mengapa distribusi normal sering disebut sebagai distribusi yang paling penting dalam statistika? Sebutkan minimal *tiga karakteristik utamanya*.

== Jawaban 8

=== Mengapa Distribusi Normal Sangat Penting?

Distribusi normal sering disebut sebagai distribusi yang paling penting dalam statistika, dan julukan ini bukan tanpa alasan yang kuat. Terdapat tiga alasan fundamental yang mendasari posisi sentral distribusi normal.

Alasan pertama dan paling krusial adalah Teorema Limit Pusat (Central Limit Theorem, CLT). Teorema ini menyatakan bahwa berapa pun bentuk distribusi populasi asal (bisa sangat tidak normal, misalnya sangat skew, bimodal, atau bahkan uniform), distribusi sampling dari rata-rata sampel akan mendekati distribusi normal ketika ukuran sampel cukup besar, umumnya $n >= 30$. Ini adalah hasil yang sangat powerful karena memungkinkan kita melakukan inferensi statistik (uji hipotesis, selang kepercayaan) pada hampir semua jenis data, tanpa harus mengetahui bentuk distribusi populasinya. CLT menjadi jembatan yang menghubungkan statistika deskriptif dengan statistika inferensial.

Alasan kedua adalah bahwa banyak fenomena alam, biologis, dan sosial secara natural mengikuti distribusi normal. Tinggi badan manusia dalam suatu populasi, tekanan darah, kesalahan pengukuran dalam eksperimen fisika, nilai ujian dalam kelas besar, dan banyak variabel lainnya cenderung membentuk distribusi yang simetris berbentuk lonceng. Hal ini terjadi karena variabel-variabel tersebut merupakan hasil akumulasi dari banyak faktor kecil yang saling independen, yang menurut CLT akan menghasilkan distribusi normal.

Alasan ketiga adalah bahwa sebagian besar metode statistika parametrik yang kita gunakan sehari-hari dibangun di atas asumsi normalitas. Uji-$t$ (satu sampel, dua sampel, berpasangan), analisis varians (ANOVA), regresi linear, dan berbagai teknik multivariat mengasumsikan bahwa residual atau data mengikuti distribusi normal. Tanpa distribusi normal, banyak alat inferensial yang menjadi tidak valid atau setidaknya memerlukan penyesuaian.

=== Tiga Karakteristik Utama

Karakteristik pertama adalah *bentuk simetris berbentuk lonceng* (bell-shaped curve). Kurva distribusi normal simetris sempurna terhadap garis vertikal yang melalui rata-ratanya. Konsekuensi dari simetri ini adalah bahwa nilai mean, median, dan modus berimpit pada satu titik yang sama. Tidak ada skewness ke kiri maupun ke kanan.

Karakteristik kedua adalah *aturan empiris 68–95–99,7*. Aturan ini menyatakan bahwa sekitar 68% dari seluruh data berada dalam rentang satu standar deviasi dari rata-rata ($mu plus.minus 1 sigma$), sekitar 95% data berada dalam rentang dua standar deviasi ($mu plus.minus 2 sigma$), dan sekitar 99,7% data berada dalam rentang tiga standar deviasi ($mu plus.minus 3 sigma$). Aturan ini memberikan intuisi yang sangat kuat tentang sebaran data normal tanpa perlu menghitung integral yang rumit.

Karakteristik ketiga adalah bahwa distribusi normal *sepenuhnya ditentukan hanya oleh dua parameter*: rata-rata $mu$ (menentukan lokasi pusat distribusi) dan standar deviasi $sigma$ (menentukan sebaran atau lebar kurva). Distribusi normal dengan $mu = 0$ dan $sigma = 1$ disebut distribusi normal standar, dan setiap distribusi normal dapat ditransformasikan menjadi distribusi normal standar melalui standardisasi:

$ Z = (X - mu) / sigma $

di mana $Z$ disebut Z-score. Standardisasi ini memungkinkan kita menggunakan satu tabel probabilitas yang sama (tabel Z) untuk semua distribusi normal, tanpa memandang nilai $mu$ dan $sigma$-nya.

#v(0.5em)

// ── Soal 9 ──────────────────────────────────────────────────

== Soal 9
Tentukan distribusi probabilitas yang paling sesuai untuk masing-masing kasus berikut dan jelaskan alasannya:

a. Jumlah email yang diterima per jam.
b. Tinggi badan mahasiswa.
c. Jumlah kepala yang muncul saat melempar 10 koin.
d. Waktu tunggu pelanggan di bank.

== Jawaban 9

=== a. Jumlah Email per Jam

Distribusi yang paling sesuai adalah *distribusi Poisson*. Alasannya, kita menghitung jumlah kejadian (kedatangan email) dalam interval waktu yang tetap, yaitu satu jam. Syarat-syarat distribusi Poisson terpenuhi di sini: kejadian-kejadian (email masuk) bersifat independen satu sama lain; rata-rata jumlah email per jam bersifat konstan (setidaknya dalam periode yang diamati); dan dua email tidak mungkin masuk tepat pada waktu yang persis sama dalam arti kontinu. Distribusi Poisson memang dirancang khusus untuk memodelkan "counting process" seperti ini.

=== b. Tinggi Badan Mahasiswa

Distribusi yang paling sesuai adalah *distribusi normal*. Tinggi badan merupakan variabel kontinu yang dipengaruhi oleh sangat banyak faktor yang saling independen, seperti faktor genetik dari kedua orang tua, nutrisi sejak kecil, kondisi kesehatan, aktivitas fisik, dan faktor lingkungan lainnya. Menurut Teorema Limit Pusat, akumulasi dari banyak faktor independen yang kecil akan menghasilkan distribusi yang mendekati normal. Secara empiris, data tinggi badan dari populasi yang besar memang menunjukkan pola distribusi berbentuk lonceng yang simetris.

=== c. Jumlah Kepala pada 10 Lemparan Koin

Distribusi yang paling sesuai adalah *distribusi binomial*. Kasus ini memenuhi keempat syarat distribusi binomial dengan sempurna: jumlah percobaan tetap, yaitu $n = 10$ lemparan; setiap lemparan bersifat independen (hasil satu lemparan tidak memengaruhi lemparan berikutnya); setiap percobaan hanya memiliki dua hasil yang mungkin, yaitu kepala (sukses) atau gambar (gagal); dan peluang sukses konstan di setiap lemparan, yaitu $p = 0,5$ karena koin diasumsikan setimbang. Variabel yang diamati adalah banyaknya sukses (kepala) dalam 10 percobaan Bernoulli.

=== d. Waktu Tunggu Pelanggan di Bank

Distribusi yang paling sesuai adalah *distribusi eksponensial*. Waktu tunggu adalah variabel kontinu yang mengukur waktu *antar kejadian* dalam suatu proses Poisson. Jika kedatangan pelanggan ke bank mengikuti proses Poisson (kedatangan independen dengan rata-rata konstan), maka waktu antara kedatangan pelanggan yang berurutan akan berdistribusi eksponensial. Karakteristik distribusi eksponensial meliputi: selalu bernilai positif (waktu tunggu tidak mungkin negatif), bersifat memoryless (waktu yang sudah dihabiskan menunggu tidak memengaruhi ekspektasi waktu tunggu yang tersisa), dan sangat skew ke kanan (banyak pelanggan menunggu waktu singkat, sedikit yang menunggu sangat lama).

#v(0.5em)

// ── Soal 10 ─────────────────────────────────────────────────

== Soal 10
Sebuah ujian memiliki nilai yang berdistribusi normal dengan rata-rata 70 dan standar deviasi 10. Seorang mahasiswa memperoleh nilai 90. Bagaimana Anda menginterpretasikan posisi mahasiswa tersebut dibandingkan peserta lainnya?

== Jawaban 10

=== Langkah: Menghitung Z-score

Untuk mengetahui posisi relatif seorang peserta dalam suatu distribusi normal, kita menggunakan Z-score (nilai baku). Z-score menunjukkan berapa standar deviasi suatu nilai berada di atas atau di bawah rata-rata populasi. Rumus Z-score adalah:

$ Z = (X - mu) / sigma $

di mana $X$ adalah nilai individu, $mu$ adalah rata-rata populasi, dan $sigma$ adalah standar deviasi populasi. Z-score mentransformasikan nilai dari distribusi normal dengan parameter sembarang menjadi distribusi normal standar dengan $mu = 0$ dan $sigma = 1$, sehingga memudahkan perbandingan.

=== Perhitungan

Diketahui $X = 90$, $mu = 70$, dan $sigma = 10$. Substitusikan ke rumus:

$
Z &= (90 - 70) / 10 \
  &= 20 / 10 \
  &= 2,0
$

=== Interpretasi

Nilai $Z = 2,0$ berarti bahwa mahasiswa tersebut memperoleh nilai yang berada *2 standar deviasi di atas rata-rata kelas*. Ini adalah posisi yang sangat baik.

Untuk memahami lebih jauh, kita gunakan aturan empiris distribusi normal. Aturan ini menyatakan bahwa sekitar 95% data berada dalam rentang $mu plus.minus 2 sigma$, yaitu antara $70 - 2(10) = 50$ dan $70 + 2(10) = 90$. Karena distribusi normal bersifat simetris, maka 5% data yang berada di luar rentang ini terbagi sama rata di kedua ekor: 2,5% di ekor kiri (nilai di bawah 50) dan 2,5% di ekor kanan (nilai di atas 90).

Dengan demikian, hanya sekitar 2,5% peserta ujian yang memperoleh nilai di atas 90. Mahasiswa dengan nilai 90 berada tepat di batas atas rentang 95% tersebut.

Lebih presisinya, menggunakan tabel distribusi normal standar atau perhitungan fungsi distribusi kumulatif, nilai $Z = 2,0$ berkorespondensi dengan luas area di bawah kurva normal sebesar sekitar 0,9772. Artinya, sekitar 97,72% peserta memiliki nilai di bawah 90.

$ therefore $ Mahasiswa tersebut berada pada *persentil ke-97,7*, yang berarti ia *mengungguli sekitar 97,7% dari seluruh peserta ujian* dan termasuk dalam kelompok 2,3% teratas. Ini merupakan pencapaian yang sangat baik dalam konteks distribusi nilai ujian tersebut.

#v(0.5em)

// ── Soal 11 ─────────────────────────────────────────────────

== Soal 11
Dalam pengembangan sistem kecerdasan buatan atau _machine learning_, mengapa pemahaman distribusi probabilitas menjadi sangat penting? Berikan contoh penerapannya.

== Jawaban 11

=== Pentingnya Distribusi Probabilitas dalam AI/ML

Pemahaman tentang distribusi probabilitas merupakan fondasi yang tidak dapat diabaikan dalam pengembangan sistem kecerdasan buatan dan machine learning. Ada beberapa alasan fundamental yang menjadikan konsep ini sangat krusial.

Pertama, landasan teoretis dari sebagian besar algoritma machine learning dibangun di atas asumsi distribusi probabilitas tertentu. Sebagai contoh, algoritma Naive Bayes secara eksplisit menggunakan Teorema Bayes dan mengasumsikan independensi antar fitur untuk menghitung probabilitas posterior suatu kelas. Regresi linear klasik mengasumsikan bahwa residual (galat) berdistribusi normal dengan rata-rata nol dan varians konstan. Tanpa pemahaman tentang asumsi-asumsi distribusi ini, kita tidak dapat memahami kapan suatu algoritma tepat digunakan dan kapan hasilnya dapat dipercaya.

Kedua, kemampuan untuk mengevaluasi ketidakpastian (uncertainty quantification) menjadi semakin penting seiring dengan penerapan AI pada domain-domain berisiko tinggi. Model probabilistik tidak hanya memberikan prediksi titik (point estimate), tetapi juga confidence level atau selang kepercayaan dari prediksinya. Dalam diagnosis medis berbasis AI, misalnya, mengetahui bahwa model 98% yakin seorang pasien menderita suatu penyakit versus 51% yakin memiliki implikasi klinis yang sangat berbeda. Kemampuan mengkuantifikasi ketidakpastian ini sepenuhnya bergantung pada pemodelan distribusi probabilitas.

Ketiga, perkembangan generative AI yang sangat pesat dalam beberapa tahun terakhir sepenuhnya dibangun di atas konsep distribusi probabilitas. Model generatif seperti Generative Adversarial Networks (GAN), Variational Autoencoders (VAE), dan diffusion model pada dasarnya belajar untuk memodelkan dan meniru distribusi probabilitas dari data pelatihan. Tujuannya adalah untuk menghasilkan sampel baru yang "terlihat seperti" berasal dari distribusi yang sama dengan data asli. Ini adalah aplikasi langsung dari teori distribusi probabilitas.

Keempat, dalam tahap feature engineering dan preprocessing data, pemahaman tentang distribusi masing-masing fitur sangat membantu dalam memilih transformasi yang tepat. Data yang sangat skew mungkin memerlukan transformasi logaritmik. Data dengan skala yang sangat berbeda mungkin memerlukan standardisasi (Z-score normalization) yang mengasumsikan distribusi normal. Pemilihan teknik preprocessing yang tepat sangat bergantung pada pemahaman kita tentang distribusi data.

=== Contoh Penerapan

Salah satu contoh klasik adalah penggunaan *Naive Bayes Classifier untuk klasifikasi email spam*. Model ini menghitung probabilitas bahwa sebuah email adalah spam dengan syarat kata-kata tertentu muncul di dalamnya, atau $P("spam" | "kata-kata")$. Probabilitas ini dihitung menggunakan Teorema Bayes, di mana setiap kata dimodelkan dengan distribusi probabilitasnya sendiri. Model mempelajari distribusi frekuensi kemunculan setiap kata dalam email spam dan email non-spam dari data pelatihan. Meskipun asumsi independensi antar katanya "naif" (karena dalam kenyataannya kata-kata dalam kalimat saling bergantung), model ini terbukti sangat efektif dan efisien untuk tugas klasifikasi teks.

Contoh lain adalah *regresi logistik* yang digunakan untuk memprediksi probabilitas seorang pelanggan akan berhenti berlangganan (churn). Model ini menghasilkan output berupa probabilitas $P(Y = 1 | X)$, yaitu peluang pelanggan churn diberikan fitur-fitur seperti frekuensi transaksi, lama berlangganan, dan jumlah keluhan. Karena outputnya adalah probabilitas yang berada dalam rentang 0 sampai 1, model ini secara alamiah menangani ketidakpastian prediksi.

#v(1em)

// ══════════════════════════════════════════════════════════════
// BAGIAN II: ANALISIS REGRESI
// ══════════════════════════════════════════════════════════════

#align(center)[#text(weight: "bold")[BAGIAN II: ANALISIS REGRESI]]
#v(0.5em)

// ── Soal 12 ─────────────────────────────────────────────────

== Soal 12
Apa yang dimaksud dengan *analisis regresi*? Jelaskan tujuan utama penggunaan regresi dalam statistika dan berikan satu contoh penerapannya dalam kehidupan nyata.

== Jawaban 12

=== Definisi

Analisis regresi adalah suatu metode statistika yang digunakan untuk memodelkan dan menganalisis hubungan fungsional antara satu variabel dependen (variabel respons, variabel terikat) dan satu atau lebih variabel independen (variabel prediktor, variabel bebas). Dalam konteks regresi, kita berusaha memahami bagaimana perubahan pada variabel independen berkaitan dengan perubahan pada variabel dependen, dan seberapa kuat hubungan tersebut.

Secara matematis, analisis regresi berusaha menemukan fungsi $f$ yang paling baik dalam menjelaskan hubungan:

$ Y = f(X_1, X_2, ..., X_k) + epsilon $

di mana $Y$ adalah variabel dependen, $X_1, X_2, ..., X_k$ adalah variabel independen, dan $epsilon$ adalah komponen galat (error) yang mencakup semua faktor lain yang memengaruhi $Y$ tetapi tidak dimasukkan dalam model.

=== Tujuan Utama

Terdapat tiga tujuan utama penggunaan analisis regresi dalam statistika.

Tujuan pertama adalah *prediksi* (prediction atau forecasting). Dengan model regresi yang telah diestimasi dari data historis, kita dapat memprediksi nilai variabel dependen untuk nilai-nilai variabel independen yang baru. Contoh klasik: memprediksi harga rumah berdasarkan luas bangunan, jumlah kamar, dan lokasi. Kemampuan prediksi ini sangat berharga dalam perencanaan bisnis, kebijakan publik, dan pengambilan keputusan.

Tujuan kedua adalah *eksplanasi* (explanation) atau inferensi kausal. Analisis regresi memungkinkan kita mengidentifikasi variabel-variabel mana yang secara signifikan memengaruhi variabel dependen, dan mengukur kekuatan pengaruh masing-masing. Misalnya, seorang ekonom mungkin ingin mengetahui seberapa besar pengaruh tingkat pendidikan terhadap pendapatan, setelah mengontrol faktor-faktor lain seperti pengalaman kerja dan jenis industri.

Tujuan ketiga adalah *kontrol* (control). Dengan memahami hubungan antar variabel, kita dapat menentukan bagaimana mengubah variabel independen untuk mencapai nilai variabel dependen yang diinginkan. Dalam konteks engineering, misalnya, seorang insinyur dapat menggunakan model regresi untuk menentukan suhu dan tekanan optimal dalam suatu proses produksi agar kualitas produk mencapai standar tertentu.

=== Contoh Penerapan

Sebuah perusahaan e-commerce ingin memprediksi total belanja pelanggan per bulan. Departemen data science perusahaan mengumpulkan data historis tentang jumlah sesi kunjungan pelanggan ke aplikasi dan total belanja mereka. Menggunakan analisis regresi linear sederhana, mereka memodelkan:

$ "Total_Belanja" = a + b dot "Jumlah_Kunjungan" $

di mana $a$ adalah baseline belanja dan $b$ adalah tambahan belanja per kunjungan. Model yang dihasilkan kemudian digunakan untuk mengalokasikan anggaran pemasaran: pelanggan dengan prediksi belanja tinggi diberikan penawaran eksklusif, sementara pelanggan dengan prediksi rendah diberikan insentif tambahan untuk meningkatkan keterlibatan mereka.

#v(0.5em)

// ── Soal 13 ─────────────────────────────────────────────────

== Soal 13
Jelaskan perbedaan antara *variabel dependen (terikat)* dan *variabel independen (bebas)*. Dalam studi yang meneliti pengaruh lama belajar terhadap nilai ujian mahasiswa, variabel manakah yang menjadi dependen dan independen?

== Jawaban 13

=== Variabel Dependen (Terikat)

Variabel dependen, juga disebut variabel respons atau variabel terikat, adalah variabel yang nilainya ingin kita jelaskan atau prediksi dalam suatu studi. Variabel ini "bergantung" pada variabel lain dalam arti bahwa perubahannya merupakan respons terhadap perubahan variabel independen. Dalam notasi regresi, variabel dependen biasa dinotasikan sebagai $Y$ dan ditempatkan di sisi kiri persamaan.

Ciri utama variabel dependen adalah bahwa nilainya tidak dikontrol langsung oleh peneliti dalam desain observasional, melainkan muncul sebagai akibat (outcome) dari variabel-variabel independen. Variabel dependen adalah fokus utama penelitian, yaitu variabel yang variasinya ingin kita pahami.

=== Variabel Independen (Bebas)

Variabel independen, juga disebut variabel prediktor atau variabel bebas, adalah variabel yang diduga memengaruhi atau menjelaskan variasi pada variabel dependen. Dalam notasi regresi, variabel independen biasa dinotasikan sebagai $X$ (untuk regresi sederhana) atau $X_1, X_2, ..., X_k$ (untuk regresi berganda) dan ditempatkan di sisi kanan persamaan.

Ciri utama variabel independen adalah bahwa nilainya dapat dikontrol atau dimanipulasi oleh peneliti dalam desain eksperimental, atau setidaknya bersifat "diberikan" (given) dalam desain observasional. Dalam analisis regresi, kita menggunakan variabel independen sebagai "input" untuk memprediksi "output" (variabel dependen).

=== Aplikasi pada Studi

Dalam studi yang meneliti pengaruh lama belajar terhadap nilai ujian mahasiswa, kita perlu mengidentifikasi mana variabel yang berperan sebagai sebab dan mana yang berperan sebagai akibat.

Variabel dependen ($Y$) adalah *nilai ujian mahasiswa*. Alasan: nilai ujian merupakan hasil akhir yang ingin diprediksi atau dijelaskan. Nilai ujian dipengaruhi oleh berbagai faktor, dan dalam studi ini fokusnya adalah pada pengaruh lama belajar. Variasi nilai ujian antar mahasiswa adalah hal yang ingin kita pahami.

Variabel independen ($X$) adalah *lama belajar*. Alasan: lama belajar merupakan faktor yang diduga memengaruhi nilai ujian. Dalam konteks studi ini, lama belajar diperlakukan sebagai variabel yang "menjelaskan" mengapa nilai ujian berbeda-beda antar mahasiswa. Semakin lama belajar, diharapkan semakin tinggi nilai ujian.

Hubungan ini dapat dinyatakan secara fungsional sebagai:

$ "Nilai_Ujian" = f("Lama_Belajar") $

yang dalam regresi linear akan berbentuk $ "Nilai_Ujian" = a + b dot "Lama_Belajar" $.

#v(0.5em)

// ── Soal 14 ─────────────────────────────────────────────────

== Soal 14
Apa perbedaan antara *korelasi* dan *regresi*? Apakah dua variabel yang memiliki korelasi tinggi selalu menunjukkan hubungan sebab-akibat? Jelaskan.

== Jawaban 14

=== Perbedaan Korelasi dan Regresi

Meskipun korelasi dan regresi sama-sama berkaitan dengan hubungan antara dua variabel atau lebih, keduanya memiliki perbedaan mendasar dalam tujuan, sifat, dan output yang dihasilkan.

#table(
  columns: (auto, auto),
  stroke: 0.4pt,
  inset: 6pt,
  [*Korelasi*], [*Regresi*],
  [Mengukur kekuatan dan arah hubungan linear antara dua variabel.], [Memodelkan bentuk hubungan fungsional antara variabel-variabel untuk tujuan prediksi.],
  [Bersifat simetris: $r(X, Y) = r(Y, X)$. Tidak peduli mana yang dianggap $X$ dan mana $Y$.], [Bersifat asimetris: $Y$ diposisikan sebagai fungsi dari $X$. Menukar $X$ dan $Y$ menghasilkan model yang berbeda.],
  [Tidak membedakan antara variabel dependen dan independen.], [Secara eksplisit membedakan variabel dependen (respons, $Y$) dan variabel independen (prediktor, $X$).],
  [Menghasilkan koefisien korelasi ($r$) yang berkisar antara $-1$ sampai $+1$.], [Menghasilkan persamaan regresi ($Y = a + b X$) dan koefisien determinasi ($R^2$).],
)

Korelasi menjawab pertanyaan "seberapa erat dua variabel bergerak bersama", sedangkan regresi menjawab pertanyaan "bagaimana saya dapat memprediksi nilai satu variabel berdasarkan nilai variabel lainnya". Korelasi bersifat deskriptif dan eksploratif, sementara regresi bersifat prediktif dan eksplanatif.

=== Korelasi Tinggi Tidak Berarti Sebab-Akibat

Salah satu kesalahpahaman paling umum dalam statistika adalah mengartikan korelasi yang tinggi sebagai bukti adanya hubungan sebab-akibat. Jawaban tegasnya: *tidak*. Dua variabel yang memiliki korelasi tinggi tidak selalu memiliki hubungan sebab-akibat. Ada setidaknya tiga penjelasan alternatif mengapa dua variabel dapat berkorelasi tinggi tanpa hubungan kausal langsung.

Pertama, *korelasi semu* (spurious correlation). Ini adalah korelasi yang muncul secara kebetulan tanpa adanya hubungan nyata antara kedua variabel. Fenomena ini sering ditemukan pada data deret waktu (time series), di mana dua variabel sama-sama memiliki tren naik atau turun seiring waktu sehingga tampak berkorelasi. Contoh klasik yang sering dikutip adalah korelasi antara konsumsi keju per kapita di Amerika Serikat dengan jumlah orang yang meninggal karena terjerat seprai. Jelas tidak ada mekanisme kausal yang masuk akal di sini, tetapi data menunjukkan korelasi yang cukup tinggi.

Kedua, *variabel perancu* (confounding variable). Ini adalah variabel ketiga yang tidak terukur atau tidak dimasukkan dalam analisis, tetapi memengaruhi kedua variabel yang diamati secara bersamaan. Contoh yang sering digunakan: terdapat korelasi positif antara penjualan es krim dan jumlah kasus tenggelam di kolam renang. Apakah es krim menyebabkan orang tenggelam? Tentu tidak. Variabel perancunya adalah suhu udara atau musim panas. Saat musim panas, orang lebih banyak membeli es krim dan juga lebih banyak berenang, sehingga kedua variabel meningkat bersamaan tanpa hubungan kausal langsung.

Ketiga, *hubungan tidak langsung* (indirect relationship). Dalam kasus ini, variabel $X$ memang memengaruhi variabel $Y$, tetapi melalui variabel perantara $Z$, bukan secara langsung. Misalnya, $X$ (tingkat pendidikan) memengaruhi $Z$ (jenis pekerjaan), dan $Z$ memengaruhi $Y$ (pendapatan). Analisis korelasi langsung antara $X$ dan $Y$ akan menunjukkan hubungan yang kuat, tetapi mekanisme kausalnya lebih kompleks.

Untuk menyimpulkan adanya hubungan sebab-akibat, diperlukan bukti yang jauh lebih kuat dari sekadar korelasi. Setidaknya diperlukan: desain eksperimental yang terkontrol dengan baik (randomized controlled trial), kemampuan untuk mengontrol variabel-variabel perancu, urutan temporal yang jelas (sebab harus mendahului akibat), dan justifikasi teoretis yang masuk akal tentang mekanisme kausal yang menghubungkan kedua variabel.

#v(0.5em)

// ── Soal 15 ─────────────────────────────────────────────────

== Soal 15
Jelaskan makna dari persamaan regresi linear sederhana berikut:

$ Y = a + b X $

Apa arti parameter $a$ (intercept) dan $b$ (slope/koefisien regresi)?

== Jawaban 15

=== Persamaan Regresi Linear Sederhana

Persamaan $Y = a + b X$ adalah bentuk paling dasar dari model regresi linear, yang disebut regresi linear sederhana karena hanya melibatkan satu variabel independen ($X$) untuk memprediksi satu variabel dependen ($Y$). Persamaan ini merepresentasikan sebuah garis lurus pada bidang Kartesius, di mana $X$ adalah koordinat horizontal, $Y$ adalah koordinat vertikal, $a$ adalah titik potong garis dengan sumbu $Y$, dan $b$ adalah kemiringan (slope) garis tersebut.

Dalam konteks statistika, persamaan ini bukan sekadar persamaan garis biasa. Persamaan ini adalah model yang diestimasi dari data menggunakan metode kuadrat terkecil (ordinary least squares, OLS), yang bertujuan meminimalkan jumlah kuadrat selisih antara nilai aktual $Y$ dan nilai prediksi dari model. Dengan kata lain, garis $Y = a + b X$ adalah "garis terbaik" yang melewati titik-titik data.

=== Parameter $a$: Intercept (Intersep)

Parameter $a$ disebut intercept atau intersep. Secara geometris, $a$ adalah titik di mana garis regresi memotong sumbu $Y$, yaitu nilai $Y$ ketika $X = 0$. Secara matematis:

$ a = Y " ketika " X = 0 $

Dalam konteks statistika, $a$ diinterpretasikan sebagai nilai prediksi variabel dependen $Y$ ketika seluruh variabel independen bernilai nol. Interpretasi ini perlu dilakukan dengan hati-hati, karena ada kalanya nilai $X = 0$ tidak masuk akal dalam konteks data yang dianalisis. Sebagai contoh, jika $X$ adalah tinggi badan seseorang dalam sentimeter, maka $X = 0$ berarti tinggi badan nol, yang secara biologis tidak mungkin. Dalam kasus seperti ini, $a$ hanya bermakna sebagai konstanta matematis yang mengatur posisi garis regresi, tanpa interpretasi praktis yang berarti.

=== Parameter $b$: Slope (Koefisien Regresi)

Parameter $b$ disebut slope, kemiringan, atau koefisien regresi. Parameter ini mengukur perubahan pada variabel dependen $Y$ untuk setiap kenaikan satu satuan pada variabel independen $X$, dengan asumsi semua faktor lain konstan. Secara matematis:

$ b = (Delta Y) / (Delta X) $

Interpretasi $b$ sangat bergantung pada tandanya. Jika $b > 0$, maka terdapat hubungan positif: setiap kenaikan satu satuan $X$ dikaitkan dengan kenaikan $Y$ sebesar $b$ satuan. Jika $b < 0$, maka terdapat hubungan negatif: setiap kenaikan satu satuan $X$ dikaitkan dengan penurunan $Y$ sebesar $|b|$ satuan. Besaran $b$ menunjukkan kekuatan pengaruh $X$ terhadap $Y$: semakin besar nilai absolut $b$, semakin besar perubahan $Y$ untuk setiap perubahan satu satuan $X$.

#v(0.5em)

// ── Soal 16 ─────────────────────────────────────────────────

== Soal 16
Diketahui hasil regresi:

$ "Nilai_Ujian" = 45 + 3{,}5 times "Lama_Belajar" $

Bagaimana Anda menginterpretasikan angka *45* dan *3,5* dalam konteks penelitian tersebut?

== Jawaban 16

=== Identifikasi Komponen

Sebelum menginterpretasikan, kita identifikasi terlebih dahulu komponen-komponen model regresi yang diberikan. Variabel dependen ($Y$) adalah Nilai_Ujian, yaitu skor yang diperoleh mahasiswa dalam ujian. Variabel independen ($X$) adalah Lama_Belajar, yang dalam konteks ini diasumsikan diukur dalam satuan jam. Dari persamaan tersebut, kita dapat melihat bahwa $a$ (intercept) adalah 45 dan $b$ (koefisien regresi) adalah 3,5.

=== Interpretasi $a = 45$

Angka 45 merupakan intercept dari model regresi. Interpretasi: jika seorang mahasiswa tidak belajar sama sekali, atau Lama_Belajar = 0 jam, maka nilai ujian yang diprediksi oleh model adalah 45 poin. Nilai 45 ini dapat dipandang sebagai "nilai dasar" (baseline) yang mencerminkan pengetahuan awal atau kemampuan bawaan mahasiswa sebelum adanya kontribusi dari kegiatan belajar. Dengan kata lain, model memperkirakan bahwa seorang mahasiswa akan memperoleh setidaknya nilai 45 bahkan tanpa belajar, mungkin karena pemahaman dasar yang sudah dimiliki dari perkuliahan, intuisi, atau faktor lainnya.

=== Interpretasi $b = 3,5$

Angka 3,5 merupakan koefisien regresi (slope). Interpretasi: setiap penambahan 1 jam waktu belajar dikaitkan dengan kenaikan nilai ujian sebesar 3,5 poin, dengan asumsi semua faktor lain dianggap konstan. Ini menunjukkan hubungan positif antara lama belajar dan nilai ujian: semakin lama seorang mahasiswa belajar, semakin tinggi nilai ujian yang diprediksi.

Untuk memberikan gambaran yang lebih konkret, kita dapat menghitung prediksi untuk beberapa skenario. Jika seorang mahasiswa belajar selama 4 jam, maka:

$ "Nilai_Ujian" = 45 + 3,5 dot 4 = 45 + 14 = 59 $

Jika mahasiswa lain belajar selama 10 jam:

$ "Nilai_Ujian" = 45 + 3,5 dot 10 = 45 + 35 = 80 $

Perhatikan bahwa selisih prediksi antara mahasiswa yang belajar 4 jam dan 10 jam adalah $80 - 59 = 21$ poin, yang konsisten dengan koefisien $3,5$ dikali selisih jam belajar $6$, yaitu $3,5 times 6 = 21$.

#v(0.5em)

// ── Soal 17 ─────────────────────────────────────────────────

== Soal 17
Jika diperoleh model regresi:

$ Y = 20 + 5X $

Berapakah nilai prediksi $Y$ ketika $X = 8$? Jelaskan langkah perhitungannya.

== Jawaban 17

=== Rumus

Model regresi yang diberikan adalah $Y = 20 + 5X$. Ini adalah persamaan regresi linear sederhana dengan intercept $a = 20$ dan koefisien regresi $b = 5$. Untuk memperoleh nilai prediksi $Y$ pada suatu nilai $X$ tertentu, kita cukup mensubstitusikan nilai $X$ tersebut ke dalam persamaan model.

=== Langkah Perhitungan

Substitusikan $X = 8$ ke dalam persamaan regresi. Langkah perhitungannya adalah sebagai berikut.

Pertama, tuliskan persamaan model dengan nilai $X$ yang diketahui:

$ Y = 20 + 5 dot X = 20 + 5 dot 8 $

Kedua, lakukan operasi perkalian terlebih dahulu sesuai dengan kaidah urutan operasi matematika. Kalikan koefisien regresi 5 dengan nilai $X = 8$:

$ 5 dot 8 = 40 $

Ketiga, jumlahkan hasil perkalian dengan intercept:

$ Y = 20 + 40 = 60 $

Sehingga diperoleh:

$
Y &= 20 + 5 dot X \
  &= 20 + 5 dot 8 \
  &= 20 + 40 \
  &= 60
$

=== Hasil

$ therefore $ Nilai prediksi $Y$ ketika $X = 8$ adalah *60*.

Interpretasi: berdasarkan model regresi yang diberikan, jika variabel independen $X$ bernilai 8 satuan, maka nilai yang diprediksi untuk variabel dependen $Y$ adalah 60 satuan. Ini adalah prediksi titik (point estimate) yang dihasilkan oleh model untuk input tersebut.

#v(0.5em)

// ── Soal 18 ─────────────────────────────────────────────────

== Soal 18
Apa yang dimaksud dengan *koefisien determinasi* ($R^2$)? Jika suatu model memiliki nilai $R^2 = 0{,}85$, bagaimana interpretasinya?

== Jawaban 18

=== Definisi $R^2$

Koefisien determinasi, yang dinotasikan sebagai $R^2$ (dibaca "R-squared"), adalah ukuran statistik yang menunjukkan proporsi atau persentase variasi total pada variabel dependen ($Y$) yang dapat dijelaskan oleh variabel-variabel independen dalam model regresi. Dengan kata lain, $R^2$ mengukur seberapa baik model regresi "menangkap" pola dalam data.

Secara matematis, $R^2$ didefinisikan sebagai rasio antara variasi yang dijelaskan oleh model (Sum of Squares Regression, SSR) dengan variasi total pada $Y$ (Sum of Squares Total, SST):

$ R^2 = ("SSR") / ("SST") = 1 - ("SSE") / ("SST") $

di mana:

+ SSR (Sum of Squares Regression) adalah jumlah kuadrat selisih antara nilai prediksi model dan rata-rata $Y$. Ini adalah variasi yang berhasil dijelaskan oleh model regresi.
+ SSE (Sum of Squares Error) adalah jumlah kuadrat residual, yaitu selisih antara nilai aktual $Y$ dan nilai prediksi model. Ini adalah variasi yang tidak dapat dijelaskan oleh model.
+ SST (Sum of Squares Total) adalah jumlah kuadrat selisih antara nilai aktual $Y$ dan rata-ratanya. SST $=$ SSR $+$ SSE, yang berarti total variasi pada $Y$ terurai menjadi bagian yang dijelaskan model dan bagian yang tidak.

Nilai $R^2$ selalu berkisar antara 0 dan 1. $R^2 = 0$ berarti model regresi sama sekali tidak menjelaskan variasi pada $Y$ (garis regresi horizontal pada nilai rata-rata $Y$). $R^2 = 1$ berarti model menjelaskan seluruh variasi pada $Y$ secara sempurna (semua titik data tepat berada pada garis regresi). Dalam praktiknya, nilai $R^2$ jarang mencapai 0 atau 1 secara ekstrem.

=== Interpretasi $R^2 = 0,85$

Jika suatu model regresi memiliki $R^2 = 0,85$, interpretasinya adalah sebagai berikut: *85% dari variasi (naik-turunnya) pada variabel dependen $Y$ dapat dijelaskan oleh variabel-variabel independen yang ada dalam model*. Dengan kata lain, model regresi mampu menangkap 85% dari pola yang ada dalam data.

Sisa 15% variasi pada $Y$ dijelaskan oleh faktor-faktor lain yang tidak dimasukkan ke dalam model, atau oleh galat acak (random error) yang tidak dapat dijelaskan secara sistematis oleh variabel independen manapun.

Secara umum, $R^2 = 0,85$ menunjukkan bahwa model memiliki kecocokan (goodness of fit) yang cukup baik. Model mampu menjelaskan sebagian besar variasi data, meskipun belum sempurna. Namun perlu diingat bahwa $R^2$ yang tinggi tidak selalu berarti model baik, terutama jika model mengalami overfitting terhadap data pelatihan (seperti yang dibahas pada Soal 22). Evaluasi model yang komprehensif memerlukan lebih dari sekadar melihat nilai $R^2$.

#v(0.5em)

// ── Soal 19 ─────────────────────────────────────────────────

== Soal 19
Sebutkan dan jelaskan minimal *empat asumsi penting* dalam regresi linear. Apa konsekuensinya jika salah satu asumsi tersebut dilanggar?

== Jawaban 19

=== Empat Asumsi Regresi Linear

Regresi linear, seperti halnya metode statistika parametrik lainnya, dibangun di atas serangkaian asumsi yang harus dipenuhi agar hasil estimasi dan inferensi yang dihasilkan valid. Berikut adalah empat asumsi utama beserta penjelasan dan konsekuensi pelanggarannya.

==== 1. Linearitas (Linearity)

Asumsi linearitas mensyaratkan bahwa hubungan antara variabel dependen $Y$ dan variabel independen $X$ bersifat linear dalam parameter. Artinya, nilai rata-rata $Y$ untuk setiap nilai $X$ terletak pada suatu garis lurus. Model regresi linear mengasumsikan bahwa perubahan pada $X$ menghasilkan perubahan yang proporsional pada $Y$.

Konsekuensi pelanggaran: jika hubungan sebenarnya tidak linear tetapi dimodelkan dengan regresi linear, model akan menghasilkan estimasi yang bias secara sistematis. Model tidak mampu menangkap pola data yang sebenarnya, sehingga prediksi menjadi tidak akurat dan koefisien regresi tidak mencerminkan hubungan yang sesungguhnya. Pelanggaran linearitas sering kali dapat dideteksi melalui plot residual versus nilai prediksi: jika plot menunjukkan pola sistematis (misalnya melengkung), maka asumsi linearitas mungkin dilanggar.

==== 2. Independensi Residual (Independence)

Asumsi independensi mensyaratkan bahwa residual (galat) dari satu observasi tidak berkorelasi dengan residual dari observasi lainnya. Setiap observasi memberikan informasi yang independen, tidak dipengaruhi oleh observasi sebelum atau sesudahnya. Asumsi ini sangat penting untuk data yang dikumpulkan dalam urutan waktu (time series) atau data yang memiliki struktur pengelompokan.

Konsekuensi pelanggaran: jika residual berkorelasi (autokorelasi), standard error dari koefisien regresi menjadi bias, biasanya terlalu kecil (underestimated). Akibatnya, uji signifikansi seperti $t$-test dan $F$-test menjadi tidak valid. Kita bisa salah menyimpulkan bahwa suatu variabel independen signifikan memengaruhi $Y$, padahal sebenarnya tidak. Interval kepercayaan juga menjadi terlalu sempit, memberikan rasa presisi yang palsu.

==== 3. Homoskedastisitas (Homoscedasticity)

Asumsi homoskedastisitas mensyaratkan bahwa varians residual bersifat konstan di seluruh rentang nilai prediksi. Dengan kata lain, sebaran residual harus sama lebarnya untuk nilai $X$ yang rendah maupun yang tinggi. Plot residual versus nilai prediksi seharusnya menunjukkan "awan titik" yang lebarnya seragam dari kiri ke kanan.

Konsekuensi pelanggaran (heteroskedastisitas): jika varians residual tidak konstan, standard error koefisien regresi menjadi bias. Estimasi koefisien regresi sendiri masih tetap tidak bias (unbiased), tetapi uji hipotesis dan selang kepercayaan menjadi tidak dapat diandalkan karena standard error yang digunakan tidak akurat. Heteroskedastisitas sering muncul pada data cross-sectional, terutama ketika variabel dependen memiliki rentang nilai yang lebar.

==== 4. Normalitas Residual (Normality)

Asumsi normalitas mensyaratkan bahwa residual (galat) model berdistribusi normal dengan rata-rata nol. Perlu dicatat bahwa asumsi ini adalah tentang distribusi residual, bukan distribusi variabel dependen $Y$ itu sendiri. Asumsi normalitas terutama penting untuk sampel dengan ukuran kecil.

Konsekuensi pelanggaran: untuk sampel kecil ($n < 30$), uji $t$ dan uji $F$ mengasumsikan normalitas residual. Jika asumsi ini dilanggar, hasil uji signifikansi menjadi tidak valid. Namun, berkat Teorema Limit Pusat, untuk sampel yang cukup besar ($n >= 30$), distribusi sampling dari koefisien regresi akan mendekati normal meskipun residualnya sendiri tidak normal. Dengan demikian, pelanggaran normalitas kurang kritis untuk sampel besar.

=== Asumsi Tambahan: Multikolinearitas (untuk Regresi Berganda)

Untuk regresi linear berganda, terdapat asumsi tambahan bahwa tidak ada multikolinearitas sempurna di antara variabel-variabel independen. Artinya, tidak ada satu pun variabel independen yang merupakan kombinasi linear sempurna dari variabel independen lainnya. Pelanggaran asumsi ini menyebabkan koefisien regresi menjadi tidak stabil (varians sangat besar) dan tidak dapat diestimasi secara unik.

#v(0.5em)

// ── Soal 20 ─────────────────────────────────────────────────

== Soal 20
Apa perbedaan antara *regresi linear sederhana* dan *regresi linear berganda*? Berikan contoh kasus yang lebih tepat diselesaikan menggunakan regresi linear berganda.

== Jawaban 20

=== Regresi Linear Sederhana

Regresi linear sederhana adalah bentuk regresi yang hanya melibatkan satu variabel independen ($X$) untuk memprediksi satu variabel dependen ($Y$). Modelnya berbentuk $Y = a + b X$, yang merupakan persamaan garis lurus pada bidang dua dimensi. Karena hanya ada dua variabel, hubungan antara $X$ dan $Y$ mudah divisualisasikan dalam grafik scatter plot dengan garis regresi yang melintas di antaranya.

Keterbatasan utama regresi linear sederhana adalah bahwa ia tidak dapat mengontrol pengaruh variabel-variabel lain yang mungkin juga memengaruhi $Y$. Jika variabel $Y$ sebenarnya dipengaruhi oleh banyak faktor, tetapi kita hanya memasukkan satu faktor ke dalam model, maka estimasi pengaruh faktor tersebut akan mengandung bias karena mengabaikan faktor-faktor lain yang berkorelasi dengannya (omitted variable bias).

=== Regresi Linear Berganda

Regresi linear berganda adalah perluasan dari regresi sederhana yang melibatkan dua atau lebih variabel independen ($X_1, X_2, ..., X_k$) untuk memprediksi satu variabel dependen ($Y$). Modelnya berbentuk:

$ Y = a + b_1 X_1 + b_2 X_2 + ... + b_k X_k $

Keunggulan utama regresi berganda adalah kemampuannya untuk mengukur pengaruh parsial (partial effect) dari masing-masing variabel independen, yaitu pengaruh satu variabel independen terhadap $Y$ dengan mengontrol (menjaga konstan) variabel-variabel independen lainnya. Ini memungkinkan peneliti untuk mengisolasi pengaruh masing-masing faktor.

Karena melibatkan lebih dari dua dimensi, hubungan dalam regresi berganda tidak dapat divisualisasikan secara sederhana dalam grafik dua dimensi. Namun, kemampuan analitisnya jauh lebih kaya.

=== Tabel Perbandingan

#table(
  columns: (auto, auto),
  stroke: 0.4pt,
  inset: 6pt,
  [*Regresi Linear Sederhana*], [*Regresi Linear Berganda*],
  [1 variabel independen ($X$).], [$>= 2$ variabel independen ($X_1$, ..., $X_k$).],
  [$Y = a + b X$.], [$Y = a + b_1 X_1 + ... + b_k X_k$.],
  [Mudah divisualisasikan dalam grafik 2D.], [Tidak dapat divisualisasikan secara sederhana (dimensi tinggi).],
  [Tidak dapat mengontrol variabel perancu.], [Dapat mengontrol variabel perancu melalui efek parsial.],
)

=== Contoh Kasus untuk Regresi Berganda

Misalkan kita ingin memprediksi harga rumah di suatu kota. Jika hanya menggunakan regresi linear sederhana dengan satu prediktor, misalnya luas bangunan saja, model akan mengabaikan banyak faktor penting lainnya yang juga memengaruhi harga. Akibatnya, prediksi menjadi kurang akurat dan koefisien luas bangunan mungkin menangkap pengaruh dari faktor-faktor yang tidak dimasukkan.

Pendekatan yang lebih tepat adalah menggunakan regresi linear berganda dengan beberapa variabel independen:

+ $X_1$: luas bangunan ($m^2$).
+ $X_2$: jumlah kamar tidur.
+ $X_3$: jarak ke pusat kota (km).
+ $X_4$: usia bangunan (tahun).

Dengan regresi berganda, kita dapat menjawab pertanyaan seperti: "Berapa kenaikan harga rumah untuk setiap tambahan $1 m^2$ luas bangunan, dengan asumsi jumlah kamar, jarak ke pusat kota, dan usia bangunan dijaga konstan?" Koefisien $b_1$ dalam model akan memberikan estimasi pengaruh parsial tersebut. Kemampuan mengontrol variabel lain inilah yang membuat regresi berganda lebih unggul untuk kasus-kasus di mana variabel dependen dipengaruhi oleh banyak faktor sekaligus.

#v(0.5em)

// ── Soal 21 ─────────────────────────────────────────────────

== Soal 21
Sebuah universitas ingin memprediksi IPK mahasiswa berdasarkan jumlah jam belajar per minggu, tingkat kehadiran kuliah, dan nilai ujian masuk. Bagaimana Anda merancang model regresi untuk kasus tersebut? Jelaskan:

- Variabel dependen
- Variabel independen
- Jenis regresi yang digunakan
- Cara mengevaluasi kualitas model

== Jawaban 21

=== Variabel Dependen ($Y$)

Variabel dependen dalam kasus ini adalah *IPK (Indeks Prestasi Kumulatif)* mahasiswa. IPK merupakan variabel kontinu yang biasanya berkisar antara 0,00 hingga 4,00 (dalam sistem skala 4) dan menjadi ukuran ringkasan dari performa akademik mahasiswa selama masa studi. Inilah variabel yang ingin diprediksi oleh universitas.

=== Variabel Independen ($X_1, X_2, X_3$)

Terdapat tiga variabel independen yang akan digunakan sebagai prediktor:

+ $X_1$: *Jumlah jam belajar per minggu*. Ini adalah variabel numerik kontinu yang mengukur intensitas belajar mandiri mahasiswa di luar jam kuliah.
+ $X_2$: *Tingkat kehadiran kuliah* (dalam persentase). Ini adalah variabel numerik kontinu yang berkisar dari 0% sampai 100%, mencerminkan partisipasi mahasiswa dalam perkuliahan.
+ $X_3$: *Nilai ujian masuk*. Ini adalah variabel numerik kontinu yang mencerminkan kemampuan awal mahasiswa sebelum memasuki universitas, yang dapat menjadi prediktor kuat untuk performa akademik selanjutnya.

=== Jenis Regresi

Jenis regresi yang paling tepat untuk kasus ini adalah *regresi linear berganda* (multiple linear regression). Alasan pemilihan ini adalah karena terdapat lebih dari satu variabel independen (tiga prediktor) yang digunakan untuk memprediksi satu variabel dependen kontinu (IPK). Model yang akan diestimasi adalah:

$ "IPK" = a + b_1 dot "Jam_Belajar" + b_2 dot "Kehadiran" + b_3 dot "Nilai_Masuk" + epsilon $

Di sini, $a$ adalah intercept (IPK dasar ketika semua prediktor bernilai nol), $b_1$ adalah pengaruh parsial dari setiap tambahan satu jam belajar per minggu terhadap IPK, $b_2$ adalah pengaruh parsial dari setiap tambahan satu persen kehadiran, $b_3$ adalah pengaruh parsial dari setiap tambahan satu poin nilai ujian masuk, dan $epsilon$ adalah komponen galat yang mencakup faktor-faktor lain di luar model.

Setiap koefisien $b_i$ mengukur pengaruh parsial: seberapa besar perubahan IPK yang dikaitkan dengan perubahan satu satuan pada variabel independen tersebut, dengan asumsi variabel independen lainnya dijaga konstan.

=== Cara Mengevaluasi Kualitas Model

Setelah model diestimasi menggunakan data historis mahasiswa, kualitas model perlu dievaluasi secara komprehensif menggunakan beberapa metrik dan prosedur berikut.

1. *Koefisien Determinasi ($R^2$).* $R^2$ mengukur proporsi variasi IPK yang dapat dijelaskan secara bersama-sama oleh ketiga prediktor. Nilai $R^2$ yang mendekati 1 menunjukkan bahwa model sangat baik dalam menjelaskan variasi IPK antar mahasiswa.

2. *Adjusted $R^2$.* Tidak seperti $R^2$ biasa, adjusted $R^2$ memberikan penalti untuk setiap penambahan variabel independen ke dalam model. Ini penting karena $R^2$ akan selalu naik ketika kita menambah variabel, meskipun variabel tersebut sebenarnya tidak relevan. Adjusted $R^2$ hanya akan naik jika variabel yang ditambahkan benar-benar memberikan kontribusi yang berarti.

3. *Uji Signifikansi Parsial ($t$-test).* Uji $t$ digunakan untuk menguji apakah masing-masing variabel independen secara individual memiliki pengaruh yang signifikan terhadap IPK. Hipotesis nolnya adalah $H_0: b_i = 0$ (variabel tersebut tidak berpengaruh). Jika p-value $< 0,05$ (pada tingkat signifikansi 5%), kita menolak $H_0$ dan menyimpulkan bahwa variabel tersebut signifikan.

4. *Uji Signifikansi Simultan ($F$-test).* Uji $F$ menguji apakah seluruh variabel independen secara bersama-sama memiliki pengaruh yang signifikan terhadap IPK. Hipotesis nolnya adalah $H_0: b_1 = b_2 = b_3 = 0$ (tidak ada satupun variabel yang berpengaruh). Jika p-value uji $F < 0,05$, kita menyimpulkan bahwa model secara keseluruhan signifikan.

5. *Analisis Residual.* Ini adalah serangkaian pemeriksaan diagnostik untuk memverifikasi bahwa asumsi-asumsi regresi linear terpenuhi. Plot residual versus nilai prediksi digunakan untuk mendeteksi pelanggaran linearitas dan homoskedastisitas. Q-Q plot residual digunakan untuk memeriksa normalitas. Uji Durbin-Watson dapat digunakan untuk mendeteksi autokorelasi pada residual. Jika asumsi dilanggar, model mungkin perlu disesuaikan atau ditransformasi.

6. *Root Mean Square Error (RMSE) dan Mean Absolute Error (MAE).* Kedua metrik ini mengukur rata-rata besarnya kesalahan prediksi model dalam satuan asli IPK. RMSE memberikan penalti lebih besar pada kesalahan yang besar (karena mengkuadratkan), sedangkan MAE mengukur rata-rata absolut kesalahan. Semakin kecil nilai RMSE dan MAE, semakin akurat model dalam memprediksi IPK.

#v(0.5em)

// ── Soal 22 ─────────────────────────────────────────────────

== Soal 22
Sebuah model regresi menghasilkan nilai $R^2$ yang tinggi (0,95), tetapi prediksi pada data baru menunjukkan kesalahan yang besar. Mengapa hal tersebut dapat terjadi? Jelaskan kaitannya dengan fenomena *overfitting*.

== Jawaban 22

=== Mengapa $R^2$ Tinggi Tetapi Prediksi Buruk?

Fenomena di mana model regresi memiliki $R^2$ yang sangat tinggi pada data pelatihan namun menghasilkan prediksi yang buruk pada data baru merupakan indikasi klasik dari masalah *overfitting*. Overfitting terjadi ketika model terlalu "pas" atau terlalu menyesuaikan diri dengan data pelatihan, sehingga ia mempelajari bukan hanya pola yang sebenarnya (signal), tetapi juga noise, fluktuasi acak, dan keunikan spesifik dari data pelatihan yang tidak berlaku umum untuk data di luar sampel.

Bayangkan sebuah model yang sangat kompleks, misalnya polinomial derajat tinggi, yang dicocokkan pada sekumpulan titik data. Model tersebut mungkin dapat melewati setiap titik data dengan sempurna, menghasilkan $R^2$ mendekati 1 pada data pelatihan. Namun, karena model "menghafal" setiap titik alih-alih "memahami" pola yang mendasarinya, ketika dihadapkan pada data baru yang belum pernah dilihatnya, model menghasilkan prediksi yang sangat tidak akurat. Inilah paradoks overfitting: performa sangat baik pada data pelatihan, tetapi gagal menggeneralisasi.

=== Overfitting: Penjelasan

Overfitting adalah kondisi di mana model terlalu kompleks relatif terhadap jumlah data yang tersedia. Model memiliki terlalu banyak parameter (derajat kebebasan) sehingga mampu "menghafal" data pelatihan, tetapi kehilangan kemampuan untuk menangkap pola general yang berlaku pada populasi.

Ciri-ciri model yang mengalami overfitting meliputi:

+ $R^2$ pada data pelatihan sangat tinggi, seringkali mendekati 1.
+ $R^2$ pada data validasi atau data uji jauh lebih rendah, menunjukkan bahwa model tidak mampu menggeneralisasi.
+ Error prediksi (selisih antara nilai prediksi dan nilai aktual) pada data baru sangat besar.
+ Koefisien regresi cenderung memiliki nilai absolut yang besar dan standard error yang besar, menandakan ketidakstabilan estimasi.

=== Ilustrasi Konseptual

Untuk memahami overfitting secara intuitif, bayangkan kita memiliki sekumpulan titik data dan mencoba mencocokkan kurva.

+ *Underfitting:* kita menggunakan model yang terlalu sederhana, misalnya garis lurus untuk data yang sebenarnya melengkung. Model tidak mampu menangkap pola data, sehingga error besar terjadi di mana-mana, baik pada data pelatihan maupun data uji.

+ *Good fit:* kita menggunakan model dengan kompleksitas yang tepat. Kurva menangkap pola utama dalam data tanpa mengikuti fluktuasi acak. Error kecil baik pada data pelatihan maupun data uji.

+ *Overfitting:* kita menggunakan model yang terlalu kompleks, misalnya polinomial derajat 15 untuk 20 titik data. Kurva bergelombang liar, melewati setiap titik data pelatihan dengan sempurna, sehingga error pelatihan sangat kecil atau bahkan nol. Namun, di antara titik-titik data, kurva berosilasi secara tidak wajar. Ketika titik data baru diambil dari populasi yang sama, titik tersebut kemungkinan besar tidak berada pada kurva yang bergelombang liar itu, sehingga error prediksi menjadi sangat besar.

=== Penyebab Umum Overfitting

Beberapa penyebab umum overfitting dalam regresi meliputi:

+ Terlalu banyak variabel independen relatif terhadap jumlah observasi (rasio $k:n$ yang tinggi). Semakin banyak prediktor, semakin besar fleksibilitas model untuk "menghafal" data.
+ Menggunakan model polinomial dengan derajat yang terlalu tinggi tanpa regularisasi.
+ Adanya pencilan (outlier) yang secara tidak proporsional "menarik" model menjauh dari pola mayoritas data.
+ Data pelatihan terlalu sedikit dan tidak representatif terhadap populasi yang sebenarnya.

=== Cara Mengatasi Overfitting

Beberapa strategi untuk mengatasi atau mencegah overfitting:

+ *Regularisasi:* menambahkan penalti pada kompleksitas model dalam fungsi objektif. Ridge regression (regularisasi L2) dan Lasso regression (regularisasi L1) adalah dua teknik regularisasi yang umum digunakan. Regularisasi mendorong koefisien regresi untuk menyusut (shrink) mendekati nol, sehingga mengurangi kompleksitas efektif model.
+ *Cross-validation:* teknik validasi di mana data dibagi menjadi beberapa lipatan (folds). Model dilatih pada sebagian lipatan dan divalidasi pada lipatan yang tersisa. Proses ini diulang untuk setiap lipatan, dan performa dirata-ratakan. Teknik yang umum adalah $k$-fold cross-validation, misalnya 5-fold atau 10-fold.
+ *Menambah jumlah data pelatihan:* lebih banyak observasi memberikan lebih banyak informasi kepada model tentang pola yang sebenarnya, mengurangi risiko overfitting terhadap fluktuasi acak.
+ *Seleksi fitur (feature selection):* hanya memasukkan variabel independen yang benar-benar relevan dan memiliki justifikasi teoretis. Teknik seperti backward elimination, forward selection, atau stepwise regression dapat membantu memilih subset prediktor yang optimal.
+ *Early stopping:* untuk model yang dilatih secara iteratif (seperti gradient boosting atau neural network), pelatihan dapat dihentikan sebelum model mulai overfit, yaitu ketika error pada data validasi mulai meningkat meskipun error pada data pelatihan masih menurun.

// ══════════════════════════════════════════════════════════════
// RANGKUMAN JAWABAN (untuk dosen quick-review)
// ══════════════════════════════════════════════════════════════

#pagebreak()
#align(center)[#text(weight: "bold", size: 13pt)[RANGKUMAN JAWABAN]]
#v(0.5em)

#table(
  columns: (3em, auto, auto),
  stroke: 0.4pt,
  inset: 5pt,
  align: (center, left, left),
  [*No*], [*Konsep Kunci*], [*Jawaban Ringkas*],
  [1], [Definisi distribusi probabilitas], [Fungsi yang memetakan setiap nilai variabel acak ke peluangnya. Syarat: $0 <= P(X=x) <= 1$ dan $sum P(X=x) = 1$. Fondasi inferensi, uji hipotesis, dan keputusan di bawah ketidakpastian.],
  [2], [Diskrit vs. kontinu], [Diskrit: nilai terhitung, $P(X=x) > 0$, PMF (cth: jumlah anak). Kontinu: nilai dalam interval, $P(X=x) = 0$, PDF (cth: tinggi badan).],
  [3], [Distribusi dadu], [Uniform diskrit: ruang sampel $S = {1, ..., 6}$, $P(X=x) = 1/6$ untuk setiap $x$. Verifikasi: $6 times 1/6 = 1$.],
  [4], [Nilai harapan], [$E["Hadiah"] = "Rp10.000"(0,5) + "Rp20.000"(0,5) = "Rp15.000"$. Jangka panjang: rata-rata Rp15.000 per lemparan.],
  [5], [$E[X]$, $"Var"(X)$, $sigma$], [$E[X]$: pusat distribusi (rata-rata tertimbang). $"Var"(X)$: sebaran kuadrat, $E[(X-mu)^2]$. $sigma$: akar $"Var"$, satuan sama dengan asli. Varians diperlukan karena dua distribusi bisa punya $E[X]$ sama tapi risiko berbeda.],
  [6], [Binomial, $n=20$, $p=0,05$], [$P(X=2) = C(20,2)(0,05)^2(0,95)^18 = 190 dot 0,0025 dot 0,3972 approx 0,1887$ (18,87%).],
  [7], [Poisson, $lambda=4$], [$P(X=6) = (4^6 dot e^(-4)) / 6! = (4096 dot 0,01832) / 720 approx 0,1042$ (10,42%).],
  [8], [Distribusi normal], [Distribusi terpenting: (1) CLT menjamin normalitas sampling untuk $n >= 30$, (2) banyak fenomena alami normal, (3) fondasi uji-$t$, ANOVA, regresi. Karakteristik: lonceng simetris, aturan 68-95-99,7, dua parameter ($mu$, $sigma$).],
  [9], [Pencocokan distribusi], [a. Poisson (counting process), b. Normal (banyak faktor independen, CLT), c. Binomial ($n=10$, $p=0,5$), d. Eksponensial (waktu antar kejadian Poisson).],
  [10], [Z-score, $mu=70$, $sigma=10$], [$Z = (90-70)/10 = 2,0$. Mahasiswa di persentil $approx 97,7$, mengungguli 97,7% peserta.],
  [11], [Distribusi dalam AI/ML], [Landasan teoretis (Naive Bayes, regresi linear), evaluasi ketidakpastian (confidence level), generative AI (GAN, VAE, diffusion), feature engineering. Contoh: Naive Bayes klasifikasi spam.],
  [12], [Definisi regresi], [Metode memodelkan hubungan $Y$ (dependen) dan $X$ (independen). Tujuan: prediksi, eksplanasi, kontrol. Contoh: prediksi belanja dari kunjungan aplikasi e-commerce.],
  [13], [Dependen vs. independen], [Dependen ($Y$): variabel yang diprediksi/dipengaruhi. Independen ($X$): prediktor. Studi belajar $arrow$ nilai: $Y$ = nilai ujian, $X$ = lama belajar.],
  [14], [Korelasi vs. regresi], [Korelasi: simetris, mengukur kekuatan hubungan linear ($r$). Regresi: asimetris, memodelkan $Y = f(X)$ untuk prediksi. Korelasi tinggi $!=$ kausalitas (spurious, confounding, hubungan tidak langsung).],
  [15], [Parameter $a$ dan $b$], [$a$ (intercept): nilai $Y$ saat $X=0$. $b$ (slope): perubahan $Y$ per satuan $X$; $b>0$ positif, $b<0$ negatif.],
  [16], [Interpretasi koefisien], [$a=45$: baseline nilai tanpa belajar. $b=3,5$: tiap +1 jam belajar $arrow$ +3,5 poin nilai. Contoh: belajar 4 jam $arrow$ nilai $45 + 3,5(4) = 59$.],
  [17], [Prediksi $X=8$], [$Y = 20 + 5(8) = 20 + 40 = 60$.],
  [18], [$R^2$], [Proporsi variasi $Y$ dijelaskan model. $R^2 = 0,85$: 85% variasi $Y$ dijelaskan prediktor, 15% dari faktor luar atau galat acak.],
  [19], [4 asumsi regresi], [Linearitas (bila dilanggar: bias sistematis), Independensi residual (SE bias, uji tidak valid), Homoskedastisitas (SE bias, CI tidak andal), Normalitas residual ($t$/$F$ tidak valid untuk $n<30$). Tambahan: multikolinearitas untuk regresi berganda.],
  [20], [Sederhana vs. berganda], [Sederhana: 1 prediktor. Berganda: $>=2$ prediktor, bisa kontrol perancu via efek parsial. Contoh: harga rumah dari luas, kamar, jarak, dan usia bangunan.],
  [21], [Rancangan model IPK], [Regresi linear berganda. $Y$ = IPK. $X_1$ = jam belajar, $X_2$ = kehadiran (%), $X_3$ = nilai masuk. Evaluasi: $R^2$, adjusted $R^2$, uji $t$, uji $F$, analisis residual, RMSE/MAE.],
  [22], [Overfitting], [$R^2$ tinggi di data latih tapi error besar di data baru = model menghafal noise, bukan belajar pola. Atasi: regularisasi (Ridge/Lasso), cross-validation, tambah data, seleksi fitur, early stopping.],
)

