import java.util.ArrayList;

// RunningTracker: mencatat jarak lari setiap hari (dalam km).
public class RunningTracker {
  ArrayList<Double> logs = new ArrayList<>();

  // Field untuk menyimpan statistik secara inkremental (optimisasi O(1))
  double totalJarak;
  double rataanJarak;
  double jarakTerjauh;
  double jarakTerpendek;

  RunningTracker(double logAwal) {
    this.logs.add(logAwal);
    this.totalJarak = logAwal;
    this.rataanJarak = logAwal;
    this.jarakTerjauh = logAwal;
    this.jarakTerpendek = logAwal;
  }

  // Menambahkan catatan jarak lari baru
  public void tambah(double catatanJarak) {
    this.logs.add(catatanJarak);
    this.totalJarak += catatanJarak;
    this.rataanJarak = hitungRataanJarak(); // diperbarui setiap tambah
    this.jarakTerjauh = Math.max(this.jarakTerjauh, catatanJarak);
    this.jarakTerpendek = Math.min(this.jarakTerpendek, catatanJarak);
  }

  // Menghitung total jarak dari semua catatan
  public double hitungTotalJarak() {
    return this.totalJarak;
  }

  // Menghitung rata-rata jarak dari semua catatan
  public double hitungRataanJarak() {
    return this.totalJarak / this.logs.size();
  }

  // Mencari jarak terjauh yang pernah dicatat
  public double cariJarakTerjauh() {
    return this.jarakTerjauh;
  }

  // Mencari jarak terpendek yang pernah dicatat
  public double cariJarakTerpendek() {
    return this.jarakTerpendek;
  }

  // Menghitung selisih antara jarak terjauh dan terpendek
  public double hitungJangkauanJarak() {
    return this.jarakTerjauh - this.jarakTerpendek;
  }

  public static void main(String[] args) {
    RunningTracker tracker = new RunningTracker(5.2);
    tracker.tambah(7.8);
    tracker.tambah(3.5);
    tracker.tambah(10.0);
    tracker.tambah(6.4);

    System.out.println("Log jarak       : " + tracker.logs);
    System.out.printf("Total jarak     : %.1f km%n", tracker.hitungTotalJarak());
    System.out.printf("Rata-rata jarak : %.2f km%n", tracker.hitungRataanJarak());
    System.out.printf("Jarak terjauh   : %.1f km%n", tracker.cariJarakTerjauh());
    System.out.printf("Jarak terpendek : %.1f km%n", tracker.cariJarakTerpendek());
    System.out.printf("Jangkauan jarak : %.1f km%n", tracker.hitungJangkauanJarak());
  }
}
