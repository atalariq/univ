# Pertemuan 7: Kompresi Data dengan Algoritme Huffman

Deck ini membahas Huffman Code, teknik kompresi yang ditemukan pada 1951 saat pendirinya menempuh pendidikan doktoral di MIT (hlm. 2). Binary tree pada Huffman Code disebut sebagai dasar kompresi data berformat ZIP, dan teknik yang sama juga dipakai sebagai salah satu penyusun format gambar JPEG serta format musik MP3 (hlm. 2).

Mekanisme kompresinya dibagi menjadi tiga tahap: pembentukan Huffman Tree, penentuan Huffman Code, dan kompresi data dengan algoritme tersebut (hlm. 3). Pembentukan tree mengikuti enam langkah. Karakter diurutkan dari frekuensi terkecil, dua komponen teratas dijadikan leaf node, keduanya diberi parent baru yang frekuensinya adalah jumlah frekuensi kedua anak, komponen yang sudah dipakai dihapus dari tabel, node baru dimasukkan kembali ke tabel, dan proses diulang sampai tabel habis (hlm. 4).

Contoh yang dipakai adalah kalimat "LOGIKA ALGORITMA" (hlm. 5). Tabel frekuensinya berisi K, R, T, M, dan sp masing-masing 1, L, O, G, dan I masing-masing 2, serta A sebanyak 3. Penggabungan berjalan bertahap dan menghasilkan node baru bertanda bintang: *1 dari K dan R, *2 dari T dan M, *3 dari sp dan *1, *4 dari *2 dan L, *5 dari O dan G, *6 dari I dan *3, *7 dari A dan *4, *8 dari *5 dan *6, lalu *9 dari *7 dan *8 dengan frekuensi 16 (hlm. 5-9). Setelah tabel kosong, tree dinyatakan selesai. Sambungan ke kaki kiri ditandai satu nilai dan sambungan ke kaki kanan nilai lainnya, sehingga setiap karakter memperoleh rangkaian bit sendiri.

Tabel kode yang dihasilkan adalah K 11110, R 11111, T 0100, M 0101, sp 1110, L 011, O 100, G 101, I 110, dan A 00 (hlm. 9). Terlihat bahwa A sebagai karakter paling sering hanya mendapat 2 bit, sedangkan karakter berfrekuensi 1 mendapat 5 bit. Untuk menyimpan 16 karakter secara normal dibutuhkan 16 x 8 = 128 bit, sedangkan dengan Huffman Code hanya 52 bit, sehingga compression rate-nya 59,4% menurut rumus (128-52)/128 x 100% (hlm. 10). Compression rate dijelaskan sebagai besarnya bit yang berhasil dihemat dibandingkan jumlah bit semula.

Materi menutup dengan dua catatan. Pertama, algoritme pembentukan tree memastikan karakter yang sering muncul mendapat jumlah bit sekecil mungkin, sehingga makin sering karakter berbit pendek dipakai, makin tinggi compression rate yang tercapai (hlm. 11). Kedua, diberikan tantangan untuk membuat Huffman Tree dari kalimat "HARI RABU PAGI-PAGI IBU BUDI BACA BUKU SAMPAI HALAMAN SERIBU" (hlm. 12).

## Poin kunci

- Huffman Code memakai binary tree sebagai dasar, dan tekniknya dipakai pada ZIP, JPEG, dan MP3 (hlm. 2).
- Dua komponen berfrekuensi terkecil selalu digabung lebih dulu menjadi satu parent (hlm. 4).
- Frekuensi parent adalah jumlah frekuensi kedua anaknya, dan tabel harus tetap terurut setelah penggabungan (hlm. 5).
- Proses berhenti ketika tabel hanya menyisakan satu node, yaitu akar tree (hlm. 9).
- Karakter paling sering mendapat kode terpendek, pada contoh A hanya 2 bit (hlm. 9).
- Kalimat 16 karakter turun dari 128 bit menjadi 52 bit, dengan compression rate 59,4% (hlm. 10).

## Istilah

- Huffman Code: kode biner dengan panjang berbeda yang dibentuk dari pohon frekuensi karakter.
- Huffman Tree: binary tree yang dibangun dengan menggabungkan dua frekuensi terkecil berulang kali.
- leaf node: node daun yang memuat satu karakter dan frekuensinya.
- parent node: node baru hasil penggabungan dua node anak.
- frekuensi: jumlah kemunculan sebuah karakter pada teks.
- compression rate: persentase bit yang dihemat dibandingkan ukuran semula.
- bit: satuan data biner yang dipakai menyandikan karakter pada kode Huffman.

## Sumber

- `kompresi-data-dengan-algoritme-huffman.local.pdf`, hlm. 2-4 (latar dan langkah pembentukan tree)
- `kompresi-data-dengan-algoritme-huffman.local.pdf`, hlm. 5-9 (contoh dan tabel kode)
- `kompresi-data-dengan-algoritme-huffman.local.pdf`, hlm. 10-12 (compression rate dan tantangan)
