import java.util.ArrayList;

public class Kantor {
  String nama;
  double rataanGaji;
  long jumlahGaji;
  int jumlahPegawai;
  ArrayList<Pegawai> daftarPegawai = new ArrayList<>();

  Kantor(String nama) {
    this.nama = nama;
  }

  public void tambahPegawai(Pegawai p) {
    daftarPegawai.add(p);
    jumlahGaji += p.ambilSlip();
    jumlahPegawai += 1;
    rataanGaji = (double) jumlahGaji / jumlahPegawai;
    System.out.printf("+ '%s' ditambahkan ke %s.%n", p.nama, this.nama);
  }

  public void pecatPegawai(String namaPegawai) {
    for (Pegawai p : daftarPegawai) {
      if (p.nama.equals(namaPegawai)) {
        daftarPegawai.remove(p);
        jumlahGaji -= p.ambilSlip();
        jumlahPegawai -= 1;
        rataanGaji = (jumlahPegawai > 0)
            ? (double) jumlahGaji / jumlahPegawai
            : 0.0;
        System.out.printf("- '%s' telah dipecat dari %s.%n", namaPegawai, this.nama);
        return;
      }
    }
    System.out.printf("Pegawai '%s' tidak ditemukan.%n", namaPegawai);
  }

  @Override
  public String toString() {
    return String.format(
        "Kantor '%s' | Pegawai: %d | Total Gaji: Rp%,d | Rata-rata: Rp%,.0f",
        nama, jumlahPegawai, jumlahGaji, rataanGaji);
  }

  public static void main(String[] args) {
    Kantor kantor = new Kantor("PT Nusantara Teknologi");

    kantor.tambahPegawai(new Pegawai("Ahmad", "Direktur", 10));
    kantor.tambahPegawai(new Pegawai("Bagas", "Manager", 6));
    kantor.tambahPegawai(new Pegawai("Citra", "Staff", 3));
    kantor.tambahPegawai(new Pegawai("Daffa", "Intern", 1));
    kantor.tambahPegawai(new Pegawai("Erlinda", "Staff", 2));

    System.out.println("\n" + kantor);
    System.out.println("Daftar pegawai:");
    for (Pegawai p : kantor.daftarPegawai) {
      System.out.println("- " + p);
    }

    System.out.println();
    kantor.pecatPegawai("Citra");
    kantor.pecatPegawai("Zara");
    System.out.println(kantor);
  }
}
