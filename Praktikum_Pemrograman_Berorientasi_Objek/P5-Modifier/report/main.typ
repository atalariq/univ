#import "@local/report:1.0.0": *

#let img(path, alt: none, caption: none, width: 100%) = {
  let _image = image(path, alt: alt, width: width)
  if caption == none {
    align(center)[#_image]
  } else {
    figure(_image, caption: caption, kind: image, supplement: [#CONTENT.supplement.image])
  }
}

#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Berorientasi Objek",
  course-code: "PPBO",
  lecturer: "Imam Fahrurrozi, S.T., M.Cs.",
  meeting: "5",
  title: "Modifier",
  bib: bibliography("references.bib"),
  use-cover: true,
)

#set par(justify: true)
// #set par(first-line-indent: (amount: 0.5in, all: true))
#show raw.where(block: false): set text(weight: "regular")

#daftar-isi()

= Tujuan Praktikum

1. Mampu mengimplementasikan konsep pewarisan (_inheritance_) untuk menstrukturkan ulang kelas-kelas yang memiliki hubungan hierarkis.
2. Mampu menerapkan enkapsulasi dengan menggunakan _access modifier_ (`private`, `public`) untuk melindungi data dalam sebuah kelas dan menyediakan antarmuka yang terkontrol.
3. Mampu mendesain dan mengimplementasikan sistem kelas dengan superclass dan subclass untuk merepresentasikan objek dengan atribut dan perilaku yang berbeda-beda, memanfaatkan polimorfisme.
4. Memahami perbedaan dan kegunaan dari berbagai _access modifier_ (`public`, `protected`, `private`, dan `default`) dalam pemrograman berorientasi objek.

= Dasar Teori

== Pemrograman Berorientasi Objek (PBO)

Pemrograman Berorientasi Objek (PBO) atau dalam bahasa Inggris _Object-Oriented Programming_ (OOP) adalah paradigma pemrograman yang menggunakan konsep "objek" untuk merepresentasikan data dan metode yang beroperasi pada data tersebut. Paradigma ini didasarkan pada konsep dunia nyata di mana segala sesuatu dapat dimodelkan sebagai objek dengan atribut (data) dan perilaku (metode). PBO menekankan pada modularitas, penggunaan kembali kode (_reusability_), dan kemudahan pemeliharaan (_maintainability_) melalui prinsip-prinsip utama yang dikenal sebagai pilar PBO, yaitu enkapsulasi, pewarisan, dan polimorfisme.

Contoh sederhana implementasi konsep objek dalam Java adalah sebagai berikut:

#code(
  header: [ContohObjek.java],
  indentation: 2,
  ```java
  public class Mobil {
    private String merk;
    private int kecepatan;

    public Mobil(String merk) {
      this.merk = merk;
      this.kecepatan = 0;
    }

    public void percepat(int increment) {
      this.kecepatan += increment;
    }
  }
  ```,
)

Pada contoh di atas, kelas `Mobil` merupakan representasi objek dengan atribut `merk` dan `kecepatan`, serta metode `percepat()`. Penggunaan access modifier `private` pada atribut memastikan data terlindungi dari akses langsung luar kelas.

== Enkapsulasi

Enkapsulasi adalah prinsip _pembungkusan_ data dan metode dalam satu unit kelas. Tujuannya adalah untuk menyembunyikan implementasi internal sebuah kelas dari pengguna kelas tersebut, sehingga pengguna tidak perlu mengetahui detail bagaimana data tersebut dikelola. Enkapsulasi memungkinkan developer untuk mengontrol akses terhadap data melalui _getter_ dan _setter_, serta menjaga validitas data.Salah satu implementasi enkapsulasi di Java adalah dengan menggunakan _access modifier_ seperti `private` untuk atribut dan `public` untuk metode antarmuka.

Prinsip enkapsulasi memberikan beberapa keuntungan, antara lain:

- *Keamanan data*: Data tidak dapat dimodifikasi secara langsung dari luar kelas, hanya melalui metode yang telah ditentukan.
- *Validitas data*: Metode setter dapat melakukan validasi sebelum data diubah.
- *Fleksibilitas*: Implementasi internal dapat diubah tanpa mempengaruhi kode yang menggunakan kelas tersebut.
- *Kemudahan pemeliharaan*: Perubahan pada logika internal cukup dilakukan di satu tempat.

Sebagai contoh implementasi prinsip enkapsulasi pada kelas rekening bank:

#code(
  header: [BankAccount.java],
  indentation: 2,
  ```java
  public class BankAccount {
    private long saldo;  // Atribut private terlindungi

    public void setSaldo(long newSaldo) {
      if (newSaldo < 0) return;  // Validasi mencegah saldo negatif
      this.saldo = newSaldo;
    }
  }
  ```,
)

== Access Modifier di Java

Java menyediakan empat tingkat akses untuk mengontrol visibilitas anggota kelas (atribut, metode, dan konstruktor). Masing-masing tingkat akses memiliki aturan visibilitas yang berbeda @oracle:access-modifiers:

/ `public`: Anggota kelas dapat diakses dari mana saja, baik dari dalam package yang sama maupun package berbeda. Tidak ada batasan akses.
/ `protected`: Anggota kelas dapat diakses dari dalam package yang sama dan dari subclass (baik yang berada di package yang sama maupun berbeda).
/ `private`: Anggota kelas hanya dapat diakses dari dalam kelas itu sendiri. Ini memberikan tingkat perlindungan tertinggi.
/ `default`: Anggota kelas dapat diakses dari dalam package yang sama, tetapi tidak dapat diakses dari package berbeda meskipun merupakan subclass.

Tabel berikut merangkum tingkat akses tersebut:

#tbl(
  caption: "Ringkasan Access Modifier di Java",
  columns: (2fr, 1fr, 1fr, 1fr, 1fr),
  [],
  [*Class*],
  [*Package*],
  [*Subclass*],
  [*Semua*],
  [`public`],
  [✓],
  [✓],
  [✓],
  [✓],
  [`protected`],
  [✓],
  [✓],
  [✓],
  [-],
  [`default`],
  [✓],
  [✓],
  [-],
  [-],
  [`private`],
  [✓],
  [-],
  [-],
  [-],
)

Untuk praktikum ini, fokus diberikan pada penggunaan `private` untuk melindungi data sensitif (seperti saldo rekening bank) dan `protected` untuk memungkinkan subclass mengakses atribut superclass.

== Pewarisan (_Inheritance_)

Pewarisan adalah mekanisme di mana sebuah kelas dapat mewarisi atribut dan metode dari kelas lain. Kelas yang mewarisi disebut _subclass_, dan kelas yang diwarisi disebut _superclass_. Pewarisan mendukung hubungan "is-a" di mana subclass adalah bentuk khusus dari superclass @oracle:inheritance. Di Java, pewarisan dilakukan dengan keyword `extends`.

Contoh sederhana pewarisan:

#code(
  header: [Pewarisan.java],
  indentation: 2,
  ```java
  class Hewan {          // Superclass
    protected String nama;
    public void suara() { }
  }

  class Kucing extends Hewan {  // Subclass mewarisi Hewan
    public void suara() {
      System.out.println("Meong");
    }
  }
  ```,
)

Pada contoh di atas, `Kucing` mewarisi semua atribut dan metode dari `Hewan`, sehingga dapat menggunakan `nama` langsung tanpa perlu mendeklarasikannya kembali.

== Polimorfisme

Polimorfisme adalah kemampuan sebuah objek untuk mengambil banyak bentuk. Dalam konteks PBO, polimorfisme memungkinkan objek subclass diperlakukan sebagai objek superclass. Hal ini berguna ketika kita ingin memproses berbagai jenis objek melalui antarmuka yang umum.

Polimorfisme dapat dicapai melalui dua mekanisme:

/ *Override*: Subclass mendefinisikan ulang metode yang diwarisi dari superclass dengan implementasi yang berbeda.
/ *Upcasting*: Objek subclass diperlakukan sebagai objek superclass.

Contoh polimorfisme melalui override:

#code(
  header: [Polimorfisme.java],
  indentation: 2,
  ```java
  class Pegawai {
    public long gaji() { return 0; }
  }

  class Manager extends Pegawai {
    public long gaji() { return 10_000_000; }  // Override
  }

  // Penggunaan polimorfisme
  Pegawai p = new Manager();  // Upcasting
  p.gaji();  // Memanggil Manager.gaji()
  ```,
)

#pagebreak()

= Hasil dan Pembahasan

== Tugas 1: Implementasi Pewarisan pada Hierarki Pegawai

Pada tugas ini, diimplementasikan hierarki kelas untuk Pegawai menggunakan pewarisan. Kelas abstrak `Pegawai` didefinisikan sebagai superclass yang memiliki atribut `nama`, `lamaKerja`, dan `posisi`, serta metode abstrak `ambilSlip()`.

#code(
  header: [Pegawai.java],
  indentation: 2,
  ```java
  abstract class Pegawai {
    protected String nama;
    protected int lamaKerja;
    protected String posisi;

    public abstract long ambilSlip();

    @Override
    public String toString() {
      return String.format(
        "%s {nama='%s', lamaKerja=%d thn, slip=Rp%,d}",
        posisi, nama, lamaKerja, ambilSlip());
    }
  }
  ```,
)

#code(
  header: [Direktur.java],
  indentation: 2,
  ```java
  public class Direktur extends Pegawai {
    Directeur(String nama, int lamaKerja) {
      this.nama = nama;
      this.lamaKerja = lamaKerja;
      this.posisi = "Directeur";
    }

    @Override
    public long ambilSlip() {
      return 20_000_000L;
    }
  }
  ```,
)

#code(
  header: [Manager.java],
  indentation: 2,
  ```java
  public class Manager extends Pegawai {
    Manager(String nama, int lamaKerja) {
      this.nama = nama;
      this.lamaKerja = lamaKerja;
      this.posisi = "Manager";
    }

    @Override
    public long ambilSlip() {
      return 12_000_000L;
    }
  }
  ```,
)

#code(
  header: [Supervisor.java],
  indentation: 2,
  ```java
  public class Supervisor extends Pegawai {
    Supervisor(String nama, int lamaKerja) {
      this.nama = nama;
      this.lamaKerja = lamaKerja;
      this.posisi = "Supervisor";
    }

    @Override
    public long ambilSlip() {
      return 15_000_000L;
    }
  }
  ```,
)

#code(
  header: [Operasional.java],
  indentation: 2,
  ```java
  public class Operasional extends Pegawai {
    Operasional(String nama, int lamaKerja) {
      this.nama = nama;
      this.lamaKerja = lamaKerja;
      this.posisi = "Operasional";
    }

    @Override
    public long ambilSlip() {
      return 8_000_000L;
    }
  }
  ```,
)

Analisis: Implementasi hierarki Pegawai ini menunjukkan penerapan beberapa konsep PBO secara bersamaan:

- *Pewarisan*: Keyword `extends` pada setiap subclass menciptakan hubungan "is-a" dengan `Pegawai`. Setiap jabatan (`Directeur`, `Manager`, `Supervisor`, `Operasional`) adalah bentuk khusus dari `Pegawai`.
- *Access Modifier*: Penggunaan `protected` pada atribut di kelas `Pegawai` memungkinkan subclass mengakses atribut `nama`, `lamaKerja`, dan `posisi` secara langsung, namun tetap terlindungi dari akses luar kelas.
- *Polimorfisme melalui Override*: Metode `ambilSlip()` di-override pada setiap subclass untuk memberikan implementasi spesifik sesuai dengan jabatan masing-masing.
- *Metode Abstrak*: Kelas `Pegawai` sebagai superclass mendefinisikan metode abstrak `ambilSlip()` yang wajib diimplementasikan oleh semua subclass.

Berikut adalah hasil eksekusi program:

#code(
  header: [Tugas1.java],
  ```java
  public class Tugas1 {
    public static void main(String[] args) {
      Direktur direktur = new Direktur("Ariq", 5);
      Supervisor supervisor = new Supervisor("Raha", 3);
      Manager manager = new Manager("Barra", 3);
      Operasional operasional = new Operasional("Hadi", 3);

      System.out.println(direktur);
      System.out.println(supervisor);
      System.out.println(manager);
      System.out.println(operasional);
    }
  }
  ```,
)

#img("assets/tugas1.png", width: 100%, caption: [Output program `Tugas1.java`])

== Tugas 2: Implementasi Enkapsulasi pada BankAccount

Pada tugas ini, diimplementasikan kelas `BankAccount` yang menerapkan enkapsulasi untuk melindungi data saldo dan pemilik. Kelas ini mendemonstrasikan bagaimana access modifier `private` dapat digunakan untuk menyembunyikan data sensitif sekaligus menyediakan antarmuka terkontrol melalui metode publik.

#code(
  header: [BankAccount.java],
  indentation: 2,
  ```java
  public class BankAccount {
    private String pemilik;
    private long saldo;

    public BankAccount(String pemilik, long saldoAwal) {
      this.pemilik = pemilik;
      this.saldo = saldoAwal;
    }

    public void setSaldo(long newSaldo) {
      if (newSaldo < 0) {
        System.out.println("> Saldo tidak boleh negatif!");
        return;
      }
      this.saldo = newSaldo;
    }

    public void deposit(long newSaldo) {
      if (newSaldo < 0) {
        System.out.println("> Tidak bisa deposit dengan saldo negatif!");
        return;
      }
      this.saldo += newSaldo;
    }

    public void withdraw(long saldo) {
      if (saldo < 0) {
        System.out.println("> Tidak bisa deposit dengan saldo negatif!");
        return;
      }
      if (this.saldo - saldo < 0) {
        System.out.println("> Saldo tidak mencukupi!");
        return
      }
      this.saldo -= saldo;
    }
  }
  ```,
)

Analisis: Implementasi `BankAccount` menunjukkan penerapan prinsip enkapsulasi dengan beberapa aspek penting:

- *Penyembunyian Data*: Modifier `private` pada atribut `pemilik` dan `saldo` (baris 14-15) menyembunyikan data dari akses langsung luar kelas. Tidak ada kode di luar kelas `BankAccount` yang dapat memodifikasi `saldo` secara langsung.
- *Antarmuka Terkonrol*: Metode `setSaldo()`, `deposit()`, dan `withdraw()` menyediakan cara terstruktur untuk berinteraksi dengan data. Setiap metode melakukan validasi sebelum mengubah data.
- *Validasi Data*: Setiap metode memvalidasi input sebelum memodifikasi state. Contohnya, `setSaldo()` menolak nilai negatif (baris 17-19), mencegah saldo menjadi negatif.
- *Information Hiding*: Pengguna kelas tidak perlu mengetahui bagaimana data dikelola. Mereka hanya perlu memanggil metode yang tersedia.

Berikut adalah hasil eksekusi program yang menunjukkan validasi data:

#code(
  header: [Tugas2.java],
  numbering: false,
  ```java
  public class Tugas2 {
    public static void main(String[] args) {
      BankAccount acc = new BankAccount("Barra", 1_000_000);
      acc.getInfo();

      acc.setSaldo(-1);  // Ditolak: negatif
      acc.setSaldo(2_000_000);
      acc.getInfo();

      acc.deposit(-1_000_000);  // Ditolak: negatif
      acc.deposit(100_000);
      acc.getInfo();

      acc.withdraw(-200_000);  // Ditolak: negatif
      acc.withdraw(200_000);
      acc.getInfo();

      acc.setSaldo(700_000);
      acc.withdraw(800_000);  // Gagal: saldo tidak cukup
      acc.getInfo();
    }
  }
  ```,
)

#img("assets/tugas2.png", width: 10cm, caption: [Output program `Tugas2.java`])

== Tugas 3: Desain Superclass dan Subclass pada Game RPG

Pada tugas ini, diimplementasikan sistem karakter game RPG menggunakan superclass `Entity` dan subclass `Warrior`, `Tank`, dan `Archer`. Desain ini mendemonstrasikan penggunaan pewarisan untuk mengurangi duplikasi kode dan polimorfisme untuk memperluas fungsionalitas.

#code(
  header: [Entity.java],
  indentation: 2,
  ```java
  public class Entity {
    protected String nama;
    protected int health;
    protected int damage;
    protected int defense;

    public Entity(String nama, int health, int damage, int defense) {
      this.nama = nama;
      this.health = health;
      this.damage = damage;
      this.defense = defense;
    }

    public void attack(Entity target) {
      int dmgDealt = Math.max(0, this.damage - target.defense);
      target.health -= dmgDealt;
      System.out.printf("%s : Berhasil menyerang %s, sisa health %s = %d%n",
          this.nama, target.nama, target.nama, target.health);
      if (target.health <= 0) {
        System.out.printf("Target ( %s ) sudah mati%n", target.nama);
      }
    }

    public void heal() {
      health += 5;
      System.out.printf("%s : Berhasil melakukan heal, nyawamu sekarang %d%n",
          nama, health);
    }

    public void displayInfo() {
      System.out.println("Nama = " + nama);
      System.out.println("Class = " + getClass().getSimpleName());
      System.out.println("Health = " + health);
      System.out.println("Damage = " + damage);
      System.out.println("Defense = " + defense);
      System.out.println("=======================\n");
    }
  }
  ```,
)

Setiap subclass mendefinisikan karakteristik unik mereka:

#code(
  header: [Warrior.java],
  indentation: 2,
  ```java
  public class Warrior extends Entity {
    public Warrior(String nama) {
      super(nama, 15, 10, 3);  // Health=15, Damage=10, Defense=3
    }

    public void berserk() {
      damage += 5;
      System.out.printf("%s : BERSERRKK!!, damage bertambah 5%n", nama);
    }
  }
  ```,
)

#code(
  header: [Tank.java],
  indentation: 2,
  ```java
  public class Tank extends Entity {
    public Tank(String nama) {
      super(nama, 20, 5, 5);  // Health=20, Damage=5, Defense=5
    }

    public void taunt() {
      defense += 5;
      System.out.printf("%s : TAUNTT!!, defense bertambah 5%n", nama);
    }
  }
  ```,
)

#code(
  header: [Archer.java],
  indentation: 2,
  ```java
  public class Archer extends Entity {
    public Archer(String nama) {
      super(nama, 10, 15, 1);  // Health=10, Damage=15, Defense=1
    }

    public void doubleShot(Entity target) {
      System.out.printf("%s : RASAKAN DOUBLE SHOT KU%n", nama);
      attack(target);
      if (target.health > 0) {
        attack(target);
      }
    }
  }
  ```,
)

Analisis: Implementasi sistem RPG ini menunjukkan penerapan beberapa konsep PBO secara terpadu:

- *Superclass dan Subclass*: Kelas `Entity` sebagai superclass mendefinisikan atribut (`nama`, `health`, `damage`, `defense`) dan perilaku dasar (`attack()`, `heal()`) yang dimiliki semua karakter. Setiap subclass mewarisi semua ini tanpa perlu mendeklarasikan ulang.
- *Konstruktor Super*: Setiap subclass memanggil `super(nama, health, damage, defense)` untuk menginisialisasi atribut yang diwarisi. Ini menunjukkan bagaimana data spesifik subclass diteruskan ke superclass.
- *Polimorfisme melalui Override dan Extension*: Setiap subclass tidak hanya meng-override perilaku superclass, tetapi juga menambahkan metode unik (`berserk()`, `taunt()`, `doubleShot()`) yang memperluas fungsionalitas.
- *Perbedaan Karakter*: Masing-masing subclass memiliki statistik yang berbeda, mencerminkan peran berbeda dalam game:
  - `Warrior`: Seimbang dengan damage tinggi
  - `Tank`: Health dan defense tinggi, damage rendah
  - `Archer`: Damage sangat tinggi, tetapi health dan defense rendah

Berikut adalah hasil eksekusi program:


#code(
  header: [Tugas3.java],
  numbering: false,
  ```java
  public class Tugas3 {
    public static void main(String[] args) {
      Warrior W1 = new Warrior("Afif");
      Tank T1 = new Tank("Virza");
      Archer A1 = new Archer("Valdo");

      W1.displayInfo();
      T1.displayInfo();
      A1.displayInfo();

      System.out.println("PHASE 1");
      W1.attack(T1);
      T1.heal();
      A1.attack(W1);

      System.out.println("\nPHASE 2");
      W1.berserk();
      T1.taunt();
      A1.doubleShot(W1);
    }
  }
  ```
)

#img("assets/tugas3.png", caption: [Output program `Tugas3.java`])

#pagebreak()

= Kesimpulan

Berdasarkan hasil praktikum yang telah dilakukan, dapat ditarik kesimpulan sebagai berikut:

1. Konsep pewarisan (`extends`) memungkinkan pembentukan hierarki kelas secara efisien. Kelas `Pegawai` sebagai superclass mendefinisikan struktur dan perilaku umum yang diwarisi oleh semua subclass (`Directeur`, `Manager`, `Supervisor`, `Operasional`). Dengan demikian, duplikasi kode dapat terhindarkan dan hubungan "is-a" antar kelas menjadi jelas terdefinisi.

2. Enkapsulasi dengan `private` attribute dan `public` metode menjamin validitas data. Pada kelas `BankAccount`, penggunaan modifier `private` pada atribut `pemilik` dan `saldo` menyembunyikan data sensitif dari akses langsung luar kelas. Sementara itu, metode publik seperti `setSaldo()`, `deposit()`, dan `withdraw()` menyediakan antarmuka terkontrol dengan validasi input, sehingga data integrity terjaga.

3. Kombinasi `protected` dan `extends` memungkinkan subclass mengakses data superclass sekaligus tetap melindungi data dari akses eksternal. Pada hierarki Pegawai, penggunaan `protected` pada atribut di kelas superclass memungkinkan subclass mengakses atribut secara langsung tanpa perlu menyediakan getter/setter, namun data tetap terlindungi dari luar.

4. Access modifier (`public`, `protected`, `private`, `default`) merupakan mekanisme fundamental untuk mencapai enkapsulasi dan mengontrol visibilitas dalam PBO. Masing-masing modifier memiliki aturan akses yang berbeda, dan pemilihan modifier yang tepat bergantung pada kebutuhan desain kelas.

5. Polimorfisme memungkinkan memperluas fungsionalitas superclass melalui subclass. Pada sistem RPG, setiap karakter (`Warrior`, `Tank`, `Archer`) mewarisi perilaku dasar dari `Entity` tetapi juga menambahkan kemampuan unik mereka sendiri, mendemonstrasikan bagaimana polimorfisme memperkaya desain objek.
