---
title: "Essence of Linear Algebra (Indonesia) — Part 7: Span, Column Space, dan Null Space"
series: "Essence of Linear Algebra"
part: 7
author: "Adaptasi dan Rekonstruksi dari konsep 3Blue1Brown"
language: "id"
tags:
  - matematika
  - linear-algebra
  - span
  - column-space
  - null-space
  - linear-systems
difficulty: "menengah"
estimated_reading_time: "40-50 menit"
prerequisites:
  - memahami vektor
  - memahami kombinasi linear
  - memahami matriks sebagai transformasi linear
  - memahami determinan
  - memahami invers matriks
learning_objectives:
  - memahami span sebagai semua kombinasi linear yang mungkin
  - memahami column space sebagai semua output yang mungkin dari transformasi
  - memahami null space sebagai semua input yang jatuh ke nol
  - memahami hubungan column space dengan solusi sistem linear
  - memahami hubungan null space dengan kehilangan informasi
source_reference:
  - "3Blue1Brown — Essence of Linear Algebra playlist"
---

# Part 7 — Span, Column Space, dan Null Space

## Dari “Mencari Solusi” ke “Memahami Ruang”

Pada Part 6, kita melihat sistem linear dalam bentuk:

$$
A\vec{x}=\vec{b}
$$

Secara intuitif, ini berarti:

> Input $\vec{x}$ apa yang setelah ditransformasikan oleh $A$ menghasilkan output $\vec{b}$?

Kalau $A$ punya invers, masalahnya sederhana:

$$
\vec{x}=A^{-1}\vec{b}
$$

Tapi masalah menarik muncul ketika $A$ tidak punya invers.

Misalnya:

$$
\det(A)=0
$$

Artinya transformasi meruntuhkan ruang.

Di sinilah pertanyaan kita berubah.

Bukan lagi cuma:

> Apa solusinya?

Melainkan:

> Output apa saja yang mungkin dicapai?

Dan:

> Input apa saja yang dihancurkan menjadi nol?

Dua pertanyaan ini membawa kita ke:

- **span**
- **column space**
- **null space**

Ini mulai masuk linear algebra yang lebih serius.

Tapi kalau kita tetap pakai intuisi transformasi, konsepnya tidak perlu terasa mistis.

---

# Kombinasi Linear

Sebelum memahami span, kita harus paham kombinasi linear.

Misalkan ada dua vektor:

$$
\vec{v}
= {}
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

dan:

$$
\vec{w}
= {}
\begin{bmatrix}
1\\\\\\\\
3
\end{bmatrix}
$$

Kombinasi linear dari $\vec{v}$ dan $\vec{w}$ adalah bentuk:

$$
a\vec{v}+b\vec{w}
$$

dengan $a$ dan $b$ adalah skalar.

Contoh:

$$
2\vec{v}+3\vec{w}
$$

berarti:

$$
2
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
+
3
\begin{bmatrix}
1\\\\\\\\
3
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
4\\\\\\\\
2
\end{bmatrix}
+
\begin{bmatrix}
3\\\\\\\\
9
\end{bmatrix}
$$

$$
= {}
\begin{bmatrix}
7\\\\\\\\
11
\end{bmatrix}
$$

Jadi kombinasi linear adalah:

> men-scale beberapa vektor, lalu menjumlahkannya.

---

# Span

Sekarang bayangkan semua kemungkinan kombinasi linear dari beberapa vektor.

Itulah **span**.

Jika kita punya vektor:

$$
\vec{v}_1,\vec{v}_2,\dots,\vec{v}_n
$$

maka:

$$
\text{span}(\vec{v}_1,\vec{v}_2,\dots,\vec{v}_n)
$$

adalah himpunan semua vektor yang bisa dibuat dari:

$$
c_1\vec{v}_1+c_2\vec{v}_2+\cdots+c_n\vec{v}_n
$$

untuk semua pilihan skalar:

$$
c_1,c_2,\dots,c_n
$$

Versi manusia:

> Span adalah semua tempat yang bisa dicapai dengan menggabungkan vektor-vektor tersebut.

---

# Span dari Satu Vektor

Misalkan hanya ada satu vektor:

$$
\vec{v}
= {}
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

Span dari $\vec{v}$ adalah:

$$
\text{span}(\vec{v})
= {}
\{c\vec{v}\mid c\in\mathbb{R}\}
$$

Artinya semua kelipatan dari $\vec{v}$.

Secara geometris:

> sebuah garis yang melewati origin searah $\vec{v}$.

Contoh:

$$
0\vec{v}
= {}
\begin{bmatrix}
0\\\\\\\\
0
\end{bmatrix}
$$

$$
1\vec{v}
= {}
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

$$
2\vec{v}
= {}
\begin{bmatrix}
4\\\\\\\\
2
\end{bmatrix}
$$

$$
-1\vec{v}
= {}
\begin{bmatrix}
-2\\\\\\\\
-1
\end{bmatrix}
$$

Semua titik ini berada pada satu garis.

---

# Span dari Dua Vektor

Sekarang ambil dua vektor:

$$
\vec{v}
= {}
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
$$

dan:

$$
\vec{w}
= {}
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
$$

Span-nya:

$$
\text{span}(\vec{v},\vec{w})
$$

adalah semua kombinasi:

$$
a
\begin{bmatrix}
1\\\\\\\\
0
\end{bmatrix}
+
b
\begin{bmatrix}
0\\\\\\\\
1
\end{bmatrix}
= {}
\begin{bmatrix}
a\\\\\\
b
\end{bmatrix}
$$

Karena $a$ dan $b$ bisa angka real apa pun, kita bisa mencapai seluruh bidang 2D.

Jadi:

$$
\text{span}(\hat{i},\hat{j})=\mathbb{R}^2
$$

---

# Dua Vektor yang Tidak Searah

Misalkan:

$$
\vec{v}
= {}
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

dan:

$$
\vec{w}
= {}
\begin{bmatrix}
1\\\\\\\\
3
\end{bmatrix}
$$

Keduanya tidak searah.

Maka kombinasi linear dari keduanya dapat mencapai seluruh bidang 2D.

Mengapa?

Karena satu vektor memberi satu arah.

Vektor kedua memberi arah baru yang tidak bisa didapat hanya dari kelipatan vektor pertama.

Dengan dua arah independen, kita bisa menjangkau seluruh bidang.

---

# Dua Vektor yang Searah

Sekarang ambil:

$$
\vec{v}
= {}
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

dan:

$$
\vec{w}
= {}
\begin{bmatrix}
2\\\\\\\\
4
\end{bmatrix}
$$

Perhatikan:

$$
\vec{w}=2\vec{v}
$$

Artinya $\vec{w}$ tidak memberi arah baru.

Ia hanya versi lebih panjang dari $\vec{v}$.

Maka:

$$
\text{span}(\vec{v},\vec{w})
$$

tetap hanya garis.

Bukan seluruh bidang.

Ini penting.

Banyak vektor tidak otomatis berarti banyak arah.

Yang penting adalah:

> apakah vektor-vektor itu memberi arah baru yang independen?

---

# Span dan Sistem Linear

Sekarang kembali ke sistem:

$$
A\vec{x}=\vec{b}
$$

Misalkan:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 3
\end{bmatrix}
$$

dan:

$$
\vec{x}
= {}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
$$

Maka:

$$
A\vec{x}
= {}
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 3
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
$$

Ini bisa dibaca sebagai kombinasi kolom:

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
3
\end{bmatrix}
$$

Jadi pertanyaan:

$$
A\vec{x}=\vec{b}
$$

sama dengan:

> Bisakah $\vec{b}$ dibuat dari kombinasi linear kolom-kolom $A$?

Kalau bisa, sistem punya solusi.

Kalau tidak bisa, sistem tidak punya solusi.

---

# Column Space

Sekarang definisi formalnya muncul secara natural.

**Column space** dari matriks $A$ adalah:

> semua kombinasi linear dari kolom-kolom $A$.

Atau:

> semua output yang mungkin dihasilkan oleh transformasi $A$.

Jika:

$$
A=
\begin{bmatrix}
| & | & |\\\\\\\\
\vec{a}_1 & \vec{a}_2 & \vec{a}_3\\\\\\\\
| & | & |
\end{bmatrix}
$$

maka:

$$
\text{Col}(A)
= {}
\text{span}(\vec{a}_1,\vec{a}_2,\vec{a}_3)
$$

---

# Column Space sebagai Output Space

Kalau kita melihat $A$ sebagai transformasi:

$$
\vec{x}\mapsto A\vec{x}
$$

maka column space adalah:

> daerah output yang bisa dicapai.

Misalnya transformasi 2D yang tidak singular:

$$
\det(A)\neq0
$$

maka seluruh bidang 2D bisa dicapai.

Jadi:

$$
\text{Col}(A)=\mathbb{R}^2
$$

Tapi kalau:

$$
\det(A)=0
$$

maka ruang runtuh.

Output yang mungkin hanya berada pada garis atau titik.

Maka column space bukan seluruh $\mathbb{R}^2$.

---

# Contoh Column Space 1 — Seluruh Bidang

Ambil:

$$
A=
\begin{bmatrix}
2 & 1\\\\\\\\
1 & 3
\end{bmatrix}
$$

Kolom-kolomnya:

$$
\begin{bmatrix}
2\\\\\\\\
1
\end{bmatrix}
$$

dan:

$$
\begin{bmatrix}
1\\\\\\\\
3
\end{bmatrix}
$$

Keduanya tidak searah.

Maka span dari kedua kolom adalah seluruh bidang.

Jadi:

$$
\text{Col}(A)=\mathbb{R}^2
$$

Artinya untuk target $\vec{b}$ apa pun di 2D, selalu ada input $\vec{x}$ yang menghasilkan $\vec{b}$.

---

# Contoh Column Space 2 — Hanya Garis

Ambil:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

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
$$

Kolom kedua adalah dua kali kolom pertama:

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

Maka column space-nya hanya garis:

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

Artinya output yang mungkin hanya vektor-vektor pada garis tersebut.

---

# Apakah Sistem Punya Solusi?

Untuk:

$$
A\vec{x}=\vec{b}
$$

jawabannya bergantung pada:

$$
\vec{b}\in\text{Col}(A)
$$

Jika:

$$
\vec{b}\in\text{Col}(A)
$$

maka sistem punya solusi.

Jika:

$$
\vec{b}\notin\text{Col}(A)
$$

maka sistem tidak punya solusi.

Ini salah satu kalimat paling penting dalam linear algebra.

---

# Contoh

Ambil:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Column space-nya:

$$
\text{span}
\left(
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
\right)
$$

Sekarang target:

$$
\vec{b}_1=
\begin{bmatrix}
3\\\\\\\\
6
\end{bmatrix}
$$

Karena:

$$
\vec{b}_1=
3
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

maka:

$$
\vec{b}_1\in\text{Col}(A)
$$

Sistem punya solusi.

---

Sekarang target:

$$
\vec{b}_2=
\begin{bmatrix}
3\\\\\\\\
5
\end{bmatrix}
$$

Vektor ini tidak berada pada garis $y=2x$.

Maka:

$$
\vec{b}_2\notin\text{Col}(A)
$$

Sistem tidak punya solusi.

---

# Null Space

Sekarang pertanyaan kedua.

> Input apa saja yang setelah ditransformasikan oleh $A$ menjadi nol?

Itulah **null space**.

Secara formal:

$$
\text{Null}(A)
= {}
\{\vec{x}\mid A\vec{x}=\vec{0}\}
$$

Versi manusia:

> Null space adalah kumpulan input yang dihancurkan menjadi zero vector.

---

# Kenapa Null Space Penting?

Karena null space memberi tahu:

> arah mana yang hilang saat transformasi dilakukan.

Jika ada vektor non-zero $\vec{x}$ sehingga:

$$
A\vec{x}=\vec{0}
$$

berarti transformasi menghancurkan arah tersebut.

Artinya informasi hilang.

Artinya transformasi tidak invertible.

---

# Contoh Null Space 1 — Tidak Ada Arah yang Hilang

Ambil:

$$
A=
\begin{bmatrix}
2 & 0\\\\\\\\
0 & 3
\end{bmatrix}
$$

Transformasi ini:

- memperbesar arah x sebanyak 2 kali
- memperbesar arah y sebanyak 3 kali

Apakah ada vektor non-zero yang menjadi nol?

Tidak.

Satu-satunya input yang menghasilkan nol adalah:

$$
\vec{x}=
\begin{bmatrix}
0\\\\\\\\
0
\end{bmatrix}
$$

Maka:

$$
\text{Null}(A)=\{\vec{0}\}
$$

Ini disebut **trivial null space**.

---

# Contoh Null Space 2 — Ada Arah yang Hilang

Ambil:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Kita cari semua:

$$
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
$$

yang memenuhi:

$$
A
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

Artinya:

$$
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y
\end{bmatrix}
= {}
\begin{bmatrix}
x+2y\\\\\\
2x+4y
\end{bmatrix}
= {}
\begin{bmatrix}
0\\\\\\\\
0
\end{bmatrix}
$$

Kita butuh:

$$
x+2y=0
$$

Persamaan kedua hanya dua kali persamaan pertama, jadi tidak memberi informasi baru.

Dari:

$$
x=-2y
$$

Ambil:

$$
y=t
$$

maka:

$$
x=-2t
$$

Jadi:

$$
\vec{x}
= {}
\begin{bmatrix}
-2t\\\\\\
t
\end{bmatrix}
= {}
t
\begin{bmatrix}
-2\\\\\\\\
1
\end{bmatrix}
$$

Maka:

$$
\text{Null}(A)
= {}
\text{span}
\left(
\begin{bmatrix}
-2\\\\\\\\
1
\end{bmatrix}
\right)
$$

Secara geometris:

> seluruh garis searah $\begin{bmatrix}-2\\1\end{bmatrix}$ dihancurkan menjadi titik nol.

---

# Visualisasi Null Space

Bayangkan transformasi yang meruntuhkan seluruh bidang 2D menjadi satu garis.

Ada satu arah yang “diremukkan”.

Semua gerakan sepanjang arah itu tidak terlihat di output.

Misalnya dua titik berbeda inputnya, tetapi berbeda hanya pada arah null space.

Setelah transformasi, keduanya jatuh ke output yang sama.

Itulah kehilangan informasi.

---

# Null Space dan Solusi Tidak Unik

Null space juga menjelaskan kenapa solusi sistem linear bisa tidak unik.

Misalkan:

$$
A\vec{x}=\vec{b}
$$

dan kita menemukan satu solusi:

$$
\vec{x}_p
$$

Sekarang ambil sembarang vektor $\vec{n}$ di null space:

$$
A\vec{n}=\vec{0}
$$

Maka:

$$
A(\vec{x}_p+\vec{n})
= {}
A\vec{x}_p+A\vec{n}
$$

$$
= {}
\vec{b}+\vec{0}
$$

$$
= {}
\vec{b}
$$

Jadi:

$$
\vec{x}_p+\vec{n}
$$

juga solusi.

Artinya:

> begitu null space punya vektor non-zero, solusi bisa bergeser sepanjang null space tanpa mengubah output.

Ini powerful.

---

# Contoh Solusi Tidak Unik

Gunakan lagi:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Kita tahu:

$$
\text{Null}(A)
= {}
\text{span}
\left(
\begin{bmatrix}
-2\\\\\\\\
1
\end{bmatrix}
\right)
$$

Misalkan target:

$$
\vec{b}
= {}
\begin{bmatrix}
3\\\\\\\\
6
\end{bmatrix}
$$

Salah satu solusi adalah:

$$
\vec{x}_p=
\begin{bmatrix}
3\\\\\\\\
0
\end{bmatrix}
$$

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

Sekarang tambahkan vektor null space:

$$
t
\begin{bmatrix}
-2\\\\\\\\
1
\end{bmatrix}
$$

Maka semua solusi berbentuk:

$$
\vec{x}
= {}
\begin{bmatrix}
3\\\\\\\\
0
\end{bmatrix}
+
t
\begin{bmatrix}
-2\\\\\\\\
1
\end{bmatrix}
$$

untuk semua $t\in\mathbb{R}$.

Contoh:

Jika $t=1$:

$$
\vec{x}
= {}
\begin{bmatrix}
1\\\\\\\\
1
\end{bmatrix}
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
6
\end{bmatrix}
$$

Jika $t=2$:

$$
\vec{x}
= {}
\begin{bmatrix}
-1\\\\\\\\
2
\end{bmatrix}
$$

Cek:

$$
A
\begin{bmatrix}
-1\\\\\\\\
2
\end{bmatrix}
= {}
\begin{bmatrix}
3\\\\\\\\
6
\end{bmatrix}
$$

Banyak solusi.

Bukan kebetulan.

Itu karena null space tidak trivial.

---

# Column Space vs Null Space

Keduanya menjawab pertanyaan berbeda.

| Konsep | Pertanyaan | Makna |
|---|---|---|
| Column Space | Output apa saja yang mungkin? | ruang hasil transformasi |
| Null Space | Input apa saja yang menjadi nol? | arah yang dihancurkan |
| Span | Kombinasi linear apa saja yang bisa dibuat? | jangkauan dari sekumpulan vektor |

---

# Hubungan dengan Determinan

Untuk matriks persegi 2D:

Jika:

$$
\det(A)\neq0
$$

maka:

$$
\text{Col}(A)=\mathbb{R}^2
$$

dan:

$$
\text{Null}(A)=\{\vec{0}\}
$$

Artinya:

- semua output 2D bisa dicapai
- tidak ada arah non-zero yang dihancurkan
- transformasi bisa dibalik

---

Jika:

$$
\det(A)=0
$$

maka:

$$
\text{Col}(A)\neq\mathbb{R}^2
$$

dan null space punya arah non-zero.

Artinya:

- tidak semua output bisa dicapai
- ada arah yang hilang
- transformasi tidak bisa dibalik

---

# Tapi Hati-Hati: Matriks Tidak Selalu Persegi

Sejauh ini kita sering memakai matriks 2×2.

Tapi dalam aplikasi nyata, matriks bisa tidak persegi.

Contoh:

$$
A=
\begin{bmatrix}
1 & 2 & 3\\\\\\\\
4 & 5 & 6
\end{bmatrix}
$$

Ini matriks 2×3.

Ia menerima input 3D dan menghasilkan output 2D:

$$
A:\mathbb{R}^3\rightarrow\mathbb{R}^2
$$

Dalam kasus seperti ini, determinan tidak didefinisikan.

Tapi column space dan null space tetap bermakna.

Ini alasan konsep column space dan null space lebih umum daripada determinan.

---

# Matriks 2×3

Misalkan:

$$
A=
\begin{bmatrix}
1 & 0 & 2\\\\\\\\
0 & 1 & 3
\end{bmatrix}
$$

Inputnya:

$$
\vec{x}
= {}
\begin{bmatrix}
x\\\\\\
y\\\\\\
z
\end{bmatrix}
$$

Outputnya:

$$
A\vec{x}
= {}
\begin{bmatrix}
x+2z\\\\\\
y+3z
\end{bmatrix}
$$

Transformasi ini mengambil ruang 3D dan memetakannya ke ruang 2D.

Karena output hanya 2D, mustahil transformasi ini mempertahankan seluruh informasi 3D.

Pasti ada arah yang hilang.

Maka null space-nya pasti punya dimensi minimal 1.

---

# Cari Null Space Matriks 2×3

Kita cari:

$$
A\vec{x}=\vec{0}
$$

$$
\begin{bmatrix}
1 & 0 & 2\\\\\\\\
0 & 1 & 3
\end{bmatrix}
\begin{bmatrix}
x\\\\\\
y\\\\\\
z
\end{bmatrix}
= {}
\begin{bmatrix}
0\\\\\\\\
0
\end{bmatrix}
$$

Maka:

$$
x+2z=0
$$

$$
y+3z=0
$$

Ambil:

$$
z=t
$$

Maka:

$$
x=-2t
$$

$$
y=-3t
$$

Jadi:

$$
\vec{x}
= {}
\begin{bmatrix}
-2t\\\\\\
-3t\\\\\\
t
\end{bmatrix}
= {}
t
\begin{bmatrix}
-2\\\\\\\\
-3\\\\\\\\
1
\end{bmatrix}
$$

Maka:

$$
\text{Null}(A)
= {}
\text{span}
\left(
\begin{bmatrix}
-2\\\\\\\\
-3\\\\\\\\
1
\end{bmatrix}
\right)
$$

Artinya ada satu garis arah di ruang 3D yang dihancurkan menjadi nol di output 2D.

---

# Hubungan ke Data Science

Konsep ini penting banget untuk data science, machine learning, dan optimisasi.

## 1. Feature Redundancy

Misalkan dua fitur dataset sebenarnya membawa informasi yang sama.

Contoh:

$$
\text{price\_in\_usd}
$$

dan:

$$
\text{price\_in\_idr}
$$

Kalau kurs tetap, keduanya hampir satu fitur yang sama dalam skala berbeda.

Secara linear algebra, fitur-fitur itu hampir dependent.

Akibatnya matriks data bisa punya column space yang “lebih kecil” dari jumlah kolomnya.

Ini bisa bikin model tidak stabil.

---

## 2. Dimensionality Reduction

Ketika data berdimensi tinggi diproyeksikan ke dimensi rendah, sebagian informasi hilang.

Null space memberi bahasa untuk membahas:

> arah informasi mana yang dibuang?

Ini nyambung ke PCA, SVD, dan embedding.

Nanti kalau masuk machine learning, konsep ini balik lagi terus.

---

## 3. Solving Underdetermined Systems

Dalam banyak masalah, jumlah unknown lebih banyak daripada jumlah persamaan.

Contoh:

$$
A:\mathbb{R}^{1000}\rightarrow\mathbb{R}^{100}
$$

Ada 1000 variabel, tapi hanya 100 persamaan.

Biasanya solusi tidak unik.

Null space besar.

Artinya banyak input berbeda bisa menghasilkan output yang sama.

---

# Hubungan ke Programming

Dalam graphics, projection dari 3D ke 2D adalah contoh transformasi yang kehilangan informasi.

Ketika objek 3D diproyeksikan ke layar 2D:

- depth bisa hilang
- beberapa titik berbeda di 3D bisa jatuh ke pixel yang sama
- tidak selalu bisa tahu bentuk 3D asli dari gambar 2D

Itu secara ide sangat mirip dengan null space:

> ada arah informasi yang tidak terlihat di output.

---

# Jebakan Umum

## Salah #1 — Menganggap Span Itu Operasi Rumit

Span hanya berarti:

> semua kombinasi linear yang mungkin.

Kalau cuma satu vektor: biasanya garis.

Kalau dua vektor independen di 2D: seluruh bidang.

Kalau tiga vektor independen di 3D: seluruh ruang 3D.

---

## Salah #2 — Menganggap Column Space Itu Selalu Seluruh Ruang

Tidak.

Column space hanya seluruh ruang output kalau kolom-kolomnya cukup untuk menjangkau ruang tersebut.

Jika kolom-kolom dependent, column space lebih kecil.

---

## Salah #3 — Menganggap Null Space Selalu Cuma Nol

Tidak.

Null space cuma $\{\vec{0}\}$ kalau transformasi tidak menghancurkan arah non-zero.

Jika ada informasi hilang, null space punya vektor non-zero.

---

## Salah #4 — Mengira Solusi Tidak Unik Itu Random

Solusi tidak unik punya struktur.

Jika $\vec{x}_p$ adalah satu solusi dan $\vec{n}$ ada di null space, maka:

$$
\vec{x}_p+\vec{n}
$$

juga solusi.

Jadi semua solusi membentuk:

$$
\text{satu solusi khusus}+\text{null space}
$$

---

# Ringkasan

**Span** adalah semua kombinasi linear yang bisa dibuat dari sekumpulan vektor.

$$
\text{span}(\vec{v}_1,\dots,\vec{v}_n)
= {}
\{c_1\vec{v}_1+\cdots+c_n\vec{v}_n\}
$$

**Column space** adalah span dari kolom-kolom matriks.

$$
\text{Col}(A)=\text{span}(\text{kolom-kolom }A)
$$

Secara transformasi:

> column space adalah semua output yang mungkin dari $A$.

**Null space** adalah semua input yang dipetakan ke nol.

$$
\text{Null}(A)=\{\vec{x}\mid A\vec{x}=\vec{0}\}
$$

Secara transformasi:

> null space adalah arah yang dihancurkan oleh $A$.

Sistem:

$$
A\vec{x}=\vec{b}
$$

punya solusi jika dan hanya jika:

$$
\vec{b}\in\text{Col}(A)
$$

Jika null space punya vektor non-zero, solusi tidak akan unik.

---

# Quiz Pemahaman

## Level 1

### Soal 1

Apa itu span dari satu vektor non-zero di 2D?

---

### Soal 2

Apa itu column space dari sebuah matriks?

---

### Soal 3

Apa itu null space dari sebuah matriks?

---

## Level 2

### Soal 4

Diberikan dua vektor:

$$
\vec{v}
= {}
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

dan:

$$
\vec{w}
= {}
\begin{bmatrix}
2\\\\\\\\
4
\end{bmatrix}
$$

Apakah span keduanya berupa garis atau seluruh bidang?

Jelaskan.

---

### Soal 5

Diberikan:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Apa column space dari $A$?

---

### Soal 6

Untuk matriks yang sama:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

Apakah sistem:

$$
A\vec{x}
= {}
\begin{bmatrix}
5\\\\\\\\
10
\end{bmatrix}
$$

punya solusi?

---

### Soal 7

Apakah sistem:

$$
A\vec{x}
= {}
\begin{bmatrix}
5\\\\\\\\
9
\end{bmatrix}
$$

punya solusi?

---

## Level 3

### Soal 8

Cari null space dari:

$$
A=
\begin{bmatrix}
1 & 2\\\\\\\\
2 & 4
\end{bmatrix}
$$

---

### Soal 9

Misalkan:

$$
A\vec{x}=\vec{b}
$$

punya satu solusi $\vec{x}_p$, dan:

$$
\vec{n}\in\text{Null}(A)
$$

Tunjukkan mengapa:

$$
\vec{x}_p+\vec{n}
$$

juga solusi.

---

### Soal 10

Diberikan matriks:

$$
A=
\begin{bmatrix}
1 & 0 & 2\\\\\\\\
0 & 1 & 3
\end{bmatrix}
$$

Cari satu vektor non-zero yang berada di null space $A$.

---

# Jawaban Singkat

<details>
<summary>Soal 1</summary>

Span dari satu vektor non-zero di 2D adalah garis yang melewati origin dan searah dengan vektor tersebut.

</details>

<details>
<summary>Soal 2</summary>

Column space adalah semua kombinasi linear dari kolom-kolom matriks.

Secara transformasi, column space adalah semua output yang mungkin dihasilkan oleh matriks tersebut.

</details>

<details>
<summary>Soal 3</summary>

Null space adalah semua vektor input yang dipetakan menjadi zero vector:

$$
\text{Null}(A)=\{\vec{x}\mid A\vec{x}=\vec{0}\}
$$

</details>

<details>
<summary>Soal 4</summary>

Garis.

Karena:

$$
\vec{w}=2\vec{v}
$$

Jadi $\vec{w}$ tidak memberi arah baru.

</details>

<details>
<summary>Soal 5</summary>

Kolom pertama:

$$
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

Kolom kedua:

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
<summary>Soal 6</summary>

Punya solusi.

Karena:

$$
\begin{bmatrix}
5\\\\\\\\
10
\end{bmatrix}
= {}
5
\begin{bmatrix}
1\\\\\\\\
2
\end{bmatrix}
$$

jadi target berada di column space.

</details>

<details>
<summary>Soal 7</summary>

Tidak punya solusi.

Karena:

$$
\begin{bmatrix}
5\\\\\\\\
9
\end{bmatrix}
$$

tidak berada pada garis:

$$
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
<summary>Soal 8</summary>

Cari:

$$
A
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

Maka:

$$
x+2y=0
$$

Ambil $y=t$, maka $x=-2t$.

Jadi:

$$
\text{Null}(A)
= {}
\text{span}
\left(
\begin{bmatrix}
-2\\\\\\\\
1
\end{bmatrix}
\right)
$$

</details>

<details>
<summary>Soal 9</summary>

Karena:

$$
A(\vec{x}_p+\vec{n})
= {}
A\vec{x}_p+A\vec{n}
$$

$$
= {}
\vec{b}+\vec{0}
$$

$$
= {}
\vec{b}
$$

Maka $\vec{x}_p+\vec{n}$ juga solusi.

</details>

<details>
<summary>Soal 10</summary>

Kita butuh:

$$
x+2z=0
$$

$$
y+3z=0
$$

Ambil $z=1$, maka:

$$
x=-2,\quad y=-3
$$

Jadi salah satu vektor non-zero di null space adalah:

$$
\begin{bmatrix}
-2\\\\\\\\
-3\\\\\\\\
1
\end{bmatrix}
$$

</details>

---

# Preview Part 8

Sekarang kita sudah punya bahasa untuk membahas:

- output yang mungkin: column space
- input yang dihancurkan: null space
- kombinasi linear: span

Berikutnya kita perlu konsep yang mengukur “berapa banyak arah independen” yang benar-benar tersedia.

Itulah:

$$
\text{rank}
$$

Pada Part 8, kita akan membahas:

> Rank sebagai dimensi column space.

Dengan rank, kita bisa menjawab pertanyaan seperti:

- apakah kolom-kolom matriks redundant?
- apakah transformasi kehilangan dimensi?
- berapa jumlah informasi independen yang masih tersisa?
- kenapa sistem linear bisa punya satu, nol, atau tak hingga solusi?

Ini bagian penting sebelum masuk ke perubahan basis dan eigenvector.

---

**Navigasi:**
← [Part 6: Invers Matriks sebagai Tombol Undo](part-06.md) | [Part 8: Rank, Dimensi dari Output yang Mungkin](part-08.md) →
