# Pertemuan 4: Sistem Persamaan Linier

Sistem persamaan linier (SPL) ditulis dalam bentuk umum m persamaan dengan n variabel x1 sampai xn, koefisien a_ij, dan konstanta b_i (hlm. 2). SPL disebut konsisten bila punya penyelesaian, yaitu tunggal atau banyak, dan tidak konsisten bila tidak punya penyelesaian (hlm. 2). Untuk dua persamaan dua variabel, penyelesaiannya adalah titik potong dua garis: garis sejajar berarti tidak ada penyelesaian, berpotongan berarti satu, dan berhimpitan berarti tak hingga (hlm. 3).

SPL dapat disajikan sebagai AX = B dengan A matriks koefisien, X vektor variabel, dan B vektor konstanta; matriks lengkapnya menambahkan kolom B ke A (hlm. 22-23). Strategi penyelesaian adalah mengganti SPL lama dengan SPL ekuivalen yang lebih sederhana (hlm. 4). Alatnya tiga operasi baris elementer: mengalikan baris dengan konstanta tak nol, menukar dua baris, dan menambahkan kelipatan satu baris ke baris lain (hlm. 5). Contoh panjang menurunkan SPL tiga variabel sampai x = 1, y = 2, z = 3; prosedur ini disebut metoda eliminasi Gauss (hlm. 6-8).

Bentuk echelon-baris dijelaskan dengan empat syarat: baris tak nol punya leading 1, baris nol dikumpulkan di bawah, leading 1 bergeser ke kanan pada baris berikutnya, dan setiap kolom yang memuat leading 1 bernilai nol pada baris lain untuk bentuk tereduksi (hlm. 9). Slide memisahkan bentuk echelon-baris yang hanya memenuhi tiga syarat pertama dari bentuk echelon-baris tereduksi (hlm. 10-12). Metoda Gauss-Jordan mengubah matriks sampai bentuk tereduksi dan dapat menghasilkan penyelesaian berparameter, misalnya x2 = r, x4 = s, dan x5 = t pada contoh dengan tak hingga penyelesaian (hlm. 14-16). Bila pengerjaan berhenti di bentuk echelon-baris, penyelesaian dilanjutkan dengan substitusi mundur dari baris terbawah (hlm. 17-19).

SPL homogen selalu punya penyelesaian trivial dan mungkin punya penyelesaian taktrivial (hlm. 20-21); slide membedakan SPL homogen dan nonhomogen (hlm. 24-25). Untuk m = n dan det(A) tidak nol, penyelesaian tunggal dapat dihitung dengan aturan Cramer x_k = det(A_k)/det(A), dengan A_k adalah A yang kolom ke-k diganti vektor b (hlm. 26-29), atau dengan invers X = A^-1 B (hlm. 30-31). Slide juga menyatakan bahwa bila m = n dan det(A) = 0 sistem mempunyai tak hingga penyelesaian, tanpa membahas kasus lain (hlm. 30). Halaman latihan hanya memuat judul tanpa soal (hlm. 32).

## Poin kunci

- SPL konsisten punya satu atau tak hingga penyelesaian, SPL tidak konsisten tidak punya (hlm. 2).
- Tiga operasi baris elementer tidak mengubah himpunan penyelesaian (hlm. 5).
- Eliminasi Gauss berhenti di bentuk echelon-baris, lalu memakai substitusi mundur (hlm. 19).
- Gauss-Jordan melanjutkan sampai bentuk echelon-baris tereduksi (hlm. 14).
- Variabel tanpa leading 1 menjadi parameter pada SPL dengan tak hingga penyelesaian (hlm. 16).
- Aturan Cramer dan metode invers hanya dipakai saat det(A) tidak nol (hlm. 26-30).

## Istilah

- SPL: sistem persamaan linier
- konsisten: SPL yang punya penyelesaian
- matriks koefisien: matriks A yang memuat semua a_ij
- matriks lengkap: matriks A yang ditambah kolom konstanta B
- operasi baris elementer: tiga operasi yang menjaga penyelesaian SPL
- leading 1: elemen tak nol pertama pada baris yang bernilai 1
- bentuk echelon-baris: matriks dengan leading 1 bergeser ke kanan dan baris nol di bawah
- substitusi mundur: penyelesaian dari baris terbawah ke atas
- SPL homogen: SPL dengan semua konstanta nol
- penyelesaian trivial: penyelesaian dengan semua variabel nol
- aturan Cramer: rumus x_k = det(A_k)/det(A)

## Sumber

- `sistem-persamaan-linier.local.pdf`, hlm. 2-32
- `rekaman-kuliah-avm-spl.local.mp4` (tidak ditranskrip)
