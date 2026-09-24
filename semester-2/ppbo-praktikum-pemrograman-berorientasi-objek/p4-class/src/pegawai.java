public class Pegawai {
  String nama;
  String posisi;
  int lamaKerja;

  Pegawai(String nama, String posisi, int lamaKerja) {
    this.nama = nama;
    this.posisi = posisi;
    this.lamaKerja = lamaKerja;
  }

  // Method ambil slip: mengembalikan gaji bulanan berdasarkan posisi
  public long ambilSlip() {
    switch (this.posisi) {
      case "Direktur":
        return 20_000_000L;
      case "Manager":
        return 12_000_000L;
      case "Staff":
        return 6_000_000L;
      case "Intern":
        return 3_000_000L;
      default:
        return 5_000_000L;
    }
  }

  @Override
  public String toString() {
    return String.format(
        "Pegawai{nama='%s', posisi='%s', lamaKerja=%d thn, slip=Rp%,d}",
        nama, posisi, lamaKerja, ambilSlip());
  }
}
