---
title: "Cheatsheet AVM — Vektor Euclidean, Ruang Euclid, Transformasi Linear, Eigen"
course: "AVM"
format: "Open Book — 1 lembar HVS A4"
exam_duration: "90 menit"
total_questions: 4
weight_per_question: "25%"
language: "id"
---

# Cheatsheet AVM

## 0. Pola Ujian

| No | Topik | Skill utama |
|---:|---|---|
| 1 | Vektor Euclidean + jarak antar bidang | dot product, norm, plane distance |
| 2 | Soal cerita ruang Euclid | representasi vektor, jarak, sudut, proyeksi |
| 3 | Ruang vektor umum + transformasi linear | basis, matriks transformasi, eliminasi Gaussian |
| 4 | Eigenvalue dan eigenvector | characteristic equation, null space |

---

# 1. Vektor Euclidean

## Vektor di $\mathbb{R}^n$

$$
\vec{u}=(u_1,u_2,\dots,u_n)
$$

$$
\vec{v}=(v_1,v_2,\dots,v_n)
$$

## Penjumlahan Vektor

$$
\vec{u}+\vec{v}
=
(u_1+v_1,u_2+v_2,\dots,u_n+v_n)
$$

## Perkalian Skalar

$$
c\vec{u}
=
(cu_1,cu_2,\dots,cu_n)
$$

## Dot Product

$$
\vec{u}\cdot\vec{v}
=
u_1v_1+u_2v_2+\cdots+u_nv_n
$$

## Panjang / Magnitudo / Norm

$$
\|\vec{u}\|
=
\sqrt{u_1^2+u_2^2+\cdots+u_n^2}
$$

## Jarak Dua Titik

Jika:

$$
P=(x_1,y_1,z_1)
$$

dan:

$$
Q=(x_2,y_2,z_2)
$$

maka:

$$
d(P,Q)
=
\sqrt{(x_2-x_1)^2+(y_2-y_1)^2+(z_2-z_1)^2}
$$

atau:

$$
d(P,Q)=\|\overrightarrow{PQ}\|
$$

dengan:

$$
\overrightarrow{PQ}=Q-P
$$

---

# 2. Sudut dan Tegak Lurus

## Sudut antar Vektor

$$
\cos\theta
=
\frac{\vec{u}\cdot\vec{v}}
{\|\vec{u}\|\|\vec{v}\|}
$$

## Tegak Lurus

Dua vektor tegak lurus jika:

$$
\vec{u}\cdot\vec{v}=0
$$

## Sejajar

Dua vektor sejajar jika salah satunya kelipatan skalar dari yang lain:

$$
\vec{u}=c\vec{v}
$$

---

# 3. Bidang di $\mathbb{R}^3$

## Bentuk Umum Bidang

$$
ax+by+cz+d=0
$$

Normal vector bidang:

$$
\vec{n}=(a,b,c)
$$

## Jarak Titik ke Bidang

Jika titik:

$$
P(x_0,y_0,z_0)
$$

dan bidang:

$$
ax+by+cz+d=0
$$

maka:

$$
d(P,\pi)
=
\frac{|ax_0+by_0+cz_0+d|}
{\sqrt{a^2+b^2+c^2}}
$$

## Jarak Antar Dua Bidang Sejajar

Misal:

$$
\pi_1: ax+by+cz+d_1=0
$$

$$
\pi_2: ax+by+cz+d_2=0
$$

maka:

$$
d(\pi_1,\pi_2)
=
\frac{|d_2-d_1|}
{\sqrt{a^2+b^2+c^2}}
$$

Syarat penting:

> Rumus ini hanya langsung berlaku kalau koefisien $a,b,c$ sama.

Kalau bidangnya:

$$
2x+4y+6z+8=0
$$

dan:

$$
x+2y+3z+5=0
$$

samakan dulu koefisien normalnya.

Bagi bidang pertama dengan 2:

$$
x+2y+3z+4=0
$$

baru bandingkan dengan:

$$
x+2y+3z+5=0
$$

## Jika Dua Bidang Tidak Sejajar

Kalau normal vector tidak sejajar, bidang berpotongan.

Maka jarak antar bidang:

$$
0
$$

---

# 4. Soal Cerita Ruang Euclid

Biasanya pola soal:

- posisi
- perpindahan
- jarak
- arah
- sudut
- tegak lurus
- proyeksi

## Perpindahan Total

Jika objek bergerak:

$$
\vec{v}_1
$$

lalu:

$$
\vec{v}_2
$$

maka perpindahan total:

$$
\vec{v}_{total}
=
\vec{v}_1+\vec{v}_2
$$

## Panjang Lintasan

Kalau lintasannya terdiri dari dua segmen:

$$
L
=
\|\vec{v}_1\|+\|\vec{v}_2\|
$$

Jangan disamakan dengan:

$$
\|\vec{v}_1+\vec{v}_2\|
$$

Itu jarak lurus dari awal ke akhir.

## Proyeksi Vektor

Proyeksi $\vec{u}$ ke arah $\vec{v}$:

$$
\text{proj}_{\vec{v}}(\vec{u})
=
\frac{\vec{u}\cdot\vec{v}}{\vec{v}\cdot\vec{v}}\vec{v}
$$

---

# 5. Ruang Vektor Umum

Sebuah himpunan disebut ruang vektor jika closed terhadap:

1. penjumlahan
2. perkalian skalar

dan memenuhi aturan vektor.

Contoh ruang vektor:

$$
\mathbb{R}^2,\mathbb{R}^3,\mathbb{R}^n
$$

Polinomial derajat maksimal 2:

$$
P_2=\{a+bx+cx^2\}
$$

Matriks ukuran $2\times2$:

$$
M_{2\times2}
$$

Fungsi tertentu.

## Bukan Ruang Vektor

Contoh:

> Semua polinomial derajat tepat 2.

Karena:

$$
x^2+(-x^2)=0
$$

hasilnya bukan polinomial derajat tepat 2.

---

# 6. Basis dan Koordinat

Basis adalah kumpulan vektor yang:

1. span seluruh ruang
2. linearly independent

Untuk $P_2$ basis standar:

$$
\{1,x,x^2\}
$$

Jika:

$$
p(x)=3+2x+5x^2
$$

maka koordinatnya terhadap basis tersebut:

$$
[p]_{\mathcal{B}}
=
\begin{bmatrix}
3\\
2\\
5
\end{bmatrix}
$$

---

# 7. Transformasi Linear

Transformasi $T$ linear jika:

$$
T(u+v)=T(u)+T(v)
$$

dan:

$$
T(cu)=cT(u)
$$

## Matriks Transformasi

Kalau basis domain:

$$
\mathcal{B}=\{b_1,b_2,\dots,b_n\}
$$

dan basis kodomain:

$$
\mathcal{C}
$$

maka matriks $T$ didapat dari:

$$
[T]_{\mathcal{C}\leftarrow\mathcal{B}}
=
\begin{bmatrix}
| & | & & |\\
[T(b_1)]_{\mathcal{C}} & [T(b_2)]_{\mathcal{C}} & \cdots & [T(b_n)]_{\mathcal{C}}\\
| & | & & |
\end{bmatrix}
$$

Intinya:

> Kolom matriks transformasi adalah hasil transformasi basis domain.

---

# 8. Eliminasi Gaussian

Target utama:

1. buat leading 1
2. nolkan elemen di bawah leading 1
3. lanjut ke kolom berikutnya
4. kalau perlu, lanjut sampai reduced row echelon form

Operasi baris elementer:

$$
R_i \leftrightarrow R_j
$$

$$
R_i \leftarrow cR_i
$$

$$
R_i \leftarrow R_i+cR_j
$$

## Bentuk Sistem

$$
A\vec{x}=\vec{b}
$$

Augmented matrix:

$$
[A|\vec{b}]
$$

Contoh:

$$
\begin{bmatrix}
1 & 2 & | & 5\\
3 & 4 & | & 6
\end{bmatrix}
$$

---

# 9. Eigenvalue dan Eigenvector

Untuk matriks persegi $A$:

$$
A\vec{v}=\lambda\vec{v}
$$

dengan:

- $\lambda$ = eigenvalue
- $\vec{v}$ = eigenvector
- $\vec{v}\neq0$

## Langkah Mencari Eigenvalue

Cari:

$$
\det(A-\lambda I)=0
$$

## Langkah Mencari Eigenvector

Untuk setiap $\lambda$, selesaikan:

$$
(A-\lambda I)\vec{v}=0
$$

pakai eliminasi Gaussian.

## Matriks 2×2

Jika:

$$
A=
\begin{bmatrix}
a & b\\
c & d
\end{bmatrix}
$$

maka:

$$
A-\lambda I
=
\begin{bmatrix}
a-\lambda & b\\
c & d-\lambda
\end{bmatrix}
$$

Characteristic equation:

$$
(a-\lambda)(d-\lambda)-bc=0
$$

---

# Latihan Model Ujian

## Soal 1 — Vektor Euclidean dan Jarak Antar Bidang

Diberikan dua vektor di $\mathbb{R}^3$:

$$
\vec{u}=(3,-2,6)
$$

$$
\vec{v}=(1,4,-2)
$$

dan dua bidang:

$$
\pi_1: 2x-y+2z-5=0
$$

$$
\pi_2: 4x-2y+4z+6=0
$$

Jawab:

1. Hitung $\vec{u}+\vec{v}$.
2. Hitung $\|\vec{u}\|$ dan $\|\vec{v}\|$.
3. Tentukan apakah $\vec{u}$ dan $\vec{v}$ saling tegak lurus.
4. Hitung jarak antara bidang $\pi_1$ dan $\pi_2$.

---

## Pembahasan Soal 1

### 1. Penjumlahan Vektor

$$
\vec{u}+\vec{v}
=
(3+1,-2+4,6+(-2))
$$

$$
=
(4,2,4)
$$

---

### 2. Norm

$$
\|\vec{u}\|
=
\sqrt{3^2+(-2)^2+6^2}
$$

$$
=
\sqrt{9+4+36}
=
\sqrt{49}
=
7
$$

$$
\|\vec{v}\|
=
\sqrt{1^2+4^2+(-2)^2}
$$

$$
=
\sqrt{1+16+4}
=
\sqrt{21}
$$

---

### 3. Tegak Lurus

Cek dot product:

$$
\vec{u}\cdot\vec{v}
=
3(1)+(-2)(4)+6(-2)
$$

$$
=
3-8-12
=
-17
$$

Karena:

$$
\vec{u}\cdot\vec{v}\neq0
$$

maka $\vec{u}$ dan $\vec{v}$ tidak tegak lurus.

---

### 4. Jarak Antar Bidang

Bidang:

$$
\pi_1: 2x-y+2z-5=0
$$

$$
\pi_2: 4x-2y+4z+6=0
$$

Koefisien normal belum sama.

Bagi $\pi_2$ dengan 2:

$$
2x-y+2z+3=0
$$

Sekarang:

$$
\pi_1: 2x-y+2z-5=0
$$

$$
\pi_2: 2x-y+2z+3=0
$$

Maka:

$$
d_1=-5,\quad d_2=3
$$

Normal:

$$
\vec{n}=(2,-1,2)
$$

Jarak:

$$
d(\pi_1,\pi_2)
=
\frac{|d_2-d_1|}{\sqrt{2^2+(-1)^2+2^2}}
$$

$$
=
\frac{|3-(-5)|}{\sqrt{4+1+4}}
$$

$$
=
\frac{8}{3}
$$

Jadi jarak antar bidang:

$$
\boxed{\frac{8}{3}}
$$

---

# Soal 2 — Soal Cerita Ruang Euclid

Sebuah drone bergerak dari titik $A$ ke titik $B$ dengan vektor perpindahan:

$$
\vec{v}_1=(40,30,20)
$$

dalam satuan meter, dengan sumbu:

- $x$ = timur
- $y$ = utara
- $z$ = ketinggian

Kemudian drone bergerak dari $B$ ke $C$ dengan vektor:

$$
\vec{v}_2=(20,-10,15)
$$

Jawab:

1. Tentukan vektor perpindahan total dari $A$ ke $C$.
2. Hitung panjang lintasan yang ditempuh drone.
3. Hitung jarak lurus dari $A$ ke $C$.
4. Apakah dua segmen lintasan tersebut saling tegak lurus?
5. Hitung sudut antara kedua segmen lintasan.

---

## Pembahasan Soal 2

### 1. Perpindahan Total

$$
\vec{v}_{AC}
=
\vec{v}_1+\vec{v}_2
$$

$$
=
(40+20,30+(-10),20+15)
$$

$$
=
(60,20,35)
$$

---

### 2. Panjang Lintasan

Panjang lintasan bukan norm dari total langsung.

Karena drone bergerak dua segmen:

$$
L
=
\|\vec{v}_1\|+\|\vec{v}_2\|
$$

Hitung:

$$
\|\vec{v}_1\|
=
\sqrt{40^2+30^2+20^2}
$$

$$
=
\sqrt{1600+900+400}
=
\sqrt{2900}
=
10\sqrt{29}
$$

$$
\|\vec{v}_2\|
=
\sqrt{20^2+(-10)^2+15^2}
$$

$$
=
\sqrt{400+100+225}
=
\sqrt{725}
=
5\sqrt{29}
$$

Maka:

$$
L
=
10\sqrt{29}+5\sqrt{29}
=
15\sqrt{29}
$$

---

### 3. Jarak Lurus dari $A$ ke $C$

$$
\|\vec{v}_{AC}\|
=
\sqrt{60^2+20^2+35^2}
$$

$$
=
\sqrt{3600+400+1225}
$$

$$
=
\sqrt{5225}
=
5\sqrt{209}
$$

---

### 4. Tegak Lurus atau Tidak

Cek dot product:

$$
\vec{v}_1\cdot\vec{v}_2
=
40(20)+30(-10)+20(15)
$$

$$
=
800-300+300
=
800
$$

Karena:

$$
800\neq0
$$

maka kedua segmen tidak tegak lurus.

---

### 5. Sudut Antar Segmen

$$
\cos\theta
=
\frac{\vec{v}_1\cdot\vec{v}_2}
{\|\vec{v}_1\|\|\vec{v}_2\|}
$$

$$
=
\frac{800}
{(10\sqrt{29})(5\sqrt{29})}
$$

$$
=
\frac{800}{50\cdot29}
=
\frac{800}{1450}
=
\frac{16}{29}
$$

Maka:

$$
\theta=\cos^{-1}\left(\frac{16}{29}\right)
$$

---

# Soal 3 — Ruang Vektor Umum dan Transformasi Linear

Diberikan ruang vektor:

$$
P_2=\{a+bx+cx^2\mid a,b,c\in\mathbb{R}\}
$$

dengan basis standar:

$$
\mathcal{B}=\{1,x,x^2\}
$$

Didefinisikan transformasi linear:

$$
T:P_2\rightarrow P_2
$$

dengan:

$$
T(p(x))=p'(x)+p(0)
$$

Jawab:

1. Hitung $T(1)$, $T(x)$, dan $T(x^2)$.
2. Tentukan matriks representasi $[T]_{\mathcal{B}}$.
3. Hitung $T(2+3x+x^2)$ menggunakan matriks.
4. Selesaikan dengan eliminasi Gaussian: cari $p(x)=a+bx+cx^2$ sehingga:

$$
T(p(x))=5+4x
$$

---

## Pembahasan Soal 3

### 1. Hitung Transformasi Basis

Basis:

$$
1,\ x,\ x^2
$$

Untuk:

$$
p(x)=1
$$

maka:

$$
p'(x)=0,\quad p(0)=1
$$

jadi:

$$
T(1)=0+1=1
$$

Koordinat terhadap $\mathcal{B}$:

$$
[T(1)]_{\mathcal{B}}
=
\begin{bmatrix}
1\\
0\\
0
\end{bmatrix}
$$

---

Untuk:

$$
p(x)=x
$$

maka:

$$
p'(x)=1,\quad p(0)=0
$$

jadi:

$$
T(x)=1
$$

Koordinat:

$$
[T(x)]_{\mathcal{B}}
=
\begin{bmatrix}
1\\
0\\
0
\end{bmatrix}
$$

---

Untuk:

$$
p(x)=x^2
$$

maka:

$$
p'(x)=2x,\quad p(0)=0
$$

jadi:

$$
T(x^2)=2x
$$

Koordinat:

$$
[T(x^2)]_{\mathcal{B}}
=
\begin{bmatrix}
0\\
2\\
0
\end{bmatrix}
$$

---

### 2. Matriks Representasi

Kolom matriks adalah hasil transformasi basis:

$$
[T]_{\mathcal{B}}
=
\begin{bmatrix}
| & | & |\\
[T(1)]_{\mathcal{B}} & [T(x)]_{\mathcal{B}} & [T(x^2)]_{\mathcal{B}}\\
| & | & |
\end{bmatrix}
$$

Maka:

$$
[T]_{\mathcal{B}}
=
\begin{bmatrix}
1 & 1 & 0\\
0 & 0 & 2\\
0 & 0 & 0
\end{bmatrix}
$$

---

### 3. Hitung $T(2+3x+x^2)$

Koordinat:

$$
[p]_{\mathcal{B}}
=
\begin{bmatrix}
2\\
3\\
1
\end{bmatrix}
$$

Maka:

$$
[T(p)]_{\mathcal{B}}
=
[T]_{\mathcal{B}}[p]_{\mathcal{B}}
$$

$$
=
\begin{bmatrix}
1 & 1 & 0\\
0 & 0 & 2\\
0 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
2\\
3\\
1
\end{bmatrix}
$$

$$
=
\begin{bmatrix}
5\\
2\\
0
\end{bmatrix}
$$

Jadi:

$$
T(2+3x+x^2)=5+2x
$$

Cek manual:

$$
p'(x)=3+2x
$$

$$
p(0)=2
$$

$$
T(p)=3+2x+2=5+2x
$$

---

### 4. Cari $p(x)$ sehingga $T(p)=5+4x$

Misal:

$$
p(x)=a+bx+cx^2
$$

Koordinat:

$$
[p]_{\mathcal{B}}
=
\begin{bmatrix}
a\\
b\\
c
\end{bmatrix}
$$

Target:

$$
5+4x+0x^2
$$

Koordinat target:

$$
\begin{bmatrix}
5\\
4\\
0
\end{bmatrix}
$$

Sistem:

$$
\begin{bmatrix}
1 & 1 & 0\\
0 & 0 & 2\\
0 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
a\\
b\\
c
\end{bmatrix}
=
\begin{bmatrix}
5\\
4\\
0
\end{bmatrix}
$$

Augmented matrix:

$$
\begin{bmatrix}
1 & 1 & 0 & | & 5\\
0 & 0 & 2 & | & 4\\
0 & 0 & 0 & | & 0
\end{bmatrix}
$$

Dari baris kedua:

$$
2c=4
$$

$$
c=2
$$

Dari baris pertama:

$$
a+b=5
$$

Ambil parameter:

$$
b=t
$$

maka:

$$
a=5-t
$$

Jadi:

$$
p(x)=(5-t)+tx+2x^2
$$

dengan:

$$
t\in\mathbb{R}
$$

Jawaban umum:

$$
\boxed{p(x)=5-t+tx+2x^2}
$$

---

# Soal 4 — Eigenvalue dan Eigenvector

Diberikan matriks:

$$
A=
\begin{bmatrix}
4 & 1\\
2 & 3
\end{bmatrix}
$$

Jawab:

1. Tentukan eigenvalue dari $A$.
2. Tentukan eigenvector untuk setiap eigenvalue.
3. Apakah matriks $A$ memiliki dua eigenvector independen?
4. Jika iya, tuliskan matriks $P$ yang kolomnya eigenvector.

---

## Pembahasan Soal 4

### 1. Eigenvalue

Cari:

$$
\det(A-\lambda I)=0
$$

$$
A-\lambda I
=
\begin{bmatrix}
4-\lambda & 1\\
2 & 3-\lambda
\end{bmatrix}
$$

Determinan:

$$
(4-\lambda)(3-\lambda)-2
$$

Hitung:

$$
(4-\lambda)(3-\lambda)-2
=
12-4\lambda-3\lambda+\lambda^2-2
$$

$$
=
\lambda^2-7\lambda+10
$$

Set nol:

$$
\lambda^2-7\lambda+10=0
$$

Faktorkan:

$$
(\lambda-5)(\lambda-2)=0
$$

Maka eigenvalue:

$$
\lambda_1=5
$$

$$
\lambda_2=2
$$

---

### 2. Eigenvector untuk $\lambda=5$

Cari:

$$
(A-5I)\vec{v}=0
$$

$$
A-5I
=
\begin{bmatrix}
-1 & 1\\
2 & -2
\end{bmatrix}
$$

Sistem:

$$
-x+y=0
$$

Maka:

$$
y=x
$$

Ambil:

$$
x=1
$$

maka:

$$
y=1
$$

Eigenvector:

$$
\vec{v}_1=
\begin{bmatrix}
1\\
1
\end{bmatrix}
$$

---

### 3. Eigenvector untuk $\lambda=2$

Cari:

$$
(A-2I)\vec{v}=0
$$

$$
A-2I
=
\begin{bmatrix}
2 & 1\\
2 & 1
\end{bmatrix}
$$

Sistem:

$$
2x+y=0
$$

Maka:

$$
y=-2x
$$

Ambil:

$$
x=1
$$

maka:

$$
y=-2
$$

Eigenvector:

$$
\vec{v}_2=
\begin{bmatrix}
1\\
-2
\end{bmatrix}
$$

---

### 4. Independen atau Tidak

Cek apakah:

$$
\begin{bmatrix}
1\\
1
\end{bmatrix}
$$

dan:

$$
\begin{bmatrix}
1\\
-2
\end{bmatrix}
$$

sejajar.

Tidak, karena tidak ada skalar $c$ sehingga:

$$
\begin{bmatrix}
1\\
1
\end{bmatrix}
=
c
\begin{bmatrix}
1\\
-2
\end{bmatrix}
$$

Maka keduanya independen.

Matriks $P$:

$$
P=
\begin{bmatrix}
1 & 1\\
1 & -2
\end{bmatrix}
$$

---

# Latihan Tambahan Tanpa Pembahasan

## Paket A

### 1. Vektor dan Bidang

Diberikan:

$$
\vec{a}=(2,1,-3)
$$

$$
\vec{b}=(4,-2,1)
$$

dan bidang:

$$
\pi_1:x+2y-2z+4=0
$$

$$
\pi_2:2x+4y-4z-6=0
$$

Tentukan:

1. $\vec{a}-\vec{b}$
2. $\|\vec{a}\|$
3. apakah $\vec{a}$ dan $\vec{b}$ tegak lurus
4. jarak $\pi_1$ dan $\pi_2$

---

### 2. Soal Cerita Euclid

Sebuah kapal bergerak dengan vektor:

$$
\vec{v}_1=(15,20)
$$

lalu:

$$
\vec{v}_2=(-5,10)
$$

Tentukan:

1. perpindahan total
2. panjang lintasan
3. jarak lurus dari awal ke akhir
4. sudut antara dua perpindahan

---

### 3. Transformasi Linear

Pada $P_2$ dengan basis:

$$
\{1,x,x^2\}
$$

diberikan:

$$
T(p(x))=p'(x)+2p(0)
$$

Tentukan:

1. $T(1),T(x),T(x^2)$
2. matriks $[T]$
3. $T(1+2x+3x^2)$
4. semua $p(x)$ sehingga $T(p)=4+6x$

---

### 4. Eigen

Diberikan:

$$
A=
\begin{bmatrix}
3 & 2\\
2 & 3
\end{bmatrix}
$$

Tentukan eigenvalue dan eigenvector.

---

# Checklist Cepat Pas Ujian

## Kalau ketemu vektor

Cek:

- dimensi berapa?
- diminta norm?
- diminta dot product?
- diminta sudut?
- diminta tegak lurus?

## Kalau ketemu bidang

Cek:

- bentuk $ax+by+cz+d=0$
- normal vector $(a,b,c)$
- bidang sejajar atau tidak?
- kalau sejajar, samakan koefisien dulu

## Kalau soal cerita

Pisahkan:

- perpindahan total: jumlah vektor
- panjang lintasan: jumlah norm tiap segmen
- jarak awal-akhir: norm dari resultan
- tegak lurus: dot product = 0

## Kalau transformasi linear

Kerjakan urutan:

1. tentukan basis
2. hitung transformasi tiap basis
3. jadikan hasilnya kolom matriks
4. gunakan Gaussian kalau diminta solving

## Kalau eigen

Kerjakan urutan:

1. hitung $A-\lambda I$
2. hitung $\det(A-\lambda I)=0$
3. dapatkan $\lambda$
4. untuk tiap $\lambda$, solve $(A-\lambda I)\vec{v}=0$
5. tulis eigenvector sebagai span

---
