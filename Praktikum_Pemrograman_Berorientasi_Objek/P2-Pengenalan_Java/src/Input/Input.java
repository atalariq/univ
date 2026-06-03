import java.util.Scanner;

public class Input {
  public static void main(String[] args) {
    // Scanner scanner = new Scanner(System.in);
    // String nama = scanner.nextLine();
    // System.out.println("Nama: " + nama);

    Scanner s = new Scanner(System.in).useDelimiter("\\s*-\\s*");
    System.out.println("Inputkan 3 string yang diikuti '-' di tiap kata (contoh: a-b-c-) ");
    System.out.println(s.next());
    System.out.println(s.next());
    System.out.println(s.next());
    s.close();
  }
}
