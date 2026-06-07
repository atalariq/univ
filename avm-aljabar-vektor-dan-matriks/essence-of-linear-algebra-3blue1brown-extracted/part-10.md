---
title: "Essence of Linear Algebra (Indonesia) — Part 10: Eigenvector dan Eigenvalue, Arah Spesial yang Tidak Berubah"
series: "Essence of Linear Algebra"
part: 10
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - eigenvector
  - eigenvalue
  - diagonalization
  - transformation
difficulty: "menengah"
estimated_reading_time: "45-60 menit"
prerequisites:
  - memahami vektor
  - memahami transformasi linear
  - memahami matriks sebagai transformasi linear
  - memahami determinant
  - memahami null space
  - memahami change of basis
learning_objectives:
  - memahami eigenvector sebagai arah yang tidak berubah oleh transformasi
  - memahami eigenvalue sebagai faktor scaling pada eigenvector
  - memahami persamaan $A\vec{v}=\lambda\vec{v}$
  - memahami cara mencari eigenvalue dengan determinant
  - memahami hubungan eigenbasis dengan diagonalization
source_reference:
  - "3Blue1Brown — Essence of Linear Algebra playlist"
---

# Part 10 — Eigenvector dan Eigenvalue, Arah Spesial yang Tidak Berubah

## Kenapa Eigenvector Terasa Aneh?

Banyak mahasiswa pertama kali bertemu eigenvector lewat kalimat seperti ini:

> Cari nilai eigen dan vektor eigen dari matriks berikut.

Lalu langsung diberi rumus:

$$
A\vec{v}=\lambda\vec{v}
$$

Kemudian:

$$
\det(A-\lambda I)=0
$$

Dan dari situ, eigenvector berubah menjadi ritual aljabar.

Padahal idenya sangat geometris.

> Eigenvector adalah vektor yang arahnya tidak berubah setelah transformasi linear.

Ia boleh:

- memanjang
- memendek
- berbalik arah

Tapi ia tetap berada pada garis yang sama.

---

# Transformasi Biasanya Mengubah Arah Vektor

Ambil transformasi shear:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Transformasi ini mengubah:

$$
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
\rightarrow
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
$$

Arah vektor berubah.

Vektor yang tadinya lurus ke atas menjadi miring ke kanan atas.

Untuk banyak vektor, transformasi akan mengubah arahnya.

---

# Tapi Ada Arah yang Tetap

Pada shear tadi:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

lihat vektor:

$$
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

Jika ditransformasikan:

$$
A
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

Arah dan panjangnya bahkan tetap.

Artinya:

$$
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

adalah eigenvector dari $A$.

Kenapa?

Karena setelah transformasi, ia tetap berada pada garis yang sama.

---

# Eigenvector: Definisi Intuitif

Sebuah vektor non-zero $\vec{v}$ disebut **eigenvector** dari transformasi $A$ jika setelah transformasi:

$$
A\vec{v}
$$

hasilnya tetap berada pada garis yang sama dengan $\vec{v}$.

Dengan kata lain:

$$
A\vec{v}
$$

hanya versi scaled dari:

$$
\vec{v}
$$

Maka ada suatu skalar $\lambda$ sehingga:

$$
A\vec{v}=\lambda\vec{v}
$$

Skalar $\lambda$ disebut:

> eigenvalue.

---

# Kenapa Vektor Nol Tidak Dihitung?

Secara teknis:

$$
A\vec{0}=\vec{0}
$$

untuk semua matriks $A$.

Kalau zero vector dihitung sebagai eigenvector, semua transformasi punya “eigenvector” yang tidak memberi informasi apa pun.

Itu useless.

Maka eigenvector harus non-zero:

$$
\vec{v}\neq\vec{0}
$$

---

# Eigenvalue: Faktor Scaling

Jika:

$$
A\vec{v}=\lambda\vec{v}
$$

maka $\lambda$ memberi tahu apa yang terjadi pada eigenvector.

| Eigenvalue | Makna Geometris |
|---:|---|
| $\lambda=2$ | vektor memanjang 2 kali |
| $\lambda=\frac{1}{2}$ | vektor memendek jadi setengah |
| $\lambda=1$ | vektor tetap sama |
| $\lambda=0$ | vektor diruntuhkan ke nol |
| $\lambda=-1$ | vektor berbalik arah dengan panjang sama |
| $\lambda=-3$ | vektor berbalik arah dan memanjang 3 kali |

Jadi eigenvalue bukan angka ajaib.

Ia adalah skala pada arah eigenvector.

---

# Contoh 1 — Scaling Diagonal

Ambil:

$$
A=
\begin{bmatrix}
3 & 0\\\\\\\\
0 & 2
\end{bmatrix}
$$

Transformasi ini:

- mengalikan arah x dengan 3
- mengalikan arah y dengan 2

Basis vector standar:

$$
\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

dipetakan menjadi:

$$
A\hat{i}
= {}
\begin{bmatrix}
3\\\\\\\\
0
\end{bmatrix}
= {}
3
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

Jadi $\hat{i}$ adalah eigenvector dengan eigenvalue:

$$
\lambda=3
$$

---

Untuk:

$$
\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

kita punya:

$$
A\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
2
\end{bmatrix}
= {}
2
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

Jadi $\hat{j}$ adalah eigenvector dengan eigenvalue:

$$
\lambda=2
$$

---

# Contoh 2 — Refleksi

Refleksi terhadap sumbu x:

$$
A=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & -1
\end{bmatrix}
$$

Untuk:

$$
\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

hasilnya:

$$
A\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
= {}
1\hat{i}
$$

Maka:

$$
\lambda=1
$$

Arah horizontal tetap.

---

Untuk:

$$
\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

hasilnya:

$$
A\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
-1
\end{bmatrix}
= {}
-1\hat{j}
$$

Maka:

$$
\lambda=-1
$$

Arah vertikal dibalik.

---

# Contoh 3 — Shear

Ambil shear:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Kita cek arah horizontal:

$$
\vec{v}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

Maka:

$$
A\vec{v}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
= {}
1\vec{v}
$$

Jadi arah horizontal adalah eigenvector dengan:

$$
\lambda=1
$$

Tapi arah vertikal:

$$
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

menjadi:

$$
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
$$

Ini bukan kelipatan dari:

$$
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

Maka arah vertikal bukan eigenvector.

---

# Contoh 4 — Rotasi 90 Derajat

Rotasi 90 derajat:

$$
R=
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 0
\end{bmatrix}
$$

Secara geometris, setiap vektor non-zero di bidang diputar 90 derajat.

Tidak ada vektor non-zero yang tetap pada garisnya sendiri.

Maka di ruang real 2D:

> rotasi 90 derajat tidak punya eigenvector real.

Ini penting.

Tidak semua transformasi 2D punya eigenvector real.

Kalau masuk bilangan kompleks, ceritanya beda. Tapi untuk intuisi geometris real, cukup pegang:

> rotasi murni bisa tidak memiliki arah tetap.

---

# Persamaan Eigen

Sekarang kita kembali ke rumus:

$$
A\vec{v}=\lambda\vec{v}
$$

Artinya:

> setelah transformasi $A$, vektor $\vec{v}$ hanya discale oleh $\lambda$.

Kita bisa tulis ulang:

$$
A\vec{v}-\lambda\vec{v}=0
$$

Karena:

$$
\lambda\vec{v}=\lambda I\vec{v}
$$

maka:

$$
A\vec{v}-\lambda I\vec{v}=0
$$

Faktorkan:

$$
(A-\lambda I)\vec{v}=\vec{0}
$$

Ini berarti:

> kita mencari vektor non-zero yang masuk ke null space dari $A-\lambda I$.

---

# Kenapa Determinan Muncul?

Agar ada eigenvector non-zero, kita butuh:

$$
(A-\lambda I)\vec{v}=\vec{0}
$$

punya solusi non-zero.

Artinya null space dari:

$$
A-\lambda I
$$

tidak trivial.

Ini terjadi ketika transformasi:

$$
A-\lambda I
$$

meruntuhkan ruang.

Dengan kata lain:

$$
\det(A-\lambda I)=0
$$

Nah, inilah kenapa rumus determinant muncul.

Bukan karena ritual.

Tapi karena kita mencari nilai $\lambda$ yang membuat:

$$
A-\lambda I
$$

kehilangan dimensi sehingga ada vektor non-zero yang dipetakan ke nol.

---

# Characteristic Equation

Persamaan:

$$
\det(A-\lambda I)=0
$$

disebut:

> characteristic equation.

Solusi $\lambda$ dari persamaan ini adalah eigenvalue.

Setelah eigenvalue ditemukan, eigenvector dicari dari:

$$
(A-\lambda I)\vec{v}=\vec{0}
$$

alias null space dari:

$$
A-\lambda I
$$

---

# Contoh Menghitung Eigenvalue

Ambil:

$$
A=
\begin{bmatrix}
3 & 0\\\\\\\\
0 & 2
\end{bmatrix}
$$

Hitung:

$$
A-\lambda I
= {}
\begin{bmatrix}
3 & 0\\\\\\\\
0 & 2
\end{bmatrix}
- {}
\lambda
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 1
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
3-\lambda & 0\\\\\\\\
0 & 2-\lambda
\end{bmatrix}
$$

Determinan:

$$
\det(A-\lambda I)
= {}
(3-\lambda)(2-\lambda)
$$

Set nol:

$$
(3-\lambda)(2-\lambda)=0
$$

Maka:

$$
\lambda=3
$$

atau:

$$
\lambda=2
$$

Sesuai intuisi tadi.

---

# Cari Eigenvector untuk $\lambda=3$

Gunakan:

$$
(A-3I)\vec{v}=\vec{0}
$$

$$
A-3I
= {}
\begin{bmatrix}
0 & 0\\\\\\\\
0 & -1
\end{bmatrix}
$$

Misalkan:

$$
\vec{v}
= {}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
$$

Maka:

$$
\begin{bmatrix}
0 & 0\\\\\\\\
0 & -1
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
\begin{bmatrix}
0\\\\\\\\
-y
\end{bmatrix}
= {}
\begin{bmatrix}
0\\\\\\\\
0
\end{bmatrix}
$$

Jadi:

$$
y=0
$$

$x$ bebas, selama bukan nol.

Maka eigenvector-nya semua vektor pada arah:

$$
\text{span}
\left(
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
\right)
$$

---

# Cari Eigenvector untuk $\lambda=2$

Gunakan:

$$
(A-2I)\vec{v}=\vec{0}
$$

$$
A-2I
= {}
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 0
\end{bmatrix}
$$

Maka:

$$
x=0
$$

$y$ bebas, selama bukan nol.

Eigenvector-nya semua vektor pada arah:

$$
\text{span}
\left(
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
\right)
$$

---

# Contoh Non-Diagonal

Ambil:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 2
\end{bmatrix}
$$

Kita cari eigenvalue.

$$
A-\lambda I
= {}
\begin{bmatrix}
2-\lambda & 1\\\\\\\\
1 & 2-\lambda
\end{bmatrix}
$$

Determinan:

$$
\det(A-\lambda I)
= {}
(2-\lambda)^2-1
$$

Set nol:

$$
(2-\lambda)^2-1=0
$$

$$
(2-\lambda)^2=1
$$

Maka:

$$
2-\lambda=1
$$

atau:

$$
2-\lambda=-1
$$

Jadi:

$$
\lambda=1
$$

atau:

$$
\lambda=3
$$

---

# Eigenvector untuk $\lambda=3$

Gunakan:

$$
A-3I
= {}
\begin{bmatrix}
-1 & 1\\\\\\\\
1 & -1
\end{bmatrix}
$$

Cari:

$$
\begin{bmatrix}
-1 & 1\\\\\\\\
1 & -1
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
\begin{bmatrix}
0\\\\\\\\
0
\end{bmatrix}
$$

Persamaan:

$$
-x+y=0
$$

Maka:

$$
y=x
$$

Eigenvector-nya berada pada garis:

$$
\text{span}
\left(
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
\right)
$$

Cek:

$$
A
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
3
\end{bmatrix}
= {}
3
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
$$

Benar.

---

# Eigenvector untuk $\lambda=1$

Gunakan:

$$
A-1I
= {}
\begin{bmatrix}
1 & 1\\\\\\\\
1 & 1
\end{bmatrix}
$$

Cari:

$$
\begin{bmatrix}
1 & 1\\\\\\\\
1 & 1
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
\begin{bmatrix}
0\\\\\\\\
0
\end{bmatrix}
$$

Persamaan:

$$
x+y=0
$$

Maka:

$$
y=-x
$$

Eigenvector-nya berada pada garis:

$$
\text{span}
\left(
\begin{bmatrix}
1\\\\\\\\
-1
\end{bmatrix}
\right)
$$

Cek:

$$
A
\begin{bmatrix}
1\\\\\\\\
-1
\end{bmatrix}
= {}
\begin{bmatrix}
1\\\\\\\\
-1
\end{bmatrix}
= {}
1
\begin{bmatrix}
1\\\\\\\\
-1
\end{bmatrix}
$$

---

# Makna Geometris Contoh Ini

Untuk:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 2
\end{bmatrix}
$$

ada dua arah spesial:

1. arah $\begin{bmatrix}1\\1\end{bmatrix}$ discale 3 kali
2. arah $\begin{bmatrix}1\\-1\end{bmatrix}$ tetap discale 1 kali

Jadi transformasi ini, walaupun dalam basis standar terlihat mencampur x dan y, sebenarnya sederhana jika dilihat dari basis:

$$
\left\{
\begin{bmatrix}
1\1
\end{bmatrix},
\begin{bmatrix}
1\-1
\end{bmatrix}
\right\}
$$

Itulah jembatan ke diagonalization.

---

# Eigenbasis

Jika sebuah transformasi punya cukup eigenvector independen untuk membentuk basis, maka basis itu disebut:

> eigenbasis.

Dalam 2D, kita butuh dua eigenvector independen.

Dalam 3D, kita butuh tiga eigenvector independen.

Jika punya eigenbasis, transformasi akan terlihat sangat sederhana dalam basis tersebut.

Kenapa?

Karena setiap basis vector hanya discale.

Tidak saling campur.

---

# Diagonal Matrix sebagai Transformasi Sederhana

Matriks diagonal:

$$
D=
\begin{bmatrix}
\lambda_1 & 0\\\\\\\\
0 & \lambda_2
\end{bmatrix}
$$

berarti:

- basis vector pertama discale $\lambda_1$
- basis vector kedua discale $\lambda_2$

Tidak ada campur aduk.

Tidak ada shear.

Tidak ada rotasi antar basis.

Jadi kalau suatu transformasi bisa ditulis sebagai diagonal dalam basis eigenvector, kita menang banyak.

---

# Diagonalization

Misalkan $A$ punya eigenbasis.

Buat matriks $P$ yang kolom-kolomnya adalah eigenvector:

$$
P=
\begin{bmatrix}
| & |\\\\\\\\
\vec{v}_1 & \vec{v}_2\\\\\\\\
| & |
\end{bmatrix}
$$

Lalu buat matriks diagonal:

$$
D=
\begin{bmatrix}
\lambda_1 & 0\\\\\\\\
0 & \lambda_2
\end{bmatrix}
$$

Maka hubungan utamanya:

$$
A=PDP^{-1}
$$

atau setara:

$$
D=P^{-1}AP
$$

Ini sama seperti Part 9.

Maknanya:

> Jika kita melihat transformasi $A$ dari basis eigenvector, transformasi itu menjadi diagonal.

---

# Kenapa $D=P^{-1}AP$?

Ingat change of basis.

$P$ berisi basis baru, yaitu eigenvectors.

Maka:

$$
P^{-1}AP
$$

berarti:

1. mulai dari koordinat eigenbasis
2. ubah ke koordinat standar dengan $P$
3. terapkan transformasi $A$
4. ubah balik ke koordinat eigenbasis dengan $P^{-1}$

Karena basisnya eigenvectors, hasilnya hanya scaling per koordinat.

Maka matriksnya diagonal:

$$
D
$$

---

# Contoh Diagonalization

Untuk:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 2
\end{bmatrix}
$$

kita punya eigenvectors:

$$
\vec{v}_1=
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
,\quad
\lambda_1=3
$$

dan:

$$
\vec{v}_2=
\begin{bmatrix}
1\\\\\\\\
-1
\end{bmatrix}
,\quad
\lambda_2=1
$$

Maka:

$$
P=
\begin{bmatrix}
1 & 1\\\\\\\\
1 & -1
\end{bmatrix}
$$

dan:

$$
D=
\begin{bmatrix}
3 & 0\\\\\\\\
0 & 1
\end{bmatrix}
$$

Sehingga:

$$
D=P^{-1}AP
$$

atau:

$$
A=PDP^{-1}
$$

Secara geometris:

> $A$ adalah transformasi yang dalam basis eigenvector hanya melakukan scaling 3 pada satu arah dan scaling 1 pada arah lainnya.

---

# Kenapa Ini Berguna?

Karena menghitung pangkat matriks menjadi jauh lebih mudah.

Misalnya kita ingin menghitung:

$$
A^{100}
$$

Kalau langsung mengalikan $A$ sebanyak 100 kali, ngeselin.

Tapi jika:

$$
A=PDP^{-1}
$$

maka:

$$
A^2=(PDP^{-1})(PDP^{-1})
$$

Karena:

$$
P^{-1}P=I
$$

maka:

$$
A^2=PD^2P^{-1}
$$

Secara umum:

$$
A^n=PD^nP^{-1}
$$

Dan $D^n$ mudah:

$$
D^n=
\begin{bmatrix}
\lambda_1^n & 0\\\\\\\\
0 & \lambda_2^n
\end{bmatrix}
$$

Ini bukan cuma trik.

Ini alasan eigenvector penting dalam dinamika sistem, Markov chain, differential equations, PageRank, PCA, dan banyak tempat lain.

---

# Eigenvalue Nol

Kalau suatu transformasi punya eigenvalue:

$$
\lambda=0
$$

artinya ada eigenvector non-zero:

$$
\vec{v}
$$

yang dipetakan ke:

$$
\vec{0}
$$

Karena:

$$
A\vec{v}=0\vec{v}=\vec{0}
$$

Maka $\vec{v}$ berada di null space.

Jadi:

> eigenvalue 0 berarti transformasi menghancurkan suatu arah non-zero.

Akibatnya matriks tidak invertible.

Dengan kata lain:

$$
0 \text{ adalah eigenvalue}
\iff
\det(A)=0
$$

untuk matriks persegi.

---

# Eigenvalue dan Determinan

Untuk matriks yang punya eigenvalue:

$$
\lambda_1,\lambda_2,\dots,\lambda_n
$$

determinan berkaitan dengan hasil kali eigenvalue:

$$
\det(A)=\lambda_1\lambda_2\cdots\lambda_n
$$

Secara geometris masuk akal.

Jika dalam eigenbasis transformasi hanya melakukan scaling:

- arah pertama dikali $\lambda_1$
- arah kedua dikali $\lambda_2$
- dan seterusnya

Maka faktor perubahan volume total adalah hasil kali semua scaling tersebut.

---

# Eigenvalue dan Trace

Ada hubungan lain:

$$
\text{tr}(A)=\lambda_1+\lambda_2+\cdots+\lambda_n
$$

Trace adalah jumlah elemen diagonal matriks.

Untuk sekarang, jangan terlalu dikejar dulu.

Tapi nanti berguna dalam banyak konteks.

---

# Tidak Semua Matriks Bisa Didiagonalisasi

Hati-hati.

Tidak semua matriks punya cukup eigenvector independen untuk membentuk eigenbasis.

Contoh shear:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Matriks ini hanya punya satu arah eigenvector real independen, yaitu arah horizontal.

Padahal untuk basis 2D, kita butuh dua eigenvector independen.

Maka matriks ini tidak bisa didiagonalisasi dalam basis real biasa.

Ini bukan bug.

Ini struktur transformasinya memang tidak punya cukup arah yang tetap.

---

# Hubungan dengan PCA

PCA, secara kasar, mencari arah utama dalam data.

Jika kita punya covariance matrix, eigenvectors-nya memberi arah principal components.

Eigenvalue-nya memberi ukuran variasi data pada arah tersebut.

Secara intuitif:

- eigenvector = arah variasi utama
- eigenvalue besar = variasi besar pada arah itu
- eigenvalue kecil = variasi kecil pada arah itu

Jadi eigenvector bukan konsep abstrak doang.

Ia dipakai untuk memahami struktur data.

---

# Hubungan dengan PageRank

Google PageRank awalnya berhubungan dengan eigenvector dari matriks transisi.

Secara kasar, halaman penting adalah halaman yang mendapat “bobot” dari halaman penting lain.

PageRank mencari distribusi stabil:

$$
A\vec{v}=\vec{v}
$$

Ini adalah eigenvector dengan eigenvalue:

$$
\lambda=1
$$

Maknanya:

> setelah sistem transisi diterapkan, distribusi tidak berubah.

---

# Hubungan dengan Sistem Dinamis

Misalkan sistem berevolusi dengan aturan:

$$
\vec{x}_{t+1}=A\vec{x}_t
$$

Setelah banyak langkah:

$$
\vec{x}_n=A^n\vec{x}_0
$$

Eigenvector memberi arah yang hanya tumbuh atau menyusut tanpa berubah arah.

Eigenvalue menentukan laju pertumbuhan atau penyusutan.

Jika:

$$
|\lambda|>1
$$

arah itu tumbuh.

Jika:

$$
|\lambda|<1
$$

arah itu mengecil.

Jika:

$$
\lambda<0
$$

arah itu berganti sisi setiap langkah.

---

# Jebakan Umum

## Salah #1 — Menganggap Eigenvector Hanya Hasil Hitungan

Eigenvector punya makna geometris:

> arah yang tidak berubah oleh transformasi.

Kalau cuma hafal rumus, konsepnya jadi mati.

---

## Salah #2 — Menganggap Semua Matriks Punya Eigenvector Real

Tidak.

Rotasi 90 derajat di 2D tidak punya eigenvector real.

---

## Salah #3 — Menganggap Eigenvalue Selalu Positif

Tidak.

Eigenvalue bisa:

- positif
- negatif
- nol
- kompleks

Dalam seri ini kita fokus pada real dulu.

---

## Salah #4 — Menganggap Eigenvector Itu Unik

Kalau:

$$
\vec{v}
$$

adalah eigenvector, maka:

$$
c\vec{v}
$$

juga eigenvector untuk semua skalar non-zero $c$.

Jadi eigenvector lebih tepat dipahami sebagai arah atau garis, bukan satu panah spesifik.

---

## Salah #5 — Menganggap Diagonalization Selalu Bisa

Tidak semua matriks punya cukup eigenvector independen.

Kalau tidak punya eigenbasis, tidak bisa didiagonalisasi dengan cara biasa.

---

# Ringkasan

Eigenvector adalah vektor non-zero yang tidak berubah arah setelah transformasi linear.

Secara matematis:

$$
A\vec{v}=\lambda\vec{v}
$$

dengan:

- $\vec{v}$ = eigenvector
- $\lambda$ = eigenvalue

Eigenvalue memberi faktor scaling pada eigenvector.

Untuk mencari eigenvalue:

$$
\det(A-\lambda I)=0
$$

Untuk mencari eigenvector:

$$
(A-\lambda I)\vec{v}=\vec{0}
$$

Jika sebuah matriks punya cukup eigenvector independen untuk membentuk basis, maka dalam basis tersebut transformasinya menjadi diagonal:

$$
D=P^{-1}AP
$$

atau:

$$
A=PDP^{-1}
$$

Poin besar:

> Eigenvectors are the axes where a transformation becomes simple.

---

# Quiz Pemahaman

## Level 1

### Soal 1

Apa definisi intuitif eigenvector?

---

### Soal 2

Jika:

$$
A\vec{v}=5\vec{v}
$$

apa eigenvalue yang terkait dengan $\vec{v}$?

Apa maknanya?

---

### Soal 3

Apakah zero vector boleh disebut eigenvector?

Jelaskan.

---

## Level 2

### Soal 4

Diberikan:

$$
A=
\begin{bmatrix}
4 & 0\\\\\\\\
0 & 2
\end{bmatrix}
$$

Tentukan eigenvalue dan eigenvector arah standarnya.

---

### Soal 5

Diberikan refleksi terhadap sumbu x:

$$
A=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & -1
\end{bmatrix}
$$

Apa eigenvalue untuk arah horizontal dan vertikal?

---

### Soal 6

Mengapa rotasi 90 derajat di bidang real tidak punya eigenvector real?

---

## Level 3

### Soal 7

Diberikan:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 2
\end{bmatrix}
$$

Cari eigenvalue-nya menggunakan:

$$
\det(A-\lambda I)=0
$$

---

### Soal 8

Untuk matriks pada Soal 7, cari eigenvector untuk eigenvalue terbesar.

---

### Soal 9

Jelaskan mengapa:

$$
D=P^{-1}AP
$$

menjadi diagonal jika kolom-kolom $P$ adalah eigenvector dari $A$.

---

### Soal 10

Jika sebuah matriks punya eigenvalue 0, apa artinya terhadap invertibility matriks tersebut?

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

Eigenvector adalah vektor non-zero yang setelah transformasi linear tetap berada pada garis yang sama.

Arahnya tidak berubah, meskipun panjangnya bisa berubah atau arahnya bisa berbalik.

</details>

<details>
<summary>Soal 2</summary>

Eigenvalue-nya:

$$
\lambda=5
$$

Maknanya: vektor $\vec{v}$ discale 5 kali oleh transformasi $A$ tanpa berubah arah.

</details>

<details>
<summary>Soal 3</summary>

Tidak.

Zero vector selalu dipetakan ke zero vector oleh semua transformasi linear, sehingga tidak memberi informasi arah spesial apa pun.

</details>

<details>
<summary>Soal 4</summary>

Untuk:

$$
\hat{i}=
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

$$
A\hat{i}
= {}
\begin{bmatrix}
4\\\\\\\\
0
\end{bmatrix}
= {}
4\hat{i}
$$

Jadi eigenvalue arah x adalah 4.

Untuk:

$$
\hat{j}=
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

$$
A\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
2
\end{bmatrix}
= {}
2\hat{j}
$$

Jadi eigenvalue arah y adalah 2.

</details>

<details>
<summary>Soal 5</summary>

Arah horizontal:

$$
\lambda=1
$$

Arah vertikal:

$$
\lambda=-1
$$

</details>

<details>
<summary>Soal 6</summary>

Karena setiap vektor non-zero diputar 90 derajat, sehingga tidak ada vektor real non-zero yang tetap berada pada garis semula.

</details>

<details>
<summary>Soal 7</summary>

$$
A-\lambda I
= {}
\begin{bmatrix}
2-\lambda & 1\\\\\\\\
1 & 2-\lambda
\end{bmatrix}
$$

$$
\det(A-\lambda I)
= {}
(2-\lambda)^2-1
$$

Set nol:

$$
(2-\lambda)^2-1=0
$$

$$
(2-\lambda)^2=1
$$

Maka:

$$
\lambda=3
$$

atau:

$$
\lambda=1
$$

</details>

<details>
<summary>Soal 8</summary>

Eigenvalue terbesar adalah:

$$
\lambda=3
$$

Cari:

$$
(A-3I)\vec{v}=0
$$

$$
\begin{bmatrix}
-1 & 1\\\\\\\\
1 & -1
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
=0
$$

Dapat:

$$
y=x
$$

Jadi eigenvector-nya berada pada:

$$
\text{span}
\left(
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
\right)
$$

</details>

<details>
<summary>Soal 9</summary>

Karena dalam basis eigenvector, setiap basis vector hanya discale oleh eigenvalue-nya masing-masing.

Tidak ada basis vector yang berubah menjadi kombinasi basis vector lain.

Maka representasi transformasinya hanya berisi scaling di diagonal:

$$
D=
\begin{bmatrix}
\lambda_1 & 0\\\\\\\\
0 & \lambda_2
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 10</summary>

Jika ada eigenvalue 0, berarti ada vektor non-zero yang dipetakan ke zero vector.

Artinya null space tidak trivial, informasi hilang, dan matriks tidak invertible.

</details>

---

# Preview Part 11

Eigenvector membawa kita ke ide yang lebih abstrak:

> Yang penting dari linear algebra bukan selalu panah di 2D atau 3D.

Ternyata banyak objek lain bisa diperlakukan sebagai vektor:

- polinomial
- fungsi
- sinyal
- gambar
- distribusi probabilitas
- state sistem

Selama objek-objek itu bisa dijumlahkan dan dikalikan skalar dengan aturan yang konsisten, kita bisa membahasnya sebagai vector space.

Pada Part 11, kita akan meninggalkan panah geometris dan masuk ke:

$$
\text{abstract vector spaces}
$$

Ini bagian yang membuat linear algebra terasa jauh lebih luas dari sekadar matriks dan panah.

---

**Navigasi:**
← [Part 9: Change of Basis, Ketika Koordinat Bergantung pada Sudut Pandang](part-09.md) | [Part 11: Abstract Vector Space, Saat Fungsi dan Polinomial Menjadi Vektor](part-11.md) →
