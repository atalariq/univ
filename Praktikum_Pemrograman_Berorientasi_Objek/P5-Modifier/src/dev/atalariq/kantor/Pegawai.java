abstract class Pegawai {
  protected String nama;
  protected int lamaKerja;
  protected String posisi;

  // Method ambil slip: mengembalikan gaji bulanan berdasarkan posisi
  public abstract long ambilSlip();

  @Override
  public String toString() {
    return String.format(
        "%s {nama='%s', lamaKerja=%d thn, slip=Rp%,d}",
        posisi, nama, lamaKerja, ambilSlip());
  }
}

