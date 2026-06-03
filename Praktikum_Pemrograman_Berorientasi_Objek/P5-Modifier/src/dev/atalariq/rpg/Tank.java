public class Tank extends Entity {
  public Tank(String nama) {
    super(nama, 20, 5, 5);
  }

  public void taunt() {
    defense += 5;
    System.out.printf("%s : TAUNTT!!, defense bertambah 5%n", nama);
  }
}
