#import "./template.typ": *
#import "@preview/numbly:0.1.0": numbly


#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Berorientasi Objek",
  course-code: "PPBO",
  lecturer: "Imam Fahrurrozi, S.T., M.Cs.",
  meeting: "4",
  title: "Class, Field, Method, Constructor, Static, dan Enum",

  // Content
  minimal: false,
  show-table-of-content: true,
  show-table-of-figure: false,
  show-table-of-table: false,
  show-bibliography: true,

  // Document
  paper: "a4",
  font-size: 12pt,
  font: "Times New Roman",
  code-font: "Fira Code",
  export-preset: "screen",
)

#set par(first-line-indent: (all: true, amount: 2em))
#set heading(numbering: numbly("{1:A}.", "{2}.", "{2}.{3}", "{2}.{3}.{4}"))


// ============================================================
// TUJUAN PRAKTIKUM
// ============================================================
= Tujuan Praktikum

+ Memahami konsep class, objek, field, dan method  menggunakan Java.
+ Menguasai pembuatan constructor.
+ Memahami perbedaan antara instance variable dan static variable, serta kapan masing-masing tepat digunakan.
+ Mengimplementasikan method `toString()` sebagai representasi teks dari sebuah objek.
+ Mengenal penggunaan `enum` untuk merepresentasikan sekumpulan nilai konstan.


// ============================================================
// DASAR TEORI
// ============================================================
= Dasar Teori

== Class, Field, dan Method

Class adalah cetak biru (_blueprint_) yang mendefinisikan struktur dan perilaku suatu tipe objek. Ketika sebuah class diinstansiasi, hasilnya disebut _objek_ @oracle-classes. Class terdiri dari dua komponen utama: field (atribut) yang menyimpan data, dan method yang mendefinisikan perilaku atau aksi yang dapat dilakukan objek. Field dapat bertipe primitif seperti `int`, `double`, `boolean`, maupun tipe non-primitif seperti `String` atau objek lain @deitel-java.

#code(
  ```java
  class Buku {
      String judul;      // field bertipe non-primitif (String)
      String penulis;    // field bertipe non-primitif (String)
      int jumlahHalaman; // field bertipe primitif (int)
  }
  ```,
)

Method merupakan fungsi yang dimiliki objek dan bisa menerima parameter input. Setiap method memiliki empat komponen dalam deklarasinya: modifier akses (`public`, `private`, dll.), tipe kembalian (_return type_), nama method, dan daftar parameter @oracle-classes.

#code(
  ```java
  public static int hitungLuas(int panjang, int lebar) {
      return panjang * lebar;
  }
  // public static -> modifier
  // int           -> tipe kembalian
  // hitungLuas    -> nama method
  // int panjang, int lebar -> parameter input
  ```,
)

== Constructor

Constructor adalah method khusus yang otomatis dipanggil saat objek dibuat menggunakan kata kunci `new`. Constructor tidak memiliki return type dan namanya selalu sama dengan nama class @oracle-constructors. Ada dua jenis constructor: _default constructor_ yang tidak menerima parameter, dan _parameterized constructor_ yang menerima satu atau lebih parameter untuk menginisialisasi field saat objek dibuat.

Kata kunci `this` digunakan di dalam constructor atau method untuk merujuk pada instance objek yang sedang aktif. Penggunaan `this` sangat umum ketika nama parameter sama dengan nama field agar keduanya tidak ambigu @eckel-thinking.

#code(
  ```java
  class Lingkaran {
    double jariJari; // field

    // Default constructor
    Lingkaran() {
      this.jariJari = 1.0;
    }

    // Parameterized constructor
    Lingkaran(double jariJari) {
      this.jariJari = jariJari; // this.jariJari = field, jariJari = parameter
    }

    public double getLuas() {
      return Math.PI * this.jariJari * this.jariJari;
    }
  }

  // Pembuatan objek menggunakan kata kunci new
  Lingkaran l1 = new Lingkaran();      // default constructor
  Lingkaran l2 = new Lingkaran(5.0);   // parameterized constructor
  ```,
)

== Method `toString()`

Method `toString()` adalah method dari class `Object` (kelas induk semua class di Java) yang dipanggil secara otomatis ketika sebuah objek dicetak menggunakan `System.out.println()`. Dengan meng-_override_ method ini, kita dapat mendefinisikan sendiri representasi teks dari sebuah objek agar lebih informatif dan mudah dibaca @oracle-tostring.

#code(
  ```java
  class Lingkaran {
      double jariJari;

      @Override
      public String toString() {
          return String.format(
              "Lingkaran[jari-jari=%.1f, luas=%.2f]",
              jariJari, Math.PI * jariJari * jariJari
          );
      }
  }

  Lingkaran l = new Lingkaran(4.0);
  System.out.println(l); // Output: Lingkaran[jari-jari=4.0, luas=50.27]
  ```,
)

== Static Variable dan Static Method

Modifier `static` mengubah kepemilikan suatu field atau method dari _per-objek_ menjadi _per-class_ @oracle-static. Static variable (class variable) hanya ada satu salinan di memori dan digunakan bersama oleh semua instance class tersebut. Ini berbeda dengan instance variable yang setiap objek memiliki salinannya sendiri.

Static method dapat dipanggil langsung melalui nama class tanpa perlu membuat objek terlebih dahulu, dan karena tidak terikat pada instance, static method tidak dapat mengakses instance variable secara langsung @bloch-effective.

#code(
  ```java
  class Counter {
      static int totalDibuat = 0; // shared across all instances
      String nama;

      Counter(String nama) {
          this.nama = nama;
          totalDibuat++; // setiap pembuatan objek menaikkan counter bersama
      }

      public static int getTotalDibuat() {
          return totalDibuat;
      }
  }

  Counter a = new Counter("A");
  Counter b = new Counter("B");
  System.out.println(Counter.getTotalDibuat()); // Output: 2
  ```,
)

== Enum

Enum (_enumeration_) adalah tipe data khusus yang merepresentasikan sekumpulan nilai konstan yang telah terdefinisi @oracle-enum. Enum meningkatkan keterbacaan kode karena menggantikan "magic number" atau string literal dengan nama yang bermakna. Enum dibuat dengan kata kunci `enum` dan diperlakukan seperti class, sehingga bisa memiliki field, constructor, dan method sendiri.

#code(
  ```java
  enum HariKerja {
      SENIN, SELASA, RABU, KAMIS, JUMAT;

      public boolean isAwalMinggu() {
          return this == SENIN || this == SELASA;
      }
  }

  HariKerja hari = HariKerja.SENIN;
  System.out.println(hari.isAwalMinggu()); // true
  System.out.println(hari.ordinal());      // 0 (index mulai dari 0)
  ```,
)

Enum juga berpadu sangat baik dengan `switch` statement karena semua kemungkinan nilai sudah terdefinisi secara eksplisit, sehingga compiler dapat membantu mendeteksi case yang belum ditangani @oracle-enum.

#pagebreak()


// ============================================================
// HASIL DAN PEMBAHASAN
// ============================================================
= Hasil dan Pembahasan

== Latihan 2: ScoreManager

=== Deskripsi Soal

Buatlah sebuah `ScoreManager` yang dapat menambahkan nilai dari setiap anak, serta memiliki method untuk menjumlahkan total semua nilai, mencari rata-rata nilai, nilai tertinggi dan terendah, serta perbedaan nilai tertinggi dan terendah.

=== Analisis Desain

Soal ini mengandung ambiguitas yang perlu dicermati: apakah setiap instance `ScoreManager` mewakili satu anak (lalu statistik agregat diakumulasi lintas semua anak), atau satu `ScoreManager` merepresentasikan seluruh kelas? Implementasi yang dipilih menggunakan model pertama: setiap objek `ScoreManager` adalah satu anak yang bisa memiliki beberapa nilai, sementara statistik agregat (total, rata-rata, tertinggi, terendah) dihitung lintas semua objek menggunakan `static` variable.

Pilihan `static` untuk variabel statistik ini tepat karena data tersebut adalah properti milik "kelas siswa secara keseluruhan", bukan milik satu anak tertentu @oracle-static. Sentinel value `Integer.MIN_VALUE` dan `Integer.MAX_VALUE` digunakan sebagai nilai awal `nilaiTertinggi` dan `nilaiTerendah` agar perbandingan pertama selalu valid tanpa perlu kasus khusus @oracle-integer.

Ada dua hal yang perlu diperbaiki dari implementasi awal. Pertama, `hitungRataanNilai()` memiliki return type `int` yang menyebabkan pembagian integer sehingga hasil desimal terpotong. Sebaiknya dikembalikan sebagai `double`. Kedua, method `main` bawaan hanya menguji dengan dua nilai sehingga kurang merepresentasikan fungsionalitas program secara lengkap.

=== Kode Program

#code(
  ```java
  import java.lang.Math;
  import java.util.ArrayList;

  public class ScoreManager {
    ArrayList<Integer> nilai = new ArrayList<>();

    static int jumlahNilai = 0;
    static int jumlahAnak = 0;
    static int nilaiTertinggi = Integer.MIN_VALUE;
    static int nilaiTerendah = Integer.MAX_VALUE;

    ScoreManager(int nilaiAwal) {
      this.nilai.add(nilaiAwal);
      jumlahNilai += nilaiAwal;
      nilaiTertinggi = Math.max(nilaiTertinggi, nilaiAwal);
      nilaiTerendah = Math.min(nilaiTerendah, nilaiAwal);
      jumlahAnak += 1;
    }

    // Menambahkan nilai untuk anak ini
    public void tambah(int nilaiBaru) {
      this.nilai.add(nilaiBaru);
      jumlahNilai += nilaiBaru;
      nilaiTertinggi = Math.max(nilaiTertinggi, nilaiBaru);
      nilaiTerendah = Math.min(nilaiTerendah, nilaiBaru);
    }

    // Menjumlahkan total semua nilai dari semua anak
    public static int hitungTotalNilai() {
      return jumlahNilai;
    }

    // Mencari rata-rata nilai
    public static double hitungRataanNilai() {
      return (double) jumlahNilai / jumlahAnak;
    }

    // Mencari nilai tertinggi
    public static int cariNilaiTertinggi() {
      return nilaiTertinggi;
    }

    // Mencari nilai terendah
    public static int cariNilaiTerendah() {
      return nilaiTerendah;
    }

    // Menghitung perbedaan nilai tertinggi dan terendah
    public static int hitungJangkauanNilai() {
      return nilaiTertinggi - nilaiTerendah;
    }

    public static void main(String[] args) {
      // Anak 1: Budi
      ScoreManager budi = new ScoreManager(75);
      budi.tambah(80);
      budi.tambah(90);

      // Anak 2: Citra
      ScoreManager citra = new ScoreManager(60);
      citra.tambah(70);

      // Anak 3: Deni
      ScoreManager deni = new ScoreManager(85);
      deni.tambah(95);
      deni.tambah(100);

      System.out.println("Nilai Budi  : " + budi.nilai);
      System.out.println("Nilai Citra : " + citra.nilai);
      System.out.println("Nilai Deni  : " + deni.nilai);
      System.out.println("---");
      System.out.println("Total nilai semua anak : " + ScoreManager.hitungTotalNilai());
      System.out.printf("Rata-rata nilai        : %.2f%n", ScoreManager.hitungRataanNilai());
      System.out.println("Nilai tertinggi        : " + ScoreManager.cariNilaiTertinggi());
      System.out.println("Nilai terendah         : " + ScoreManager.cariNilaiTerendah());
      System.out.println("Jangkauan nilai        : " + ScoreManager.hitungJangkauanNilai());
    }
  }
  ```,
)

=== Penjelasan

+ Setiap pemanggilan constructor membuat objek `ScoreManager` baru yang mewakili satu anak. Constructor langsung memperbarui `jumlahAnak` dan semua statistik agregat sekaligus, menjaga konsistensi data tanpa memanggil method terpisah.
+ Method `tambah()` memperbarui statistik secara _incremental_ di setiap penambahan nilai, bukan menghitung ulang dari awal. Pola ini disebut _running statistics_ dan berjalan dalam $O(1)$ per operasi, jauh lebih efisien dibanding menghitung ulang seluruh list setiap kali.
+ Semua method statistik dideklarasikan `static` karena datanya bersifat global lintas semua instance, sehingga bisa dipanggil tanpa referensi objek: `ScoreManager.hitungTotalNilai()`.
+ Perbaikan dilakukan pada `hitungRataanNilai()`: return type diubah dari `int` ke `double` dan pembilang di-_cast_ eksplisit ke `double` agar hasil pembagian tidak terpotong ke bilangan bulat.

=== Output

#img("assets/scoremanager.png")

== Tugas 1: Pegawai dan Kantor

=== Deskripsi Soal

Buatlah kelas `Pegawai` dengan atribut nama, posisi, dan lama kerja. Kelas ini memiliki method `ambilSlip` yang menghitung gaji berdasarkan posisi. Buatlah juga kelas `Kantor` yang menyimpan daftar pegawai beserta statistik gaji, dan mampu menambahkan serta memecat pegawai.

=== Analisis Desain

Soal ini memiliki beberapa titik ambiguitas. Pertama, "ambil slip berdasarkan posisi" tidak menjelaskan struktur gaji; asumsi yang diambil adalah setiap posisi memiliki gaji tetap yang terdefinisi di dalam method menggunakan `switch`. Kedua, signature `pecatPegawai()` dan `tambahPegawai()` tidak disebutkan parameternya. Implementasi yang logis adalah `tambahPegawai(Pegawai p)` dan `pecatPegawai(String nama)`.

Ada satu masalah desain pada file awal `Kantor.java`: `jumlahGaji` dideklarasikan sebagai `int`. Total gaji sebuah kantor dapat dengan mudah melebihi `Integer.MAX_VALUE` ($approx$ 2,1 miliar). Untuk data gaji dalam Rupiah, tipe ini terlalu sempit dan rawan _integer overflow_, sehingga diganti dengan `long` @bloch-effective.

=== Kode Program: `Pegawai.java`

#code(
  ```java
  public class Pegawai {
    String nama;
    String posisi;
    int lamaKerja;

    Pegawai(String nama, String posisi, int lamaKerja) {
      this.nama = nama;
      this.posisi = posisi;
      this.lamaKerja = lamaKerja;
    }

    // Method ambil slip: mengembalikan gaji bulanan berdasarkan posisi
    public long ambilSlip() {
      switch (this.posisi) {
        case "Direktur":
          return 20_000_000L;
        case "Manager":
          return 12_000_000L;
        case "Staff":
          return 6_000_000L;
        case "Intern":
          return 3_000_000L;
        default:
          return 5_000_000L;
      }
    }

    @Override
    public String toString() {
      return String.format(
          "Pegawai{nama='%s', posisi='%s', lamaKerja=%d thn, slip=Rp%,d}",
          nama, posisi, lamaKerja, ambilSlip());
    }
  }
  ```,
)

=== Kode Program: `Kantor.java`

#code(
  ```java
  import java.util.ArrayList;

  public class Kantor {
    String nama;
    double rataanGaji;
    long jumlahGaji;
    int jumlahPegawai;
    ArrayList<Pegawai> daftarPegawai = new ArrayList<>();

    Kantor(String nama) {
      this.nama = nama;
    }

    public void tambahPegawai(Pegawai p) {
      daftarPegawai.add(p);
      jumlahGaji += p.ambilSlip();
      jumlahPegawai += 1;
      rataanGaji = (double) jumlahGaji / jumlahPegawai;
      System.out.printf("+ '%s' ditambahkan ke %s.%n", p.nama, this.nama);
    }

    public void pecatPegawai(String namaPegawai) {
      for (Pegawai p : daftarPegawai) {
        if (p.nama.equals(namaPegawai)) {
          daftarPegawai.remove(p);
          jumlahGaji -= p.ambilSlip();
          jumlahPegawai -= 1;
          rataanGaji = (jumlahPegawai > 0)
              ? (double) jumlahGaji / jumlahPegawai
              : 0.0;
          System.out.printf("- '%s' telah dipecat dari %s.%n", namaPegawai, this.nama);
          return;
        }
      }
      System.out.printf("Pegawai '%s' tidak ditemukan.%n", namaPegawai);
    }

    @Override
    public String toString() {
      return String.format(
          "Kantor '%s' | Pegawai: %d | Total Gaji: Rp%,d | Rata-rata: Rp%,.0f",
          nama, jumlahPegawai, jumlahGaji, rataanGaji);
    }

    public static void main(String[] args) {
      Kantor kantor = new Kantor("PT Nusantara Teknologi");

      kantor.tambahPegawai(new Pegawai("Ahmad", "Direktur", 10));
      kantor.tambahPegawai(new Pegawai("Bagas", "Manager", 6));
      kantor.tambahPegawai(new Pegawai("Citra", "Staff", 3));
      kantor.tambahPegawai(new Pegawai("Daffa", "Intern", 1));
      kantor.tambahPegawai(new Pegawai("Erlinda", "Staff", 2));

      System.out.println("\n" + kantor);
      System.out.println("Daftar pegawai:");
      for (Pegawai p : kantor.daftarPegawai) {
        System.out.println("- " + p);
      }

      System.out.println();
      kantor.pecatPegawai("Citra");
      kantor.pecatPegawai("Zara");
      System.out.println(kantor);
    }
  }
  ```,
)

=== Penjelasan

+ `ambilSlip()` menggunakan `switch` atas field `posisi` untuk menentukan gaji. Literal angka diakhiri `L` untuk memastikan tipe `long` agar tidak terjadi overflow saat perkalian atau akumulasi @oracle-integer.
+ `tambahPegawai(Pegawai p)` menerima objek `Pegawai` sebagai parameter. Setiap penambahan langsung memperbarui `jumlahGaji`, `jumlahPegawai`, dan `rataanGaji` secara inkremental tanpa iterasi ulang seluruh daftar, menjaga kompleksitas tetap $O(1)$.
+ `pecatPegawai(String namaPegawai)` mengiterasi `daftarPegawai` untuk mencari pegawai berdasarkan nama. Setelah ditemukan, data statistik langsung dikurangkan dan method keluar menggunakan `return` agar iterasi tidak berlanjut sia-sia. Jika pegawai tidak ditemukan, pesan informatif dicetak.
+ Guard condition `jumlahPegawai > 0` pada perhitungan `rataanGaji` di `pecatPegawai` mencegah pembagian dengan nol jika seluruh pegawai dipecat.
+ Method `toString()` di-_override_ pada kedua class agar `System.out.println(kantor)` dan `System.out.println(p)` menghasilkan output yang informatif dan terformat rapi @oracle-tostring.

=== Output

#img("assets/kantor-pegawai.png")

== Tugas 2: RunningTracker

=== Deskripsi Soal

Buatlah class `RunningTracker` untuk mencatat jarak lari harian. Implementasikan method untuk menambah catatan jarak, menghitung total dan rata-rata, menemukan jarak terjauh dan terpendek, serta menghitung selisihnya.

=== Analisis Desain

Berbeda dengan `ScoreManager`, `RunningTracker` dirancang sebagai class berbasis _instance_ (bukan static) karena setiap tracker adalah milik satu pelari. Tidak ada kebutuhan untuk berbagi data lintas instansi. Desain ini sudah tepat.

Implementasi menggunakan pola _running statistics_: setiap kali `tambah()` dipanggil, semua statistik (total, rata-rata, terjauh, terpendek) langsung diperbarui secara inkremental. Ini lebih efisien dibanding menghitung ulang dari awal di setiap pemanggilan getter, karena kompleksitasnya $O(1)$ per operasi, bukan $O(n)$.

Ada satu hal yang perlu diperbaiki: dua komentar method pada implementasi awal tertukar. Komentar di atas `hitungTotalJarak()` berbunyi "Menghitung rata-rata jarak", dan sebaliknya. Ini tidak mempengaruhi fungsionalitas program namun merupakan inkonsistensi dokumentasi yang perlu diperbaiki.

=== Kode Program

#code(
  ```java
  import java.util.ArrayList;

  // RunningTracker: mencatat jarak lari setiap hari (dalam km).
  public class RunningTracker {
    ArrayList<Double> logs = new ArrayList<>();

    // Field untuk menyimpan statistik secara inkremental (optimisasi O(1))
    double totalJarak;
    double rataanJarak;
    double jarakTerjauh;
    double jarakTerpendek;

    RunningTracker(double logAwal) {
      this.logs.add(logAwal);
      this.totalJarak = logAwal;
      this.rataanJarak = logAwal;
      this.jarakTerjauh = logAwal;
      this.jarakTerpendek = logAwal;
    }

    // Menambahkan catatan jarak lari baru
    public void tambah(double catatanJarak) {
      this.logs.add(catatanJarak);
      this.totalJarak += catatanJarak;
      this.rataanJarak = hitungRataanJarak(); // diperbarui setiap tambah
      this.jarakTerjauh = Math.max(this.jarakTerjauh, catatanJarak);
      this.jarakTerpendek = Math.min(this.jarakTerpendek, catatanJarak);
    }

    // Menghitung total jarak dari semua catatan
    public double hitungTotalJarak() {
      return this.totalJarak;
    }

    // Menghitung rata-rata jarak dari semua catatan
    public double hitungRataanJarak() {
      return this.totalJarak / this.logs.size();
    }

    // Mencari jarak terjauh yang pernah dicatat
    public double cariJarakTerjauh() {
      return this.jarakTerjauh;
    }

    // Mencari jarak terpendek yang pernah dicatat
    public double cariJarakTerpendek() {
      return this.jarakTerpendek;
    }

    // Menghitung selisih antara jarak terjauh dan terpendek
    public double hitungJangkauanJarak() {
      return this.jarakTerjauh - this.jarakTerpendek;
    }

    public static void main(String[] args) {
      RunningTracker tracker = new RunningTracker(5.2);
      tracker.tambah(7.8);
      tracker.tambah(3.5);
      tracker.tambah(10.0);
      tracker.tambah(6.4);

      System.out.println("Log jarak       : " + tracker.logs);
      System.out.printf("Total jarak     : %.1f km%n", tracker.hitungTotalJarak());
      System.out.printf("Rata-rata jarak : %.2f km%n", tracker.hitungRataanJarak());
      System.out.printf("Jarak terjauh   : %.1f km%n", tracker.cariJarakTerjauh());
      System.out.printf("Jarak terpendek : %.1f km%n", tracker.cariJarakTerpendek());
      System.out.printf("Jangkauan jarak : %.1f km%n", tracker.hitungJangkauanJarak());
    }
  }
  ```,
)

=== Penjelasan

+ Constructor menerima `logAwal` sebagai catatan hari pertama dan langsung menginisialisasi semua field statistik dengan nilai tersebut. Ini lebih benar dibanding menginisialisasi ke 0 karena `jarakTerjauh` dan `jarakTerpendek` harus dimulai dari nilai nyata pertama, bukan nol.
+ `tambah()` memanggil `hitungRataanJarak()` dan menyimpan hasilnya ke field `rataanJarak`. Ini memastikan nilai rata-rata selalu tersedia dalam $O(1)$ tanpa perlu menghitung ulang saat getter dipanggil.
+ `Math.max()` dan `Math.min()` digunakan untuk memperbarui `jarakTerjauh` dan `jarakTerpendek` secara efisien tanpa perlu membandingkan dengan loop manual.
+ Semua field statistik dibiarkan accessible langsung (tanpa `private` + getter) karena untuk keperluan praktikum ini visibilitas default sudah mencukupi. Pada produksi nyata, enkapsulasi penuh dengan getter lebih dianjurkan @bloch-effective.
+ Perbaikan dokumentasi: komentar `hitungTotalJarak()` dan `hitungRataanJarak()` diperbaiki agar sesuai dengan implementasi aktualnya.

=== Output

#img("assets/runningtracker.png")

#pagebreak()

// ============================================================
// KESIMPULAN
// ============================================================
= Kesimpulan

Praktikum pertemuan keempat ini berhasil mengimplementasikan empat konsep utama pemrograman berorientasi objek dalam Java.

Pertama, konsep class sebagai blueprint terbukti dalam ketiga soal. Setiap class mendefinisikan field yang merepresentasikan keadaan dan method yang merepresentasikan perilaku objeknya. Penggunaan constructor berparameter di semua class memastikan setiap objek langsung berada dalam keadaan valid sejak saat pembuatannya, bukan hanya setelah serangkaian setter dipanggil secara terpisah.

Kedua, penggunaan `static` variable pada `ScoreManager` menunjukkan kasus penggunaan yang tepat: ketika sebuah data adalah milik class secara keseluruhan, bukan milik instansi individual. Ini berbeda dengan `RunningTracker` yang murni berbasis instance karena setiap tracker adalah entitas mandiri.

Ketiga, pola _running statistics_ yang diimplementasikan di `ScoreManager` dan `RunningTracker` menunjukkan cara berpikir efisiensi algoritmik dalam desain class: menyimpan hasil komputasi secara inkremental menghasilkan operasi $O(1)$ per penambahan data, jauh lebih baik dari menghitung ulang $O(n)$ setiap kali getter dipanggil.

Keempat, implementasi `Pegawai` dan `Kantor` sebagai dua class yang saling berinteraksi memperkenalkan konsep _composition_: `Kantor` tidak menyimpan data gaji secara mandiri, melainkan mendelegasikan perhitungannya ke method `ambilSlip()` milik `Pegawai`. Ini membuat tanggung jawab tiap class tetap terfokus dan perubahan struktur gaji cukup dilakukan di satu tempat.
