public class Manager extends Pegawai {
  Manager(String nama, int lamaKerja) {
    this.nama = nama;
    this.lamaKerja = lamaKerja;
    this.posisi = "Manager";
  }

  @Override
  public long ambilSlip() {
    return 12_000_000L;
  }
}
