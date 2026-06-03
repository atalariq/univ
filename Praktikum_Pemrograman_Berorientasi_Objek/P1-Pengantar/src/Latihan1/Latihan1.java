public class Main {
  public static void main(String[] args) {
    int panjang = 58;
    int lebar = 88;
    int tinggi = 7;

    int volume = HitungVolumeBalok(panjang, lebar, tinggi);
    System.out.println("Volume Balok = " + volume);

  }

  public static int HitungVolumeBalok(int panjang, int lebar, int tinggi) {
    return panjang * lebar * tinggi;
  }

}
