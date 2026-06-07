public class Main {

  public static void main(String[] args) {

    RegularEmployee emp1 = new RegularEmployee("Budi", 5_000_000, Gender.MALE);
    RegularEmployee emp2 = new RegularEmployee("Indah", 4_500_000, Gender.FEMALE);

    Manager mgr1 = new Manager("Cahyo", 10_000_000, Gender.MALE, OfficeType.BRANCH);
    Manager mgr2 = new Manager("Dewi", 12_000_000, Gender.FEMALE, OfficeType.HEADQUARTERS);

    Salesman sales1 = new Salesman("Asep", 6_000_000, Gender.MALE,
        80_000_000, 100_000_000); // Tidak mencapai target
    Salesman sales2 = new Salesman("Bunga", 6_000_000, Gender.FEMALE,
        150_000_000, 100_000_000); // Mencapai target

    // Penambahan cuti langsung (overload int)
    emp1.addLeave(5);
    sales1.addLeave(3);

    // Penambahan cuti berdasarkan tipe (overload LeaveType)
    emp2.addLeave(LeaveType.MATERNITY);
    mgr1.addLeave(LeaveType.MARRIAGE);
    mgr2.addLeave(LeaveType.MATERNITY);
    sales2.addLeave(LeaveType.MARRIAGE);

    // Header
    System.out.println("=".repeat(95));
    System.out.println(" DAFTAR KARYAWAN & INFORMASI PENGGAJIAN");
    System.out.println("=".repeat(95));

    // Print karyawan
    Employee[] employees = { emp1, emp2, mgr1, mgr2, sales1, sales2 };
    for (Employee e : employees) {
      System.out.println(e);
    }

    System.out.println("=".repeat(95));

    System.out.println("\nTotal THR yang dibayarkan perusahaan:");
    double totalTHR = 0;
    for (Employee e : employees) {
      totalTHR += e.getTHR();
    }
    System.out.printf("Total THR: Rp%,.0f%n", totalTHR);
  }
}
