package main.java.dev.atalariq.tugas_2;

import java.util.Scanner;
import java.util.ArrayList;

public class Main {

  public static void main(String[] args) {
    Scanner input = new Scanner(System.in);

    // input ukuran dan inisialisasi matriks
    System.out.print("Masukkan size array: ");
    int size = Integer.parseInt(input.nextLine()); // input.nextInt() consume next token. Source: https://stackoverflow.com/questions/26586489/integer-parseintscanner-nextline-vs-scanner-nextint
    int matrix[][] = new int[size][size];


    int sum = 0; // untuk menghitung jumlah diagonal utama
    int max = Integer.MIN_VALUE; // nilai maksimum
    int min = Integer.MAX_VALUE; // nilai minimum

    // input element pada matriks
    for (int i = 0; i < size; i++) {
      System.out.printf("Masukkan angka untuk baris ke-%d (dipisahkan spasi): ", i + 1);
      String s[] = input.nextLine().split("\\s+");

      // handle input yang tidak sesuai
      if (s.length != size) {
        System.out.printf("Jumlah kolom tidak sesuai, silakan masukkan %d buah angka!\n\n", size);

        // trick agar tetap berada di iterasi yang sama
        i--;
        continue;
      }

      // olah inputan dan update variable
      for (int j = 0; j < size; j++) {
        matrix[i][j] = Integer.parseInt(s[j]);
        max = Math.max(max, matrix[i][j]); // update nilai maksimal
        min = Math.min(min, matrix[i][j]); // update nilai minimal
        if (i == j) { // update jumlah nilai diagonal utama
          sum += matrix[i][j];
        }
      }

    }

    // output hasil matriks
    System.out.println("Hasil matriks: ");
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        System.out.printf("%d%s", matrix[i][j], (j < size - 1 ? " " : "\n"));
      }
    }

    System.out.println("Nilai maksimal: " + max);
    System.out.println("Nilai minimal: " + min);
    System.out.println("Jumlah diagonal utama: " + sum);

    input.close();
  }

}
