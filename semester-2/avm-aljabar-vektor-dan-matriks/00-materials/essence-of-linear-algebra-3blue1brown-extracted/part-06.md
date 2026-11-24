---
title: "Essence of Linear Algebra (Indonesia) — Part 6: Invers Matriks sebagai Tombol Undo"
series: "Essence of Linear Algebra"
part: 6
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - inverse-matrix
  - systems-of-equations
  - determinant
difficulty: "pemula-menengah"
estimated_reading_time: "35-45 menit"
prerequisites:
  - memahami vektor
  - memahami transformasi linear
  - memahami matriks sebagai transformasi linear
  - memahami determinan
learning_objectives:
  - memahami invers matriks sebagai transformasi balik
  - memahami hubungan invers dengan determinan
  - memahami identity matrix sebagai transformasi netral
  - memahami sistem persamaan linear sebagai masalah transformasi
  - memahami kapan sistem persamaan punya satu solusi, tak hingga solusi, atau tidak punya solusi
source_reference:
  - "3Blue1Brown — Essence of Linear Algebra playlist"
---

# Part 6 — Invers Matriks sebagai Tombol Undo

## Masalah Baru

Pada Part 5, kita melihat bahwa determinan mengukur perubahan luas.

Jika:

$$
\det(A)=0
$$

maka ruang runtuh.

Jika ruang runtuh, informasi hilang.

Jika informasi hilang, transformasi tidak bisa dibalik.

Sekarang kita masuk ke sisi sebaliknya.

Jika sebuah transformasi **tidak** meruntuhkan ruang, maka seharusnya ada cara untuk mengembalikan hasil transformasi ke bentuk semula.

Itulah ide dasar dari:

$$
A^{-1}
$$

atau **invers matriks**.

Secara intuitif:

> Invers matriks adalah transformasi yang membatalkan transformasi sebelumnya.

Atau versi gampangnya:

> Invers adalah tombol undo.

---

# Transformasi dan Undo

Misalkan ada transformasi $A$.

Transformasi ini mengubah vektor:

$$
\vec{v}
$$

menjadi:

$$
A\vec{v}
$$

Sekarang kita ingin kembali ke $\vec{v}$.

Kita butuh transformasi lain yang melakukan kebalikannya.

Transformasi itu disebut:

$$
A^{-1}
$$

Maka:

$$
A^{-1}(A\vec{v})=\vec{v}
$$

Artinya:

1. terapkan $A$
2. lalu terapkan $A^{-1}$
3. hasilnya kembali ke awal

---

# Identity Matrix

Untuk memahami invers, kita harus ingat lagi identity matrix.

Dalam 2D:

$$
I=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 1
\end{bmatrix}
$$

Matriks ini tidak mengubah apa pun.

Untuk vektor apa pun:

$$
I\vec{v}=\vec{v}
$$

Secara transformasi:

> identity matrix adalah transformasi "diam saja".

Tidak rotate.

Tidak scale.

Tidak shear.

Tidak reflect.

Tidak ngapa-ngapain. Matrix paling mager, tapi penting.

---

# Invers sebagai Komposisi yang Menjadi Identity

Jika $A^{-1}$ benar-benar membatalkan $A$, maka gabungan keduanya harus menghasilkan identity.

Secara matematis:

$$
A^{-1}A=I
$$

dan:

$$
AA^{-1}=I
$$

Maknanya:

- $A$ lalu $A^{-1}$ = kembali seperti semula
- $A^{-1}$ lalu $A$ = kembali seperti semula

Jadi invers bukan sekadar rumus.

Invers adalah transformasi yang membuat efek total menjadi:

$$
I
$$

---

# Contoh 1 — Scaling

Misalkan:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
$$

Transformasi ini memperbesar semua arah 2 kali.

Kalau ingin membatalkannya, kita perlu memperkecil semua arah menjadi setengah.

Maka:

$$
A^{-1}
= {}
\begin{bmatrix}
\frac{1}{2} & 0\\\\\\\\
0 & \frac{1}{2}
\end{bmatrix}
$$

Cek:

$$
A^{-1}A
= {}
\begin{bmatrix}
\frac{1}{2} & 0\\\\\\\\
0 & \frac{1}{2}
\end{bmatrix}
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
= {}
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 1
\end{bmatrix}
= {}
I
$$

Secara visual:

1. ruang diperbesar 2 kali
2. lalu diperkecil setengah
3. kembali normal

---

# Contoh 2 — Scaling Berbeda per Sumbu

Misalkan:

$$
A=
\begin{bmatrix}
3 & 0\\\\\\\\
0 & 5
\end{bmatrix}
$$

Artinya:

- arah x diperbesar 3 kali
- arah y diperbesar 5 kali

Inversnya:

$$
A^{-1}
= {}
\begin{bmatrix}
\frac{1}{3} & 0\\\\\\\\
0 & \frac{1}{5}
\end{bmatrix}
$$

Karena untuk undo:

- x harus dibagi 3
- y harus dibagi 5

---

# Contoh 3 — Rotasi

Misalkan $A$ adalah rotasi 90 derajat berlawanan arah jarum jam:

$$
A=
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 0
\end{bmatrix}
$$

Untuk membatalkannya, kita harus rotasi 90 derajat searah jarum jam.

Maka:

$$
A^{-1}
= {}
\begin{bmatrix}
0 & 1\\\\\\\\
-1 & 0
\end{bmatrix}
$$

Secara visual:

1. putar kiri 90 derajat
2. lalu putar kanan 90 derajat
3. kembali ke posisi awal

---

# Contoh 4 — Shear

Misalkan:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Transformasi ini melakukan shear:

$$
T(x,y)=(x+y,y)
$$

Artinya semakin tinggi nilai $y$, semakin jauh titik terdorong ke kanan.

Untuk membatalkannya, kita perlu mendorong balik ke kiri sebanyak $y$.

Jadi inversnya:

$$
A^{-1}
= {}
\begin{bmatrix}
1 & -1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Karena:

$$
T^{-1}(x,y)=(x-y,y)
$$

Cek:

$$
A^{-1}A
= {}
\begin{bmatrix}
1 & -1\\\\\\\\
0 & 1
\end{bmatrix}
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 1
\end{bmatrix}
= {}
I
$$

---

# Hubungan dengan Determinan

Dari Part 5:

> Determinan mengukur faktor perubahan area.

Kalau:

$$
\det(A)\neq0
$$

maka area tidak runtuh sepenuhnya.

Transformasi masih menjaga informasi cukup untuk dibalik.

Maka $A$ punya invers.

Kalau:

$$
\det(A)=0
$$

maka area runtuh menjadi nol.

Transformasi kehilangan informasi.

Maka $A$ tidak punya invers.

Ringkasnya:

$$
A^{-1}\text{ ada}
\iff
\det(A)\neq0
$$

Untuk matriks persegi.

---

# Kenapa Determinan Nol Membunuh Invers?

Misalkan:

$$
A=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 0
\end{bmatrix}
$$

Transformasi ini:

$$
T(x,y)=(x,0)
$$

Artinya seluruh bidang 2D diratakan ke sumbu x.

Contoh:

$$
(3,1)\rightarrow(3,0)
$$

$$
(3,5)\rightarrow(3,0)
$$

$$
(3,-100)\rightarrow(3,0)
$$

Banyak input berbeda menghasilkan output yang sama.

Sekarang kalau kita hanya tahu output:

$$
(3,0)
$$

input awalnya yang mana?

Tidak bisa tahu.

Bisa $(3,1)$.

Bisa $(3,5)$.

Bisa $(3,-100)$.

Informasi $y$ sudah hilang.

Itulah kenapa tidak ada tombol undo.

---

# Sistem Persamaan Linear

Sekarang kita masuk ke salah satu aplikasi paling penting.

Biasanya sistem persamaan linear ditulis seperti ini:

$$
\begin{cases}
2x+y=5\\\\\\\\
x+2y=4
\end{cases}
$$

Cara sekolah biasanya:

- eliminasi
- substitusi
- cari $x$
- cari $y$

Itu boleh.

Tapi linear algebra memberi cara pandang yang lebih dalam.

Sistem ini bisa ditulis sebagai:

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

Atau lebih ringkas:

$$
A\vec{x}=\vec{b}
$$

---

# Makna Geometris $A\vec{x}=\vec{b}$

Persamaan:

$$
A\vec{x}=\vec{b}
$$

bisa dibaca begini:

> Vektor input apa yang setelah ditransformasikan oleh $A$ akan menjadi $\vec{b}$?

Jadi kita bukan cuma mencari angka $x$ dan $y$.

Kita mencari vektor:

$$
\vec{x}
= {}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
$$

yang setelah masuk ke mesin transformasi $A$, keluar sebagai:

$$
\vec{b}
$$

---

# Jika Invers Ada

Kalau $A$ punya invers, maka:

$$
A\vec{x}=\vec{b}
$$

Kita bisa terapkan $A^{-1}$ ke kedua sisi:

$$
A^{-1}A\vec{x}=A^{-1}\vec{b}
$$

Karena:

$$
A^{-1}A=I
$$

maka:

$$
I\vec{x}=A^{-1}\vec{b}
$$

Jadi:

$$
\vec{x}=A^{-1}\vec{b}
$$

Inilah alasan invers penting.

Ia menyelesaikan sistem linear.

---

# Contoh Sistem Linear

Misalkan:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 2
\end{bmatrix}
$$

dan:

$$
\vec{b}
= {}
\begin{bmatrix}
5\\\\\\\\
4
\end{bmatrix}
$$

Kita ingin mencari:

$$
A\vec{x}=\vec{b}
$$

Secara eksplisit:

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

Yang berarti:

$$
2x+y=5
$$

$$
x+2y=4
$$

Determinan $A$:

$$
\det(A)=2\cdot2-1\cdot1=3
$$

Karena:

$$
\det(A)\neq0
$$

maka sistem punya satu solusi unik.

---

# Rumus Invers 2×2

Untuk matriks:

$$
A=
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

jika:

$$
ad-bc\neq0
$$

maka inversnya:

$$
A^{-1}
= {}
\frac{1}{ad-bc}
\begin{bmatrix}
d & -b\\\\\\
-c & a
\end{bmatrix}
$$

Rumus ini berguna, tapi jangan jadikan pusat pemahaman.

Makna utamanya tetap:

> $A^{-1}$ adalah transformasi undo.

---

# Gunakan Rumus untuk Contoh

Untuk:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 2
\end{bmatrix}
$$

kita punya:

$$
ad-bc=2\cdot2-1\cdot1=3
$$

Maka:

$$
A^{-1}
= {}
\frac{1}{3}
\begin{bmatrix}
2 & -1\\\\\\\\
-1 & 2
\end{bmatrix}
$$

Sekarang:

$$
\vec{x}=A^{-1}\vec{b}
$$

$$
= {}
\frac{1}{3}
\begin{bmatrix}
2 & -1\\\\\\\\
-1 & 2
\end{bmatrix}
\begin{bmatrix}
5\\\\\\\\
4
\end{bmatrix}
$$

Hitung:

$$
= {}
\frac{1}{3}
\begin{bmatrix}
2\cdot5+(-1)\cdot4\\\\\\\\
(-1)\cdot5+2\cdot4
\end{bmatrix}
$$

$$
= {}
\frac{1}{3}
\begin{bmatrix}
10-4\\\\\\\\
-5+8
\end{bmatrix}
$$

$$
= {}
\frac{1}{3}
\begin{bmatrix}
6\\\\\\\\
3
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

Jadi:

$$
x=2,\quad y=1
$$

Cek:

$$
2(2)+1=5
$$

$$
2+2(1)=4
$$

Benar.

---

# Tiga Kemungkinan Sistem Linear

Untuk sistem:

$$
A\vec{x}=\vec{b}
$$

ada tiga kemungkinan besar:

1. satu solusi
2. tidak ada solusi
3. tak hingga banyak solusi

Mari pahami secara geometris.

---

# Kasus 1 — Satu Solusi

Jika $A$ tidak meruntuhkan ruang:

$$
\det(A)\neq0
$$

maka setiap output $\vec{b}$ berasal dari tepat satu input $\vec{x}$.

Transformasi bisa dibalik.

Jadi sistem punya satu solusi unik.

Secara geometris:

> ruang tetap 2D, hanya diregangkan, diputar, dimiringkan, atau dibalik.

Tidak ada informasi hilang.

---

# Kasus 2 — Tidak Ada Solusi

Misalkan $A$ meruntuhkan bidang 2D menjadi garis.

Maka semua kemungkinan output hanya berada di garis itu.

Kalau $\vec{b}$ berada di luar garis tersebut, tidak ada input yang bisa menghasilkan $\vec{b}$.

Maka sistem:

$$
A\vec{x}=\vec{b}
$$

tidak punya solusi.

---

Contoh:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
2 & 2
\end{bmatrix}
$$

Kolomnya:

$$
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

dan:

$$
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Keduanya sama.

Jadi seluruh bidang diruntuhkan ke garis span dari:

$$
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Kalau:

$$
\vec{b}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

vektor ini tidak berada di garis tersebut.

Maka tidak ada solusi.

---

# Kasus 3 — Tak Hingga Banyak Solusi

Masih dengan transformasi yang meruntuhkan bidang ke garis.

Kalau $\vec{b}$ berada di garis output tersebut, maka ada solusi.

Tapi bukan satu.

Biasanya ada tak hingga banyak input yang jatuh ke output yang sama.

---

Contoh:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
2 & 2
\end{bmatrix}
$$

Ambil:

$$
\vec{b}
= {}
\begin{bmatrix}
3\\\\\\\\
6
\end{bmatrix}
$$

Vektor ini berada pada garis span dari:

$$
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Karena:

$$
\begin{bmatrix}
3\\\\\\\\
6
\end{bmatrix}
= {}
3
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Maka sistem punya solusi.

Tapi banyak.

Karena:

$$
A
\begin{bmatrix}
3\\\\\\\\
0
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
6
\end{bmatrix}
$$

dan:

$$
A
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
6
\end{bmatrix}
$$

dan:

$$
A
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
6
\end{bmatrix}
$$

Banyak input, output sama.

---

# Hubungan ke Linear Equations: Row View vs Column View

Sistem:

$$
\begin{cases}
2x+y=5\\\\\\\\
x+2y=4
\end{cases}
$$

bisa dilihat dua cara.

---

## Row View

Setiap persamaan adalah garis.

Solusi adalah titik perpotongan garis-garis tersebut.

Untuk 2 persamaan 2 variabel:

- satu titik potong = satu solusi
- garis sejajar = tidak ada solusi
- garis sama persis = tak hingga solusi

Ini cara yang umum diajarkan.

---

## Column View

Persamaan:

$$
A\vec{x}=\vec{b}
$$

dapat dibaca sebagai:

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

> Berapa kombinasi kolom-kolom matriks $A$ yang menghasilkan $\vec{b}$?

Ini cara pandang linear algebra.

Dua kolom matriks adalah vektor.

Kita mencari bobot $x$ dan $y$ agar kombinasi keduanya menjadi $\vec{b}$.

---

# Kenapa Column View Penting?

Karena cara ini akan membawa kita ke konsep berikutnya:

- span
- column space
- rank
- null space

Itu semua adalah inti linear algebra yang lebih serius.

Kalau row view menjawab:

> Di mana garis-garis berpotongan?

Column view menjawab:

> Output apa saja yang bisa dibuat oleh kombinasi kolom-kolom ini?

Pertanyaan kedua ini jauh lebih general.

Ia berlaku untuk dimensi tinggi, machine learning, data science, optimisasi, dan sistem besar.

---

# Singular Matrix

Matriks yang tidak punya invers disebut:

> singular matrix.

Untuk matriks persegi:

$$
A \text{ singular}
\iff
\det(A)=0
$$

Secara geometris:

> singular berarti transformasi meruntuhkan ruang ke dimensi lebih rendah.

Contoh:

- 2D menjadi garis
- 2D menjadi titik
- 3D menjadi bidang
- 3D menjadi garis
- 3D menjadi titik

Singular bukan sekadar label aljabar.

Singular berarti informasi hilang.

---

# Non-Singular Matrix

Matriks yang punya invers disebut:

> non-singular matrix

atau:

> invertible matrix.

Untuk matriks persegi:

$$
A \text{ invertible}
\iff
\det(A)\neq0
$$

Secara geometris:

> transformasi tidak meruntuhkan ruang.

Ia boleh:

- memutar
- meregangkan
- memiringkan
- membalik orientasi
- memperkecil

Asal tidak membuat luas atau volume menjadi nol.

---

# Hubungan ke Programming

Dalam computer graphics, invers matriks sering muncul.

Misalnya:

## 1. Undo Transformasi Objek

Kalau objek sudah:

1. discale
2. diputar
3. dipindah

kadang kita perlu mengembalikan koordinat world ke koordinat lokal object.

Itu memakai invers transformasi.

---

## 2. Camera View Matrix

Kamera di dunia 3D punya posisi dan orientasi.

Untuk menggambar dunia dari sudut pandang kamera, kita sering memakai invers dari transformasi kamera.

Intuisinya:

> Daripada memindahkan kamera, kita memindahkan seluruh dunia secara kebalikan.

---

## 3. Solving Systems

Banyak masalah engineering dan data science dapat ditulis sebagai:

$$
A\vec{x}=\vec{b}
$$

Namun dalam praktik komputasi, kita jarang benar-benar menghitung invers eksplisit untuk sistem besar.

Biasanya dipakai metode numerik seperti:

- Gaussian elimination
- LU decomposition
- QR decomposition
- iterative solvers

Kenapa?

Karena menghitung invers eksplisit sering lebih mahal dan kurang stabil secara numerik.

Jadi konsep invers penting untuk pemahaman.

Tapi untuk implementasi serius, jangan asal `inverse(A) * b`.

Itu rabbit hole yang layak dihindari dulu.

---

# Jebakan Umum

## Salah #1 — Menganggap Invers Hanya Rumus

Rumus invers 2×2 berguna.

Tapi makna utamanya:

> transformasi yang membatalkan transformasi lain.

---

## Salah #2 — Mengira Semua Matriks Punya Invers

Tidak.

Hanya matriks persegi yang tidak meruntuhkan ruang yang punya invers.

Untuk matriks persegi:

$$
\det(A)\neq0
$$

adalah syarat penting.

---

## Salah #3 — Mengabaikan Makna $\det(A)=0$

Kalau determinan nol, bukan sekadar rumus gagal.

Secara geometris:

> ruang runtuh, informasi hilang, undo mustahil.

---

## Salah #4 — Menghitung Invers untuk Menyelesaikan Semua Sistem

Secara teori:

$$
\vec{x}=A^{-1}\vec{b}
$$

Tapi secara komputasi, untuk sistem besar biasanya lebih baik memakai solver numerik.

Konsepnya invers.

Implementasinya sering bukan invers eksplisit.

---

# Ringkasan

Invers matriks adalah transformasi balik.

Jika $A$ adalah transformasi, maka $A^{-1}$ adalah transformasi yang membatalkannya.

Secara matematis:

$$
A^{-1}A=I
$$

dan:

$$
AA^{-1}=I
$$

Untuk matriks persegi:

$$
A^{-1}\text{ ada}
\iff
\det(A)\neq0
$$

Jika:

$$
A\vec{x}=\vec{b}
$$

dan $A$ invertible, maka:

$$
\vec{x}=A^{-1}\vec{b}
$$

Sistem linear dapat dilihat sebagai pertanyaan:

> input mana yang setelah ditransformasikan oleh $A$ menghasilkan output $\vec{b}$?

---

# Quiz Pemahaman

## Level 1

### Soal 1

Apa makna intuitif dari invers matriks?

---

### Soal 2

Jika:

$$
A=
\begin{bmatrix}
4 & 0\\\\\\\\
0 & 4
\end{bmatrix}
$$

apa inversnya?

---

### Soal 3

Jika:

$$
\det(A)=0
$$

apakah $A$ punya invers?

Jelaskan singkat.

---

## Level 2

### Soal 4

Diberikan:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 5
\end{bmatrix}
$$

Tentukan:

$$
A^{-1}
$$

---

### Soal 5

Diberikan sistem:

$$
\begin{cases}
2x+y=5\\\\\\\\
x+2y=4
\end{cases}
$$

Tulis dalam bentuk:

$$
A\vec{x}=\vec{b}
$$

---

### Soal 6

Apa makna geometris dari:

$$
A\vec{x}=\vec{b}
$$

---

## Level 3

### Soal 7

Diberikan:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
2 & 2
\end{bmatrix}
$$

Hitung determinannya.

Apakah $A$ punya invers?

---

### Soal 8

Untuk matriks pada Soal 7, apakah sistem:

$$
A\vec{x}
= {}
\begin{bmatrix}
3\\\\\\\\
6
\end{bmatrix}
$$

punya solusi?

Kalau punya, apakah solusinya unik?

---

### Soal 9

Jelaskan perbedaan row view dan column view dalam memahami sistem persamaan linear.

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

Invers matriks adalah transformasi yang membatalkan transformasi lain.

Ia seperti tombol undo.

Jika $A$ melakukan transformasi, maka $A^{-1}$ mengembalikannya.

</details>

<details>
<summary>Soal 2</summary>

$$
A^{-1}
= {}
\begin{bmatrix}
\frac{1}{4} & 0\\\\\\\\
0 & \frac{1}{4}
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 3</summary>

Tidak.

Jika $\det(A)=0$, ruang runtuh ke dimensi lebih rendah, informasi hilang, sehingga transformasi tidak bisa dibalik.

</details>

<details>
<summary>Soal 4</summary>

$$
A^{-1}
= {}
\begin{bmatrix}
\frac{1}{2} & 0\\\\\\\\
0 & \frac{1}{5}
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 5</summary>

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

</details>

<details>
<summary>Soal 6</summary>

Maknanya:

> vektor input $\vec{x}$ apa yang setelah ditransformasikan oleh $A$ menghasilkan output $\vec{b}$?

</details>

<details>
<summary>Soal 7</summary>

$$
\det(A)=1\cdot2-1\cdot2=0
$$

Maka $A$ tidak punya invers.

</details>

<details>
<summary>Soal 8</summary>

Punya solusi, karena:

$$
\begin{bmatrix}
3\\\\\\\\
6
\end{bmatrix}
= {}
3
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

vektor target berada pada garis output transformasi.

Solusinya tidak unik. Ada tak hingga banyak solusi.

</details>

<details>
<summary>Soal 9</summary>

Row view melihat setiap persamaan sebagai garis, bidang, atau hyperplane. Solusi adalah titik perpotongan objek-objek tersebut.

Column view melihat sistem sebagai kombinasi linear dari kolom-kolom matriks. Solusi adalah bobot yang diperlukan agar kombinasi kolom menghasilkan $\vec{b}$.

</details>

---

# Preview Part 7

Sekarang kita sudah mulai melihat pertanyaan yang lebih dalam:

> Output apa saja yang bisa dicapai oleh transformasi $A$?

Pertanyaan ini membawa kita ke konsep:

$$
\text{column space}
$$

Dan pertanyaan lain:

> Input apa saja yang dihancurkan menjadi nol?

Ini membawa kita ke:

$$
\text{null space}
$$

Pada Part 7, kita akan membahas **span, column space, dan null space**.

Ini bagian yang mulai terasa seperti linear algebra "beneran", tapi kalau fondasinya sudah benar, konsepnya akan jauh lebih masuk akal.

---

**Navigasi:**
← [Part 5: Determinan sebagai Perubahan Luas](part-05.md) | [Part 7: Span, Column Space, dan Null Space](part-07.md) →
