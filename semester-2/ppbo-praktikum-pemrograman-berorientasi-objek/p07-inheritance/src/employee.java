public abstract class Employee {

  protected String nik;
  protected String name;
  protected double salary;
  protected Gender gender;
  protected int leaveBalance;

  public Employee(String name, double salary, Gender gender) {
    this.name = name;
    this.salary = salary;
    this.gender = gender;
    this.leaveBalance = 12;
  }

  public abstract double getTHR();

  public void addLeave(int days) {
    this.leaveBalance += days;
  }

  public void addLeave(LeaveType type) {
    switch (type) {
      case MARRIAGE:
        this.leaveBalance += 2;
        break;
      case MATERNITY:
        if (this.gender == Gender.FEMALE) {
          this.leaveBalance += 90;
        } else {
          this.leaveBalance += 3;
        }
        break;
    }
  }

  public String getNik() {
    return nik;
  }

  public String getName() {
    return name;
  }

  public double getSalary() {
    return salary;
  }

  public Gender getGender() {
    return gender;
  }

  public int getLeaveBalance() {
    return leaveBalance;
  }

  @Override
  public String toString() {
    return String.format(
        "NIK: %-6s | Nama: %-10s | Gaji: Rp%,-12.0f | Cuti: %3d hari | THR: Rp%,.0f",
        nik, name, salary, leaveBalance, getTHR());
  }
}
