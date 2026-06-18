// Cheatsheet Java OOP — Inheritance, Polymorphism, Exception/Error, Package
// A4 landscape, 3-column, minimalist.
// Built for 75 min exam: 75% PG, 25% essay.
// Sisi 1 = Teori + Trap | Sisi 2 = Studi Kasus + Pola Essay

#set document(title: [Cheatsheet PBO (UAS) - Final])

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
  stroke: 0.45pt + black, inset: 3.5pt, breakable: true, width: 100%, body,
)
#let warn(body) = block(
  stroke: 0.45pt + black, fill: luma(245), inset: 3.5pt, breakable: true, width: 100%,
  [*⚠ Trap:* #body],
)

// ═══════════════════════════════════════
//  SISI 1 — TEORI
// ═══════════════════════════════════════

= Inheritance

== Intuisi & Istilah
Common state/behavior naik ke *superclass/parent*, detail khusus di *subclass/child*.
Object child secara konseptual adalah gabungan: bagian parent + bagian child.

== Kapan Pakai?
*is-a* → inheritance: `Dog` is an `Animal`.\
*has-a* → composition: `Car` has an `Engine` (bukan inheritance!).

== Constructor + super

```java
class Person {
  String name;
  Person(String name) { this.name = name; }
}
class Employee extends Person {
  int salary;
  Employee(String name, int salary) {
    super(name); // ← HARUS baris PERTAMA
    this.salary = salary;
  }
}
```

#warn[`super(...)` harus statement *pertama* di constructor child. Jika tidak ditulis, Java otomatis panggil `super()` tanpa argumen — error jika parent tidak punya no-arg constructor.]

== Access Modifier

#table(
  columns: (auto, 1fr, 1fr, 1fr, 1fr),
  inset: 3pt,
  stroke: 0.3pt + black,
  align: center,
  [*Modifier*], [*Class*], [*Pkg*], [*Sub*], [*Luar*],
  [`public`],    [✓], [✓], [✓], [✓],
  [`protected`], [✓], [✓], [✓], [×],
  [`default`],   [✓], [✓], [×], [×],
  [`private`],   [✓], [×], [×], [×],
)

*Abstract Class:* Pakai `abstract` jika parent murni konseptual (tidak boleh di-`new` langsung). Method `abstract` *wajib* dioverride oleh subclass.

#warn[Field/method `private` di parent *tetap diwarisi* secara konseptual, tapi tidak bisa diakses langsung dari child. Gunakan getter/setter `public`/`protected`.]

= Polymorphism

== Definisi
One name, many forms. Dua bentuk utama: *overriding* (runtime) dan *overloading* (compile-time).

== Overriding (Runtime Polymorphism)
Child *redefine* behavior method parent. Syarat:
1. Nama method & parameter SAMA.
2. Return type SAMA/covariant.
3. Akses tidak boleh dipersempit.

```java
class Animal { void sound() { print("..."); } }
class Dog extends Animal {
  @Override
  void sound() { print("Woof"); }
}
// Dynamic Dispatch:
Animal a = new Dog();
a.sound(); // → "Woof" (ditentukan object aktual)
```

#warn[
  1. Method `private` parent *tidak bisa dioverride*.\
  2. Method `static` *tidak bisa dioverride* secara dinamis — jika ada nama sama di child, itu *Method Hiding*, bukan polymorphism.
]

== Overloading (Compile-time)
Nama method sama, *signature berbeda* (jumlah/tipe/urutan parameter).

```java
class Dog {
  void sound() { print("Woof"); }
  void sound(String type) { ... } // overload valid
}
```

#warn[Beda *return type saja* = *bukan* overloading, langsung compile error!]

== super & Casting

```java
class BoCEmoney extends Emoney {
  @Override
  void topup(int amount) {
    super.topup(amount);           // logika parent dulu
    balance += (int)(amount * 0.10); // tambah bonus
  }
}
```

#warn[Downcasting rawan `ClassCastException`. Cek pakai `instanceof` sebelum cast: `if (a instanceof Dog d) { d.bark(); }`]

= Exception & Error Handling

== Hierarchy
```
Throwable
├─ Error        ← JANGAN di-catch
│  (StackOverflow, OutOfMemory)
└─ Exception
   ├─ RuntimeException  ← Unchecked
   │  (NullPointer, Arithmetic,
   │   ArrayIndexOutOfBounds)
   └─ Checked Exceptions
      (IOException, SQLException)
```
*Checked:* compiler PAKSA tangani.\
*Unchecked:* tidak dipaksa compiler.

== try-catch-finally

```java
try {
  int r = 10 / 0;
} catch (ArithmeticException e) {
  print("Tidak boleh bagi nol");
} catch (Exception e) {       // umum di bawah
  print("Error umum");
} finally {
  print("Selalu eksekusi"); // cleanup
}
```

#warn[`catch` wajib spesifik dulu baru umum! Terbalik = *unreachable code* error. `finally` pasti jalan walau di `try` ada `return`.]

== throw vs throws

#cbox[
  `throw` — aksi melempar object exception (di dalam body method).\
  `throws` — deklarasi di signature bahwa method bisa melempar exception.
]

= Package

== Definisi & Aturan

#cbox[
  ① Pengelompokan logis class/interface.\
  ② Mencegah name collision.\
  ③ Kontrol akses level package.\
  ④ Reusability (paket sebagai `.jar`).
]

Konvensi nama: huruf kecil, reverse domain → `com.namaorg.proyek`

```java
package com.bank.transaksi; // ← baris pertama
import com.bank.util.ValidasiSistem; // spesifik
import com.bank.util.*;              // semua class
```

#warn[`import pkg.*` TIDAK mengimport *subpackage* di dalamnya. Untuk production, hindari wildcard import.]

== Resolusi Ambiguitas (FQN)
Jika dua package punya class bernama sama, pakai *Fully Qualified Name*:

```java
com.views.Profile p1 =
  new com.views.Profile();
com.controllers.Profile p2 =
  new com.controllers.Profile();
```

== Skenario Perbankan

#cbox[
  `com.bank.nasabah` → `DataNasabah`, `Profil`\
  `com.bank.transaksi` → `Transfer`, `TarikTunai`\
  `com.bank.util` → `ValidasiSistem`, `KoneksiDatabase`
]

Jika `Transfer` (`com.bank.transaksi`) akses atribut `default` di `ValidasiSistem` (`com.bank.util`) → *compile error!* Ubah ke `public` atau `protected`.

Prinsip: *least privilege* — berikan akses sesedikit mungkin.

// ═══════════════════════════════════════
//  SISI 2 — STUDI KASUS & POLA ESSAY
//  (cetak di sisi balik halaman ini)
// ═══════════════════════════════════════

= Studi Kasus: E-Money (Emoney, Flazzy, Opalo)

*Identifikasi Polymorphism:*
- `Flazzy.topup(int)` → *overriding* `Emoney.topup(int)`.
- `Opalo.topup(int, boolean)` → *overloading* (beda signature).
- `Opalo.pay(int)` → *overriding* `Emoney.pay(int)`.

```java
// ─── Parent ────────────────────────────
class Emoney {
  String id;
  int balance;

  Emoney(String id) {
    this.id = id;
    balance = 0;
  }
  void topup(int amount) { balance += amount; }
  void pay(int amount)   { balance -= amount; }
  void printBalance() {
    System.out.println("Balance: " + balance);
  }
}

// ─── Flazzy (Bank of Central) ──────────
class Flazzy extends Emoney {
  Flazzy(String id) { super(id); }

  @Override               // OVERRIDING
  void topup(int amount) {
    super.topup(amount);                  // normal dulu
    balance += (int)(amount * 0.10);      // bonus 10%
  }
  // pay() tidak dioverride → pakai Emoney
}

// ─── Opalo (Bank of Global) ────────────
class Opalo extends Emoney {
  Opalo(String id) { super(id); }

  // OVERLOADING: beda param (int, boolean)
  void topup(int amount, boolean isPromo) {
    if (isPromo) balance += (int)(amount * 1.20);
    else         balance += (int)(amount * 1.05);
  }

  @Override               // OVERRIDING
  void pay(int amount) {
    balance -= (int)(amount * 0.90); // diskon 10%
  }
}

// ─── Main / Test ───────────────────────
class Main {
  public static void main(String[] args) {
    Flazzy f = new Flazzy("F001");
    f.topup(100000);       // balance = 110000
    f.printBalance();

    Opalo o = new Opalo("O001");
    o.topup(100000, true); // balance = 120000
    o.topup(50000, false); // balance = 172500
    o.pay(20000);          // balance = 154500
    o.printBalance();

    // Dynamic Dispatch:
    Emoney e = new Flazzy("F002");
    e.topup(100000);       // → Flazzy.topup() = 110000
    e.printBalance();
  }
}
```

= Pola Jawaban Essay Cepat

== Desain Hierarki Class

1. Atribut/method umum → superclass (`abstract` jika perlu).
2. Fitur unik → subclass, tulis `extends`.
3. Pastikan relasi *is-a* valid.

```java
abstract class Room {
  int roomNo;
  double price, length, width;
}
class RegularRoom extends Room {
  boolean bikeParking;
}
class SpecialRoom extends Room {
  boolean toiletInside, carPark;
}
```

== Tulis Exception dari Nol

```java
// 1. Buat class exception
class SaldoKurangException extends Exception {
  SaldoKurangException(String msg) { super(msg); }
}

// 2. Lempar di method
class Rekening {
  int balance = 100000;

  void pay(int amount) throws SaldoKurangException {
    if (amount > balance)
      throw new SaldoKurangException("Saldo tak cukup!");
    balance -= amount;
  }
}

// 3. Tangkap saat memanggil
try {
  rek.pay(500000);
} catch (SaldoKurangException e) {
  System.out.println(e.getMessage());
} finally {
  System.out.println("Transaksi diproses.");
}
```

= Trap PG Ringkas & Mematikan

#cbox[
  1. Method `private` di parent → *tidak bisa dioverride*, itu method independen.\
  2. Beda *return type saja* → *bukan* overloading, melainkan *compile error*.\
  3. Method `static` di child dengan nama sama → *Method Hiding*, bukan dynamic polymorphism.\
  4. `super()` harus di *baris pertama* constructor child.\
  5. Downcast tanpa `instanceof` → rawan `ClassCastException` saat runtime.\
  6. `Error` (`OutOfMemoryError`, dll.) ≠ `Exception`; tidak wajib di-`catch`.\
  7. *Checked exception* (`IOException`, dll.) WAJIB `try-catch` atau `throws` → jika tidak = *compile error*.\
  8. Urutan `catch`: spesifik dulu, umum belakang. Terbalik = *unreachable code error*.\
  9. `finally` *selalu dieksekusi* bahkan jika ada `return` di dalam `try`.\
  10. `import pkg.*` tidak mengimport class di dalam *subpackage*-nya.\
  11. Ambiguitas nama class dari dua package berbeda → wajib *Fully Qualified Name*.\
  12. Dynamic dispatch: method yang jalan = *object aktual yang di-`new`*, bukan tipe referensi.\
  13. Aturan akses override: child tidak boleh lebih ketat dari parent (`protected` parent → child minimal `protected`).
]
