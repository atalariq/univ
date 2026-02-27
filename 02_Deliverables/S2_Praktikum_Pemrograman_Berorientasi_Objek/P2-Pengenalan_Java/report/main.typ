#import "./template.typ": *
#import "@preview/zebraw:0.6.1": *
#show: zebraw

#let vars = (
  meeting: "2",
  title: "Pengenalan Java",
)

#show: report.with(
  // Metadata
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "PRAKTIKUM PEMROGRAMAN BERORIENTASI OBJEK",
  course-code: "PPBO",
  lecturer: "Dr. Imam Fahrurrozi, S. T., M. Cs.",
  meeting: vars.meeting,
  title: vars.title,

  // Document setting
  paper: "us-letter",
  font: "Times New Roman",
  font-size: 12pt,
  lang: "id",
)

#show heading.where(level: 1): it => [
  #set heading(numbering: none)
  #set align(center)
  #set text(weight: 700)
  #pad(it.body)
]

#show heading.where(level: 1): set heading(numbering: none)
#set heading(numbering: (first, ..nums) => numbering("A.", ..nums))

#set par(
  first-line-indent: (amount: 1.5em, all: true)
)

= #[Pertemuan #vars.meeting\ #vars.title]

== Tujuan Percobaan

+ Memahami sintaks dasar bahasa pemrograman Java termasuk deklarasi variabel dan tipe data primitif maupun non-primitif.
+ Menerapkan operasi input dan output menggunakan kelas `Scanner` untuk membuat program antarmuka interaktif.
+ Mengimplementasikan struktur kontrol percabangan seperti `if-else` dan ekspresi `switch` dalam menyelesaikan logika program.

== Dasar Teori

Bahasa Java mengkategorikan tipe data menjadi dua kelompok besar, yaitu primitif dan non-primitif. Tipe data primitif digunakan untuk menyimpan nilai sederhana langsung di dalam memori, contohnya tipe `int` untuk bilangan bulat dan `double` untuk bilangan desimal. Tipe data non-primitif menyimpan kumpulan nilai atau rujukan ke sebuah objek, seperti kelas `String` untuk teks. Proses mendeklarasikan variabel berarti kita memberikan tempat pada penyimpanan memori untuk acuan dari sebuah nilai. Setelah deklarasi dilakukan, kita bisa memberikan nilai pada variabel tersebut, proses ini dinamakan *assignment* variabel.

Alur eksekusi program bisa diarahkan menggunakan struktur kontrol percabangan. Kita menggunakan nilai kondisional untuk menentukan blok kode mana yang harus dijalankan berdasarkan ekspresi spesifik. Java menyediakan percabangan `if-else` untuk mengevaluasi rentang kondisi yang dinamis. Terdapat juga `switch-case` yang digunakan ketika kita perlu mengecek nilai sebuah ekspresi dan mencocokkannya dengan kondisi atau nilai tertentu.

Interaksi antara program dan pengguna diimplementasikan menggunakan kelas `Scanner`. Kelas ini berisikan metode-metode khusus yang digunakan untuk menangkap dan membaca input dari pengguna. Kelas ini diimpor dari paket `java.util.Scanner` dan diinstansiasi dengan parameter `System.in` untuk membaca input teks atau angka dari konsol.

#pagebreak()

== Hasil dan Pembahasan

Kode sumber:
#zebraw(
  numbering: true,
  numbering-separator: true,
  ```java
  import java.util.Scanner;

  public class Main {
    public static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {

      boolean isRunning = true;
      while (isRunning) {
        clearScreen();
        System.out.println("======= Program Keren =======");
        System.out.println("Menu:");
        System.out.println("1) Hitung Volume Balok");
        System.out.println("2) Hitung Luas Segitiga");
        System.out.println("3) Konversi Galon ke Liter");
        System.out.println("4) Exit Program");
        System.out.println("=============================");

        int pilihan = getIntInput("Masukkan Pilihan (1-4): ");
        switch (pilihan) {
          case 1 -> hitungVolumeBalok();
          case 2 -> hitungLuasSegitiga();
          case 3 -> konversiGalonKeLiter();
          case 4 -> isRunning = false;
          default -> {
            System.out.println("Pilihan tidak valid. Ulangi dengan memilih menu 1-4!");
            promptToContinue();
          }
        }
      }
      System.out.println("..... Sampai jumpa lagi ^v^");
      input.close();
    }

    // Volume Balok
    public static void hitungVolumeBalok() {
      int panjang, lebar, tinggi, volume;

      clearScreen();
      System.out.println("=============================");
      System.out.println("Hitung Volume Balok");
      System.out.println("=============================");

      panjang = getIntInput("Masukkan panjang: ");
      lebar = getIntInput("Masukkan lebar  : ");
      tinggi = getIntInput("Masukkan tinggi : ");

      volume = panjang * lebar * tinggi;
      System.out.println(String.format("Volume balok = %d", volume));
      promptToContinue();
    }

    // Luas Segitiga
    public static void hitungLuasSegitiga() {
      int alas, tinggi;
      double luas;

      clearScreen();
      System.out.println("=============================");
      System.out.println("Hitung Luas Segitiga");
      System.out.println("=============================");

      alas = getIntInput("Masukkan alas  : ");
      tinggi = getIntInput("Masukkan tinggi: ");

      luas = alas * tinggi / 2;
      System.out.println(String.format("Luas segitiga = %f", luas));
      promptToContinue();
    }

    // Galon ke Liter
    public static void konversiGalonKeLiter() {
      int galon;
      double liter;

      clearScreen();
      System.out.println("=============================");
      System.out.println("Konversi Galon ke Liter");
      System.out.println("*NOTE: 1 galon = 3.7854 liter");
      System.out.println("=============================");

      galon = getIntInput("Masukkan galon: ");

      liter = galon * 3.7854;
      System.out.println(String.format("%d galon = %f liter", galon, liter));
      promptToContinue();
    }

    public static void promptToContinue() {
      System.out.println("\nTekan Enter untuk melanjutkan...");
      input.nextLine();
    }

    // Source - https://stackoverflow.com/a/32295974
    public static void clearScreen() {
      System.out.print("\033[H\033[2J");
      System.out.flush();
    }

    public static int getIntInput(String prompt) {
      System.out.print(prompt);
      while (true) {
        try {
          return Integer.parseInt(input.nextLine());
        } catch (NumberFormatException e) {
          System.out.print("Input tidak valid!\n" + prompt);
        }
      }
    }
  }
  ```,
)

Program yang dibuat merupakan aplikasi antarmuka baris perintah interaktif. Arsitektur program menggunakan perulangan `while` yang bertindak sebagai pengatur kondisi jalannya aplikasi. Program akan terus berjalan, menampilkan menu utama, dan menunggu input dari pengguna selama variabel `isRunning` bernilai `true`.

Pengguna memasukkan angka pilihan yang kemudian dievaluasi menggunakan struktur `switch`. Implementasi ini menggunakan sintaks modern Java dengan format tanda panah untuk eksekusi yang lebih bersih. Jika pengguna memilih menu tertentu, program akan memanggil fungsi yang sesuai, seperti fungsi untuk menghitung volume balok atau mengonversi satuan galon ke liter.

Setiap fungsi menangani proses pengumpulan variabel, operasi matematika, dan pencetakan hasil ke layar. Terdapat mekanisme perlindungan input pengguna yang diimplementasikan melalui fungsi `getIntInput()`. Fungsi ini membungkus pemanggilan pembacaan teks dengan blok blok validasi eksepsi. Jika pengguna memasukkan teks huruf saat program meminta angka hitungan, program akan menangkap kegagalan tersebut dan meminta pengguna untuk memasukkan ulang angkanya. Hal ini mencegah aplikasi dari penghentian paksa akibat masalah pemformatan angka.

#pagebreak()

== Kesimpulan

Praktikum ini menunjukkan bahwa penguasaan deklarasi variabel dan pemahaman tipe data adalah fondasi menyusun program di Java. Pemanfaatan kelas `Scanner` yang digabungkan dengan struktur percabangan `switch` sangat efektif untuk membangun menu navigasi aplikasi. Pembuatan fungsi validasi input juga menjadi penentu utama untuk memastikan program tetap berjalan stabil tanpa mengalami kendala komputasi saat menerima input yang tidak valid.

== Daftar Pustaka

+ Modul Praktikum PPBO Pertemuan 2: Pengenalan Java.
+ Oracle. "Scanner (Java Platform SE 7)". Docs.oracle.com. https://docs.oracle.com/javase/7/docs/api/java/util/Scanner.html.
