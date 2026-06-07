#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Struktur Data",
  course-code: "PSD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: 10,
  title: "Hashtable",
)

#show: report.with(
  ..metadata,
  association: (
    program: "Teknologi Rekayasa Perangkat Lunak",
    department: "Teknik Elektro dan Informatika",
    faculty: "Sekolah Vokasi",
    university: "Universitas Gadjah Mada",
    city: "Yogyakarta",
    logo: image("assets/logo.png", width: 6cm),
  ),
  year: 2026,
  use-cover: true,
  bib: bibliography("references.bib", style: "ieee"),
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))
#set heading(numbering: "1.")
#set enum(numbering: "a.1.")

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), ..args)

#daftar-isi()

= Tujuan Praktikum

1. Memahami konsep dasar _hash table_, fungsi _hash_, dan mekanisme penanganan _collision_.
2. Mengimplementasikan struktur data _hash table_ menggunakan _dictionary_ bawaan Python untuk penyelesaian masalah komputasi.

= Dasar Teori

== Konsep Dasar Hash Table

_Hash table_ merupakan struktur data yang menyimpan pasangan _key-value_ dan menyediakan akses berbasis kunci dengan kompleksitas waktu rata-rata $O(1)$ @cormen2022. Untuk memahaminya, dapat digunakan analogi lemari loker di kantor pos. Setiap pelanggan memiliki kunci unik berupa nomor identitas. Nomor tersebut dimasukkan ke dalam sebuah mesin penghasil nomor loker, yaitu fungsi _hash_. Mesin tersebut akan selalu memberikan nomor loker yang sama untuk identitas yang sama, sehingga pelanggan dapat langsung membuka loker tanpa harus mencari satu per satu.

Struktur data ini terdiri atas sebuah _array_ yang elemen-elemennya disebut _bucket_. Setiap _bucket_ dapat menampung satu atau lebih pasangan data. Penempatan data ke dalam _bucket_ ditentukan oleh sebuah fungsi matematis yang disebut fungsi _hash_. Jika fungsi _hash_ terdistribusi secara merata, beban setiap _bucket_ akan seimbang, sehingga pencarian dapat dilakukan dalam waktu konstan @sedgewick2011.

Ilustrasi berikut menunjukkan cara kerja pemetaan kunci ke indeks _bucket_:

#rect[
  #align(center)[
    ```text
    +---------+      hash("apel")      +-----------+
    |  "apel" |  ------------------->  | bucket[3] | --> ("apel", 5000)
    +---------+                        +-----------+

    +---------+      hash("mangga")    +-----------+
    | "mangga"|  ------------------->  | bucket[0] | --> ("mangga", 7000)
    +---------+                        +-----------+

    +---------+      hash("jeruk")     +-----------+
    | "jeruk" |  ------------------->  | bucket[6] | --> ("jeruk", 4000)
    +---------+                        +-----------+
    ```
  ]
]

Pada ilustrasi di atas, setiap nama buah merupakan sebuah _key_ yang diproses oleh fungsi _hash_ untuk menentukan indeks _bucket_. Data harga buah kemudian disimpan di _bucket_ yang telah ditentukan.

== Fungsi Hash dan Collision

Fungsi _hash_ yang ideal memiliki sifat _deterministik_, yaitu untuk setiap kunci yang identik akan selalu dihasilkan indeks yang identik pula. Selain itu, fungsi tersebut harus mendistribusikan kunci secara merata di seluruh rentang indeks yang tersedia untuk meminimalkan kemungkinan terjadinya _collision_.

_Collision_ terjadi ketika dua kunci berbeda menghasilkan nilai _hash_ yang identik, sehingga keduakan dipetakan ke _bucket_ yang sama. Meskipun fungsi _hash_ yang baik dapat mengurangi frekuensi _collision_, karena ruang kunci umumnya jauh lebih besar daripada jumlah _bucket_, _collision_ tidak dapat dihindari sepenuhnya @cormen2022. Oleh karena itu, diperlukan strategi penanganan _collision_ untuk memastikan struktur data tetap berfungsi dengan benar.

Ilustrasi berikut menunjukkan kondisi _collision_ ketika dua kunci berbeda dipetakan ke indeks yang sama:

#rect[
  #align(center)[
    ```text
    +----------+      hash()      +-----------+
    | "anggur" |  ------------->  | bucket[2] | --> ("anggur", 9000)
    +----------+                  +-----------+
                                       |
    +----------+      hash()         v
    |  "melon" |  ------------->   ("melon", 6000)  <-- Collision!
    +----------+
    ```
  ]
]

Pada ilustrasi di atas, kunci `"anggur"` dan `"melon"` menghasilkan indeks yang sama, yaitu 2, sehingga terjadi _collision_ di _bucket_ tersebut.

== Strategi Penanganan Collision

Terdapat dua strategi utama dalam menangani _collision_, yaitu _separate chaining_ dan _open addressing_.

=== Separate Chaining

Pada strategi _separate chaining_, setiap _bucket_ tidak lagi menampung satu elemen tunggal, melainkan sebuah struktur data sekunder, umumnya _linked list_, yang menyimpan semua elemen yang dipetakan ke indeks tersebut @geeksforgeeks2024. Ketika _collision_ terjadi, elemen baru disisipkan ke dalam _linked list_ di _bucket_ yang bersangkutan. Pencarian pada _bucket_ tersebut dilanjutkan dengan menelusuri _linked list_ hingga kunci yang dicari ditemukan.

Implementasi manual _hash table_ dengan _separate chaining_ dapat diilustrasikan melalui kode Python berikut:

#code(header: "Implementasi Manual Hash Table dengan Separate Chaining", numbering: false)[
```python
class Node:
    def __init__(self, key, value):
        self.key = key
        self.value = value
        self.next = None

class HashTable:
    def __init__(self, capacity=10):
        self.capacity = capacity
        self.buckets = [None] * capacity

    def _hash(self, key):
        return hash(key) % self.capacity

    def insert(self, key, value):
        index = self._hash(key)
        new_node = Node(key, value)
        if self.buckets[index] is None:
            self.buckets[index] = new_node
        else:
            current = self.buckets[index]
            while current.next:
                current = current.next
            current.next = new_node

    def search(self, key):
        index = self._hash(key)
        current = self.buckets[index]
        while current:
            if current.key == key:
                return current.value
            current = current.next
        return None
```
]

Pada implementasi di atas, _array_ `self.buckets` berperan sebagai tabel _hash_ utama, sedangkan setiap elemen `Node` yang terhubung membentuk _linked list_ pada _bucket_ yang mengalami _collision_. Operasi `insert()` memiliki kompleksitas waktu rata-rata $O(1)$, namun dalam kasus terburuk, yaitu ketika semua kunci mengalami _collision_, kompleksitasnya menurun menjadi $O(n)$ karena penelusuran _linked list_ @cormen2022.

Ilustrasi visual dari _separate chaining_ adalah sebagai berikut:

#rect[
  #align(center)[
    ```text
    buckets[0] --> None
    buckets[1] --> ("apel", 5000) --> ("pisang", 3000) --> None
    buckets[2] --> None
    buckets[3] --> ("jeruk", 4000) --> None
    ```
  ]
]

Pada ilustrasi di atas, _bucket_ 1 mengalami _collision_ antara kunci `"apel"` dan `"pisang"`, sehingga keduanya disusun secara berantai dalam sebuah _linked list_.

=== Open Addressing

Strategi alternatif yang tidak memerlukan struktur data sekunder adalah _open addressing_. Pada pendekatan ini, ketika _collision_ terjadi, elemen baru ditempatkan di _bucket_ lain yang masih kosong di dalam _array_ itu sendiri. Beberapa teknik probing yang umum digunakan meliputi _linear probing_ (mencari _bucket_ berikutnya secara berurutan), _quadratic probing_ (mencari dengan langkah kuadrat), dan _double hashing_ (menggunakan fungsi _hash_ kedua untuk menentukan langkah pencarian) @cormen2022. Masing-masing teknik memiliki karakteristik distribusi beban dan sensitivitas terhadap _clustering_ yang berbeda.

== Dictionary di Python

Python menyediakan tipe data bawaan `dict` yang merupakan implementasi _hash table_ yang dioptimalkan @python-docs. Sejak Python 3.6, `dict` diimplementasikan menggunakan struktur _compact dictionary_ yang menggabungkan _hash table_ dengan _array_ berurutan untuk menjaga determinisme urutan penyisipan elemen @realpython2024.

Operasi utama pada `dict`, yaitu penyisipan (`[] =`), pencarian (`[]`), dan penghapusan (`del`), berjalan dalam kompleksitas waktu rata-rata $O(1)$ @python-docs. Implementasi internal CPython menggunakan _open addressing_ dengan kombinasi _quadratic probing_ untuk menangani _collision_. Ketika _load factor_ melebihi ambang batas tertentu, dilakukan proses _resize_ yang menjalankan kembali fungsi _hash_ untuk seluruh elemen pada _array_ berkapasitas lebih besar.

Berikut adalah contoh penggunaan `dict` bawaan Python untuk operasi dasar:

#code(header: "Contoh Operasi Dasar Dictionary Python", numbering: false)[
```python
# 1. Membuat dictionary
harga_buah = {"apel": 5000, "jeruk": 4000}

# 2. Menyisipkan elemen baru
harga_buah["mangga"] = 7000

# 3. Mengakses nilai berdasarkan kunci
print(harga_buah["apel"])   # Output: 5000

# 4. Memperbarui nilai
harga_buah["apel"] = 5500

# 5. Menghapus elemen
del harga_buah["jeruk"]

# 6. Memeriksa keanggotaan kunci
if "apel" in harga_buah:
    print("Apel tersedia")
```
]

Pada contoh di atas, variabel `harga_buah` diinisialisasi sebagai sebuah `dict`. Penyisipan elemen baru dilakukan dengan sintaks `dict[key] = value`, yang secara internal memanggil fungsi _hash_ untuk menentukan posisi penyimpanan. Pemeriksaan keanggotaan `if "apel" in harga_buah` juga berjalan dalam $O(1)$ karena hanya melibatkan satu kali pemanggilan fungsi _hash_ dan perbandingan kunci @python-docs.

= Hasil dan Pembahasan

== Implementasi Perhitungan Frekuensi Kata

Program pada `src/example_1.py` diimplementasikan untuk menghitung frekuensi kemunculan setiap kata dalam sebuah paragraf. Pendekatan berbasis _hash table_ dipilih karena memungkinkan penghitungan dalam satu kali iterasi tanpa memerlukan pengurutan terlebih dahulu.

Struktur data `dict` bawaan Python digunakan sebagai _hash table_ untuk menyimpan pasangan kata sebagai _key_ dan jumlah kemunculannya sebagai _value_. Kode program lengkap disajikan sebagai berikut:

#include-code("src/example_1.py")

Fungsi `hitung_frekuensi()` dimulai dengan membuat `dict` kosong bernama `frekuensi`. Variabel `teks` kemudian diubah menjadi huruf kecil dan dipisah per kata menggunakan `split()`. Setiap kata dibersihkan dari tanda baca dengan `strip()`, lalu dicek apakah hasilnya kosong. Jika kosong, kata tersebut dilewati dengan `continue`.

Pada bagian utama program, terdapat percabangan `if kata_bersih in frekuensi`. Jika kata sudah pernah muncul, nilainya ditambah satu. Jika belum, kata baru dimasukkan ke `dict` dengan nilai awal 1. Cara ini memungkinkan penghitungan frekuensi dilakukan dalam satu kali iterasi, tanpa perlu memeriksa seluruh daftar kata dari awal setiap kali.

Berikut merupakan hasil eksekusi program perhitungan frekuensi kata:

#img("assets/screenshot_1.png", caption: [Hasil eksekusi program perhitungan frekuensi kata yang menampilkan daftar kata unik beserta jumlah kemunculannya])

Dari hasil eksekusi, terlihat bahwa kata "hash" muncul sebanyak lima kali, kata "table" dan "python" masing-masing muncul tiga kali, kata "data" muncul dua kali, dan kata "struktur" muncul sekali. Total terdapat lima kata unik yang berhasil dihitung oleh program.

== Implementasi Dispatch Table untuk i18n

Program pada `src/example_2.py` mengimplementasikan pola _dispatch table_ untuk sistem internasionalisasi (_i18n_). Pola ini dipilih karena memungkinkan pemetaan dinamis dari kode bahasa ke fungsi penerjemah yang sesuai, sehingga perilaku program dapat berubah secara fleksibel tanpa struktur percabangan `if-elif-else` yang panjang.

Kode program lengkap disajikan sebagai berikut:

#include-code("src/example_2.py")

Fungsi `get_translator()` membuat `dict` bernama `translators` yang memetakan kode bahasa `"id"` ke fungsi `translate_id` dan `"en"` ke fungsi `translate_en`. Fungsi ini kemudian mengembalikan hasil dari `translators.get(language, translate_en)`, yang berarti jika kode bahasa tidak ditemukan, maka fungsi `translate_en` akan digunakan sebagai pengganti.

Fungsi `translate_id()` dan `translate_en()` masing-masing memiliki `dict` lokal bernama `messages`. `Dict` ini menyimpan pasangan kunci pesan, seperti `"greeting"` atau `"menu"`, dengan teks terjemahannya. Jika kunci yang diminta tidak ada, metode `get()` akan mengembalikan teks bawaan, yaitu `"[Pesan tidak tersedia]"` untuk bahasa Indonesia dan `"[Message not available]"` untuk bahasa Inggris.

Program utama melakukan iterasi pada daftar `languages` yang berisi `["id", "en"]`. Untuk setiap bahasa, fungsi penerjemah yang sesuai diambil dari `get_translator()`, lalu dipanggil dengan berbagai kunci pesan untuk ditampilkan ke layar.

Berikut merupakan hasil eksekusi program _dispatch table_ i18n:

#img("assets/screenshot_2.png", caption: [Hasil eksekusi program dispatch table i18n yang menampilkan pesan dalam bahasa Indonesia dan Inggris])

Dari hasil eksekusi, terlihat bahwa program berhasil menampilkan teks dalam bahasa Indonesia untuk kode `"id"` dan dalam bahasa Inggris untuk kode `"en"`. Dengan menggunakan `dict` untuk memetakan kode bahasa ke fungsi penerjemah, penambahan bahasa baru dapat dilakukan hanya dengan menambahkan fungsi baru ke dalam `translators`, tanpa perlu mengubah struktur percabangan program.



= Kesimpulan

1. Konsep dasar _hash table_, fungsi _hash_, dan mekanisme penanganan _collision_ telah dipahami melalui studi teori dan implementasi praktis yang didukung ilustrasi visual.
2. Struktur data _dictionary_ bawaan Python telah berhasil diimplementasikan untuk menyelesaikan masalah perhitungan frekuensi kata dan pemetaan perilaku dinamis dengan pola _dispatch table_.
