#set document(title: "Tugas Statistika 2026")
#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2.5cm),
)
#set text(font: "Times New Roman", size: 12pt, lang: "id")
#set par(justify: true, leading: 0.65em)
#show heading: it => {
  set text(size: 12pt, weight: "bold")
  it
}

// Header
#align(center)[
  #text(weight: "bold", size: 13pt)[TUGAS STATISTIKA] \
  #v(0.3em)
  #text(size: 11pt)[Kelas PL2BB — Semester Genap 2025/2026]
]

#line(length: 100%, stroke: 0.5pt)
#v(0.5em)

#grid(
  columns: (3cm, auto),
  row-gutter: 0.4em,
  [*Nama*], [: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_],
  [*NIM*],  [: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_],
  [*Kelas*],[: \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_],
)

#v(0.4em)
#line(length: 100%, stroke: 0.5pt)

*Ketentuan:*
- Kerjakan semua soal dan kumpulkan dalam bentuk file PDF.
- Penamaan file: #text(style: "italic")[Tugas\_Statistika\_2026 – NAMA\_KELAS – nama\_mahasiswa – NIM]
- Kumpulkan sebelum pelaksanaan UAS mata kuliah Statistika Kelas PL2BB Semester Genap 2025/2026 melalui tautan yang telah disediakan.

#line(length: 100%, stroke: 0.5pt)
#v(1em)

// ── BAGIAN I ──────────────────────────────────────────────
#align(center)[#text(weight: "bold")[BAGIAN I: DISTRIBUSI PROBABILITAS]]
#v(0.5em)

#set enum(numbering: "1.", indent: 0em, body-indent: 0.5em)

+ Apa yang dimaksud dengan *distribusi probabilitas*, dan mengapa konsep tersebut penting dalam statistika?

+ Jelaskan perbedaan antara *variabel acak diskrit* dan *variabel acak kontinu*. Berikan masing-masing dua contoh dalam kehidupan sehari-hari.

+ Sebuah dadu enam sisi dilempar sekali. Buatlah tabel distribusi probabilitas untuk variabel acak yang menyatakan angka yang muncul.

+ Sebuah permainan memberikan hadiah Rp10.000 jika muncul angka genap dan Rp20.000 jika muncul angka ganjil pada pelemparan dadu. Hitung *nilai harapan* dari hadiah yang diperoleh pemain.

+ Apa perbedaan antara *nilai harapan*, *varians*, dan *standar deviasi* dalam distribusi probabilitas? Mengapa varians diperlukan selain nilai harapan?

+ Sebuah perusahaan mengetahui bahwa peluang produk cacat adalah 5%. Jika dipilih 20 produk secara acak, berapakah probabilitas *tepat 2 produk* yang cacat?

+ Sebuah pusat layanan pelanggan menerima rata-rata 4 panggilan per jam. Berapakah probabilitas menerima *tepat 6 panggilan* dalam satu jam tertentu?

+ Mengapa distribusi normal sering disebut sebagai distribusi yang paling penting dalam statistika? Sebutkan minimal *tiga karakteristik utamanya*.

+ Tentukan distribusi probabilitas yang paling sesuai untuk masing-masing kasus berikut dan jelaskan alasannya:
  #set enum(numbering: "a.", indent: 1em, body-indent: 0.5em)
  + Jumlah email yang diterima per jam.
  + Tinggi badan mahasiswa.
  + Jumlah kepala yang muncul saat melempar 10 koin.
  + Waktu tunggu pelanggan di bank.

#set enum(numbering: "1.", indent: 0em, body-indent: 0.5em)

+ Sebuah ujian memiliki nilai yang berdistribusi normal dengan rata-rata 70 dan standar deviasi 10. Seorang mahasiswa memperoleh nilai 90. Bagaimana Anda menginterpretasikan posisi mahasiswa tersebut dibandingkan peserta lainnya?

+ Dalam pengembangan sistem kecerdasan buatan atau _machine learning_, mengapa pemahaman distribusi probabilitas menjadi sangat penting? Berikan contoh penerapannya.

#v(1em)
// ── BAGIAN II ─────────────────────────────────────────────
#align(center)[#text(weight: "bold")[BAGIAN II: ANALISIS REGRESI]]
#v(0.5em)

+ Apa yang dimaksud dengan *analisis regresi*? Jelaskan tujuan utama penggunaan regresi dalam statistika dan berikan satu contoh penerapannya dalam kehidupan nyata.

+ Jelaskan perbedaan antara *variabel dependen (terikat)* dan *variabel independen (bebas)*. Dalam studi yang meneliti pengaruh lama belajar terhadap nilai ujian mahasiswa, variabel manakah yang menjadi dependen dan independen?

+ Apa perbedaan antara *korelasi* dan *regresi*? Apakah dua variabel yang memiliki korelasi tinggi selalu menunjukkan hubungan sebab-akibat? Jelaskan.

+ Jelaskan makna dari persamaan regresi linear sederhana berikut:
  $ Y = a + b X $
  Apa arti parameter $a$ (intercept) dan $b$ (slope/koefisien regresi)?

+ Diketahui hasil regresi:
  $ "Nilai_Ujian" = 45 + 3{,}5 times "Lama_Belajar" $
  Bagaimana Anda menginterpretasikan angka *45* dan *3,5* dalam konteks penelitian tersebut?

+ Jika diperoleh model regresi:
  $ Y = 20 + 5X $
  Berapakah nilai prediksi $Y$ ketika $X = 8$? Jelaskan langkah perhitungannya.

+ Apa yang dimaksud dengan *koefisien determinasi* ($R^2$)? Jika suatu model memiliki nilai $R^2 = 0{,}85$, bagaimana interpretasinya?

+ Sebutkan dan jelaskan minimal *empat asumsi penting* dalam regresi linear. Apa konsekuensinya jika salah satu asumsi tersebut dilanggar?

+ Apa perbedaan antara *regresi linear sederhana* dan *regresi linear berganda*? Berikan contoh kasus yang lebih tepat diselesaikan menggunakan regresi linear berganda.

+ Sebuah universitas ingin memprediksi IPK mahasiswa berdasarkan jumlah jam belajar per minggu, tingkat kehadiran kuliah, dan nilai ujian masuk. Bagaimana Anda merancang model regresi untuk kasus tersebut? Jelaskan:
  #set list(indent: 1em)
  - Variabel dependen
  - Variabel independen
  - Jenis regresi yang digunakan
  - Cara mengevaluasi kualitas model

#set enum(numbering: "1.", indent: 0em, body-indent: 0.5em)

+ Sebuah model regresi menghasilkan nilai $R^2$ yang tinggi (0,95), tetapi prediksi pada data baru menunjukkan kesalahan yang besar. Mengapa hal tersebut dapat terjadi? Jelaskan kaitannya dengan fenomena *overfitting*.

#v(2em)
#line(length: 100%, stroke: 0.5pt)
#align(center)[#text(size: 10pt, style: "italic")["Kerjakan dengan jujur dan mandiri."]]
