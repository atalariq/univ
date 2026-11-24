---
title: "Essence of Linear Algebra (Indonesia) — Part 9: Change of Basis, Ketika Koordinat Bergantung pada Sudut Pandang"
series: "Essence of Linear Algebra"
part: 9
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - basis
  - change-of-basis
  - coordinates
  - transformation
difficulty: "menengah"
estimated_reading_time: "45-55 menit"
prerequisites:
  - memahami vektor
  - memahami basis vector
  - memahami matriks sebagai transformasi linear
  - memahami perkalian matriks
  - memahami invers matriks
learning_objectives:
  - memahami bahwa koordinat bergantung pada basis
  - membedakan vektor dengan representasi koordinatnya
  - memahami basis sebagai bahasa koordinat
  - memahami change of basis matrix
  - memahami transformasi yang sama dari sudut pandang basis berbeda
source_reference:
  - "3Blue1Brown — Essence of Linear Algebra playlist"
---

# Part 9 — Change of Basis, Ketika Koordinat Bergantung pada Sudut Pandang

## Masalah Besarnya

Sampai sekarang, kita selalu memakai basis standar:

$$
\hat{i}
= {}
\begin{bmatrix}
1\\\\\\\\
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
$$

Dengan basis ini, vektor:

$$
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

berarti:

$$
3\hat{i}+2\hat{j}
$$

atau:

> 3 langkah ke kanan, 2 langkah ke atas.

Tapi ada pertanyaan yang sering kelewat:

> Apakah $\hat{i}$ dan $\hat{j}$ harus selalu menjadi arah dasar kita?

Jawabannya:

> Tidak.

Kita bisa memilih basis lain.

Dan ketika basis berubah, koordinat sebuah vektor juga berubah.

Ini inti dari **change of basis**.

---

# Vektor Bukan Koordinatnya

Ini harus ditancapkan dulu.

Ketika kita menulis:

$$
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

kita sering berkata:

> ini vektornya.

Secara praktis boleh.

Tapi secara konsep, lebih tepat:

> ini koordinat dari sebuah vektor dalam basis tertentu.

Koordinat bukan objeknya.

Koordinat adalah deskripsi objek.

Sama seperti:

- "Jakarta"
- "Djakarta"
- "ジャカルタ"
- "جاكرتا"

semuanya bisa menunjuk kota yang sama dengan sistem simbol yang berbeda.

Vektornya sama.

Bahasa koordinatnya bisa berbeda.

---

# Basis sebagai Bahasa

Basis adalah sekumpulan vektor dasar yang kita pakai untuk mendeskripsikan vektor lain.

Dalam 2D, basis biasanya terdiri dari dua vektor independen.

Misalkan basis standar:

$$
\mathcal{E}
= {}
\left\{
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix},
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
\right\}
$$

Kita bisa menyebutnya basis $\mathcal{E}$.

Dalam basis ini:

$$
\vec{v}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}_{\mathcal{E}}
$$

berarti:

$$
\vec{v}
= {}
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
$$

---

# Basis Baru

Sekarang misalkan ada basis baru:

$$
\mathcal{B}
= {}
\left\{
\vec{b}_1,
\vec{b}_2
\right\}
$$

dengan:

$$
\vec{b}_1=
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

dan:

$$
\vec{b}_2=
\begin{bmatrix}
-1\\\\\\\\
1
\end{bmatrix}
$$

Karena $\vec{b}_1$ dan $\vec{b}_2$ tidak searah, keduanya membentuk basis untuk seluruh bidang 2D.

Artinya setiap vektor 2D bisa ditulis sebagai kombinasi:

$$
c_1\vec{b}_1+c_2\vec{b}_2
$$

untuk suatu $c_1$ dan $c_2$.

Koordinat:

$$
\begin{bmatrix}
c_1\\\\\\\\
c_2
\end{bmatrix}_{\mathcal{B}}
$$

berarti:

> $c_1$ bagian ke arah $\vec{b}_1$, dan $c_2$ bagian ke arah $\vec{b}_2$.

---

# Contoh Koordinat dalam Basis Baru

Ambil vektor fisik:

$$
\vec{v}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}_{\mathcal{E}}
$$

Artinya dalam basis standar, vektor ini berada di:

$$
(3,2)
$$

Sekarang kita ingin menulis vektor yang sama dalam basis $\mathcal{B}$.

Kita cari $c_1$ dan $c_2$ sehingga:

$$
c_1
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
+
c_2
\begin{bmatrix}
-1\\\\\\\\
1
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

Hitung:

$$
\begin{bmatrix}
2c_1-c_2\\\\\\\\
c_1+c_2
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

Maka sistemnya:

$$
2c_1-c_2=3
$$

$$
c_1+c_2=2
$$

Dari persamaan kedua:

$$
c_2=2-c_1
$$

Substitusi:

$$
2c_1-(2-c_1)=3
$$

$$
3c_1-2=3
$$

$$
3c_1=5
$$

$$
c_1=\frac{5}{3}
$$

Maka:

$$
c_2=2-\frac{5}{3}=\frac{1}{3}
$$

Jadi:

$$
\vec{v}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}_{\mathcal{E}}
= {}
\begin{bmatrix}
\frac{5}{3}\\\\\\
\frac{1}{3}
\end{bmatrix}_{\mathcal{B}}
$$

Objek geometrisnya sama.

Koordinatnya berbeda.

---

# Ini Bukan Trik Aljabar

Perhatikan poin pentingnya.

Vektor yang sama bisa ditulis sebagai:

$$
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}_{\mathcal{E}}
$$

atau:

$$
\begin{bmatrix}
\frac{5}{3}\\\\\\
\frac{1}{3}
\end{bmatrix}_{\mathcal{B}}
$$

Tidak ada kontradiksi.

Karena dua notasi itu memakai basis yang berbeda.

Yang satu berarti:

> 3 unit ke arah $\hat{i}$ dan 2 unit ke arah $\hat{j}$.

Yang lain berarti:

> $\frac{5}{3}$ unit ke arah $\vec{b}_1$ dan $\frac{1}{3}$ unit ke arah $\vec{b}_2$.

Vektor asli tetap sama.

Bahasa deskripsinya berubah.

---

# Matriks Basis

Basis $\mathcal{B}$ tadi bisa dikemas menjadi matriks:

$$
P
= {}
\begin{bmatrix}
| & |\\\\\\\\
\vec{b}_1 & \vec{b}_2\\\\\\\\
| & |
\end{bmatrix}
= {}
\begin{bmatrix}
2 & -1\\\\\\\\
1 & 1
\end{bmatrix}
$$

Kolom-kolom $P$ adalah vektor basis baru, tetapi ditulis dalam basis standar.

Matriks ini punya peran penting:

> $P$ mengubah koordinat basis $\mathcal{B}$ menjadi koordinat basis standar.

---

# Dari Koordinat Basis Baru ke Koordinat Standar

Misalkan kita punya koordinat dalam basis $\mathcal{B}$:

$$
[\vec{v}]_{\mathcal{B}}
= {}
\begin{bmatrix}
c_1\\\\\\\\
c_2
\end{bmatrix}
$$

Maka koordinat standar dari vektor yang sama adalah:

$$
[\vec{v}]_{\mathcal{E}}
= {}
P[\vec{v}]_{\mathcal{B}}
$$

Kenapa?

Karena:

$$
P
\begin{bmatrix}
c_1\\\\\\\\
c_2
\end{bmatrix}
= {}
c_1\vec{b}_1+c_2\vec{b}_2
$$

Persis definisi koordinat dalam basis $\mathcal{B}$.

---

# Contoh

Dari sebelumnya:

$$
[\vec{v}]_{\mathcal{B}}
= {}
\begin{bmatrix}
\frac{5}{3}\\\\\\
\frac{1}{3}
\end{bmatrix}
$$

dan:

$$
P=
\begin{bmatrix}
2 & -1\\\\\\\\
1 & 1
\end{bmatrix}
$$

Maka:

$$
[\vec{v}]_{\mathcal{E}}
= {}
P[\vec{v}]_{\mathcal{B}}
$$

$$
= {}
\begin{bmatrix}
2 & -1\\\\\\\\
1 & 1
\end{bmatrix}
\begin{bmatrix}
\frac{5}{3}\\\\\\
\frac{1}{3}
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
2\cdot\frac{5}{3}-1\cdot\frac{1}{3}\\\\\\
\frac{5}{3}+\frac{1}{3}
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
\frac{10}{3}-\frac{1}{3}\\\\\\
\frac{6}{3}
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

Benar.

---

# Dari Koordinat Standar ke Koordinat Basis Baru

Sekarang arah sebaliknya.

Jika:

$$
[\vec{v}]_{\mathcal{E}}
= {}
P[\vec{v}]_{\mathcal{B}}
$$

maka untuk mencari koordinat basis baru:

$$
[\vec{v}]_{\mathcal{B}}
= {}
P^{-1}[\vec{v}]_{\mathcal{E}}
$$

Jadi:

- $P$ mengubah bahasa $\mathcal{B}$ ke bahasa standar
- $P^{-1}$ mengubah bahasa standar ke bahasa $\mathcal{B}$

Ini salah satu pola paling penting.

---

# Hitung $P^{-1}$

Untuk:

$$
P=
\begin{bmatrix}
2 & -1\\\\\\\\
1 & 1
\end{bmatrix}
$$

Determinan:

$$
\det(P)=2\cdot1-(-1)\cdot1=3
$$

Maka:

$$
P^{-1}
= {}
\frac{1}{3}
\begin{bmatrix}
1 & 1\\\\\\\\
-1 & 2
\end{bmatrix}
$$

Sekarang:

$$
[\vec{v}]_{\mathcal{B}}
= {}
P^{-1}[\vec{v}]_{\mathcal{E}}
$$

$$
= {}
\frac{1}{3}
\begin{bmatrix}
1 & 1\\\\\\\\
-1 & 2
\end{bmatrix}
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

$$
= {}
\frac{1}{3}
\begin{bmatrix}
5\\\\\\\\
1
\end{bmatrix}
= {}
\begin{bmatrix}
\frac{5}{3}\\\\\\
\frac{1}{3}
\end{bmatrix}
$$

Sesuai hasil sebelumnya.

---

# Kenapa $P$ Harus Invertible?

Agar $\mathcal{B}$ benar-benar menjadi basis, vektor-vektor basisnya harus independen.

Dalam 2D, artinya:

- $\vec{b}_1$ dan $\vec{b}_2$ tidak searah
- keduanya menjangkau seluruh bidang
- setiap vektor punya koordinat unik dalam basis itu

Secara matriks:

$$
P
$$

harus invertible.

Artinya:

$$
\det(P)\neq0
$$

Kalau:

$$
\det(P)=0
$$

maka kolom-kolom $P$ dependent.

Basisnya gagal.

Kenapa gagal?

Karena ada dua masalah:

1. tidak semua vektor bisa dijangkau
2. representasi bisa tidak unik

Basis yang buruk. Jangan dipakai, kecuali memang sedang cari masalah.

---

# Change of Basis: Inti Praktisnya

Misalkan kita punya:

$$
P=
\begin{bmatrix}
| & |\\\\\\\\
\vec{b}_1 & \vec{b}_2\\\\\\\\
| & |
\end{bmatrix}
$$

Maka:

$$
[\vec{v}]_{\mathcal{E}}=P[\vec{v}]_{\mathcal{B}}
$$

dan:

$$
[\vec{v}]_{\mathcal{B}}=P^{-1}[\vec{v}]_{\mathcal{E}}
$$

Kalau bingung, ingat:

> Kolom $P$ adalah basis baru dalam koordinat lama.

Jadi $P$ mengambil koordinat baru dan menerjemahkannya ke koordinat lama.

---

# Transformasi dalam Basis Berbeda

Sekarang kita naik level.

Misalkan ada transformasi linear $A$ yang kita pahami dalam basis standar.

Artinya:

$$
[\vec{w}]_{\mathcal{E}}
= {}
A[\vec{v}]_{\mathcal{E}}
$$

Tapi bagaimana jika kita ingin mendeskripsikan transformasi yang sama dalam basis $\mathcal{B}$?

Kita ingin matriks baru, sebut saja:

$$
A_{\mathcal{B}}
$$

yang bekerja langsung pada koordinat basis $\mathcal{B}$:

$$
[\vec{w}]_{\mathcal{B}}
= {}
A_{\mathcal{B}}[\vec{v}]_{\mathcal{B}}
$$

Pertanyaannya:

> Apa bentuk $A_{\mathcal{B}}$?

---

# Pipeline Terjemahan

Kalau kita punya input dalam basis $\mathcal{B}$, tetapi transformasi $A$ bekerja dalam basis standar, maka prosesnya:

1. ubah koordinat dari basis $\mathcal{B}$ ke basis standar
2. terapkan transformasi $A$
3. ubah hasilnya kembali ke basis $\mathcal{B}$

Dalam simbol:

$$
[\vec{v}]_{\mathcal{B}}
\overset{P}{\longrightarrow}
[\vec{v}]_{\mathcal{E}}
\overset{A}{\longrightarrow}
[\vec{w}]_{\mathcal{E}}
\overset{P^{-1}}{\longrightarrow}
[\vec{w}]_{\mathcal{B}}
$$

Maka:

$$
[\vec{w}]_{\mathcal{B}}
= {}
P^{-1}AP[\vec{v}]_{\mathcal{B}}
$$

Jadi:

$$
A_{\mathcal{B}}=P^{-1}AP
$$

Ini rumus penting.

Tapi jangan hafalkan kosong.

Baca sebagai pipeline:

> keluar dari bahasa basis baru, lakukan transformasi, masuk lagi ke bahasa basis baru.

---

# Kenapa Urutannya $P^{-1}AP$?

Karena matriks paling kanan bekerja dulu.

Pada:

$$
P^{-1}AP[\vec{v}]_{\mathcal{B}}
$$

urutannya:

1. $P$ menerjemahkan dari $\mathcal{B}$ ke standar
2. $A$ melakukan transformasi dalam standar
3. $P^{-1}$ menerjemahkan balik ke $\mathcal{B}$

Jadi:

$$
A_{\mathcal{B}}=P^{-1}AP
$$

bukan:

$$
PAP^{-1}
$$

Urutan salah, makna bubar.

---

# Contoh Transformasi dalam Basis Baru

Gunakan basis:

$$
P=
\begin{bmatrix}
2 & -1\\\\\\\\
1 & 1
\end{bmatrix}
$$

dan transformasi standar:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
$$

Ini scaling:

- arah x dikali 2
- arah y dikali 3

Kita ingin representasi transformasi ini dalam basis $\mathcal{B}$.

Rumus:

$$
A_{\mathcal{B}}=P^{-1}AP
$$

Kita sudah punya:

$$
P^{-1}
= {}
\frac{1}{3}
\begin{bmatrix}
1 & 1\\\\\\\\
-1 & 2
\end{bmatrix}
$$

Hitung dulu:

$$
AP
= {}
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
\begin{bmatrix}
2 & -1\\\\\\\\
1 & 1
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
4 & -2\\\\\\\\
3 & 3
\end{bmatrix}
$$

Lalu:

$$
P^{-1}AP
= {}
\frac{1}{3}
\begin{bmatrix}
1 & 1\\\\\\\\
-1 & 2
\end{bmatrix}
\begin{bmatrix}
4 & -2\\\\\\\\
3 & 3
\end{bmatrix}
$$

$$
= {}
\frac{1}{3}
\begin{bmatrix}
7 & 1\\\\\\\\
2 & 8
\end{bmatrix}
$$

Jadi:

$$
A_{\mathcal{B}}
= {}
\begin{bmatrix}
\frac{7}{3} & \frac{1}{3}\\\\\\
\frac{2}{3} & \frac{8}{3}
\end{bmatrix}
$$

Matriksnya terlihat lebih ribet.

Tapi ia mendeskripsikan transformasi yang sama, hanya dari sudut pandang koordinat basis $\mathcal{B}$.

---

# Transformasi Sama, Koordinat Berbeda

Ini bagian yang harus pelan-pelan.

$A$ dan $A_{\mathcal{B}}$ bukan transformasi geometris yang berbeda.

Mereka mendeskripsikan transformasi yang sama, tetapi memakai bahasa koordinat berbeda.

- $A$ berbicara dalam basis standar
- $A_{\mathcal{B}}$ berbicara dalam basis $\mathcal{B}$

Seperti orang yang sama dijelaskan dengan dua bahasa.

Subjeknya sama.

Bahasanya beda.

---

# Similar Matrices

Dua matriks yang berhubungan seperti:

$$
B=P^{-1}AP
$$

disebut **similar matrices**.

Mereka merepresentasikan transformasi linear yang sama dalam basis berbeda.

Ini penting karena nanti di eigenvector dan diagonalization, kita akan mencari basis yang membuat transformasi terlihat lebih sederhana.

Kadang matriks yang terlihat rumit dalam basis standar bisa menjadi sangat sederhana dalam basis yang tepat.

Itulah salah satu alasan change of basis sangat powerful.

---

# Basis yang Membuat Transformasi Sederhana

Bayangkan transformasi yang dalam basis standar terlihat seperti campuran:

- rotate sedikit
- stretch
- shear

Matriksnya mungkin terlihat ribet.

Tapi mungkin ada basis tertentu di mana transformasi itu hanya terlihat seperti:

$$
\begin{bmatrix}
\lambda_1 & 0\\\\\\\\
0 & \lambda_2
\end{bmatrix}
$$

Artinya:

- basis vector pertama hanya discale
- basis vector kedua hanya discale
- tidak saling campur

Basis seperti ini sangat spesial.

Dan vektor basisnya adalah:

> eigenvectors.

Ini preview untuk bagian berikutnya.

---

# Hubungan dengan Computer Graphics

Change of basis muncul terus di computer graphics.

Contoh:

- world space
- local/object space
- camera/view space
- screen space

Satu titik 3D bisa punya koordinat berbeda tergantung space mana yang dipakai.

Misalnya posisi objek dalam world space:

$$
\begin{bmatrix}
10\\\\\\\\
2\\\\\\\\
5
\end{bmatrix}
$$

Tapi dalam camera space, titik yang sama bisa menjadi:

$$
\begin{bmatrix}
3\\\\\\\\
1\\\\\\\\
-7
\end{bmatrix}
$$

Titik fisiknya sama.

Koordinatnya berbeda karena basis dan origin sistem koordinatnya berbeda.

Catatan: untuk menyertakan translasi, graphics biasanya memakai homogeneous coordinates dan matriks 4×4. Tapi ide basis dan transformasi koordinat tetap sama.

---

# Hubungan dengan Machine Learning

Dalam machine learning, representasi sangat penting.

Data yang sama bisa direpresentasikan dalam basis atau coordinate system berbeda.

Contoh:

- pixel basis
- frequency basis
- principal component basis
- embedding space
- latent space

PCA, misalnya, dapat dipahami sebagai mencari basis baru yang membuat arah variasi terbesar menjadi koordinat utama.

Dengan basis yang tepat, struktur data bisa terlihat lebih jelas.

Dengan basis yang buruk, struktur data bisa terlihat kusut.

Ini bukan sulap.

Ini change of basis.

---

# Hubungan dengan Fisika

Dalam fisika, vektor sering sama tetapi koordinatnya berubah tergantung pengamat.

Misalnya gaya atau kecepatan bisa dijelaskan dari frame referensi berbeda.

Objek fisiknya sama.

Komponen koordinatnya berbeda.

Linear algebra memberi bahasa formal untuk hal ini.

---

# Jebakan Umum

## Salah #1 — Menganggap Koordinat adalah Vektor

Koordinat adalah representasi.

Vektor adalah objek geometris.

Koordinat selalu relatif terhadap basis.

Kalau basis tidak disebut, biasanya diasumsikan basis standar.

---

## Salah #2 — Menganggap Basis Harus Ortogonal

Basis tidak harus tegak lurus.

Basis hanya perlu:

- independen
- menjangkau ruang

Dalam 2D, dua vektor tidak searah sudah cukup.

Dalam 3D, tiga vektor tidak boleh berada dalam satu bidang yang sama.

---

## Salah #3 — Lupa Arah Translasi

Matriks $P$ dengan kolom basis baru hanya mengubah basis untuk vektor yang origin-nya sama.

Kalau kita juga memindahkan origin, itu masuk affine transformation, bukan linear transformation murni.

Di graphics, ini ditangani dengan homogeneous coordinates.

---

## Salah #4 — Salah Urutan $P^{-1}AP$

Rumus:

$$
A_{\mathcal{B}}=P^{-1}AP
$$

harus dibaca dari kanan ke kiri:

1. $P$: basis baru ke standar
2. $A$: transformasi standar
3. $P^{-1}$: standar ke basis baru

Kalau urutannya ditukar, maknanya beda.

---

# Ringkasan

Koordinat sebuah vektor bergantung pada basis.

Vektor yang sama bisa punya koordinat berbeda dalam basis berbeda.

Jika $P$ adalah matriks yang kolom-kolomnya adalah basis baru dalam koordinat standar, maka:

$$
[\vec{v}]_{\mathcal{E}}=P[\vec{v}]_{\mathcal{B}}
$$

dan:

$$
[\vec{v}]_{\mathcal{B}}=P^{-1}[\vec{v}]_{\mathcal{E}}
$$

Jika transformasi $A$ ditulis dalam basis standar, maka representasinya dalam basis $\mathcal{B}$ adalah:

$$
A_{\mathcal{B}}=P^{-1}AP
$$

Poin besar:

> Change of basis bukan mengubah vektor fisik. Ia mengubah bahasa koordinat yang kita pakai untuk mendeskripsikannya.

---

# Quiz Pemahaman

## Level 1

### Soal 1

Apa perbedaan antara vektor dan koordinat?

---

### Soal 2

Apakah basis dalam 2D harus selalu:

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

Jelaskan singkat.

---

### Soal 3

Jika $P$ berisi kolom-kolom basis baru, apa makna operasi:

$$
P[\vec{v}]_{\mathcal{B}}
$$

---

## Level 2

### Soal 4

Diberikan basis:

$$
\vec{b}_1=
\begin{bmatrix}
2\\\\\\\\
0
\end{bmatrix}
,\quad
\vec{b}_2=
\begin{bmatrix}
0\\\\\\\\
3
\end{bmatrix}
$$

Jika:

$$
[\vec{v}]_{\mathcal{B}}
= {}
\begin{bmatrix}
4\\\\\\\\
5
\end{bmatrix}
$$

berapa:

$$
[\vec{v}]_{\mathcal{E}}
$$

---

### Soal 5

Untuk basis pada Soal 4, tuliskan matriks $P$.

---

### Soal 6

Jika:

$$
[\vec{v}]_{\mathcal{E}}
= {}
\begin{bmatrix}
8\\\\\\\\
15
\end{bmatrix}
$$

dengan basis Soal 4, berapa:

$$
[\vec{v}]_{\mathcal{B}}
$$

---

## Level 3

### Soal 7

Diberikan:

$$
P=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

dan:

$$
[\vec{v}]_{\mathcal{B}}
= {}
\begin{bmatrix}
2\\\\\\\\
3
\end{bmatrix}
$$

Hitung:

$$
[\vec{v}]_{\mathcal{E}}
$$

---

### Soal 8

Jika transformasi $A$ ditulis dalam basis standar, dan $P$ adalah matriks basis baru, mengapa representasi $A$ dalam basis baru adalah:

$$
P^{-1}AP
$$

bukan:

$$
PAP^{-1}
$$

---

### Soal 9

Apa makna “similar matrices” secara geometris?

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

Vektor adalah objek geometris.

Koordinat adalah cara mendeskripsikan vektor berdasarkan basis tertentu.

Vektor yang sama bisa punya koordinat berbeda jika basisnya berbeda.

</details>

<details>
<summary>Soal 2</summary>

Tidak.

Basis standar hanya salah satu pilihan. Basis 2D bisa berupa dua vektor apa pun selama keduanya independen dan menjangkau seluruh bidang.

</details>

<details>
<summary>Soal 3</summary>

Operasi itu menerjemahkan koordinat vektor dari basis $\mathcal{B}$ ke basis standar $\mathcal{E}$.

</details>

<details>
<summary>Soal 4</summary>

Basis:

$$
\vec{b}_1=
\begin{bmatrix}
2\\\\\\\\
0
\end{bmatrix}
,\quad
\vec{b}_2=
\begin{bmatrix}
0\\\\\\\\
3
\end{bmatrix}
$$

Maka:

$$
[\vec{v}]_{\mathcal{E}}
= {}
4
\begin{bmatrix}
2\\\\\\\\
0
\end{bmatrix}
+
5
\begin{bmatrix}
0\\\\\\\\
3
\end{bmatrix}
= {}
\begin{bmatrix}
8\\\\\\\\
15
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 5</summary>

$$
P=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 6</summary>

Karena basisnya hanya scaling:

$$
[\vec{v}]_{\mathcal{B}}
= {}
\begin{bmatrix}
8/2\\\\\\\\
15/3
\end{bmatrix}
= {}
\begin{bmatrix}
4\\\\\\\\
5
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 7</summary>

$$
[\vec{v}]_{\mathcal{E}}
= {}
P[\vec{v}]_{\mathcal{B}}
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

</details>

<details>
<summary>Soal 8</summary>

Karena input awal berada dalam koordinat basis baru.

Urutan yang benar:

1. $P$: terjemahkan dari basis baru ke basis standar
2. $A$: lakukan transformasi standar
3. $P^{-1}$: terjemahkan hasilnya kembali ke basis baru

Maka:

$$
A_{\mathcal{B}}=P^{-1}AP
$$

</details>

<details>
<summary>Soal 9</summary>

Similar matrices adalah matriks-matriks yang merepresentasikan transformasi linear yang sama, tetapi dalam basis berbeda.

Secara geometris, transformasinya sama. Yang berubah hanya bahasa koordinatnya.

</details>

---

# Preview Part 10

Sekarang kita siap masuk ke salah satu konsep paling terkenal di linear algebra:

$$
\text{eigenvectors}
$$

Biasanya eigenvector terasa misterius karena namanya asing dan definisinya langsung simbolik:

$$
A\vec{v}=\lambda\vec{v}
$$

Tapi dengan intuisi transformasi, idenya sederhana:

> Eigenvector adalah vektor yang tidak berubah arah ketika transformasi dilakukan.

Ia boleh memanjang.

Ia boleh memendek.

Ia boleh berbalik arah.

Tapi ia tetap berada pada garis yang sama.

Pada Part 10, kita akan membahas eigenvector dan eigenvalue sebagai “arah spesial” dari sebuah transformasi.

---

**Navigasi:**
← [Part 8: Rank, Dimensi dari Output yang Mungkin](part-08.md) | [Part 10: Eigenvector dan Eigenvalue, Arah Spesial yang Tidak Berubah](part-10.md) →
