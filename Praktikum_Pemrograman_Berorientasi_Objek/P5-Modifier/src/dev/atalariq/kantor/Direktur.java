public class Direktur extends Pegawai {
  Direktur(String nama, int lamaKerja) {
    this.nama = nama;
    this.lamaKerja = lamaKerja;
    this.posisi = "Direktur";
  }

  @Override
  public long ambilSlip() {
    return 20_000_000L;
  }
}
