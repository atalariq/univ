import java.lang.Math;
import java.util.ArrayList;

public class ScoreManager {
  ArrayList<Integer> nilai = new ArrayList<>();

  static int jumlahNilai = 0;
  static int jumlahAnak = 0;
  static int nilaiTertinggi = Integer.MIN_VALUE;
  static int nilaiTerendah = Integer.MAX_VALUE;

  ScoreManager(int nilaiAwal) {
    this.nilai.add(nilaiAwal);
    jumlahNilai += nilaiAwal;
    nilaiTertinggi = Math.max(nilaiTertinggi, nilaiAwal);
    nilaiTerendah = Math.min(nilaiTerendah, nilaiAwal);
    jumlahAnak += 1;
  }

  // Menambahkan nilai untuk anak ini
  public void tambah(int nilaiBaru) {
    this.nilai.add(nilaiBaru);
    jumlahNilai += nilaiBaru;
    nilaiTertinggi = Math.max(nilaiTertinggi, nilaiBaru);
    nilaiTerendah = Math.min(nilaiTerendah, nilaiBaru);
  }

  // Menjumlahkan total semua nilai dari semua anak
  public static int hitungTotalNilai() {
    return jumlahNilai;
  }

  // Mencari rata-rata nilai
  public static double hitungRataanNilai() {
    return (double) jumlahNilai / jumlahAnak;
  }

  // Mencari nilai tertinggi
  public static int cariNilaiTertinggi() {
    return nilaiTertinggi;
  }

  // Mencari nilai terendah
  public static int cariNilaiTerendah() {
    return nilaiTerendah;
  }

  // Menghitung perbedaan nilai tertinggi dan terendah
  public static int hitungJangkauanNilai() {
    return nilaiTertinggi - nilaiTerendah;
  }

  public static void main(String[] args) {
    // Anak 1: Budi
    ScoreManager budi = new ScoreManager(75);
    budi.tambah(80);
    budi.tambah(90);

    // Anak 2: Citra
    ScoreManager citra = new ScoreManager(60);
    citra.tambah(70);

    // Anak 3: Deni
    ScoreManager deni = new ScoreManager(85);
    deni.tambah(95);
    deni.tambah(100);

    System.out.println("Nilai Budi  : " + budi.nilai);
    System.out.println("Nilai Citra : " + citra.nilai);
    System.out.println("Nilai Deni  : " + deni.nilai);
    System.out.println("---");
    System.out.println("Total nilai semua anak : " + ScoreManager.hitungTotalNilai());
    System.out.printf("Rata-rata nilai        : %.2f%n", ScoreManager.hitungRataanNilai());
    System.out.println("Nilai tertinggi        : " + ScoreManager.cariNilaiTertinggi());
    System.out.println("Nilai terendah         : " + ScoreManager.cariNilaiTerendah());
    System.out.println("Jangkauan nilai        : " + ScoreManager.hitungJangkauanNilai());
  }
}
