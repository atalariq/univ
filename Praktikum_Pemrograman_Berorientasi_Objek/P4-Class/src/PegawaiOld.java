public class Main {
  public static void main(String[] args) {
    Pegawai p1 = new Pegawai("Ahmad", 19, 15_000_000);
    Pegawai p2 = new Pegawai("Burhan", 21, 9_000_000);
    Pegawai p3 = new Pegawai("Cahyo", 20, 11_000_000);

    System.out.println(p1);
    System.out.println(p2);
    System.out.println(p3);
  }
}

public class Pegawai {
  String nama;
  int umur;
  int gaji;

  static int totalPegawai = 0;
  Pegawai(String nama, int umur, int gaji){
    this.nama = nama;
    this.umur = umur;
    this.gaji = gaji;
    totalPegawai += 1;
  }

  public void info(){
    System.out.println(this);
  }

  public String toString(){
    return String.format("Pegawai %s berumur %d memiliki gaji sebesar %d", nama, umur, gaji);
  }
}
