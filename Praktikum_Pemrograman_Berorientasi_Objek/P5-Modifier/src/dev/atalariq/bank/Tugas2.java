public class Tugas2 {
  public static void main(String[] args) {
    BankAccount acc = new BankAccount("Barra", 1_000_000);
    acc.getInfo();

    acc.setSaldo(-1);
    acc.setSaldo(2_000_000);
    acc.getInfo();

    acc.deposit(-1_000_000);
    acc.deposit(100_000);
    acc.getInfo();

    acc.withdraw(-200_000);
    acc.withdraw(200_000);
    acc.getInfo();

    acc.setSaldo(700_000);
    acc.withdraw(800_000);
    acc.getInfo();
  }
}
