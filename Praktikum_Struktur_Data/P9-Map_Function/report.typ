#import "@atalariq/lab-report:1.0.0": *
#import "@atalariq/code:1.0.0": *

#let metadata = (
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Struktur Data",
  course-code: "PSD",
  lecturer: "Firma Syahrian, S.Kom., M.Cs.",
  meeting: "9",
  title: "Fungsi Map",
)

#show: report.with(
  ..metadata,

  association: (
    program: "D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK",
    department: "DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA",
    faculty: "SEKOLAH VOKASI",
    university: "UNIVERSITAS GADJAH MADA",
    city: "YOGYAKARTA",
    logo: image("assets/logo.png", width: 6cm),
  ),
  year: 2026,

  use-cover: true,
  bib: bibliography("references.bib"),
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 11pt,
)

#set par(justify: true)
#set par(first-line-indent: (amount: 0.5in, all: true))

#let include-code(path, ..args) = code-from-file(read(path), lang: path.split(".").at(-1), header: path, ..args)
#let img(path, ..args) = image-wrapper(read(path, encoding: none), width: 12cm, ..args)

#daftar-isi()
// #daftar-gambar()
// #daftar-tabel()

= Dasar Teori

== Pengertian

Fungsi `map()` adalah fungsi bawaan (_built-in_) Python yang termasuk dalam paradigma _functional programming_ @realpython2023map. Fungsi ini menerima dua argumen utama: sebuah fungsi dan satu atau lebih iterable, lalu menerapkan fungsi tersebut ke setiap elemen iterable secara berurutan @psf2024map.

Sintaks dasarnya adalah sebagai berikut @psf2024map:

#code(
  numbering: false,
  ```py
map(function, iterable, ...)
```)

- `function`: fungsi yang akan diterapkan ke setiap elemen.
- `iterable`: objek yang dapat diiterasi (list, tuple, string, dll.). Bisa lebih dari satu jika fungsi menerima lebih dari satu argumen.

`map()` mengembalikan objek bertipe `map`, yaitu sebuah _iterator_ --- artinya elemen baru dihitung saat dibutuhkan, bukan semuanya sekaligus @realpython2024mapref. Untuk mendapatkan hasilnya sebagai list, perlu dilakukan konversi eksplisit menggunakan `list()` @gfg2024map.

Contoh sederhana:

#code(```py
angka = [1, 2, 3, 4]
hasil = list(map(lambda x: x ** 2, angka))
print(hasil)  # [1, 4, 9, 16]
```)

== Mengapa Menggunakan `map()` dibandingkan Perulangan Biasa?

Secara fungsionalitas, `map()` dan perulangan `for` dapat menghasilkan output yang sama @realpython2023map. Namun ada beberapa alasan mengapa `map()` lebih dipilih dalam situasi tertentu:
+ *Keterbacaan kode*: `map()` mengekspresikan _intent_ secara langsung --- "terapkan fungsi ini ke setiap elemen" --- tanpa harus menulis logika iterasi secara eksplisit @realpython2023map.
+ *Efisiensi memori*: `map()` mengembalikan iterator, bukan list. Ini berarti elemen dihitung satu per satu saat diperlukan, sehingga lebih hemat memori untuk data berukuran besar @realpython2023map.
+ *Komposabilitas*: `map()` mudah dikombinasikan dengan fungsi lain seperti `filter()` dan `functools.reduce()` untuk membangun _pipeline_ transformasi data yang ringkas @realpython2023map.
+ *Integrasi dengan fungsi yang sudah ada*: Fungsi bawaan seperti `int`, `str`, `float`, atau metode string dapat langsung dioper ke `map()` tanpa perlu membungkusnya dalam lambda @gfg2024map.

Perbandingan sederhana @realpython2023map:

#code(```py
# Menggunakan loop biasa
hasil = []
for x in angka:
    hasil.append(x * 2)

# Menggunakan map()
hasil = list(map(lambda x: x * 2, angka))
```)

Keduanya ekuivalen, tetapi versi `map()` lebih ringkas dan deklaratif.

== Kapan `map()` Digunakan?

`map()` paling tepat digunakan dalam situasi berikut @realpython2023map @gfg2024map:

+ Ketika perlu menerapkan transformasi yang *seragam* ke setiap elemen sebuah iterable.
+ Ketika bekerja dengan *dataset besar* dan efisiensi memori menjadi pertimbangan.
+ Ketika ingin *mengonversi tipe data* secara massal, misalnya mengubah list string menjadi list integer dengan `map(int, list_string)`.
+ Ketika membangun *_pipeline_ fungsional* bersama `filter()` dan `reduce()`.

`map()` kurang cocok digunakan ketika transformasi yang dilakukan bergantung pada indeks elemen atau kondisi yang kompleks antar elemen, karena dalam kasus tersebut _list comprehension_ atau loop biasa lebih ekspresif @realpython2023map.

= Hasil dan Pembahasan

== Program 1: Konversi Satuan Suhu ke Celsius, Fahrenheit, dan Kelvin

Program ini mensimulasikan skenario di mana sebuah alat ukur menghasilkan data suhu dalam satuan Celsius, dan kita perlu mengonversi seluruh data tersebut ke dua satuan lain sekaligus: Fahrenheit dan Kelvin. Fungsi `map()` digunakan untuk menerapkan fungsi konversi ke setiap elemen list secara serentak, menghasilkan list of tuple yang masing-masing berisi ketiga nilai satuan untuk satu titik pengukuran.

=== Kode Program

#code(```py
def konversi_suhu(celsius):
    fahrenheit = (celsius * 9 / 5) + 32
    kelvin = celsius + 273.15
    return (celsius, round(fahrenheit, 2), round(kelvin, 2))

data_celsius = [0, 25, 37, 100, -40]

hasil = list(map(konversi_suhu, data_celsius))

print(f"{'Celsius':>10} {'Fahrenheit':>12} {'Kelvin':>10}")
print("-" * 36)
for c, f, k in hasil:
    print(f"{c:>10} {f:>12} {k:>10}")
```)

=== Keluaran dan Penjelasan

Keluaran program:
#img("assets/output-1.png", caption: [Hasil keluaran program 1])

Program mendefinisikan fungsi `konversi_suhu()` yang menerima satu nilai Celsius dan mengembalikan tuple berisi tiga nilai: Celsius asli, Fahrenheit, dan Kelvin. Fungsi ini kemudian dioper ke `map()` bersama list `data_celsius`.

`map()` menerapkan `konversi_suhu()` ke setiap elemen list satu per satu, menghasilkan iterator of tuple. Setelah dikonversi ke list, setiap elemen list adalah tuple `(C, F, K)` untuk satu titik pengukuran.

Keunggulan pendekatan ini dibanding loop biasa adalah seluruh logika transformasi terisolasi dalam satu fungsi yang dapat diuji dan digunakan ulang secara independen, sementara `map()` hanya bertanggung jawab atas iterasi.

== Program 2: Kalkulasi Harga Akhir Produk dari List of Dictionary

Program ini mensimulasikan pengolahan data produk dari sebuah toko. Setiap produk direpresentasikan sebagai dictionary berisi nama, harga asli, dan persentase diskon. Fungsi `map()` digunakan untuk menghasilkan list of dictionary baru yang masing-masing memuat harga setelah diskon dan label kategori harga ("Terjangkau" atau "Mahal") berdasarkan threshold tertentu.

=== Kode Program

#code(```py
produk = [
    {"nama": "Keyboard Mechanical", "harga": 850000, "diskon": 10},
    {"nama": "Mouse Wireless",      "harga": 320000, "diskon": 15},
    {"nama": "Monitor 27 inch",     "harga": 3200000, "diskon": 5},
    {"nama": "USB Hub",             "harga": 150000, "diskon": 20},
    {"nama": "Webcam HD",           "harga": 480000, "diskon": 0},
]

THRESHOLD = 500000

def hitung_harga_akhir(p):
    harga_akhir = p["harga"] * (1 - p["diskon"] / 100)
    kategori = "Terjangkau" if harga_akhir <= THRESHOLD else "Mahal"
    return {
        "nama": p["nama"],
        "harga_asli": p["harga"],
        "diskon": f"{p['diskon']}%",
        "harga_akhir": round(harga_akhir),
        "kategori": kategori,
    }

hasil = list(map(hitung_harga_akhir, produk))

for item in hasil:
    print(f"[{item['kategori']:^10}] {item['nama']:<22} "
          f"Rp{item['harga_asli']:>9,} -> Rp{item['harga_akhir']:>9,} ({item['diskon']} off)")
```)

=== Keluaran dan Penjelasan

Keluaran program:

#img("assets/output-2.png", caption: [Hasil keluaran program 2])

Setiap elemen dalam list `produk` adalah dictionary. Fungsi `hitung_harga_akhir()` mengakses nilai dari setiap dictionary menggunakan key, menghitung harga setelah diskon, menentukan kategori berdasarkan threshold, lalu mengembalikan dictionary baru dengan struktur yang berbeda dari input.

Poin penting di sini adalah `map()` tidak memodifikasi dictionary asli di list `produk`. Ia menghasilkan objek baru, sehingga data sumber tetap utuh. Ini sejalan dengan prinsip _immutability_ dalam functional programming yang membuat kode lebih aman dari _side effect_ yang tidak disengaja.

== Program 3: Konversi Nilai Mahasiswa ke Grade Huruf dan Status Kelulusan

Program ini mensimulasikan pemrosesan data nilai akhir mahasiswa. Setiap mahasiswa direpresentasikan sebagai dictionary berisi nama dan nilai numerik (0-100). Fungsi `map()` digunakan untuk menghasilkan rekap akhir yang memuat grade huruf dan status kelulusan sesuai sistem penilaian yang umum digunakan.

=== Kode Program

#code(```py
mahasiswa = [
    {"nama": "Andi Pratama",   "nilai": 88},
    {"nama": "Budi Santoso",   "nilai": 72},
    {"nama": "Citra Dewi",     "nilai": 55},
    {"nama": "Dian Rahayu",    "nilai": 40},
    {"nama": "Eko Wijaya",     "nilai": 95},
    {"nama": "Fina Aulia",     "nilai": 63},
]

def tentukan_grade(mhs):
    nilai = mhs["nilai"]

    if nilai >= 85:
        grade = "A"
    elif nilai >= 75:
        grade = "B"
    elif nilai >= 65:
        grade = "C"
    elif nilai >= 55:
        grade = "D"
    else:
        grade = "E"

    lulus = nilai >= 55
    status = "Lulus" if lulus else "Tidak Lulus"

    return {
        "nama": mhs["nama"],
        "nilai": nilai,
        "grade": grade,
        "status": status,
    }

rekap = list(map(tentukan_grade, mahasiswa))

print(f"{'Nama':<20} {'Nilai':>6} {'Grade':>6} {'Status'}")
print("-" * 46)
for r in rekap:
    print(f"{r['nama']:<20} {r['nilai']:>6} {r['grade']:>6}   {r['status']}")
```)

=== Keluaran dan Penjelasan

Keluaran program:

#img("assets/output-3.png", caption: [Hasil keluaran program 3])

Fungsi `tentukan_grade()` menerapkan logika kondisional bertingkat untuk memetakan nilai numerik ke grade huruf, sekaligus menentukan status kelulusan. Kedua hasil ini dikemas dalam dictionary baru dan dikembalikan sebagai output fungsi.

`map()` menerapkan fungsi ini ke seluruh elemen list `mahasiswa` tanpa perlu menulis loop eksplisit. Hasilnya adalah list of dictionary `rekap` yang siap ditampilkan atau diproses lebih lanjut, misalnya untuk diekspor ke file atau dihitung statistiknya.

Program ini menunjukkan bahwa `map()` tidak terbatas pada transformasi matematis sederhana. Fungsi yang dioperkan ke `map()` dapat mengandung logika kondisional yang kompleks selama ia tetap menerima satu elemen dan mengembalikan satu output.

= Kesimpulan

Fungsi `map()` merupakan fungsi bawaan Python yang menerapkan sebuah fungsi ke setiap elemen iterable dan mengembalikan iterator hasil transformasi tersebut. Dari ketiga program yang telah dibuat, dapat disimpulkan beberapa hal:
+ `map()` mendukung berbagai jenis fungsi sebagai argumen: fungsi biasa (_named function_), fungsi lambda, maupun fungsi bawaan Python seperti `int` atau `str`.
+ `map()` tidak terbatas pada transformasi numerik sederhana. Ia dapat digunakan untuk mengolah struktur data kompleks seperti list of dictionary, selama fungsi yang dioper mampu memproses satu elemen dan menghasilkan satu output.
+ Penggunaan `map()` menghasilkan kode yang lebih deklaratif dan ringkas dibanding perulangan `for` eksplisit, terutama ketika transformasi yang dilakukan bersifat seragam untuk setiap elemen.
+ `map()` mengembalikan iterator (_lazy evaluation_), sehingga lebih efisien dalam penggunaan memori untuk dataset berukuran besar dibandingkan pendekatan yang langsung membangun list.

Dengan memahami cara kerja `map()`, pemrogram dapat memanfaatkan konsep _functional programming_ dalam Python secara lebih efektif, terutama ketika dikombinasikan dengan `filter()` dan `reduce()` untuk membangun pipeline transformasi data yang bersih dan mudah dipelihara.
