---
title: "Essence of Linear Algebra (Indonesia) — Part 8: Rank, Dimensi dari Output yang Mungkin"
series: "Essence of Linear Algebra"
part: 8
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - rank
  - dimension
  - column-space
  - linear-independence
difficulty: "menengah"
estimated_reading_time: "40-50 menit"
prerequisites:
  - memahami span
  - memahami column space
  - memahami null space
  - memahami matriks sebagai transformasi linear
  - memahami sistem linear
learning_objectives:
  - memahami rank sebagai dimensi column space
  - memahami rank sebagai jumlah arah independen pada output
  - memahami hubungan rank dengan kehilangan dimensi
  - memahami full rank dan rank-deficient matrix
  - memahami hubungan rank, null space, dan solusi sistem linear
source_reference:
  - "3Blue1Brown — Essence of Linear Algebra playlist"
---

# Part 8 — Rank, Dimensi dari Output yang Mungkin

## Masalah yang Sedang Kita Kejar

Pada Part 7, kita membahas tiga konsep besar:

- **span**: semua kombinasi linear yang mungkin
- **column space**: semua output yang mungkin dari transformasi
- **null space**: semua input yang dihancurkan menjadi nol

Sekarang muncul pertanyaan baru:

> Seberapa besar column space itu?

Atau versi geometrisnya:

> Setelah transformasi dilakukan, berapa banyak dimensi yang masih tersisa?

Jawaban dari pertanyaan itu disebut:

$$
\text{rank}
$$

Secara intuitif:

> Rank adalah jumlah arah independen yang masih hidup setelah transformasi.

---

# Mulai dari Transformasi 2D

Bayangkan transformasi linear dari 2D ke 2D:

$$
A:\mathbb{R}^2\rightarrow\mathbb{R}^2
$$

Ada beberapa kemungkinan.

---

## Kemungkinan 1 — Bidang Tetap Bidang

Misalnya:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
$$

Transformasi ini memperbesar:

- arah x sebanyak 2 kali
- arah y sebanyak 3 kali

Bidang 2D tetap menjadi bidang 2D.

Tidak ada dimensi yang hilang.

Column space-nya:

$$
\mathbb{R}^2
$$

Maka:

$$
\text{rank}(A)=2
$$

---

## Kemungkinan 2 — Bidang Runtuh Jadi Garis

Misalnya:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Kolom-kolomnya:

$$
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

dan:

$$
\begin{bmatrix}
2\\\\\\\\
4
\end{bmatrix}
$$

Kolom kedua hanya dua kali kolom pertama.

Jadi column space-nya hanya satu garis:

$$
\text{Col}(A)
= {}
\text{span}
\left(
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
\right)
$$

Column space berdimensi 1.

Maka:

$$
\text{rank}(A)=1
$$

---

## Kemungkinan 3 — Semua Runtuh ke Titik Nol

Misalnya:

$$
A=
\begin{bmatrix}
0 & 0\\\\\\\\
0 & 0
\end{bmatrix}
$$

Semua input berubah menjadi:

$$
\begin{bmatrix}
0\\\\\\\\
0
\end{bmatrix}
$$

Column space-nya hanya:

$$
\{\vec{0}\}
$$

Ini berdimensi 0.

Maka:

$$
\text{rank}(A)=0
$$

---

# Definisi Rank

Secara formal:

> Rank dari matriks adalah dimensi column space-nya.

Ditulis:

$$
\text{rank}(A)=\dim(\text{Col}(A))
$$

Versi manusia:

> Rank memberi tahu berapa banyak arah independen yang bisa dicapai oleh transformasi.

---

# Apa Itu Dimensi?

Kata “dimensi” di sini jangan dibayangkan terlalu mistis.

Dimensi adalah:

> jumlah arah independen yang dibutuhkan untuk menjangkau suatu ruang.

Contoh:

| Ruang | Dimensi | Butuh berapa arah independen? |
|---|---:|---:|
| titik | 0 | 0 |
| garis | 1 | 1 |
| bidang | 2 | 2 |
| ruang 3D | 3 | 3 |

Kalau column space berupa garis, rank = 1.

Kalau column space berupa bidang, rank = 2.

Kalau column space berupa ruang 3D, rank = 3.

---

# Rank dan Kolom Independen

Karena column space dibentuk dari kolom-kolom matriks, rank juga bisa dipahami sebagai:

> jumlah kolom independen maksimum dalam matriks.

Contoh:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Kolom kedua:

$$
\begin{bmatrix}
2\\\\\\\\
4
\end{bmatrix}
$$

hanyalah:

$$
2
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Jadi hanya ada satu arah independen.

Maka:

$$
\text{rank}(A)=1
$$

---

# Linear Independence

Sekarang kita butuh istilah penting:

> linear independence.

Sekumpulan vektor disebut **linearly independent** jika tidak ada vektor yang bisa dibuat dari kombinasi linear vektor lainnya.

Versi gampang:

> Setiap vektor benar-benar memberi arah baru.

---

## Contoh Independen

$$
\vec{v}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

dan:

$$
\vec{w}
= {}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

Keduanya independen.

Tidak ada satu pun yang bisa dibuat dari kelipatan yang lain.

Mereka memberi dua arah berbeda:

- kanan
- atas

Maka span keduanya adalah seluruh bidang 2D.

---

## Contoh Dependen

$$
\vec{v}
= {}
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

dan:

$$
\vec{w}
= {}
\begin{bmatrix}
2\\\\\\\\
4
\end{bmatrix}
$$

Keduanya dependent, karena:

$$
\vec{w}=2\vec{v}
$$

Vektor kedua tidak memberi arah baru.

Ia hanya mengulang informasi vektor pertama.

---

# Rank sebagai Jumlah Informasi Independen

Misalkan kita punya matriks:

$$
A=
\begin{bmatrix}
1 & 2 & 3\\\\\\\\
0 & 1 & 1\\\\\\\\
0 & 0 & 0
\end{bmatrix}
$$

Kolom-kolomnya berada di 3D, tapi baris ketiga selalu 0.

Artinya semua output berada pada bidang:

$$
z=0
$$

Jadi walaupun output ditulis dalam 3 koordinat, output sebenarnya hanya hidup dalam bidang 2D.

Maka rank maksimalnya 2.

Jika dua kolomnya independen, maka:

$$
\text{rank}(A)=2
$$

---

# Rank dalam Transformasi

Misalkan:

$$
A:\mathbb{R}^3\rightarrow\mathbb{R}^2
$$

Matriksnya berukuran 2×3.

Input 3D.

Output 2D.

Rank tidak mungkin lebih dari 2, karena output hanya punya 2 dimensi.

Jadi:

$$
\text{rank}(A)\leq2
$$

Secara umum, untuk matriks $m\times n$:

$$
\text{rank}(A)\leq \min(m,n)
$$

Karena:

- tidak bisa punya lebih banyak arah output daripada jumlah dimensi output
- tidak bisa punya lebih banyak arah independen daripada jumlah dimensi input

---

# Full Rank

Matriks disebut **full rank** jika rank-nya mencapai nilai maksimum yang mungkin.

Untuk matriks $m\times n$:

$$
\text{full rank}
\iff
\text{rank}(A)=\min(m,n)
$$

---

## Contoh Full Rank 2×2

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 3
\end{bmatrix}
$$

Kolomnya independen.

Rank maksimum untuk matriks 2×2 adalah 2.

Maka:

$$
\text{rank}(A)=2
$$

Matriks ini full rank.

---

## Contoh Tidak Full Rank

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Rank maksimum untuk 2×2 adalah 2.

Tapi rank-nya hanya 1.

Maka matriks ini tidak full rank.

Ia disebut:

> rank-deficient.

---

# Rank-Deficient Matrix

Matriks rank-deficient adalah matriks yang kehilangan arah independen.

Secara geometris:

> transformasi meruntuhkan ruang ke dimensi lebih rendah.

Contoh 2D:

- rank 2: bidang tetap bidang
- rank 1: bidang runtuh jadi garis
- rank 0: bidang runtuh jadi titik

Contoh 3D:

- rank 3: ruang tetap ruang 3D
- rank 2: ruang runtuh jadi bidang
- rank 1: ruang runtuh jadi garis
- rank 0: ruang runtuh jadi titik

---

# Rank dan Determinan

Untuk matriks persegi $n\times n$:

Jika:

$$
\det(A)\neq0
$$

maka:

$$
\text{rank}(A)=n
$$

Artinya full rank.

Transformasi tidak kehilangan dimensi.

---

Jika:

$$
\det(A)=0
$$

maka:

$$
\text{rank}(A)<n
$$

Artinya rank-deficient.

Transformasi kehilangan dimensi.

---

Untuk 2×2:

| Determinan | Rank | Makna |
|---|---:|---|
| $\det(A)\neq0$ | 2 | bidang tetap bidang |
| $\det(A)=0$, bukan zero matrix | 1 | bidang runtuh jadi garis |
| $A=0$ | 0 | bidang runtuh jadi titik |

---

# Rank dan Null Space

Sekarang hubungan penting.

Rank memberi tahu berapa banyak dimensi output yang masih hidup.

Null space memberi tahu berapa banyak dimensi input yang hilang.

Untuk transformasi:

$$
A:\mathbb{R}^n\rightarrow\mathbb{R}^m
$$

berlaku:

$$
\text{rank}(A)+\dim(\text{Null}(A))=n
$$

Ini disebut:

> rank-nullity theorem.

Versi manusia:

> jumlah dimensi yang bertahan + jumlah dimensi yang hilang = jumlah dimensi input awal.

---

# Contoh Rank-Nullity

Ambil:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Transformasi:

$$
A:\mathbb{R}^2\rightarrow\mathbb{R}^2
$$

Input berdimensi 2.

Kita tahu:

$$
\text{rank}(A)=1
$$

Karena output hanya garis.

Null space-nya:

$$
\text{Null}(A)
= {}
\text{span}
\left(
\begin{bmatrix}
-2\\\\\\\\
1
\end{bmatrix}
\right)
$$

Jadi:

$$
\dim(\text{Null}(A))=1
$$

Maka:

$$
\text{rank}(A)+\dim(\text{Null}(A))=1+1=2
$$

Sama dengan dimensi input.

Masuk akal:

- satu dimensi bertahan sebagai output
- satu dimensi hilang ke null space

---

# Contoh Matriks 2×3

Ambil:

$$
A=
\begin{bmatrix}
1 & 0 & 2\\\\\\\\
0 & 1 & 3
\end{bmatrix}
$$

Transformasi:

$$
A:\mathbb{R}^3\rightarrow\mathbb{R}^2
$$

Input berdimensi 3.

Rank-nya 2, karena output bisa menjangkau seluruh $\mathbb{R}^2$.

Null space-nya dari Part 7:

$$
\text{Null}(A)
= {}
\text{span}
\left(
\begin{bmatrix}
-2\\\\\\\\
-3\\\\\\\\
1
\end{bmatrix}
\right)
$$

Dimensi null space:

$$
1
$$

Maka:

$$
\text{rank}(A)+\dim(\text{Null}(A))=2+1=3
$$

Sama dengan dimensi input.

---

# Rank dan Solusi Sistem Linear

Untuk sistem:

$$
A\vec{x}=\vec{b}
$$

rank membantu menjawab dua pertanyaan:

1. apakah $\vec{b}$ berada di column space?
2. jika ada solusi, apakah solusinya unik?

---

## Apakah Ada Solusi?

Sistem punya solusi jika:

$$
\vec{b}\in\text{Col}(A)
$$

Rank memberi ukuran column space.

Tapi hati-hati:

Rank saja belum cukup untuk tahu apakah $\vec{b}$ tertentu berada di column space.

Rank memberi tahu ukuran ruang output.

Untuk target spesifik, kita tetap harus cek apakah $\vec{b}$ masuk ke ruang itu.

---

## Apakah Solusinya Unik?

Solusi unik jika null space trivial:

$$
\text{Null}(A)=\{\vec{0}\}
$$

Dengan rank-nullity:

$$
\text{rank}(A)+\dim(\text{Null}(A))=n
$$

Null space trivial berarti:

$$
\dim(\text{Null}(A))=0
$$

Maka:

$$
\text{rank}(A)=n
$$

Artinya jumlah rank sama dengan jumlah variabel.

---

# Overdetermined dan Underdetermined Systems

Dalam praktik, sistem linear sering tidak berbentuk 2×2 rapi.

Ada dua kasus umum.

---

## Overdetermined System

Jumlah persamaan lebih banyak daripada variabel.

Contoh:

$$
A:\mathbb{R}^2\rightarrow\mathbb{R}^5
$$

Matriks 5×2.

Ada 5 persamaan, 2 variabel.

Biasanya sistem seperti ini tidak punya solusi persis, karena target $\vec{b}$ di $\mathbb{R}^5$ harus jatuh tepat pada column space yang maksimal hanya berdimensi 2.

Di data science, ini sering muncul pada fitting model.

Solusinya biasanya dicari dengan pendekatan:

> least squares.

Bukan selalu solusi exact.

---

## Underdetermined System

Jumlah variabel lebih banyak daripada persamaan.

Contoh:

$$
A:\mathbb{R}^5\rightarrow\mathbb{R}^2
$$

Matriks 2×5.

Ada 2 persamaan, 5 variabel.

Kalau sistem punya solusi, biasanya solusinya tidak unik.

Kenapa?

Karena input berdimensi 5, output maksimal berdimensi 2.

Pasti ada banyak arah null space.

Banyak input berbeda bisa menghasilkan output sama.

---

# Hubungan Rank dengan Redundansi

Rank juga membantu mendeteksi redundansi.

Misalkan sebuah matriks data punya 10 kolom fitur.

Tapi rank-nya hanya 6.

Artinya:

> hanya ada 6 arah informasi independen.

Empat fitur lainnya membawa informasi yang bisa dijelaskan dari fitur-fitur lain.

Ini tidak selalu buruk.

Tapi bisa menyebabkan masalah:

- model tidak stabil
- parameter tidak unik
- multicollinearity
- solusi regresi sulit ditentukan

---

# Rank di Machine Learning

## 1. Linear Regression

Dalam linear regression, kita sering menyelesaikan:

$$
X\theta \approx y
$$

Jika kolom-kolom $X$ dependent, maka ada banyak parameter $\theta$ yang menghasilkan prediksi sama.

Masalahnya bukan prediksi saja.

Masalahnya parameter menjadi tidak unik.

---

## 2. Dimensionality Reduction

Kalau data berdimensi 100 tapi rank efektifnya hanya 5, artinya data sebenarnya banyak hidup di subspace berdimensi rendah.

Ini dasar intuisi PCA:

> cari arah-arah utama yang benar-benar membawa variasi independen.

---

## 3. Embeddings

Dalam embedding, data berdimensi tinggi sering punya struktur internal yang lebih rendah.

Rank membantu memberi bahasa matematis untuk membahas:

> seberapa banyak dimensi independen yang benar-benar dipakai?

---

# Effective Rank

Di dunia nyata, data jarang punya rank rendah secara eksak.

Lebih sering:

> hampir rank rendah.

Misalnya kolom tidak benar-benar dependent, tapi sangat mendekati dependent.

Secara numerik, ini bisa bikin matriks ill-conditioned.

Artinya:

> perubahan kecil pada input bisa menyebabkan perubahan besar pada solusi.

Ini penting dalam numerical linear algebra.

Untuk sekarang cukup tahu:

- rank eksak penting secara teori
- effective rank penting secara praktik

Jangan keburu masuk rabbit hole SVD dulu. Itu nanti.

---

# Cara Menghitung Rank Secara Praktis

Secara manual, rank biasanya dihitung dengan row reduction / Gaussian elimination.

Ide dasarnya:

> ubah matriks ke bentuk yang lebih sederhana tanpa mengubah jumlah arah independen.

Contoh:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Baris kedua adalah dua kali baris pertama.

Maka hanya ada satu baris independen.

Rank-nya:

$$
1
$$

Untuk matriks kecil, kita bisa lihat dependency langsung.

Untuk matriks besar, gunakan algoritma.

---

# Row Rank dan Column Rank

Ada fakta penting:

> jumlah kolom independen = jumlah baris independen.

Artinya:

$$
\text{column rank}=\text{row rank}
$$

Nilai ini disebut:

$$
\text{rank}(A)
$$

Secara intuitif ini tidak terlalu obvious.

Tapi sangat berguna.

Jadi kita bisa menghitung rank dengan melihat baris atau kolom.

Namun secara interpretasi transformasi, column space biasanya lebih natural karena langsung berarti output yang mungkin.

---

# Jebakan Umum

## Salah #1 — Menganggap Rank adalah Jumlah Kolom

Bukan.

Rank adalah jumlah kolom independen.

Kalau ada 10 kolom tapi semuanya kelipatan satu vektor, rank-nya 1.

---

## Salah #2 — Menganggap Rank Selalu Sama dengan Dimensi Output

Tidak.

Rank maksimal sama dengan dimensi output, tapi bisa lebih kecil.

Transformasi 3D ke 3D bisa punya rank 1 kalau ruang runtuh jadi garis.

---

## Salah #3 — Menganggap Full Rank Selalu Berarti Invertible

Hati-hati.

Untuk matriks persegi, full rank berarti invertible.

Tapi untuk matriks tidak persegi, full rank tidak berarti punya invers dua sisi seperti matriks persegi.

Contoh matriks 2×3 bisa full rank dengan rank 2, tapi tetap tidak invertible sebagai transformasi dari 3D ke 2D karena informasi pasti hilang.

---

## Salah #4 — Mengabaikan Null Space

Rank memberitahu apa yang bertahan.

Null space memberitahu apa yang hilang.

Keduanya satu paket.

Jangan cuma lihat rank.

---

# Ringkasan

Rank adalah dimensi column space:

$$
\text{rank}(A)=\dim(\text{Col}(A))
$$

Secara intuitif:

> rank adalah jumlah arah independen yang bisa dicapai oleh transformasi.

Untuk matriks $m\times n$:

$$
\text{rank}(A)\leq\min(m,n)
$$

Matriks full rank jika:

$$
\text{rank}(A)=\min(m,n)
$$

Rank-nullity theorem:

$$
\text{rank}(A)+\dim(\text{Null}(A))=n
$$

dengan $n$ adalah dimensi input atau jumlah kolom matriks.

Untuk matriks persegi:

$$
\det(A)\neq0
\iff
\text{rank}(A)=n
\iff
A \text{ invertible}
$$

---

# Quiz Pemahaman

## Level 1

### Soal 1

Apa definisi rank dari sebuah matriks?

---

### Soal 2

Jika column space sebuah matriks berupa garis, berapa rank matriks tersebut?

---

### Soal 3

Jika transformasi 2D meruntuhkan seluruh bidang menjadi titik nol, berapa rank-nya?

---

## Level 2

### Soal 4

Diberikan:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Berapa rank $A$?

Jelaskan.

---

### Soal 5

Diberikan:

$$
B=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 1
\end{bmatrix}
$$

Berapa rank $B$?

---

### Soal 6

Untuk matriks 3×5, berapa rank maksimum yang mungkin?

---

### Soal 7

Untuk matriks 7×3, berapa rank maksimum yang mungkin?

---

## Level 3

### Soal 8

Diberikan transformasi:

$$
A:\mathbb{R}^3\rightarrow\mathbb{R}^2
$$

Jika:

$$
\text{rank}(A)=2
$$

berapa dimensi null space-nya?

---

### Soal 9

Diberikan transformasi:

$$
A:\mathbb{R}^5\rightarrow\mathbb{R}^2
$$

Jika $A$ full rank, berapa dimensi null space-nya?

---

### Soal 10

Jelaskan mengapa matriks 2×3 yang full rank tetap tidak bisa punya invers seperti matriks 2×2 invertible.

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

Rank adalah dimensi column space sebuah matriks.

Secara intuitif, rank adalah jumlah arah independen yang bisa dicapai oleh transformasi.

</details>

<details>
<summary>Soal 2</summary>

Rank = 1.

Garis berdimensi 1.

</details>

<details>
<summary>Soal 3</summary>

Rank = 0.

Output hanya zero vector, yaitu ruang berdimensi 0.

</details>

<details>
<summary>Soal 4</summary>

Rank = 1.

Karena kolom kedua adalah dua kali kolom pertama:

$$
\begin{bmatrix}
2\\\\\\\\
4
\end{bmatrix}
= {}
2
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Jadi hanya ada satu arah independen.

</details>

<details>
<summary>Soal 5</summary>

Rank = 2.

Kedua kolomnya independen dan menjangkau seluruh $\mathbb{R}^2$.

</details>

<details>
<summary>Soal 6</summary>

Matriks 3×5 punya rank maksimum:

$$
\min(3,5)=3
$$

</details>

<details>
<summary>Soal 7</summary>

Matriks 7×3 punya rank maksimum:

$$
\min(7,3)=3
$$

</details>

<details>
<summary>Soal 8</summary>

Input berdimensi 3.

Dengan rank-nullity:

$$
\text{rank}(A)+\dim(\text{Null}(A))=3
$$

$$
2+\dim(\text{Null}(A))=3
$$

Jadi:

$$
\dim(\text{Null}(A))=1
$$

</details>

<details>
<summary>Soal 9</summary>

$A:\mathbb{R}^5\rightarrow\mathbb{R}^2$

Jika full rank, maka:

$$
\text{rank}(A)=2
$$

Dengan rank-nullity:

$$
2+\dim(\text{Null}(A))=5
$$

Maka:

$$
\dim(\text{Null}(A))=3
$$

</details>

<details>
<summary>Soal 10</summary>

Matriks 2×3 memetakan input 3D ke output 2D.

Walaupun full rank berarti output bisa menjangkau seluruh $\mathbb{R}^2$, transformasi tetap kehilangan informasi karena input punya 3 dimensi sementara output hanya 2 dimensi.

Jadi banyak input berbeda bisa menghasilkan output sama. Karena itu tidak ada invers dua sisi seperti pada matriks persegi invertible.

</details>

---

# Preview Part 9

Sejauh ini kita memakai basis standar:

$$
\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix},
\quad
\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

Tapi sebenarnya basis standar bukan satu-satunya cara mendeskripsikan vektor.

Vektor yang sama bisa punya koordinat berbeda jika kita memakai basis berbeda.

Pada Part 9, kita akan masuk ke:

$$
\text{change of basis}
$$

atau perubahan basis.

Ini konsep yang awalnya terasa abstrak, tapi sangat penting untuk memahami:

- eigenvector
- diagonalization
- computer graphics
- coordinate systems
- machine learning representation

Poin besarnya nanti:

> Koordinat bukan vektor itu sendiri. Koordinat hanyalah cara mendeskripsikan vektor menurut pilihan basis tertentu.

---

**Navigasi:**
← [Part 7: Span, Column Space, dan Null Space](part-07.md) | [Part 9: Change of Basis, Ketika Koordinat Bergantung pada Sudut Pandang](part-09.md) →
