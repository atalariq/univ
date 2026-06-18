// Cheatsheet Java OOP — Inheritance, Polymorphism, Exception/Error, Package
// A4 landscape, 3-column, minimalist. Built for 75 min exam: 75% PG, 25% essay.

#set document(
  title: [Cheatsheet PBO (UAS)]
)

#set page(
  paper: "a4",
  flipped: true,
  margin: (top: 5mm, bottom: 5mm, left: 6mm, right: 6mm),
  columns: 3,
)

#set text(
  font: "Times New Roman",
  size: 8.6pt,
  hyphenate: true,
)

#set par(
  justify: true,
  first-line-indent: 0pt,
  spacing: 0.54em,
  leading: 0.42em,
)

#show heading: it => block(spacing: auto, it)
#set heading(numbering: "1.")
#show heading.where(level: 1): it => {
  it
  box(width: 1fr, line(length: 100%, stroke: 0.4pt + black))
}

#show raw: set text(font: "Fira Code Retina", size: 6.55pt)

#show raw.where(block: true): block.with(
  inset: 4pt,
  stroke: 0.2pt + black
)

#let box(body) = block(
  stroke: 0.45pt + black,
  inset: 4pt,
  breakable: true,
  body,
)

#let warn(body) = block(
  stroke: 0.45pt + black,
  inset: 4pt,
  breakable: true,
  [*Trap:* #body],
)

#let sig(name, body) = [#strong(name): #body]

#title()

//
// #box[
//   *Fokus nilai:* PG 75%, essay 25%, waktu 75 menit (08.00-09.15 WIB).  \
//   *Prioritas scan:* konsep → syntax → output kode → trap keyword.
// ]
//
// == Peta CPMK
//
// - *Inheritance*: reuse atribut/method dari parent ke child.
// - *Polymorphism*: satu nama/tipe, banyak bentuk perilaku.
// - *Exception & Error Handling*: program tidak crash saat kondisi abnormal.
// - *Package*: organisasi class + hindari konflik nama + access protection.
//
// == Keyword Kilat
//
// #box[
//   `extends` = inheritance class.  \
//   `super` = akses parent/constructor parent.  \
//   `@Override` = redefinisi method parent.  \
//   overloading = nama sama, parameter beda.  \
//   `try-catch-finally` = handling exception.  \
//   `throw` = melempar exception object.  \
//   `throws` = deklarasi method bisa melempar exception.  \
//   `package` / `import` = namespace class.
// ]

= Inheritance

== Intuisi

Inheritance dipakai saat beberapa class punya *fitur umum* yang sama. Common state/behavior naik ke *superclass/parent*, detail khusus tetap di *subclass/child*.

Contoh desain:

```java
class Animal {
  String breed, eyeColor, furColor;
  void eat() {}
}
class Dog extends Animal {
  int barkFrequency;
  void bark() {}
}
class Cat extends Animal {
  int meowFrequency;
  void meow() {}
}
```

== Istilah

#box[
  *Superclass / parent:* menyimpan atribut & behavior umum.  \
  *Subclass / child:* perluasan superclass; mewarisi atribut & method parent.  \
  Saat object child dibuat, ia punya bagian parent + bagian child.
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
    super(name);        // panggil constructor parent
    this.salary = salary;
  }
}
```

#box[`super(...)` harus muncul sebagai statement pertama di constructor child kalau dipakai.]

== Access Modifier Cepat

#box[
  `public`: bebas diakses.  \
  `protected`: package sama + subclass.  \
  `(default)`: package sama saja.  \
  `private`: class itu sendiri saja.
]

#warn[Field parent yang `private` tetap diwarisi secara konseptual, tapi tidak bisa diakses langsung dari child. Pakai getter/setter atau `protected` bila tepat.]

== Kapan Pakai Inheritance?

Pakai kalau relasinya *is-a*:

- `Dog` is an `Animal`.
- `Manager` is an `Employee`.
- `SpecialRoom` is a `Room`.

Jangan pakai kalau relasinya *has-a*:

- `Car` has an `Engine` → composition, bukan inheritance.

= Polymorphism

== Definisi

Polymorphism = *one name, many forms*. Di Java, bentuk paling sering:

1. *Overriding* - runtime polymorphism.
2. *Overloading* - compile-time polymorphism.
3. *Subtype polymorphism* - referensi parent menunjuk object child.

== Overriding

Child *mengubah/redefine* behavior method parent.

```java
class Animal {
  void sound() { System.out.println("..."); }
}
class Dog extends Animal {
  @Override
  void sound() { System.out.println("Woof"); }
}
```

Syarat overriding:

- Nama method sama.
- Parameter sama.
- Return type sama atau covariant.
- Access tidak boleh lebih sempit.
- Method parent harus bisa diwarisi; `private` tidak benar-benar dioverride.

#warn[`private void sound()` di parent lalu `private void sound()` di child bukan overriding yang sehat untuk ujian. Untuk override, gunakan minimal package-private/protected/public.]

== Dynamic Dispatch

```java
Animal a = new Dog();
a.sound(); // output: Woof
```

Yang menentukan method override adalah *object actual* (`new Dog()`), bukan tipe referensi (`Animal`).

== Overloading

Method dalam class yang sama punya nama sama, tapi *signature berbeda*.

Signature = nama method + jumlah, tipe, urutan parameter.

```java
class Dog {
  void sound() { System.out.println("Woof"); }
  void sound(String personType) {
    if (personType.equals("good"))
      System.out.println("wuuuuffff");
    else
      System.out.println("grrrrr");
  }
}
```

#box[
  Overloading valid: `pay(int)`, `pay(double)`, `pay(int, String)`.  \
  Tidak cukup: beda return type saja.
]

== Overriding vs Overloading

#box[
  *Overriding*: beda class parent-child, signature sama, runtime.  \
  *Overloading*: biasanya class sama, signature beda, compile-time.
]

== super pada Polymorphism

```java
class BoCEmoney extends Emoney {
  @Override
  void topup(int amount) {
    super.topup(amount);       // behavior parent
    balance += amount * 0.10;  // behavior child
  }
}
```

`super.method()` dipakai saat child ingin extend behavior parent, bukan mengganti total.

== Casting Object

```java
Animal a = new Dog();  // upcast: aman
Dog d = (Dog) a;       // downcast: cek actual object
```

#warn[Downcast salah bisa memicu `ClassCastException`. Cek dengan `instanceof` bila ragu.]

= Exception & Error Handling

== Jenis Kesalahan

#box[
  *Compile-time error:* terdeteksi compiler; contoh typo, kurang `;`, tipe salah.  \
  *Runtime error/exception:* program compile, tapi gagal saat jalan; contoh `NullPointerException`, `ArithmeticException`, `ArrayIndexOutOfBoundsException`.
]

== Exception

Exception = peristiwa abnormal yang mengganggu alur program. Bisa terjadi otomatis oleh Java atau dilempar manual saat kondisi tertentu terpenuhi.

Contoh umum:

- `NullPointerException`: akses object yang masih `null`.
- `ArithmeticException`: operasi aritmatika ilegal, contoh `/ 0`.
- `ArrayIndexOutOfBoundsException`: akses index di luar batas array.
- `IOException`: masalah I/O, biasanya checked exception.

== Error

`Error` = masalah serius yang umumnya di luar kontrol program dan sulit/tidak masuk akal ditangani normal.

Contoh:

- `StackOverflowError`: rekursi terlalu dalam/tidak berhenti.
- `OutOfMemoryError`: memori habis.
- `VirtualMachineError`, `LinkageError`, `AssertionError`.

#box[
  *Exception* biasanya bisa ditangkap dengan `try-catch`.  \
  *Error* biasanya bukan target handling aplikasi biasa.
]

== Hierarchy Ringkas

```text
Throwable
├─ Error
└─ Exception
   ├─ RuntimeException  // unchecked
   └─ checked exceptions
```

Checked exception: compiler memaksa handle/deklarasi.  \
Unchecked exception: tidak dipaksa compiler; biasanya turunan `RuntimeException`.

== try-catch-finally

```java
try {
  int result = 10 / divisor;
  System.out.println(result);
} catch (ArithmeticException e) {
  System.out.println("Tidak boleh bagi nol");
} finally {
  System.out.println("Selesai");
}
```

#box[
  `try`: area kode rawan exception.  \
  `catch`: respon saat exception tertentu terjadi.  \
  `finally`: tetap dijalankan untuk cleanup.
]

== Multi-catch

```java
try {
  risky();
} catch (NullPointerException | ArithmeticException e) {
  System.out.println(e.getMessage());
}
```

Urutan catch: dari spesifik → umum.

```java
catch (IOException e) {}
catch (Exception e) {}
```

#warn[Jangan taruh `catch (Exception e)` sebelum catch yang lebih spesifik. Yang spesifik jadi unreachable.]

== throw vs throws

#box[
  `throw` = aksi melempar exception object.  \
  `throws` = deklarasi di signature method bahwa method bisa melempar exception.
]

```java
void withdraw(int amount) throws Exception {
  if (amount <= 0) {
    throw new Exception("Amount invalid");
  }
}
```

Pemanggil wajib handle checked exception:

```java
try {
  withdraw(-10);
} catch (Exception e) {
  System.out.println(e.getMessage());
}
```

== Custom Exception

```java
class InsufficientBalanceException extends Exception {
  InsufficientBalanceException(String msg) {
    super(msg);
  }
}

void pay(int amount) throws InsufficientBalanceException {
  if (amount > balance)
    throw new InsufficientBalanceException("Saldo kurang");
  balance -= amount;
}
```

Untuk ujian, pattern-nya:

1. Buat class exception extends `Exception`/`Throwable`.
2. Lempar dengan `throw new ...`.
3. Deklarasikan dengan `throws` bila checked.
4. Tangani dengan `try-catch` saat memanggil.

= Package

== Definisi

Package = namespace/kelompok untuk class/interface. Gunanya:

- Menghindari konflik penamaan class.
- Mengorganisasi class agar mudah dikelola.
- Mendukung access protection.
- Mendukung reuse kode.

#box[Dua class boleh bernama sama kalau berada di package berbeda, misal `com.views.Profile` dan `com.controllers.Profile`.]

== Deklarasi Package

File: `src/com/app/model/User.java`

```java
package com.app.model;

public class User {
  String name;
}
```

Rule praktis:

- `package` ditulis paling atas sebelum `import` dan class.
- Struktur folder biasanya mengikuti nama package.
- Satu public class umumnya satu file dengan nama sama.

== Import

```java
import com.app.model.User; // satu class
import com.app.model.*;    // semua class di package itu
```

#warn[`import package.*` bisa bikin ambigu kalau ada nama class sama dari package lain.]

== Nama Lengkap / Fully Qualified Name

```java
import com.controllers.*;
import com.views.*;

com.views.Profile p1 = new com.views.Profile();
com.controllers.Profile p2 = new com.controllers.Profile();
```

Pakai fully qualified name saat terjadi konflik nama.

== Package + Access Modifier

#box[
  `(default)` hanya package yang sama.  \
  `protected` bisa package yang sama dan subclass.  \
  `private` tetap hanya class itu sendiri.  \
  `public` bebas diakses selama class/package tersedia.
]

// = Pola Essay Cepat
//
// == Jawab Desain Class
//
// Format aman:
//
// 1. Identifikasi common attributes/methods.
// 2. Taruh di superclass.
// 3. Taruh fitur khusus di subclass.
// 4. Jelaskan relasi *is-a*.
// 5. Tunjukkan `extends`, override/overload bila ada.
//
// Contoh kerangka:
//
// ```java
// class Room {
//   int roomNo;
//   double price, length, width;
// }
// class RegularRoom extends Room {
//   boolean bikeParking;
// }
// class SpecialRoom extends Room {
//   boolean toiletInside, carPark;
// }
// ```
//
// == Jawab Polymorphism E-money
//
// ```java
// class Emoney {
//   String id, edition;
//   int balance;
//   void topup(int amount) { balance += amount; }
//   void pay(int amount) { balance -= amount; }
// }
//
// class Flazzy extends Emoney {
//   @Override
//   void topup(int amount) { balance += amount * 1.10; }
// }
//
// class Opalo extends Emoney {
//   void topup(int amount, boolean promo) { // overload
//     balance += promo ? amount * 1.20 : amount * 1.05;
//   }
//   @Override
//   void pay(int amount) { balance -= amount * 0.90; }
// }
// ```
//
// Catatan essay: `Flazzy.topup` dan `Opalo.pay` = overriding. `Opalo.topup(int, boolean)` = overloading terhadap `topup(int)`.
//
// == Jawab Exception
//
// Struktur jawaban:
//
// ```java
// try {
//   object.riskyMethod();
// } catch (SpecificException e) {
//   // recovery / pesan error
// } finally {
//   // cleanup
// }
// ```
//
// Lalu jelaskan: exception apa yang mungkin terjadi, kenapa terjadi, dan bagaimana program tetap lanjut/berhenti rapi.

// = Trap PG yang Sering Keluar
//
// #box[
//   1. `private` method tidak dioverride secara polymorphic.  \
//   2. Overloading tidak ditentukan oleh return type saja.  \
//   3. `super()` harus pertama di constructor child.  \
//   4. `Error` ≠ `Exception`; jangan asal `catch Error`.  \
//   5. Checked exception wajib `try-catch` atau `throws`.  \
//   6. `finally` untuk cleanup, bukan tempat business logic utama.  \
//   7. `import *` tidak mengimport subpackage.  \
//   8. Konflik nama package diselesaikan dengan fully qualified name.
// ]

// == Fast Decision
//
// - Ada common field/method? → inheritance candidate.
// - Child ubah method parent? → overriding.
// - Nama method sama, parameter beda? → overloading.
// - Program compile tapi crash? → runtime exception/error.
// - Compiler memaksa handle? → checked exception.
// - Nama class bentrok? → package/FQN.
