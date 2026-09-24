public class Main{
  public static void main(String[] args){
    int gallon = 10;
    double liter = konversi(gallon);
    System.out.println(gallon + " gallon = " + liter + " liter");
  }

  public static double konversi(int gallon){
    return (double) gallon * 3.7854;
  }
}
