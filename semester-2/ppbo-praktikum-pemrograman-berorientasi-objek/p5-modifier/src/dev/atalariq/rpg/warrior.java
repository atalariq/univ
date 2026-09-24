public class Warrior extends Entity {
  public Warrior(String nama) {
    super(nama, 15, 10, 3);
  }

  public void berserk() {
    damage += 5;
    System.out.printf("%s : BERSERRKK!!, damage bertambah 5%n", nama);
  }
}
