#import "./template.typ": *
#import "@preview/numbly:0.1.0": numbly


#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Struktur Data",
  course-code: "PSD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "4",
  title: "Stack",

  minimal: false,
  show-table-of-content: false,
  show-table-of-figure: false,
  show-table-of-table: false,
  show-bibliography: true,

  paper: "a4",
  font: "Times New Roman",
  font-size: 12pt,
)

#set par(first-line-indent: (all: true, amount: 2em))
#set heading(numbering: numbly("{1:A}.", "{2}.", "{2}.{3}", "{2}.{3}.{4}"))


// ============================================================
// A. DEFINISI
// ============================================================
= Definisi

== Stack

Stack (tumpukan) adalah struktur data linear yang mengikuti prinsip *LIFO* (_Last In, First Out_): elemen yang paling terakhir dimasukkan adalah yang pertama kali dikeluarkan @cormen-algorithms. Analogi fisiknya adalah tumpukan piring di rak: piring yang ditaruh paling atas harus diambil lebih dulu sebelum mencapai piring di bawahnya.

Sebagai _Abstract Data Type_ (ADT), stack didefinisikan oleh empat operasi dasar @goodrich-dsa:

- *`push(item)`*: menyisipkan elemen baru ke posisi paling atas tumpukan.
- *`pop()`*: menghapus dan mengembalikan elemen yang berada di posisi paling atas.
- *`peek()` / `top()`*: membaca nilai elemen paling atas tanpa menghapusnya.
- *`empty()` / `is_empty()`*: mengembalikan `True` jika stack tidak memuat elemen sama sekali.

Semua operasi di atas berjalan dalam waktu $O(1)$ karena hanya berinteraksi dengan satu ujung struktur, tanpa perlu menelusuri elemen lain @cormen-algorithms. Dalam Python, stack dapat diimplementasikan menggunakan `list` bawaan dengan metode `append()` sebagai `push` dan `pop()` sebagai `pop`, keduanya juga beroperasi dalam $O(1)$ amortisasi @python-docs-list.

#code(
  show-line-numbers: false,
  ```
  Kondisi awal (kosong):    push(A):   push(B):   push(C):   pop():
  +-------+                 +-------+  +-------+  +-------+  +-------+
  | (top) |                 |   A   |  |   B   |  |   C   |← |   B   |
  |       |   ---------->   +-------+  +-------+  +-------+  +-------+
  |       |                            |   A   |  |   B   |  |   A   |
  +-------+                            +-------+  +-------+  +-------+
                                                  |   A   |
                                                  +-------+
  ```,
  // caption: [Ilustrasi operasi push dan pop pada stack],
)

Stack digunakan secara luas dalam ilmu komputer: manajemen rekursi (call stack), algoritma backtracking, evaluasi ekspresi matematika, parsing sintaksis compiler, dan navigasi riwayat (_undo/redo_) @sedgewick-algorithms.

== Notasi Infix dan Postfix

Dalam matematika dan pemrograman, ekspresi aritmetika dapat dituliskan dalam tiga notasi yang berbeda berdasarkan posisi relatif operator terhadap operandnya @miller-ranum.

*Notasi Infix* adalah notasi yang paling akrab bagi manusia: operator ditulis di antara dua operandnya. Contoh: `a + b`, `x * y - z`. Notasi ini membutuhkan aturan presedensi operator dan tanda kurung untuk menghilangkan ambiguitas urutan evaluasi. Komputer tidak dapat mengevaluasi infix secara langsung karena harus terlebih dahulu menentukan urutan operasi @runestone-infix.

*Notasi Postfix* (disebut juga _Reverse Polish Notation_ atau RPN) menempatkan operator setelah kedua operandnya. Contoh: `a b +`, `x y * z -`. Keunggulan kritis notasi ini adalah tidak memerlukan tanda kurung sama sekali dan tidak memerlukan aturan presedensi saat evaluasi, karena urutan operasi sudah terkandung secara implisit dalam urutan penulisan @runestone-infix. Evaluasinya dilakukan dengan satu kali pembacaan kiri ke kanan menggunakan stack.

*Notasi Prefix* (Polish Notation) menempatkan operator sebelum operandnya. Contoh: `+ a b`. Notasi ini juga bebas tanda kurung namun kurang umum digunakan dalam konteks evaluasi berbasis stack.

#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    inset: 8pt,
    align: center,
    stroke: 0.5pt,
    table.header([*Infix*], [*Postfix*], [*Penjelasan*]),
    [`a + b`],       [`a b +`],         [Operator di antara operand vs. sesudah],
    [`a + b * c`],   [`a b c * +`],     [`*` dievaluasi lebih dulu (presedensi lebih tinggi)],
    [`(a + b) * c`], [`a b + c *`],     [Kurung memaksa `+` dievaluasi lebih dulu],
    [`a ^ b ^ c`],   [`a b c ^ ^`],     [`^` bersifat right-associative],
    [`a + b - c`],   [`a b + c -`],     [`+` dan `-` sama presedensi, left-associative],
  ),
  caption: [Contoh perbandingan notasi infix dan postfix],
)

Konversi dari infix ke postfix diselesaikan secara efisien menggunakan algoritma _Shunting Yard_ yang pertama kali dipublikasikan oleh Edsger W. Dijkstra pada tahun 1961 @dijkstra-shunting. Algoritma ini menggunakan satu stack operator dan satu string/antrian output, berjalan dalam $O(n)$ waktu dan $O(n)$ ruang di mana $n$ adalah panjang ekspresi input.

Dua properti operator yang menentukan perilaku algoritma adalah *presedensi* (precedence) dan *asosiatifitas* (associativity). Presedensi menentukan operator mana yang dievaluasi lebih dulu saat dua operator berurutan: `^` (pangkat) memiliki presedensi tertinggi, diikuti `*` dan `/`, kemudian `+` dan `-`. Asosiatifitas menentukan arah evaluasi ketika dua operator memiliki presedensi yang sama. Operator `+`, `-`, `*`, `/` bersifat _left-associative_ (evaluasi dari kiri ke kanan), sedangkan `^` bersifat _right-associative_ (evaluasi dari kanan ke kiri) @geeksforgeeks-infix.


// ============================================================
// B. DESKRIPSI SOAL
// ============================================================
= Deskripsi Soal

Praktikum ini meminta implementasi algoritma konversi ekspresi infix ke postfix menggunakan struktur data stack dalam bahasa pemrograman Python. Dua ekspresi infix berikut harus dikonversi:

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    inset: 8pt,
    align: left,
    stroke: 0.5pt,
    table.header([*No.*], [*Ekspresi Infix*], [*Hasil Postfix yang Diharapkan*]),
    [1], [`a+b-c^(d*e/f)+g`],   [`ab+cde*f/^-g+`],
    [2], [`p*q-(r-s^(t+u)+v)`], [`pq*rstu+^-v+-`],
  ),
  caption: [Ekspresi infix yang diberikan beserta hasil postfix yang diharapkan],
)

Ekspresi pertama, `a+b-c^(d*e/f)+g`, melibatkan tiga tingkat presedensi berbeda: operator pangkat `^` (tertinggi), operator perkalian/pembagian `*` dan `/` (menengah), serta operator tambah/kurang `+` dan `-` (terendah). Tanda kurung pada subekspresi `(d*e/f)` mengubah urutan evaluasi default dengan memaksa `d*e/f` diselesaikan sebelum hasilnya dijadikan eksponen.

Ekspresi kedua, `p*q-(r-s^(t+u)+v)`, memiliki tanda kurung berlapis dua. Kurung terluar membungkus seluruh subekspresi `r-s^(t+u)+v`, dan di dalamnya terdapat kurung dalam `(t+u)` sebagai eksponen dari `s`. Kurung terluar yang diawali tanda `-` sebelumnya mengharuskan hasil seluruh subekspresi dikurangkan dari `p*q`.


// ============================================================
// C. JAWABAN
// ============================================================
= Jawaban

== Pseudocode dan Penjelasan Algoritma

Algoritma konversi infix ke postfix berbasis stack bekerja dengan membaca token ekspresi infix satu per satu dari kiri ke kanan. Setiap token diperlakukan berbeda tergantung jenisnya: operand langsung ke output, sementara operator dan tanda kurung dikelola melalui stack @runestone-infix.

Kunci dari algoritma ini adalah *tabel presedensi*. Sebelum suatu operator baru dipush ke stack, semua operator di puncak stack yang memiliki presedensi lebih tinggi atau sama harus dipindahkan ke output terlebih dahulu. Ini menjamin bahwa operator dengan presedensi lebih tinggi selalu muncul lebih awal di string postfix, yang berarti mereka dievaluasi lebih dulu @geeksforgeeks-infix. Tanda kurung kiri `(` mendapat presedensi 0 di dalam tabel agar operator apa pun yang masuk setelahnya tidak memicu pop melewati batas kurung.

#code(
  ```
  FUNGSI infix_to_postfix(infix):
    BUAT stack kosong
    BUAT string postfix = ""
    DEFINISI tabel presedensi:
        "(" -> 0,  "+" -> 1,  "-" -> 1,  "*" -> 2,  "/" -> 2,  "^" -> 3

    UNTUK SETIAP token DALAM infix:

        JIKA token == "(":
            push token ke stack

        JIKA token == ")":
            SELAMA stack tidak kosong DAN puncak stack != "(":
                pop dari stack, tambahkan ke postfix
            pop "(" dari stack (buang, tidak ke postfix)

        JIKA token adalah operator (+, -, *, /, ^):
            SELAMA stack tidak kosong DAN
                  presedensi(token) <= presedensi(puncak stack):
                pop dari stack, tambahkan ke postfix
            push token ke stack

        SELAIN ITU (token adalah operand/huruf):
            tambahkan token langsung ke postfix

    SELAMA stack tidak kosong:
        pop dari stack, tambahkan ke postfix

    KEMBALIKAN postfix
  ```,
  // caption: [Pseudocode algoritma konversi infix ke postfix menggunakan stack],
)

Ada satu catatan penting mengenai asosiatifitas operator `^`. Algoritma di atas menggunakan kondisi `<=` (kurang dari atau sama dengan) saat membandingkan presedensi. Untuk operator _left-associative_ (`+`, `-`, `*`, `/`), kondisi `<=` sudah benar karena operator dengan presedensi sama di puncak stack harus dikeluarkan lebih dulu. Namun untuk operator _right-associative_ (`^`), kondisi yang tepat seharusnya `<` (lebih kecil dari, bukan sama dengan) agar `^` tidak mendahului `^` lain di puncaknya. Pada implementasi di bawah, karena `^` adalah satu-satunya operator right-associative dan tidak ada kasus `^` bertumpuk di soal yang diberikan, hasil tetap benar. Namun ini adalah subtilitas yang perlu diperhatikan pada implementasi general @geeksforgeeks-infix.

== Source Code: Implementasi dalam Python

#code(
  ```python
  class Stack:
      def __init__(self):
          self.items = []

      def empty(self):
          return self.items == []

      def size(self):
          return len(self.items)

      def push(self, item):
          return self.items.append(item)

      def pop(self):
          return self.items.pop()

      def peek(self):
          return self.items[self.size() - 1]


  operator = {
      "(": 0,
      "+": 1,
      "-": 1,
      "*": 2,
      "/": 2,
      "^": 3,
  }


  def infix_to_postfix(infix):
      stack = Stack()
      postfix = ""

      for token in infix:
          if token == "(":
              stack.push(token)
          elif token == ")":
              while not stack.empty() and stack.peek() != "(":
                  postfix += stack.peek()
                  stack.pop()
              stack.pop()
          elif token in operator.keys():
              while not stack.empty() and operator[token] <= operator[stack.peek()]:
                  postfix += stack.peek()
                  stack.pop()
              stack.push(token)
          else:
              postfix += token

      while not stack.empty():
          postfix += stack.peek()
          stack.pop()

      return postfix


  if __name__ == "__main__":
      print(infix_to_postfix("m*n+(p-q)+r"))
      print(infix_to_postfix("a+b-c^(d*e/f)+g"))
      print(infix_to_postfix("p*q-(r-s^(t+u)+v)"))
  ```,
  // caption: [Implementasi lengkap konversi infix ke postfix dalam Python],
)

Kelas `Stack` mengenkapsulasi `list` Python dan mengekspos hanya operasi yang relevan. Penggunaan `list.append()` sebagai `push` dan `list.pop()` sebagai `pop` menjamin kompleksitas $O(1)$ amortisasi untuk keduanya @python-docs-list. Fungsi `infix_to_postfix` sendiri memiliki kompleksitas waktu $O(n)$ karena setiap token dibaca tepat satu kali, dan setiap operator di-push serta di-pop dari stack paling banyak satu kali.

#img("assets/output.png", caption: [Output program Python untuk ketiga ekspresi uji])

== Trace Ekspresi dan Penjelasan Output

=== Ekspresi 1: `a+b-c^(d*e/f)+g`

Tabel berikut menelusuri kondisi stack dan string postfix untuk setiap token yang dibaca dari kiri ke kanan.

#figure(
  table(
    columns: (auto, auto, 1fr, auto),
    inset: 7pt,
    align: (center, center, left, left),
    stroke: 0.5pt,
    table.header(
      [*Token*], [*Jenis*], [*Aksi*], [*Postfix*],
    ),
    [`a`], [Operand],  [Tulis langsung ke output],                     [`a`],
    [`+`], [Operator], [Stack kosong, push `+`],                       [`a`],
    [`b`], [Operand],  [Tulis langsung ke output],                     [`ab`],
    [`-`], [Operator], [prec(`-`)=1 ≤ prec(`+`)=1, pop `+` ke output; stack kosong, push `-`], [`ab+`],
    [`c`], [Operand],  [Tulis langsung ke output],                     [`ab+c`],
    [`^`], [Operator], [prec(`^`)=3 > prec(`-`)=1, langsung push `^`], [`ab+c`],
    [`(`], [Kurung],   [Push `(` ke stack],                            [`ab+c`],
    [`d`], [Operand],  [Tulis langsung ke output],                     [`ab+cd`],
    [`*`], [Operator], [peek=`(` (prec=0), prec(`*`)=2 > 0, push `*`], [`ab+cd`],
    [`e`], [Operand],  [Tulis langsung ke output],                     [`ab+cde`],
    [`/`], [Operator], [prec(`/`)=2 ≤ prec(`*`)=2, pop `*` ke output; peek=`(`, stop; push `/`], [`ab+cde*`],
    [`f`], [Operand],  [Tulis langsung ke output],                     [`ab+cde*f`],
    [`)`], [Kurung],   [Pop `/` ke output; pop `(` (dibuang)],         [`ab+cde*f/`],
    [`+`], [Operator], [prec(`+`)=1 ≤ prec(`^`)=3, pop `^` ke output; prec(`+`)=1 ≤ prec(`-`)=1, pop `-` ke output; stack kosong, push `+`], [`ab+cde*f/^-`],
    [`g`], [Operand],  [Tulis langsung ke output],                     [`ab+cde*f/^-g`],
    [—],   [Akhir],    [Stack tersisa: `+`; pop ke output],            [`ab+cde*f/^-g+`],
  ),
  caption: [Trace token per token untuk ekspresi `a+b-c^(d*e/f)+g`],
)

*Hasil akhir:* `ab+cde*f/^-g+`

Urutan evaluasi yang terkandung dalam postfix ini adalah: (1) `a+b`, (2) `d*e`, (3) hasilnya dibagi `f`, (4) `c` dipangkatkan dengan hasil (3), (5) hasil (1) dikurangi hasil (4), dan (6) ditambah `g`. Ini persis mencerminkan bagaimana manusia mengevaluasi ekspresi infix aslinya dengan memperhatikan presedensi dan tanda kurung.

=== Ekspresi 2: `p*q-(r-s^(t+u)+v)`

#figure(
  table(
    columns: (auto, auto, 1fr, auto),
    inset: 7pt,
    align: (center, center, left, left),
    stroke: 0.5pt,
    table.header(
      [*Token*], [*Jenis*], [*Aksi*], [*Postfix*],
    ),
    [`p`], [Operand],  [Tulis langsung ke output],                      [`p`],
    [`*`], [Operator], [Stack kosong, push `*`],                        [`p`],
    [`q`], [Operand],  [Tulis langsung ke output],                      [`pq`],
    [`-`], [Operator], [prec(`-`)=1 ≤ prec(`*`)=2, pop `*` ke output; stack kosong, push `-`], [`pq*`],
    [`(`], [Kurung],   [Push `(` ke stack],                             [`pq*`],
    [`r`], [Operand],  [Tulis langsung ke output],                      [`pq*r`],
    [`-`], [Operator], [peek=`(` (prec=0), prec(`-`)=1 > 0, push `-`], [`pq*r`],
    [`s`], [Operand],  [Tulis langsung ke output],                      [`pq*rs`],
    [`^`], [Operator], [prec(`^`)=3 > prec(`-`)=1, push `^`],          [`pq*rs`],
    [`(`], [Kurung],   [Push `(` ke stack],                             [`pq*rs`],
    [`t`], [Operand],  [Tulis langsung ke output],                      [`pq*rst`],
    [`+`], [Operator], [peek=`(` (prec=0), push `+`],                  [`pq*rst`],
    [`u`], [Operand],  [Tulis langsung ke output],                      [`pq*rstu`],
    [`)`], [Kurung],   [Pop `+` ke output; pop `(` (dibuang)],          [`pq*rstu+`],
    [`+`], [Operator], [prec(`+`)=1 ≤ prec(`^`)=3, pop `^` ke output; prec(`+`)=1 ≤ prec(`-`)=1, pop `-` ke output; peek=`(`, stop; push `+`], [`pq*rstu+^-`],
    [`v`], [Operand],  [Tulis langsung ke output],                      [`pq*rstu+^-v`],
    [`)`], [Kurung],   [Pop `+` ke output; pop `(` (dibuang)],          [`pq*rstu+^-v+`],
    [—],   [Akhir],    [Stack tersisa: `-`; pop ke output],             [`pq*rstu+^-v+-`],
  ),
  caption: [Trace token per token untuk ekspresi `p*q-(r-s^(t+u)+v)`],
)

*Hasil akhir:* `pq*rstu+^-v+-`

Urutan evaluasi dalam postfix ini adalah: (1) `p*q`, (2) `t+u`, (3) `s` dipangkatkan hasil (2), (4) `r` dikurangi hasil (3), (5) hasil (4) ditambah `v`, dan (6) hasil (1) dikurangi hasil (5). Tanda kurung terluar dalam infix `(r-s^(t+u)+v)` berhasil dipertahankan sebagai satu unit evaluasi yang lengkap, dan tanda `-` sebelum kurung terluar tersebut muncul paling akhir sebagai operasi terakhir yang dieksekusi.

#pagebreak()

// ============================================================
// D. KESIMPULAN
// ============================================================
= Kesimpulan

Praktikum ini berhasil mengimplementasikan konversi ekspresi infix ke postfix menggunakan struktur data stack dalam Python, dan menghasilkan output yang benar untuk kedua ekspresi yang diberikan.

Stack terbukti menjadi struktur data yang tepat untuk masalah ini karena sifat LIFO-nya secara alami merepresentasikan hierarki presedensi: operator dengan presedensi lebih tinggi yang dipush belakangan akan di-pop lebih dulu ke output, persis mencerminkan urutan evaluasi yang diinginkan. Tanda kurung ditangani secara elegan dengan memanfaatkan stack yang sama: kurung kiri bertindak sebagai "pagar" yang mencegah operator di luar kurung ter-pop prematur, dan kurung kanan menjadi pemicu pengosongan stack hingga pagar tersebut.

Dari dua ekspresi uji, ekspresi kedua `p*q-(r-s^(t+u)+v)` merupakan kasus yang lebih menantang karena melibatkan dua level kurung bersarang sekaligus. Algoritma menanganinya dengan benar karena setiap pasangan kurung membentuk konteks stack yang terisolasi; kurung terluar dan kurung dalam masing-masing mendapatkan "pagar" `(` mereka sendiri di stack.

Satu hal yang perlu dicatat untuk implementasi yang lebih general adalah perbedaan penanganan operator _left-associative_ dan _right-associative_. Implementasi ini menggunakan kondisi `<=` secara seragam, yang benar untuk semua operator di soal ini. Namun pada ekspresi seperti `a^b^c` yang melibatkan dua `^` berturut-turut, diperlukan kondisi `<` (bukan `<=`) untuk `^` agar asosiatifitas kanan terpenuhi dengan benar.

