---
title: "Essence of Linear Algebra (Indonesia) — Part 3: Matriks sebagai Transformasi Linear"
series: "Essence of Linear Algebra"
part: 3
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - matrix
  - linear-transformation
  - basis-vector
difficulty: "pemula-menengah"
estimated_reading_time: "30-40 menit"
prerequisites:
  - memahami vektor
  - memahami penjumlahan vektor
  - memahami perkalian skalar
  - memahami transformasi linear
learning_objectives:
  - memahami matriks sebagai cara menyimpan transformasi linear
  - memahami peran basis vector
  - memahami mengapa kolom matriks sangat penting
  - memahami perkalian matriks-vektor secara geometris
  - mampu membaca efek transformasi dari kolom-kolom matriks
source_reference:
  - "3Blue1Brown — Essence of Linear Algebra playlist"
---

# Part 3 — Matriks sebagai Transformasi Linear

## Masalah Utama

Pada Part 2, kita melihat bahwa transformasi linear adalah cara mengubah seluruh ruang sekaligus.

Contoh transformasi linear:

- scaling
- rotasi
- shear
- refleksi

Sekarang pertanyaannya:

> Bagaimana cara menyimpan transformasi linear dalam bentuk angka?

Misalnya kita punya transformasi yang memiringkan ruang seperti ini:

$$
T(x,y)=(x+y,y)
$$

Apakah kita harus menyimpan hasil transformasi untuk setiap titik?

Tentu tidak.

Karena ada tak hingga banyak titik di bidang.

Kita butuh cara yang lebih ringkas.

Dan di sinilah matriks muncul.

---

# Matriks Bukan Sekadar Tabel Angka

Biasanya matriks diperkenalkan seperti ini:

$$
A=
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

Lalu langsung diajarkan operasi:

$$
A
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
\begin{bmatrix}
ax+by\\\\\\
cx+dy
\end{bmatrix}
$$

Secara teknis benar.

Tapi secara intuisi, ini buruk.

Karena pembaca hanya melihat simbol.

Bukan makna.

Cara berpikir yang lebih kuat:

> Matriks adalah cara menyimpan transformasi linear.

Lebih spesifik lagi:

> Kolom-kolom matriks memberi tahu ke mana basis vector bergerak setelah transformasi.

Kalimat itu inti Part 3.

Kalau paham itu, perkalian matriks-vektor tidak lagi terasa seperti aturan hafalan.

---

# Dua Basis Vector Standar

Dalam bidang 2D, kita biasanya memakai dua basis vector standar:

$$
\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

dan

$$
\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

Biasanya dibaca:

- i-hat
- j-hat

Secara visual:

$$
\hat{i}
$$

adalah satu langkah ke kanan.

Sedangkan:

$$
\hat{j}
$$

adalah satu langkah ke atas.

---

# Semua Vektor Bisa Dibangun dari Basis Vector

Misalkan kita punya vektor:

$$
\vec{v}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

Apa artinya?

Artinya:

$$
\vec{v}
= {}
3\hat{i}+2\hat{j}
$$

Karena:

$$
3
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
+
2
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
0
\end{bmatrix}
+
\begin{bmatrix}
0\\\\\\\\
2
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

Jadi koordinat:

$$
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

sebenarnya berarti:

> 3 bagian ke arah $\hat{i}$, lalu 2 bagian ke arah $\hat{j}$.

Ini penting banget, bos.

Karena transformasi linear mempertahankan cara kombinasi ini bekerja.

---

# Ide Kunci: Cukup Lacak Basis Vector

Misalkan ada transformasi linear $T$.

Kalau kita tahu ke mana:

$$
\hat{i}
$$

bergerak,

dan ke mana:

$$
\hat{j}
$$

bergerak,

maka kita tahu seluruh transformasi.

Kenapa?

Karena semua vektor lain hanyalah kombinasi dari $\hat{i}$ dan $\hat{j}$.

---

Misalkan:

$$
T(\hat{i})
= {}
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

dan:

$$
T(\hat{j})
= {}
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Sekarang kita ingin tahu hasil transformasi dari:

$$
\vec{v}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

Karena:

$$
\vec{v}=3\hat{i}+2\hat{j}
$$

maka:

$$
T(\vec{v})
= {}
T(3\hat{i}+2\hat{j})
$$

Karena $T$ linear:

$$
T(3\hat{i}+2\hat{j})
= {}
3T(\hat{i})+2T(\hat{j})
$$

Substitusi hasil transformasi basis vector:

$$
= {}
3
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
+
2
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
6\\\\\\\\
3
\end{bmatrix}
+
\begin{bmatrix}
2\\\\\\\\
4
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
8\\\\\\\\
7
\end{bmatrix}
$$

Jadi:

$$
T
\left(
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
\right)
= {}
\begin{bmatrix}
8\\\\\\\\
7
\end{bmatrix}
$$

---

# Dari Basis Vector ke Matriks

Sekarang bagian pentingnya.

Tadi kita punya:

$$
T(\hat{i})
= {}
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

dan:

$$
T(\hat{j})
= {}
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Maka transformasi itu bisa disimpan sebagai matriks:

$$
A
= {}
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 2
\end{bmatrix}
$$

Perhatikan:

- kolom pertama adalah posisi baru $\hat{i}$
- kolom kedua adalah posisi baru $\hat{j}$

Jadi:

$$
A
= {}
\begin{bmatrix}
| & |\\\\\\\\
T(\hat{i}) & T(\hat{j})\\\\\\
| & |
\end{bmatrix}
$$

atau:

$$
A
= {}
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 2
\end{bmatrix}
$$

---

# Ini Makna Kolom Matriks

Untuk matriks umum:

$$
A
= {}
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

maknanya:

$$
\hat{i}
\rightarrow
\begin{bmatrix}
a\\\\\\
c
\end{bmatrix}
$$

dan:

$$
\hat{j}
\rightarrow
\begin{bmatrix}
b\\\\\\
d
\end{bmatrix}
$$

Jadi:

- kolom pertama = hasil transformasi $\hat{i}$
- kolom kedua = hasil transformasi $\hat{j}$

Bukan baris.

Kolom.

Ini sering jadi sumber error.

---

# Perkalian Matriks-Vektor

Sekarang kita bisa memahami rumus klasik.

Misalkan:

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

Karena:

$$
\vec{v}=x\hat{i}+y\hat{j}
$$

maka hasil transformasinya:

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

Hitung:

$$
= {}
\begin{bmatrix}
ax\\\\\\
cx
\end{bmatrix}
+
\begin{bmatrix}
by\\\\\\
dy
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
ax+by\\\\\\
cx+dy
\end{bmatrix}
$$

Maka:

$$
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
\begin{bmatrix}
ax+by\\\\\\
cx+dy
\end{bmatrix}
$$

Rumus ini bukan aturan acak.

Rumus ini muncul dari ide:

> vektor baru = kombinasi linear dari posisi baru basis vector.

---

# Contoh 1 — Scaling Horizontal dan Vertikal

Misalkan:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
$$

Artinya:

$$
\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
\rightarrow
\begin{bmatrix}
2\\\\\\\\
0
\end{bmatrix}
$$

dan:

$$
\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
\rightarrow
\begin{bmatrix}
0\\\\\\\\
3
\end{bmatrix}
$$

Jadi ruang:

- diregangkan 2 kali ke arah horizontal
- diregangkan 3 kali ke arah vertikal

Sekarang ambil:

$$
\vec{v}
= {}
\begin{bmatrix}
4\\\\\\\\
5
\end{bmatrix}
$$

Maka:

$$
A\vec{v}
= {}
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
\begin{bmatrix}
4\\\\\\\\
5
\end{bmatrix}
= {}
\begin{bmatrix}
8\\\\\\\\
15
\end{bmatrix}
$$

---

# Contoh 2 — Shear

Misalkan:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Kolom pertama:

$$
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

berarti $\hat{i}$ tetap di tempatnya.

Kolom kedua:

$$
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
$$

berarti $\hat{j}$ yang tadinya ke atas sekarang miring ke kanan atas.

Jadi grid berubah menjadi jajaran genjang.

Ini shear.

---

Untuk:

$$
\vec{v}
= {}
\begin{bmatrix}
2\\\\\\\\
3
\end{bmatrix}
$$

hasilnya:

$$
A\vec{v}
= {}
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
\begin{bmatrix}
2\\\\\\\\
3
\end{bmatrix}
= {}
\begin{bmatrix}
5\\\\\\\\
3
\end{bmatrix}
$$

Secara fungsi:

$$
T(x,y)=(x+y,y)
$$

---

# Contoh 3 — Rotasi 90 Derajat

Rotasi 90 derajat berlawanan arah jarum jam mengubah:

$$
\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
\rightarrow
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

dan:

$$
\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
\rightarrow
\begin{bmatrix}
-1\\\\\\\\
0
\end{bmatrix}
$$

Maka matriksnya:

$$
R
= {}
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 0
\end{bmatrix}
$$

Kolom pertama adalah posisi baru $\hat{i}$.

Kolom kedua adalah posisi baru $\hat{j}$.

---

Coba transformasikan:

$$
\vec{v}
= {}
\begin{bmatrix}
2\\\\\\\\
3
\end{bmatrix}
$$

Maka:

$$
R\vec{v}
= {}
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 0
\end{bmatrix}
\begin{bmatrix}
2\\\\\\\\
3
\end{bmatrix}
= {}
\begin{bmatrix}
-3\\\\\\\\
2
\end{bmatrix}
$$

Secara visual:

vektor $(2,3)$ diputar 90 derajat menjadi $(-3,2)$.

---

# Contoh 4 — Refleksi terhadap Sumbu x

Refleksi terhadap sumbu x berarti:

- arah kanan tetap kanan
- arah atas menjadi bawah

Maka:

$$
\hat{i}
\rightarrow
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

dan:

$$
\hat{j}
\rightarrow
\begin{bmatrix}
0\\\\\\\\
-1
\end{bmatrix}
$$

Matriksnya:

$$
A=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & -1
\end{bmatrix}
$$

Untuk:

$$
\vec{v}
= {}
\begin{bmatrix}
3\\\\\\\\
4
\end{bmatrix}
$$

hasilnya:

$$
A\vec{v}
= {}
\begin{bmatrix}
3\\\\\\\\
-4
\end{bmatrix}
$$

---

# Membaca Transformasi dari Matriks

Misalkan diberikan:

$$
A=
\begin{bmatrix}
2 & -1\\\\\\\\
1 & 3
\end{bmatrix}
$$

Jangan langsung panik.

Baca kolomnya.

Kolom pertama:

$$
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

berarti:

$$
\hat{i}
$$

berpindah ke kanan 2 dan naik 1.

Kolom kedua:

$$
\begin{bmatrix}
-1\\\\\\\\
3
\end{bmatrix}
$$

berarti:

$$
\hat{j}
$$

berpindah ke kiri 1 dan naik 3.

Dari dua informasi itu, seluruh transformasi sudah diketahui.

---

# Kenapa Ini Kuat?

Karena transformasi linear punya sifat:

$$
T(x\hat{i}+y\hat{j})
= {}
xT(\hat{i})+yT(\hat{j})
$$

Jadi begitu kita tahu nasib dua basis vector, kita tahu nasib semua vektor.

Ini bukan trik.

Ini inti linear algebra.

---

# Matriks 3D

Di ruang 3D, basis vector standar ada tiga:

$$
\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
0\\\\\\\\
0
\end{bmatrix}
$$

$$
\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
1\\\\\\\\
0
\end{bmatrix}
$$

$$
\hat{k}
= {}
\begin{bmatrix}
0\\\\\\\\
0\\\\\\\\
1
\end{bmatrix}
$$

Sebuah transformasi linear 3D disimpan sebagai matriks 3×3:

$$
A=
\begin{bmatrix}
| & | & |\\\\\\\\
T(\hat{i}) & T(\hat{j}) & T(\hat{k})\\\\\\
| & | & |
\end{bmatrix}
$$

Contoh:

$$
A=
\begin{bmatrix}
2 & 0 & 1\\\\\\\\
0 & 3 & 0\\\\\\\\
1 & 0 & 2
\end{bmatrix}
$$

Artinya:

$$
\hat{i}
\rightarrow
\begin{bmatrix}
2\\\\\\\\
0\\\\\\\\
1
\end{bmatrix}
$$

$$
\hat{j}
\rightarrow
\begin{bmatrix}
0\\\\\\\\
3\\\\\\\\
0
\end{bmatrix}
$$

$$
\hat{k}
\rightarrow
\begin{bmatrix}
1\\\\\\\\
0\\\\\\\\
2
\end{bmatrix}
$$

---

# Hubungan dengan Programming

Di graphics programming, transformasi objek biasanya dilakukan dengan matriks.

Misalnya:

- scale object
- rotate object
- skew object
- reflect object
- transform camera space ke world space

Objek 3D berisi banyak vertex.

Setiap vertex adalah vektor:

$$
\begin{bmatrix}
x\\\\\\
y\\\\\\
z
\end{bmatrix}
$$

Untuk mengubah seluruh objek, kita cukup menerapkan matriks yang sama ke semua vertex.

Secara pseudo-code:

```ts
const transformedVertices = vertices.map((v) => multiplyMatrixVector(A, v));
```

Maknanya:

> Satu matriks mendeskripsikan bagaimana seluruh ruang berubah.

---

# Jebakan Umum

## Salah #1 — Menganggap Matriks adalah Data Biasa

Matriks memang bisa dipakai sebagai tabel data.

Tapi dalam konteks linear algebra geometris:

> matriks adalah aksi.

Ia bukan hanya menyimpan angka.

Ia menyimpan transformasi.

---

## Salah #2 — Fokus ke Baris, Bukan Kolom

Untuk membaca transformasi, lihat kolom.

Pada:

$$
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

kolom pertama:

$$
\begin{bmatrix}
a\\\\\\
c
\end{bmatrix}
$$

adalah posisi baru $\hat{i}$.

Kolom kedua:

$$
\begin{bmatrix}
b\\\\\\
d
\end{bmatrix}
$$

adalah posisi baru $\hat{j}$.

---

## Salah #3 — Menghafal Rumus Perkalian

Rumus:

$$
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
\begin{bmatrix}
ax+by\\\\\\
cx+dy
\end{bmatrix}
$$

bukan aturan dari langit.

Itu hanyalah:

$$
x(\text{kolom pertama})+y(\text{kolom kedua})
$$

---

# Ringkasan

Matriks adalah cara menyimpan transformasi linear.

Dalam 2D:

$$
A=
\begin{bmatrix}
| & |\\\\\\\\
T(\hat{i}) & T(\hat{j})\\\\\\
| & |
\end{bmatrix}
$$

Kolom pertama menunjukkan ke mana $\hat{i}$ pergi.

Kolom kedua menunjukkan ke mana $\hat{j}$ pergi.

Untuk vektor:

$$
\vec{v}
= {}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
$$

hasil transformasi adalah:

$$
A\vec{v}
= {}
x(\text{kolom pertama})+y(\text{kolom kedua})
$$

atau:

$$
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
\begin{bmatrix}
ax+by\\\\\\
cx+dy
\end{bmatrix}
$$

Poin besarnya:

> Matrix multiplication is not arbitrary bookkeeping. It is geometry encoded as numbers.

---

# Quiz Pemahaman

## Level 1

### Soal 1

Diberikan matriks:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
$$

Ke mana $\hat{i}$ dan $\hat{j}$ berpindah?

---

### Soal 2

Hitung:

$$
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
\begin{bmatrix}
4\\\\\\\\
5
\end{bmatrix}
$$

---

### Soal 3

Diberikan:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Transformasi ini kira-kira scaling, rotasi, shear, atau refleksi?

---

## Level 2

### Soal 4

Diberikan transformasi:

$$
\hat{i}
\rightarrow
\begin{bmatrix}
3\\\\\\\\
1
\end{bmatrix}
$$

dan:

$$
\hat{j}
\rightarrow
\begin{bmatrix}
-2\\\\\\\\
4
\end{bmatrix}
$$

Tuliskan matriks transformasinya.

---

### Soal 5

Diberikan:

$$
A=
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 0
\end{bmatrix}
$$

Apa efek transformasi ini terhadap bidang?

---

### Soal 6

Jelaskan dengan kata-kata sendiri mengapa cukup mengetahui hasil transformasi dari $\hat{i}$ dan $\hat{j}$ untuk mengetahui seluruh transformasi 2D.

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

Hitung hasil transformasi untuk:

$$
\vec{v}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

Gunakan cara:

$$
3(\text{kolom pertama})+2(\text{kolom kedua})
$$

bukan langsung rumus hafalan.

---

### Soal 8

Sebuah transformasi membuat:

$$
\hat{i}
\rightarrow
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

dan:

$$
\hat{j}
\rightarrow
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

Apa yang terjadi pada grid persegi?

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

$$
\hat{i}
\rightarrow
\begin{bmatrix}
2\\\\\\\\
0
\end{bmatrix}
$$

$$
\hat{j}
\rightarrow
\begin{bmatrix}
0\\\\\\\\
3
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 2</summary>

$$
\begin{bmatrix}
8\\\\\\\\
15
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 3</summary>

Shear.

$\hat{i}$ tetap, sedangkan $\hat{j}$ miring ke kanan atas.

</details>

<details>
<summary>Soal 4</summary>

$$
A=
\begin{bmatrix}
3 & -2\\\\\\\\
1 & 4
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 5</summary>

Rotasi 90 derajat berlawanan arah jarum jam.

</details>

<details>
<summary>Soal 6</summary>

Karena setiap vektor 2D dapat ditulis sebagai:

$$
x\hat{i}+y\hat{j}
$$

Dan transformasi linear mempertahankan kombinasi linear:

$$
T(x\hat{i}+y\hat{j})
= {}
xT(\hat{i})+yT(\hat{j})
$$

</details>

<details>
<summary>Soal 7</summary>

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

Maka:

$$
3
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
+
2
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
= {}
\begin{bmatrix}
6\\\\\\\\
3
\end{bmatrix}
+
\begin{bmatrix}
2\\\\\\\\
4
\end{bmatrix}
= {}
\begin{bmatrix}
8\\\\\\\\
7
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 8</summary>

Grid persegi berubah menjadi grid miring/jajaran genjang.

Itu adalah shear.

</details>

---

# Preview Part 4

Kita sudah tahu bahwa matriks menyimpan transformasi.

Sekarang muncul pertanyaan baru:

> Kalau kita melakukan dua transformasi berturut-turut, bagaimana cara menyimpannya sebagai satu transformasi?

Misalnya:

1. rotasi dulu
2. lalu shear

Atau:

1. scaling dulu
2. lalu rotasi

Ternyata ini melahirkan operasi yang sering terasa misterius:

$$
AB
$$

Pada Part 4 kita akan membahas:

> Perkalian matriks sebagai komposisi transformasi.

Dan dari situ kita akan melihat kenapa umumnya:

$$
AB \neq BA
$$

---

**Navigasi:**
← [Part 2: Transformasi Linear, Fungsi yang Mengubah Seluruh Ruang](part-02.md) | [Part 4: Perkalian Matriks sebagai Komposisi Transformasi](part-04.md) →
