public class Operasional extends Pegawai {
  Operasional(String nama, int lamaKerja) {
    this.nama = nama;
    this.lamaKerja = lamaKerja;
    this.posisi = "Operasional";
  }

  @Override
  public long ambilSlip() {
    return 8_000_000L;
  }
}
