// Entity.java
public class Entity {
  protected String nama;
  protected int health;
  protected int damage;
  protected int defense;

  public Entity(String nama, int health, int damage, int defense) {
    this.nama = nama;
    this.health = health;
    this.damage = damage;
    this.defense = defense;
  }

  public void attack(Entity target) {
    int dmgDealt = Math.max(0, this.damage - target.defense);
    target.health -= dmgDealt;
    System.out.printf("%s : Berhasil menyerang %s, sisa health %s = %d%n",
        this.nama, target.nama, target.nama, target.health);

    if (target.health <= 0) {
      System.out.printf("Target ( %s ) sudah mati%n", target.nama);
    }
  }

  public void heal() {
    health += 5;
    System.out.printf("%s : Berhasil melakukan heal, nyawamu sekarang %d%n",
        nama, health);
  }

  public void displayInfo() {
    System.out.println("Nama = " + nama);
    System.out.println("Class = " + getClass().getSimpleName());
    System.out.println("Health = " + health);
    System.out.println("Damage = " + damage);
    System.out.println("Defense = " + defense);
    System.out.println("=======================\n");
  }
}
