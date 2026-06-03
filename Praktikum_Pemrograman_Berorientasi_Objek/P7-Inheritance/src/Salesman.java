public class Salesman extends Employee {

  private static int counter = 0;
  private double salesAmount; // Realisasi penjualan
  private double salesTarget; // Target penjualan

  public Salesman(String name, double salary, Gender gender,
      double salesAmount, double salesTarget) {
    super(name, salary, gender);
    this.salesAmount = salesAmount;
    this.salesTarget = salesTarget;
    this.nik = "S" + String.format("%03d", ++counter);
  }

  /**
   * THR Salesman:
   * - Penjualan >= target: 2x gaji
   * - Penjualan < target: 1x gaji
   */
  @Override
  public double getTHR() {
    return (salesAmount >= salesTarget) ? 2 * salary : salary;
  }

  public boolean hasReachedTarget() {
    return salesAmount >= salesTarget;
  }

  public double getSalesAmount() {
    return salesAmount;
  }

  public double getSalesTarget() {
    return salesTarget;
  }

  @Override
  public String toString() {
    String status = hasReachedTarget() ? "Target Tercapai" : "Target Tidak Tercapai";
    return super.toString() + " [Salesman - " + status + "]";
  }
}
