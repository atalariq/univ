#import "./template.typ": *
#import "@preview/numbly:0.1.0": numbly


#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Web 1",
  course-code: "PPW1",
  lecturer: "Achmad Choirudin Emcha, S.Kom., M.Eng.",
  meeting: "4",
  title: "Form dan Gambar",

  minimal: false,
  show-table-of-content: true,
  show-table-of-figure: false,
  show-table-of-table: false,
  show-bibliography: true,

  paper: "a4",
  font: "Times New Roman",
  font-size: 12pt,
)

#set par(first-line-indent: (all: true, amount: 2em))
#set heading(numbering: numbly("{1:A}.", "{2}.", "{2}.{3}", "{2}.{3}.{4}"))


= Tujuan Praktikum

+ Mempelajari dan mengimplementasikan elemen form HTML beserta berbagai tipe input, atribut bawaan, dan elemen pendukungnya untuk membangun antarmuka pengumpulan data yang interaktif.
+ Mengenal dan mempraktikkan elemen-elemen form lanjutan, seperti `<fieldset>`, `<legend>`, `<datalist>`, `<output>`, `<option>`, dan `<optgroup>`, beserta fungsi masing-masing.
+ Mengenal dan mengimplementasikan grafik berbasis web menggunakan SVG (_Scalable Vector Graphics_) dan Canvas HTML5.

= Dasar Teori

Pertemuan keempat mencakup dua topik utama: pembuatan form interaktif dengan HTML dan penggambaran grafik langsung di browser menggunakan SVG serta Canvas. Keduanya merupakan komponen fundamental dalam pengembangan antarmuka web modern.

== Form HTML

Form HTML adalah mekanisme utama yang memungkinkan pengguna mengirimkan data ke server @mdn-forms. Elemen-elemen di dalamnya bekerja bersama untuk menangkap, memvalidasi, dan mengirimkan berbagai jenis input.

=== Elemen `<form>` dan Atributnya

Elemen `<form>` berfungsi sebagai kontainer yang mengelompokkan semua elemen input dan menentukan cara data tersebut dikirimkan @mdn-form-element. Tiga atribut terpentingnya adalah sebagai berikut.

Atribut `action` menentukan URL tujuan pengiriman data. Jika tidak diisi, browser mengirimkan data kembali ke URL halaman yang sama. Atribut `method` menentukan metode HTTP yang digunakan, yaitu `get` atau `post`. Metode `get` melampirkan data sebagai _query string_ pada URL sehingga terlihat di address bar dan cocok untuk permintaan yang bersifat baca seperti pencarian. Metode `post` mengirimkan data di dalam badan permintaan HTTP, membuatnya tidak terlihat langsung di URL dan lebih aman untuk data sensitif seperti kata sandi atau informasi pribadi. Atribut `target` menentukan konteks tampilan respons server, misalnya `_self` (tab yang sama, default) atau `_blank` (tab baru) @w3schools-form-attr.

#code(
  ```html
  <!-- Contoh form dengan method POST ke endpoint /daftar -->
  <form action="/daftar" method="post" target="_self">
    <label for="nama">Nama Lengkap:</label>
    <input type="text" id="nama" name="nama">

    <input type="submit" value="Kirim">
  </form>

  <!-- Contoh form pencarian dengan method GET -->
  <form action="/cari" method="get">
    <input type="text" name="q" placeholder="Kata kunci...">
    <button type="submit">Cari</button>
  </form>
  ```,
  // caption: [Struktur elemen `<form>` dengan atribut `action`, `method`, dan `target`],
)

#img("assets/form-basic.png", caption: [Tampilan form dasar pada browser])

=== Tipe Input HTML

Elemen `<input>` adalah elemen paling serbaguna dalam form. Atribut `type` menentukan jenis widget dan validasi yang diterapkan browser secara otomatis @mdn-input.

Tipe `text` menerima teks bebas satu baris. Tipe `password` menampilkan karakter sebagai titik untuk menjaga kerahasiaan. Tipe `email` memvalidasi format alamat surel sebelum form dikirimkan. Tipe `number` membatasi input hanya berupa angka dan dapat dikonfigurasi dengan atribut `min`, `max`, dan `step`. Tipe `date` memunculkan antarmuka pemilih tanggal bawaan browser. Tipe `tel` digunakan untuk nomor telepon. Tipe `file` membuka dialog pemilihan berkas dari perangkat pengguna.

Tipe `radio` memungkinkan pemilihan satu opsi dari beberapa pilihan yang dikelompokkan berdasarkan nilai atribut `name` yang sama. Tipe `checkbox` memungkinkan pemilihan satu atau lebih opsi secara bersamaan. Tipe `submit` menghasilkan tombol pengiriman form, sementara `reset` mengembalikan semua elemen ke nilai awalnya @mdn-input.

#code(
  ```html
  <form>
    <!-- Input teks dan email -->
    <label for="nama">Nama:</label>
    <input type="text" id="nama" name="nama" placeholder="Nama lengkap">

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" placeholder="contoh@email.com">

    <!-- Input angka dengan batas min/max -->
    <label for="usia">Usia:</label>
    <input type="number" id="usia" name="usia" min="1" max="120">

    <!-- Input tanggal -->
    <label for="tgl">Tanggal Lahir:</label>
    <input type="date" id="tgl" name="tgl">

    <!-- Radio button (satu pilihan) -->
    <p>Jenis Kelamin:</p>
    <input type="radio" id="jk-l" name="jk" value="L">
    <label for="jk-l">Laki-laki</label>
    <input type="radio" id="jk-p" name="jk" value="P">
    <label for="jk-p">Perempuan</label>

    <!-- Checkbox (banyak pilihan) -->
    <p>Hobi:</p>
    <input type="checkbox" id="membaca" name="hobi" value="membaca">
    <label for="membaca">Membaca</label>
    <input type="checkbox" id="olahraga" name="hobi" value="olahraga">
    <label for="olahraga">Olahraga</label>

    <!-- Input file -->
    <label for="foto">Foto:</label>
    <input type="file" id="foto" name="foto" accept="image/*">

    <input type="submit" value="Kirim">
    <input type="reset" value="Reset">
  </form>
  ```,
  // caption: [Contoh berbagai tipe elemen `<input>`],
)

#img("assets/form-input-types.png", caption: [Tampilan berbagai tipe input pada browser])

=== Elemen Pendukung Form

Selain `<input>`, HTML menyediakan beberapa elemen pendukung yang melengkapi kapabilitas form @mdn-forms.

*Elemen `<label>`* memberikan deskripsi tekstual untuk sebuah elemen input. Ketika pengguna mengklik label, fokus keyboard berpindah ke elemen yang terkait. Asosiasi dilakukan dengan mencocokkan atribut `for` pada label dengan atribut `id` pada input, atau dengan menempatkan input di dalam elemen label secara langsung. Penggunaan label sangat dianjurkan karena meningkatkan aksesibilitas bagi pengguna pembaca layar (_screen reader_) @mdn-forms.

*Elemen `<select>`* membuat menu dropdown yang memuat daftar pilihan @mdn-select. Setiap pilihan didefinisikan dengan elemen `<option>`. Atribut `multiple` memungkinkan pemilihan lebih dari satu opsi dengan menahan tombol Ctrl atau Shift.

*Elemen `<textarea>`* menyediakan area input teks multi-baris. Ukuran awalnya dikontrol dengan atribut `rows` dan `cols`, namun pengguna juga dapat mengubah ukurannya secara manual dengan menyeret sudut elemen.

*Elemen `<button>`* menghasilkan tombol yang lebih fleksibel dibanding `<input type="submit">` karena dapat memuat konten HTML seperti ikon atau teks yang diformat. Nilai atribut `type` yang valid adalah `submit`, `reset`, dan `button` @whatwg-html.

#code(
  ```html
  <form action="/kirim" method="post">
    <!-- Label eksplisit menggunakan atribut for -->
    <label for="kota">Pilih Kota:</label>
    <select id="kota" name="kota">
      <option value="yk">Yogyakarta</option>
      <option value="jkt">Jakarta</option>
      <option value="bdg">Bandung</option>
    </select>

    <!-- Textarea multi-baris -->
    <label for="pesan">Pesan:</label>
    <textarea id="pesan" name="pesan" rows="5" cols="40"
      placeholder="Tuliskan pesan Anda di sini..."></textarea>

    <!-- Tombol submit dan reset -->
    <button type="submit">Kirim Pesan</button>
    <button type="reset">Bersihkan</button>
  </form>
  ```,
  // caption: [Contoh elemen `<select>`, `<textarea>`, dan `<button>`],
)

#img("assets/form-element-basic.png", caption: [Tampilan elemen select, textarea, dan button pada browser])

=== Tag HTML Lanjutan untuk Form

HTML menyediakan elemen-elemen tambahan yang memperkaya kemampuan form dalam hal pengelompokan semantik, saran input otomatis, dan tampilan hasil kalkulasi dinamis.

*Elemen `<fieldset>`* mengelompokkan elemen-elemen form yang saling berkaitan secara logis. Browser secara bawaan menampilkan garis kotak mengelilingi kelompok tersebut @mdn-fieldset. Pengelompokan ini sangat bermanfaat pada form yang panjang karena memperjelaskan struktur dan meningkatkan aksesibilitas: pembaca layar mengumumkan judul kelompok sebelum membacakan elemen di dalamnya.

*Elemen `<legend>`* menyediakan judul atau keterangan untuk `<fieldset>` dan harus menjadi anak pertama dari elemen tersebut @mdn-legend. Legend ditampilkan secara visual di bagian atas garis kotak fieldset.

*Elemen `<datalist>`* menyediakan daftar opsi yang disarankan sebagai fitur _autocomplete_ untuk elemen `<input>` @mdn-datalist. Berbeda dengan `<select>`, pengguna tetap dapat mengetikkan nilai yang tidak ada dalam daftar. Asosiasi dilakukan dengan mencocokkan atribut `list` pada input dengan atribut `id` pada datalist.

*Elemen `<output>`* merepresentasikan hasil dari sebuah perhitungan atau aksi pengguna @mdn-output. Elemen ini biasanya diperbarui secara dinamis melalui JavaScript. Atribut `for` mereferensikan `id` dari elemen-elemen input yang menjadi sumber perhitungannya, sehingga relasi semantik antara input dan output terbentuk dengan baik @whatwg-html.

*Elemen `<option>`* mendefinisikan satu pilihan di dalam `<select>` maupun `<datalist>`. Atribut `value` menentukan data yang dikirimkan ke server, sementara konten teksnya ditampilkan kepada pengguna. Atribut `selected` menandai pilihan bawaan, dan `disabled` menonaktifkan pilihan tertentu @whatwg-html.

*Elemen `<optgroup>`* mengelompokkan beberapa elemen `<option>` yang berkaitan di dalam `<select>`, menghasilkan hierarki visual berupa label grup yang tidak dapat dipilih @mdn-optgroup. Atribut `label` wajib ada dan menjadi teks judul grup tersebut. Penggunaan optgroup sangat membantu pada daftar pilihan yang panjang agar lebih mudah dinavigasi.

#code(
  ```html
  <!-- fieldset + legend untuk pengelompokan -->
  <fieldset>
    <legend>Data Akademik</legend>

    <!-- select dengan option dan optgroup -->
    <label for="prodi">Program Studi:</label>
    <select id="prodi" name="prodi">
      <option value="" disabled selected>-- Pilih Program Studi --</option>
      <optgroup label="Sekolah Vokasi">
        <option value="ti">Teknologi Informasi</option>
        <option value="elektro-sv">Teknologi Listrik</option>
        <option value="mesin-sv">Teknologi Mesin</option>
      </optgroup>
      <optgroup label="Fakultas Teknik">
        <option value="informatika">Informatika</option>
        <option value="elektro-s1">Teknik Elektro</option>
        <option value="sipil">Teknik Sipil</option>
      </optgroup>
    </select>

    <!-- input + datalist untuk autocomplete -->
    <label for="asal-sekolah">Asal Sekolah:</label>
    <input type="text" id="asal-sekolah" name="asal-sekolah"
           list="daftar-sekolah" placeholder="Ketik nama sekolah...">
    <datalist id="daftar-sekolah">
      <option value="SMA Negeri 1 Yogyakarta">
      <option value="SMA Negeri 3 Yogyakarta">
      <option value="SMA Negeri 1 Sleman">
      <option value="SMA Muhammadiyah 1 Yogyakarta">
    </datalist>
  </fieldset>

  <!-- output untuk menampilkan hasil kalkulasi -->
  <fieldset>
    <legend>Kalkulator Nilai</legend>
    <label for="n1">Nilai Ujian:</label>
    <input type="number" id="n1" name="n1" min="0" max="100"
           oninput="rata.value = ((+n1.value + +n2.value) / 2).toFixed(1)">
    <label for="n2">Nilai Tugas:</label>
    <input type="number" id="n2" name="n2" min="0" max="100"
           oninput="rata.value = ((+n1.value + +n2.value) / 2).toFixed(1)">
    <label>Rata-rata:
      <output id="rata" name="rata" for="n1 n2">0</output>
    </label>
  </fieldset>
  ```,
  // caption: [Contoh penggunaan `<fieldset>`, `<legend>`, `<option>`, `<optgroup>`, `<datalist>`, dan `<output>`],
)

#img(
  "assets/form-element-advanced.png",
  caption: [Tampilan elemen lanjutan form (fieldset, datalist, output) pada browser],
)

=== Atribut Input Form

HTML menyediakan sejumlah atribut untuk mengontrol perilaku dan validasi elemen input @mdn-input.

Atribut `placeholder` menampilkan teks petunjuk di dalam input sebelum pengguna mengetikkan sesuatu; teks ini menghilang begitu ada karakter yang dimasukkan. Atribut `required` menjadikan sebuah field wajib diisi sebelum form dapat dikirimkan; browser akan menampilkan pesan validasi secara otomatis jika field ini kosong. Atribut `autofocus` menempatkan fokus keyboard secara otomatis pada input saat halaman pertama kali dimuat, dan sebaiknya hanya diterapkan pada satu elemen per halaman. Atribut `size` menentukan lebar tampilan elemen input dalam satuan jumlah karakter.

Atribut `readonly` mencegah pengguna mengubah nilai input, namun nilai tersebut tetap dikirimkan bersama data form saat di-_submit_. Atribut `disabled` menonaktifkan elemen sepenuhnya sehingga tidak dapat berinteraksi dan nilainya *tidak* ikut dikirimkan ke server @w3schools-input-attr.

Atribut `formaction`, `formenctype`, dan `formmethod` memungkinkan sebuah tombol `submit` menggantikan nilai atribut yang sudah ditetapkan pada elemen `<form>` induknya @whatwg-html. Ini berguna ketika satu form memiliki beberapa tombol submit dengan tujuan atau perilaku yang berbeda, misalnya tombol "Simpan Draft" dan "Kirim Final" yang mengarah ke endpoint berbeda.

#code(
  ```html
  <form action="/kirim" method="post">
    <!-- placeholder dan autofocus -->
    <input type="text" name="nama" placeholder="Masukkan nama lengkap"
           autofocus required>

    <!-- readonly: terlihat dan terkirim, tapi tidak bisa diedit -->
    <input type="text" name="kode" value="USR-20250301" readonly>

    <!-- disabled: tidak aktif dan tidak terkirim -->
    <input type="text" name="status" value="Menunggu verifikasi" disabled>

    <!-- size: lebar input dalam satuan karakter -->
    <input type="text" name="ktp" size="16" maxlength="16"
           placeholder="16 digit NIK">

    <!-- formaction: tiap tombol mengarah ke endpoint berbeda -->
    <button type="submit" formaction="/simpan-draft"
            formmethod="post">Simpan Draft</button>
    <button type="submit" formaction="/kirim-final"
            formenctype="multipart/form-data">Kirim Final</button>
  </form>
  ```,
  // caption: [Contoh atribut `placeholder`, `required`, `autofocus`, `readonly`, `disabled`, `size`, dan `formaction`],
)

#img("assets/form-attributes.png", caption: [Tampilan perbandingan field normal, readonly, dan disabled pada browser])

== Grafik HTML

HTML5 memperkenalkan dua cara bawaan untuk menggambar grafik langsung di browser tanpa memerlukan _plugin_ tambahan, yaitu SVG dan Canvas @mdn-svg.

=== SVG (_Scalable Vector Graphics_)

SVG adalah format grafik vektor berbasis XML yang dapat disematkan langsung ke dalam dokumen HTML @mdn-svg. Karena berbasis vektor, grafik SVG tidak kehilangan kualitas saat diperbesar atau diperkecil seberapa pun, menjadikannya pilihan ideal untuk ikon, logo, ilustrasi, dan diagram @w3c-svg. Setiap elemen SVG merupakan bagian dari DOM sehingga dapat diakses, diubah gayanya dengan CSS, dan dimanipulasi dengan JavaScript @w3schools-svg.

Dua elemen geometri dasar yang paling sering digunakan adalah `<rect>` dan `<circle>`. Elemen `<rect>` menggambar persegi atau persegi panjang; atribut `x` dan `y` menentukan posisi sudut kiri atas, `width` dan `height` menentukan dimensinya, `rx` menghaluskan sudut, serta `fill` dan `stroke` mengatur warna isi dan garis tepi. Elemen `<circle>` menggambar lingkaran dengan `cx` dan `cy` sebagai koordinat pusat, `r` sebagai jari-jari, dan atribut warna yang sama @mdn-svg.

#code(
  ```html
  <svg width="400" height="220" xmlns="http://www.w3.org/2000/svg">
    <!-- Persegi panjang dengan sudut lurus -->
    <rect x="20" y="20" width="140" height="80"
          fill="steelblue" stroke="navy" stroke-width="2"/>

    <!-- Persegi panjang dengan sudut membulat (rx) -->
    <rect x="180" y="20" width="140" height="80"
          fill="coral" stroke="darkred" stroke-width="2" rx="16"/>

    <!-- Lingkaran dengan fill -->
    <circle cx="90" cy="160" r="45"
            fill="mediumseagreen" stroke="darkgreen" stroke-width="2"/>

    <!-- Lingkaran tanpa fill (hanya garis tepi) -->
    <circle cx="260" cy="160" r="45"
            fill="none" stroke="purple" stroke-width="3"/>
  </svg>
  ```,
  // caption: [Contoh elemen `<rect>` dan `<circle>` pada SVG],
)

#img("assets/svg.png", caption: [Tampilan grafik SVG (persegi panjang dan lingkaran) pada browser])

=== Canvas HTML5

Canvas adalah elemen HTML5 yang menyediakan area gambar berbasis piksel (_bitmap_) yang dimanipulasi melalui JavaScript menggunakan Canvas 2D API @mdn-canvas. Berbeda dengan SVG, hasil gambar pada Canvas tidak terstruktur dalam DOM sehingga tidak dapat dimanipulasi secara langsung dengan CSS atau JavaScript setelah digambar. Namun Canvas unggul dalam performa untuk rendering dinamis dan intensif seperti animasi, permainan, dan visualisasi data secara _real-time_ @w3schools-canvas.

Untuk mulai menggambar, elemen `<canvas>` perlu mendapatkan konteks 2D melalui `getContext('2d')`. Metode `fillRect(x, y, w, h)` menggambar persegi panjang terisi, sedangkan `arc(cx, cy, r, startAngle, endAngle)` digunakan bersama `beginPath()`, `fill()`, dan `stroke()` untuk menggambar lingkaran @mdn-canvas.

#code(
  ```html
  <canvas id="myCanvas" width="420" height="220"
          style="border: 1px solid #ccc; display: block;">
    Browser Anda tidak mendukung elemen Canvas.
  </canvas>

  <script>
    const canvas = document.getElementById('myCanvas');
    const ctx    = canvas.getContext('2d');

    // Menggambar persegi panjang biru
    ctx.fillStyle = 'steelblue';
    ctx.fillRect(20, 30, 160, 90);

    // Menggambar persegi panjang merah dengan garis tepi
    ctx.fillStyle   = 'coral';
    ctx.strokeStyle = 'darkred';
    ctx.lineWidth   = 3;
    ctx.fillRect(200, 30, 160, 90);
    ctx.strokeRect(200, 30, 160, 90);

    // Menggambar lingkaran hijau
    ctx.beginPath();
    ctx.arc(90, 170, 40, 0, Math.PI * 2);
    ctx.fillStyle = 'mediumseagreen';
    ctx.fill();

    // Menggambar lingkaran ungu hanya garis
    ctx.beginPath();
    ctx.arc(300, 170, 40, 0, Math.PI * 2);
    ctx.strokeStyle = 'purple';
    ctx.lineWidth   = 3;
    ctx.stroke();
  </script>
  ```,
  // caption: [Contoh penggunaan Canvas 2D API untuk menggambar persegi panjang dan lingkaran],
)

#img("assets/canvas.png", caption: [Tampilan hasil gambar pada elemen Canvas di browser])

= Hasil dan Pembahasan

=== Contoh Tag HTML Lanjutan

Berikut ini adalah implementasi masing-masing dari keenam tag HTML yang ditugaskan, disertai penjelasan dan hasil tangkap layar.

*`<fieldset>` dan `<legend>`* diimplementasikan untuk mengelompokkan field data pribadi dan data akademik secara terpisah agar form lebih terstruktur secara visual dan semantik.

#code(
  ```html
  <!DOCTYPE html>
  <html lang="id">
  <head>
    <meta charset="UTF-8">
    <title>Contoh Fieldset & Legend</title>
  </head>
  <body>
    <form>
      <fieldset>
        <legend>Data Pribadi</legend>
        <label for="nama">Nama:</label>
        <input type="text" id="nama" name="nama" placeholder="Nama lengkap"><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="email@contoh.com">
      </fieldset>

      <fieldset>
        <legend>Data Akademik</legend>
        <label for="nim">NIM:</label>
        <input type="text" id="nim" name="nim" placeholder="Nomor Induk Mahasiswa"><br>
        <label for="angkatan">Angkatan:</label>
        <input type="number" id="angkatan" name="angkatan" min="2000" max="2030">
      </fieldset>

      <button type="submit">Simpan</button>
    </form>
  </body>
  </html>
  ```,
  // caption: [Contoh implementasi `<fieldset>` dan `<legend>`],
)

#img("assets/fieldset-legend.png", caption: [Tampilan elemen `<fieldset>` dan `<legend>` pada browser])

*`<datalist>`* diimplementasikan pada field pencarian nama kota, memberikan saran pilihan saat pengguna mengetik tanpa membatasi input hanya pada opsi yang tersedia.

#code(
  ```html
  <!DOCTYPE html>
  <html lang="id">
  <head>
    <meta charset="UTF-8">
    <title>Contoh Datalist</title>
  </head>
  <body>
    <form>
      <label for="kota">Kota Asal:</label>
      <input type="text" id="kota" name="kota"
             list="daftar-kota" placeholder="Ketik nama kota...">
      <datalist id="daftar-kota">
        <option value="Yogyakarta">
        <option value="Jakarta">
        <option value="Bandung">
        <option value="Surabaya">
        <option value="Semarang">
        <option value="Medan">
        <option value="Makassar">
      </datalist>
      <button type="submit">Kirim</button>
    </form>
  </body>
  </html>
  ```,
  // caption: [Contoh implementasi `<datalist>` sebagai fitur autocomplete],
)

#img("assets/datalist.png", caption: [Tampilan elemen `<datalist>` dengan saran pilihan yang muncul saat mengetik])

*`<output>`* diimplementasikan untuk menampilkan hasil perhitungan nilai akhir secara dinamis berdasarkan input nilai ujian dan tugas dari pengguna.

#code(
  ```html
  <!DOCTYPE html>
  <html lang="id">
  <head>
    <meta charset="UTF-8">
    <title>Contoh Output</title>
  </head>
  <body>
    <form oninput="hasil.value =
      (+ujian.value * 0.6 + +tugas.value * 0.4).toFixed(1)">

      <label for="ujian">Nilai Ujian (bobot 60%):</label>
      <input type="number" id="ujian" name="ujian" min="0" max="100" value="0">
      <br>
      <label for="tugas">Nilai Tugas (bobot 40%):</label>
      <input type="number" id="tugas" name="tugas" min="0" max="100" value="0">
      <br>
      <label>
        Nilai Akhir:
        <output id="hasil" name="hasil" for="ujian tugas">0</output>
      </label>
    </form>
  </body>
  </html>
  ```,
  // caption: [Contoh implementasi `<output>` untuk menampilkan hasil kalkulasi nilai akhir],
)

#img("assets/output.png", caption: [Tampilan elemen `<output>` yang menampilkan nilai akhir secara dinamis])

*`<option>` dan `<optgroup>`* diimplementasikan pada dropdown pemilihan program studi yang dikelompokkan berdasarkan fakultas, disertai satu opsi yang dinonaktifkan sebagai placeholder.

#code(
  ```html
  <!DOCTYPE html>
  <html lang="id">
  <head>
    <meta charset="UTF-8">
    <title>Contoh Option & Optgroup</title>
  </head>
  <body>
    <form>
      <label for="prodi">Program Studi:</label>
      <select id="prodi" name="prodi" required>
        <!-- option sebagai placeholder yang tidak bisa dipilih -->
        <option value="" disabled selected>-- Pilih Program Studi --</option>

        <!-- optgroup mengelompokkan option berdasarkan kategori -->
        <optgroup label="Sekolah Vokasi">
          <option value="ti">Teknologi Informasi</option>
          <option value="el-sv">Teknologi Listrik</option>
          <option value="me-sv">Teknologi Mesin</option>
          <option value="ak-sv">Akuntansi</option>
        </optgroup>

        <optgroup label="Fakultas Teknik">
          <option value="if">Informatika</option>
          <option value="ee">Teknik Elektro</option>
          <option value="ce">Teknik Sipil</option>
        </optgroup>

        <optgroup label="Fakultas MIPA">
          <option value="cs">Ilmu Komputer</option>
          <option value="math">Matematika</option>
          <option value="phys">Fisika</option>
        </optgroup>
      </select>
      <button type="submit">Pilih</button>
    </form>
  </body>
  </html>
  ```,
  // caption: [Contoh implementasi `<option>` dan `<optgroup>` pada elemen `<select>`],
)

#img("assets/option-optgroup.png", caption: [Tampilan dropdown dengan pengelompokan `<optgroup>` pada browser])

=== Form Pendaftaran Mahasiswa Baru

Berikut ini adalah implementasi form pendaftaran yang mengintegrasikan seluruh elemen dan atribut yang telah dipelajari. Form ini menyertakan gambar header di atas form dan gambar foto profil di dalam form, serta memuat elemen `<fieldset>`, `<legend>`, `<datalist>`, `<output>`, `<option>`, `<optgroup>`, dan berbagai tipe input.

#code(
  ```html
  <!DOCTYPE html>
  <html lang="id">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Formulir Pendaftaran Mahasiswa Baru</title>
    </head>
    <body>

      <!-- Gambar di ATAS form -->
      <img src="img/banner-ugm.png"
        alt="Banner Universitas Gadjah Mada" height="128">

      <h1>Formulir Pendaftaran Mahasiswa Baru</h1>
      <p>Universitas Gadjah Mada &mdash; Tahun Akademik 2025/2026</p>

      <form action="/proses-daftar" method="post" enctype="multipart/form-data">

        <!-- ── Fieldset 1: Foto Profil ── -->
        <fieldset>
          <legend>Foto Profil</legend>

          <!-- Gambar foto profil DI DALAM form -->
          <img src="img/pas-foto.png" height="96"
            alt="Foto Profil Pendaftar">

          <label for="foto">Unggah Foto (JPG/PNG, maks. 2 MB):</label>
          <input type="file" id="foto" name="foto" accept="image/jpeg,image/png">
        </fieldset>

        <!-- ── Fieldset 2: Data Pribadi ── -->
        <fieldset>
          <legend>Data Pribadi</legend>

          <label for="nama">Nama Lengkap (sesuai KTP):</label>
          <input type="text" id="nama" name="nama"
            placeholder="Nama lengkap tanpa gelar"
            required autofocus>

          <label for="nik">Nomor Induk Kependudukan (NIK):</label>
          <input type="text" id="nik" name="nik"
            placeholder="16 digit NIK" maxlength="16" size="20" required>

          <label for="ttl">Tanggal Lahir:</label>
          <input type="date" id="ttl" name="ttl" required>

          <label for="jk">Jenis Kelamin:</label>
          <select id="jk" name="jk" required>
            <option value="" disabled selected>-- Pilih --</option>
            <optgroup label="Jenis Kelamin">
              <option value="L">Laki-laki</option>
              <option value="P">Perempuan</option>
            </optgroup>
          </select>

          <label for="agama">Agama:</label>
          <select id="agama" name="agama" required>
            <option value="" disabled selected>-- Pilih Agama --</option>
            <optgroup label="Agama yang diakui">
              <option value="islam">Islam</option>
              <option value="kristen">Kristen Protestan</option>
              <option value="katolik">Katolik</option>
              <option value="hindu">Hindu</option>
              <option value="buddha">Buddha</option>
              <option value="konghucu">Konghucu</option>
            </optgroup>
          </select>

          <label for="email">Alamat Email:</label>
          <input type="email" id="email" name="email"
            placeholder="contoh@email.com" required>

          <label for="telp">Nomor Telepon:</label>
          <input type="tel" id="telp" name="telp" placeholder="08xxxxxxxxxx">

          <label for="alamat">Alamat Domisili:</label>
          <textarea id="alamat" name="alamat" rows="3"
            placeholder="Jalan, nomor, RT/RW, kelurahan, kecamatan, kota"></textarea>
        </fieldset>

        <!-- ── Fieldset 3: Data Akademik ── -->
        <fieldset>
          <legend>Data Akademik</legend>

          <label for="prodi">Program Studi yang Dituju:</label>
          <select id="prodi" name="prodi" required>
            <option value="" disabled selected>-- Pilih Program Studi --</option>
            <optgroup label="Sekolah Vokasi">
              <option value="ti-sv">Teknologi Informasi (D4)</option>
              <option value="el-sv">Teknologi Listrik (D4)</option>
              <option value="ak-sv">Akuntansi (D4)</option>
            </optgroup>
            <optgroup label="Fakultas Teknik">
              <option value="if-s1">Informatika (S1)</option>
              <option value="ee-s1">Teknik Elektro (S1)</option>
              <option value="ce-s1">Teknik Sipil (S1)</option>
            </optgroup>
            <optgroup label="Fakultas MIPA">
              <option value="cs-s1">Ilmu Komputer (S1)</option>
              <option value="math-s1">Matematika (S1)</option>
            </optgroup>
          </select>

          <label for="asal-sekolah">Asal SMA/SMK:</label>
          <input type="text" id="asal-sekolah" name="asal-sekolah"
            list="daftar-sekolah"
            placeholder="Ketik nama sekolah...">
          <datalist id="daftar-sekolah">
            <option value="SMA Negeri 1 Yogyakarta">
            <option value="SMA Negeri 3 Yogyakarta">
            <option value="SMA Negeri 8 Yogyakarta">
            <option value="SMA Negeri 1 Sleman">
            <option value="SMA Muhammadiyah 1 Yogyakarta">
            <option value="SMA Budi Mulia Yogyakarta">
            <option value="SMK Negeri 2 Yogyakarta">
          </datalist>

          <label for="tahun-lulus">Tahun Lulus:</label>
          <input type="number" id="tahun-lulus" name="tahun-lulus"
            min="2010" max="2030" placeholder="Contoh: 2024">
        </fieldset>

        <!-- Field readonly: informatif, nilainya tetap terkirim -->
        <label for="jalur">Jalur Pendaftaran:</label>
        <input type="text" id="jalur" name="jalur"
          value="Seleksi Mandiri 2025" readonly>
        </fieldset>

        <!-- ── Fieldset 5: Pernyataan ── -->
        <fieldset>
          <legend>Pernyataan Pendaftar</legend>
          <label>
            <input type="checkbox" name="setuju" required>
            Saya menyatakan bahwa seluruh data yang saya isikan adalah benar,
            lengkap, dan dapat dipertanggungjawabkan.
          </label>
        </fieldset>

        <button type="submit"
          formaction="/simpan-draft" formmethod="post">
          Simpan Draft
        </button>
        <button type="submit"
          formaction="/kirim-final" formmethod="post">
          Kirim Pendaftaran
        </button>
        <button type="reset">Reset</button>
      </form>
    </body>
  </html>
  ```,
  // caption: [Kode lengkap form pendaftaran mahasiswa baru dengan gambar, fieldset, datalist, output, optgroup, dan atribut form lanjutan],
)

#img("assets/form-final.png", caption: [Form pendaftaran mahasiswa baru], width: 16cm)

=== Perbedaan Atribut `disabled` dan `readonly`

Kedua atribut ini sama-sama mencegah pengguna mengubah nilai sebuah elemen input, namun keduanya memiliki perbedaan perilaku yang mendasar di tiga dimensi: interaksi pengguna, pengiriman data, dan tampilan visual @mdn-input.

Atribut `readonly` hanya mengunci nilai input agar tidak dapat diubah secara langsung oleh pengguna, tetapi elemen tersebut masih aktif secara fungsional: pengguna dapat mengkliknya, teks di dalamnya masih dapat disorot dan disalin, elemen tersebut masih dapat mendapatkan fokus dari keyboard, dan yang terpenting, nilainya *tetap dikirimkan* ke server saat form di-_submit_ @w3schools-input-attr. Atribut `readonly` hanya berlaku pada input bertipe `text`, `search`, `url`, `tel`, `email`, `password`, `date`, `month`, `week`, `time`, `datetime-local`, dan `number`, serta pada `<textarea>`.

Atribut `disabled` menonaktifkan elemen sepenuhnya. Elemen yang dinonaktifkan tidak dapat diklik, tidak dapat menerima fokus keyboard, tidak dapat disorot, dan nilainya *tidak dikirimkan* ke server sama sekali @mdn-input @whatwg-html. Browser juga menampilkan elemen `disabled` dengan warna yang lebih pudar (abu-abu) sebagai indikator visual bahwa elemen tersebut tidak aktif. Atribut `disabled` dapat diterapkan pada semua elemen form, termasuk `<input>`, `<select>`, `<textarea>`, `<button>`, `<fieldset>`, dan `<optgroup>`.

#code(
  ```html
  <form action="/cek-data" method="post">
    <!-- Normal: bisa diubah, terkirim -->
    <label>Normal:</label>
    <input type="text" name="field-normal" value="Bisa diubah">

    <!-- Readonly: tidak bisa diubah, tapi TERKIRIM -->
    <label>Readonly:</label>
    <input type="text" name="field-readonly" value="Terkunci (tetap terkirim)"
           readonly>

    <!-- Disabled: tidak aktif sama sekali, TIDAK TERKIRIM -->
    <label>Disabled:</label>
    <input type="text" name="field-disabled" value="Tidak aktif (tidak terkirim)"
           disabled>

    <button type="submit">Submit & Lihat Data Terkirim</button>
  </form>
  ```,
  // caption: [Perbandingan langsung antara input normal, `readonly`, dan `disabled`],
)

#img("assets/readonly-vs-disabled.png", caption: [Tampilan visual perbedaan field normal, readonly, dan disabled di browser])

Tabel berikut merangkum perbedaan antara kedua atribut secara sistematis.

#tbl(
  columns: (auto, 1fr, 1fr),
  inset: 9pt,
  align: left,
  stroke: 0.5pt,
  table.header(
    [*Aspek*],
    [*`readonly`*],
    [*`disabled`*],
  ),
  [Nilai dapat diubah pengguna],
  [Tidak],
  [Tidak],
  [Nilai dikirim saat submit],
  [*Ya*],
  [*Tidak*],
  [Dapat menerima fokus keyboard],
  [Ya],
  [Tidak],
  [Teks dapat disorot / disalin],
  [Ya],
  [Tidak],
  [Tampilan visual browser],
  [Sama seperti input normal],
  [Abu-abu / redup],
  [Berlaku pada elemen],
  [`<input>` tipe tertentu, `<textarea>`],
  [Semua elemen form],
  [Event JavaScript aktif],
  [Ya],
  [Tidak],
)

Pilihan antara keduanya bergantung pada kebutuhan. Gunakan `readonly` ketika data sudah terisi secara otomatis (misalnya nomor referensi atau tanggal sistem) namun nilainya tetap perlu dikirimkan ke server. Gunakan `disabled` ketika sebuah field memang belum relevan untuk pengguna saat ini, misalnya field yang baru aktif setelah kondisi tertentu terpenuhi, sehingga datanya tidak perlu ikut dikirimkan.


= Kesimpulan

Praktikum pertemuan keempat berhasil mencapai seluruh tujuan yang ditetapkan.

Pertama, berbagai elemen form HTML beserta atribut-atributnya berhasil dipelajari dan diimplementasikan. Elemen `<input>` terbukti sangat serbaguna dengan belasan tipe yang masing-masing membawa validasi dan antarmuka bawaan berbeda, mulai dari `email` yang memvalidasi format alamat surel hingga `date` yang memunculkan pemilih tanggal secara otomatis.

Kedua, elemen-elemen form lanjutan berhasil dipahami dan dipraktikkan. Elemen `<fieldset>` dan `<legend>` memberikan struktur semantik yang meningkatkan keterbacaan dan aksesibilitas form panjang. Elemen `<datalist>` menghadirkan fitur _autocomplete_ tanpa membatasi pilihan pengguna, berbeda dari `<select>`. Elemen `<output>` memungkinkan tampilan hasil kalkulasi secara dinamis tanpa harus menulis elemen HTML tambahan yang terpisah. Elemen `<option>` dan `<optgroup>` bekerja sama untuk membangun daftar pilihan yang terstruktur dan mudah dinavigasi.

Ketiga, gambar berhasil disisipkan baik di atas form menggunakan `<img class="header-banner">` maupun di dalam form sebagai foto profil interaktif dengan pratinjau bawaan JavaScript. Keempat, grafik berbasis web berhasil diimplementasikan menggunakan SVG untuk grafik vektor yang dapat diskalakan, dan Canvas untuk gambar berbasis piksel yang dikontrol melalui JavaScript.

Temuan penting dari praktikum ini adalah perbedaan mendasar antara atribut `readonly` dan `disabled`: `readonly` hanya mengunci input dari perubahan namun tetap mengirimkan nilainya ke server, sementara `disabled` menonaktifkan elemen sepenuhnya sehingga nilainya tidak ikut terkirim. Kesalahan dalam memilih antara keduanya dapat menyebabkan bug logika yang tidak terlihat secara visual, terutama pada form yang mengandalkan data tertentu untuk diproses oleh server.
