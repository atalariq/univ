---
title: "Essence of Linear Algebra (Indonesia) — Part 1: Vektor, Bukan Sekadar Panah"
series: "Essence of Linear Algebra"
part: 1
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - vector
  - machine-learning
  - data-science
difficulty: "pemula"
estimated_reading_time: "20-30 menit"
prerequisites:
  - koordinat kartesius dasar
  - operasi aritmetika dasar
learning_objectives:
  - memahami apa itu vektor secara intuitif
  - membedakan vektor dan titik
  - memahami penjumlahan vektor
  - memahami perkalian skalar
  - memahami representasi koordinat sebagai bahasa untuk mendeskripsikan vektor
---

# Part 1 — Vektor, Bukan Sekadar Panah

## Kenapa Kita Harus Peduli?

Ketika orang pertama kali belajar Linear Algebra, biasanya mereka melihat sesuatu seperti ini:

$$
\begin{bmatrix}
3\\\\2
\end{bmatrix}
$$

Kemudian dosen berkata:

> "Ini adalah vektor."

Sebagian besar mahasiswa langsung menghafal tanpa benar-benar memahami apa yang sedang direpresentasikan.

Akibatnya, Linear Algebra terasa seperti kumpulan operasi aneh pada tabel angka.

Padahal kenyataannya:

> Linear Algebra adalah bahasa untuk mendeskripsikan ruang, arah, gerakan, dan transformasi.

Dan semuanya dimulai dari satu konsep sederhana:

**vektor.**

---

# Bayangkan Anda Sedang Bermain Game

Misalkan karakter Anda berada di koordinat:

$$
(0,0)
$$

Kemudian Anda bergerak:

- 3 langkah ke kanan
- 2 langkah ke atas

Gerakan tersebut dapat ditulis sebagai:

$$
\begin{bmatrix}
3\\\\2
\end{bmatrix}
$$

Perhatikan sesuatu yang menarik.

Vektor tersebut tidak mengatakan:

> "Anda berada di titik (3,2)"

melainkan:

> "Bergeraklah 3 ke kanan dan 2 ke atas."

Ini adalah perbedaan yang sangat penting.

---

# Titik vs Vektor

Banyak pemula mencampuradukkan keduanya.

## Titik

Titik menjawab pertanyaan:

> "Di mana?"

Contoh:

$$
(5,3)
$$

artinya:

> Lokasi berada di x=5 dan y=3.

---

## Vektor

Vektor menjawab pertanyaan:

> "Ke arah mana dan sejauh apa?"

Contoh:

$$
\begin{bmatrix}
5\\\\3
\end{bmatrix}
$$

artinya:

> Bergerak 5 satuan ke kanan dan 3 satuan ke atas.

---

Secara numerik keduanya tampak sama.

Tetapi maknanya berbeda.

| Objek | Makna |
|---------|---------|
| (5,3) | posisi |
| (5,3) | perpindahan |
| (5,3) | kecepatan |
| (5,3) | gaya |
| (5,3) | arah angin |

Angkanya sama.

Interpretasinya berbeda.

---

# Vektor Sebagai Panah

Cara paling umum memvisualisasikan vektor adalah sebagai panah.

Misalnya:

$$
\begin{bmatrix}
3\\\\2
\end{bmatrix}
$$

digambar sebagai panah dari:

$$
(0,0)
$$

menuju:

$$
(3,2)
$$

Panah tersebut memiliki dua karakteristik penting:

1. arah
2. panjang

Itulah yang benar-benar mendefinisikan sebuah vektor.

---

# Posisi Panah Tidak Penting

Perhatikan dua panah berikut.

Panah pertama:

- mulai di (0,0)
- berakhir di (3,2)

Panah kedua:

- mulai di (10,5)
- berakhir di (13,7)

Keduanya memiliki perpindahan:

$$
\begin{bmatrix}
3\\\\2
\end{bmatrix}
$$

Secara matematis:

> Kedua panah tersebut merepresentasikan vektor yang sama.

Karena yang penting bukan lokasi panahnya.

Yang penting adalah:

- arah
- panjang

---

# Panjang Vektor

Panjang vektor sering disebut:

- magnitude
- norm
- panjang

Misalkan:

$$
\vec v= \begin{bmatrix}
3\\\\4
\end{bmatrix}
$$

Panjangnya:

$$
||\vec v|| = \sqrt{3^2+4^2}
$$

$ = 5 $

Ini hanyalah Teorema Pythagoras.

---

## Contoh

Vektor:

$\begin{bmatrix} 6\\8 \end{bmatrix} $

memiliki panjang:

$$
\sqrt{6^2+8^2} = 10
$$

---

# Arah Vektor

Jika panjang memberi tahu "seberapa jauh",

maka arah memberi tahu:

> "ke mana."

Contoh:

$$
\begin{bmatrix}
5\\\\0
\end{bmatrix}
$$

berarti:

100% ke kanan.

---

Sedangkan:

$$
\begin{bmatrix}
0\\\\5
\end{bmatrix}
$$

berarti:

100% ke atas.

---

Sedangkan:

$$
\begin{bmatrix}
5\\\\5
\end{bmatrix}
$$

berarti:

diagonal kanan atas.

---

# Penjumlahan Vektor

Sekarang bayangkan Anda melakukan dua gerakan berurutan.

Gerakan pertama:

$$
\begin{bmatrix}
2\\\\1
\end{bmatrix}
$$

Gerakan kedua:

$$
\begin{bmatrix}
3\\\\2
\end{bmatrix}
$$

Total gerakan:

$$
\begin{bmatrix}
2\\\\1
\end{bmatrix}
+
\begin{bmatrix}
3\\\\2
\end{bmatrix}
= \begin{bmatrix}
5\\\\3
\end{bmatrix}
$$

---

## Intuisi Geometris

Bayangkan Anda:

1. jalan 2 ke kanan dan 1 ke atas
2. dari posisi baru, jalan lagi 3 ke kanan dan 2 ke atas

Hasil akhirnya sama dengan:

5 ke kanan dan 3 ke atas sekaligus.

---

Secara umum:

$$
\begin{bmatrix}
a\\b
\end{bmatrix}
+
\begin{bmatrix}
c\\d
\end{bmatrix}
= \begin{bmatrix}
a+c\\b+d
\end{bmatrix}
$$

---

# Perkalian Skalar

Kata "scalar" hanya berarti angka biasa.

Misalkan:

$$
\vec v=
\begin{bmatrix}
3\\\\2
\end{bmatrix}
$$

Jika dikalikan 2:

$$
2\vec v
= \begin{bmatrix}
6\\\\4
\end{bmatrix}
$$

Interpretasinya:

- arah tetap
- panjang menjadi dua kali lipat

---

Jika dikalikan:

$$
0.5
$$

maka:

$$
0.5
\begin{bmatrix}
3\\\\2
\end{bmatrix}
= \begin{bmatrix}
1.5\\\\1
\end{bmatrix}
$$

Panjangnya menjadi setengah.

---

# Vektor Negatif

Bagaimana dengan:

$$
-1
\begin{bmatrix}
3\\\\2
\end{bmatrix}
= \begin{bmatrix}
-3\\\\-2
\end{bmatrix}
$$

Yang berubah adalah:

- panjang tetap
- arah berbalik 180°

---

Bayangkan mobil yang sebelumnya maju.

Sekarang mobil tersebut bergerak mundur dengan jarak yang sama.

---

# Mengapa Koordinat Hanyalah Representasi

Ini salah satu ide paling penting dalam seluruh Linear Algebra.

Ketika kita menulis:

$$
\begin{bmatrix}
3\\\\2
\end{bmatrix}
$$

banyak orang berpikir:

> "Itulah vektornya."

Padahal sebenarnya:

> Itu hanya cara kita mendeskripsikan vektor.

Sama seperti kata:

> "kucing"

bukanlah kucing itu sendiri.

Kata tersebut hanya representasi.

---

Vektor adalah objek geometris.

Koordinat adalah bahasa untuk mendeskripsikannya.

---

# Koneksi ke Dunia Nyata

## Game Development

Posisi pemain:

$$
(x,y)
$$

Kecepatan pemain:

$$
(v_x,v_y)
$$

Arah peluru:

$$
(d_x,d_y)
$$

Semuanya vektor.

---

## Physics

Gaya:

$$
\vec F
$$

Kecepatan:

$$
\vec v
$$

Percepatan:

$$
\vec a
$$

Semuanya vektor.

---

## Machine Learning

Satu gambar bisa direpresentasikan sebagai vektor.

Contoh:

gambar grayscale 28×28 pixel.

Jumlah piksel:

$ 28\times28 = 784 $

Artinya satu gambar dapat dianggap sebagai:

$$
\begin{bmatrix}
x_1\\\\\\\\
x_2\\\\\\\\
x_3\\\\\\\\
\vdots\\\\\\
x_{784}
\end{bmatrix}
$$

Satu gambar ternyata hanyalah vektor berdimensi tinggi.

---

# Kesalahan Umum

## Salah #1

Menganggap titik dan vektor selalu sama.

Padahal:

- titik = lokasi
- vektor = perpindahan/arah

---

## Salah #2

Menganggap vektor adalah angka.

Padahal:

angka hanyalah representasi koordinat.

---

## Salah #3

Menghafal operasi tanpa visualisasi.

Jika Anda tidak bisa membayangkan:

- bergerak
- memanjang
- memendek
- berbalik arah

maka Anda belum benar-benar memahami vektor.

---

# Ringkasan

Vektor adalah objek yang memiliki:

- arah
- panjang

Vektor dapat:

- dijumlahkan
- dikalikan skalar

Koordinat hanyalah cara mendeskripsikan vektor.

Ide ini akan menjadi fondasi untuk seluruh seri berikutnya.

Pada part berikutnya kita akan membahas sesuatu yang jauh lebih penting:

> Bagaimana sebuah ruang dapat "diubah bentuknya".

Inilah awal dari konsep **Linear Transformation**, inti sebenarnya dari Linear Algebra.

---

# Quiz Pemahaman

## Level 1

### Soal 1

Dari titik:

$$
(2,3)
$$

ke titik:

$$
(8,7)
$$

berapakah vektor perpindahannya?

---

### Soal 2

Hitung:

$$
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
+
\begin{bmatrix}
3\\\\\\\\
4
\end{bmatrix}
$$

---

### Soal 3

Hitung:

$$
3
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

---

## Level 2

### Soal 4

Apakah kedua panah berikut merepresentasikan vektor yang sama?

Panah A:

- dari (0,0)
- ke (5,2)

Panah B:

- dari (10,7)
- ke (15,9)

Jelaskan.

---

### Soal 5

Mengapa

$$
\begin{bmatrix}
3\\\\\\\\
2
\end{bmatrix}
$$

lebih tepat dianggap sebagai "instruksi gerakan" daripada "lokasi"?

---

## Level 3

### Soal 6

Dalam game:

- posisi pemain = titik
- kecepatan pemain = vektor

Mengapa keduanya tidak boleh dianggap identik?

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

$$
\begin{bmatrix}
8-2\\\\\\\\
7-3
\end{bmatrix}
= \begin{bmatrix}
6\\\\\\\\
4
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 2</summary>

$$
\begin{bmatrix}
4\\\\\\\\
6
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 3</summary>

$$
\begin{bmatrix}
6\\\\\\\\
3
\end{bmatrix}
$$

</details>

<details>
<summary>Soal 4</summary>

Ya.

Keduanya memiliki perpindahan:

$$
\begin{bmatrix}
5\\\\\\\\
2
\end{bmatrix}
$$

</details>

---

**Navigasi:**
[Part 2: Transformasi Linear, Fungsi yang Mengubah Seluruh Ruang](part-02.md) →
