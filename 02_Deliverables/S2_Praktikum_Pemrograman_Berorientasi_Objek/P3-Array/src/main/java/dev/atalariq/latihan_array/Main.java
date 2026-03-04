import java.util.Arrays;

public class Main {
  public static void main(String[] args) {
    int[] array1;
    array1 = new int[3];
    array1[0] = 3;
    array1[1] = 3;
    array1[2] = 3;
    int jumlah = array1[0] + array1[1] + array1[2];
    System.out.println(jumlah);

    char array2[] = new char[5];
    array2[0] = 'b';
    array2[1] = 'a';
    array2[2] = 'k';
    array2[3] = 's';
    array2[4] = 'o';
    String teks = "" + array2[0] + array2[1] + array2[2] + array2[3] + array2[4];
    System.out.println(teks);

    int array3[] = { 10, 20, 30, 40, 50 };
    int array4[] = new int[] { 11, 22, 33, 44, 55 };
    System.out.println(Arrays.toString(array3));
    System.out.println(Arrays.toString(array4));

    int baris = 2;
    int kolom = 3;
    int tabel[][] = new int[baris][kolom];
    tabel[0][0] = 1;
    tabel[0][1] = 2;
    tabel[0][2] = 3;
    tabel[1][0] = 4;
    tabel[1][1] = 5;
    tabel[1][2] = 6;

    String teksTabel1 = "" + tabel[0][0] + tabel[0][1] + tabel[0][2];
    String teksTabel2 = "" + tabel[1][0] + tabel[1][1] + tabel[1][2];
    System.out.println(teksTabel1);
    System.out.println(teksTabel2);

  }
}
