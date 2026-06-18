// Cheatsheet Java OOP — Inheritance, Polymorphism, Exception/Error, Package
// A4 landscape, 3-column, minimalist. Built for 75 min exam: 75% PG, 25% essay.
// Bolak-balik: Sisi 1 = teori + trap, Sisi 2 = studi kasus + pola essay

#set document(title: [Cheatsheet PBO (UAS)])

#set page(
  paper: "a4",
  flipped: true,
  margin: (top: 5mm, bottom: 5mm, left: 6mm, right: 6mm),
  columns: 3,
)

#set text(
  font: "Times New Roman",
  size: 8.4pt,
  hyphenate: true,
)

#set par(
  justify: true,
  first-line-indent: 0pt,
  spacing: 0.50em,
  leading: 0.40em,
)

#show heading: it => block(spacing: auto, it)
#set heading(numbering: "1.")
#show heading.where(level: 1): it => {
  it
  box(width: 1fr, line(length: 100%, stroke: 0.4pt + black))
}

#show raw: set text(font: "Fira Code Retina", size: 6.4pt)
#show raw.where(block: true): block.with(inset: 3pt, stroke: 0.2pt + black)

#let cbox(body) = block(
  stroke: 0.45pt + black, inset: 3.5pt, breakable: true, body,
)
#let warn(body) = block(
  stroke: 0.45pt + black, inset: 3.5pt, breakable: true,
  [*⚠ Trap:* #body],
)

// ═══════════════════════════════════════
//  SISI 1 — TEORI
// ═══════════════════════════════════════

= Inheritance

== Intuisi

Common state/behavior naik ke *superclass/parent*, detail khusus di *subclass/child*.

```java
class Animal { String breed, eyeColor, furColor; void eat() {} }
class Dog extends Animal { int barkFreq; void bark() {} }
class Cat extends Animal { int meowFreq; void meow() {} }
```

== Istilah

#cbox[
  *Superclass/parent:* atribut & behavior umum.\
  *Subclass/child:* warisi semua parent + tambah milik sendiri.\
  Object child = bagian parent + bagian child.
]

== Constructor + super

```java
class Person {
  String name;
  Person(String name) { this.name = name; }
}
class Employee extends Person {
  int salary;
  Employee(String name, int salary) {
    super(name);          // ← harus baris PERTAMA
    this.salary = salary;
  }
}
```

#warn[`super(...)` harus statement *pertama* di constructor child. Jika tidak ditulis, Java otomatis panggil `super()` tanpa argumen — error jika parent tidak punya no-arg constructor.]

== Access Modifier

#cbox[
  `public` — bebas diakses.\
  `protected` — package sama + subclass.\
  `(default)` — package sama saja.\
  `private` — class itu sendiri saja.
]

#warn[Field `private` di parent *tetap diwarisi* secara konseptual, tapi tidak bisa diakses langsung dari child. Gunakan getter/setter atau `protected`.]

== Kapan Pakai?

*is-a* → inheritance: `Dog` is an `Animal`, `SpecialRoom` is a `Room`.\
*has-a* → composition: `Car` has an `Engine`.

= Polymorphism

== Definisi

One name, many forms. Dua bentuk utama: *overriding* (runtime) dan *overloading* (compile-time).

== Overriding

Child *redefine* behavior method parent.

```java
class Animal {
  void sound() { System.out.println("..."); }
}
class Dog extends Animal {
  @Override
  void sound() { System.out.println("Woof"); }
}
```

Syarat: nama sama, parameter sama, return type sama/covariant, akses tidak lebih sempit, method parent bisa diwarisi.

#warn[
  Method `private` di parent *tidak bisa dioverride*. Contoh dari slide dosen:\
  ```java
  // Animal
  private void sound() { ... }
  // Dog — ini BUKAN overriding, cuma method baru
  private void sound() { ... }
  ```
  Untuk override yang valid, minimal gunakan package-private/`protected`/`public`.
]

== Dynamic Dispatch

```java
Animal a = new Dog();
a.sound(); // → "Woof"  (ditentukan oleh object aktual, bukan tipe referensi)
```

== Overloading

Nama method sama, *signature berbeda* (jumlah/tipe/urutan parameter).

```java
class Dog {
  void sound() { System.out.println("Woof"); }
  void sound(String type) {   // ← overload: beda parameter
    System.out.println(type.equals("good") ? "wuuuff" : "grrrr");
  }
}
```

#warn[
  Beda *return type saja* = *bukan* overloading, compile error:\
  ```java
  int  sum(int x, int y) { return x+y; }
  double sum(int x, int y) { return x+y; }  // ERROR
  ```
  Beda tipe parameter = valid overloading:\
  ```java
  int    sum(int x, int y) { ... }
  double sum(double x, double y) { ... }   // OK
  ```
]

== super di Polymorphism

```java
class BoCEmoney extends Emoney {
  @Override
  void topup(int amount) {
    super.topup(amount);          // jalankan logika parent dulu
    balance += (int)(amount * 0.10); // lalu tambah bonus
  }
}
```

== Casting Object

```java
Animal a = new Dog();   // upcast  — selalu aman
Dog d    = (Dog) a;     // downcast — aman karena a memang Dog
Cat c    = (Cat) a;     // ← ClassCastException saat runtime!
```

#warn[Gunakan `instanceof` sebelum downcast bila tidak yakin tipe aktualnya.]

= Exception & Error Handling

== Jenis Kesalahan

#cbox[
  *Compile-time error:* terdeteksi compiler (typo, kurang `;`, tipe salah).\
  *Runtime error/exception:* compile OK, gagal saat jalan.
]

== Exception vs Error

#cbox[
  *Exception* — masalah logika/input, *bisa* ditangkap `try-catch`.\
  Contoh: `NullPointerException`, `ArithmeticException`, `ArrayIndexOutOfBoundsException`, `IOException`.\
  \
  *Error* — masalah serius di luar kendali program, umumnya *tidak* ditangkap.\
  Contoh: `StackOverflowError` (rekursi tak berhenti), `OutOfMemoryError`.
]

== Hierarchy

```
Throwable
├─ Error                    ← jangan catch ini
└─ Exception
   ├─ RuntimeException      ← unchecked (NullPointer, Arithmetic…)
   └─ checked exceptions    ← IOException, SQLException…
```

*Checked:* compiler paksa handle/deklarasi.\
*Unchecked:* tidak dipaksa compiler.

== try-catch-finally

```java
try {
  int r = 10 / divisor;
  System.out.println(r);
} catch (ArithmeticException e) {
  System.out.println("Tidak boleh bagi nol");
} finally {
  System.out.println("Selalu dijalankan"); // cleanup
}
```

== Multi-catch & Urutan

```java
try { risky(); }
catch (NullPointerException | ArithmeticException e) {
  System.out.println(e.getMessage());     // multi-catch
}
// ATAU pisah, dari spesifik → umum:
catch (IOException e) { ... }
catch (Exception e)  { ... }   // lebih umum = di bawah
```

#warn[`catch (Exception e)` sebelum catch yang lebih spesifik → catch spesifik jadi *unreachable*, compile error.]

== throw vs throws

#cbox[
  `throw` = aksi melempar exception object (di dalam method).\
  `throws` = deklarasi bahwa method *mungkin* melempar exception (di signature).
]

```java
void withdraw(int amount) throws Exception {
  if (amount <= 0) throw new Exception("Amount invalid");
}
// Pemanggil:
try { withdraw(-10); }
catch (Exception e) { System.out.println(e.getMessage()); }
```

== Custom Exception

Sesuai slide dosen — extends `Throwable` (atau `Exception` juga valid):

```java
class UnknownDataException extends Throwable {
  UnknownDataException() { super(); }
  UnknownDataException(String msg) { super(msg); }
}

void makeSound() throws UnknownDataException {
  if (getAge() == 0)
    throw new UnknownDataException("Dog < 1 yr cannot make sound");
  System.out.println("Woof woof");
}

// Pemanggil:
Dog dog = new Dog();
try {
  dog.makeSound();
} catch (UnknownDataException e) {
  System.out.println(e.getMessage());
}
```

Pattern ujian: ①buat class extends `Throwable`/`Exception` ②`throw new` di method ③`throws` di signature ④`try-catch` di pemanggil.

= Package

== Definisi & Guna

Package = namespace/kelompok class/interface.

#cbox[
  ① Hindari konflik nama class.\
  ② Organisasi class agar mudah dikelola.\
  ③ Access protection.\
  ④ Reuse kode.
]

Dua class boleh bernama sama di package berbeda: `com.views.Profile` ≠ `com.controllers.Profile`.

== Deklarasi & Import

```java
// File: src/com/app/model/User.java
package com.app.model;          // ← paling atas, sebelum import
public class User { String name; }

// Di file lain:
import com.app.model.User;      // import satu class
import com.app.model.*;         // import seluruh package (bukan subpackage)
```

#warn[`import pkg.*` bisa bikin ambigu jika dua package punya class dengan nama sama. Gunakan *fully qualified name* untuk resolve.]

== Fully Qualified Name

```java
import com.controllers.*;
import com.views.*;
// 'Profile' ambigu — pakai FQN:
com.views.Profile      p1 = new com.views.Profile();
com.controllers.Profile p2 = new com.controllers.Profile();
```

== Package + Access Modifier

#cbox[
  `(default)` — package sama saja.\
  `protected` — package sama + subclass (beda package pun).\
  `private` — class sendiri saja.\
  `public` — bebas, selama class/package tersedia.
]

// ═══════════════════════════════════════
//  SISI 2 — STUDI KASUS & POLA ESSAY
//  (cetak di sisi balik halaman ini)
// ═══════════════════════════════════════

= Studi Kasus: E-Money (Emoney, Flazzy, Opalo)

Sumber: Assignment slide Polymorphism UGM PBO.

*Skenario:*
- `Emoney` (parent): atribut `id`, `balance`, `edition`; method `topup(int)` dan `pay(int)` dengan operasi biasa (tambah/kurang saldo).
- `Flazzy` (child BoC): setiap topup, saldo bertambah *+10% ekstra* dari jumlah topup.
- `Opalo` (child BoG): topup saat promo *+20%*, di luar promo *+5%*. Setiap pembayaran, dapat *diskon 10%* (bayar hanya 90%).

*Identifikasi Polymorphism:*
- `Flazzy.topup(int)` → *overriding* `Emoney.topup(int)`.
- `Opalo.pay(int)` → *overriding* `Emoney.pay(int)`.
- `Opalo.topup(int, boolean)` → *overloading* (signature berbeda dari `topup(int)` milik parent).

```java
// ─── Parent ───────────────────────────────────────────
class Emoney {
  String id, edition;
  int balance;

  Emoney(String id, String edition) {
    this.id = id; this.edition = edition; this.balance = 0;
  }
  void topup(int amount)  { balance += amount; }
  void pay(int amount)    { balance -= amount; }
  void printBalance()     { System.out.println("Balance: " + balance); }
}

// ─── Flazzy (Bank of Central) ─────────────────────────
class Flazzy extends Emoney {
  Flazzy(String id, String edition) { super(id, edition); }

  @Override                                   // OVERRIDING
  void topup(int amount) {
    super.topup(amount);                      // tambah amount normal dulu
    balance += (int)(amount * 0.10);          // lalu bonus 10%
  }
  // pay() tidak dioverride → pakai milik Emoney
}

// ─── Opalo (Bank of Global) ───────────────────────────
class Opalo extends Emoney {
  Opalo(String id, String edition) { super(id, edition); }

  // OVERLOADING: topup dengan flag promo (beda parameter dari topup(int))
  void topup(int amount, boolean isPromo) {
    if (isPromo) balance += (int)(amount * 1.20);
    else         balance += (int)(amount * 1.05);
  }

  @Override                                   // OVERRIDING
  void pay(int amount) {
    balance -= (int)(amount * 0.90);          // diskon 10% → bayar 90%
  }
}

// ─── Main / Test ──────────────────────────────────────
class Main {
  public static void main(String[] args) {
    Flazzy f = new Flazzy("F001", "2024");
    f.topup(100000);          // balance = 110000 (100000 + 10%)
    f.printBalance();

    Opalo o = new Opalo("O001", "2024");
    o.topup(100000, true);    // balance = 120000 (promo +20%)
    o.topup(50000,  false);   // balance = 172500 (non-promo +5%)
    o.pay(20000);             // balance = 154500 (bayar 18000 = 90% dari 20000)
    o.printBalance();

    // Subtype polymorphism:
    Emoney e = new Flazzy("F002", "2024");
    e.topup(100000);          // memanggil Flazzy.topup() → 110000
    e.printBalance();
  }
}
```

= Pola Jawaban Essay Cepat

== Desain Hierarki Class

1. Identifikasi *common* attributes/methods → taruh di superclass.
2. Identifikasi yang *berbeda* per subclass → taruh di subclass.
3. Pastikan relasi *is-a* valid.
4. Tulis `extends`, override/overload di tempat yang tepat.

*Contoh cepat (Room):*

```java
class Room {
  int roomNo; double price, length, width;
}
class RegularRoom extends Room {
  boolean bikeParking;
}
class SpecialRoom extends Room {
  boolean toiletInside, carPark;
}
```

== Jawab Soal "Apakah Ini Overriding/Overloading?"

#cbox[
  *Overriding?* Cek: beda class parent-child? Nama & parameter *sama*? → Ya = overriding.\
  Tapi: parent pakai `private`? → *Bukan* overriding, hanya method baru.\
  \
  *Overloading?* Cek: class sama? Nama sama, parameter *beda*? → Ya = overloading.\
  Hanya beda return type? → *Bukan* overloading, *compile error*.
]

== Tulis Exception dari Nol

```java
// 1. Buat class exception
class SaldoKurangException extends Throwable {
  SaldoKurangException(String msg) { super(msg); }
}

// 2. Lempar di method
void pay(int amount) throws SaldoKurangException {
  if (amount > balance)
    throw new SaldoKurangException("Saldo tidak cukup");
  balance -= amount;
}

// 3. Tangkap saat memanggil
try {
  kartu.pay(500000);
} catch (SaldoKurangException e) {
  System.out.println(e.getMessage());
} finally {
  System.out.println("Transaksi selesai diproses.");
}
```

= Trap PG Ringkas

#cbox[
  1. Method `private` di parent → *tidak bisa dioverride*, bukan polymorphism.\
  2. Beda return type saja → *bukan* overloading, compile error.\
  3. `super()` harus baris *pertama* di constructor child.\
  4. `Error` ≠ `Exception`; jangan `catch (Error e)` di aplikasi biasa.\
  5. *Checked* exception wajib `try-catch` atau `throws`; *unchecked* tidak.\
  6. `finally` *selalu* jalan, bahkan setelah `return` di `try`.\
  7. Urutan `catch`: spesifik *dulu*, umum *belakang*.\
  8. `import pkg.*` tidak mengimport *subpackage*.\
  9. Konflik nama package → selesaikan dengan *fully qualified name*.\
  10. Dynamic dispatch: yang menentukan method = *object aktual*, bukan tipe referensi.
]
