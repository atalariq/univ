---
title: "Essence of Linear Algebra (Indonesia) — Part 2: Transformasi Linear, Fungsi yang Mengubah Seluruh Ruang"
series: "Essence of Linear Algebra"
part: 2
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - linear-transformation
  - geometry
  - machine-learning
difficulty: "pemula-menengah"
estimated_reading_time: "25-35 menit"
prerequisites:
  - memahami konsep vektor
  - memahami koordinat kartesius
learning_objectives:
  - memahami transformasi sebagai fungsi yang mengubah ruang
  - memahami gagasan grid transformation
  - memahami arti geometris linearitas
  - memahami dua syarat transformasi linear
  - mampu membedakan transformasi linear dan non-linear
---

# Part 2 — Transformasi Linear, Fungsi yang Mengubah Seluruh Ruang

## Dari Vektor ke Ruang

Pada Part 1, kita mempelajari bahwa:

> Vektor adalah arah dan panjang.

Tetapi Linear Algebra sebenarnya bukan tentang vektor.

Vektor hanyalah aktor utamanya.

Topik sesungguhnya adalah:

> Bagaimana vektor berubah.

Atau lebih tepatnya:

> Bagaimana seluruh ruang berubah.

Dan di sinilah konsep **transformasi** muncul.

---

# Bayangkan Kertas Grafik

Visualisasikan sebuah bidang koordinat.

Ada:

- sumbu x
- sumbu y
- garis grid vertikal
- garis grid horizontal

Seperti kertas matematika biasa.

Sekarang bayangkan Anda memiliki kekuatan untuk membengkokkan, memutar, meregangkan, atau meratakan seluruh bidang tersebut.

Bukan memindahkan satu titik.

Bukan memindahkan satu vektor.

Melainkan:

> mengubah seluruh ruang sekaligus.

Inilah cara berpikir yang benar tentang transformasi.

---

# Fungsi yang Biasanya Kita Kenal

Ketika belajar matematika sekolah, kita mengenal fungsi seperti:

$$
f(x)=x^2
$$

atau

$$
f(x)=\sin(x)
$$

Fungsi-fungsi tersebut menerima angka dan menghasilkan angka.

Input:

$$
x
$$

Output:

$$
f(x)
$$

---

Linear Algebra memperluas ide tersebut.

Sekarang inputnya bukan angka.

Melainkan vektor.

Misalnya:

$$
T
\left(
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
\right)
= {}
\begin{bmatrix}
2x\\\\\\
y
\end{bmatrix}
$$

Transformasi tersebut menerima sebuah vektor dan menghasilkan vektor baru.

---

# Transformasi Sebagai Mesin

Bayangkan sebuah mesin.

Input:

$$
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
$$

Masuk ke dalam mesin.

Keluar:

$$
\begin{bmatrix}
2x\\\\\\
y
\end{bmatrix}
$$

Apa yang terjadi?

Koordinat x menjadi dua kali lebih besar.

Koordinat y tetap.

---

Jika titik awal:

$$
(1,1)
$$

maka hasilnya:

$$
(2,1)
$$

---

Jika titik awal:

$$
(3,2)
$$

maka hasilnya:

$$
(6,2)
$$

---

Semua titik mengalami aturan yang sama.

---

# Yang Berubah Bukan Titiknya

Ini bagian penting.

Banyak pemula berpikir:

> Transformasi mengubah titik.

Tidak salah.

Tetapi kurang lengkap.

Cara berpikir yang lebih kuat:

> Transformasi mengubah ruang tempat titik-titik itu hidup.

Bayangkan seluruh bidang ditarik ke samping.

Semua objek di atasnya ikut berubah.

Grid berubah.

Lingkaran berubah.

Segitiga berubah.

Vektor berubah.

Semuanya berubah secara bersamaan.

---

# Contoh 1 — Scaling

Misalkan:

$$
T(x,y)=(2x,2y)
$$

Apa yang terjadi?

Setiap titik menjauh dua kali lipat dari pusat.

---

Contoh:

$$
(1,1)
\rightarrow
(2,2)
$$

$$
(3,5)
\rightarrow
(6,10)
$$

---

Secara visual:

Ruang mengembang.

Seolah-olah Anda memperbesar gambar.

---

# Contoh 2 — Kompresi

Misalkan:

$$
T(x,y)=
\left(
\frac{x}{2},
\frac{y}{2}
\right)
$$

Sekarang semua titik mendekat ke pusat.

Ruang menyusut.

---

# Contoh 3 — Rotasi

Bayangkan seluruh bidang diputar.

Misalnya:

90°

Titik:

$$
(1,0)
$$

berubah menjadi:

$$
(0,1)
$$

---

Titik:

$$
(0,1)
$$

berubah menjadi:

$$
(-1,0)
$$

---

Tidak ada yang diperbesar.

Tidak ada yang diperkecil.

Hanya diputar.

---

# Contoh 4 — Shear

Ini transformasi yang lebih aneh.

Misalnya:

$$
T(x,y)
= {}
(x+y,y)
$$

---

Jika:

$$
(1,1)
$$

maka:

$$
(2,1)
$$

---

Jika:

$$
(2,1)
$$

maka:

$$
(3,1)
$$

---

Grid persegi berubah menjadi jajaran genjang.

Ruang terlihat "miring".

Transformasi seperti ini disebut:

> Shear.

---

# Kapan Sebuah Transformasi Disebut Linear?

Nah.

Kita akhirnya sampai ke kata "linear".

Sayangnya banyak buku langsung memberikan definisi formal berikut:

$$
T(u+v)=T(u)+T(v)
$$

dan

$$
T(cu)=cT(u)
$$

Lalu berharap mahasiswa paham.

Biasanya tidak.

Mari kita pahami dulu secara geometris.

---

# Sifat Pertama: Garis Tetap Menjadi Garis

Bayangkan sebuah garis lurus pada bidang.

Transformasi linear boleh:

- memanjanginya
- memendekkannya
- memutarnya
- memiringkannya

Tetapi:

> tidak boleh membengkokkannya.

---

Garis harus tetap garis.

---

# Sifat Kedua: Titik Asal Tetap Diam

Titik:

$$
(0,0)
$$

harus tetap berada di:

$$
(0,0)
$$

---

Jika pusat ikut berpindah:

maka transformasi tersebut bukan linear.

---

# Mengapa?

Karena linear algebra sangat peduli pada hubungan relatif antar vektor.

Titik asal berfungsi sebagai jangkar.

Jika jangkar ikut bergerak, banyak struktur matematis menjadi rusak.

---

# Translasi Bukan Transformasi Linear

Misalnya:

$$
T(x,y)
= {}
(x+5,y)
$$

Apa yang terjadi?

Seluruh ruang bergeser 5 unit ke kanan.

---

Titik asal:

$$
(0,0)
$$

berubah menjadi:

$$
(5,0)
$$

---

Karena titik asal berpindah:

transformasi ini **bukan linear**.

---

Ini salah satu kejutan pertama dalam Linear Algebra.

Banyak orang mengira translasi itu linear.

Padahal tidak.

---

# Dua Aturan Formal

Sekarang kita siap memahami definisi formal.

---

## Aturan 1

Transformasi harus mempertahankan penjumlahan.

Jika:

$$
u+v
$$

ditransformasikan,

hasilnya harus sama dengan:

$$
T(u)+T(v)
$$

atau:

$$
T(u+v)=T(u)+T(v)
$$

---

Artinya:

transformasi boleh mengubah bentuk ruang.

Tetapi tidak boleh mengubah cara penjumlahan bekerja.

---

## Aturan 2

Transformasi harus mempertahankan perkalian skalar.

Jika:

$$
cu
$$

ditransformasikan,

maka:

$$
T(cu)=cT(u)
$$

---

Artinya:

transformasi tidak boleh merusak konsep skala.

---

# Intuisi yang Lebih Dalam

Misalkan:

$$
u=
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

dan

$$
v=
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

---

Jika kita mengetahui:

$$
T(u)
$$

dan

$$
T(v)
$$

maka kita bisa mengetahui transformasi untuk seluruh ruang.

Kenapa?

Karena setiap vektor dapat dibangun dari kombinasi keduanya.

---

Ini adalah salah satu ide paling penting dalam seluruh Linear Algebra.

Dan pada Part 3 nanti, ide ini akan melahirkan sesuatu yang disebut:

> Matriks.

---

# Contoh Linear

## Scaling

$$
T(x,y)
= {}
(2x,2y)
$$

Linear.

---

## Rotasi

Linear.

---

## Shear

Linear.

---

## Refleksi

Linear.

---

# Contoh Non-Linear

## Translasi

$$
T(x,y)
= {}
(x+3,y)
$$

Tidak linear.

---

## Kuadrat

$$
T(x,y)
= {}
(x^2,y)
$$

Tidak linear.

---

## Sinus

$$
T(x,y)
= {}
(\sin(x),y)
$$

Tidak linear.

---

# Kenapa Machine Learning Peduli?

Hampir semua model machine learning modern dibangun dari dua komponen:

1. Transformasi linear
2. Fungsi non-linear

---

Neural Network secara kasar dapat dibayangkan sebagai:

$$
\text{Linear}
\rightarrow
\text{Non-linear}
\rightarrow
\text{Linear}
\rightarrow
\text{Non-linear}
\rightarrow
...
$$

---

Artinya:

Bahkan model AI modern yang sangat kompleks pun berdiri di atas konsep yang sedang kita pelajari sekarang.

---

# Ringkasan

Transformasi adalah fungsi yang mengubah vektor menjadi vektor lain.

Cara berpikir terbaik:

> Transformasi mengubah seluruh ruang sekaligus.

Transformasi linear:

- menjaga garis tetap lurus
- menjaga titik asal tetap diam
- mempertahankan penjumlahan
- mempertahankan perkalian skalar

Contoh linear:

- scaling
- rotasi
- shear
- refleksi

Contoh non-linear:

- translasi
- kuadrat
- sinus

---

# Quiz Pemahaman

## Level 1

### Soal 1

Transformasi:

$$
T(x,y)
= {}
(3x,3y)
$$

linear atau tidak?

---

### Soal 2

Transformasi:

$$
T(x,y)
= {}
(x+2,y)
$$

linear atau tidak?

---

### Soal 3

Apa yang terjadi pada titik asal dalam transformasi linear?

---

## Level 2

### Soal 4

Mengapa translasi tidak dianggap linear meskipun semua titik bergeser dengan jumlah yang sama?

---

### Soal 5

Jika sebuah transformasi mengubah persegi menjadi jajaran genjang tanpa membengkokkan garis, apakah mungkin transformasi tersebut linear?

Jelaskan.

---

## Level 3

### Soal 6

Misalkan:

$$
T
\left(
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
\right)
= {}
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

dan

$$
T
\left(
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
\right)
= {}
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Menurut Anda, mengapa informasi ini hampir cukup untuk menentukan transformasi seluruh bidang?

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

Linear.

Hanya scaling seragam.

</details>

<details>
<summary>Soal 2</summary>

Tidak linear.

Titik asal berpindah ke (2,0).

</details>

<details>
<summary>Soal 3</summary>

Tetap berada di:

$$
(0,0)
$$

</details>

<details>
<summary>Soal 4</summary>

Karena:

$$
T(0)\neq0
$$

Titik asal berpindah.

</details>

<details>
<summary>Soal 5</summary>

Ya.

Itu adalah karakteristik transformasi shear yang merupakan transformasi linear.

</details>

---

# Preview Part 3

Sampai sekarang kita berbicara tentang transformasi secara visual.

Masalahnya:

> Bagaimana cara menyimpan transformasi ke dalam bentuk angka?

Apakah kita harus menyimpan hasil transformasi untuk setiap titik di bidang?

Tentu tidak.

Ada cara yang jauh lebih elegan.

Dan dari sinilah muncul salah satu objek matematika paling terkenal:

$$
\begin{bmatrix}
a & b\\\\\\
c & d
\end{bmatrix}
$$

Pada Part 3 kita akan melihat bahwa:

> Matriks bukan tabel angka.

> Matriks adalah cara menyimpan transformasi linear.

---

**Navigasi:**
← [Part 1: Vektor, Bukan Sekadar Panah](part-01.md) | [Part 3: Matriks sebagai Transformasi Linear](part-03.md) →
