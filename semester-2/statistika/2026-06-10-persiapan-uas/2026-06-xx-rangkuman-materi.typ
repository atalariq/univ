#set document(title: "Rangkuman Materi Statistika")
#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
)
#set text(font: "Times New Roman", size: 11pt, lang: "id")
#set par(justify: true, leading: 0.65em)
#show heading.where(level: 1): it => {
  v(1em)
  set text(size: 14pt, weight: "bold")
  it
  v(0.3em)
}
#show heading.where(level: 2): it => {
  v(0.7em)
  set text(size: 12pt, weight: "bold")
  it
  v(0.2em)
}
#show heading.where(level: 3): it => {
  v(0.5em)
  set text(size: 11pt, weight: "bold", style: "italic")
  it
  v(0.15em)
}

= Pendahuluan

Statistika adalah ilmu mengumpulkan, menganalisis, menginterpretasi, dan menyajikan data.
Dokumen ini merangkum dua fondasi utama statistika inferensial: _Distribusi Probabilitas_
(memodelkan ketidakpastian) dan _Analisis Regresi_ (memodelkan hubungan antar variabel).
Setiap topik disertai turunan matematis, contoh numerik, dan interpretasi agar pembaca
tidak sekadar menghafal rumus, melainkan memahami dari mana rumus itu berasal dan kapan
ia berlaku , serta kapan ia menyesatkan.

#pagebreak

= Bagian I: Distribusi Probabilitas

== Pendahuluan Bagian I

Distribusi probabilitas adalah fungsi yang memetakan setiap kemungkinan _outcome_ dari
suatu variabel acak ke probabilitas terjadinya. Ini adalah bahasa formal ketidakpastian:
alih-alih mengatakan "mungkin hujan besok", statistika mengatakan $P(X = "hujan") = 0.3$.
Bagian ini mencakup 11 topik, dari definisi dasar hingga aplikasi di machine learning.

=== 1. Definisi Distribusi Probabilitas

#text(weight: "bold")[Definisi Formal.] Suatu *distribusi probabilitas* pada ruang sampel
$Omega$ adalah fungsi $P: Omega -> [0, 1]$ yang memenuhi:

#text(weight: "bold")[Aksioma Kolmogorov:]

+ *Non-negatif:* $P(A) >= 0$ untuk setiap kejadian $A subset.eq Omega$.
+ *Unit measure:* $P(Omega) = 1$.
+ *Aditif-sigma:* Untuk barisan kejadian saling lepas $A_1, A_2, ...$,

$ P(union_(i=1)^infinity A_i) = sum_(i=1)^infinity P(A_i) $

#text(weight: "bold")[Mengapa ini penting.] Tiga aksioma ini adalah "konstitusi"
probabilitas. Semua teorema , Bayes, ekspektasi, hukum bilangan besar , diturunkan
hanya dari tiga aksioma ini.

#text(weight: "bold")[Contoh 1.1: Pelemparan Dadu.]
Untuk $Omega = {1, 2, 3, 4, 5, 6}$ dengan dadu adil:
$P({i}) = 1/6 approx 0.1667$ untuk setiap $i$.
Untuk kejadian $A = {2, 4, 6}$ (mata genap):
$P(A) = 3/6 = 0.5$, sesuai aksioma aditif.

#text(weight: "bold")[Interpretasi.] Distribusi probabilitas bukanlah "frekuensi aktual"
melainkan model matematis. Dalam praktik, kita tidak pernah tahu distribusi sejati
, kita hanya mengestimasi dari sampel.

=== 2. Variabel Acak Diskrit vs Kontinu

#text(weight: "bold")[Definisi.] *Variabel acak* $X$ adalah fungsi terukur
$X: Omega -> RR$. Ini menjembatani ruang sampel abstrak ke bilangan riil.

- *Diskrit:* $X$ memiliki _countable range_ ${x_1, x_2, ...}$.
  Fungsi massa probabilitas (PMF): $p(x) = P(X = x)$.
  Syarat: $sum_x p(x) = 1$.

- *Kontinu:* $X$ memiliki _uncountable range_ (biasanya interval di $RR$).
  Fungsi densitas probabilitas (PDF): $f(x) >= 0$.
  Syarat:

$ integral_(-infinity)^infinity f(x) thin d x = 1 $

*Catatan krusial:* $P(X = x) = 0$ untuk setiap $x$ tunggal; yang bermakna
adalah probabilitas pada interval:

$ P(a <= X <= b) = integral_a^b f(x) thin d x $

#text(weight: "bold")[Kenapa $P(X = x) = 0$ untuk kontinu?]
Karena ada tak-hingga banyaknya titik dalam interval manapun. Jika setiap titik
memiliki probabilitas $epsilon > 0$, total probabilitas akan divergen ke $infinity$,
melanggar aksioma $P(Omega) = 1$.

#text(weight: "bold")[Contoh 2.1: Diskrit , Jumlah Anak.]
Sebuah survei mencatat jumlah anak dalam 100 keluarga:
$p(0) = 0.20$, $p(1) = 0.35$, $p(2) = 0.30$, $p(3) = 0.12$, $p(4) = 0.03$.
Verifikasi: $0.20 + 0.35 + 0.30 + 0.12 + 0.03 = 1.00$ #sym.checkmark.

#text(weight: "bold")[Contoh 2.2: Kontinu , Waktu Tunggu Bus.]
Bus tiba setiap 15 menit. Jika penumpang tiba acak, $X$ = waktu tunggu ~ Uniform$(0, 15)$.
$f(x) = 1/15$ untuk $0 <= x <= 15$, dan $0$ di luarnya.
Probabilitas menunggu 3--5 menit:

$ P(3 <= X <= 5) = integral_3^5 1/15 thin d x = 2/15 approx 0.1333 $

=== 3. Tabel Distribusi Probabilitas

#text(weight: "bold")[Definisi.] Tabel distribusi probabilitas adalah representasi
tabular dari PMF diskrit: setiap baris memetakan nilai $x_i$ ke $p(x_i)$.

#text(weight: "bold")[Format standar:]

#table(
  columns: (auto, auto, auto, auto),
  table.header([$x$], [$p(x)$], [$x p(x)$], [$x^2 p(x)$]),
  [$x_1$], [$p_1$], [$x_1 p_1$], [$x_1^2 p_1$],
  [$x_2$], [$p_2$], [$x_2 p_2$], [$x_2^2 p_2$],
  [dots.v], [dots.v], [dots.v], [dots.v],
  [Total], [1.00], [$E[X]$], [$E[X^2]$],
)

Kolom $x p(x)$ dan $x^2 p(x)$ adalah kalkulasi antara untuk
$E[X]$ dan $E[X^2]$ (lihat Topik 4--5).

#text(weight: "bold")[Contoh 3.1: Lotre Sederhana.]
Sebuah lotre menjual 1000 tiket seharga Rp 2.000. Hadiah:
1 #sym.times Rp 500.000, 5 #sym.times Rp 100.000, 20 #sym.times Rp 20.000.
Misal $X$ = keuntungan bersih (= hadiah - biaya tiket).

#table(
  columns: (auto, auto, auto, auto),
  table.header([$x$ (Rp)], [$p(x)$], [$x p(x)$], [Keterangan]),
  [$500.000 - 2.000 = 498.000$], [$1\/1000 = 0.001$], [$498.0$], [Hadiah utama],
  [$100.000 - 2.000 = 98.000$],  [$5\/1000 = 0.005$], [$490.0$], [Hadiah kedua],
  [$20.000 - 2.000 = 18.000$],   [$20\/1000 = 0.020$], [$360.0$], [Hadiah ketiga],
  [$-2.000$],                    [$974\/1000 = 0.974$], [$-1948.0$], [Kalah],
  [Total], [1.000], [$-600.0$], [],
)

$E[X] = -600$. Artinya: ekspektasi keuntungan per tiket adalah rugi Rp 600. Lotre
dirancang agar expected value negatif untuk pemain , inilah "house edge".

=== 4. Nilai Harapan (Expected Value)

#text(weight: "bold")[Definisi.] Nilai harapan adalah rata-rata tertimbang dari
semua kemungkinan nilai, dengan bobot = probabilitas.

- *Diskrit:*

$ E[X] = sum_i x_i p(x_i) $

- *Kontinu:*

$ E[X] = integral_(-infinity)^infinity x f(x) thin d x $

#text(weight: "bold")[Turunan , Mengapa rata-rata tertimbang?]
Misal kita mengulang eksperimen $N$ kali. Berdasarkan Hukum Bilangan Besar (LLN),
frekuensi nilai $x_i$ akan mendekati $N p(x_i)$. Rata-rata sampel:

$ overline(X)_N = 1/N sum_(j=1)^N X_j approx 1/N sum_i [N p(x_i)] x_i = sum_i x_i p(x_i) = E[X] $

Jadi $E[X]$ adalah limit $overline(X)_N$ saat $N -> infinity$.

#text(weight: "bold")[Sifat linearitas:] $E[a X + b] = a E[X] + b$.
*Bukti:* $E[a X + b] = sum (a x_i + b) p(x_i) = a sum x_i p(x_i) + b sum p(x_i) = a E[X] + b$.

#text(weight: "bold")[Contoh 4.1: Ekspektasi Dadu.]
$E[X] = sum_(i=1)^6 i dot 1/6 = 21/6 = 3.5$.
Interpretasi: bukan berarti kita "mengharapkan" nilai 3.5 (mustahil), melainkan
rata-rata jangka panjang akan konvergen ke 3.5.

#text(weight: "bold")[Contoh 4.2: Ekspektasi Uniform Kontinu.]
$X$ ~ Uniform$(a, b)$:

$
  E[X] = integral_a^b x dot 1/(b-a) thin d x
  = 1/(b-a) dot bracket(x^2/2)_a^b
  = (b^2 - a^2) / (2(b-a))
  = (a+b)/2
$

Titik tengah interval , sesuai intuisi.

=== 5. Varians & Standar Deviasi

#text(weight: "bold")[Definisi.] Varians mengukur sebaran data di sekitar nilai harapan.
Secara matematis, varians adalah ekspektasi dari deviasi kuadrat:

$
  "Var"(X) = E[(X - mu)^2]
$

dengan $mu = E[X]$. Menggunakan ekspansi kuadrat:

$
  "Var"(X) = E[X^2 - 2 mu X + mu^2]
  = E[X^2] - 2 mu E[X] + mu^2
  = E[X^2] - 2 mu^2 + mu^2
  = E[X^2] - mu^2
$

Rumus komputasi yang lebih praktis: $"Var"(X) = E[X^2] - (E[X])^2$.

#text(weight: "bold")[Standar Deviasi:] $sigma = sqrt("Var"(X))$. Satuannya sama dengan
data asli, sehingga lebih mudah diinterpretasi.

#text(weight: "bold")[Sifat varians:]

+ $"Var"(a X + b) = a^2 "Var"(X)$ , penambahan konstanta $b$ tidak mengubah varians,
  sedangkan perkalian $a$ mengkuadratkan varians.
+ Jika $X$ dan $Y$ independen: $"Var"(X + Y) = "Var"(X) + "Var"(Y)$.
+ Varians selalu $>= 0$, dan $= 0$ hanya jika $X$ konstan (degenerate).

#text(weight: "bold")[Contoh 5.1: Varians Dadu.]
Dari Topik 4: $E[X] = 3.5$. Menghitung $E[X^2]$:

$
  E[X^2] = sum_(i=1)^6 i^2 dot 1/6 = (1 + 4 + 9 + 16 + 25 + 36) / 6 = 91/6 approx 15.1667
$

Maka:

$
  "Var"(X) = 91/6 - (7/2)^2 = 91/6 - 49/4 = (182 - 147) / 12 = 35/12 approx 2.9167
$

$
  sigma = sqrt(35/12) approx 1.7078
$

#text(weight: "bold")[Interpretasi.] Rata-rata nilai dadu adalah 3.5, dan secara tipikal
nilai menyimpang sekitar 1.71 dari rata-rata. Semakin besar $sigma$, semakin lebar
sebaran data.

#text(weight: "bold")[Contoh 5.2: Varians Lotre.]
Dari Contoh 3.1, $E[X] = -600$. Kita perlu $E[X^2]$:

#table(
  columns: (auto, auto, auto, auto),
  table.header([$x$], [$p(x)$], [$x^2$], [$x^2 p(x)$]),
  [$498.000$], [$0.001$], [$2.480 dot 10^11$], [$2.480 dot 10^8$],
  [$98.000$],  [$0.005$], [$9.604 dot 10^9$],  [$4.802 dot 10^7$],
  [$18.000$],  [$0.020$], [$3.240 dot 10^8$],  [$6.480 dot 10^6$],
  [$-2.000$],  [$0.974$], [$4.000 dot 10^6$],  [$3.896 dot 10^6$],
  [Total], [1.000], [], [$3.029 dot 10^8$],
)

$
  "Var"(X) = 3.029 times 10^8 - (-600)^2 = 302.900.000 - 360.000 = 3.0254 times 10^8
$

$
  sigma approx sqrt(3.0254 times 10^8) approx "Rp" thin 17.394
$

#text(weight: "bold")[Interpretasi.] Varians sangat besar karena ada kemungkinan kecil
mendapat hadiah besar , inilah yang membuat lotre "menarik" meskipun ekspektasi negatif.

=== 6. Distribusi Binomial

#text(weight: "bold")[Definisi.] Distribusi Binomial memodelkan jumlah sukses dalam
$n$ percobaan Bernoulli independen, masing-masing dengan probabilitas sukses $p$.

#text(weight: "bold")[PMF Binomial:]

$
  P(X = k) = binom(n, k) p^k (1-p)^(n-k), quad k = 0, 1, ..., n
$

dengan $binom(n, k) = n! / (k! (n-k)!)$ adalah koefisien binomial.

#text(weight: "bold")[Syarat percobaan Binomial:]

1. Jumlah percobaan $n$ tetap.
2. Setiap percobaan independen.
3. Hanya dua outcome: sukses atau gagal.
4. Probabilitas sukses $p$ konstan di setiap percobaan.

#text(weight: "bold")[Turunan PMF.] Probabilitas mendapatkan tepat $k$ sukses dalam
urutan tertentu (misal: S S G S G) adalah $p^k (1-p)^(n-k)$. Karena ada $binom(n, k)$
urutan berbeda yang menghasilkan $k$ sukses, maka:

$
  P(X = k) = binom(n, k) p^k (1-p)^(n-k)
$

#text(weight: "bold")[Momen:]

$
  E[X] = n p
$

$
  "Var"(X) = n p (1-p)
$

#text(weight: "bold")[Contoh 6.1: Koin 10 Kali.]
$n = 10$, $p = 0.5$. Peluang tepat 7 heads:

$
  P(X = 7) = binom(10, 7) (0.5)^7 (0.5)^3
  = 120 dot (1/128) dot (1/8)
  = 120 / 1024 approx 0.1172
$

Peluang minimal 7 heads:

$
  P(X >= 7) = P(7) + P(8) + P(9) + P(10) approx 0.1719
$

#text(weight: "bold")[Contoh 6.2: Kontrol Kualitas.]
Pabrik memproduksi chip dengan tingkat cacat $p = 0.03$. Sampel $n = 20$ chip.
Peluang tepat 1 cacat:

$
  P(X = 1) = binom(20, 1) (0.03)^1 (0.97)^19 approx 0.3364
$

Peluang tidak ada cacat: $P(X = 0) = (0.97)^20 approx 0.5438$.
Peluang minimal 1 cacat: $1 - 0.5438 = 0.4562$.

=== 7. Distribusi Poisson

#text(weight: "bold")[Definisi.] Distribusi Poisson memodelkan jumlah kejadian dalam
interval waktu/ruang tertentu, dengan asumsi kejadian terjadi independen dan dengan
rata-rata konstan $lambda$.

#text(weight: "bold")[PMF Poisson:]

$
  P(X = k) = (lambda^k e^(-lambda)) / (k!), quad k = 0, 1, 2, ...
$

#text(weight: "bold")[Hubungan dengan Binomial.] Poisson adalah limit Binomial$(n, p)$
saat $n -> infinity$ dan $p -> 0$ dengan $n p = lambda$ konstan:

$
  lim_(n->infinity, p->0; n p=lambda) binom(n, k) p^k (1-p)^(n-k) = (lambda^k e^(-lambda)) / (k!)
$

#text(weight: "bold")[Momen:]

$
  E[X] = lambda
$

$
  "Var"(X) = lambda
$

Sifat unik Poisson: mean = varians = $lambda$.

#text(weight: "bold")[Contoh 7.1: Panggilan Call Center.]
Call center menerima rata-rata $lambda = 5$ panggilan per menit. Peluang tepat
3 panggilan dalam 1 menit:

$
  P(X = 3) = (5^3 e^(-5)) / (3!) = 125 / 6 dot e^(-5) approx 20.833 dot 0.006738 approx 0.1404
$

Peluang $\le 2$ panggilan:

$
  P(X <= 2) = P(0) + P(1) + P(2) = e^(-5) (1 + 5 + 25/2) = e^(-5) dot 18.5 approx 0.1247
$

#text(weight: "bold")[Contoh 7.2: Cacat Produksi.]
Rata-rata 2 cacat per meter kain. Peluang tidak ada cacat dalam 1 meter:
$P(X = 0) = e^(-2) approx 0.1353$. Peluang > 3 cacat: $1 - P(X <= 3) approx 0.1429$.

=== 8. Distribusi Normal

#text(weight: "bold")[Definisi.] Distribusi Normal (Gauss) adalah distribusi kontinu
paling fundamental dalam statistika, muncul dari Teorema Limit Pusat (CLT).

#text(weight: "bold")[PDF Normal:]

$
  f(x) = 1 / (sigma sqrt(2 pi)) exp(-((x - mu)^2) / (2 sigma^2)), quad x in RR
$

Parameter: $mu in RR$ (mean), $sigma > 0$ (standar deviasi). Notasi: $X ~ "Normal"(mu, sigma^2)$.

#text(weight: "bold")[Distribusi Normal Standar:] $Z ~ "Normal"(0, 1)$.

$
  phi(z) = 1 / sqrt(2 pi) e^(-z^2 / 2)
$

#text(weight: "bold")[Transformasi ke Z-score:] Setiap $X ~ "Normal"(mu, sigma^2)$ dapat
distandardisasi:

$
  Z = (X - mu) / sigma ~ "Normal"(0, 1)
$

#text(weight: "bold")[Sifat kurva Normal:]

+ Simetris di sekitar $mu$ (mean = median = modus).
+ 68% data dalam $mu plus.minus sigma$, 95% dalam $mu plus.minus 2 sigma$,
  99.7% dalam $mu plus.minus 3 sigma$ (aturan 68-95-99.7).
+ Luas total di bawah kurva = 1.
+ Titik belok di $mu plus.minus sigma$.

#text(weight: "bold")[Contoh 8.1: Tinggi Badan.]
Tinggi mahasiswa ~ $"Normal"(170, 6^2)$. Peluang tinggi < 165 cm:

$
  Z = (165 - 170) / 6 approx -0.8333
$

$
  P(X < 165) = Phi(-0.8333) approx 0.2023
$

Peluang tinggi antara 165--180:

$
  Z_1 = -0.8333, quad Z_2 = (180 - 170)/6 approx 1.6667
$

$
  P(165 < X < 180) = Phi(1.6667) - Phi(-0.8333) approx 0.9522 - 0.2023 = 0.7499
$

#text(weight: "bold")[Contoh 8.2: Batas Nilai.]
Nilai ujian ~ $"Normal"(75, 10^2)$. Berapa nilai batas 10% teratas?

$
  P(Z > z_0.90) = 0.10 arrow.r z_0.90 approx 1.2816
$

$
  x = mu + z_0.90 sigma = 75 + 1.2816 dot 10 approx 87.82
$

Mahasiswa dengan nilai ≥ 87.82 masuk 10% teratas.

=== 9. Memilih Distribusi yang Tepat

#text(weight: "bold")[Prinsip.] Tidak ada distribusi yang "benar" secara absolut;
yang ada adalah model yang paling sesuai dengan proses penghasil data (DGP).

#text(weight: "bold")[Panduan pemilihan:]

+ #text(weight: "bold")[Binomial:] Cocok untuk menghitung jumlah sukses dari $n$
  percobaan independen dengan peluang tetap $p$. Contoh: jumlah cacat dalam batch,
  jumlah responden yang setuju.

+ #text(weight: "bold")[Poisson:] Cocok untuk menghitung kejadian langka dalam interval
  kontinu. Contoh: kecelakaan per bulan, cacat per meter, panggilan per jam.

+ #text(weight: "bold")[Normal:] Cocok untuk data kontinu hasil agregasi banyak faktor
  independen (CLT). Contoh: tinggi badan, error pengukuran, IQ.

+ #text(weight: "bold")[Eksponensial:] Cocok untuk waktu tunggu antar kejadian Poisson.
  Contoh: waktu antar panggilan, umur komponen.

+ #text(weight: "bold")[Uniform:] Cocok jika semua outcome equally likely dalam
  interval terbatas. Contoh: angka random, waktu kedatangan acak.

#text(weight: "bold")[Pemeriksaan empiris:]

+ Plot histogram data dan bandingkan dengan kurva teoretis.
+ Q-Q Plot: jika titik-titik mengikuti garis diagonal, distribusi cocok.
+ Uji statistik: Kolmogorov-Smirnov, Chi-Square goodness-of-fit.

#text(weight: "bold")[Kesalahan umum:]

+ Mengasumsikan Normal tanpa verifikasi , banyak data dunia nyata skew atau fat-tailed.
+ Menggunakan Poisson padahal varians jauh lebih besar dari mean
  (overdispersi , gunakan Binomial Negatif).
+ Menerapkan Binomial padahal percobaan tidak independen.

#text(weight: "bold")[Contoh 9.1:] Data jumlah kecelakaan mobil per hari di kota kecil.
Mean = 0.8, varians = 0.85 → Poisson($lambda approx 0.8$) cocok.
Jika varians = 3.2 → overdispersi, gunakan Binomial Negatif.

=== 10. Z-Score

#text(weight: "bold")[Definisi.] Z-score mengukur berapa standar deviasi suatu nilai
berada dari mean:

$
  z = (x - mu) / sigma
$

Untuk data sampel: $z = (x - overline(x)) / s$.

#text(weight: "bold")[Interpretasi:]

+ $z = 0$: nilai tepat di rata-rata.
+ $z > 0$: di atas rata-rata.
+ $z < 0$: di bawah rata-rata.
+ $|z| > 2$: nilai tidak biasa (luar 95% data Normal).
+ $|z| > 3$: outlier potensial (luar 99.7%).

#text(weight: "bold")[Sifat Z-score:]

+ Z-score tidak berdimensi , bisa membandingkan variabel dengan satuan berbeda.
+ Untuk distribusi Normal, Z ~ $"Normal"(0, 1)$.
+ Transformasi linear: jika $z_X$ adalah Z-score $X$, maka Z-score $a X + b$ tetap $z_X$
  (kecuali tanda berubah jika $a < 0$).

#text(weight: "bold")[Contoh 10.1: Perbandingan Antar Mata Kuliah.]
Mahasiswa A: nilai Statistika 82 (rata-rata kelas 75, $sigma = 8$).
Mahasiswa A: nilai Kalkulus 78 (rata-rata kelas 70, $sigma = 5$).

$
  z_"Stat" = (82 - 75) / 8 = 0.875
$

$
  z_"Kalk" = (78 - 70) / 5 = 1.600
$

Interpretasi: Meskipun nilai mentah Statistika lebih tinggi, secara relatif
Mahasiswa A lebih unggul di Kalkulus ($1.60 sigma$ vs $0.875 sigma$ di atas mean).

#text(weight: "bold")[Contoh 10.2: Deteksi Outlier.]
Data gaji karyawan: $overline(x)$ = Rp 8.500.000, $s$ = Rp 2.100.000.
Gaji CEO = Rp 35.000.000.

$
  z = (35.000.000 - 8.500.000) / 2.100.000 approx 12.62
$

$|z| > 3$ → CEO adalah outlier ekstrem. Perlu pertimbangan: transformasi log atau
analisis terpisah.

=== 11. Probabilitas di ML/AI

#text(weight: "bold")[Mengapa probabilitas penting di ML/AI.] Machine learning pada
intinya adalah inferensi probabilistik: dari data yang terbatas, kita ingin
menggeneralisasi ke data yang belum terlihat. Probabilitas menyediakan bahasa
formal untuk ketidakpastian dalam generalisasi.

#text(weight: "bold")[1. Klasifikasi Probabilistik.]
Daripada output label keras (kelas A atau B), model menghasilkan distribusi
probabilitas atas kelas. Contoh: Regresi Logistik menghasilkan:

$
  P(Y = 1 | X = x) = sigma(w^T x + b) = 1 / (1 + e^(-(w^T x + b)))
$

dengan $sigma$ adalah fungsi sigmoid. Output $0.73$ berarti model 73% yakin
data masuk kelas 1.

#text(weight: "bold")[2. Fungsi Loss Berbasis Probabilitas.]
Cross-entropy loss (log-loss) mengukur seberapa baik distribusi prediksi $hat(p)$
cocok dengan distribusi sebenarnya $p$:

$
  L = -sum_(i) p_i log(hat(p)_i)
$

Untuk klasifikasi biner: $"BCE" = -[y log(hat(y)) + (1-y) log(1-hat(y))]$.
Semakin kecil loss, semakin baik kalibrasi probabilitas.

#text(weight: "bold")[3. Naïve Bayes Classifier.]
Menggunakan Teorema Bayes dengan asumsi independensi antar fitur:

$
  P(Y = c | X) = (P(X | Y = c) P(Y = c)) / P(X) prop P(Y = c) product_(j=1)^d P(X_j | Y = c)
$

Asumsi naif (independensi) hampir selalu salah secara teknis, tetapi classifier
ini sering bekerja sangat baik , contoh klasik bahwa model "salah" bisa sangat
berguna.

#text(weight: "bold")[4. Inferensi Bayesian di Neural Networks.]
Bayesian Neural Networks menempatkan prior $P(w)$ pada bobot jaringan.
Setelah melihat data $D$, posterior $P(w | D)$ dihitung via Teorema Bayes.
Prediksi dilakukan dengan marginalisasi:

$
  P(y | x, D) = integral P(y | x, w) P(w | D) thin d w
$

Ini memberikan uncertainty quantification , bukan hanya prediksi, tetapi juga
seberapa yakin model terhadap prediksinya.

#text(weight: "bold")[5. Generative Models.]
Model generatif seperti GAN dan Diffusion belajar distribusi data $P_"data"(x)$.
VAE (Variational Autoencoder) mengoptimalkan Evidence Lower Bound (ELBO):

$
  "ELBO" = E_(z ~ q(z|x))[log p(x|z)] - "KL"(q(z|x) || p(z))
$

Suku pertama rekonstruksi, suku kedua regularisasi , memaksa distribusi laten
mendekati prior (biasanya Normal standar).

#text(weight: "bold")[6. Dropout sebagai Regularisasi Bayesian.]
Dropout (secara random mematikan neuron saat training) dapat diinterpretasikan
sebagai aproksimasi inferensi Bayesian: setiap forward pass adalah sampel dari
distribusi posterior aproksimasi. Saat inference, rata-rata banyak forward pass
dengan dropout aktif (MC Dropout) memberikan uncertainty estimate.

#text(weight: "bold")[7. Calibration & Temperature Scaling.]
Model modern sering overconfident. Temperature scaling mengkalibrasi ulang:

$
  hat(P)(y | x) = "softmax"("logit"(x) / T)
$

$T > 1$ membuat distribusi lebih "lunak" (kurang confident), $T < 1$ membuat
lebih "tajam". Temperature optimal dicari via validation set.

#text(weight: "bold")[Ringkasan.] Probabilitas di ML/AI bukan sekadar alat hitung;
ia adalah fondasi epistemologis dari generalisasi. Tanpa probabilitas, kita
tidak bisa mengatakan "model ini 95% yakin" , hanya bisa mengatakan "model ini
memprediksi kelas A" tanpa tahu seberapa reliable prediksi tersebut.

#pagebreak

= Bagian II: Analisis Regresi

== Pendahuluan Bagian II

Regresi adalah metode statistika untuk memodelkan hubungan antara variabel.
Berbeda dengan distribusi probabilitas yang memodelkan satu variabel acak,
regresi memodelkan bagaimana satu variabel (dependen) dipengaruhi oleh
variabel lain (independen). Bagian ini mencakup 11 topik, dari definisi
dasar hingga generalisasi model.

=== 12. Definisi & Tujuan Regresi

#text(weight: "bold")[Definisi.] Analisis regresi adalah metode statistika untuk
memodelkan dan menganalisis hubungan antara variabel dependen (respons) $Y$ dan
satu atau lebih variabel independen (prediktor) $X_1, X_2, ..., X_p$.

#text(weight: "bold")[Model umum regresi:]

$
  Y = f(X_1, ..., X_p) + epsilon
$

dengan $f$ adalah fungsi sistematis (deterministik) dan $epsilon$ adalah error
acak (stokastik) dengan $E[epsilon] = 0$.

#text(weight: "bold")[Tujuan analisis regresi:]

1. #text(weight: "bold")[Deskripsi:] Menggambarkan hubungan antara variabel ,
   seberapa kuat, arah, dan bentuknya.

2. #text(weight: "bold")[Prediksi:] Memprediksi nilai $Y$ untuk nilai $X$ baru
   yang belum terobservasi.

3. #text(weight: "bold")[Inferensi kausal:] Mengestimasi efek kausal suatu
   variabel terhadap variabel lain (dengan asumsi ketat, lihat Topik 14).

4. #text(weight: "bold")[Kontrol:] Menentukan variabel mana yang perlu
   dikendalikan untuk mencapai target $Y$ tertentu.

#text(weight: "bold")[Dekomposisi data.] Setiap observasi $y_i$ dapat
didekomposisi menjadi:

$
  y_i = underbrace(hat(y)_i, "prediksi") + underbrace(e_i, "residual")
$

dengan $hat(y)_i$ adalah komponen yang dijelaskan model dan $e_i$ adalah
komponen yang tidak dijelaskan. Kualitas model diukur dari seberapa kecil
$e_i$ , tetapi tanpa overfitting (Topik 22).

=== 13. Variabel Dependen vs Independen

#text(weight: "bold")[Definisi.]

+ #text(weight: "bold")[Variabel dependen (respons, $Y$):] Variabel yang ingin
  kita jelaskan atau prediksi. Disebut "dependen" karena nilainya _bergantung_
  pada variabel lain dalam model.

+ #text(weight: "bold")[Variabel independen (prediktor, $X$):] Variabel yang
  digunakan untuk menjelaskan atau memprediksi $Y$. Disebut "independen" karena
  dalam model regresi, nilainya diasumsikan _diketahui_ atau _tetap_ (fixed).

#text(weight: "bold")[Konvensi notasi:]

+ $Y$: variabel dependen (respons).
+ $X_j$: variabel independen ke-$j$.
+ $n$: jumlah observasi.
+ $p$: jumlah prediktor.

#text(weight: "bold")[Contoh 13.1: Harga Rumah.]

+ $Y$: harga rumah (dependen , yang ingin diprediksi).
+ $X_1$: luas bangunan (m²).
+ $X_2$: jumlah kamar tidur.
+ $X_3$: jarak ke pusat kota (km).
+ $X_4$: umur bangunan (tahun).

#text(weight: "bold")[Contoh 13.2: Nilai Ujian.]

+ $Y$: nilai ujian akhir.
+ $X_1$: jam belajar per minggu.
+ $X_2$: nilai ujian tengah semester.
+ $X_3$: kehadiran (%).

#text(weight: "bold")[Catatan penting.] "Independen" tidak berarti independen secara
statistik antar sesama $X$. Dalam praktik, $X_j$ sering berkorelasi satu sama lain
(multikolinearitas, lihat Topik 21). Istilah yang lebih tepat adalah "prediktor"
atau "variabel penjelas".

=== 14. Korelasi vs Kausalitas

#text(weight: "bold")[Definisi Korelasi.] Korelasi mengukur kekuatan dan arah
hubungan linear antara dua variabel:

$
  r_("XY") = ("Cov"(X,Y)) / (sigma_X sigma_Y)
$

$
  -1 <= r <= 1
$

+ $r > 0$: hubungan positif (X naik, Y cenderung naik).
+ $r < 0$: hubungan negatif (X naik, Y cenderung turun).
+ $r approx 0$: tidak ada hubungan linear (bisa ada hubungan non-linear).
+ $|r|$ dekat 1: hubungan linear kuat.

#text(weight: "bold")[Korelasi BUKAN Kausalitas.] Ini adalah prinsip paling
fundamental yang sering dilanggar. Tiga mekanisme yang menghasilkan korelasi
tanpa kausalitas:

1. #text(weight: "bold")[Confounding:] Variabel ketiga $Z$ menyebabkan baik $X$
   maupun $Y$. Contoh: korelasi antara penjualan es krim dan kasus tenggelam
   , keduanya disebabkan oleh musim panas ($Z$).

2. #text(weight: "bold")[Reverse causation:] $Y$ menyebabkan $X$, bukan
   sebaliknya. Contoh: korelasi negatif antara jumlah dokter dan angka kematian ,
   daerah dengan angka kematian lebih rendah cenderung menarik lebih banyak dokter.

3. #text(weight: "bold")[Kebetulan:] Dengan banyak variabel, beberapa korelasi
   akan muncul signifikan secara kebetulan (multiple comparisons problem).

#text(weight: "bold")[Kriteria kausalitas (Bradford Hill):]
+ Temporal precedence: sebab mendahului akibat.
+ Konsistensi: diamati di berbagai studi/populasi.
+ Dose-response: semakin besar dosis, semakin besar efek.
+ Plausibilitas biologis/mekanistik.
+ Spesifisitas: hubungan spesifik antara sebab dan akibat.

#text(weight: "bold")[Kesimpulan.] Regresi dapat mengestimasi asosiasi, tetapi
hanya desain eksperimental (RCT) atau metode kausal khusus (instrumental variables,
difference-in-differences, regression discontinuity) yang dapat mengklaim kausalitas.
"All models are wrong, but some are useful" , George Box.

=== 15. Persamaan Regresi Linear $Y = a + b X$

#text(weight: "bold")[Model Regresi Linear Sederhana:]

$
  Y_i = a + b X_i + epsilon_i, quad i = 1, ..., n
$

dengan:

+ $Y_i$: nilai respons ke-$i$.
+ $X_i$: nilai prediktor ke-$i$.
+ $a$: intercept , nilai $Y$ saat $X = 0$.
+ $b$: slope , perubahan rata-rata $Y$ untuk setiap kenaikan 1 unit $X$.
+ $epsilon_i$: error acak, diasumsikan $epsilon_i$ ~ $"Normal"(0, sigma^2)$ independen.

#text(weight: "bold")[Metode Kuadrat Terkecil (OLS).]
Kita memilih $a$ dan $b$ yang meminimalkan jumlah kuadrat residual:

$
  "SSE"(a,b) = sum_(i=1)^n (Y_i - a - b X_i)^2
$

#text(weight: "bold")[Turunan OLS , mencari $b$.]
Turunkan $"SSE"$ terhadap $b$:

$
  (partial "SSE") / (partial b) = -2 sum_(i=1)^n X_i(Y_i - a - b X_i) = 0
$

$
  sum X_i Y_i - a sum X_i - b sum X_i^2 = 0
$

Turunkan $"SSE"$ terhadap $a$:

$
  (partial "SSE") / (partial a) = -2 sum_(i=1)^n (Y_i - a - b X_i) = 0
$

$
  sum Y_i - n a - b sum X_i = 0
$

Dari sini diperoleh $a = overline(Y) - b overline(X)$. Substitusi ke persamaan
pertama:

$
  sum X_i Y_i - (overline(Y) - b overline(X)) sum X_i - b sum X_i^2 = 0
$

$
  sum X_i Y_i - overline(Y) sum X_i = b (sum X_i^2 - overline(X) sum X_i)
$

Sehingga:

$
  b = (sum (X_i - overline(X))(Y_i - overline(Y))) / (sum (X_i - overline(X))^2)
$

$
  a = overline(Y) - b overline(X)
$

#text(weight: "bold")[Interpretasi.] Slope $b$ adalah rata-rata perubahan $Y$
untuk setiap kenaikan 1 unit $X$. Garis regresi selalu melalui titik rata-rata
$(overline(X), overline(Y))$.

=== 16. Koefisien Regresi

#text(weight: "bold")[Definisi.] Koefisien regresi $b$ (slope) dan $a$ (intercept)
adalah parameter model regresi linear yang diestimasi dari data.

#text(weight: "bold")[Interpretasi koefisien:]

+ $a$: nilai prediksi $Y$ saat $X = 0$. Hanya bermakna jika $X = 0$ masuk akal
  dalam konteks data.
+ $b$: perubahan rata-rata pada $Y$ untuk setiap perubahan 1 unit pada $X$, dengan
  asumsi semua faktor lain konstan.

#text(weight: "bold")[Standard error koefisien.] Variabilitas sampling dari $b$:

$
  "SE"(b) = sigma / sqrt(sum (X_i - overline(X))^2)
$

dengan $sigma^2$ diestimasi dari residual:

$
  s^2 = "SSE" / (n-2)
$

Semakin kecil $"SE"(b)$, semakin presisi estimasi $b$.

#text(weight: "bold")[Uji signifikansi.] Uji $t$ untuk $H_0: b = 0$ vs $H_1: b != 0$:

$
  t = b / ("SE"(b)) ~ t_(n-2)
$

Jika $|t| > t_(alpha/2, n-2)$, slope signifikan secara statistik.

#text(weight: "bold")[Contoh 16.1: Regresi Jam Belajar vs Nilai.]
Data: 5 mahasiswa.

#table(
  columns: (auto, auto),
  table.header([Jam Belajar ($X$)], [Nilai ($Y$)]),
  [1], [55],
  [2], [60],
  [3], [65],
  [4], [72],
  [5], [78],
)

$
  n = 5, quad sum X = 15, quad sum Y = 330
$

$
  overline(X) = 3, quad overline(Y) = 66
$

Menghitung $sum (X_i - overline(X))(Y_i - overline(Y))$:

#table(
  columns: (auto, auto, auto, auto, auto),
  table.header([$X$], [$Y$], [$X - overline(X)$], [$Y - overline(Y)$], [Product]),
  [1], [55], [-2], [-11], [22],
  [2], [60], [-1], [-6],  [6],
  [3], [65], [0],  [-1],  [0],
  [4], [72], [1],  [6],   [6],
  [5], [78], [2],  [12],  [24],
  [Total], [], [], [], [58],
)

$
  sum (X_i - overline(X))^2 = (-2)^2 + (-1)^2 + 0^2 + 1^2 + 2^2 = 10
$

$
  b = 58 / 10 = 5.8
$

$
  a = 66 - 5.8 dot 3 = 66 - 17.4 = 48.6
$

Persamaan regresi: $hat(Y) = 48.6 + 5.8 X$.

#text(weight: "bold")[Interpretasi.] Setiap tambahan 1 jam belajar, nilai
diprediksi naik 5.8 poin. Mahasiswa yang tidak belajar ($X = 0$) diprediksi
mendapat nilai 48.6.

=== 17. Prediksi dengan Model Regresi

#text(weight: "bold")[Prediksi titik.] Untuk nilai $X = x_0$, prediksi $Y$ adalah:

$
  hat(y)_0 = a + b x_0
$

#text(weight: "bold")[Interval prediksi vs interval konfidensi.]

+ #text(weight: "bold")[Interval konfidensi untuk mean:] Rentang di mana
  $E[Y | X = x_0]$ (rata-rata respons) berada dengan keyakinan $(1-alpha)$.

+ #text(weight: "bold")[Interval prediksi untuk individu:] Rentang di mana
  satu observasi baru $Y_"new" | X = x_0$ akan jatuh dengan keyakinan $(1-alpha)$.

Interval prediksi selalu lebih lebar karena harus memperhitungkan variabilitas
individu ($sigma^2$) selain ketidakpastian estimasi parameter.

#text(weight: "bold")[Rumus interval prediksi $(1-alpha)$:]

$
  hat(y)_0 plus.minus t_(alpha/2, n-2) dot s sqrt(1 + 1/n + (x_0 - overline(X))^2 / (sum (X_i - overline(X))^2))
$

#text(weight: "bold")[Contoh 17.1: Prediksi dari Contoh 16.1.]
Untuk mahasiswa yang belajar 3.5 jam:

$
  hat(y) = 48.6 + 5.8 dot 3.5 = 48.6 + 20.3 = 68.9
$

#text(weight: "bold")[Bahaya ekstrapolasi.] Memprediksi di luar rentang data
asli ($X$ di luar $[min(X), max(X)]$) sangat berbahaya. Hubungan linear mungkin
tidak berlaku di luar rentang data. Contoh: memprediksi nilai untuk mahasiswa
yang belajar 0 jam (masih dalam rentang [1,5]) vs 20 jam (ekstrapolasi).

=== 18. Koefisien Determinasi $R^2$

#text(weight: "bold")[Definisi.] Koefisien determinasi $R^2$ mengukur proporsi
varians variabel dependen yang dapat dijelaskan oleh model regresi.

#text(weight: "bold")[Dekomposisi varians.]

$
  underbrace(sum (Y_i - overline(Y))^2, "SST") = underbrace(sum (hat(Y)_i - overline(Y))^2, "SSR") + underbrace(sum (Y_i - hat(Y)_i)^2, "SSE")
$

+ $"SST"$ (Total Sum of Squares): variabilitas total $Y$.
+ $"SSR"$ (Regression Sum of Squares): variabilitas yang dijelaskan model.
+ $"SSE"$ (Error Sum of Squares): variabilitas residual.

$
  R^2 = "SSR" / "SST" = 1 - "SSE" / "SST"
$

#text(weight: "bold")[Sifat $R^2$:]

+ $0 <= R^2 <= 1$.
+ $R^2 = 0$: model tidak menjelaskan apapun ($hat(Y)_i = overline(Y)$).
+ $R^2 = 1$: model menjelaskan sempurna ($hat(Y)_i = Y_i$, semua residual 0).
+ $R^2$ selalu naik saat menambah prediktor, meskipun prediktor tidak relevan.
  Gunakan $R_"adj"^2$ untuk koreksi:

$
  R_"adj"^2 = 1 - ("SSE" / (n - p - 1)) / ("SST" / (n - 1))
$

#text(weight: "bold")[Contoh 18.1: $R^2$ dari Contoh 16.1.]

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  table.header([$X$], [$Y$], [$hat(Y)$], [$(Y-overline(Y))^2$], [$(hat(Y)-overline(Y))^2$], [$(Y-hat(Y))^2$]),
  [1], [55], [54.4], [121], [134.56], [0.36],
  [2], [60], [60.2], [36],  [33.64],  [0.04],
  [3], [65], [66.0], [1],   [0.00],   [1.00],
  [4], [72], [71.8], [36],  [33.64],  [0.04],
  [5], [78], [77.6], [144], [134.56], [0.16],
  [Total], [330], [330.0], [338], [336.40], [1.60],
)

$
  "SST" = 338, quad "SSR" = 336.40, quad "SSE" = 1.60
$

$
  R^2 = 336.40 / 338 approx 0.9953
$

Interpretasi: 99.53% variasi nilai ujian dijelaskan oleh jam belajar.
Model sangat baik (hampir sempurna) , tapi hati-hati: $n=5$ sangat kecil.

#text(weight: "bold")[Peringatan $R^2$.] $R^2$ tinggi tidak berarti model baik:
+ Bisa jadi overfitting (Topik 22).
+ Bisa jadi data time series dengan tren (spurious regression).
+ Tidak mendeteksi bias sistematis dalam residual.

=== 19. Asumsi Regresi Linear (BLUE / Gauss-Markov)

#text(weight: "bold")[Teorema Gauss-Markov.] Di bawah asumsi klasik, estimator
OLS adalah $"BLUE"$ , Best Linear Unbiased Estimator. "Best" berarti varians
minimum di antara semua estimator linear tak bias.

#text(weight: "bold")[Asumsi Gauss-Markov:]

1. #text(weight: "bold")[Linearitas:] $E[Y | X] = a + b X$ , hubungan linear
   antara $X$ dan $Y$.

2. #text(weight: "bold")[Eksogenitas:] $E[epsilon_i | X_i] = 0$ , error
   tidak berkorelasi dengan $X$. Pelanggaran: omitted variable bias.

3. #text(weight: "bold")[Homoskedastisitas:] $"Var"(epsilon_i | X_i) = sigma^2$
   konstan untuk semua $i$. Pelanggaran: heteroskedastisitas.

4. #text(weight: "bold")[Tidak ada autokorelasi:] $"Cov"(epsilon_i, epsilon_j) = 0$
   untuk $i != j$. Pelanggaran umum pada data time series.

5. #text(weight: "bold")[Tidak ada multikolinearitas sempurna (regresi berganda):]
   Tidak ada prediktor yang merupakan kombinasi linear sempurna dari prediktor lain.

#text(weight: "bold")[Untuk inferensi (uji $t$, $F$), tambahan:]

6. #text(weight: "bold")[Normalitas:] $epsilon_i$ ~ $"Normal"(0, sigma^2)$.
   Diperlukan untuk uji $t$ dan $F$ pada sampel kecil. Untuk $n$ besar,
   CLT membuat asumsi ini kurang kritis.

#text(weight: "bold")[Konsekuensi pelanggaran:]

+ Heteroskedastisitas: OLS tetap tak bias dan konsisten, tapi tidak efisien;
  $"SE"(b)$ bias → uji $t$ tidak valid. Solusi: robust standard errors (White).

+ Autokorelasi: OLS tak bias tapi $"SE"$ underestimate → false positives.
  Solusi: Newey-West standard errors.

+ Non-normalitas: uji $t$ dan $F$ tidak valid untuk $n$ kecil.

#text(weight: "bold")[Diagnostik residual:]

+ Residual vs fitted plot: cek linearitas dan homoskedastisitas.
+ Q-Q plot residual: cek normalitas.
+ Scale-location plot: cek heteroskedastisitas.
+ Residual vs leverage: deteksi outlier berpengaruh (Cook's distance).

=== 20. Regresi Sederhana vs Berganda

#text(weight: "bold")[Regresi Linear Sederhana:]
Satu prediktor, model: $Y = a + b X + epsilon$.

#text(weight: "bold")[Regresi Linear Berganda:] Dua atau lebih prediktor:

$
  Y = beta_0 + beta_1 X_1 + beta_2 X_2 + ... + beta_p X_p + epsilon
$

Dalam notasi matriks:

$
  bold(Y) = bold(X) bold(beta) + bold(epsilon)
$

dengan $bold(Y)_(n times 1)$, $bold(X)_(n times (p+1))$, $bold(beta)_((p+1) times 1)$.

#text(weight: "bold")[Estimasi OLS berganda:]

$
  hat(bold(beta)) = (bold(X)^T bold(X))^(-1) bold(X)^T bold(Y)
$

#text(weight: "bold")[Perbedaan kunci:]

+ #text(weight: "bold")[Interpretasi koefisien:] Dalam regresi berganda, $beta_j$
  adalah efek parsial $X_j$ terhadap $Y$ , dengan semua $X$ lain dikontrol
  (ceteris paribus). Ini tidak sama dengan slope regresi sederhana!

+ #text(weight: "bold")[Multikolinearitas:] Korelasi tinggi antar prediktor
  membuat $"Var"(hat(beta)_j)$ besar → estimasi tidak stabil.

+ #text(weight: "bold")[$R^2$:] $R^2$ selalu naik dengan penambahan prediktor;
  gunakan $R_"adj"^2$ untuk perbandingan model.

#text(weight: "bold")[Contoh 20.1: Harga Rumah.]
Regresi sederhana: $"Harga" = a + b dot "Luas"$.
Regresi berganda: $"Harga" = beta_0 + beta_1 "Luas" + beta_2 "Kmr" + beta_3 "Jarak" + beta_4 "Umur"$.

Slope $"Luas"$ dalam regresi berganda biasanya berbeda dari regresi sederhana
karena variabel lain (misal umur bangunan) dikorelasikan dengan luas dan
sekarang dikontrol.

=== 21. Merancang Model Regresi Berganda

#text(weight: "bold")[Strategi pemilihan variabel:]

1. #text(weight: "bold")[Berbasis teori:] Mulai dari kerangka konseptual. Variabel
   apa yang secara teoretis mempengaruhi $Y$? Jangan mulai dari data.

2. #text(weight: "bold")[Stepwise selection (forward/backward):] Tambah/hapus
   variabel berdasarkan kriteria statistik (AIC, BIC, adjusted $R^2$).
   Kelemahan: tidak stabil, bias seleksi, $p$-values invalid post-selection.

3. #text(weight: "bold")[Regularisasi (Lasso/Ridge):]
   + Ridge: $"min" sum (Y_i - hat(Y)_i)^2 + lambda sum beta_j^2$
     , menyusutkan koefisien, tidak menyeleksi.
   + Lasso: $"min" sum (Y_i - hat(Y)_i)^2 + lambda sum |beta_j|$
     , menyusutkan DAN menyeleksi (beberapa $beta_j$ jadi 0).

4. #text(weight: "bold")[Cross-validation:] Pilih model dengan $"RMSE"$ atau
   $R^2$ terbaik pada validation set (bukan training set).

#text(weight: "bold")[Kriteria pemilihan model:]

+ AIC (Akaike Information Criterion): $"AIC" = -2 log L + 2k$.
+ BIC (Bayesian Information Criterion): $"BIC" = -2 log L + k log(n)$.
  BIC menghukum kompleksitas lebih berat untuk $n > 7$.

#text(weight: "bold")[Diagnostik multikolinearitas:]

+ #text(weight: "bold")[VIF (Variance Inflation Factor):]
  $"VIF"_j = 1 / (1 - R_j^2)$ dengan $R_j^2$ adalah $R^2$ dari regresi $X_j$
  pada semua $X$ lain. $"VIF" > 10$ → multikolinearitas serius.

+ #text(weight: "bold")[Solusi:] Hapus salah satu variabel berkorelasi,
  kombinasikan (PCA, rata-rata), atau gunakan regularisasi (Ridge).

=== 22. Overfitting & Generalisasi

#text(weight: "bold")[Definisi Overfitting.] Model terlalu kompleks sehingga
"menghafal" noise dalam data training, bukan menangkap pola yang sebenarnya.
Akibat: performa bagus pada data training, tetapi buruk pada data baru.

#text(weight: "bold")[Bias-Variance Tradeoff.]

$
  E[(Y - hat(f)(X))^2] = underbrace(("Bias"(hat(f)(X)))^2, "error sistematis") + underbrace("Var"(hat(f)(X)), "variabilitas") + underbrace(sigma^2, "error irreducible")
$

+ Model terlalu sederhana → bias tinggi, varians rendah (underfitting).
+ Model terlalu kompleks → bias rendah, varians tinggi (overfitting).
+ Model optimal → tradeoff seimbang.

#text(weight: "bold")[Diagnostik overfitting:]

+ $"RMSE"_"train" << "RMSE"_"test"$ adalah tanda klasik overfitting.
+ Kurva learning: training error terus turun, validation error mulai naik.
+ $R_"adj"^2$ jauh lebih rendah dari $R^2$ → model terlalu kompleks.
+ Koefisien sangat besar (tidak masuk akal) → tanda overfitting.

#text(weight: "bold")[Teknik mencegah overfitting:]

1. #text(weight: "bold")[Cross-validation:] $k$-fold CV , data dibagi $k$
   bagian, dilatih pada $k-1$, divalidasi pada 1, diulang $k$ kali.

2. #text(weight: "bold")[Regularisasi:] Lasso (L1) dan Ridge (L2) menambahkan
   penalty pada magnitude koefisien.

3. #text(weight: "bold")[Early stopping:] Hentikan training saat validation
   error mulai naik.

4. #text(weight: "bold")[Data augmentation:] Tambah variasi data training
   (terutama di deep learning).

5. #text(weight: "bold")[Dropout (neural networks):] Randomly mematikan neuron
   saat training → ensemble implicit.

6. #text(weight: "bold")[Prinsip parsimoni (Occam's Razor):] Di antara model
   yang sama baiknya, pilih yang paling sederhana.

#text(weight: "bold")[Contoh 22.1: Polinomial Overfitting.]
Data sejati: $Y = 2 + 3X + epsilon$, $epsilon$ ~ $"Normal"(0, 1)$, $n = 10$.
Regresi linear: $hat(Y) = a + b X$, $R_"test"^2 approx 0.82$.
Polinomial derajat 9: $hat(Y) = sum_(j=0)^9 beta_j X^j$, $R_"train"^2 approx 0.999$,
tapi $R_"test"^2 approx -2.3$ (lebih buruk dari mean baseline!).

#text(weight: "bold")[Prinsip fundamental generalisasi.] Tujuan machine learning
bukan meminimalkan training error, melainkan _expected prediction error_ pada
data yang BELUM terlihat. Model terbaik adalah yang paling sederhana yang masih
menangkap pola sistematis dalam data.

#pagebreak

= Ringkasan Rumus Penting

== Distribusi Probabilitas

#table(
  columns: (auto, auto, auto, auto),
  table.header([Distribusi], [PMF/PDF], [$E[X]$], [$"Var"(X)$]),
  [Binomial], [$binom(n, k) p^k (1-p)^(n-k)$], [$n p$], [$n p (1-p)$],
  [Poisson], [$(lambda^k e^(-lambda)) / (k!)$], [$lambda$], [$lambda$],
  [Normal], [$1 / (sigma sqrt(2 pi)) exp(-((x - mu)^2) / (2 sigma^2))$], [$mu$], [$sigma^2$],
  [Uniform], [$1 / (b-a)$ untuk $x in [a,b]$], [$(a+b)/2$], [$(b-a)^2 / 12$],
  [Eksponensial], [$lambda e^(-lambda x)$], [$1/lambda$], [$1/lambda^2$],
)

#text(weight: "bold")[Rumus fundamental:]

+ Expected value (diskrit): $E[X] = sum x p(x)$
+ Expected value (kontinu): $E[X] = integral x f(x) thin d x$
+ Varians: $"Var"(X) = E[X^2] - (E[X])^2$
+ Z-score: $z = (x - mu) / sigma$
+ Kovarians: $"Cov"(X,Y) = E[(X - mu_X)(Y - mu_Y)]$
+ Korelasi: $r_("XY") = "Cov"(X,Y) / (sigma_X sigma_Y)$

== Analisis Regresi

#text(weight: "bold")[Regresi Linear Sederhana:]

+ Model: $Y_i = a + b X_i + epsilon_i$
+ Slope: $b = (sum (X_i - overline(X))(Y_i - overline(Y))) / (sum (X_i - overline(X))^2)$
+ Intercept: $a = overline(Y) - b overline(X)$
+ Prediksi: $hat(y)_0 = a + b x_0$

#text(weight: "bold")[Regresi Linear Berganda:]

+ Model: $Y = beta_0 + beta_1 X_1 + ... + beta_p X_p + epsilon$
+ OLS estimator: $hat(bold(beta)) = (bold(X)^T bold(X))^(-1) bold(X)^T bold(Y)$

#text(weight: "bold")[Evaluasi model:]

+ $"SST" = sum (Y_i - overline(Y))^2$ (total)
+ $"SSR" = sum (hat(Y)_i - overline(Y))^2$ (regresi)
+ $"SSE" = sum (Y_i - hat(Y)_i)^2$ (error)
+ $R^2 = "SSR" / "SST" = 1 - "SSE" / "SST"$
+ $R_"adj"^2 = 1 - ("SSE" / (n - p - 1)) / ("SST" / (n - 1))$

#text(weight: "bold")[Asumsi Gauss-Markov:]

+ Linearitas, Eksogenitas, Homoskedastisitas, Tidak ada autokorelasi,
  Tidak ada multikolinearitas sempurna.

#text(weight: "bold")[Dekomposisi Bias-Varians:]

+ $"MSE" = "Bias"^2 + "Varians" + sigma^2$ (error irreducible)

#pagebreak

= Perspektif Alternatif (Counter-Perspective)

#text(weight: "bold")[Mengapa perspektif alternatif diperlukan.] Statistika
bukanlah monolit. Setiap pendekatan memiliki kelemahan, dan memahami kritik
terhadap metode standar adalah tanda pemahaman mendalam , bukan sekadar
menghafal rumus.

== Kritik terhadap $p$-value dan Uji Signifikansi

+ American Statistical Association (2016): $p$-value TIDAK mengukur
  probabilitas bahwa hipotesis nol benar, dan TIDAK mengukur besarnya efek.
+ $p < 0.05$ bukan berarti "hasil penting" , dengan $n$ besar, efek yang
  sangat kecil bisa signifikan secara statistik.
+ Krisis replikasi: banyak hasil $p < 0.05$ gagal direplikasi. Penyebab:
  $p$-hacking, HARKing (Hypothesizing After Results are Known), publication bias.

== Kritik terhadap $R^2$ sebagai Metrik

+ $R^2$ hanya mengukur korelasi linear. Data dengan hubungan kuadratik
  sempurna bisa memiliki $R^2 approx 0$ dengan model linear.
+ $R^2$ tinggi tidak membuktikan model benar , contoh klasik Anscombe's quartet:
  empat dataset dengan $R^2$, mean, varians, korelasi identik tetapi plot
  sangat berbeda.
+ Menambah variabel selalu menaikkan $R^2$ (tidak pernah turun).
+ $R^2$ tidak mengukur akurasi prediktif , model overfit bisa $R_"train"^2 approx 1$
  tapi $R_"test"^2$ negatif.

== Kritik terhadap Regresi OLS Klasik

+ Asumsi OLS hampir selalu dilanggar dalam praktik. Pertanyaan bukan "apakah
  asumsi terpenuhi?" tetapi "seberapa parah pelanggarannya?"
+ OLS meminimalkan error kuadrat → sangat sensitif terhadap outlier (satu
  outlier bisa mengubah slope drastis). Alternatif: regresi robust (Huber, Tukey).
+ Inferensi kausal dari regresi observasional hampir selalu menyesatkan tanpa
  identifikasi kausal yang ketat.

== Perspektif Bayesian

+ Frequentist (yang diajarkan di sini): parameter adalah fixed unknown,
  data random. Probabilitas = frekuensi jangka panjang.
+ Bayesian: parameter adalah random variable dengan distribusi prior.
  Data fixed, kita update keyakinan via Teorema Bayes.
+ Bayesian interval (credible interval): "probabilitas parameter dalam
  interval ini adalah 95%" , lebih intuitif daripada confidence interval
  frequentist.
+ Kelemahan Bayesian: pemilihan prior subjektif; komputasi sering intensif
  (MCMC).

== Perspektif Machine Learning Modern

+ ML sering mengabaikan asumsi distribusi dan uji signifikansi, fokus pada
  akurasi prediktif out-of-sample.
+ Model black-box (Random Forest, XGBoost, Neural Networks) sering mengungguli
  regresi linear untuk prediksi , tetapi kehilangan interpretabilitas.
+ Tradeoff: interpretabilitas vs akurasi. Di domain berisiko tinggi (kedokteran,
  hukum, kredit), interpretabilitas wajib.
+ Differentiable programming: batas antara model statistika dan program
  komputer semakin kabur , model adalah kode.

== Kesimpulan Counter-Perspective

Statistika klasik yang diajarkan di sini adalah fondasi yang penting, tetapi
bukan kata akhir. Praktisi yang baik:
1. Memahami asumsi , dan kapan asumsi dilanggar.
2. Mengecek diagnostik, bukan hanya output regresi.
3. Mengakui bahwa "signifikan secara statistik" $!=$ penting secara praktis.
4. Terbuka pada pendekatan alternatif (Bayesian, ML, kausal inference).

= Quality Self-Check

Pertanyaan-pertanyaan berikut dirancang untuk menguji pemahaman konseptual
(bukan hafalan rumus). Jika Anda bisa menjawab semuanya, Anda telah menguasai
materi ini.

== Bagian I: Distribusi Probabilitas

1. Jelaskan tiga aksioma Kolmogorov dan mengapa aksioma aditif-sigma
   hanya berlaku untuk barisan _countable_ (bukan uncountable).

2. Mengapa $P(X = x) = 0$ untuk variabel kontinu? Bagaimana ini tidak
   berkontradiksi dengan kenyataan bahwa observasi spesifik bisa terjadi?

3. Turunkan $E[X] = (a+b)/2$ untuk distribusi Uniform$(a, b)$ dari definisi
   integral ekspektasi.

4. Jelaskan hubungan antara Binomial dan Poisson: kapan Poisson adalah
   aproksimasi yang baik untuk Binomial? Berikan contoh numerik.

5. Suatu variabel $X$ memiliki $"Var"(X) = 0$. Apa yang bisa disimpulkan
   tentang $X$? Buktikan dari definisi varians.

6. Deskripsikan tiga skenario di mana distribusi Normal digunakan , dan
   satu skenario di mana Normal jelas tidak tepat.

7. Z-score seorang mahasiswa adalah $z = -2.3$ untuk ujian dengan distribusi
   Normal. Interpretasikan dalam konteks persentil populasi.

8. Jelaskan bagaimana Teorema Limit Pusat (CLT) menjembatani distribusi
   apapun ke distribusi Normal. Mengapa ini fundamental?

9. Dalam konteks ML, apa perbedaan antara output softmax (probabilitas)
   dan output label keras? Kapan masing-masing lebih tepat?

10. Bagaimana temperature scaling mengubah kalibrasi probabilitas model?
    Apa efek $T > 1$ vs $T < 1$?

== Bagian II: Analisis Regresi

11. Jelaskan perbedaan antara interval konfidensi untuk mean dan interval
    prediksi untuk individu. Mengapa yang kedua selalu lebih lebar?

12. Turunkan estimator OLS untuk $b$ dari prinsip meminimalkan $"SSE"$.
    Tunjukkan bahwa garis regresi melalui $(overline(X), overline(Y))$.

13. $R^2 = 0.95$ untuk model A dengan 1 prediktor, $R^2 = 0.96$ untuk
    model B dengan 5 prediktor. Model mana yang lebih baik? Justifikasi.

14. Berikan contoh konkret di mana korelasi tinggi antara $X$ dan $Y$
    tidak mengimplikasikan kausalitas. Jelaskan mekanisme confounding-nya.

15. Apa yang terjadi pada estimasi OLS jika asumsi homoskedastisitas
    dilanggar? Apakah koefisien masih tak bias? Apakah standard error
    masih valid?

16. Dalam regresi berganda, mengapa menambah prediktor selalu menaikkan
    $R^2$ tetapi bisa menurunkan $R_"adj"^2$?

17. Jelaskan konsep multikolinearitas. Bagaimana $"VIF"$ mendeteksinya,
    dan mengapa VIF lebih dari 10 menjadi threshold konvensional?

18. Definisikan overfitting dalam konteks regresi. Berikan contoh numerik
    di mana polinomial derajat tinggi overfit data.

19. Apa perbedaan antara Lasso dan Ridge regression? Kapan Anda memilih
    Lasso daripada Ridge?

20. "Model terbaik adalah model dengan $R^2$ tertinggi." Setujukah Anda?
    Jelaskan dengan merujuk pada tradeoff bias-varians.

