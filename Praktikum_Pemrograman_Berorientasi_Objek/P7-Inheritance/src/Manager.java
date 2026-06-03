public class Manager extends Employee {

  private static int counter = 0;
  private OfficeType officeType;

  public Manager(String name, double salary, Gender gender, OfficeType officeType) {
    super(name, salary, gender);
    this.officeType = officeType;
    this.nik = "M" + String.format("%03d", ++counter);
  }

  @Override
  public double getTHR() {
    double base = 2 * salary;
    switch (officeType) {
      case BRANCH:
        return base + (0.5 * salary);
      case HEADQUARTERS:
        return base + salary;
      default:
        return base;
    }
  }

  public OfficeType getOfficeType() {
    return officeType;
  }

  @Override
  public String toString() {
    String office = (officeType == OfficeType.BRANCH) ? "Cabang" : "Pusat";
    return super.toString() + " [Manager - Kantor " + office + "]";
  }
}
