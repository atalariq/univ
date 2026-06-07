#import "./template.typ": *
#import "@preview/numbly:0.1.0": numbly

#show: report.with(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "Praktikum Pemrograman Berorientasi Objek",
  course-code: "PPBO",
  lecturer: "Imam Fahrurrozi, S.T., M.Cs.",
  meeting: "3",
  title: "Array dan Perulangan",

  minimal: false,
  show-table-of-content: true,
  show-table-of-figure: false,
  show-table-of-table: false,
  show-bibliography: true,

  paper: "a4",
  font: "Times New Roman",
  font-size: 12pt,
  
  add-indentation-every-paragraph: true,
  line-spacing: 1.5,
  heading-numbering-preset: "1.",
  show-page-number: false,
  page-number-position: "bottom-center",
  export-preset: "screen",
)

#set heading(numbering: numbly("{1:A}.", "{2}.", "{2}.{3}", "{2}.{3}.{4}"))


= Tujuan Praktikum

+ Memahami konsep deklarasi, inisialisasi, dan manipulasi array satu dimensi dan dua dimensi dalam bahasa pemrograman Java.
+ Menerapkan berbagai struktur kontrol perulangan (for, while, do-while, dan for-each) untuk mengolah data dalam array.
+ Mampu mengimplementasikan konsep array dan perulangan dengan studi kasus pembuatan aplikasi CLI yang interaktif.


= Dasar Teori

== Array di Java

Array adalah objek yang menyimpan sejumlah variabel dengan tipe data yang sama. Elemen di dalam array diakses menggunakan index yang dimulai dari nol sampai jumlah elemen dikurangi satu. Dalam bahasa Java, array memiliki ukuran tetap yang ditentukan saat instansiasi dan tidak dapat diubah ukurannya setelah itu. Sebagai sebuah objek, array dialokasikan di dalam heap memory sedangkan variabel referensinya berada di stack memory. Java juga memungkinkan pembuatan array di dalam array untuk membentuk struktur dua dimensi yang fleksibel di mana setiap baris bisa memiliki jumlah kolom yang berbeda (jagged array) @deitel2019.

=== Contoh Implementasi

#code(
  ```java
  import java.util.Arrays;

  public class Main {
    public static void main(String[] args) {
      int[] array1;
      array1 = new int[3];
      array1[0] = 3;
      array1[1] = 3;
      array1[2] = 3;
      int jumlah = array1[0] + array1[1] + array1[2];
      System.out.println(jumlah);

      char array2[] = new char[5];
      array2[0] = 'b';
      array2[1] = 'a';
      array2[2] = 'k';
      array2[3] = 's';
      array2[4] = 'o';
      String teks = "" + array2[0] + array2[1] + array2[2] + array2[3] + array2[4];
      System.out.println(teks);

      int array3[] = { 10, 20, 30, 40, 50 };
      int array4[] = new int[] { 11, 22, 33, 44, 55 };
      System.out.println(Arrays.toString(array3));
      System.out.println(Arrays.toString(array4));

      int baris = 2;
      int kolom = 3;
      int tabel[][] = new int[baris][kolom];
      tabel[0][0] = 1;
      tabel[0][1] = 2;
      tabel[0][2] = 3;
      tabel[1][0] = 4;
      tabel[1][1] = 5;
      tabel[1][2] = 6;

      String teksTabel1 = "" + tabel[0][0] + tabel[0][1] + tabel[0][2];
      String teksTabel2 = "" + tabel[1][0] + tabel[1][1] + tabel[1][2];
      System.out.println(teksTabel1);
      System.out.println(teksTabel2);

    }
  }
  ```
)

Output: #img("assets/latihan-array.png")


== Struktur Perulangan

Perulangan memungkinkan pengeksekusian blok kode secara iteratif selama kondisi tertentu terpenuhi.

+ For loop digunakan saat jumlah iterasi sudah diketahui dengan pasti (definite iteration).
+ While loop melakukan pengecekan kondisi di awal (pre-test loop) sebelum menjalankan blok kode.
+ Do-while loop menjamin blok kode dijalankan minimal satu kali karena pengecekan kondisi dilakukan di akhir (post-test loop) @oracle17.
+ Enhanced for loop (for-each) digunakan khusus untuk mengiterasi seluruh elemen dalam array atau koleksi tanpa perlu mengelola index secara manual.

=== Contoh Implementasi

#code(
  ```java
  public class Main {
    public static void main(String[] args) {
      latihan1();
      latihan2();
      latihan3();
      latihan4();
      praktikConditionalStatement();
      latihan5();
    }

    public static void latihan1() {
      heading("Latihan 1: for, forEach, while, do while loop");
      for (int i = 1; i <= 5; i++) {
        System.out.print(i + " ");
      }
      System.out.printf("\n");

      int arr[] = { 10, 20, 30, 40, 50 };
      for (int x : arr) {
        System.out.print(x + " ");
      }
      System.out.printf("\n");

      int N = 1;
      while (N <= 5) {
        System.out.print(N++ + " ");
      }
      System.out.printf("\n");

      N = 1;
      do {
        System.out.print(N++ + " ");
      } while (N <= 5);
      System.out.printf("\n");

    }

    public static void latihan2() {
      heading("Latihan 2: faktorial");
      int faktorial = 5;
      int hasil = 1;
      for (int i = 2; i <= faktorial; i++) {
        hasil *= i;
      }
      System.out.println(String.format("Hasil dari faktorial %d adalah %d", faktorial, hasil));

    }

    public static void latihan3() {
      heading("Latihan 3: bakSoo");
      char bakso[] = { 'b', 'a', 'k', 'S', 'o', 'o' };
      String teks = "";
      for (char ch : bakso) {
        teks += ch;
      }
      System.out.printf("Gabungan char di array `bakso`: %s\n", teks);

    }

    public static void latihan4() {
      heading("Latihan 4: akar kuadrat");
      int x = 20;
      for (int i = 1; i <= x; i++) {
        double akarKuadrat = Math.sqrt(i);
        System.out.printf("%d\tAkar: %f\n", i, akarKuadrat);
        System.out.println("\tError: " + ((double) i - (akarKuadrat * akarKuadrat)));
      }

    }

    public static void latihan5() {
      heading("Latihan 5: Array 2D");
      int baris = 3, kolom = 4;
      int tabel[][] = new int[baris][kolom];
      int cnt = 1;

      for (int i = 0; i < baris; i++) {
        for (int j = 0; j < kolom; j++) {
          tabel[i][j] = cnt++;
        }
      }

      for (int i = 0; i < baris; i++) {
        String teksTabel = "";
        for (int j = 0; j < kolom; j++) {
          teksTabel += tabel[i][j] + " ";
        }
        System.out.println(teksTabel);
      }

    }

    public static void praktikConditionalStatement() {
      heading("Practice: Conditional Statement");
      // - continue -> go to next iteration
      // - break -> stop the iteration

      for (int i = 1; i <= 10; ++i) {
        if (i % 2 == 0) {
          continue;
        }
        System.out.print(i + " ");
      }
      System.out.printf("\n");
      for (int i = 1; i <= 10; ++i) {
        if (i == 5) {
          break;
        }
        System.out.print(i + " ");
      }
      System.out.printf("\n");
      for (int i = 1; i <= 3; ++i) {
        for (int j = 1; j <= 3; ++j) {
          if (i + j == 3) {
            continue;
          }
          if (i + j == 5) {
            break;
          }
          System.out.printf("[%d, %d] ", i, j);
        }
        System.out.printf("\n");
      }

    }

    public static void heading(String title) {
      int len = title.length();
      System.out.println();
      System.out.println("" + "-".repeat(len));
      System.out.println(title);
      System.out.println("" + "-".repeat(len));
    }
  }
  ```
)

 #img("assets/latihan-perulangan-1.png")
 #img("assets/latihan-perulangan-2.png")
 #img("assets/latihan-perulangan-3.png")

== Input CLI dengan Scanner

Kelas Scanner digunakan untuk mengambil input dari pengguna. Dalam praktik pengembangan Java, penggunaan Integer.parseInt(scanner.nextLine()) sering kali lebih disukai daripada scanner.nextInt() untuk menghindari masalah sisa karakter newline di dalam input buffer yang dapat menyebabkan bug pada pembacaan input berikutnya @stackoverflow2015.

#pagebreak()

= Hasil dan Pembahasan

== Tugas 1: Analisis Nilai Array

=== Deskripsi Soal

Buatlah program Java yang dapat menerima masukan angka ke dalam array dengan ukuran tertentu, kemudian tampilkan seluruh angka dalam array tersebut, setelah itu hitung nilai rata-rata dari angka dalam array dan tampilkan angka yang lebih besar dari rata-rata.

=== Kode Program
#code(
  ```java
  import java.util.Scanner;
  import java.util.ArrayList;

  public class Main {
    public static final Scanner input = new Scanner(System.in);

    public static void main(String[] args) {
      int size = getIntInput("Masukkan size array: ");
      int number[] = new int[size];
      int sum = 0;

      System.out.println("Masukkan angka array: ");
      for (int i = 0; i < size; i++) {
        number[i] = getIntInput(String.format("Angka %d: ", i + 1));
        sum += number[i];
      }

      System.out.print("Final array: ");
      for (int i = 0; i < size; i++) {
        System.out.printf("%d%s", number[i], (i < size - 1 ? ", " : "\n"));
      }

      double average = (double) sum / size;
      System.out.printf("Rata-rata: %.1f\n", average);

      ArrayList<Integer> numberAboveAverage = new ArrayList<>();
      for (int x : number) {
        if ((double) x > average) {
          numberAboveAverage.add(x);
        }
      }

      System.out.print("Angka yang lebih besar dari rata-rata: ");
      if (numberAboveAverage.size() > 0) {
        System.out.println(numberAboveAverage);
      } else {
        System.out.println("Tidak ada angka yang lebih besar dari rata-rata.");
      }
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
  ```
)

=== Penjelasan

+ Program dimulai dengan meminta ukuran array yang divalidasi oleh fungsi pembantu getIntInput agar input tidak menyebabkan NumberFormatException.
+ Perulangan for digunakan untuk mengisi elemen array sekaligus menjumlahkan nilainya (sum) untuk efisiensi waktu pemrosesan (one-pass algorithm).
+ Nilai rata-rata dihitung dengan membagi sum terhadap size menggunakan explicit casting ke tipe double agar presisi desimal terjaga.
+ Program menggunakan perulangan for-each untuk memfilter elemen yang nilainya di atas rata-rata dan menyimpannya ke dalam ArrayList karena jumlahnya yang dinamis.

=== Output

#img("assets/output-tugas_1-1.png")
#img("assets/output-tugas_1-2.png")

== Tugas 2: Operasi Matriks N x N

=== Deskripsi Soal

Buatlah sebuah program yang dapat menerima input berupa ukuran matriks (N x N), kemudian user dapat memasukan value pada matriks tersebut perbarisnya dengan cara memasukan deret angka yang dipisahkan spasi. nantinya program akan mengeluarkan output berupa nilai terbesar, nilai terkecil, dan jumlah diagonal utama nya.

=== Kode Program
#code(
  ```java
  public class Main {
    public static void main(String[] args) {
      Scanner input = new Scanner(System.in);
      System.out.print("Masukkan size array: ");
      int size = Integer.parseInt(input.nextLine());
      int matrix[][] = new int[size][size];

      int sum = 0, max = Integer.MIN_VALUE, min = Integer.MAX_VALUE;

      for (int i = 0; i < size; i++) {
        System.out.printf("Masukkan angka untuk baris ke-%d (dipisahkan spasi): ", i + 1);
        String s[] = input.nextLine().split("\\s+");

        if (s.length != size) {
          System.out.printf("Jumlah kolom tidak sesuai, silakan masukkan %d buah angka!\n\n", size);
          i--; continue;
        }

        for (int j = 0; j < size; j++) {
          matrix[i][j] = Integer.parseInt(s[j]);
          max = Math.max(max, matrix[i][j]);
          min = Math.min(min, matrix[i][j]);
          if (i == j) sum += matrix[i][j];
        }
      }

      System.out.println("Hasil matriks: ");
      for (int[] row : matrix) {
        for (int val : row) System.out.print(val + " ");
        System.out.println();
      }
      System.out.println("Nilai maksimal: " + max);
      System.out.println("Nilai minimal: " + min);
      System.out.println("Jumlah diagonal utama: " + sum);
    }
  }
  ```
)

=== Penjelasan

+ Program ini memanfaatkan array dua dimensi untuk merepresentasikan matriks kotak.
+ Input dibaca per baris menggunakan nextLine() dan dipisahkan dengan regex split(\\s+) untuk menangani spasi ganda.
+ Diagonal utama diidentifikasi melalui kondisi logika i == j (index baris sama dengan index kolom).
+ Penggunaan sentinel values Integer.MIN_VALUE dan Integer.MAX_VALUE sebagai nilai awal max dan min memastikan perbandingan pertama selalu valid.
+ Validasi dimensi dilakukan dengan mengecek panjang array hasil split untuk memastikan jumlah kolom sesuai dengan yang ditentukan.

=== Output

#img("assets/output-tugas_2-2.png")
#img("assets/output-tugas_2-1.png")

#pagebreak()

= Kesimpulan

Praktikum ini memberikan pemahaman mendalam mengenai penggunaan array dan perulangan di Java. Kesimpulan yang dapat diambil adalah:
+ Array merupakan struktur data yang efisien untuk menyimpan sekumpulan data homogen, meskipun memiliki keterbatasan ukuran yang statis.
+ Struktur perulangan sangat krusial dalam memanipulasi elemen array, baik untuk proses input, output, maupun kalkulasi statistik sederhana.
