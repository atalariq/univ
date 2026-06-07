public class Main {
  public static void main(String[] args) {
    int alasSegitiga = 98;
    int tinggiSegitiga = 57;
    double luas = HitungLuasSegitiga(alasSegitiga, tinggiSegitiga);
    System.out.println("Luas Segitiga = " + luas);
  }

  public static double HitungLuasSegitiga(int alas, int tinggi) {
    return (alas * tinggi) / 2;
  }
}
