---
title: "Essence of Linear Algebra (Indonesia) — Part 5: Determinan sebagai Perubahan Luas"
series: "Essence of Linear Algebra"
part: 5
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - determinant
  - area-scaling
  - linear-transformation
difficulty: "pemula-menengah"
estimated_reading_time: "35-45 menit"
prerequisites:
  - memahami vektor
  - memahami transformasi linear
  - memahami matriks sebagai transformasi linear
  - memahami basis vector
learning_objectives:
  - memahami determinan sebagai faktor perubahan luas
  - memahami makna determinan positif, negatif, dan nol
  - memahami hubungan determinan dengan invertibility
  - memahami mengapa rumus $ad-bc$ masuk akal secara geometris
  - mampu membaca efek transformasi dari nilai determinan
source_reference:
  - "3Blue1Brown — Essence of Linear Algebra playlist"
---

# Part 5 — Determinan sebagai Perubahan Luas

## Masalahnya dengan Cara Biasa

Biasanya determinan 2D diajarkan begini:

Untuk matriks:

$$
A=
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

determinannya adalah:

$$
\det(A)=ad-bc
$$

Lalu selesai.

Murid disuruh menghafal.

Masalahnya:

> Rumus itu tidak memberi tahu apa yang sebenarnya sedang terjadi.

Padahal determinan punya makna geometris yang jauh lebih bagus:

> Determinan adalah faktor perubahan luas akibat transformasi linear.

Itu inti Part 5.

---

# Mulai dari Kotak Satuan

Bayangkan grid standar 2D.

Ada kotak kecil berukuran:

$$
1 \times 1
$$

Luasnya:

$$
1
$$

Kotak ini dibentuk oleh dua basis vector standar:

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

Secara visual:

- $\hat{i}$ membentuk sisi bawah kotak
- $\hat{j}$ membentuk sisi kiri kotak

Kotak satuan ini adalah objek referensi.

---

# Setelah Transformasi

Sekarang terapkan transformasi linear $A$.

Basis vector berubah:

$$
\hat{i}
\rightarrow A\hat{i}
$$

dan:

$$
\hat{j}
\rightarrow A\hat{j}
$$

Kotak satuan tadi ikut berubah.

Karena transformasi linear menjaga garis tetap lurus dan grid tetap teratur, kotak satuan berubah menjadi:

> jajar genjang.

Luas jajar genjang baru inilah yang menjadi determinan, dengan tanda tertentu.

---

# Definisi Intuitif

Untuk transformasi linear 2D:

$$
\det(A)
$$

adalah faktor yang memberi tahu:

> luas area berubah berapa kali lipat setelah transformasi $A$.

Contoh:

- $\det(A)=2$ berarti semua area menjadi 2 kali lebih besar
- $\det(A)=\frac{1}{2}$ berarti semua area menjadi setengah
- $\det(A)=0$ berarti area runtuh menjadi 0
- $\det(A)=-3$ berarti area menjadi 3 kali lebih besar, tetapi orientasi terbalik

---

# Contoh 1 — Scaling Seragam

Misalkan:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 2
\end{bmatrix}
$$

Transformasi ini memperbesar semua arah 2 kali.

Kotak satuan yang awalnya luasnya:

$$
1
$$

berubah menjadi kotak berukuran:

$$
2 \times 2
$$

Luasnya:

$$
4
$$

Jadi:

$$
\det(A)=4
$$

Perhatikan:

ruang diperbesar 2 kali pada panjang, tapi luas diperbesar 4 kali.

Ini masuk akal karena:

$$
\text{luas} = \text{panjang} \times \text{lebar}
$$

---

# Contoh 2 — Scaling Tidak Seragam

Misalkan:

$$
A=
\begin{bmatrix}
3 & 0\\\\\\\\
0 & 2
\end{bmatrix}
$$

Artinya:

- arah x diperbesar 3 kali
- arah y diperbesar 2 kali

Kotak satuan berubah menjadi persegi panjang ukuran:

$$
3 \times 2
$$

Luasnya:

$$
6
$$

Jadi:

$$
\det(A)=6
$$

Dengan rumus:

$$
\det(A)=3\cdot2-0\cdot0=6
$$

---

# Contoh 3 — Kompresi

Misalkan:

$$
A=
\begin{bmatrix}
\frac{1}{2} & 0\\\\\\\\
0 & \frac{1}{3}
\end{bmatrix}
$$

Artinya:

- arah x menjadi setengah
- arah y menjadi sepertiga

Luas berubah menjadi:

$$
\frac{1}{2}\times\frac{1}{3}
= {}
\frac{1}{6}
$$

Jadi:

$$
\det(A)=\frac{1}{6}
$$

Semua area setelah transformasi menjadi seperenam area awal.

---

# Determinan Mengukur Semua Area

Determinannya tidak hanya berlaku untuk kotak satuan.

Kalau:

$$
\det(A)=6
$$

maka semua area dikali 6.

Misalnya:

- segitiga luas 2 menjadi luas 12
- lingkaran luas 10 menjadi luas 60
- bentuk aneh luas 7 menjadi luas 42

Selama transformasinya linear, faktor perubahan area sama di seluruh ruang.

Itu salah satu alasan determinan powerful.

---

# Contoh 4 — Shear

Ambil shear:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Dari Part 3:

- $\hat{i}$ tetap ke $(1,0)$
- $\hat{j}$ bergerak ke $(1,1)$

Kotak satuan berubah menjadi jajar genjang.

Apakah luasnya berubah?

Tidak.

Jajar genjang itu punya:

- alas 1
- tinggi 1

Luasnya:

$$
1
$$

Jadi:

$$
\det(A)=1
$$

Dengan rumus:

$$
\det(A)=1\cdot1-1\cdot0=1
$$

Shear mengubah bentuk, tapi tidak mengubah luas.

---

# Contoh 5 — Rotasi

Rotasi 90 derajat:

$$
R=
\begin{bmatrix}
0 & -1\\\\\\\\
1 & 0
\end{bmatrix}
$$

Rotasi tidak mengubah panjang.

Rotasi juga tidak mengubah luas.

Maka:

$$
\det(R)=1
$$

Cek rumus:

$$
\det(R)=0\cdot0-(-1)\cdot1=1
$$

Rotasi menjaga orientasi.

Nanti kita bedakan orientasi positif dan negatif.

---

# Contoh 6 — Refleksi

Refleksi terhadap sumbu x:

$$
A=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & -1
\end{bmatrix}
$$

Luas kotak satuan tetap:

$$
1
$$

Tapi orientasi terbalik.

Sebelumnya $\hat{i}$ lalu $\hat{j}$ membentuk orientasi standar.

Setelah refleksi:

- $\hat{i}$ tetap ke kanan
- $\hat{j}$ berubah ke bawah

Grid seperti dibalik.

Maka:

$$
\det(A)=-1
$$

Cek rumus:

$$
\det(A)=1\cdot(-1)-0\cdot0=-1
$$

Nilai mutlak determinan memberi faktor area:

$$
|\det(A)|=1
$$

Tandanya memberi tahu orientasi.

---

# Determinan Positif dan Negatif

Determinan punya dua informasi:

1. ukuran perubahan area
2. apakah orientasi terbalik

Secara ringkas:

| Nilai Determinan | Makna |
|---|---|
| $\det(A)>0$ | area berubah tanpa membalik orientasi |
| $\det(A)<0$ | area berubah dan orientasi terbalik |
| $\det(A)=0$ | area runtuh menjadi 0 |

---

# Apa Itu Orientasi?

Bayangkan dua basis vector standar:

$$
\hat{i}
$$

dan:

$$
\hat{j}
$$

Pada sistem koordinat biasa:

- $\hat{i}$ ke kanan
- $\hat{j}$ ke atas

Urutan dari $\hat{i}$ ke $\hat{j}$ adalah putaran berlawanan arah jarum jam.

Itu orientasi positif.

---

Setelah transformasi, jika urutan basis vector tetap mempertahankan orientasi tersebut, determinannya positif.

Kalau urutannya menjadi seperti cermin, determinannya negatif.

Refleksi adalah contoh paling mudah.

---

# Determinan Nol

Ini bagian paling penting.

Misalkan:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
4 & 2
\end{bmatrix}
$$

Hitung determinan:

$$
\det(A)=2\cdot2-1\cdot4=4-4=0
$$

Apa artinya?

Artinya area runtuh menjadi nol.

Secara geometris, transformasi ini meratakan bidang 2D menjadi garis 1D.

Kenapa?

Kolom pertama:

$$
\begin{bmatrix}
2\\\\\\\\
4
\end{bmatrix}
$$

Kolom kedua:

$$
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Keduanya searah.

Karena:

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

Jadi dua basis vector yang awalnya membentuk area sekarang jatuh ke garis yang sama.

Kotak satuan berubah menjadi garis.

Luasnya:

$$
0
$$

Maka determinannya:

$$
0
$$

---

# Determinan Nol Berarti Kehilangan Dimensi

Kalau:

$$
\det(A)=0
$$

maka transformasi menghancurkan area.

Dalam 2D, biasanya bidang berubah menjadi:

- garis
- atau titik

Artinya ada dimensi yang hilang.

Informasi hilang.

Dan kalau informasi hilang, transformasi tidak bisa dibalik.

---

# Hubungan dengan Invers

Sebuah transformasi bisa dibalik jika tidak menghancurkan ruang.

Kalau determinannya bukan nol:

$$
\det(A)\neq0
$$

maka transformasi tidak meruntuhkan area sepenuhnya.

Biasanya transformasi punya invers.

Kalau:

$$
\det(A)=0
$$

maka ruang runtuh.

Banyak titik berbeda bisa jatuh ke titik yang sama.

Akibatnya kita tidak bisa tahu input awalnya dari output.

Jadi tidak ada invers.

---

# Contoh Kehilangan Informasi

Misalkan transformasi:

$$
T(x,y)=(x,0)
$$

Matriksnya:

$$
A=
\begin{bmatrix}
1 & 0\\\\\\\\
0 & 0
\end{bmatrix}
$$

Transformasi ini mengambil semua titik dan menjatuhkannya ke sumbu x.

Contoh:

$$
(3,5)\rightarrow(3,0)
$$

$$
(3,10)\rightarrow(3,0)
$$

$$
(3,-2)\rightarrow(3,0)
$$

Banyak input berbeda punya output sama.

Informasi nilai $y$ hilang.

Determinannya:

$$
\det(A)=1\cdot0-0\cdot0=0
$$

Maka transformasi ini tidak bisa dibalik.

---

# Dari Mana Rumus $ad-bc$?

Sekarang kita hubungkan intuisi dengan rumus.

Ambil matriks:

$$
A=
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

Kolom pertama:

$$
\begin{bmatrix}
a\\\\\\
c
\end{bmatrix}
$$

Kolom kedua:

$$
\begin{bmatrix}
b\\\\\\
d
\end{bmatrix}
$$

Dua kolom ini adalah dua sisi jajar genjang hasil transformasi kotak satuan.

Determinan:

$$
ad-bc
$$

adalah luas bertanda dari jajar genjang yang dibentuk oleh dua vektor tersebut.

---

# Intuisi Luas Jajar Genjang

Kalau dua vektor adalah:

$$
u=
\begin{bmatrix}
a\\\\\\
c
\end{bmatrix}
$$

dan:

$$
v=
\begin{bmatrix}
b\\\\\\
d
\end{bmatrix}
$$

maka luas bertanda jajar genjangnya adalah:

$$
ad-bc
$$

Kenapa ada pengurangan?

Karena sebagian komponen membentuk area dengan orientasi positif, sebagian lain mengurangi area karena arah miringnya berlawanan.

Untuk saat ini, tidak perlu membuktikan formalnya dulu.

Pegang saja maknanya:

> $ad-bc$ menghitung luas bertanda dari jajar genjang yang dibentuk oleh kolom matriks.

---

# Determinan dan Perkalian Matriks

Ada sifat penting:

$$
\det(AB)=\det(A)\det(B)
$$

Secara geometris ini masuk akal.

Kalau $B$ mengubah area menjadi 3 kali lipat, lalu $A$ mengubah area menjadi 2 kali lipat, maka gabungannya mengubah area menjadi:

$$
3\times2=6
$$

Karena $AB$ berarti:

1. lakukan $B$
2. lalu lakukan $A$

Maka faktor area total adalah hasil perkalian faktor area masing-masing.

---

# Contoh

Misalkan:

$$
\det(B)=3
$$

dan:

$$
\det(A)=2
$$

Maka:

$$
\det(AB)=6
$$

Ini bukan kebetulan aljabar.

Ini konsekuensi dari area scaling.

---

# Determinan di 3D

Di 3D, determinan punya makna serupa.

Tapi bukan perubahan luas.

Melainkan perubahan volume.

Untuk matriks 3×3:

$$
\det(A)
$$

adalah faktor perubahan volume.

Contoh:

$$
A=
\begin{bmatrix}
2 & 0 & 0\\\\\\\\
0 & 3 & 0\\\\\\\\
0 & 0 & 4
\end{bmatrix}
$$

Transformasi ini memperbesar:

- arah x sebanyak 2 kali
- arah y sebanyak 3 kali
- arah z sebanyak 4 kali

Volume berubah sebanyak:

$$
2\times3\times4=24
$$

Jadi:

$$
\det(A)=24
$$

---

# Makna Determinan 3D

| Nilai Determinan | Makna |
|---|---|
| $\det(A)>0$ | volume berubah tanpa membalik orientasi |
| $\det(A)<0$ | volume berubah dan orientasi terbalik |
| $\det(A)=0$ | volume runtuh menjadi 0 |

Kalau determinan 3D nol, ruang 3D bisa runtuh menjadi:

- bidang 2D
- garis 1D
- titik 0D

---

# Hubungan ke Data Science dan ML

Dalam machine learning dan data science, determinan muncul di banyak tempat.

Contoh:

## 1. Covariance Matrix

Determinan covariance matrix bisa memberi gambaran volume sebaran data.

Kalau determinannya kecil, data mungkin sangat terkonsentrasi atau hampir berada pada subspace berdimensi lebih rendah.

## 2. Gaussian Distribution

Pada distribusi normal multivariat, determinan covariance matrix muncul dalam normalisasi densitas probabilitas.

Secara intuitif:

> semakin besar volume sebaran data, semakin kecil kepadatan puncaknya.

## 3. Feature Redundancy

Kalau fitur-fitur sangat bergantung satu sama lain, matriks tertentu bisa mendekati singular.

Artinya determinannya mendekati nol.

Itu tanda bahwa ada informasi yang redundant.

---

# Jebakan Umum

## Salah #1 — Menganggap Determinan Hanya Rumus

Rumus:

$$
ad-bc
$$

hanyalah cara menghitung.

Maknanya:

> faktor perubahan area.

---

## Salah #2 — Mengira Determinan Negatif Berarti Area Negatif

Area fisik tidak negatif.

Yang negatif adalah orientasi.

Faktor perubahan luasnya adalah:

$$
|\det(A)|
$$

---

## Salah #3 — Menganggap Determinan Nol Hanya Kasus Aljabar

Determinan nol berarti ruang runtuh.

Itu berarti informasi hilang.

Karena itu matriks tidak punya invers.

---

## Salah #4 — Lupa Bahwa Determinan Mengukur Area, Bukan Panjang

Scaling 2 kali pada panjang di 2D menghasilkan determinant 4, bukan 2.

Di 3D, scaling 2 kali pada semua arah menghasilkan determinant 8.

---

# Ringkasan

Determinan adalah faktor perubahan area akibat transformasi linear.

Untuk 2D:

$$
A=
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

maka:

$$
\det(A)=ad-bc
$$

Tapi makna utamanya:

> luas kotak satuan setelah transformasi.

Jika:

$$
\det(A)>0
$$

orientasi tetap.

Jika:

$$
\det(A)<0
$$

orientasi terbalik.

Jika:

$$
\det(A)=0
$$

ruang runtuh dan transformasi tidak bisa dibalik.

Di 3D, determinan mengukur faktor perubahan volume.

---

# Quiz Pemahaman

## Level 1

### Soal 1

Jika sebuah transformasi memiliki:

$$
\det(A)=5
$$

apa artinya terhadap luas sebuah bentuk?

---

### Soal 2

Jika:

$$
\det(A)=-2
$$

apa arti angka 2 dan tanda negatifnya?

---

### Soal 3

Hitung determinan:

$$
A=
\begin{bmatrix}
3 & 0\\\\\\\\
0 & 4
\end{bmatrix}
$$

---

## Level 2

### Soal 4

Hitung determinan:

$$
A=
\begin{bmatrix}
1 & 1\\\\\\\\
0 & 1
\end{bmatrix}
$$

Apa makna geometrisnya?

---

### Soal 5

Hitung determinan:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
4 & 2
\end{bmatrix}
$$

Apa yang terjadi pada ruang?

---

### Soal 6

Mengapa matriks dengan determinan nol tidak punya invers?

---

## Level 3

### Soal 7

Jika:

$$
\det(A)=3
$$

dan:

$$
\det(B)=-2
$$

maka berapa:

$$
\det(AB)
$$

Apa maknanya secara geometris?

---

### Soal 8

Sebuah transformasi 3D memperbesar arah x sebanyak 2 kali, arah y sebanyak 5 kali, dan arah z sebanyak $\frac{1}{2}$ kali.

Berapa determinannya?

---

### Soal 9

Jelaskan mengapa shear dapat mengubah bentuk kotak menjadi jajar genjang tetapi tetap memiliki determinan 1.

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

Semua luas dikalikan 5.

Bentuk dengan luas 10 menjadi luas 50.

</details>

<details>
<summary>Soal 2</summary>

Angka 2 berarti luas menjadi 2 kali lipat.

Tanda negatif berarti orientasi ruang terbalik.

</details>

<details>
<summary>Soal 3</summary>

$$
\det(A)=3\cdot4-0\cdot0=12
$$

</details>

<details>
<summary>Soal 4</summary>

$$
\det(A)=1\cdot1-1\cdot0=1
$$

Maknanya: shear mengubah bentuk, tetapi tidak mengubah luas.

</details>

<details>
<summary>Soal 5</summary>

$$
\det(A)=2\cdot2-1\cdot4=0
$$

Ruang 2D runtuh menjadi garis atau subspace berdimensi lebih rendah.

</details>

<details>
<summary>Soal 6</summary>

Karena determinan nol berarti ruang runtuh dan informasi hilang.

Banyak input berbeda bisa menghasilkan output yang sama, sehingga tidak mungkin menentukan input awal secara unik dari output.

</details>

<details>
<summary>Soal 7</summary>

$$
\det(AB)=\det(A)\det(B)=3(-2)=-6
$$

Maknanya: area menjadi 6 kali lipat dan orientasi terbalik.

</details>

<details>
<summary>Soal 8</summary>

$$
2\times5\times\frac{1}{2}=5
$$

Determinan = 5.

Volume menjadi 5 kali lipat.

</details>

<details>
<summary>Soal 9</summary>

Karena shear menjaga alas dan tinggi area dasar tetap sama.

Kotak berubah bentuk menjadi jajar genjang, tetapi luasnya tetap.

</details>

---

# Preview Part 6

Kita sudah tahu:

$$
\det(A)=0
$$

berarti ruang runtuh dan transformasi tidak bisa dibalik.

Sekarang kita akan membahas kebalikannya:

> Kalau sebuah transformasi bisa dibalik, bagaimana cara memahami invers matriks secara geometris?

Pada Part 6 kita akan masuk ke:

$$
A^{-1}
$$

Bukan sebagai rumus misterius, tapi sebagai:

> tombol undo untuk transformasi linear.

Dari sini konsep sistem persamaan linear juga akan mulai terasa jauh lebih masuk akal.

---

**Navigasi:**
← [Part 4: Perkalian Matriks sebagai Komposisi Transformasi](part-04.md) | [Part 6: Invers Matriks sebagai Tombol Undo](part-06.md) →
