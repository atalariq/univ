public class RegularEmployee extends Employee {

  private static int counter = 0;

  public RegularEmployee(String name, double salary, Gender gender) {
    super(name, salary, gender);
    this.nik = "K" + String.format("%03d", ++counter);
  }

  @Override
  public double getTHR() {
    return salary;
  }

  @Override
  public String toString() {
    return super.toString() + " [Karyawan Biasa]";
  }
}
