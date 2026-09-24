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
