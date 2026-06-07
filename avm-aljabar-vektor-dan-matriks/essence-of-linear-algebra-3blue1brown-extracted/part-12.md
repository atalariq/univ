---
title: "Essence of Linear Algebra (Indonesia) — Part 12: Peta Besar Linear Algebra"
series: "Essence of Linear Algebra"
part: 12
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - summary
  - mental-model
  - matrix
  - eigenvector
difficulty: "pemula-menengah"
estimated_reading_time: "45-60 menit"
prerequisites:
  - memahami vektor
  - memahami transformasi linear
  - memahami matriks
  - memahami determinant
  - memahami inverse
  - memahami span
  - memahami column space
  - memahami null space
  - memahami rank
  - memahami basis
  - memahami eigenvector
  - memahami abstract vector space
learning_objectives:
  - menyatukan konsep inti linear algebra menjadi satu peta mental
  - memahami hubungan antar konsep, bukan sekadar definisi terpisah
  - memahami linear algebra sebagai bahasa transformasi dan struktur linear
  - melihat koneksi linear algebra ke computer graphics, data science, machine learning, dan sistem dinamis
source_reference:
  - "3Blue1Brown — Essence of Linear Algebra playlist"
---

# Part 12 — Peta Besar Linear Algebra

## Kita Sudah Belajar Banyak. Jangan Sampai Jadi Fragmen.

Sampai titik ini, kita sudah melewati banyak konsep:

- vektor
- transformasi linear
- matriks
- perkalian matriks
- determinant
- inverse
- span
- column space
- null space
- rank
- basis
- change of basis
- eigenvector
- eigenvalue
- abstract vector space

Kalau semua konsep itu masih terasa seperti topik-topik terpisah, wajar.

Linear algebra memang sering diajarkan seperti daftar istilah.

Tapi tujuan seri ini bukan membuat daftar istilah.

Tujuannya adalah membangun satu peta mental:

> Linear algebra adalah studi tentang struktur linear, terutama bagaimana objek dapat dikombinasikan, ditransformasikan, direpresentasikan, dan disederhanakan.

Kalau dibuat lebih konkret:

> Linear algebra adalah bahasa untuk memahami ruang dan transformasi.

---

# Peta Besar

Secara kasar, alurnya seperti ini:

$$
\text{Vector}
\rightarrow
\text{Linear Combination}
\rightarrow
\text{Span}
\rightarrow
\text{Basis}
\rightarrow
\text{Linear Transformation}
\rightarrow
\text{Matrix}
\rightarrow
\text{Determinant}
\rightarrow
\text{Inverse}
\rightarrow
\text{Column Space}
\rightarrow
\text{Null Space}
\rightarrow
\text{Rank}
\rightarrow
\text{Change of Basis}
\rightarrow
\text{Eigenvectors}
\rightarrow
\text{Abstract Vector Space}
$$

Tapi ini bukan urutan kaku.

Konsep-konsep itu saling mengunci.

Mari kita satukan satu per satu.

---

# 1. Vektor: Objek yang Bisa Diarahkan dan Diskalakan

Kita mulai dari vektor.

Dalam geometri 2D/3D, vektor bisa dibayangkan sebagai panah.

Contoh:

$$
\vec{v}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

berarti:

> 3 langkah ke kanan, 2 langkah ke atas.

Tapi pelajaran pentingnya bukan sekadar panah.

Vektor adalah objek yang bisa:

1. dijumlahkan
2. dikalikan skalar

Contoh:

$$
\vec{u}+\vec{v}
$$

dan:

$$
c\vec{v}
$$

Inilah dua operasi dasar yang membuat struktur linear muncul.

---

# 2. Linear Combination: Cara Membangun Vektor Baru

Kalau kita punya beberapa vektor:

$$
\vec{v}_1,\vec{v}_2,\dots,\vec{v}_n
$$

maka kombinasi linear berbentuk:

$$
c_1\vec{v}_1+c_2\vec{v}_2+\cdots+c_n\vec{v}_n
$$

Ini ide sederhana:

> scale beberapa vektor, lalu jumlahkan.

Tapi dari ide ini lahir banyak konsep penting:

- span
- basis
- column space
- linear independence
- systems of equations

Banyak linear algebra sebenarnya cuma variasi dari pertanyaan:

> Vektor apa saja yang bisa dibuat dari kombinasi linear vektor-vektor ini?

---

# 3. Span: Semua yang Bisa Dicapai

Span adalah himpunan semua kombinasi linear yang mungkin.

Jika:

$$
\vec{v}
= {}
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

maka:

$$
\text{span}(\vec{v})
$$

adalah semua kelipatan dari $\vec{v}$.

Secara geometris:

> sebuah garis yang melewati origin.

Jika kita punya dua vektor independen di 2D:

$$
\vec{v},\vec{w}
$$

maka:

$$
\text{span}(\vec{v},\vec{w})=\mathbb{R}^2
$$

Artinya seluruh bidang bisa dicapai.

Span menjawab:

> ruang apa yang bisa dibangun dari vektor-vektor ini?

---

# 4. Basis: Sistem Koordinat untuk Mendeskripsikan Ruang

Basis adalah sekumpulan vektor yang:

1. menjangkau seluruh ruang
2. tidak redundant

Dalam 2D, basis standar adalah:

$$
\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
,\quad
\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

Maka:

$$
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
= {}
3\hat{i}+2\hat{j}
$$

Artinya koordinat:

$$
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

adalah instruksi:

> ambil 3 unit dari basis pertama, 2 unit dari basis kedua.

Poin penting:

> Koordinat bukan vektornya. Koordinat adalah deskripsi vektor berdasarkan basis tertentu.

Ini bakal penting untuk change of basis dan eigenvector.

---

# 5. Transformasi Linear: Fungsi yang Mengubah Ruang

Transformasi linear adalah fungsi yang mengubah vektor menjadi vektor lain dengan menjaga struktur linear.

Dua syarat formalnya:

$$
T(u+v)=T(u)+T(v)
$$

dan:

$$
T(cu)=cT(u)
$$

Tapi secara geometris:

> garis tetap garis, origin tetap diam.

Transformasi linear bisa berupa:

- scaling
- rotation
- shear
- reflection
- projection

Tapi translasi biasa bukan transformasi linear murni, karena origin berpindah.

Contoh translasi:

$$
T(x,y)=(x+3,y)
$$

bukan linear karena:

$$
T(0,0)=(3,0)\neq(0,0)
$$

---

# 6. Matriks: Transformasi Linear yang Dikodekan sebagai Angka

Ini salah satu ide terbesar dalam seri ini.

> Matriks bukan sekadar tabel angka. Matriks adalah cara menyimpan transformasi linear.

Untuk matriks 2D:

$$
A=
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

kolom pertama adalah posisi baru $\hat{i}$:

$$
A\hat{i}
= {}
\begin{bmatrix}
a\\\\\\
c
\end{bmatrix}
$$

kolom kedua adalah posisi baru $\hat{j}$:

$$
A\hat{j}
= {}
\begin{bmatrix}
b\\\\\\
d
\end{bmatrix}
$$

Jadi:

$$
A=
\begin{bmatrix}
| & |\\\\\\\\
A\hat{i} & A\hat{j}\\\\\\
| & |
\end{bmatrix}
$$

Ini inti matriks.

Begitu kita tahu ke mana basis vector pergi, kita tahu seluruh transformasi.

---

# 7. Perkalian Matriks-Vektor: Kombinasi Kolom

Jika:

$$
A=
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

dan:

$$
\vec{v}
= {}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
$$

maka:

$$
A\vec{v}
= {}
x
\begin{bmatrix}
a\\\\\\
c
\end{bmatrix}
+
y
\begin{bmatrix}
b\\\\\\
d
\end{bmatrix}
$$

Artinya:

> hasil transformasi adalah kombinasi linear dari kolom-kolom matriks.

Rumus biasa:

$$
A\vec{v}
= {}
\begin{bmatrix}
ax+by\\\\\\
cx+dy
\end{bmatrix}
$$

bukan aturan acak.

Itu cuma bentuk koordinat dari:

$$
x(\text{kolom pertama})+y(\text{kolom kedua})
$$

---

# 8. Perkalian Matriks: Komposisi Transformasi

Kalau matriks adalah transformasi, maka perkalian matriks adalah:

> melakukan dua transformasi berturut-turut.

Jika:

$$
AB\vec{v}
$$

maka urutannya:

1. $B$ bekerja dulu
2. $A$ bekerja setelahnya

Karena:

$$
AB\vec{v}=A(B\vec{v})
$$

Jadi:

$$
AB
$$

adalah transformasi gabungan.

Itulah alasan kenapa umumnya:

$$
AB\neq BA
$$

Karena:

> melakukan transformasi A lalu B biasanya tidak sama dengan B lalu A.

Urutan itu bagian dari makna.

---

# 9. Determinant: Faktor Perubahan Area atau Volume

Determinant menjawab:

> transformasi ini mengubah area atau volume sebanyak berapa kali?

Untuk matriks 2D:

$$
A=
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

determinannya:

$$
\det(A)=ad-bc
$$

Tapi maknanya bukan rumus itu.

Maknanya:

> luas kotak satuan setelah transformasi.

Jika:

$$
\det(A)=3
$$

maka semua area menjadi 3 kali lipat.

Jika:

$$
\det(A)=-3
$$

maka semua area menjadi 3 kali lipat dan orientasi terbalik.

Jika:

$$
\det(A)=0
$$

maka area runtuh menjadi nol.

Dalam 3D, determinant mengukur faktor perubahan volume.

---

# 10. Determinant Nol: Ruang Runtuh

Jika:

$$
\det(A)=0
$$

maka transformasi meruntuhkan ruang ke dimensi lebih rendah.

Contoh:

- 2D menjadi garis
- 2D menjadi titik
- 3D menjadi bidang
- 3D menjadi garis

Artinya ada informasi yang hilang.

Kalau informasi hilang, transformasi tidak bisa dibalik.

Jadi untuk matriks persegi:

$$
\det(A)=0
\iff
A \text{ tidak invertible}
$$

dan:

$$
\det(A)\neq0
\iff
A \text{ invertible}
$$

---

# 11. Inverse: Tombol Undo

Invers matriks adalah transformasi yang membatalkan transformasi lain.

Jika $A$ adalah transformasi, maka $A^{-1}$ adalah undo-nya.

Secara matematis:

$$
A^{-1}A=I
$$

dan:

$$
AA^{-1}=I
$$

Identity matrix:

$$
I=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 1
\end{bmatrix}
$$

tidak mengubah apa pun.

Untuk sistem linear:

$$
A\vec{x}=\vec{b}
$$

jika $A$ invertible, maka:

$$
\vec{x}=A^{-1}\vec{b}
$$

Secara geometris:

> cari input yang setelah ditransformasikan oleh $A$ menjadi $\vec{b}$.

---

# 12. Sistem Linear: Row View dan Column View

Sistem:

$$
\begin{cases}
2x+y=5\\\\\\\\
x+2y=4
\end{cases}
$$

bisa ditulis:

$$
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 2
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
\begin{bmatrix}
5\\\\\\\\
4
\end{bmatrix}
$$

Ada dua cara lihat.

## Row View

Setiap persamaan adalah garis.

Solusi adalah titik potong garis-garis itu.

## Column View

Sistem dibaca sebagai:

$$
x
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
+
y
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
= {}
\begin{bmatrix}
5\\\\\\\\
4
\end{bmatrix}
$$

Artinya:

> bobot $x$ dan $y$ apa yang membuat kombinasi kolom matriks menghasilkan $\vec{b}$?

Column view lebih nyambung ke linear algebra modern.

---

# 13. Column Space: Semua Output yang Mungkin

Column space adalah span dari kolom-kolom matriks.

Jika:

$$
A=
\begin{bmatrix}
| & |\\\\\\\\
\vec{a}_1 & \vec{a}_2\\\\\\\\
| & |
\end{bmatrix}
$$

maka:

$$
\text{Col}(A)=\text{span}(\vec{a}_1,\vec{a}_2)
$$

Secara transformasi:

> column space adalah semua output yang mungkin dari $A$.

Sistem:

$$
A\vec{x}=\vec{b}
$$

punya solusi jika dan hanya jika:

$$
\vec{b}\in\text{Col}(A)
$$

Kalau $\vec{b}$ berada di luar column space, sistem tidak punya solusi.

---

# 14. Null Space: Semua Input yang Dihancurkan

Null space adalah semua vektor input yang dipetakan menjadi nol:

$$
\text{Null}(A)=\{\vec{x}\mid A\vec{x}=\vec{0}\}
$$

Secara geometris:

> null space adalah arah yang hilang dalam transformasi.

Jika null space hanya:

$$
\{\vec{0}\}
$$

maka tidak ada arah non-zero yang dihancurkan.

Jika null space punya vektor non-zero, berarti transformasi kehilangan informasi.

Itu membuat solusi sistem bisa tidak unik.

Jika:

$$
A\vec{x}_p=\vec{b}
$$

dan:

$$
A\vec{n}=0
$$

maka:

$$
A(\vec{x}_p+\vec{n})=\vec{b}
$$

Jadi:

$$
\vec{x}_p+\vec{n}
$$

juga solusi.

---

# 15. Rank: Dimensi Output yang Bertahan

Rank adalah dimensi column space:

$$
\text{rank}(A)=\dim(\text{Col}(A))
$$

Secara intuitif:

> rank adalah jumlah arah independen yang masih hidup setelah transformasi.

Contoh transformasi 2D:

| Transformasi | Column Space | Rank |
|---|---|---:|
| bidang tetap bidang | $\mathbb{R}^2$ | 2 |
| bidang runtuh jadi garis | garis | 1 |
| bidang runtuh jadi titik nol | $\{\vec{0}\}$ | 0 |

Untuk matriks $m\times n$:

$$
\text{rank}(A)\leq\min(m,n)
$$

Full rank berarti:

$$
\text{rank}(A)=\min(m,n)
$$

---

# 16. Rank-Nullity: Yang Bertahan + Yang Hilang

Untuk transformasi:

$$
A:\mathbb{R}^n\rightarrow\mathbb{R}^m
$$

berlaku:

$$
\text{rank}(A)+\dim(\text{Null}(A))=n
$$

Ini disebut rank-nullity theorem.

Versi manusia:

> dimensi yang bertahan sebagai output + dimensi yang hilang ke nol = dimensi input awal.

Contoh:

Jika:

$$
A:\mathbb{R}^3\rightarrow\mathbb{R}^2
$$

dan:

$$
\text{rank}(A)=2
$$

maka:

$$
\dim(\text{Null}(A))=1
$$

Karena:

$$
2+1=3
$$

Masuk akal: input 3D dipetakan ke output maksimal 2D, jadi minimal satu arah informasi hilang.

---

# 17. Change of Basis: Mengganti Bahasa Koordinat

Koordinat bergantung pada basis.

Vektor yang sama bisa punya koordinat berbeda dalam basis berbeda.

Jika basis baru $\mathcal{B}$ punya vektor:

$$
\vec{b}_1,\vec{b}_2
$$

maka kita bentuk matriks:

$$
P=
\begin{bmatrix}
| & |\\\\\\\\
\vec{b}_1 & \vec{b}_2\\\\\\\\
| & |
\end{bmatrix}
$$

Matriks $P$ menerjemahkan koordinat basis baru ke koordinat standar:

$$
[\vec{v}]_{\mathcal{E}}=P[\vec{v}]_{\mathcal{B}}
$$

Sedangkan:

$$
[\vec{v}]_{\mathcal{B}}=P^{-1}[\vec{v}]_{\mathcal{E}}
$$

Poin penting:

> Change of basis tidak mengubah vektor fisik. Ia mengubah bahasa yang dipakai untuk mendeskripsikan vektor.

---

# 18. Transformasi yang Sama dalam Basis Berbeda

Jika $A$ adalah transformasi dalam basis standar, maka representasi transformasi yang sama dalam basis $\mathcal{B}$ adalah:

$$
A_{\mathcal{B}}=P^{-1}AP
$$

Baca dari kanan ke kiri:

1. $P$: ubah koordinat basis $\mathcal{B}$ ke standar
2. $A$: lakukan transformasi standar
3. $P^{-1}$: ubah balik ke basis $\mathcal{B}$

Dua matriks yang berhubungan dengan:

$$
B=P^{-1}AP
$$

disebut similar matrices.

Mereka merepresentasikan transformasi yang sama dalam basis berbeda.

---

# 19. Eigenvector: Arah yang Tidak Berubah

Eigenvector adalah vektor non-zero yang tidak berubah arah setelah transformasi.

Secara matematis:

$$
A\vec{v}=\lambda\vec{v}
$$

dengan:

- $\vec{v}$ = eigenvector
- $\lambda$ = eigenvalue

Makna $\lambda$:

| $\lambda$ | Makna |
|---:|---|
| $2$ | memanjang 2 kali |
| $\frac{1}{2}$ | memendek setengah |
| $1$ | tetap sama |
| $0$ | runtuh ke nol |
| $-1$ | berbalik arah |
| $-3$ | berbalik dan memanjang 3 kali |

Eigenvector adalah arah spesial tempat transformasi menjadi sederhana.

---

# 20. Cara Mencari Eigenvalue

Dari:

$$
A\vec{v}=\lambda\vec{v}
$$

kita dapat:

$$
(A-\lambda I)\vec{v}=0
$$

Agar ada eigenvector non-zero, null space dari:

$$
A-\lambda I
$$

harus tidak trivial.

Artinya:

$$
A-\lambda I
$$

harus meruntuhkan ruang.

Maka:

$$
\det(A-\lambda I)=0
$$

Ini characteristic equation.

Setelah menemukan $\lambda$, eigenvector dicari dari:

$$
(A-\lambda I)\vec{v}=0
$$

atau null space dari:

$$
A-\lambda I
$$

---

# 21. Diagonalization: Transformasi Jadi Sederhana dalam Basis Eigenvector

Jika sebuah matriks punya cukup eigenvector independen untuk membentuk basis, maka transformasi itu bisa didiagonalisasi.

Bentuknya:

$$
D=P^{-1}AP
$$

atau:

$$
A=PDP^{-1}
$$

di mana:

- kolom $P$ adalah eigenvectors
- diagonal $D$ berisi eigenvalues

Matriks diagonal:

$$
D=
\begin{bmatrix}
\lambda_1 & 0\\\\\\\\
0 & \lambda_2
\end{bmatrix}
$$

berarti transformasi hanya melakukan scaling pada masing-masing arah basis.

Ini membuat banyak operasi lebih mudah.

Misalnya:

$$
A^n=PD^nP^{-1}
$$

dan:

$$
D^n=
\begin{bmatrix}
\lambda_1^n & 0\\\\\\\\
0 & \lambda_2^n
\end{bmatrix}
$$

---

# 22. Abstract Vector Space: Vektor Tidak Harus Panah

Akhirnya kita lepas dari geometri 2D/3D.

Sebuah vector space adalah kumpulan objek yang bisa:

1. dijumlahkan
2. dikalikan skalar

dengan aturan yang konsisten.

Objeknya bisa berupa:

- panah
- daftar angka
- polinomial
- fungsi
- sinyal
- gambar
- data point
- state sistem

Contoh polinomial:

$$
p(x)=3+2x+5x^2
$$

dapat ditulis dalam basis:

$$
\{1,x,x^2\}
$$

sebagai koordinat:

$$
\begin{bmatrix}
3\\\\\\\\
2\\\\\\\\
5
\end{bmatrix}
$$

Operator turunan adalah transformasi linear:

$$
D(f)=f'
$$

Karena:

$$
D(f+g)=D(f)+D(g)
$$

dan:

$$
D(cf)=cD(f)
$$

Jadi linear algebra bukan cuma matriks 2D.

Linear algebra adalah studi struktur linear dalam bentuk apa pun.

---

# Satu Tabel Besar

| Konsep | Pertanyaan yang Dijawab | Intuisi |
|---|---|---|
| Vektor | Objek apa yang sedang kita representasikan? | arah, besaran, data, fungsi, state |
| Linear combination | Apa yang bisa dibuat dari gabungan vektor? | scale lalu jumlahkan |
| Span | Semua kemungkinan kombinasi apa? | ruang yang bisa dijangkau |
| Basis | Bagaimana mendeskripsikan semua vektor secara efisien? | bahasa koordinat |
| Linear transformation | Bagaimana ruang berubah secara terstruktur? | garis tetap garis, origin tetap |
| Matrix | Bagaimana menyimpan transformasi? | lacak nasib basis vector |
| Matrix multiplication | Bagaimana menggabungkan transformasi? | komposisi |
| Determinant | Area/volume berubah berapa kali? | faktor skala area/volume |
| Inverse | Bisa di-undo atau tidak? | transformasi balik |
| Column space | Output apa saja yang mungkin? | span kolom |
| Null space | Input apa yang hilang? | arah yang dihancurkan |
| Rank | Berapa dimensi output yang bertahan? | dimensi column space |
| Change of basis | Bagaimana koordinat berubah jika basis berubah? | terjemahan bahasa |
| Eigenvector | Arah mana yang tetap sederhana? | arah yang tidak berubah |
| Abstract vector space | Objek apa saja yang bisa dianalisis linear? | struktur, bukan bentuk |

---

# Contoh Besar: Satu Matriks, Banyak Pertanyaan

Ambil matriks:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 2
\end{bmatrix}
$$

Kita bisa menanyakan banyak hal.

---

## Sebagai Transformasi

Kolom pertama:

$$
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

Kolom kedua:

$$
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Artinya:

- $\hat{i}$ berpindah ke $(2,1)$
- $\hat{j}$ berpindah ke $(1,2)$

---

## Determinant

$$
\det(A)=2\cdot2-1\cdot1=3
$$

Artinya:

> area menjadi 3 kali lipat.

Karena determinant bukan nol, transformasi invertible.

---

## Column Space

Karena kolom-kolomnya independen:

$$
\text{Col}(A)=\mathbb{R}^2
$$

Artinya semua output 2D bisa dicapai.

---

## Null Space

Karena invertible:

$$
\text{Null}(A)=\{\vec{0}\}
$$

Tidak ada arah non-zero yang dihancurkan.

---

## Rank

Karena column space adalah seluruh $\mathbb{R}^2$:

$$
\text{rank}(A)=2
$$

---

## Eigenvectors

Eigenvalue-nya:

$$
\lambda=3
$$

dan:

$$
\lambda=1
$$

Eigenvector untuk $\lambda=3$:

$$
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
$$

Eigenvector untuk $\lambda=1$:

$$
\begin{bmatrix}
1\\\\\\\\
-1
\end{bmatrix}
$$

Artinya transformasi ini sederhana jika dilihat dari basis diagonal dan anti-diagonal.

---

# Kenapa Semua Ini Penting?

Linear algebra muncul di banyak bidang karena ia menjawab pertanyaan fundamental:

> Bagaimana struktur berubah ketika diberi transformasi?

Itu muncul di mana-mana.

---

# Computer Graphics

Objek 3D terdiri dari vertex.

Setiap vertex adalah vektor.

Transformasi seperti:

- scale
- rotate
- reflect
- project
- camera transform

semuanya memakai matriks.

Change of basis muncul dalam:

- local space
- world space
- camera space
- screen space

Projection dari 3D ke 2D berkaitan dengan kehilangan informasi, mirip null space.

---

# Data Science

Dataset bisa dianggap sebagai matriks.

Rows bisa menjadi data points.

Columns bisa menjadi features.

Konsep yang muncul:

- rank: berapa banyak fitur independen?
- column space: output atau kombinasi fitur apa yang mungkin?
- null space: parameter mana yang tidak memengaruhi output?
- eigenvector: arah variasi utama
- determinant: volume sebaran dalam covariance matrix

---

# Machine Learning

Machine learning penuh dengan linear algebra.

Contoh:

## Linear Regression

$$
X\theta \approx y
$$

Di sini:

- $X$ adalah matrix data
- $\theta$ adalah parameter
- $y$ adalah target

Kalau $X$ rank-deficient, parameter bisa tidak unik.

---

## Neural Network

Layer neural network sering berbentuk:

$$
Wx+b
$$

Bagian:

$$
Wx
$$

adalah transformasi linear.

Lalu ditambah non-linear activation.

Secara kasar:

$$
\text{Linear}
\rightarrow
\text{Non-linear}
\rightarrow
\text{Linear}
\rightarrow
\text{Non-linear}
$$

---

## PCA

PCA mencari basis baru yang membuat variasi data paling besar muncul di koordinat awal.

Ini sangat terkait dengan eigenvector covariance matrix.

- eigenvector = arah principal component
- eigenvalue = seberapa besar variasi di arah itu

---

# Sistem Dinamis

Jika sistem berubah menurut:

$$
\vec{x}_{t+1}=A\vec{x}_t
$$

maka setelah banyak langkah:

$$
\vec{x}_n=A^n\vec{x}_0
$$

Eigenvalue menentukan apakah arah tertentu:

- tumbuh
- menyusut
- berosilasi
- stabil

Kalau:

$$
|\lambda|>1
$$

arah itu tumbuh.

Kalau:

$$
|\lambda|<1
$$

arah itu menyusut.

Kalau:

$$
\lambda<0
$$

arah itu bolak-balik tanda.

---

# Differential Equations

Operator turunan adalah linear transformation.

Fungsi eksponensial:

$$
e^{kx}
$$

adalah eigenfunction dari turunan:

$$
D(e^{kx})=ke^{kx}
$$

Ini alasan eksponensial muncul terus dalam:

- pertumbuhan populasi
- peluruhan radioaktif
- rangkaian listrik
- sistem mekanik
- kontrol
- sinyal

---

# Quantum Mechanics

State dalam quantum mechanics hidup di vector space kompleks.

Observable direpresentasikan dengan operator linear.

Eigenvalue dan eigenvector muncul sebagai:

- state khusus
- hasil pengukuran
- basis energi

Ini level lebih lanjut, tapi fondasinya tetap linear algebra.

---

# Kesalahan Mental Model yang Harus Dibuang

## Salah #1 — Matriks adalah tabel angka

Lebih kuat:

> Matriks adalah transformasi linear yang dikodekan sebagai angka.

---

## Salah #2 — Determinant adalah rumus

Lebih kuat:

> Determinant adalah faktor perubahan area atau volume.

---

## Salah #3 — Invers adalah prosedur hitung

Lebih kuat:

> Invers adalah transformasi undo.

---

## Salah #4 — Eigenvector adalah ritual aljabar

Lebih kuat:

> Eigenvector adalah arah yang tidak berubah oleh transformasi.

---

## Salah #5 — Koordinat adalah vektor

Lebih kuat:

> Koordinat adalah deskripsi vektor dalam basis tertentu.

---

## Salah #6 — Linear algebra cuma 2D/3D

Lebih kuat:

> Linear algebra membahas struktur linear pada objek apa pun, termasuk fungsi, data, gambar, sinyal, dan model.

---

# Cara Belajar Setelah Ini

Kalau seri ini sudah cukup masuk, langkah berikutnya jangan langsung lompat ke topik terlalu fancy.

Urutan yang sehat:

1. **Latihan komputasi dasar**
   - matrix multiplication
   - determinant
   - inverse
   - row reduction
   - solving systems

2. **Perkuat konsep ruang**
   - span
   - basis
   - rank
   - null space
   - column space

3. **Masuk numerical linear algebra**
   - Gaussian elimination
   - LU decomposition
   - QR decomposition
   - conditioning

4. **Masuk eigen dan SVD**
   - eigenvalue
   - diagonalization
   - singular value decomposition
   - PCA

5. **Aplikasikan**
   - graphics
   - ML
   - optimization
   - signal processing
   - differential equations

Jangan kebalik.

Kalau langsung SVD tanpa rank/null space, biasanya cuma jadi hafalan simbol. Bad investment.

---

# Mini Cheat Sheet

## Vektor

$$
\vec{v}
= {}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
x\hat{i}+y\hat{j}
$$

---

## Matriks sebagai Transformasi

$$
A=
\begin{bmatrix}
| & |\\\\\\\\
A\hat{i} & A\hat{j}\\\\\\
| & |
\end{bmatrix}
$$

---

## Matrix-Vector Multiplication

$$
A
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
x(\text{kolom pertama})+y(\text{kolom kedua})
$$

---

## Matrix Multiplication

$$
AB\vec{v}=A(B\vec{v})
$$

Matriks kanan bekerja dulu.

---

## Determinant 2D

$$
\det
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
= {}
ad-bc
$$

Makna:

> faktor perubahan area.

---

## Inverse

$$
A^{-1}A=I
$$

Ada jika:

$$
\det(A)\neq0
$$

untuk matriks persegi.

---

## Column Space

$$
\text{Col}(A)=\text{span}(\text{kolom-kolom }A)
$$

---

## Null Space

$$
\text{Null}(A)=\{\vec{x}\mid A\vec{x}=0\}
$$

---

## Rank

$$
\text{rank}(A)=\dim(\text{Col}(A))
$$

---

## Rank-Nullity

$$
\text{rank}(A)+\dim(\text{Null}(A))=n
$$

---

## Change of Basis

$$
[\vec{v}]_{\mathcal{E}}=P[\vec{v}]_{\mathcal{B}}
$$

$$
[\vec{v}]_{\mathcal{B}}=P^{-1}[\vec{v}]_{\mathcal{E}}
$$

---

## Transformasi dalam Basis Baru

$$
A_{\mathcal{B}}=P^{-1}AP
$$

---

## Eigenvector

$$
A\vec{v}=\lambda\vec{v}
$$

---

## Characteristic Equation

$$
\det(A-\lambda I)=0
$$

---

## Diagonalization

$$
D=P^{-1}AP
$$

atau:

$$
A=PDP^{-1}
$$

---

# Quiz Pemahaman Besar

## Level 1

### Soal 1

Apa makna geometris matriks dalam seri ini?

---

### Soal 2

Apa makna determinant?

---

### Soal 3

Apa makna null space?

---

### Soal 4

Apa makna rank?

---

### Soal 5

Apa makna eigenvector?

---

## Level 2

### Soal 6

Diberikan:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Apa column space-nya?

---

### Soal 7

Untuk matriks pada Soal 6, berapa rank-nya?

---

### Soal 8

Untuk matriks pada Soal 6, apakah $A$ invertible?

Jelaskan dari determinant atau rank.

---

### Soal 9

Mengapa sistem:

$$
A\vec{x}=\vec{b}
$$

punya solusi hanya jika:

$$
\vec{b}\in\text{Col}(A)
$$

---

## Level 3

### Soal 10

Jelaskan hubungan antara determinant nol, null space non-trivial, dan tidak adanya inverse.

---

### Soal 11

Mengapa change of basis tidak mengubah transformasi geometrisnya, hanya mengubah representasi matriksnya?

---

### Soal 12

Jika sebuah transformasi punya eigenbasis, mengapa transformasi itu menjadi diagonal dalam basis tersebut?

---

### Soal 13

Mengapa fungsi bisa dianggap sebagai vektor?

---

### Soal 14

Apa hubungan antara operator turunan dan eigenfunction $e^{kx}$?

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

Matriks adalah cara menyimpan transformasi linear.

Kolom-kolom matriks menunjukkan ke mana basis vector berpindah setelah transformasi.

</details>

<details>
<summary>Soal 2</summary>

Determinan adalah faktor perubahan area dalam 2D atau volume dalam 3D akibat transformasi linear.

Tanda determinant menunjukkan orientasi.

</details>

<details>
<summary>Soal 3</summary>

Null space adalah semua input yang dipetakan menjadi zero vector.

Secara geometris, null space adalah arah yang dihancurkan oleh transformasi.

</details>

<details>
<summary>Soal 4</summary>

Rank adalah dimensi column space.

Secara intuitif, rank adalah jumlah arah independen yang masih bisa dicapai pada output.

</details>

<details>
<summary>Soal 5</summary>

Eigenvector adalah vektor non-zero yang tidak berubah arah setelah transformasi.

Ia hanya discale oleh eigenvalue.

</details>

<details>
<summary>Soal 6</summary>

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
= {}
2
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Jadi:

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

</details>

<details>
<summary>Soal 7</summary>

Rank-nya:

$$
1
$$

karena column space berupa garis berdimensi 1.

</details>

<details>
<summary>Soal 8</summary>

Tidak invertible.

Karena:

$$
\det(A)=1\cdot4-2\cdot2=0
$$

atau karena rank-nya 1, bukan full rank 2.

</details>

<details>
<summary>Soal 9</summary>

Karena $A\vec{x}$ selalu berupa kombinasi linear dari kolom-kolom $A$.

Jadi output yang mungkin hanyalah vektor-vektor di column space.

Jika $\vec{b}$ berada di luar column space, tidak ada input $\vec{x}$ yang bisa menghasilkan $\vec{b}$.

</details>

<details>
<summary>Soal 10</summary>

Jika determinant nol, transformasi meruntuhkan ruang ke dimensi lebih rendah.

Berarti ada arah non-zero yang dihancurkan menjadi nol, sehingga null space non-trivial.

Karena informasi hilang, transformasi tidak bisa di-undo, jadi inverse tidak ada.

</details>

<details>
<summary>Soal 11</summary>

Karena vektor dan transformasi geometrisnya tetap sama.

Yang berubah hanya sistem koordinat atau bahasa basis yang dipakai untuk mendeskripsikannya.

Itulah kenapa matriksnya berubah, tetapi transformasi abstraknya sama.

</details>

<details>
<summary>Soal 12</summary>

Karena dalam eigenbasis, setiap basis vector hanya discale oleh eigenvalue-nya.

Tidak ada basis vector yang berubah menjadi kombinasi basis vector lain.

Maka matriks transformasinya hanya punya nilai pada diagonal.

</details>

<details>
<summary>Soal 13</summary>

Karena fungsi bisa dijumlahkan dan dikalikan skalar dengan aturan yang konsisten.

Maka fungsi dapat menjadi elemen dari vector space.

</details>

<details>
<summary>Soal 14</summary>

Operator turunan memenuhi:

$$
D(e^{kx})=ke^{kx}
$$

Artinya $e^{kx}$ setelah diturunkan hanya dikalikan skalar $k$.

Jadi $e^{kx}$ adalah eigenfunction dari operator turunan dengan eigenvalue $k$.

</details>

---

# Penutup

Kalau harus diringkas dalam satu kalimat:

> Linear algebra adalah ilmu tentang kombinasi linear dan transformasi linear.

Kalau dibuat sedikit lebih panjang:

> Linear algebra mempelajari bagaimana objek dalam vector space direpresentasikan, dikombinasikan, ditransformasikan, diringkas, dan disederhanakan melalui basis yang tepat.

Kekuatan 3Blue1Brown ada di satu hal:

> Jangan mulai dari simbol. Mulai dari aksi geometris.

Matriks bukan tabel.

Determinant bukan rumus.

Eigenvector bukan ritual.

Basis bukan formalitas.

Semua punya makna.

Dan kalau maknanya sudah klik, simbol-simbolnya tidak lagi terasa random.

Itulah essence dari linear algebra.

---

**Navigasi:**
← [Part 11: Abstract Vector Space, Saat Fungsi dan Polinomial Menjadi Vektor](part-11.md)
