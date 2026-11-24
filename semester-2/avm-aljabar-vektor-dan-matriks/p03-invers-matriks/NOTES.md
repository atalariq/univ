# Pertemuan 3: Invers Matriks

Invers matriks A adalah matriks B yang bila dikalikan dengan A menghasilkan matriks identitas I, jadi AB = I dan juga A^-1 A = I. Notasi invers adalah A^-1 (hlm. 2). Untuk matriks 2x2, invers dihitung dengan rumus 1/(ad - bc) dikali matriks yang entrinya ditukar dan dinegasi, yaitu [[d, -b], [-c, a]] (hlm. 2).

Untuk matriks 3x3, slide memberi empat langkah: cari determinan M, transpose M menjadi M^T, cari adjoin, lalu gunakan rumus M^-1 = (1/det(M)) x adjoin(M) (hlm. 3). Contoh memakai M dengan baris 1 2 3, 0 1 4, dan 5 6 0. Determinan dihitung dengan ekspansi menghasilkan 1, lalu transposenya ditulis (hlm. 4).

Langkah berikutnya menghitung minor setiap entri matriks transpos, menyusunnya menjadi matriks kofaktor, lalu menerapkan pola tanda + - +, - + -, + - + (hlm. 5). Matriks kofaktor yang sudah diberi tanda itu menjadi adjoin M (hlm. 6). Karena det(M) = 1, hasil akhirnya sama dengan adjoin tersebut, yaitu baris -24 18 5, 20 -15 -4, dan -5 4 1 (hlm. 6). Slide tidak membahas syarat matriks singular, invers lewat operasi baris, atau penerapan invers untuk menyelesaikan sistem persamaan.

Latihan di akhir materi meminta dua hal untuk delapan matriks yang sama: determinan dengan ekspansi kofaktor sekaligus cara hitung langsung untuk dibandingkan, dan invers masing-masing matriks (hlm. 7-8).

## Poin kunci

- Invers A adalah A^-1 dengan A^-1 A = I dan A A^-1 = I (hlm. 2).
- Invers 2x2 memakai faktor 1/(ad - bc) (hlm. 2).
- Urutan kerja 3x3: determinan, transpose, adjoin, lalu bagi dengan determinan (hlm. 3).
- Adjoin diperoleh dari matriks kofaktor yang sudah diberi pola tanda (hlm. 5-6).
- Pada contoh, det(M) = 1 sehingga M^-1 sama dengan adjoin(M) (hlm. 4-6).
- Latihan membandingkan determinan hasil ekspansi kofaktor dengan hitung langsung (hlm. 7).

## Istilah

- invers: matriks yang bila dikalikan dengan matriks asal menghasilkan identitas
- determinan: nilai yang menjadi pembagi pada rumus invers
- transpose: matriks hasil pertukaran baris dan kolom
- minor: determinan submatriks setelah satu baris dan satu kolom dihapus
- kofaktor: minor dengan tanda (-1)^(i+j)
- adjoin: transpose dari matriks kofaktor

## Sumber

- `invers-matriks.local.pdf`, hlm. 2-8
