// Cheatsheet AVM — UAS
// Portrait A4, 2-column, bolak-balik

#set page(
  paper: "a4",
  margin: (top: 5mm, bottom: 5mm, left: 5mm, right: 5mm),
  flipped: false,
  columns: 2,
)

#set text(
  font: ("Times New Roman"),
  size: 10pt,
  hyphenate: true,
)

#set par(
  justify: true,
  first-line-indent: 0pt,
  spacing: 0.8em,
  leading: 0.5em,
)

#show heading: it => {
  set text(size: 10pt, weight: "bold")
  // v(0.1em)
  it
  v(0.1em)
}

#set heading(numbering: "1.1.")

#show math.equation: math.display
#show math.equation: it => {
  set text(size: 10pt, font: "Latin Modern Math")
  it
}
// #show math.frac: math.display
// #show math.mat: math.display
// #show math.vec: math.display

#let boxed(body) = {
  block(
    stroke: 0.5pt + black,
    inset: 6pt,
    body,
  )
}

// = Fastcheck — Sebelum Mengerjakan
//
// == Vektor
// Dimensi? Norm? Dot product? Sudut? Tegak lurus?
//
// == Bidang
// - $a x + b y + c z + d = 0$, normal = $(a, b, c)$
// - Sejajar? Samakan koefisien dulu!
// - Jarak: $frac(|d_2 - d_1|, sqrt(a^2 + b^2 + c^2))$
//
// == Soal Cerita
// - Perpindahan total = JUMLAH vektor
// - Panjang lintasan = JUMLAH norm tiap segmen
// - Jarak awal-akhir = NORM resultan
// - Tegak lurus = dot product = 0
//
// == Transformasi Linear
// Basis → hitung T(tiap basis) → kolom matriks → Gaussian
//
// == Eigen
// $A - λ I$ → $det = 0$ → dapat $λ$ → null space $(A - λ I)$

= Vektor Euclidean

== Operasi Dasar

$vec(u) = (u_1, u_2, ..., u_n)$ \
$vec(v) = (v_1, v_2, ..., v_n)$

Penjumlahan: $vec(u) + vec(v) = (u_1+v_1, ..., u_n+v_n)$

Perkalian skalar: $c vec(u) = (c u_1, ..., c u_n)$

== Dot Product

$vec(u)·vec(v) = u_1 v_1 + u_2 v_2 + ... + u_n v_n$

#boxed[$vec(u) ⊥ vec(v) ⇔ vec(u)·vec(v) = 0$]

Dua vektor sejajar: $vec(u) = c vec(v)$ (salah satu kelipatan skalar yang lain).

== Sudut

#boxed[$cos θ = frac(vec(u)·vec(v), ||vec(u)|| · ||vec(v)||)$]

== Norm & Jarak

Norm (magnitudo): $||vec(u)|| = sqrt(u_1^2 + u_2^2 + ... + u_n^2)$

Jarak $P = (x_1,y_1,z_1)$ ke $Q = (x_2,y_2,z_2)$:

#boxed[$d(P,Q) = sqrt((x_2-x_1)^2 + (y_2-y_1)^2 + (z_2-z_1)^2)$]

Atau: $d(P,Q) = ||arrow(P Q)||$ dengan $arrow(P Q) = Q - P$

== Perpindahan Total

Bergerak $vec(v)_1$ lalu $vec(v)_2$:

Total: $vec(v)_"total" = vec(v)_1 + vec(v)_2$

NOTE: Panjang lintasan ≠ jarak lurus!
- Panjang lintasan: $L = ||vec(v)_1|| + ||vec(v)_2||$
- Jarak lurus: $d = ||vec(v)_1 + vec(v)_2||$

= Bidang di $RR^3$

Bentuk umum: $a x + b y + c z + d = 0$

Normal: $vec(n) = (a, b, c)$

== Jarak Titik ke Bidang

#boxed[$d(P, π) = frac(|a x_0 + b y_0 + c z_0 + d|, sqrt(a^2 + b^2 + c^2))$]

== Jarak Antar Dua Bidang Sejajar

Syarat: koefisien $a, b, c$ harus SAMA.

#boxed[$d(π_1, π_2) = frac(|d_2 - d_1|, sqrt(a^2 + b^2 + c^2))$]

== NOTE: Samakan Koefisien Dulu!

$2x + 4y + 6z + 8 = 0$ → bagi 2 → $x + 2y + 3z + 4 = 0$

$x + 2y + 3z + 5 = 0$ → baru hitung.

Kalau normal tidak sejajar → bidang berpotongan → jarak = 0.

= Proyeksi Vektor

Proyeksi $vec(u)$ ke arah $vec(v)$:

#boxed[$"proj"_(vec(v))(vec(u)) = frac(vec(u)·vec(v), vec(v)·vec(v)) vec(v)$]

Hasilnya berupa vektor. Panjang proyeksi (skalar):

$||"proj"_(vec(v))(vec(u))|| = frac(|vec(u)·vec(v)|, ||vec(v)||)$

= Ruang Vektor Umum

Syarat ruang vektor:
+ Tertutup terhadap penjumlahan
+ Tertutup terhadap perkalian skalar
+ Memenuhi 8 aksioma ruang vektor

Contoh: $RR^n$, $P_2 = {a + b x + c x^2}$, $M_(2×2)$.

Bukan ruang vektor: polinomial derajat *tepat* 2 — karena $x^2 + (-x^2) = 0$ (derajat 0, bukan 2).

// == Keyword Cepat
//
// #boxed[
//   *Span* — himpunan semua kombinasi linear dari sekumpulan vektor. Kalau span = seluruh ruang, vektor-vektor itu "merentang" ruang tersebut.
//
//   *Linearly independent* — tidak ada vektor yang bisa ditulis sebagai kombinasi linear vektor lainnya. Kalau $c_1 vec(v)_1 + ... + c_n vec(v)_n = 0$ hanya terpenuhi saat semua $c_i = 0$.
//
//   *Basis* — sekumpulan vektor yang (1) span seluruh ruang DAN (2) linearly independent. Basis standar $RR^2$: ${(1,0), (0,1)}$. Basis standar $P_2$: ${1, x, x^2}$.
//
//   *Null space / kernel* — himpunan semua vektor yang dipetakan ke nol: ${vec(v) : A vec(v) = 0}$.
//
//   *Determinan* — skalar yang menunjukkan faktor skala luas/volume hasil transformasi. $det = 0$ artinya ruang "dipipihkan" ke dimensi lebih rendah.
// ]
//
== Koordinat terhadap Basis

$p(x) = 3 + 2x + 5x^2$ terhadap basis ${1, x, x^2}$:

$[p]_(cal(B)) = mat(3; 2; 5)$

= Transformasi Linear

Syarat linearitas:
+ $T(u + v) = T(u) + T(v)$
+ $T(c u) = c T(u)$

== Matriks Transformasi Standar

Untuk transformasi geometri di $RR^2$ dan $RR^3$, matriks standar (terhadap basis standar):

#boxed[
  *Scaling (Dilatasi)*: $mat(k, 0; 0, k)$ seragam; $mat(k_x, 0; 0, k_y)$ tak seragam.

  *Refleksi*:
  - Thd sb. $x$: $mat(1, 0; 0, -1)$
  - Thd sb. $y$: $mat(-1, 0; 0, 1)$
  - Thd garis $y = x$: $mat(0, 1; 1, 0)$
  - Thd garis $y = -x$: $mat(0, -1; -1, 0)$
  - Thd titik asal: $mat(-1, 0; 0, -1)$

  *Rotasi* sebesar $θ$ berlawanan arah jarum jam:
  $mat(cos θ, -sin θ; sin θ, cos θ)$

  *Shear* (geser): Horizontal: $mat(1, k; 0, 1)$; Vertikal: $mat(1, 0; k, 1)$
]

// == Mencari Matriks Transformasi dari Definisi
//
// #boxed[Kolom matriks = hasil transformasi pada setiap basis domain.]
//
// $[T]_(cal(C) ← cal(B)) = mat(|,|,,|; [T(b_1)]_cal(C), [T(b_2)]_cal(C), ..., [T(b_n)]_cal(C); |,|,,|)$
//
// Langkah:
// 1. Tentukan basis domain & kodomain
// 2. Hitung $T$ untuk setiap basis domain
// 3. Nyatakan hasil dalam koordinat basis kodomain → kolom matriks
// 4. Untuk komposisi: $[T_2 ∘ T_1] = [T_2][T_1]$

= Eliminasi Gaussian

Operasi baris elementer (OBE):
+ $R_i ↔ R_j$ — tukar baris
+ $R_i ← c R_i$ — kali skalar, $c ≠ 0$
+ $R_i ← R_i + c R_j$ — tambah kelipatan baris lain

Target: bentuk eselon baris (REF) atau eselon baris tereduksi (RREF).

Selesaikan $A vec(x) = vec(b)$ melalui augmented matrix $[A | vec(b)]$.

= Eigenvalue & Eigenvector

Untuk matriks persegi $A$:

#boxed[$A vec(v) = λ vec(v)$,   $vec(v) ≠ 0$]

- $λ$ = eigenvalue (nilai eigen)
- $vec(v)$ = eigenvector (vektor eigen), harus non-nol
- Makna geometris: $vec(v)$ adalah vektor yang arahnya TIDAK berubah setelah transformasi $A$ (hanya diskala sebesar $λ$)

== Langkah

1. Cari $λ$: $det(A - λ I) = 0$ (characteristic equation / persamaan karakteristik)
2. Untuk tiap $λ$, solve $(A - λ I) vec(v) = 0$ (eliminasi Gaussian)
3. Solusi non-nol dari sistem itu = eigenvector untuk $λ$ tersebut
4. Eigenvector = null space dari $(A - λ I)$, dikurangi ${0}$

== Matriks 2×2

$A = mat(a, b; c, d)$

$A - λ I = mat(a - λ, b; c, d - λ)$

#boxed[$det = (a - λ)(d - λ) - b c = 0$]

Faktorkan → dapat $λ_1, λ_2$. Untuk tiap $λ$, substitusi balik ke $(A - λ I) vec(v) = 0$.

== Diagonalisasi (Jika Ada n Eigenvector Independen)

$A = P D P^(-1)$

di mana $P$ = matriks yang kolomnya eigenvector, $D$ = matriks diagonal dengan eigenvalue di diagonalnya.

= Contoh Soal

== Jarak Antar Bidang

$π_1: 2x - y + 2z - 5 = 0$
$π_2: 4x - 2y + 4z + 6 = 0$

Samakan normal: $π_2$ bagi 2 → $2x - y + 2z + 3 = 0$

$vec(n) = (2, -1, 2)$, $d_1 = -5$, $d_2 = 3$

$d(π_1, π_2) = frac(|3 - (-5)|, sqrt(4+1+4)) = 8/3$ ✓

== Vektor, Norm, Sudut

$vec(u) = (3, -2, 6)$, $vec(v) = (1, 4, -2)$

$vec(u)+vec(v) = (4, 2, 4)$

$||vec(u)|| = sqrt(9+4+36) = sqrt(49) = 7$

$||vec(v)|| = sqrt(1+16+4) = sqrt(21)$

Dot product: $3·1 + (-2)·4 + 6·(-2) = 3-8-12 = -17$

$-17 ≠ 0$ → tidak tegak lurus.

$cos θ = -17 / (7 sqrt(21))$

== Soal Cerita Drone

$vec(v)_1 = (40, 30, 20)$, $vec(v)_2 = (20, -10, 15)$

Total perpindahan: $vec(v)_"total" = (60, 20, 35)$

Panjang lintasan $L = sqrt(2900) + sqrt(725)$ \
$= 10 sqrt(29) + 5 sqrt(29) = 15 sqrt(29)$

Jarak lurus $d = sqrt(3600+400+1225)$ \
$= sqrt(5225) = 5 sqrt(209)$

Dot product: $800-300+300 = 800 ≠ 0$ → tidak tegak lurus.

$cos θ = 800 / (10 sqrt(29) · 5 sqrt(29)) = 800 / 1450 = 16/29$

== Transformasi Linear pada $P_2$

$T(p(x)) = p'(x) + p(0)$ dengan basis ${1, x, x^2}$

- $T(1) = 0+1 = 1$ → $mat(1; 0; 0)$
- $T(x) = 1+0 = 1$ → $mat(1; 0; 0)$
- $T(x^2) = 2x+0 = 2x$ → $mat(0; 2; 0)$

$[T]_cal(B) = mat(1, 1, 0; 0, 0, 2; 0, 0, 0)$

Mencari $T(2+3x+x^2)$:

$mat(1,1,0; 0,0,2; 0,0,0) mat(2; 3; 1) = mat(5; 2; 0)$ → $5+2x$ ✓

Mencari $p$ agar $T(p) = 5+4x$:

Augmented: $mat(1,1,0,|,5; 0,0,2,|,4; 0,0,0,|,0)$

Baris 2: $2c = 4$ → $c = 2$

Baris 1: $a + b = 5$ → $a = 5-t$, $b = t$

#boxed[$p(x) = (5-t) + t x + 2x^2$, $t ∈ RR$]

== Eigen 2×2

$A = mat(4, 1; 2, 3)$

$det(A-λ I) = (4-λ)(3-λ)-2 = λ^2 - 7λ + 10 = 0$

$(λ-5)(λ-2)=0$ → $λ_1 = 5$, $λ_2 = 2$

*Untuk $λ = 5$:*

$A - 5I = mat(-1, 1; 2, -2)$

Sistem: $-x + y = 0$ → $y = x$

Ambil $x = 1$ → $vec(v)_1 = mat(1; 1)$

*Untuk $λ = 2$:*

$A - 2I = mat(2, 1; 2, 1)$

Sistem: $2x + y = 0$ → $y = -2x$

Ambil $x = 1$ → $vec(v)_2 = mat(1; -2)$

$vec(v)_1$ dan $vec(v)_2$ independen (tidak sejajar).

$P = mat(1, 1; 1, -2)$, $D = mat(5, 0; 0, 2)$

Verifikasi: $A vec(v)_1 = mat(4,1; 2,3) mat(1; 1) = mat(5; 5) = 5 mat(1; 1) = λ_1 vec(v)_1$ ✓

= Kesalahan Umum

== Perkalian Matriks Tidak Komutatif
$A B ≠ B A$ pada umumnya. Urutan penting: $A B$ artinya lakukan $B$ dulu, baru $A$.

== Panjang Lintasan vs Jarak
$||vec(v)_1|| + ||vec(v)_2||$ (lintasan) ≠ $||vec(v_1) + vec(v_2)||$ (jarak lurus dari start ke finish).

== Koefisien Bidang
$2x + 4y + 6z + 8 = 0$ dan $x + 2y + 3z + 5 = 0$: bagi dulu bidang pertama dengan 2, baru hitung jarak.

== Matriks sebagai Transformasi
Kolom matriks = kemana basis vector dipetakan. Membaca matriks secara geometris lebih penting dari menghafal baris × kolom.

== Eigen
Null space selalu mengandung vektor nol, tapi eigenvector harus non-nol ($vec(v) ≠ 0$).

== Gaussian
Hati-hati dengan operasi baris — pastikan operasi diterapkan ke SELURUH baris termasuk augmented part.
