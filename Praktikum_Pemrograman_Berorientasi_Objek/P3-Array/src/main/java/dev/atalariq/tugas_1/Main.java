import java.util.Scanner;
import java.util.ArrayList;

public class Main {
  public static final Scanner input = new Scanner(System.in);

  public static void main(String[] args) {
    int size = getIntInput("Masukkan size array: ");
    int number[] = new int[size];
    int sum = 0; // untuk menghitung rata-rata

    // input element array
    System.out.println("Masukkan angka array: ");
    for (int i = 0; i < size; i++) {
      number[i] = getIntInput(String.format("Angka %d: ", i + 1));
      sum += number[i]; // optimasi hitung rata-rata
    }

    // output final array
    System.out.print("Final array: ");
    for (int i = 0; i < size; i++) {
      System.out.printf("%d%s", number[i], (i < size - 1 ? ", " : "\n"));
    }

    // hitung rata-rata
    double average = sum / size;
    System.out.printf("Rata-rata: %.1f\n", average);

    // array untuk bilangan yang ada di atas rata-rata
    ArrayList<Integer> numberAboveAverage = new ArrayList<>();
    for (int x : number) {
      if ((double) x > average) {
        numberAboveAverage.add(x);
      }
    }

    // output bilangan yang ada di atas rata-rata
    System.out.print("Angka yang lebih besar dari rata-rata: ");
    if (numberAboveAverage.size() > 0) {
      System.out.println(numberAboveAverage);
    } else {
      System.out.println("Tidak ada angka yang lebih besar dari rata-rata.");
    }

  }

  // helper function untuk input nilai integer
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
