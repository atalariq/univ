#set page(paper: "a4", margin: (x: 2cm, y: 2cm))
#set text(font: "Times New Roman", size: 11pt)

#set enum(numbering: "a)")
#set table(align: center + horizon)
#show table.cell.where(y: 0): set text(weight: "bold")

#align(center, text(size: 13pt, weight: "bold")[
  JAWABAN SOAL LATIHAN \
  ANALISIS ALGORITMA DAN STRUKTUR DATA
])

#v(0.3cm)

= Bagian 1: Dynamic Programming (Held-Karp Algorithm)

== Soal 1: Distribusi Barang Antar Gudang

*Formulasi Held-Karp:*

State DP: $C(S, i)$ = biaya minimum mengunjungi semua kota dalam himpunan $S$ (dimulai dari A), berakhir di $i$.

Relasi rekurens:
$ C(S, i) = min_({j in S backslash {i}}) {C(S backslash {i}, j) + d(j, i)} $

Basis: $C({A}, A) = 0$

Solusi: $min_({i != A}) {C(V, i) + d(i, A)}$ dengan $V$ = himpunan semua kota.

*Tabel State DP (format compact):*

_Jumlah state: 33 (maksimum teoritis $(n-1)·2^{n-2} = 32$, +1 base case)_

*Ukuran* $|S| = 1$:

  - C({A}, A) = 0

*Ukuran* $|S| = 2$:

  - C({A, E}, E) = 20
  - C({A, D}, D) = 25
  - C({A, C}, C) = 18
  - C({A, B}, B) = 12

*Ukuran* $|S| = 3$:

  - C({A, B, E}, B) = 48; C({A, B, E}, E) = 40
  - C({A, C, E}, C) = 42; C({A, C, E}, E) = 40
  - C({A, B, D}, B) = 42; C({A, B, D}, D) = 29
  - C({A, D, E}, D) = 35; C({A, D, E}, E) = 40
  - C({A, C, D}, C) = 41; C({A, C, D}, D) = 34
  - C({A, B, C}, B) = 32; C({A, B, C}, C) = 26

*Ukuran* $|S| = 4$:

  - C({A, B, C, E}, B) = 56; C({A, B, C, E}, C) = 62; C({A, B, C, E}, E) = 48
  - C({A, B, D, E}, B) = 52; C({A, B, D, E}, D) = 55; C({A, B, D, E}, E) = 44
  - C({A, C, D, E}, C) = 51; C({A, C, D, E}, D) = 55; C({A, C, D, E}, E) = 49
  - C({A, B, C, D}, B) = 51; C({A, B, C, D}, C) = 45; C({A, B, C, D}, D) = 42

*Ukuran* $|S| = 5$:

  - C({A, B, C, D, E}, B) = 65; C({A, B, C, D, E}, C) = 66; C({A, B, C, D, E}, D) = 63; C({A, B, C, D, E}, E) = 57

*Penutupan Tur (kembali ke A):*

#table(columns: 4, [Akhir di], [$C(V, i)$], [$d(i, A)$], [Total],
  [B], [65], [12], [77],
  [C], [66], [18], [84],
  [D], [63], [25], [88],
  [E], [57], [20], [77],
)

*Biaya minimum:* 77 km

*Rute optimal:* A $arrow.r$ E $arrow.r$ D $arrow.r$ C $arrow.r$ B $arrow.r$ A

*Rincian rute:*

#table(columns: 3, [Dari], [Ke], [Km],
  [A], [E], [20],
  [E], [D], [15],
  [D], [C], [16],
  [C], [B], [14],
  [B], [A], [12],
  [*Total*], [], [*77*],
)

*Kompleksitas:* $O(n^2 · 2^n)$ — jumlah state yang dihitung = 33.

#pagebreak()

== Soal 2: Pengiriman Paket Antar Kota

*Formulasi Held-Karp:*

State DP: $C(S, i)$ = biaya minimum mengunjungi semua kota dalam himpunan $S$ (dimulai dari P), berakhir di $i$.

Relasi rekurens:
$ C(S, i) = min_({j in S backslash {i}}) {C(S backslash {i}, j) + d(j, i)} $

Basis: $C({P}, P) = 0$

Solusi: $min_({i != P}) {C(V, i) + d(i, P)}$ dengan $V$ = himpunan semua kota.

*Tabel State DP (format compact):*

_Jumlah state: 81 (maksimum teoritis $(n-1)·2^{n-2} = 80$, +1 base case)_

*Ukuran* $|S| = 1$:

  - C({P}, P) = 0

*Ukuran* $|S| = 2$:

  - C({P, U}, U) = 10
  - C({P, T}, T) = 20
  - C({P, S}, S) = 15
  - C({P, R}, R) = 12
  - C({P, Q}, Q) = 8

*Ukuran* $|S| = 3$:

  - C({P, Q, U}, Q) = 27; C({P, Q, U}, U) = 25
  - C({P, R, U}, R) = 26; C({P, R, U}, U) = 28
  - C({P, Q, T}, Q) = 31; C({P, Q, T}, T) = 19
  - C({P, S, U}, S) = 22; C({P, S, U}, U) = 27
  - C({P, R, T}, R) = 33; C({P, R, T}, T) = 25
  - C({P, Q, S}, Q) = 29; C({P, Q, S}, S) = 22
  - C({P, T, U}, T) = 20; C({P, T, U}, U) = 30
  - C({P, S, T}, S) = 27; C({P, S, T}, T) = 22
  - C({P, R, S}, R) = 24; C({P, R, S}, S) = 21
  - C({P, Q, R}, Q) = 30; C({P, Q, R}, R) = 26

*Ukuran* $|S| = 4$:

  - C({P, Q, R, U}, Q) = 44; C({P, Q, R, U}, R) = 41; C({P, Q, R, U}, U) = 42
  - C({P, Q, S, U}, Q) = 36; C({P, Q, S, U}, S) = 37; C({P, Q, S, U}, U) = 34
  - C({P, R, S, U}, R) = 31; C({P, R, S, U}, S) = 35; C({P, R, S, U}, U) = 33
  - C({P, Q, R, T}, Q) = 36; C({P, Q, R, T}, R) = 32; C({P, Q, R, T}, T) = 39
  - C({P, Q, T, U}, Q) = 31; C({P, Q, T, U}, T) = 35; C({P, Q, T, U}, U) = 29
  - C({P, R, T, U}, R) = 33; C({P, R, T, U}, T) = 38; C({P, R, T, U}, U) = 35
  - C({P, Q, S, T}, Q) = 33; C({P, Q, S, T}, S) = 26; C({P, Q, S, T}, T) = 29
  - C({P, S, T, U}, S) = 27; C({P, S, T, U}, T) = 29; C({P, S, T, U}, U) = 32
  - C({P, R, S, T}, R) = 35; C({P, R, S, T}, S) = 32; C({P, R, S, T}, T) = 28
  - C({P, Q, R, S}, Q) = 35; C({P, Q, R, S}, R) = 31; C({P, Q, R, S}, S) = 35

*Ukuran* $|S| = 5$:

  - C({P, Q, R, S, U}, Q) = 49; C({P, Q, R, S, U}, R) = 46; C({P, Q, R, S, U}, S) = 50; C({P, Q, R, S, U}, U) = 47
  - C({P, Q, R, T, U}, Q) = 49; C({P, Q, R, T, U}, R) = 45; C({P, Q, R, T, U}, T) = 52; C({P, Q, R, T, U}, U) = 48
  - C({P, Q, S, T, U}, Q) = 40; C({P, Q, S, T, U}, S) = 41; C({P, Q, S, T, U}, T) = 44; C({P, Q, S, T, U}, U) = 38
  - C({P, R, S, T, U}, R) = 36; C({P, R, S, T, U}, S) = 42; C({P, R, S, T, U}, T) = 42; C({P, R, S, T, U}, U) = 38
  - C({P, Q, R, S, T}, Q) = 39; C({P, Q, R, S, T}, R) = 35; C({P, Q, R, S, T}, S) = 41; C({P, Q, R, S, T}, T) = 42

*Ukuran* $|S| = 6$:

  - C({P, Q, R, S, T, U}, Q) = 53; C({P, Q, R, S, T, U}, R) = 50; C({P, Q, R, S, T, U}, S) = 54; C({P, Q, R, S, T, U}, T) = 57; C({P, Q, R, S, T, U}, U) = 51

*Penutupan Tur (kembali ke P):*

#table(columns: 4, [Akhir di], [$C(V, i)$], [$d(i, P)$], [Total],
  [Q], [53], [8], [61],
  [R], [50], [12], [62],
  [S], [54], [15], [69],
  [T], [57], [20], [77],
  [U], [51], [10], [61],
)

*Biaya minimum:* 61 juta rupiah

*Rute optimal:* P $arrow.r$ U $arrow.r$ R $arrow.r$ S $arrow.r$ T $arrow.r$ Q $arrow.r$ P

*Rincian rute:*

#table(columns: 3, [Dari], [Ke], [Juta Rupiah],
  [P], [U], [10],
  [U], [R], [16],
  [R], [S], [9],
  [S], [T], [7],
  [T], [Q], [11],
  [Q], [P], [8],
  [*Total*], [], [*61*],
)

*Kompleksitas:* $O(n^2 · 2^n)$ — jumlah state yang dihitung = 81.

#pagebreak()

== Soal 3: Rute Inspeksi Jaringan Telekomunikasi

*Formulasi Held-Karp:*

State DP: $C(S, i)$ = biaya minimum mengunjungi semua kota dalam himpunan $S$ (dimulai dari A), berakhir di $i$.

Relasi rekurens:
$ C(S, i) = min_({j in S backslash {i}}) {C(S backslash {i}, j) + d(j, i)} $

Basis: $C({A}, A) = 0$

Solusi: $min_({i != A}) {C(V, i) + d(i, A)}$ dengan $V$ = himpunan semua kota.

*Tabel State DP (format compact):*

_Jumlah state: 193 (maksimum teoritis $(n-1)·2^{n-2} = 192$, +1 base case)_

*Ukuran* $|S| = 1$:

  - C({A}, A) = 0

*Ukuran* $|S| = 2$:

  - C({A, G}, G) = 22
  - C({A, F}, F) = 16
  - C({A, E}, E) = 18
  - C({A, D}, D) = 20
  - C({A, C}, C) = 14
  - C({A, B}, B) = 11

*Ukuran* $|S| = 3$:

  - C({A, B, G}, B) = 43; C({A, B, G}, G) = 32
  - C({A, C, G}, C) = 40; C({A, C, G}, G) = 32
  - C({A, B, F}, B) = 33; C({A, B, F}, F) = 28
  - C({A, D, G}, D) = 36; C({A, D, G}, G) = 34
  - C({A, C, F}, C) = 35; C({A, C, F}, F) = 33
  - C({A, B, E}, B) = 31; C({A, B, E}, E) = 24
  - C({A, E, G}, E) = 34; C({A, E, G}, G) = 30
  - C({A, D, F}, D) = 27; C({A, D, F}, F) = 31
  - C({A, C, E}, C) = 28; C({A, C, E}, E) = 24
  - C({A, B, D}, B) = 35; C({A, B, D}, D) = 26
  - C({A, F, G}, F) = 29; C({A, F, G}, G) = 23
  - C({A, E, F}, E) = 25; C({A, E, F}, F) = 27
  - C({A, D, E}, D) = 26; C({A, D, E}, E) = 28
  - C({A, C, D}, C) = 32; C({A, C, D}, D) = 26
  - C({A, B, C}, B) = 23; C({A, B, C}, C) = 20

*Ukuran* $|S| = 4$:

  - C({A, B, C, G}, B) = 49; C({A, B, C, G}, C) = 50; C({A, B, C, G}, G) = 38
  - C({A, B, D, G}, B) = 51; C({A, B, D, G}, D) = 46; C({A, B, D, G}, G) = 40
  - C({A, C, D, G}, C) = 48; C({A, C, D, G}, D) = 46; C({A, C, D, G}, G) = 40
  - C({A, B, C, F}, B) = 44; C({A, B, C, F}, C) = 42; C({A, B, C, F}, F) = 39
  - C({A, B, E, G}, B) = 47; C({A, B, E, G}, E) = 44; C({A, B, E, G}, G) = 36
  - C({A, C, E, G}, C) = 44; C({A, C, E, G}, E) = 44; C({A, C, E, G}, G) = 36
  - C({A, B, D, F}, B) = 42; C({A, B, D, F}, D) = 39; C({A, B, D, F}, F) = 37
  - C({A, D, E, G}, D) = 42; C({A, D, E, G}, E) = 44; C({A, D, E, G}, G) = 40
  - C({A, C, D, F}, C) = 39; C({A, C, D, F}, D) = 44; C({A, C, D, F}, F) = 37
  - C({A, B, C, E}, B) = 37; C({A, B, C, E}, C) = 34; C({A, B, C, E}, E) = 30
  - C({A, B, F, G}, B) = 44; C({A, B, F, G}, F) = 39; C({A, B, F, G}, G) = 35
  - C({A, C, F, G}, C) = 41; C({A, C, F, G}, F) = 39; C({A, C, F, G}, G) = 40
  - C({A, B, E, F}, B) = 38; C({A, B, E, F}, E) = 37; C({A, B, E, F}, F) = 33
  - C({A, D, F, G}, D) = 37; C({A, D, F, G}, F) = 41; C({A, D, F, G}, G) = 38
  - C({A, C, E, F}, C) = 35; C({A, C, E, F}, E) = 42; C({A, C, E, F}, F) = 33
  - C({A, B, D, E}, B) = 41; C({A, B, D, E}, D) = 32; C({A, B, D, E}, E) = 34
  - C({A, E, F, G}, E) = 35; C({A, E, F, G}, F) = 37; C({A, E, F, G}, G) = 34
  - C({A, D, E, F}, D) = 33; C({A, D, E, F}, E) = 35; C({A, D, E, F}, F) = 37
  - C({A, C, D, E}, C) = 38; C({A, C, D, E}, D) = 32; C({A, C, D, E}, E) = 34
  - C({A, B, C, D}, B) = 41; C({A, B, C, D}, C) = 38; C({A, B, C, D}, D) = 32

*Ukuran* $|S| = 5$:

  - C({A, B, C, D, G}, B) = 57; C({A, B, C, D, G}, C) = 58; C({A, B, C, D, G}, D) = 52; C({A, B, C, D, G}, G) = 46
  - C({A, B, C, E, G}, B) = 53; C({A, B, C, E, G}, C) = 54; C({A, B, C, E, G}, E) = 50; C({A, B, C, E, G}, G) = 42
  - C({A, B, D, E, G}, B) = 57; C({A, B, D, E, G}, D) = 50; C({A, B, D, E, G}, E) = 52; C({A, B, D, E, G}, G) = 46
  - C({A, C, D, E, G}, C) = 54; C({A, C, D, E, G}, D) = 50; C({A, C, D, E, G}, E) = 52; C({A, C, D, E, G}, G) = 46
  - C({A, B, C, D, F}, B) = 48; C({A, B, C, D, F}, C) = 51; C({A, B, C, D, F}, D) = 50; C({A, B, C, D, F}, F) = 43
  - C({A, B, C, F, G}, B) = 50; C({A, B, C, F, G}, C) = 53; C({A, B, C, F, G}, F) = 45; C({A, B, C, F, G}, G) = 46
  - C({A, B, D, F, G}, B) = 52; C({A, B, D, F, G}, D) = 49; C({A, B, D, F, G}, F) = 47; C({A, B, D, F, G}, G) = 44
  - C({A, C, D, F, G}, C) = 49; C({A, C, D, F, G}, D) = 50; C({A, C, D, F, G}, F) = 47; C({A, C, D, F, G}, G) = 44
  - C({A, B, C, E, F}, B) = 44; C({A, B, C, E, F}, C) = 47; C({A, B, C, E, F}, E) = 48; C({A, B, C, E, F}, F) = 39
  - C({A, B, E, F, G}, B) = 48; C({A, B, E, F, G}, E) = 47; C({A, B, E, F, G}, F) = 43; C({A, B, E, F, G}, G) = 40
  - C({A, C, E, F, G}, C) = 45; C({A, C, E, F, G}, E) = 48; C({A, C, E, F, G}, F) = 43; C({A, C, E, F, G}, G) = 40
  - C({A, B, D, E, F}, B) = 48; C({A, B, D, E, F}, D) = 44; C({A, B, D, E, F}, E) = 46; C({A, B, D, E, F}, F) = 43
  - C({A, D, E, F, G}, D) = 43; C({A, D, E, F, G}, E) = 45; C({A, D, E, F, G}, F) = 47; C({A, D, E, F, G}, G) = 44
  - C({A, C, D, E, F}, C) = 45; C({A, C, D, E, F}, D) = 44; C({A, C, D, E, F}, E) = 46; C({A, C, D, E, F}, F) = 43
  - C({A, B, C, D, E}, B) = 47; C({A, B, C, D, E}, C) = 44; C({A, B, C, D, E}, D) = 38; C({A, B, C, D, E}, E) = 40

*Ukuran* $|S| = 6$:

  - C({A, B, C, D, E, G}, B) = 63; C({A, B, C, D, E, G}, C) = 62; C({A, B, C, D, E, G}, D) = 56; C({A, B, C, D, E, G}, E) = 58; C({A, B, C, D, E, G}, G) = 52
  - C({A, B, C, D, F, G}, B) = 58; C({A, B, C, D, F, G}, C) = 61; C({A, B, C, D, F, G}, D) = 56; C({A, B, C, D, F, G}, F) = 53; C({A, B, C, D, F, G}, G) = 50
  - C({A, B, C, E, F, G}, B) = 54; C({A, B, C, E, F, G}, C) = 57; C({A, B, C, E, F, G}, E) = 54; C({A, B, C, E, F, G}, F) = 49; C({A, B, C, E, F, G}, G) = 46
  - C({A, B, D, E, F, G}, B) = 58; C({A, B, D, E, F, G}, D) = 54; C({A, B, D, E, F, G}, E) = 56; C({A, B, D, E, F, G}, F) = 53; C({A, B, D, E, F, G}, G) = 50
  - C({A, C, D, E, F, G}, C) = 55; C({A, C, D, E, F, G}, D) = 54; C({A, C, D, E, F, G}, E) = 56; C({A, C, D, E, F, G}, F) = 53; C({A, C, D, E, F, G}, G) = 50
  - C({A, B, C, D, E, F}, B) = 54; C({A, B, C, D, E, F}, C) = 56; C({A, B, C, D, E, F}, D) = 50; C({A, B, C, D, E, F}, E) = 52; C({A, B, C, D, E, F}, F) = 49

*Ukuran* $|S| = 7$:

  - C({A, B, C, D, E, F, G}, B) = 64; C({A, B, C, D, E, F, G}, C) = 66; C({A, B, C, D, E, F, G}, D) = 60; C({A, B, C, D, E, F, G}, E) = 62; C({A, B, C, D, E, F, G}, F) = 59; C({A, B, C, D, E, F, G}, G) = 56

*Penutupan Tur (kembali ke A):*

#table(columns: 4, [Akhir di], [$C(V, i)$], [$d(i, A)$], [Total],
  [B], [64], [11], [75],
  [C], [66], [14], [80],
  [D], [60], [20], [80],
  [E], [62], [18], [80],
  [F], [59], [16], [75],
  [G], [56], [22], [78],
)

*Biaya minimum:* 75 menit

*Rute optimal:* A $arrow.r$ F $arrow.r$ G $arrow.r$ E $arrow.r$ D $arrow.r$ C $arrow.r$ B $arrow.r$ A

*Rincian rute:*

#table(columns: 3, [Dari], [Ke], [Menit],
  [A], [F], [16],
  [F], [G], [7],
  [G], [E], [12],
  [E], [D], [8],
  [D], [C], [12],
  [C], [B], [9],
  [B], [A], [11],
  [*Total*], [], [*75*],
)

*Kompleksitas:* $O(n^2 · 2^n)$ — jumlah state yang dihitung = 193.

#pagebreak()

== Soal 4: Distribusi Produk E-Commerce

*Formulasi Held-Karp:*

State DP: $C(S, i)$ = biaya minimum mengunjungi semua kota dalam himpunan $S$ (dimulai dari A), berakhir di $i$.

Relasi rekurens:
$ C(S, i) = min_({j in S backslash {i}}) {C(S backslash {i}, j) + d(j, i)} $

Basis: $C({A}, A) = 0$

Solusi: $min_({i != A}) {C(V, i) + d(i, A)}$ dengan $V$ = himpunan semua kota.

*Tabel State DP (format compact):*

_Jumlah state: 81 (maksimum teoritis $(n-1)·2^{n-2} = 80$, +1 base case)_

*Ukuran* $|S| = 1$:

  - C({A}, A) = 0

*Ukuran* $|S| = 2$:

  - C({A, F}, F) = 20
  - C({A, E}, E) = 11
  - C({A, D}, D) = 18
  - C({A, C}, C) = 14
  - C({A, B}, B) = 6

*Ukuran* $|S| = 3$:

  - C({A, B, F}, B) = 36; C({A, B, F}, F) = 22
  - C({A, C, F}, C) = 29; C({A, C, F}, F) = 23
  - C({A, B, E}, B) = 26; C({A, B, E}, E) = 21
  - C({A, D, F}, D) = 31; C({A, D, F}, F) = 29
  - C({A, C, E}, C) = 24; C({A, C, E}, E) = 27
  - C({A, B, D}, B) = 30; C({A, B, D}, D) = 18
  - C({A, E, F}, E) = 30; C({A, E, F}, F) = 21
  - C({A, D, E}, D) = 18; C({A, D, E}, E) = 25
  - C({A, C, D}, C) = 26; C({A, C, D}, D) = 22
  - C({A, B, C}, B) = 24; C({A, B, C}, C) = 16

*Ukuran* $|S| = 4$:

  - C({A, B, C, F}, B) = 39; C({A, B, C, F}, C) = 31; C({A, B, C, F}, F) = 25
  - C({A, B, D, F}, B) = 43; C({A, B, D, F}, D) = 33; C({A, B, D, F}, F) = 29
  - C({A, C, D, F}, C) = 38; C({A, C, D, F}, D) = 34; C({A, C, D, F}, F) = 33
  - C({A, B, C, E}, B) = 34; C({A, B, C, E}, C) = 34; C({A, B, C, E}, E) = 29
  - C({A, B, E, F}, B) = 37; C({A, B, E, F}, E) = 32; C({A, B, E, F}, F) = 31
  - C({A, C, E, F}, C) = 30; C({A, C, E, F}, E) = 33; C({A, C, E, F}, F) = 33
  - C({A, B, D, E}, B) = 30; C({A, B, D, E}, D) = 28; C({A, B, D, E}, E) = 25
  - C({A, D, E, F}, D) = 32; C({A, D, E, F}, E) = 38; C({A, D, E, F}, F) = 29
  - C({A, C, D, E}, C) = 26; C({A, C, D, E}, D) = 32; C({A, C, D, E}, E) = 29
  - C({A, B, C, D}, B) = 34; C({A, B, C, D}, C) = 26; C({A, B, C, D}, D) = 24

*Ukuran* $|S| = 5$:

  - C({A, B, C, D, F}, B) = 46; C({A, B, C, D, F}, C) = 38; C({A, B, C, D, F}, D) = 36; C({A, B, C, D, F}, F) = 35
  - C({A, B, C, E, F}, B) = 40; C({A, B, C, E, F}, C) = 40; C({A, B, C, E, F}, E) = 35; C({A, B, C, E, F}, F) = 39
  - C({A, B, D, E, F}, B) = 44; C({A, B, D, E, F}, D) = 39; C({A, B, D, E, F}, E) = 39; C({A, B, D, E, F}, F) = 35
  - C({A, C, D, E, F}, C) = 38; C({A, C, D, E, F}, D) = 38; C({A, C, D, E, F}, E) = 41; C({A, C, D, E, F}, F) = 35
  - C({A, B, C, D, E}, B) = 36; C({A, B, C, D, E}, C) = 36; C({A, B, C, D, E}, D) = 36; C({A, B, C, D, E}, E) = 31

*Ukuran* $|S| = 6$:

  - C({A, B, C, D, E, F}, B) = 48; C({A, B, C, D, E, F}, C) = 44; C({A, B, C, D, E, F}, D) = 42; C({A, B, C, D, E, F}, E) = 43; C({A, B, C, D, E, F}, F) = 41

*Penutupan Tur (kembali ke A):*

#table(columns: 4, [Akhir di], [$C(V, i)$], [$d(i, A)$], [Total],
  [B], [48], [6], [54],
  [C], [44], [14], [58],
  [D], [42], [18], [60],
  [E], [43], [11], [54],
  [F], [41], [20], [61],
)

*Biaya minimum:* 54 liter

*Rute optimal:* A $arrow.r$ E $arrow.r$ D $arrow.r$ F $arrow.r$ C $arrow.r$ B $arrow.r$ A

*Rincian rute:*

#table(columns: 3, [Dari], [Ke], [Liter],
  [A], [E], [11],
  [E], [D], [7],
  [D], [F], [11],
  [F], [C], [9],
  [C], [B], [10],
  [B], [A], [6],
  [*Total*], [], [*54*],
)

*Kompleksitas:* $O(n^2 · 2^n)$ — jumlah state yang dihitung = 81.

#pagebreak()

== Soal 5: Jalur Robot Pengantar di Pabrik

*Formulasi Held-Karp:*

State DP: $C(S, i)$ = biaya minimum mengunjungi semua kota dalam himpunan $S$ (dimulai dari A), berakhir di $i$.

Relasi rekurens:
$ C(S, i) = min_({j in S backslash {i}}) {C(S backslash {i}, j) + d(j, i)} $

Basis: $C({A}, A) = 0$

Solusi: $min_({i != A}) {C(V, i) + d(i, A)}$ dengan $V$ = himpunan semua kota.

*Tabel State DP (format compact):*

_Jumlah state: 449 (maksimum teoritis $(n-1)·2^{n-2} = 448$, +1 base case)_

*Ukuran* $|S| = 1$:

  - C({A}, A) = 0

*Ukuran* $|S| = 2$:

  - C({A, H}, H) = 11
  - C({A, G}, G) = 20
  - C({A, F}, F) = 18
  - C({A, E}, E) = 14
  - C({A, D}, D) = 9
  - C({A, C}, C) = 12
  - C({A, B}, B) = 5

*Ukuran* $|S| = 3$:

  - C({A, B, H}, B) = 26; C({A, B, H}, H) = 20
  - C({A, C, H}, C) = 21; C({A, C, H}, H) = 22
  - C({A, B, G}, B) = 42; C({A, B, G}, G) = 27
  - C({A, D, H}, D) = 18; C({A, D, H}, H) = 16
  - C({A, C, G}, C) = 37; C({A, C, G}, G) = 29
  - C({A, B, F}, B) = 34; C({A, B, F}, F) = 21
  - C({A, E, H}, E) = 23; C({A, E, H}, H) = 26
  - C({A, D, G}, D) = 34; C({A, D, G}, G) = 23
  - C({A, C, F}, C) = 30; C({A, C, F}, F) = 24
  - C({A, B, E}, B) = 24; C({A, B, E}, E) = 15
  - C({A, F, H}, F) = 21; C({A, F, H}, H) = 28
  - C({A, E, G}, E) = 33; C({A, E, G}, G) = 27
  - C({A, D, F}, D) = 29; C({A, D, F}, F) = 20
  - C({A, C, E}, C) = 23; C({A, C, E}, E) = 21
  - C({A, B, D}, B) = 22; C({A, B, D}, D) = 18
  - C({A, G, H}, G) = 17; C({A, G, H}, H) = 26
  - C({A, F, G}, F) = 29; C({A, F, G}, G) = 27
  - C({A, E, F}, E) = 26; C({A, E, F}, F) = 22
  - C({A, D, E}, D) = 20; C({A, D, E}, E) = 15
  - C({A, C, D}, C) = 17; C({A, C, D}, D) = 20
  - C({A, B, C}, B) = 19; C({A, B, C}, C) = 12

*Ukuran* $|S| = 4$:

  - C({A, B, C, H}, B) = 28; C({A, B, C, H}, C) = 30; C({A, B, C, H}, H) = 22
  - C({A, B, D, H}, B) = 31; C({A, B, D, H}, D) = 27; C({A, B, D, H}, H) = 25
  - C({A, C, D, H}, C) = 26; C({A, C, D, H}, D) = 29; C({A, C, D, H}, H) = 27
  - C({A, B, C, G}, B) = 44; C({A, B, C, G}, C) = 44; C({A, B, C, G}, G) = 29
  - C({A, B, E, H}, B) = 33; C({A, B, E, H}, E) = 32; C({A, B, E, H}, H) = 27
  - C({A, C, E, H}, C) = 32; C({A, C, E, H}, E) = 30; C({A, C, E, H}, H) = 33
  - C({A, B, D, G}, B) = 45; C({A, B, D, G}, D) = 41; C({A, B, D, G}, G) = 32
  - C({A, D, E, H}, D) = 29; C({A, D, E, H}, E) = 24; C({A, D, E, H}, H) = 27
  - C({A, C, D, G}, C) = 40; C({A, C, D, G}, D) = 43; C({A, C, D, G}, G) = 34
  - C({A, B, C, F}, B) = 37; C({A, B, C, F}, C) = 33; C({A, B, C, F}, F) = 24
  - C({A, B, F, H}, B) = 37; C({A, B, F, H}, F) = 30; C({A, B, F, H}, H) = 31
  - C({A, C, F, H}, C) = 33; C({A, C, F, H}, F) = 32; C({A, C, F, H}, H) = 34
  - C({A, B, E, G}, B) = 43; C({A, B, E, G}, E) = 40; C({A, B, E, G}, G) = 28
  - C({A, D, F, H}, D) = 32; C({A, D, F, H}, F) = 26; C({A, D, F, H}, H) = 30
  - C({A, C, E, G}, C) = 42; C({A, C, E, G}, E) = 42; C({A, C, E, G}, G) = 34
  - C({A, B, D, F}, B) = 36; C({A, B, D, F}, D) = 32; C({A, B, D, F}, F) = 29
  - C({A, E, F, H}, E) = 29; C({A, E, F, H}, F) = 31; C({A, E, F, H}, H) = 32
  - C({A, D, E, G}, D) = 39; C({A, D, E, G}, E) = 36; C({A, D, E, G}, G) = 28
  - C({A, C, D, F}, C) = 32; C({A, C, D, F}, D) = 35; C({A, C, D, F}, F) = 29
  - C({A, B, C, E}, B) = 30; C({A, B, C, E}, C) = 24; C({A, B, C, E}, E) = 21
  - C({A, B, G, H}, B) = 39; C({A, B, G, H}, G) = 26; C({A, B, G, H}, H) = 33
  - C({A, C, G, H}, C) = 34; C({A, C, G, H}, G) = 28; C({A, C, G, H}, H) = 35
  - C({A, B, F, G}, B) = 45; C({A, B, F, G}, F) = 36; C({A, B, F, G}, G) = 30
  - C({A, D, G, H}, D) = 31; C({A, D, G, H}, G) = 22; C({A, D, G, H}, H) = 29
  - C({A, C, F, G}, C) = 41; C({A, C, F, G}, F) = 38; C({A, C, F, G}, G) = 33
  - C({A, B, E, F}, B) = 36; C({A, B, E, F}, E) = 29; C({A, B, E, F}, F) = 23
  - C({A, E, G, H}, E) = 30; C({A, E, G, H}, G) = 32; C({A, E, G, H}, H) = 33
  - C({A, D, F, G}, D) = 40; C({A, D, F, G}, F) = 32; C({A, D, F, G}, G) = 29
  - C({A, C, E, F}, C) = 34; C({A, C, E, F}, E) = 32; C({A, C, E, F}, F) = 29
  - C({A, B, D, E}, B) = 25; C({A, B, D, E}, D) = 21; C({A, B, D, E}, E) = 24
  - C({A, F, G, H}, F) = 26; C({A, F, G, H}, G) = 30; C({A, F, G, H}, H) = 33
  - C({A, E, F, G}, E) = 37; C({A, E, F, G}, F) = 36; C({A, E, F, G}, G) = 31
  - C({A, D, E, F}, D) = 32; C({A, D, E, F}, E) = 28; C({A, D, E, F}, F) = 23
  - C({A, C, D, E}, C) = 24; C({A, C, D, E}, D) = 27; C({A, C, D, E}, E) = 26
  - C({A, B, C, D}, B) = 24; C({A, B, C, D}, C) = 26; C({A, B, C, D}, D) = 20

*Ukuran* $|S| = 5$:

  - C({A, B, C, D, H}, B) = 33; C({A, B, C, D, H}, C) = 35; C({A, B, C, D, H}, D) = 29; C({A, B, C, D, H}, H) = 27
  - C({A, B, C, E, H}, B) = 39; C({A, B, C, E, H}, C) = 37; C({A, B, C, E, H}, E) = 34; C({A, B, C, E, H}, H) = 33
  - C({A, B, D, E, H}, B) = 34; C({A, B, D, E, H}, D) = 34; C({A, B, D, E, H}, E) = 33; C({A, B, D, E, H}, H) = 28
  - C({A, C, D, E, H}, C) = 33; C({A, C, D, E, H}, D) = 36; C({A, C, D, E, H}, E) = 35; C({A, C, D, E, H}, H) = 34
  - C({A, B, C, D, G}, B) = 47; C({A, B, C, D, G}, C) = 49; C({A, B, C, D, G}, D) = 43; C({A, B, C, D, G}, G) = 34
  - C({A, B, C, F, H}, B) = 40; C({A, B, C, F, H}, C) = 41; C({A, B, C, F, H}, F) = 32; C({A, B, C, F, H}, H) = 34
  - C({A, B, D, F, H}, B) = 42; C({A, B, D, F, H}, D) = 38; C({A, B, D, F, H}, F) = 35; C({A, B, D, F, H}, H) = 39
  - C({A, C, D, F, H}, C) = 38; C({A, C, D, F, H}, D) = 41; C({A, C, D, F, H}, F) = 37; C({A, C, D, F, H}, H) = 39
  - C({A, B, C, E, G}, B) = 49; C({A, B, C, E, G}, C) = 45; C({A, B, C, E, G}, E) = 42; C({A, B, C, E, G}, G) = 34
  - C({A, B, E, F, H}, B) = 39; C({A, B, E, F, H}, E) = 38; C({A, B, E, F, H}, F) = 37; C({A, B, E, F, H}, H) = 33
  - C({A, C, E, F, H}, C) = 38; C({A, C, E, F, H}, E) = 40; C({A, C, E, F, H}, F) = 38; C({A, C, E, F, H}, H) = 39
  - C({A, B, D, E, G}, B) = 46; C({A, B, D, E, G}, D) = 42; C({A, B, D, E, G}, E) = 45; C({A, B, D, E, G}, G) = 35
  - C({A, D, E, F, H}, D) = 35; C({A, D, E, F, H}, E) = 34; C({A, D, E, F, H}, F) = 32; C({A, D, E, F, H}, H) = 33
  - C({A, C, D, E, G}, C) = 45; C({A, C, D, E, G}, D) = 48; C({A, C, D, E, G}, E) = 47; C({A, C, D, E, G}, G) = 39
  - C({A, B, C, D, F}, B) = 39; C({A, B, C, D, F}, C) = 40; C({A, B, C, D, F}, D) = 35; C({A, B, C, D, F}, F) = 31
  - C({A, B, C, G, H}, B) = 41; C({A, B, C, G, H}, C) = 43; C({A, B, C, G, H}, G) = 28; C({A, B, C, G, H}, H) = 35
  - C({A, B, D, G, H}, B) = 44; C({A, B, D, G, H}, D) = 40; C({A, B, D, G, H}, G) = 31; C({A, B, D, G, H}, H) = 38
  - C({A, C, D, G, H}, C) = 39; C({A, C, D, G, H}, D) = 42; C({A, C, D, G, H}, G) = 33; C({A, C, D, G, H}, H) = 40
  - C({A, B, C, F, G}, B) = 48; C({A, B, C, F, G}, C) = 47; C({A, B, C, F, G}, F) = 38; C({A, B, C, F, G}, G) = 33
  - C({A, B, E, G, H}, B) = 40; C({A, B, E, G, H}, E) = 39; C({A, B, E, G, H}, G) = 33; C({A, B, E, G, H}, H) = 34
  - C({A, C, E, G, H}, C) = 39; C({A, C, E, G, H}, E) = 41; C({A, C, E, G, H}, G) = 39; C({A, C, E, G, H}, H) = 40
  - C({A, B, D, F, G}, B) = 48; C({A, B, D, F, G}, D) = 44; C({A, B, D, F, G}, F) = 41; C({A, B, D, F, G}, G) = 38
  - C({A, D, E, G, H}, D) = 36; C({A, D, E, G, H}, E) = 35; C({A, D, E, G, H}, G) = 33; C({A, D, E, G, H}, H) = 34
  - C({A, C, D, F, G}, C) = 44; C({A, C, D, F, G}, D) = 47; C({A, C, D, F, G}, F) = 43; C({A, C, D, F, G}, G) = 38
  - C({A, B, C, E, F}, B) = 41; C({A, B, C, E, F}, C) = 35; C({A, B, C, E, F}, E) = 32; C({A, B, C, E, F}, F) = 29
  - C({A, B, F, G, H}, B) = 42; C({A, B, F, G, H}, F) = 35; C({A, B, F, G, H}, G) = 37; C({A, B, F, G, H}, H) = 36
  - C({A, C, F, G, H}, C) = 38; C({A, C, F, G, H}, F) = 37; C({A, C, F, G, H}, G) = 40; C({A, C, F, G, H}, H) = 39
  - C({A, B, E, F, G}, B) = 47; C({A, B, E, F, G}, E) = 43; C({A, B, E, F, G}, F) = 37; C({A, B, E, F, G}, G) = 32
  - C({A, D, F, G, H}, D) = 37; C({A, D, F, G, H}, F) = 31; C({A, D, F, G, H}, G) = 35; C({A, D, F, G, H}, H) = 35
  - C({A, C, E, F, G}, C) = 46; C({A, C, E, F, G}, E) = 46; C({A, C, E, F, G}, F) = 43; C({A, C, E, F, G}, G) = 38
  - C({A, B, D, E, F}, B) = 38; C({A, B, D, E, F}, D) = 34; C({A, B, D, E, F}, E) = 37; C({A, B, D, E, F}, F) = 32
  - C({A, E, F, G, H}, E) = 34; C({A, E, F, G, H}, F) = 38; C({A, E, F, G, H}, G) = 38; C({A, E, F, G, H}, H) = 37
  - C({A, D, E, F, G}, D) = 43; C({A, D, E, F, G}, E) = 40; C({A, D, E, F, G}, F) = 37; C({A, D, E, F, G}, G) = 32
  - C({A, C, D, E, F}, C) = 35; C({A, C, D, E, F}, D) = 38; C({A, C, D, E, F}, E) = 37; C({A, C, D, E, F}, F) = 34
  - C({A, B, C, D, E}, B) = 31; C({A, B, C, D, E}, C) = 29; C({A, B, C, D, E}, D) = 27; C({A, B, C, D, E}, E) = 26

*Ukuran* $|S| = 6$:

  - C({A, B, C, D, E, H}, B) = 40; C({A, B, C, D, E, H}, C) = 38; C({A, B, C, D, E, H}, D) = 40; C({A, B, C, D, E, H}, E) = 35; C({A, B, C, D, E, H}, H) = 34
  - C({A, B, C, D, F, H}, B) = 45; C({A, B, C, D, F, H}, C) = 46; C({A, B, C, D, F, H}, D) = 41; C({A, B, C, D, F, H}, F) = 37; C({A, B, C, D, F, H}, H) = 41
  - C({A, B, C, E, F, H}, B) = 45; C({A, B, C, E, F, H}, C) = 43; C({A, B, C, E, F, H}, E) = 40; C({A, B, C, E, F, H}, F) = 42; C({A, B, C, E, F, H}, H) = 39
  - C({A, B, D, E, F, H}, B) = 44; C({A, B, D, E, F, H}, D) = 40; C({A, B, D, E, F, H}, E) = 43; C({A, B, D, E, F, H}, F) = 38; C({A, B, D, E, F, H}, H) = 41
  - C({A, C, D, E, F, H}, C) = 43; C({A, C, D, E, F, H}, D) = 46; C({A, C, D, E, F, H}, E) = 45; C({A, C, D, E, F, H}, F) = 43; C({A, C, D, E, F, H}, H) = 44
  - C({A, B, C, D, E, G}, B) = 52; C({A, B, C, D, E, G}, C) = 50; C({A, B, C, D, E, G}, D) = 48; C({A, B, C, D, E, G}, E) = 47; C({A, B, C, D, E, G}, G) = 39
  - C({A, B, C, D, G, H}, B) = 46; C({A, B, C, D, G, H}, C) = 48; C({A, B, C, D, G, H}, D) = 42; C({A, B, C, D, G, H}, G) = 33; C({A, B, C, D, G, H}, H) = 40
  - C({A, B, C, E, G, H}, B) = 46; C({A, B, C, E, G, H}, C) = 44; C({A, B, C, E, G, H}, E) = 41; C({A, B, C, E, G, H}, G) = 39; C({A, B, C, E, G, H}, H) = 40
  - C({A, B, D, E, G, H}, B) = 45; C({A, B, D, E, G, H}, D) = 41; C({A, B, D, E, G, H}, E) = 44; C({A, B, D, E, G, H}, G) = 34; C({A, B, D, E, G, H}, H) = 41
  - C({A, C, D, E, G, H}, C) = 44; C({A, C, D, E, G, H}, D) = 47; C({A, C, D, E, G, H}, E) = 46; C({A, C, D, E, G, H}, G) = 40; C({A, C, D, E, G, H}, H) = 45
  - C({A, B, C, D, F, G}, B) = 51; C({A, B, C, D, F, G}, C) = 52; C({A, B, C, D, F, G}, D) = 47; C({A, B, C, D, F, G}, F) = 43; C({A, B, C, D, F, G}, G) = 40
  - C({A, B, C, F, G, H}, B) = 45; C({A, B, C, F, G, H}, C) = 46; C({A, B, C, F, G, H}, F) = 37; C({A, B, C, F, G, H}, G) = 40; C({A, B, C, F, G, H}, H) = 39
  - C({A, B, D, F, G, H}, B) = 47; C({A, B, D, F, G, H}, D) = 43; C({A, B, D, F, G, H}, F) = 40; C({A, B, D, F, G, H}, G) = 44; C({A, B, D, F, G, H}, H) = 44
  - C({A, C, D, F, G, H}, C) = 43; C({A, C, D, F, G, H}, D) = 46; C({A, C, D, F, G, H}, F) = 42; C({A, C, D, F, G, H}, G) = 45; C({A, C, D, F, G, H}, H) = 44
  - C({A, B, C, E, F, G}, B) = 53; C({A, B, C, E, F, G}, C) = 49; C({A, B, C, E, F, G}, E) = 46; C({A, B, C, E, F, G}, F) = 43; C({A, B, C, E, F, G}, G) = 38
  - C({A, B, E, F, G, H}, B) = 44; C({A, B, E, F, G, H}, E) = 43; C({A, B, E, F, G, H}, F) = 42; C({A, B, E, F, G, H}, G) = 39; C({A, B, E, F, G, H}, H) = 38
  - C({A, C, E, F, G, H}, C) = 43; C({A, C, E, F, G, H}, E) = 45; C({A, C, E, F, G, H}, F) = 48; C({A, C, E, F, G, H}, G) = 45; C({A, C, E, F, G, H}, H) = 44
  - C({A, B, D, E, F, G}, B) = 50; C({A, B, D, E, F, G}, D) = 46; C({A, B, D, E, F, G}, E) = 49; C({A, B, D, E, F, G}, F) = 44; C({A, B, D, E, F, G}, G) = 41
  - C({A, D, E, F, G, H}, D) = 40; C({A, D, E, F, G, H}, E) = 39; C({A, D, E, F, G, H}, F) = 42; C({A, D, E, F, G, H}, G) = 39; C({A, D, E, F, G, H}, H) = 38
  - C({A, C, D, E, F, G}, C) = 49; C({A, C, D, E, F, G}, D) = 52; C({A, C, D, E, F, G}, E) = 51; C({A, C, D, E, F, G}, F) = 48; C({A, C, D, E, F, G}, G) = 43
  - C({A, B, C, D, E, F}, B) = 42; C({A, B, C, D, E, F}, C) = 42; C({A, B, C, D, E, F}, D) = 38; C({A, B, C, D, E, F}, E) = 39; C({A, B, C, D, E, F}, F) = 34

*Ukuran* $|S| = 7$:

  - C({A, B, C, D, E, F, H}, B) = 50; C({A, B, C, D, E, F, H}, C) = 48; C({A, B, C, D, E, F, H}, D) = 46; C({A, B, C, D, E, F, H}, E) = 45; C({A, B, C, D, E, F, H}, F) = 43; C({A, B, C, D, E, F, H}, H) = 44
  - C({A, B, C, D, E, G, H}, B) = 51; C({A, B, C, D, E, G, H}, C) = 49; C({A, B, C, D, E, G, H}, D) = 47; C({A, B, C, D, E, G, H}, E) = 46; C({A, B, C, D, E, G, H}, G) = 40; C({A, B, C, D, E, G, H}, H) = 45
  - C({A, B, C, D, F, G, H}, B) = 50; C({A, B, C, D, F, G, H}, C) = 51; C({A, B, C, D, F, G, H}, D) = 46; C({A, B, C, D, F, G, H}, F) = 42; C({A, B, C, D, F, G, H}, G) = 46; C({A, B, C, D, F, G, H}, H) = 46
  - C({A, B, C, E, F, G, H}, B) = 50; C({A, B, C, E, F, G, H}, C) = 48; C({A, B, C, E, F, G, H}, E) = 45; C({A, B, C, E, F, G, H}, F) = 48; C({A, B, C, E, F, G, H}, G) = 45; C({A, B, C, E, F, G, H}, H) = 44
  - C({A, B, D, E, F, G, H}, B) = 49; C({A, B, D, E, F, G, H}, D) = 45; C({A, B, D, E, F, G, H}, E) = 48; C({A, B, D, E, F, G, H}, F) = 43; C({A, B, D, E, F, G, H}, G) = 47; C({A, B, D, E, F, G, H}, H) = 47
  - C({A, C, D, E, F, G, H}, C) = 48; C({A, C, D, E, F, G, H}, D) = 51; C({A, C, D, E, F, G, H}, E) = 50; C({A, C, D, E, F, G, H}, F) = 49; C({A, C, D, E, F, G, H}, G) = 50; C({A, C, D, E, F, G, H}, H) = 49
  - C({A, B, C, D, E, F, G}, B) = 56; C({A, B, C, D, E, F, G}, C) = 54; C({A, B, C, D, E, F, G}, D) = 52; C({A, B, C, D, E, F, G}, E) = 51; C({A, B, C, D, E, F, G}, F) = 48; C({A, B, C, D, E, F, G}, G) = 43

*Ukuran* $|S| = 8$:

  - C({A, B, C, D, E, F, G, H}, B) = 55; C({A, B, C, D, E, F, G, H}, C) = 53; C({A, B, C, D, E, F, G, H}, D) = 51; C({A, B, C, D, E, F, G, H}, E) = 50; C({A, B, C, D, E, F, G, H}, F) = 49; C({A, B, C, D, E, F, G, H}, G) = 50; C({A, B, C, D, E, F, G, H}, H) = 49

*Penutupan Tur (kembali ke A):*

#table(columns: 4, [Akhir di], [$C(V, i)$], [$d(i, A)$], [Total],
  [B], [55], [5], [60],
  [C], [53], [12], [65],
  [D], [51], [9], [60],
  [E], [50], [14], [64],
  [F], [49], [18], [67],
  [G], [50], [20], [70],
  [H], [49], [11], [60],
)

*Biaya minimum:* 60 meter

*Rute optimal:* A $arrow.r$ H $arrow.r$ G $arrow.r$ F $arrow.r$ E $arrow.r$ D $arrow.r$ C $arrow.r$ B $arrow.r$ A

*Rincian rute:*

#table(columns: 3, [Dari], [Ke], [Meter],
  [A], [H], [11],
  [H], [G], [6],
  [G], [F], [9],
  [F], [E], [8],
  [E], [D], [6],
  [D], [C], [8],
  [C], [B], [7],
  [B], [A], [5],
  [*Total*], [], [*60*],
)

*Kompleksitas:* $O(n^2 · 2^n)$ — jumlah state yang dihitung = 449.

#pagebreak()

= Bagian 2: Branch and Bound

== Soal 1: Distribusi Produk Farmasi

*Formulasi Branch and Bound:*

Algoritma Branch and Bound untuk TSP menggunakan reduksi matriks biaya untuk menghitung _lower bound_ (LB) setiap node. Matriks awal dimodifikasi: elemen diagonal (A $arrow.r$ A, B $arrow.r$ B, dst.) diatur menjadi $infinity$ karena tidak mungkin mengunjungi kota yang sama berturut-turut tanpa melalui kota lain.

*Perhitungan Lower Bound Awal:*

Matriks awal (diagonal = $infinity$):

#table(
  columns: 7,
  [], [A], [B], [C], [D], [E], [F],
  [A], [$infinity$], [12], [18], [25], [16], [22],
  [B], [12], [$infinity$], [20], [17], [14], [28],
  [C], [18], [20], [$infinity$], [15], [24], [11],
  [D], [25], [17], [15], [$infinity$], [13], [19],
  [E], [16], [14], [24], [13], [$infinity$], [10],
  [F], [22], [28], [11], [19], [10], [$infinity$],
)

*Reduksi baris*:

#table(columns: 2, [Baris], [Nilai reduksi],
  [A], [12],
  [B], [12],
  [C], [11],
  [D], [13],
  [E], [10],
  [F], [10],
)
  Subtotal reduksi baris: 68

*Reduksi kolom*:

#table(columns: 2, [Kolom], [Nilai reduksi],
  [A], [0],
  [B], [0],
  [C], [1],
  [D], [3],
  [E], [0],
  [F], [0],
)
  Subtotal reduksi kolom: 4

Total reduksi: 68 + 4 = 72. *Lower bound awal* $= 72$.

Matriks setelah reduksi penuh:

#table(
  columns: 7,
  [], [A], [B], [C], [D], [E], [F],
  [A], [$infinity$], [0], [5], [10], [4], [10],
  [B], [0], [$infinity$], [7], [2], [2], [16],
  [C], [7], [9], [$infinity$], [1], [13], [0],
  [D], [12], [4], [1], [$infinity$], [0], [6],
  [E], [6], [4], [13], [0], [$infinity$], [0],
  [F], [12], [18], [0], [6], [0], [$infinity$],
)

*Pohon pencarian Branch and Bound:*

*Level 0* (1 node):

- A: LB = 72, cost so far = 0
  Cabang-cabang dari A:
  - B: LB = 80, cost = 12
  - E: LB = 80, cost = 16
  - C: LB = 81, cost = 18
  - D: LB = 86, cost = 25
  - F: LB = 87, cost = 22

*Level 1* (5 node):

- Node: A $arrow.r$ B — LB = 80, cost so far = 12
  Cabang-cabang:
  - D: LB = 80, cost = 29
  - E: LB = 83, cost = 26
  - C: LB = 85, cost = 32
  - F: LB = 95, cost = 40

- Node: A $arrow.r$ E — LB = 80, cost so far = 16
  Cabang-cabang:
  - D: LB = 80, cost = 29
  - F: LB = 81, cost = 26
  - B: LB = 91, cost = 30
  - C: LB = 99, cost = 40

- Node: A $arrow.r$ C — LB = 81, cost so far = 18
  Cabang-cabang:
  - F: LB = 78, cost = 29
  - D: LB = 82, cost = 33
  - B: LB = 94, cost = 38
  - E: LB = 100, cost = 42

- Node: A $arrow.r$ D — LB = 86, cost so far = 25

- Node: A $arrow.r$ F — LB = 87, cost so far = 22

*Level 2* (12 node):

- Node: A $arrow.r$ C $arrow.r$ F — LB = 78, cost so far = 29
  Cabang-cabang:
  - E: LB = 81, cost = 39
  - D: LB = 87, cost = 48
  - B: LB = 100, cost = 57

- Node: A $arrow.r$ B $arrow.r$ D — LB = 80, cost so far = 29
  Cabang-cabang:
  - E: LB = 81, cost = 42
  - C: LB = 81, cost = 44
  - F: LB = 93, cost = 48

- Node: A $arrow.r$ E $arrow.r$ D — LB = 80, cost so far = 29
  Cabang-cabang:
  - F: LB = 91, cost = 48
  - C: LB = 95, cost = 44
  - B: LB = 95, cost = 46

- Node: A $arrow.r$ E $arrow.r$ F — LB = 81, cost so far = 26
  Cabang-cabang:
  - C: LB = 81, cost = 37
  - D: LB = 92, cost = 45
  - B: LB = 104, cost = 54

- Node: A $arrow.r$ C $arrow.r$ D — LB = 82, cost so far = 33

- Node: A $arrow.r$ B $arrow.r$ E — LB = 83, cost so far = 26

- Node: A $arrow.r$ B $arrow.r$ C — LB = 85, cost so far = 32

- Node: A $arrow.r$ E $arrow.r$ B — LB = 91, cost so far = 30

- Node: A $arrow.r$ C $arrow.r$ B — LB = 94, cost so far = 38

- Node: A $arrow.r$ B $arrow.r$ F — LB = 95, cost so far = 40

- Node: A $arrow.r$ E $arrow.r$ C — LB = 99, cost so far = 40

- Node: A $arrow.r$ C $arrow.r$ E — LB = 100, cost so far = 42

*Level 3* (12 node):

- Node: A $arrow.r$ B $arrow.r$ D $arrow.r$ E — LB = 81, cost so far = 42
- Node: A $arrow.r$ B $arrow.r$ D $arrow.r$ C — LB = 81, cost so far = 44
- Node: A $arrow.r$ C $arrow.r$ F $arrow.r$ E — LB = 81, cost so far = 39
- Node: A $arrow.r$ E $arrow.r$ F $arrow.r$ C — LB = 81, cost so far = 37
- Node: A $arrow.r$ C $arrow.r$ F $arrow.r$ D — LB = 87, cost so far = 48
- Node: A $arrow.r$ E $arrow.r$ D $arrow.r$ F — LB = 91, cost so far = 48
- Node: A $arrow.r$ E $arrow.r$ F $arrow.r$ D — LB = 92, cost so far = 45
- Node: A $arrow.r$ B $arrow.r$ D $arrow.r$ F — LB = 93, cost so far = 48
- ... dan 4 node lainnya

*Level 4* (8 node):

- Node: A $arrow.r$ B $arrow.r$ D $arrow.r$ E $arrow.r$ F — LB = 81, cost so far = 52
- Node: A $arrow.r$ B $arrow.r$ D $arrow.r$ C $arrow.r$ F — LB = 81, cost so far = 55
- Node: A $arrow.r$ C $arrow.r$ F $arrow.r$ E $arrow.r$ D — LB = 81, cost so far = 52
- Node: A $arrow.r$ E $arrow.r$ F $arrow.r$ C $arrow.r$ D — LB = 81, cost so far = 52
- Node: A $arrow.r$ C $arrow.r$ F $arrow.r$ E $arrow.r$ B — LB = 95, cost so far = 53
- Node: A $arrow.r$ B $arrow.r$ D $arrow.r$ E $arrow.r$ C — LB = 99, cost so far = 66
- Node: A $arrow.r$ E $arrow.r$ F $arrow.r$ C $arrow.r$ B — LB = 99, cost so far = 57
- Node: A $arrow.r$ B $arrow.r$ D $arrow.r$ C $arrow.r$ E — LB = 100, cost so far = 68

*Level 5* (1 node):

- Node: A $arrow.r$ B $arrow.r$ D $arrow.r$ E $arrow.r$ F $arrow.r$ C — LB = 63, cost so far = 63

*Biaya minimum:* 81 km

*Rute optimal:* A $arrow.r$ B $arrow.r$ D $arrow.r$ E $arrow.r$ F $arrow.r$ C $arrow.r$ A

*Rincian rute:*

#table(columns: 3, [Dari], [Ke], [Km],
  [A], [B], [12],
  [B], [D], [17],
  [D], [E], [13],
  [E], [F], [10],
  [F], [C], [11],
  [C], [A], [18],
  [*Total*], [], [*81*],
)

*Jumlah node dievaluasi:* 39

*Perbandingan dengan Brute Force:*
- Brute Force: 120 kemungkinan rute
- Branch and Bound: 39 node dievaluasi
- Penghematan: 67.5%

#pagebreak()

== Soal 2: Pengiriman Barang E-Commerce

*Formulasi Branch and Bound:*

Algoritma Branch and Bound untuk TSP menggunakan reduksi matriks biaya untuk menghitung _lower bound_ (LB) setiap node. Matriks awal dimodifikasi: elemen diagonal (P $arrow.r$ P, Q $arrow.r$ Q, dst.) diatur menjadi $infinity$ karena tidak mungkin mengunjungi kota yang sama berturut-turut tanpa melalui kota lain.

*Perhitungan Lower Bound Awal:*

Matriks awal (diagonal = $infinity$):

#table(
  columns: 7,
  [], [P], [Q], [R], [S], [T], [U],
  [P], [$infinity$], [9], [14], [21], [17], [24],
  [Q], [9], [$infinity$], [19], [16], [12], [26],
  [R], [14], [19], [$infinity$], [13], [22], [10],
  [S], [21], [16], [13], [$infinity$], [11], [15],
  [T], [17], [12], [22], [11], [$infinity$], [8],
  [U], [24], [26], [10], [15], [8], [$infinity$],
)

*Reduksi baris*:

#table(columns: 2, [Baris], [Nilai reduksi],
  [P], [9],
  [Q], [9],
  [R], [10],
  [S], [11],
  [T], [8],
  [U], [8],
)
  Subtotal reduksi baris: 55

*Reduksi kolom*:

#table(columns: 2, [Kolom], [Nilai reduksi],
  [P], [0],
  [Q], [0],
  [R], [2],
  [S], [3],
  [T], [0],
  [U], [0],
)
  Subtotal reduksi kolom: 5

Total reduksi: 55 + 5 = 60. *Lower bound awal* $= 60$.

Matriks setelah reduksi penuh:

#table(
  columns: 7,
  [], [P], [Q], [R], [S], [T], [U],
  [P], [$infinity$], [0], [3], [9], [8], [15],
  [Q], [0], [$infinity$], [8], [4], [3], [17],
  [R], [4], [9], [$infinity$], [0], [12], [0],
  [S], [10], [5], [0], [$infinity$], [0], [4],
  [T], [9], [4], [12], [0], [$infinity$], [0],
  [U], [16], [18], [0], [4], [0], [$infinity$],
)

*Pohon pencarian Branch and Bound:*

*Level 0* (1 node):

- P: LB = 60, cost so far = 0
  Cabang-cabang dari P:
  - Q: LB = 67, cost = 9
  - R: LB = 67, cost = 14
  - T: LB = 73, cost = 17
  - S: LB = 73, cost = 21
  - U: LB = 79, cost = 24

*Level 1* (5 node):

- Node: P $arrow.r$ Q — LB = 67, cost so far = 9
  Cabang-cabang:
  - S: LB = 68, cost = 25
  - T: LB = 69, cost = 21
  - R: LB = 77, cost = 28
  - U: LB = 81, cost = 35

- Node: P $arrow.r$ R — LB = 67, cost so far = 14
  Cabang-cabang:
  - U: LB = 64, cost = 24
  - S: LB = 67, cost = 27
  - Q: LB = 84, cost = 33
  - T: LB = 84, cost = 36

- Node: P $arrow.r$ T — LB = 73, cost so far = 17

- Node: P $arrow.r$ S — LB = 73, cost so far = 21

- Node: P $arrow.r$ U — LB = 79, cost so far = 24

*Level 2* (8 node):

- Node: P $arrow.r$ R $arrow.r$ U — LB = 64, cost so far = 24
  Cabang-cabang:
  - T: LB = 68, cost = 32
  - S: LB = 71, cost = 39
  - Q: LB = 90, cost = 50

- Node: P $arrow.r$ R $arrow.r$ S — LB = 67, cost so far = 27
  Cabang-cabang:
  - U: LB = 71, cost = 42
  - Q: LB = 80, cost = 43
  - T: LB = 81, cost = 38

- Node: P $arrow.r$ Q $arrow.r$ S — LB = 68, cost so far = 25
  Cabang-cabang:
  - T: LB = 68, cost = 36
  - R: LB = 73, cost = 38
  - U: LB = 81, cost = 40

- Node: P $arrow.r$ Q $arrow.r$ T — LB = 69, cost so far = 21

- Node: P $arrow.r$ Q $arrow.r$ R — LB = 77, cost so far = 28

- Node: P $arrow.r$ Q $arrow.r$ U — LB = 81, cost so far = 35

- Node: P $arrow.r$ R $arrow.r$ Q — LB = 84, cost so far = 33

- Node: P $arrow.r$ R $arrow.r$ T — LB = 84, cost so far = 36

*Level 3* (9 node):

- Node: P $arrow.r$ R $arrow.r$ U $arrow.r$ T — LB = 68, cost so far = 32
- Node: P $arrow.r$ Q $arrow.r$ S $arrow.r$ T — LB = 68, cost so far = 36
- Node: P $arrow.r$ R $arrow.r$ U $arrow.r$ S — LB = 71, cost so far = 39
- Node: P $arrow.r$ R $arrow.r$ S $arrow.r$ U — LB = 71, cost so far = 42
- Node: P $arrow.r$ Q $arrow.r$ S $arrow.r$ R — LB = 73, cost so far = 38
- Node: P $arrow.r$ R $arrow.r$ S $arrow.r$ Q — LB = 80, cost so far = 43
- Node: P $arrow.r$ R $arrow.r$ S $arrow.r$ T — LB = 81, cost so far = 38
- Node: P $arrow.r$ Q $arrow.r$ S $arrow.r$ U — LB = 81, cost so far = 40
- ... dan 1 node lainnya

*Level 4* (4 node):

- Node: P $arrow.r$ R $arrow.r$ U $arrow.r$ T $arrow.r$ S — LB = 68, cost so far = 43
- Node: P $arrow.r$ Q $arrow.r$ S $arrow.r$ T $arrow.r$ U — LB = 68, cost so far = 44
- Node: P $arrow.r$ R $arrow.r$ U $arrow.r$ T $arrow.r$ Q — LB = 81, cost so far = 44
- Node: P $arrow.r$ Q $arrow.r$ S $arrow.r$ T $arrow.r$ R — LB = 92, cost so far = 58

*Level 5* (1 node):

- Node: P $arrow.r$ R $arrow.r$ U $arrow.r$ T $arrow.r$ S $arrow.r$ Q — LB = 59, cost so far = 59

*Biaya minimum:* 68 juta rupiah

*Rute optimal:* P $arrow.r$ R $arrow.r$ U $arrow.r$ T $arrow.r$ S $arrow.r$ Q $arrow.r$ P

*Rincian rute:*

#table(columns: 3, [Dari], [Ke], [Juta Rupiah],
  [P], [R], [14],
  [R], [U], [10],
  [U], [T], [8],
  [T], [S], [11],
  [S], [Q], [16],
  [Q], [P], [9],
  [*Total*], [], [*68*],
)

*Jumlah node dievaluasi:* 28

*Perbandingan dengan Brute Force:*
- Brute Force: 120 kemungkinan rute
- Branch and Bound: 28 node dievaluasi
- Penghematan: 76.7%

#pagebreak()

== Soal 3: Jalur Inspeksi Teknisi Jaringan

*Formulasi Branch and Bound:*

Algoritma Branch and Bound untuk TSP menggunakan reduksi matriks biaya untuk menghitung _lower bound_ (LB) setiap node. Matriks awal dimodifikasi: elemen diagonal (A $arrow.r$ A, B $arrow.r$ B, dst.) diatur menjadi $infinity$ karena tidak mungkin mengunjungi kota yang sama berturut-turut tanpa melalui kota lain.

*Perhitungan Lower Bound Awal:*

Matriks awal (diagonal = $infinity$):

#table(
  columns: 8,
  [], [A], [B], [C], [D], [E], [F], [G],
  [A], [$infinity$], [11], [16], [20], [18], [24], [15],
  [B], [11], [$infinity$], [14], [17], [12], [19], [21],
  [C], [16], [14], [$infinity$], [10], [15], [13], [18],
  [D], [20], [17], [10], [$infinity$], [8], [11], [14],
  [E], [18], [12], [15], [8], [$infinity$], [9], [13],
  [F], [24], [19], [13], [11], [9], [$infinity$], [7],
  [G], [15], [21], [18], [14], [13], [7], [$infinity$],
)

*Reduksi baris*:

#table(columns: 2, [Baris], [Nilai reduksi],
  [A], [11],
  [B], [11],
  [C], [10],
  [D], [8],
  [E], [8],
  [F], [7],
  [G], [7],
)
  Subtotal reduksi baris: 62

*Reduksi kolom*:

#table(columns: 2, [Kolom], [Nilai reduksi],
  [A], [0],
  [B], [0],
  [C], [2],
  [D], [0],
  [E], [0],
  [F], [0],
  [G], [0],
)
  Subtotal reduksi kolom: 2

Total reduksi: 62 + 2 = 64. *Lower bound awal* $= 64$.

Matriks setelah reduksi penuh:

#table(
  columns: 8,
  [], [A], [B], [C], [D], [E], [F], [G],
  [A], [$infinity$], [0], [3], [9], [7], [13], [4],
  [B], [0], [$infinity$], [1], [6], [1], [8], [10],
  [C], [6], [4], [$infinity$], [0], [5], [3], [8],
  [D], [12], [9], [0], [$infinity$], [0], [3], [6],
  [E], [10], [4], [5], [0], [$infinity$], [1], [5],
  [F], [17], [12], [4], [4], [2], [$infinity$], [0],
  [G], [8], [14], [9], [7], [6], [0], [$infinity$],
)

*Pohon pencarian Branch and Bound:*

*Level 0* (1 node):

- A: LB = 64, cost so far = 0
  Cabang-cabang dari A:
  - B: LB = 71, cost = 11
  - C: LB = 71, cost = 16
  - G: LB = 74, cost = 15
  - E: LB = 75, cost = 18
  - D: LB = 78, cost = 20
  - F: LB = 87, cost = 24

*Level 1* (6 node):

- Node: A $arrow.r$ B — LB = 71, cost so far = 11
  Cabang-cabang:
  - E: LB = 71, cost = 23
  - C: LB = 73, cost = 25
  - D: LB = 77, cost = 28
  - F: LB = 80, cost = 30
  - G: LB = 82, cost = 32

- Node: A $arrow.r$ C — LB = 71, cost so far = 16
  Cabang-cabang:
  - D: LB = 71, cost = 26
  - E: LB = 79, cost = 31
  - F: LB = 80, cost = 29
  - B: LB = 80, cost = 30
  - G: LB = 81, cost = 34

- Node: A $arrow.r$ G — LB = 74, cost so far = 15
  Cabang-cabang:
  - F: LB = 74, cost = 22
  - D: LB = 82, cost = 29
  - E: LB = 83, cost = 28
  - C: LB = 84, cost = 33
  - B: LB = 92, cost = 36

- Node: A $arrow.r$ E — LB = 75, cost so far = 18

- Node: A $arrow.r$ D — LB = 78, cost so far = 20

- Node: A $arrow.r$ F — LB = 87, cost so far = 24

*Level 2* (15 node):

- Node: A $arrow.r$ B $arrow.r$ E — LB = 71, cost so far = 23
  Cabang-cabang:
  - D: LB = 71, cost = 31
  - F: LB = 74, cost = 32
  - G: LB = 80, cost = 36
  - C: LB = 81, cost = 38

- Node: A $arrow.r$ C $arrow.r$ D — LB = 71, cost so far = 26
  Cabang-cabang:
  - E: LB = 71, cost = 34
  - G: LB = 79, cost = 40
  - F: LB = 80, cost = 37
  - B: LB = 86, cost = 43

- Node: A $arrow.r$ B $arrow.r$ C — LB = 73, cost so far = 25
  Cabang-cabang:
  - D: LB = 74, cost = 35
  - F: LB = 76, cost = 38
  - E: LB = 81, cost = 40
  - G: LB = 85, cost = 43

- Node: A $arrow.r$ G $arrow.r$ F — LB = 74, cost so far = 22
  Cabang-cabang:
  - E: LB = 74, cost = 31
  - C: LB = 76, cost = 35
  - D: LB = 80, cost = 33
  - B: LB = 87, cost = 41

- Node: A $arrow.r$ B $arrow.r$ D — LB = 77, cost so far = 28

- Node: A $arrow.r$ C $arrow.r$ E — LB = 79, cost so far = 31

- Node: A $arrow.r$ B $arrow.r$ F — LB = 80, cost so far = 30

- Node: A $arrow.r$ C $arrow.r$ F — LB = 80, cost so far = 29

- Node: A $arrow.r$ C $arrow.r$ B — LB = 80, cost so far = 30

- Node: A $arrow.r$ C $arrow.r$ G — LB = 81, cost so far = 34

- Node: A $arrow.r$ B $arrow.r$ G — LB = 82, cost so far = 32

- Node: A $arrow.r$ G $arrow.r$ D — LB = 82, cost so far = 29

  ... dan 3 node lainnya

*Level 3* (16 node):

- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ D — LB = 71, cost so far = 31
- Node: A $arrow.r$ C $arrow.r$ D $arrow.r$ E — LB = 71, cost so far = 34
- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ F — LB = 74, cost so far = 32
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D — LB = 74, cost so far = 35
- Node: A $arrow.r$ G $arrow.r$ F $arrow.r$ E — LB = 74, cost so far = 31
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ F — LB = 76, cost so far = 38
- Node: A $arrow.r$ G $arrow.r$ F $arrow.r$ C — LB = 76, cost so far = 35
- Node: A $arrow.r$ C $arrow.r$ D $arrow.r$ G — LB = 79, cost so far = 40
- ... dan 8 node lainnya

*Level 4* (15 node):

- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ E — LB = 74, cost so far = 43
- Node: A $arrow.r$ G $arrow.r$ F $arrow.r$ E $arrow.r$ D — LB = 74, cost so far = 39
- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ D $arrow.r$ C — LB = 76, cost so far = 41
- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ F $arrow.r$ G — LB = 79, cost so far = 39
- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ D $arrow.r$ G — LB = 81, cost so far = 45
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ F — LB = 81, cost so far = 46
- Node: A $arrow.r$ C $arrow.r$ D $arrow.r$ E $arrow.r$ F — LB = 82, cost so far = 43
- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ D $arrow.r$ F — LB = 83, cost so far = 42
- ... dan 7 node lainnya

*Level 5* (2 node):

- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ E $arrow.r$ F — LB = 74, cost so far = 52
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ E $arrow.r$ G — LB = 87, cost so far = 56

*Biaya minimum:* 74 menit

*Rute optimal:* A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ E $arrow.r$ F $arrow.r$ G $arrow.r$ A

*Rincian rute:*

#table(columns: 3, [Dari], [Ke], [Menit],
  [A], [B], [11],
  [B], [C], [14],
  [C], [D], [10],
  [D], [E], [8],
  [E], [F], [9],
  [F], [G], [7],
  [G], [A], [15],
  [*Total*], [], [*74*],
)

*Jumlah node dievaluasi:* 56

*Perbandingan dengan Brute Force:*
- Brute Force: 720 kemungkinan rute
- Branch and Bound: 56 node dievaluasi
- Penghematan: 92.2%

#pagebreak()

== Soal 4: Distribusi Makanan Beku

*Formulasi Branch and Bound:*

Algoritma Branch and Bound untuk TSP menggunakan reduksi matriks biaya untuk menghitung _lower bound_ (LB) setiap node. Matriks awal dimodifikasi: elemen diagonal (A $arrow.r$ A, B $arrow.r$ B, dst.) diatur menjadi $infinity$ karena tidak mungkin mengunjungi kota yang sama berturut-turut tanpa melalui kota lain.

*Perhitungan Lower Bound Awal:*

Matriks awal (diagonal = $infinity$):

#table(
  columns: 7,
  [], [A], [B], [C], [D], [E], [F],
  [A], [$infinity$], [13], [21], [19], [15], [27],
  [B], [13], [$infinity$], [18], [16], [11], [24],
  [C], [21], [18], [$infinity$], [14], [20], [9],
  [D], [19], [16], [14], [$infinity$], [12], [17],
  [E], [15], [11], [20], [12], [$infinity$], [8],
  [F], [27], [24], [9], [17], [8], [$infinity$],
)

*Reduksi baris*:

#table(columns: 2, [Baris], [Nilai reduksi],
  [A], [13],
  [B], [11],
  [C], [9],
  [D], [12],
  [E], [8],
  [F], [8],
)
  Subtotal reduksi baris: 61

*Reduksi kolom*:

#table(columns: 2, [Kolom], [Nilai reduksi],
  [A], [2],
  [B], [0],
  [C], [1],
  [D], [4],
  [E], [0],
  [F], [0],
)
  Subtotal reduksi kolom: 7

Total reduksi: 61 + 7 = 68. *Lower bound awal* $= 68$.

Matriks setelah reduksi penuh:

#table(
  columns: 7,
  [], [A], [B], [C], [D], [E], [F],
  [A], [$infinity$], [0], [7], [2], [2], [14],
  [B], [0], [$infinity$], [6], [1], [0], [13],
  [C], [10], [9], [$infinity$], [1], [11], [0],
  [D], [5], [4], [1], [$infinity$], [0], [5],
  [E], [5], [3], [11], [0], [$infinity$], [0],
  [F], [17], [16], [0], [5], [0], [$infinity$],
)

*Pohon pencarian Branch and Bound:*

*Level 0* (1 node):

- A: LB = 68, cost so far = 0
  Cabang-cabang dari A:
  - B: LB = 73, cost = 13
  - E: LB = 73, cost = 15
  - D: LB = 73, cost = 19
  - C: LB = 78, cost = 21
  - F: LB = 86, cost = 27

*Level 1* (5 node):

- Node: A $arrow.r$ B — LB = 73, cost so far = 13
  Cabang-cabang:
  - E: LB = 73, cost = 24
  - D: LB = 74, cost = 29
  - C: LB = 79, cost = 31
  - F: LB = 87, cost = 37

- Node: A $arrow.r$ E — LB = 73, cost so far = 15
  Cabang-cabang:
  - D: LB = 74, cost = 27
  - F: LB = 75, cost = 23
  - B: LB = 79, cost = 26
  - C: LB = 90, cost = 35

- Node: A $arrow.r$ D — LB = 73, cost so far = 19
  Cabang-cabang:
  - E: LB = 73, cost = 31
  - C: LB = 74, cost = 33
  - B: LB = 79, cost = 35
  - F: LB = 87, cost = 36

- Node: A $arrow.r$ C — LB = 78, cost so far = 21

- Node: A $arrow.r$ F — LB = 86, cost so far = 27

*Level 2* (12 node):

- Node: A $arrow.r$ B $arrow.r$ E — LB = 73, cost so far = 24
  Cabang-cabang:
  - F: LB = 74, cost = 32
  - D: LB = 80, cost = 36
  - C: LB = 89, cost = 44

- Node: A $arrow.r$ D $arrow.r$ E — LB = 73, cost so far = 31
  Cabang-cabang:
  - F: LB = 79, cost = 39
  - B: LB = 90, cost = 42
  - C: LB = 97, cost = 51

- Node: A $arrow.r$ B $arrow.r$ D — LB = 74, cost so far = 29
  Cabang-cabang:
  - C: LB = 75, cost = 43
  - E: LB = 79, cost = 41
  - F: LB = 90, cost = 46

- Node: A $arrow.r$ E $arrow.r$ D — LB = 74, cost so far = 27
  Cabang-cabang:
  - F: LB = 84, cost = 44
  - C: LB = 87, cost = 41
  - B: LB = 91, cost = 43

- Node: A $arrow.r$ D $arrow.r$ C — LB = 74, cost so far = 33
  Cabang-cabang:
  - F: LB = 74, cost = 42
  - B: LB = 85, cost = 51
  - E: LB = 98, cost = 53

- Node: A $arrow.r$ E $arrow.r$ F — LB = 75, cost so far = 23

- Node: A $arrow.r$ B $arrow.r$ C — LB = 79, cost so far = 31

- Node: A $arrow.r$ E $arrow.r$ B — LB = 79, cost so far = 26

- Node: A $arrow.r$ D $arrow.r$ B — LB = 79, cost so far = 35

- Node: A $arrow.r$ B $arrow.r$ F — LB = 87, cost so far = 37

- Node: A $arrow.r$ D $arrow.r$ F — LB = 87, cost so far = 36

- Node: A $arrow.r$ E $arrow.r$ C — LB = 90, cost so far = 35

*Level 3* (15 node):

- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ F — LB = 74, cost so far = 32
- Node: A $arrow.r$ D $arrow.r$ C $arrow.r$ F — LB = 74, cost so far = 42
- Node: A $arrow.r$ B $arrow.r$ D $arrow.r$ C — LB = 75, cost so far = 43
- Node: A $arrow.r$ D $arrow.r$ E $arrow.r$ F — LB = 79, cost so far = 39
- Node: A $arrow.r$ B $arrow.r$ D $arrow.r$ E — LB = 79, cost so far = 41
- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ D — LB = 80, cost so far = 36
- Node: A $arrow.r$ E $arrow.r$ D $arrow.r$ F — LB = 84, cost so far = 44
- Node: A $arrow.r$ D $arrow.r$ C $arrow.r$ B — LB = 85, cost so far = 51
- ... dan 7 node lainnya

*Level 4* (4 node):

- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ F $arrow.r$ C — LB = 74, cost so far = 41
- Node: A $arrow.r$ D $arrow.r$ C $arrow.r$ F $arrow.r$ E — LB = 74, cost so far = 50
- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ F $arrow.r$ D — LB = 84, cost so far = 49
- Node: A $arrow.r$ D $arrow.r$ C $arrow.r$ F $arrow.r$ B — LB = 92, cost so far = 66

*Level 5* (1 node):

- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ F $arrow.r$ C $arrow.r$ D — LB = 55, cost so far = 55

*Biaya minimum:* 74 km

*Rute optimal:* A $arrow.r$ B $arrow.r$ E $arrow.r$ F $arrow.r$ C $arrow.r$ D $arrow.r$ A

*Rincian rute:*

#table(columns: 3, [Dari], [Ke], [Km],
  [A], [B], [13],
  [B], [E], [11],
  [E], [F], [8],
  [F], [C], [9],
  [C], [D], [14],
  [D], [A], [19],
  [*Total*], [], [*74*],
)

*Jumlah node dievaluasi:* 38

*Perbandingan dengan Brute Force:*
- Brute Force: 120 kemungkinan rute
- Branch and Bound: 38 node dievaluasi
- Penghematan: 68.3%

#pagebreak()

== Soal 5: Rute Robot Pengantar Barang

*Formulasi Branch and Bound:*

Algoritma Branch and Bound untuk TSP menggunakan reduksi matriks biaya untuk menghitung _lower bound_ (LB) setiap node. Matriks awal dimodifikasi: elemen diagonal (A $arrow.r$ A, B $arrow.r$ B, dst.) diatur menjadi $infinity$ karena tidak mungkin mengunjungi kota yang sama berturut-turut tanpa melalui kota lain.

*Perhitungan Lower Bound Awal:*

Matriks awal (diagonal = $infinity$):

#table(
  columns: 8,
  [], [A], [B], [C], [D], [E], [F], [G],
  [A], [$infinity$], [8], [15], [18], [14], [20], [17],
  [B], [8], [$infinity$], [12], [16], [11], [19], [22],
  [C], [15], [12], [$infinity$], [9], [13], [10], [18],
  [D], [18], [16], [9], [$infinity$], [7], [12], [14],
  [E], [14], [11], [13], [7], [$infinity$], [8], [11],
  [F], [20], [19], [10], [12], [8], [$infinity$], [6],
  [G], [17], [22], [18], [14], [11], [6], [$infinity$],
)

*Reduksi baris*:

#table(columns: 2, [Baris], [Nilai reduksi],
  [A], [8],
  [B], [8],
  [C], [9],
  [D], [7],
  [E], [7],
  [F], [6],
  [G], [6],
)
  Subtotal reduksi baris: 51

*Reduksi kolom*:

#table(columns: 2, [Kolom], [Nilai reduksi],
  [A], [0],
  [B], [0],
  [C], [2],
  [D], [0],
  [E], [0],
  [F], [0],
  [G], [0],
)
  Subtotal reduksi kolom: 2

Total reduksi: 51 + 2 = 53. *Lower bound awal* $= 53$.

Matriks setelah reduksi penuh:

#table(
  columns: 8,
  [], [A], [B], [C], [D], [E], [F], [G],
  [A], [$infinity$], [0], [5], [10], [6], [12], [9],
  [B], [0], [$infinity$], [2], [8], [3], [11], [14],
  [C], [6], [3], [$infinity$], [0], [4], [1], [9],
  [D], [11], [9], [0], [$infinity$], [0], [5], [7],
  [E], [7], [4], [4], [0], [$infinity$], [1], [4],
  [F], [14], [13], [2], [6], [2], [$infinity$], [0],
  [G], [11], [16], [10], [8], [5], [0], [$infinity$],
)

*Pohon pencarian Branch and Bound:*

*Level 0* (1 node):

- A: LB = 53, cost so far = 0
  Cabang-cabang dari A:
  - B: LB = 61, cost = 8
  - C: LB = 61, cost = 15
  - E: LB = 62, cost = 14
  - G: LB = 67, cost = 17
  - D: LB = 67, cost = 18
  - F: LB = 73, cost = 20

*Level 1* (6 node):

- Node: A $arrow.r$ B — LB = 61, cost so far = 8
  Cabang-cabang:
  - E: LB = 62, cost = 19
  - C: LB = 62, cost = 20
  - D: LB = 68, cost = 24
  - F: LB = 75, cost = 27
  - G: LB = 75, cost = 30

- Node: A $arrow.r$ C — LB = 61, cost so far = 15
  Cabang-cabang:
  - D: LB = 62, cost = 24
  - F: LB = 68, cost = 25
  - B: LB = 71, cost = 27
  - E: LB = 71, cost = 28
  - G: LB = 73, cost = 33

- Node: A $arrow.r$ E — LB = 62, cost so far = 14
  Cabang-cabang:
  - D: LB = 62, cost = 21
  - G: LB = 70, cost = 25
  - F: LB = 71, cost = 22
  - C: LB = 71, cost = 27
  - B: LB = 73, cost = 25

- Node: A $arrow.r$ G — LB = 67, cost so far = 17
  Cabang-cabang:
  - F: LB = 67, cost = 23
  - E: LB = 75, cost = 28
  - D: LB = 76, cost = 31
  - C: LB = 78, cost = 35
  - B: LB = 89, cost = 39

- Node: A $arrow.r$ D — LB = 67, cost so far = 18
  Cabang-cabang:
  - E: LB = 69, cost = 25
  - C: LB = 69, cost = 27
  - G: LB = 76, cost = 32
  - F: LB = 80, cost = 30
  - B: LB = 81, cost = 34

- Node: A $arrow.r$ F — LB = 73, cost so far = 20

*Level 2* (25 node):

- Node: A $arrow.r$ B $arrow.r$ E — LB = 62, cost so far = 19
  Cabang-cabang:
  - D: LB = 62, cost = 26
  - F: LB = 68, cost = 27
  - G: LB = 70, cost = 30
  - C: LB = 71, cost = 32

- Node: A $arrow.r$ B $arrow.r$ C — LB = 62, cost so far = 20
  Cabang-cabang:
  - D: LB = 62, cost = 29
  - F: LB = 67, cost = 30
  - E: LB = 70, cost = 33
  - G: LB = 73, cost = 38

- Node: A $arrow.r$ C $arrow.r$ D — LB = 62, cost so far = 24
  Cabang-cabang:
  - E: LB = 62, cost = 31
  - G: LB = 71, cost = 38
  - F: LB = 72, cost = 36
  - B: LB = 77, cost = 40

- Node: A $arrow.r$ E $arrow.r$ D — LB = 62, cost so far = 21
  Cabang-cabang:
  - C: LB = 62, cost = 30
  - G: LB = 71, cost = 35
  - B: LB = 76, cost = 37
  - F: LB = 77, cost = 33

- Node: A $arrow.r$ G $arrow.r$ F — LB = 67, cost so far = 23
  Cabang-cabang:
  - E: LB = 67, cost = 31
  - C: LB = 67, cost = 33
  - D: LB = 75, cost = 35
  - B: LB = 83, cost = 42

- Node: A $arrow.r$ B $arrow.r$ D — LB = 68, cost so far = 24

- Node: A $arrow.r$ C $arrow.r$ F — LB = 68, cost so far = 25

- Node: A $arrow.r$ D $arrow.r$ E — LB = 69, cost so far = 25

- Node: A $arrow.r$ D $arrow.r$ C — LB = 69, cost so far = 27

- Node: A $arrow.r$ E $arrow.r$ G — LB = 70, cost so far = 25

- Node: A $arrow.r$ C $arrow.r$ B — LB = 71, cost so far = 27

- Node: A $arrow.r$ C $arrow.r$ E — LB = 71, cost so far = 28

  ... dan 13 node lainnya

*Level 3* (20 node):

- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ D — LB = 62, cost so far = 26
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D — LB = 62, cost so far = 29
- Node: A $arrow.r$ C $arrow.r$ D $arrow.r$ E — LB = 62, cost so far = 31
- Node: A $arrow.r$ E $arrow.r$ D $arrow.r$ C — LB = 62, cost so far = 30
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ F — LB = 67, cost so far = 30
- Node: A $arrow.r$ G $arrow.r$ F $arrow.r$ E — LB = 67, cost so far = 31
- Node: A $arrow.r$ G $arrow.r$ F $arrow.r$ C — LB = 67, cost so far = 33
- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ F — LB = 68, cost so far = 27
- ... dan 12 node lainnya

*Level 4* (15 node):

- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ E — LB = 67, cost so far = 36
- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ D $arrow.r$ C — LB = 68, cost so far = 35
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ F $arrow.r$ G — LB = 68, cost so far = 36
- Node: A $arrow.r$ B $arrow.r$ E $arrow.r$ D $arrow.r$ G — LB = 71, cost so far = 40
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ G — LB = 71, cost so far = 43
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ F — LB = 72, cost so far = 41
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ F $arrow.r$ D — LB = 74, cost so far = 42
- Node: A $arrow.r$ C $arrow.r$ D $arrow.r$ E $arrow.r$ F — LB = 75, cost so far = 39
- ... dan 7 node lainnya

*Level 5* (2 node):

- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ E $arrow.r$ F — LB = 67, cost so far = 44
- Node: A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ E $arrow.r$ G — LB = 73, cost so far = 47

*Biaya minimum:* 67 meter

*Rute optimal:* A $arrow.r$ B $arrow.r$ C $arrow.r$ D $arrow.r$ E $arrow.r$ F $arrow.r$ G $arrow.r$ A

*Rincian rute:*

#table(columns: 3, [Dari], [Ke], [Meter],
  [A], [B], [8],
  [B], [C], [12],
  [C], [D], [9],
  [D], [E], [7],
  [E], [F], [8],
  [F], [G], [6],
  [G], [A], [17],
  [*Total*], [], [*67*],
)

*Jumlah node dievaluasi:* 70

*Perbandingan dengan Brute Force:*
- Brute Force: 720 kemungkinan rute
- Branch and Bound: 70 node dievaluasi
- Penghematan: 90.3%

#pagebreak()
