---
title: "Essence of Linear Algebra (Indonesia) — Part 4: Perkalian Matriks sebagai Komposisi Transformasi"
series: "Essence of Linear Algebra"
part: 4
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - matrix-multiplication
  - composition
  - linear-transformation
difficulty: "pemula-menengah"
estimated_reading_time: "30-40 menit"
prerequisites:
  - memahami vektor
  - memahami transformasi linear
  - memahami matriks sebagai transformasi linear
  - memahami basis vector standar
learning_objectives:
  - memahami perkalian matriks sebagai komposisi transformasi
  - memahami mengapa urutan perkalian matriks penting
  - memahami makna geometris dari $AB$
  - mampu menghitung hasil komposisi transformasi dari basis vector
  - memahami mengapa umumnya $AB \neq BA$
source_reference:
  - "3Blue1Brown — Essence of Linear Algebra playlist"
---

# Part 4 — Perkalian Matriks sebagai Komposisi Transformasi

## Masalah Baru

Di Part 3, kita melihat bahwa:

> Matriks adalah cara menyimpan transformasi linear.

Misalnya matriks:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
$$

berarti ruang diregangkan:

- 2 kali ke arah horizontal
- 3 kali ke arah vertikal

Lalu matriks:

$$
B=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

berarti ruang mengalami shear.

Sekarang pertanyaannya:

> Kalau kita melakukan dua transformasi berturut-turut, bisakah hasil akhirnya disimpan sebagai satu matriks saja?

Jawabannya:

> Bisa.

Dan operasi untuk menggabungkan dua transformasi linear itulah yang disebut:

$$
\text{perkalian matriks}
$$

---

# Jangan Mulai dari Rumus

Biasanya perkalian matriks diajarkan seperti ini:

$$
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
\begin{bmatrix}
e & f\\\\\\
g & h
\end{bmatrix}
= {}
\begin{bmatrix}
ae+bg & af+bh\\\\\\
ce+dg & cf+dh
\end{bmatrix}
$$

Lalu mahasiswa diminta menghafal pola:

- baris kali kolom
- baris kali kolom
- baris kali kolom

Secara hitungan benar.

Tapi secara intuisi, ini kering.

Cara berpikir 3Blue1Brown lebih bagus:

> Perkalian matriks adalah komposisi transformasi.

Artinya:

> satu transformasi dilakukan setelah transformasi lain.

---

# Komposisi Fungsi

Sebelum masuk matriks, ingat dulu konsep fungsi.

Misalkan:

$$
f(x)=2x
$$

dan:

$$
g(x)=x+3
$$

Kalau kita tulis:

$$
f(g(x))
$$

artinya:

1. jalankan $g$ dulu
2. hasilnya masuk ke $f$

Contoh:

$$
f(g(4))
= {}
f(7)
= {}
14
$$

Urutannya penting.

---

Dalam transformasi linear, ide yang sama berlaku.

Kalau:

$$
A(B\vec{v})
$$

artinya:

1. transformasi $B$ bekerja pada $\vec{v}$ dulu
2. hasilnya baru ditransformasikan oleh $A$

Jadi:

$$
AB\vec{v}
= {}
A(B\vec{v})
$$

Ini berarti:

> Dalam $AB$, matriks yang kanan bekerja dulu.

Sedikit tidak intuitif, tapi konsisten dengan komposisi fungsi.

---

# Makna $AB$

Misalkan:

$$
A
$$

adalah transformasi pertama secara visual yang ingin kita lihat setelah $B$.

Maka:

$$
AB
$$

berarti:

> lakukan $B$ dulu, lalu lakukan $A$.

Jadi:

$$
AB
$$

adalah satu matriks baru yang mewakili gabungan dua transformasi tersebut.

---

# Contoh Konkret

Misalkan:

$$
B=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Ini adalah shear.

Dan:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
$$

Ini adalah scaling 2 kali.

Kalau kita ingin:

1. shear dulu
2. lalu scaling

maka komposisinya:

$$
AB
$$

bukan:

$$
BA
$$

Karena $B$ bekerja dulu, lalu $A$.

---

# Cara Menghitung $AB$ Secara Geometris

Ingat dari Part 3:

> Kolom matriks adalah posisi baru basis vector.

Jadi untuk mencari matriks hasil gabungan $AB$, kita cukup mencari:

$$
AB\hat{i}
$$

dan:

$$
AB\hat{j}
$$

Kolom pertama hasil $AB$ adalah:

$$
AB\hat{i}
$$

Kolom kedua hasil $AB$ adalah:

$$
AB\hat{j}
$$

---

# Hitung Kolom Pertama

Gunakan:

$$
B=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

dan:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
$$

Kita ingin menghitung:

$$
AB\hat{i}
$$

Pertama:

$$
\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

Transformasikan dengan $B$:

$$
B\hat{i}
= {}
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
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

Lalu transformasikan dengan $A$:

$$
A(B\hat{i})
= {}
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
= {}
\begin{bmatrix}
2\\\\\\\\
0
\end{bmatrix}
$$

Jadi kolom pertama $AB$ adalah:

$$
\begin{bmatrix}
2\\\\\\\\
0
\end{bmatrix}
$$

---

# Hitung Kolom Kedua

Sekarang:

$$
AB\hat{j}
$$

Pertama:

$$
\hat{j}
= {}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

Transformasikan dengan $B$:

$$
B\hat{j}
= {}
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
= {}
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
$$

Lalu transformasikan dengan $A$:

$$
A(B\hat{j})
= {}
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
= {}
\begin{bmatrix}
2\\\\\\\\
2
\end{bmatrix}
$$

Jadi kolom kedua $AB$ adalah:

$$
\begin{bmatrix}
2\\\\\\\\
2
\end{bmatrix}
$$

Maka:

$$
AB=
\begin{bmatrix}
2 & 2\\\\\\\\
0 & 2
\end{bmatrix}
$$

---

# Cek dengan Rumus

Sekarang kita cek dengan rumus biasa:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
$$

$$
B=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Maka:

$$
AB
= {}
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
2\cdot1+0\cdot0 & 2\cdot1+0\cdot1\\\\\\\\
0\cdot1+2\cdot0 & 0\cdot1+2\cdot1
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
2 & 2\\\\\\\\
0 & 2
\end{bmatrix}
$$

Sama.

Tapi sekarang rumusnya punya makna.

---

# Kenapa Baris Kali Kolom Muncul?

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
B=
\begin{bmatrix}
e & f\\\\\\
g & h
\end{bmatrix}
$$

Kita ingin mencari:

$$
AB
$$

Kolom pertama $AB$ adalah:

$$
A
\begin{bmatrix}
e\\\\\\
g
\end{bmatrix}
$$

Karena kolom pertama $B$ adalah posisi baru $\hat{i}$ setelah transformasi $B$.

Maka:

$$
A
\begin{bmatrix}
e\\\\\\
g
\end{bmatrix}
= {}
\begin{bmatrix}
ae+bg\\\\\\
ce+dg
\end{bmatrix}
$$

Kolom kedua $AB$ adalah:

$$
A
\begin{bmatrix}
f\\\\\\
h
\end{bmatrix}
$$

Maka:

$$
A
\begin{bmatrix}
f\\\\\\
h
\end{bmatrix}
= {}
\begin{bmatrix}
af+bh\\\\\\
cf+dh
\end{bmatrix}
$$

Gabungkan dua kolom itu:

$$
AB
= {}
\begin{bmatrix}
ae+bg & af+bh\\\\\\
ce+dg & cf+dh
\end{bmatrix}
$$

Jadi rumus klasik:

$$
\text{baris kali kolom}
$$

muncul karena kita sedang mencari nasib basis vector setelah dua transformasi.

---

# Urutan Itu Penting

Sekarang bagian yang sangat penting:

> Umumnya $AB \neq BA$.

Bukan karena matematika iseng.

Tapi karena:

> melakukan transformasi A lalu B biasanya tidak sama dengan melakukan B lalu A.

---

# Contoh: Shear dan Rotasi

Misalkan kita punya dua transformasi:

1. shear
2. rotasi 90 derajat

Kalau kita shear dulu lalu rotate, hasilnya berbeda dari rotate dulu lalu shear.

Visualisasikan sebuah persegi.

## Urutan 1

1. persegi dimiringkan
2. lalu hasil miring itu diputar

## Urutan 2

1. persegi diputar
2. lalu hasil putaran itu dimiringkan terhadap sumbu yang sekarang berbeda

Hasil akhirnya tidak sama.

Itulah alasan geometris mengapa:

$$
AB \neq BA
$$

---

# Contoh Numerik $AB \neq BA$

Ambil:

$$
A=
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 0
\end{bmatrix}
$$

Ini rotasi 90 derajat berlawanan arah jarum jam.

Ambil:

$$
B=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Ini shear.

---

## Hitung $AB$

$$
AB
= {}
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 0
\end{bmatrix}
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
0\cdot1+(-1)\cdot0 & 0\cdot1+(-1)\cdot1\\\\\\\\
1\cdot1+0\cdot0 & 1\cdot1+0\cdot1
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 1
\end{bmatrix}
$$

---

## Hitung $BA$

$$
BA
= {}
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 0
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
1\cdot0+1\cdot1 & 1\cdot(-1)+1\cdot0\\\\\\\\
0\cdot0+1\cdot1 & 0\cdot(-1)+1\cdot0
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
1 & -1\\\\\\\\
1 & 0
\end{bmatrix}
$$

Jelas:

$$
AB
\neq
BA
$$

Karena:

$$
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 1
\end{bmatrix}
\neq
\begin{bmatrix}
1 & -1\\\\\\\\
1 & 0
\end{bmatrix}
$$

---

# Cara Membaca $AB$ Tanpa Bingung

Ini jebakan klasik.

$$
AB
$$

dibaca secara operasi ke vektor sebagai:

> $B$ dulu, lalu $A$.

Karena:

$$
AB\vec{v}=A(B\vec{v})
$$

Jadi matriks paling kanan menyentuh vektor lebih dulu.

Kalau ada:

$$
ABC\vec{v}
$$

urutannya:

1. $C$
2. $B$
3. $A$

Ini mirip pipeline yang dibaca dari kanan ke kiri.

Agak ngeselin, tapi ya begitulah notasi fungsi bekerja.

---

# Kapan $AB = BA$?

Kadang-kadang dua matriks bisa ditukar urutannya.

Misalnya dua scaling diagonal:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
$$

dan:

$$
B=
\begin{bmatrix}
5 & 0\\\\\\\\
0 & 7
\end{bmatrix}
$$

Maka:

$$
AB=BA
$$

Karena:

- scaling horizontal oleh 2 lalu 5 sama dengan 5 lalu 2
- scaling vertikal oleh 3 lalu 7 sama dengan 7 lalu 3

Tapi ini kasus khusus.

Jangan menganggap perkalian matriks komutatif.

Default-nya:

$$
AB \neq BA
$$

---

# Identity Matrix

Ada satu matriks spesial yang tidak mengubah apa pun:

$$
I=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 1
\end{bmatrix}
$$

Matriks ini disebut:

> identity matrix.

Kenapa?

Karena:

$$
I\vec{v}=\vec{v}
$$

untuk semua vektor $\vec{v}$.

Secara geometris:

- $\hat{i}$ tetap ke $\hat{i}$
- $\hat{j}$ tetap ke $\hat{j}$

Tidak ada scaling.

Tidak ada rotasi.

Tidak ada shear.

Tidak ada refleksi.

Ruang tetap sama.

---

# Identity dalam Komposisi

Untuk matriks apa pun $A$:

$$
AI=A
$$

dan:

$$
IA=A
$$

Karena melakukan "tidak ada apa-apa" sebelum atau sesudah transformasi tidak mengubah hasil.

Ini mirip angka 1 dalam perkalian biasa:

$$
1\cdot x=x
$$

Tapi hati-hati:

meskipun identity bisa ditukar dengan semua matriks, bukan berarti semua matriks bisa ditukar satu sama lain.

---

# Associativity

Perkalian matriks tidak komutatif.

Tapi perkalian matriks bersifat asosiatif.

Artinya:

$$
(AB)C=A(BC)
$$

Secara transformasi:

- lakukan $C$
- lalu $B$
- lalu $A$

Tidak peduli kita mengelompokkan sebagai:

$$
(AB)C
$$

atau:

$$
A(BC)
$$

hasil akhirnya tetap sama.

Kenapa?

Karena urutan transformasinya tetap:

$$
C \rightarrow B \rightarrow A
$$

Yang berubah hanya cara kita mengelompokkan perhitungan.

---

# Hubungan dengan Programming

Dalam graphics programming, transformasi sering dirangkai.

Misalnya sebuah object perlu:

1. discale
2. diputar
3. dipindah ke world position

Secara konsep:

```ts
const finalPosition = translationMatrix * rotationMatrix * scaleMatrix * localPosition;
```

Artinya urutan yang terjadi ke vector adalah:

1. `scaleMatrix`
2. `rotationMatrix`
3. `translationMatrix`

Yang kanan dulu.

Catatan: translasi biasanya butuh **homogeneous coordinates**, karena translasi bukan transformasi linear murni di 2D/3D biasa. Ini akan relevan kalau masuk computer graphics nanti.

---

# Jebakan Umum

## Salah #1 — Menganggap $AB$ Berarti $A$ Dulu Baru $B$

Untuk vektor:

$$
AB\vec{v}
$$

yang terjadi adalah:

1. $B$ dulu
2. $A$ kemudian

Karena:

$$
AB\vec{v}=A(B\vec{v})
$$

---

## Salah #2 — Menganggap Perkalian Matriks Komutatif

Pada angka biasa:

$$
2\cdot3=3\cdot2
$$

Tapi pada matriks:

$$
AB
$$

biasanya tidak sama dengan:

$$
BA
$$

Karena transformasi punya urutan.

---

## Salah #3 — Menghafal Baris Kali Kolom Tanpa Makna

Rumus boleh dipakai.

Tapi maknanya harus tetap dipegang:

> Kolom hasil perkalian adalah nasib basis vector setelah transformasi gabungan.

---

# Ringkasan

Perkalian matriks adalah komposisi transformasi.

Jika:

$$
AB\vec{v}
$$

maka:

1. $B$ bekerja pada $\vec{v}$ dulu
2. $A$ bekerja setelahnya

Matriks $AB$ adalah satu transformasi baru yang setara dengan melakukan $B$ lalu $A$.

Kolom-kolom $AB$ diperoleh dari:

$$
AB\hat{i}
$$

dan:

$$
AB\hat{j}
$$

Secara umum:

$$
AB \neq BA
$$

karena urutan transformasi biasanya mengubah hasil.

---

# Quiz Pemahaman

## Level 1

### Soal 1

Jika:

$$
AB\vec{v}
$$

diterapkan pada vektor $\vec{v}$, transformasi mana yang bekerja lebih dulu?

---

### Soal 2

Apa makna geometris dari perkalian matriks?

---

### Soal 3

Apa identity matrix 2D?

---

## Level 2

### Soal 4

Diberikan:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
$$

dan:

$$
B=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Hitung:

$$
AB
$$

---

### Soal 5

Dengan $A$ dan $B$ yang sama, hitung:

$$
BA
$$

Apakah hasilnya sama dengan $AB$?

---

### Soal 6

Jelaskan dengan kata-kata sendiri mengapa rotasi lalu shear biasanya berbeda dari shear lalu rotasi.

---

## Level 3

### Soal 7

Misalkan:

$$
A=
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 0
\end{bmatrix}
$$

dan:

$$
B=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
$$

Secara geometris, apa arti:

$$
AB
$$

terhadap sebuah vektor?

---

### Soal 8

Tanpa menghitung penuh, jelaskan mengapa dua scaling diagonal biasanya bisa saling ditukar urutannya.

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

$B$ bekerja lebih dulu.

Karena:

$$
AB\vec{v}=A(B\vec{v})
$$

</details>

<details>
<summary>Soal 2</summary>

Perkalian matriks adalah komposisi transformasi, yaitu menggabungkan dua transformasi linear berturut-turut menjadi satu transformasi linear.

</details>

<details>
<summary>Soal 3</summary>

$$
I=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 1
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 4</summary>

$$
AB
= {}
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
= {}
\begin{bmatrix}
2 & 2\\\\\\\\
0 & 2
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 5</summary>

$$
BA
= {}
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
= {}
\begin{bmatrix}
2 & 2\\\\\\\\
0 & 2
\end{bmatrix}
$$

Untuk contoh ini hasilnya sama, karena $A$ adalah scaling seragam 2 kali. Scaling seragam commute dengan shear ini.

Tapi jangan generalisasi. Untuk banyak pasangan matriks lain:

$$
AB\neq BA
$$

</details>

<details>
<summary>Soal 6</summary>

Karena shear bergantung pada arah grid/sumbu saat itu.

Jika ruang diputar dulu, arah horizontal dan vertikalnya berubah. Maka shear setelah rotasi bekerja terhadap orientasi yang berbeda dibanding shear sebelum rotasi.

</details>

<details>
<summary>Soal 7</summary>

Karena:

$$
AB\vec{v}=A(B\vec{v})
$$

maka $B$ bekerja dulu.

Artinya:

1. vektor discale: x dikali 2, y dikali 3
2. hasilnya diputar 90 derajat berlawanan arah jarum jam oleh $A$

</details>

<details>
<summary>Soal 8</summary>

Karena scaling diagonal hanya mengalikan masing-masing sumbu dengan faktor tertentu.

Mengalikan arah x dengan 2 lalu 5 sama dengan 5 lalu 2. Begitu juga arah y.

Jadi urutan tidak mengubah hasil.

</details>

---

# Preview Part 5

Kita sekarang tahu:

- vektor adalah objek dengan arah dan panjang
- transformasi linear mengubah seluruh ruang
- matriks menyimpan transformasi linear
- perkalian matriks menggabungkan transformasi

Berikutnya kita masuk ke salah satu konsep yang sering disalahpahami:

$$
\det(A)
$$

Banyak orang mengenal determinan sebagai rumus:

$$
ad-bc
$$

untuk matriks:

$$
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

Tapi itu bukan inti sebenarnya.

Pada Part 5, kita akan melihat bahwa determinan adalah:

> faktor perubahan luas atau volume akibat transformasi linear.

Dan dari situ kita akan paham kenapa determinan nol berarti ruang “runtuh”.

---

**Navigasi:**
← [Part 3: Matriks sebagai Transformasi Linear](part-03.md) | [Part 5: Determinan sebagai Perubahan Luas](part-05.md) →
