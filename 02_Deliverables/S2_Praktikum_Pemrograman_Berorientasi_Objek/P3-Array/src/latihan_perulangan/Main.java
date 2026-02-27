public class Main {
  public static void main(String[] args) {
    // latihan1();
    // latihan2();
    // latihan3();
    // latihan4();
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
