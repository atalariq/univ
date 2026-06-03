public class Archer extends Entity {
  public Archer(String nama) {
    super(nama, 10, 15, 1);
  }

  public void doubleShot(Entity target) {
    System.out.printf("%s : RASAKAN DOUBLE SHOT KU%n", nama);
    attack(target);
    if (target.health > 0) {
      attack(target);
    }
  }
}
