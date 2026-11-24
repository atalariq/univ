# Pertemuan 2: Determinan Matriks

Materi dibuka dengan rumus determinan matriks 3x3 yang dihitung langsung. Untuk A = [a_ij], det(A) dihitung dari enam suku hasil kali tiga entri: tiga suku bertanda positif mengikuti arah diagonal turun, tiga suku bertanda negatif mengikuti arah diagonal naik (hlm. 2). Slide menampilkan bentuk penulisan praktisnya, yaitu matriks 3x3 yang dua kolom pertamanya disalin di sebelah kanan agar diagonal mudah ditelusuri (hlm. 2). Contoh menghitung det(B) untuk B berisi 3, 2, -1 pada baris pertama menghasilkan 1 (hlm. 3).

Metode kedua memakai ekspansi kofaktor. Minor M_ij didefinisikan sebagai determinan matriks A setelah baris ke-i dan kolom ke-j dihilangkan (hlm. 4). Kofaktor C_ij adalah (-1)^(i+j) M_ij, sehingga tanda kofaktor mengikuti pola bergantian +, -, + pada baris pertama (hlm. 5). Contoh pada slide menghitung C12 untuk matriks 3x3 dan memperoleh -2 (hlm. 5).

Determinan dapat dihitung dengan ekspansi sepanjang baris ke-i, yaitu jumlah a_ij C_ij untuk seluruh j, atau sepanjang kolom ke-j dengan jumlah a_ij C_ij untuk seluruh i (hlm. 6). Contoh yang sama dengan sebelumnya dihitung ulang lewat ekspansi baris ketiga: kofaktor C31 = 1, C32 = -2, dan C33 = 3, sehingga det(A) = 0(1) + 1(-2) + 2(3) = 4 (hlm. 7-8). Slide tidak membahas sifat determinan lain, aturan Cramer, atau hubungan determinan dengan singularitas matriks.

## Poin kunci

- Determinan 3x3 dapat dihitung langsung dengan enam suku diagonal (hlm. 2).
- Minor M_ij adalah determinan setelah baris i dan kolom j dihapus (hlm. 4).
- Kofaktor C_ij = (-1)^(i+j) M_ij, tandanya bergantian menurut posisi (hlm. 5).
- Ekspansi kofaktor boleh sepanjang baris mana pun atau kolom mana pun (hlm. 6).
- Memilih baris atau kolom yang banyak nolnya mempersingkat perhitungan (hlm. 7).
- Contoh yang sama menghasilkan det = 4 lewat ekspansi baris ketiga (hlm. 7-8).

## Istilah

- determinan: nilai skalar yang dihitung dari entri matriks persegi
- minor: determinan submatriks setelah satu baris dan satu kolom dihapus
- kofaktor: minor yang dikalikan tanda (-1)^(i+j)
- ekspansi kofaktor: penjumlahan hasil kali entri dengan kofaktornya sepanjang satu baris atau kolom

## Sumber

- `determinan-matriks.local.pdf`, hlm. 2-8
