public class Supervisor extends Pegawai {
  Supervisor(String nama, int lamaKerja) {
    this.nama = nama;
    this.lamaKerja = lamaKerja;
    this.posisi = "Supervisor";
  }

  @Override
  public long ambilSlip() {
    return 15_000_000L;
  }
}
