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
