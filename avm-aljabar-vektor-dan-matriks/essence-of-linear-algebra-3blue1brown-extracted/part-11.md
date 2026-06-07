---
title: "Essence of Linear Algebra (Indonesia) — Part 11: Abstract Vector Space, Saat Fungsi dan Polinomial Menjadi Vektor"
series: "Essence of Linear Algebra"
part: 11
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - vector-space
  - abstract-vector-space
  - functions
  - polynomials
difficulty: "menengah"
estimated_reading_time: "45-60 menit"
prerequisites:
  - memahami vektor geometris
  - memahami span
  - memahami basis
  - memahami linear combination
  - memahami linear transformation
learning_objectives:
  - memahami vector space secara abstrak
  - memahami bahwa vektor tidak harus berupa panah
  - memahami fungsi dan polinomial sebagai vektor
  - memahami basis dalam ruang fungsi dan polinomial
  - memahami linear transformation di luar geometri 2D/3D
source_reference:
  - "3Blue1Brown — Essence of Linear Algebra playlist"
---

# Part 11 — Abstract Vector Space, Saat Fungsi dan Polinomial Menjadi Vektor

## Masalahnya dengan “Vektor = Panah”

Sejauh ini kita sering membayangkan vektor sebagai panah.

Contoh:

$$
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

sebagai panah dari origin ke titik $(3,2)$.

Cara ini bagus untuk membangun intuisi awal.

Tapi kalau berhenti di sini, pemahaman kita terlalu sempit.

Karena dalam linear algebra modern:

> vektor tidak harus berupa panah.

Vektor bisa berupa:

- daftar angka
- polinomial
- fungsi
- sinyal audio
- gambar
- distribusi probabilitas
- state sistem
- solusi persamaan diferensial

Selama objek-objek itu bisa dijumlahkan dan dikalikan skalar dengan aturan yang masuk akal, kita bisa memperlakukannya sebagai vektor.

Ini inti dari **abstract vector space**.

---

# Kenapa Harus Abstrak?

Mungkin muncul pertanyaan:

> Ngapain repot-repot menyebut fungsi sebagai vektor?

Jawaban singkatnya:

> Karena struktur matematisnya sama.

Kalau dua jenis objek mengikuti aturan yang sama, kita bisa memakai alat yang sama untuk menganalisisnya.

Jadi konsep seperti:

- span
- basis
- dimension
- linear independence
- linear transformation
- eigenvector

tidak hanya berlaku untuk panah 2D/3D.

Konsep-konsep itu bisa berlaku untuk dunia yang jauh lebih luas.

Ini salah satu alasan linear algebra sangat powerful.

---

# Polinomial sebagai Vektor

Mulai dari contoh yang lebih ramah.

Ambil polinomial derajat maksimal 2:

$$
p(x)=a+bx+cx^2
$$

Contoh:

$$
p(x)=3+2x+5x^2
$$

Sekilas ini terlihat bukan seperti vektor.

Tapi coba lihat lebih dekat.

Polinomial ini sepenuhnya ditentukan oleh tiga koefisien:

$$
3,\ 2,\ 5
$$

Kita bisa merepresentasikannya sebagai:

$$
\begin{bmatrix}
3\\\\\\\\
2\\\\\\\\
5
\end{bmatrix}
$$

dengan basis:

$$
1,\ x,\ x^2
$$

Artinya:

$$
3+2x+5x^2
= {}
3(1)+2(x)+5(x^2)
$$

Mirip dengan:

$$
\begin{bmatrix}
3\\\\\\\\
2\\\\\\\\
5
\end{bmatrix}
= {}
3\hat{i}+2\hat{j}+5\hat{k}
$$

Bedanya, basisnya bukan arah ruang 3D.

Basisnya adalah fungsi:

$$
1,\ x,\ x^2
$$

---

# Penjumlahan Polinomial

Agar polinomial bisa dianggap sebagai vektor, kita butuh operasi penjumlahan.

Misalkan:

$$
p(x)=3+2x+5x^2
$$

dan:

$$
q(x)=1+4x-x^2
$$

Jumlahnya:

$$
p(x)+q(x)
= {}
(3+1)+(2+4)x+(5-1)x^2
$$

$$
= {}
4+6x+4x^2
$$

Kalau ditulis sebagai koordinat:

$$
p
= {}
\begin{bmatrix}
3\\\\\\\\
2\\\\\\\\
5
\end{bmatrix},
\quad
q
= {}
\begin{bmatrix}
1\\\\\\\\
4\\\\\\\\
-1
\end{bmatrix}
$$

maka:

$$
p+q
= {}
\begin{bmatrix}
4\\\\\\\\
6\\\\\\\\
4
\end{bmatrix}
$$

Ini persis seperti penjumlahan vektor biasa.

---

# Perkalian Skalar Polinomial

Sekarang kalikan polinomial dengan skalar.

Jika:

$$
p(x)=3+2x+5x^2
$$

maka:

$$
2p(x)=6+4x+10x^2
$$

Dalam koordinat:

$$
2
\begin{bmatrix}
3\\\\\\\\
2\\\\\\\\
5
\end{bmatrix}
= {}
\begin{bmatrix}
6\\\\\\\\
4\\\\\\\\
10
\end{bmatrix}
$$

Lagi-lagi, perilakunya sama seperti vektor.

Maka masuk akal untuk mengatakan:

> Polinomial dapat membentuk vector space.

---

# Ruang Polinomial Derajat Maksimal 2

Kumpulan semua polinomial berbentuk:

$$
a+bx+cx^2
$$

disebut ruang polinomial derajat maksimal 2.

Sering ditulis:

$$
P_2
$$

Setiap elemen di $P_2$ bisa ditulis sebagai:

$$
a(1)+b(x)+c(x^2)
$$

Jadi:

$$
\{1,x,x^2\}
$$

adalah basis untuk $P_2$.

Dimensinya:

$$
3
$$

Karena kita butuh tiga basis element untuk mendeskripsikan setiap polinomial di ruang itu.

---

# Jangan Terkecoh: Derajat Maksimal 2, Dimensi 3

Ini jebakan kecil.

Ruang:

$$
P_2
$$

berisi polinomial derajat maksimal 2.

Tapi dimensinya 3, bukan 2.

Kenapa?

Karena basisnya:

$$
1,\ x,\ x^2
$$

Ada tiga elemen basis.

Jadi:

$$
\dim(P_2)=3
$$

Secara umum:

$$
\dim(P_n)=n+1
$$

karena basisnya:

$$
1,\ x,\ x^2,\dots,x^n
$$

Ada $n+1$ elemen.

---

# Fungsi sebagai Vektor

Sekarang naik satu level.

Pertimbangkan semua fungsi real:

$$
f:\mathbb{R}\rightarrow\mathbb{R}
$$

Apakah fungsi bisa dijumlahkan?

Bisa.

Jika:

$$
f(x)=x^2
$$

dan:

$$
g(x)=\sin x
$$

maka:

$$
(f+g)(x)=f(x)+g(x)=x^2+\sin x
$$

Apakah fungsi bisa dikalikan skalar?

Bisa.

Jika:

$$
f(x)=x^2
$$

maka:

$$
(3f)(x)=3x^2
$$

Jadi fungsi juga bisa berperilaku seperti vektor.

---

# Fungsi sebagai Titik di Ruang Besar

Bayangkan satu fungsi sebagai satu objek.

Misalnya:

$$
f(x)=x^2
$$

Kita tidak lagi melihatnya sebagai kurva saja.

Kita melihatnya sebagai satu “titik” dalam ruang semua fungsi.

Ruang ini sangat besar.

Bahkan berdimensi tak hingga.

Tapi struktur dasarnya masih mirip:

- bisa dijumlahkan
- bisa dikalikan skalar
- bisa dibuat kombinasi linear
- bisa punya basis
- bisa punya transformasi linear

Ini ide yang awalnya agak liar, tapi sangat penting.

---

# Kombinasi Linear Fungsi

Misalkan ada fungsi:

$$
f_1(x)=1
$$

$$
f_2(x)=x
$$

$$
f_3(x)=x^2
$$

Kombinasi linear dari ketiganya adalah:

$$
a f_1(x)+b f_2(x)+c f_3(x)
$$

yaitu:

$$
a+bx+cx^2
$$

Jadi semua polinomial derajat maksimal 2 adalah span dari:

$$
1,\ x,\ x^2
$$

Dengan kata lain:

$$
P_2=\text{span}(1,x,x^2)
$$

---

# Basis Fungsi

Dalam ruang fungsi, basis bisa berupa fungsi-fungsi.

Contoh untuk polinomial:

$$
\{1,x,x^2,x^3,\dots\}
$$

bisa menjadi basis untuk ruang polinomial.

Dalam konteks sinyal, basis bisa berupa:

$$
\sin x,\ \cos x,\ \sin 2x,\ \cos 2x,\dots
$$

Ini mengarah ke Fourier series.

Intuisinya:

> sinyal kompleks bisa dibangun dari kombinasi gelombang sederhana.

Mirip seperti vektor 2D dibangun dari kombinasi $\hat{i}$ dan $\hat{j}$.

---

# Fourier sebagai Linear Algebra

Ini bagian yang worth dicatat.

Dalam Fourier analysis, sebuah fungsi periodik bisa diuraikan menjadi kombinasi gelombang sinus dan cosinus.

Secara kasar:

$$
f(x)
= {}
a_0
+
a_1\cos x
+
b_1\sin x
+
a_2\cos 2x
+
b_2\sin 2x
+\cdots
$$

Ini adalah kombinasi linear.

Basisnya adalah fungsi-fungsi gelombang.

Koordinatnya adalah koefisien Fourier:

$$
a_0,a_1,b_1,a_2,b_2,\dots
$$

Jadi Fourier bukan “topik terpisah total”.

Ia bisa dilihat sebagai linear algebra di ruang fungsi.

---

# Gambar sebagai Vektor

Sekarang contoh yang lebih dekat dengan machine learning.

Sebuah gambar grayscale 28×28 pixel punya:

$$
28\times28=784
$$

nilai pixel.

Kita bisa susun semua pixel menjadi vektor:

$$
\begin{bmatrix}
x_1\\\\\\\\
x_2\\\\\\\\
x_3\\\\\\\\
\vdots\\\\\\
x_{784}
\end{bmatrix}
$$

Jadi satu gambar adalah satu vektor di:

$$
\mathbb{R}^{784}
$$

Kalau gambar RGB 224×224, jumlah nilainya:

$$
224\times224\times3
$$

Setiap gambar bisa dianggap sebagai titik di ruang berdimensi sangat tinggi.

---

# Data sebagai Vektor

Dalam data science, satu row data sering dianggap sebagai vektor fitur.

Misalnya data mahasiswa:

| Jam Belajar | Jam Tidur | Nilai Tugas | Nilai Ujian |
|---:|---:|---:|---:|
| 5 | 7 | 80 | 85 |

Bisa ditulis sebagai:

$$
\begin{bmatrix}
5\\\\\\\\
7\\\\\\\\
80\\\\\\\\
85
\end{bmatrix}
$$

Ini vektor di $\mathbb{R}^4$.

Bukan panah yang bisa digambar mudah.

Tapi operasi linear algebra tetap berlaku.

---

# Apa Itu Vector Space?

Sekarang kita bisa beri definisi abstraknya.

Sebuah **vector space** adalah kumpulan objek yang memenuhi aturan tertentu untuk:

1. penjumlahan
2. perkalian skalar

Objek-objek di dalamnya disebut vektor.

Skalarnya biasanya bilangan real atau kompleks.

Syarat lengkapnya agak formal, tapi intinya:

- dua vektor bisa dijumlahkan dan hasilnya tetap di ruang itu
- vektor bisa dikalikan skalar dan hasilnya tetap di ruang itu
- ada zero vector
- setiap vektor punya negatifnya
- operasi-operasi tersebut konsisten dengan aljabar biasa

---

# Closure

Salah satu syarat terpenting adalah **closure**.

Artinya:

> kalau kita melakukan operasi yang diperbolehkan, hasilnya tidak keluar dari ruang.

Contoh:

Dalam $P_2$, ambil dua polinomial derajat maksimal 2:

$$
p(x)=1+x^2
$$

dan:

$$
q(x)=3+2x
$$

Jumlahnya:

$$
p(x)+q(x)=4+2x+x^2
$$

Masih derajat maksimal 2.

Jadi tetap di $P_2$.

Kalikan skalar:

$$
5p(x)=5+5x^2
$$

Masih di $P_2$.

Maka $P_2$ closed terhadap penjumlahan dan perkalian skalar.

---

# Contoh yang Bukan Vector Space

Ambil himpunan semua polinomial derajat tepat 2.

Bukan maksimal 2, tapi tepat 2.

Contoh:

$$
p(x)=x^2
$$

dan:

$$
q(x)=-x^2
$$

Keduanya derajat tepat 2.

Tapi jumlahnya:

$$
p(x)+q(x)=0
$$

Zero polynomial tidak punya derajat tepat 2.

Jadi hasilnya keluar dari himpunan.

Maka himpunan polinomial derajat tepat 2 bukan vector space.

Ini contoh bagus karena menunjukkan bahwa detail definisi penting.

---

# Zero Vector Bisa Berbentuk Apa?

Dalam vector space biasa:

$$
\mathbb{R}^2
$$

zero vector adalah:

$$
\begin{bmatrix}
0\\\\\\\\
0
\end{bmatrix}
$$

Dalam ruang polinomial, zero vector adalah:

$$
0
$$

atau:

$$
0+0x+0x^2
$$

Dalam ruang fungsi, zero vector adalah fungsi nol:

$$
f(x)=0
$$

untuk semua $x$.

Jadi zero vector bukan selalu daftar angka nol.

Ia adalah elemen netral terhadap penjumlahan di ruang tersebut.

---

# Linear Transformation secara Abstrak

Sebelumnya, transformasi linear kita bayangkan sebagai fungsi yang mengubah ruang geometris.

Tapi secara abstrak, linear transformation adalah fungsi antar vector space yang memenuhi:

$$
T(u+v)=T(u)+T(v)
$$

dan:

$$
T(cu)=cT(u)
$$

Ini berlaku tidak peduli objeknya panah, polinomial, atau fungsi.

---

# Contoh Linear Transformation pada Polinomial: Turunan

Ambil operator turunan:

$$
D(p)=p'
$$

Misalnya:

$$
p(x)=3+2x+5x^2
$$

Maka:

$$
D(p)=p'(x)=2+10x
$$

Apakah turunan linear?

Cek dua aturan.

Untuk fungsi $f$ dan $g$:

$$
D(f+g)=(f+g)'=f'+g'=D(f)+D(g)
$$

Untuk skalar $c$:

$$
D(cf)=(cf)'=cf'=cD(f)
$$

Jadi turunan adalah linear transformation.

Ini penting banget.

Turunan bukan matriks biasa di awalnya, tapi ia linear.

---

# Matriks dari Operator Turunan

Kalau kita membatasi ruang ke $P_2$ dengan basis:

$$
\{1,x,x^2\}
$$

maka operator turunan bisa direpresentasikan sebagai matriks.

Lihat efeknya pada basis:

$$
D(1)=0
$$

$$
D(x)=1
$$

$$
D(x^2)=2x
$$

Sekarang tulis hasil-hasil itu dalam basis:

$$
\{1,x,x^2\}
$$

Untuk:

$$
D(1)=0
$$

koordinatnya:

$$
\begin{bmatrix}
0\\\\\\\\
0\\\\\\\\
0
\end{bmatrix}
$$

Untuk:

$$
D(x)=1
$$

koordinatnya:

$$
\begin{bmatrix}
1\\\\\\\\
0\\\\\\\\
0
\end{bmatrix}
$$

Untuk:

$$
D(x^2)=2x
$$

koordinatnya:

$$
\begin{bmatrix}
0\\\\\\\\
2\\\\\\\\
0
\end{bmatrix}
$$

Maka matriks operator turunan adalah:

$$
[D]
= {}
\begin{bmatrix}
0 & 1 & 0\\\\\\\\
0 & 0 & 2\\\\\\\\
0 & 0 & 0
\end{bmatrix}
$$

Kolom-kolomnya adalah hasil transformasi basis.

Persis seperti Part 3.

Bedanya, basisnya sekarang bukan $\hat{i},\hat{j},\hat{k}$, tapi:

$$
1,\ x,\ x^2
$$

---

# Cek dengan Polinomial

Ambil:

$$
p(x)=3+2x+5x^2
$$

Koordinatnya:

$$
[p]=
\begin{bmatrix}
3\\\\\\\\
2\\\\\\\\
5
\end{bmatrix}
$$

Terapkan matriks turunan:

$$
[D][p]
= {}
\begin{bmatrix}
0 & 1 & 0\\\\\\\\
0 & 0 & 2\\\\\\\\
0 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
3\\\\\\\\
2\\\\\\\\
5
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
2\\\\\\\\
10\\\\\\\\
0
\end{bmatrix}
$$

Koordinat ini berarti:

$$
2+10x+0x^2
$$

Benar, karena:

$$
\frac{d}{dx}(3+2x+5x^2)=2+10x
$$

Jadi operator turunan bisa direpresentasikan sebagai matriks.

Ini momen “lah, ternyata sama aja” yang penting.

---

# Contoh Non-Linear Transformation pada Fungsi

Tidak semua operasi pada fungsi linear.

Misalnya:

$$
T(f)=f^2
$$

Apakah linear?

Cek:

$$
T(f+g)=(f+g)^2
$$

$$
=f^2+2fg+g^2
$$

Sedangkan:

$$
T(f)+T(g)=f^2+g^2
$$

Tidak sama karena ada suku:

$$
2fg
$$

Maka:

$$
T(f)=f^2
$$

bukan linear transformation.

---

# Evaluasi Fungsi sebagai Linear Transformation

Ambil operator evaluasi di titik tertentu.

Misalnya:

$$
E_2(f)=f(2)
$$

Operator ini mengambil fungsi dan menghasilkan angka.

Apakah linear?

Cek:

$$
E_2(f+g)=(f+g)(2)=f(2)+g(2)=E_2(f)+E_2(g)
$$

Dan:

$$
E_2(cf)=(cf)(2)=cf(2)=cE_2(f)
$$

Jadi evaluasi di titik tertentu adalah linear transformation.

Outputnya ada di $\mathbb{R}$.

Maka:

$$
E_2: \text{Function Space}\rightarrow\mathbb{R}
$$

linear.

---

# Integral sebagai Linear Transformation

Operator integral juga linear.

Misalnya:

$$
T(f)=\int_0^1 f(x)\,dx
$$

Cek:

$$
T(f+g)=\int_0^1 (f(x)+g(x))\,dx
$$

$$
= {}
\int_0^1 f(x)\,dx+\int_0^1 g(x)\,dx
$$

$$
= {}
T(f)+T(g)
$$

Dan:

$$
T(cf)=\int_0^1 cf(x)\,dx=c\int_0^1 f(x)\,dx=cT(f)
$$

Jadi integral adalah linear transformation dari ruang fungsi ke bilangan real.

---

# Eigenfunction

Karena fungsi bisa menjadi vektor, kita juga bisa punya eigenvector yang berupa fungsi.

Biasanya disebut:

> eigenfunction.

Misalnya operator turunan:

$$
D(f)=f'
$$

Kita cari fungsi yang setelah diturunkan hanya menjadi kelipatan dirinya sendiri:

$$
D(f)=\lambda f
$$

Contoh paling terkenal:

$$
f(x)=e^{kx}
$$

Karena:

$$
D(e^{kx})=ke^{kx}
$$

Maka:

$$
e^{kx}
$$

adalah eigenfunction dari operator turunan dengan eigenvalue:

$$
\lambda=k
$$

Ini bukan trivia.

Ini alasan fungsi eksponensial muncul di differential equations, sistem dinamis, fisika, dan engineering terus-menerus.

---

# Kenapa Eksponensial Sangat Penting?

Karena banyak sistem alam melibatkan perubahan.

Dan perubahan sering dimodelkan dengan turunan.

Kalau fungsi tidak berubah bentuk saat diturunkan, hanya berubah skala, fungsi itu menjadi sangat natural.

Itulah $e^{kx}$.

Dalam bahasa linear algebra:

> eksponensial adalah eigenfunction dari operator derivative.

Ini salah satu koneksi paling keren antara calculus dan linear algebra.

---

# Abstract Vector Space dan Machine Learning

Dalam machine learning, kita sering bekerja di ruang yang tidak bisa divisualisasikan.

Contoh:

- ruang embedding 768 dimensi
- ruang parameter neural network jutaan dimensi
- ruang fungsi model
- ruang distribusi probabilitas
- ruang gambar berdimensi ratusan ribu

Kita tidak bisa menggambarnya.

Tapi kita bisa memakai konsep linear algebra:

- jarak
- proyeksi
- basis
- subspace
- rank
- eigenvector
- singular value
- linear transformation

Inilah alasan abstraksi penting.

Bukan gaya-gayaan matematika doang.

---

# Abstract Vector Space dan Programming

Dalam programming, abstraksi ini mirip interface.

Daripada peduli objek konkretnya apa, kita peduli operasi apa yang didukung.

Kalau sebuah struktur mendukung:

- addition
- scalar multiplication
- zero element
- aturan konsisten

maka kita bisa memperlakukannya sebagai vector space.

Konsep ini muncul di:

- graphics
- signal processing
- machine learning
- numerical computing
- control systems
- physics engines
- audio processing

Jadi “vektor” bukan satu tipe data sempit.

Ia adalah pola struktur.

---

# Analogi Interface

Bayangkan interface TypeScript:

```ts
interface VectorSpace<T> {
  add(a: T, b: T): T;
  scale(c: number, v: T): T;
  zero(): T;
}
```

Objek `T` bisa berupa:

- `number[]`
- polynomial object
- function object
- image tensor
- audio buffer

Selama operasi-operasi itu valid dan memenuhi aturan vector space, kita bisa memakai pola pikir linear algebra.

Tentu implementasi real-nya jauh lebih kompleks.

Tapi analoginya membantu.

---

# Jebakan Umum

## Salah #1 — Mengira Vektor Harus Panah

Panah hanyalah visualisasi awal.

Vektor secara abstrak adalah elemen dari vector space.

---

## Salah #2 — Mengira Semua Kumpulan Objek adalah Vector Space

Tidak.

Harus closed terhadap penjumlahan dan perkalian skalar, punya zero vector, dan memenuhi aturan operasi.

Contoh polinomial derajat tepat 2 bukan vector space.

---

## Salah #3 — Mengira Basis Harus Berupa Vektor Geometris

Basis bisa berupa fungsi, polinomial, gelombang sinus, gambar, atau objek lain.

Yang penting mereka independen dan bisa membangun seluruh ruang yang dibahas.

---

## Salah #4 — Mengira Matriks Hanya untuk Angka 2D/3D

Matriks bisa merepresentasikan transformasi linear pada ruang abstrak, setelah kita memilih basis.

Operator turunan pada polinomial bisa ditulis sebagai matriks.

---

## Salah #5 — Terlalu Cepat Masuk Abstraksi

Abstraksi kuat, tapi kalau intuisi geometrisnya belum matang, ia terasa hampa.

Makanya urutan 3Blue1Brown bagus: mulai dari panah dan transformasi, baru naik ke abstrak.

Jangan sok category theory dulu, bro. Tugas kalkulus aja belum tentu kelar.

---

# Ringkasan

Vector space adalah kumpulan objek yang bisa dijumlahkan dan dikalikan skalar dengan aturan yang konsisten.

Vektor tidak harus berupa panah.

Contoh vector space:

- $\mathbb{R}^n$
- ruang polinomial $P_n$
- ruang fungsi
- ruang sinyal
- ruang gambar
- ruang data fitur

Polinomial:

$$
p(x)=a+bx+cx^2
$$

bisa dilihat sebagai vektor koordinat:

$$
\begin{bmatrix}
a\\\\\\
b\\\\\\
c
\end{bmatrix}
$$

dalam basis:

$$
\{1,x,x^2\}
$$

Fungsi juga bisa dijumlahkan dan dikalikan skalar.

Operator seperti turunan dan integral adalah linear transformation.

Operator turunan pada $P_2$ dengan basis $\{1,x,x^2\}$ punya matriks:

$$
[D]
= {}
\begin{bmatrix}
0 & 1 & 0\\\\\\\\
0 & 0 & 2\\\\\\\\
0 & 0 & 0
\end{bmatrix}
$$

Poin besarnya:

> Linear algebra bukan hanya tentang panah. Linear algebra adalah studi tentang struktur linear, apa pun bentuk objeknya.

---

# Quiz Pemahaman

## Level 1

### Soal 1

Mengapa polinomial seperti:

$$
p(x)=3+2x+5x^2
$$

bisa dianggap sebagai vektor?

---

### Soal 2

Dalam basis:

$$
\{1,x,x^2\}
$$

apa koordinat dari:

$$
p(x)=7-3x+4x^2
$$

---

### Soal 3

Apa zero vector dalam ruang fungsi?

---

## Level 2

### Soal 4

Apakah himpunan semua polinomial derajat maksimal 3 membentuk vector space?

Jelaskan singkat.

---

### Soal 5

Apakah himpunan semua polinomial derajat tepat 3 membentuk vector space?

Jelaskan singkat.

---

### Soal 6

Apakah operator turunan:

$$
D(f)=f'
$$

linear?

Jelaskan menggunakan dua aturan linearitas.

---

## Level 3

### Soal 7

Dengan basis:

$$
\{1,x,x^2\}
$$

tuliskan matriks untuk operator turunan:

$$
D(p)=p'
$$

pada ruang $P_2$.

---

### Soal 8

Gunakan matriks pada Soal 7 untuk menghitung turunan dari:

$$
p(x)=4+3x+2x^2
$$

---

### Soal 9

Apakah operator:

$$
T(f)=f^2
$$

linear?

Jelaskan.

---

### Soal 10

Mengapa:

$$
f(x)=e^{kx}
$$

disebut eigenfunction dari operator turunan?

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

Karena polinomial itu bisa dijumlahkan dan dikalikan skalar seperti vektor.

Selain itu, dalam basis $\{1,x,x^2\}$, polinomial tersebut ditentukan oleh koefisien:

$$
\begin{bmatrix}
3\\\\\\\\
2\\\\\\\\
5
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 2</summary>

$$
p(x)=7-3x+4x^2
$$

Koordinatnya:

$$
\begin{bmatrix}
7\\\\\\\\
-3\\\\\\\\
4
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 3</summary>

Zero vector dalam ruang fungsi adalah fungsi nol:

$$
f(x)=0
$$

untuk semua $x$.

</details>

<details>
<summary>Soal 4</summary>

Ya.

Himpunan semua polinomial derajat maksimal 3 closed terhadap penjumlahan dan perkalian skalar.

Jumlah dua polinomial derajat maksimal 3 tetap derajat maksimal 3, dan perkalian skalar juga tetap di ruang tersebut.

</details>

<details>
<summary>Soal 5</summary>

Tidak.

Karena jumlah dua polinomial derajat tepat 3 bisa menghasilkan polinomial dengan derajat lebih rendah atau bahkan nol.

Contoh:

$$
x^3+(-x^3)=0
$$

Zero polynomial bukan derajat tepat 3.

</details>

<details>
<summary>Soal 6</summary>

Ya.

Karena:

$$
D(f+g)=(f+g)'=f'+g'=D(f)+D(g)
$$

dan:

$$
D(cf)=(cf)'=cf'=cD(f)
$$

</details>

<details>
<summary>Soal 7</summary>

Basis:

$$
\{1,x,x^2\}
$$

Efek turunan pada basis:

$$
D(1)=0
$$

$$
D(x)=1
$$

$$
D(x^2)=2x
$$

Maka matriksnya:

$$
[D]
= {}
\begin{bmatrix}
0 & 1 & 0\\\\\\\\
0 & 0 & 2\\\\\\\\
0 & 0 & 0
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 8</summary>

Koordinat:

$$
[p]=
\begin{bmatrix}
4\\\\\\\\
3\\\\\\\\
2
\end{bmatrix}
$$

Terapkan matriks turunan:

$$
[D][p]
= {}
\begin{bmatrix}
0 & 1 & 0\\\\\\\\
0 & 0 & 2\\\\\\\\
0 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
4\\\\\\\\
3\\\\\\\\
2
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
4\\\\\\\\
0
\end{bmatrix}
$$

Artinya:

$$
p'(x)=3+4x
$$

</details>

<details>
<summary>Soal 9</summary>

Tidak.

Karena:

$$
T(f+g)=(f+g)^2=f^2+2fg+g^2
$$

sedangkan:

$$
T(f)+T(g)=f^2+g^2
$$

Biasanya tidak sama.

</details>

<details>
<summary>Soal 10</summary>

Karena:

$$
D(e^{kx})=ke^{kx}
$$

Artinya setelah operator turunan diterapkan, fungsi tersebut hanya dikalikan skalar $k$.

Jadi $e^{kx}$ adalah eigenfunction dari operator turunan dengan eigenvalue $k$.

</details>

---

# Preview Part 12

Kita sudah sampai ujung dari rangkaian inti.

Dari sini, Part 12 akan menjadi sintesis besar:

- vektor
- transformasi linear
- matriks
- determinant
- inverse
- column space
- null space
- rank
- basis
- eigenvector
- abstract vector space

Tujuannya bukan menambah konsep baru terlalu banyak.

Tujuannya:

> menyatukan semua konsep menjadi satu peta mental linear algebra.

Karena kalau semua bagian ini masih terasa terpisah, berarti pemahamannya belum sepenuhnya “klik”.

Pada Part 12, kita akan buat **grand summary** dan peta hubungan antar-konsep.

---

**Navigasi:**
← [Part 10: Eigenvector dan Eigenvalue, Arah Spesial yang Tidak Berubah](part-10.md) | [Part 12: Peta Besar Linear Algebra](part-12.md) →
