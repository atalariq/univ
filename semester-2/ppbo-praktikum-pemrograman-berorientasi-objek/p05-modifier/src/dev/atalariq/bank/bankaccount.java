// Buatlah kelas BankAccount yang memiliki atribut private saldo dan
// pemilik. Setiap akun bank dibuat harus memiliki nama pemilik dan juga
// saldo awal. Selanjutnya, terdapat method getter untuk mengetahui
// pemilik dan saldo dari akun bank tersebut, terdapat method setter untuk
// mengubah saldo, tetapi hanya jika saldo baru tidak negatif, terdapat
// method deposit untuk menambahkan saldo, dan terdapat method
// withdraw untuk mengambil saldo, pengambilan saldo berhasil apabila
// saldo mencukupi.

import java.text.NumberFormat;
import java.util.Locale;

public class BankAccount {
  private String pemilik;
  private long saldo;

  NumberFormat nf = NumberFormat.getNumberInstance(Locale.of("id"));

  public BankAccount(String pemilik, long saldoAwal) {
    this.pemilik = pemilik;
    this.saldo = saldoAwal;
  }

  public void getInfo() {
    System.out.println("----- Informasi -----");
    getPemilik();
    getSaldo();
    System.out.println("---------------------");
  }

  public void getPemilik() {
    System.out.println("Pemilik: " + this.pemilik);
  }

  public void getSaldo() {
    System.out.println("Saldo  : Rp" + nf.format(this.saldo));
  }

  public void setSaldo(long newSaldo) {
    if (newSaldo < 0) {
      System.out.println("> Saldo tidak boleh negatif!");
      return;
    }

    this.saldo = newSaldo;
    System.out.println("Berhasil update saldo menjadi Rp" + nf.format(newSaldo));
  }

  public void deposit(long newSaldo) {
    if (newSaldo < 0) {
      System.out.println("> Tidak bisa deposit dengan saldo negatif!");
      return;
    }

    this.saldo += newSaldo;
    System.out.println("Berhasil deposit sebesar Rp" + nf.format(newSaldo));
  }

  public void withdraw(long saldo) {
    if (saldo < 0) {
      System.out.println("> Tidak bisa deposit dengan saldo negatif!");
      return;
    }

    if (this.saldo - saldo < 0) {
      System.out.println("> Saldo tidak mencukupi!");
      return;
    }

    this.saldo -= saldo;
    System.out.println("Berhasil withdraw sebesar Rp" + nf.format(saldo));
  }
}
