// Cheatsheet PBO/OOP Java v2
// Target: 1 lembar HVS A4 bolak-balik. Compile dengan Typst.
// Materi: Inheritance, Polymorphism, Exception & Error Handling, Package.
// Tambahan diringkas dari materi kuliah + Oracle Java Tutorial + Java Language Specification.

#set document(title: [Cheatsheet PBO/OOP Java v2])

#set page(
  paper: "a4",
  flipped: true,
  margin: (top: 4.5mm, bottom: 4.5mm, left: 5mm, right: 5mm),
  columns: 3,
)

#set text(
  font: ("Times New Roman", "TeX Gyre Termes", "Noto Serif", "Liberation Serif"),
  size: 7.35pt,
  hyphenate: true,
)

#set par(
  justify: false,
  first-line-indent: 0pt,
  spacing: 0.38em,
  leading: 0.34em,
)

#set list(indent: 6pt, body-indent: 3pt, spacing: 0.15em)
#set heading(numbering: none)

#show heading.where(level: 1): it => block(spacing: 0.35em)[
  #set text(size: 9pt, weight: "bold")
  #it.body
  #line(length: 100%, stroke: 0.35pt + black)
]

#show heading.where(level: 2): it => block(spacing: 0.22em)[
  #set text(size: 7.9pt, weight: "bold")
  #it.body
]

#show raw: set text(font: ("Fira Code", "DejaVu Sans Mono", "Liberation Mono"), size: 5.55pt)
#show raw.where(block: true): block.with(
  inset: (x: 2.6pt, y: 2.2pt),
  stroke: 0.22pt + black,
  breakable: true,
)

#let box(body) = block(
  stroke: 0.35pt + black,
  inset: 3pt,
  breakable: true,
  body,
)

#let trap(body) = block(
  stroke: 0.45pt + black,
  inset: 3pt,
  breakable: true,
  [*Trap:* #body],
)

#let key(k, v) = [#strong(k): #v]

#align(center)[
  #text(size: 11pt, weight: "bold")[Cheatsheet PBO/OOP Java]
  #linebreak()
  #text(size: 6.8pt)[Inheritance - Polymorphism - Exception/Error - Package | PG 75%, Essay 25%, 75 menit]
]

#box[
  *Scan order:* keyword -> syntax -> output kode -> trap.  \
  `extends` inheritance | `super` parent | `@Override` redefine | overload = parameter beda | `try/catch/finally` handling | `throw` lempar | `throws` deklarasi | `package/import` namespace.
]

= Inheritance

== Intuisi & istilah

Inheritance dipakai saat beberapa class punya *fitur umum*. Common state/behavior naik ke *superclass/parent*, fitur khusus turun ke *subclass/child*.

#box[
  #key("Superclass/parent", "atribut + behavior umum.")  \
  #key("Subclass/child", "extension parent; punya bagian parent + bagian child.")  \
  #key("Relasi benar", "is-a: `Dog` is an `Animal`, `Manager` is an `Employee`.")  \
  #key("Relasi salah", "has-a: `Car` has an `Engine` -> composition.")
]

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

== Constructor, `super`, access

```java
class Person {
  String name;
  Person(String name) { this.name = name; }
}
class Employee extends Person {
  int salary;
  Employee(String name, int salary) {
    super(name);          // wajib first statement
    this.salary = salary;
  }
}
```

#box[
  `public`: semua tempat.  \
  `protected`: package sama + subclass.  \
  `(default)`: package sama.  \
  `private`: class sendiri saja.
]

#trap[`private` field/method parent tidak bisa diakses langsung dari child. Pakai getter/setter atau `protected` bila desainnya memang butuh subclass access.]

== Abstract superclass

Pakai `abstract` kalau parent hanya konsep umum dan tidak masuk akal dibuat object langsung.

```java
abstract class Animal {
  abstract void sound();
}
class Dog extends Animal {
  @Override void sound() { System.out.println("Woof"); }
}
```

= Polymorphism

== Definisi & bentuk

Polymorphism = *one name/type, many forms*. Bentuk penting:

- *Overriding*: child redefine method parent; runtime polymorphism.
- *Overloading*: nama sama, parameter beda; compile-time.
- *Subtype polymorphism*: referensi parent menunjuk object child.

== Overriding

```java
class Animal {
  void sound() { System.out.println("..."); }
}
class Dog extends Animal {
  @Override
  void sound() { System.out.println("Woof"); }
}

Animal a = new Dog();
a.sound(); // Woof, actual object = Dog
```

Syarat cepat overriding:

- Nama method sama.
- Parameter sama.
- Return type sama atau covariant.
- Access child tidak boleh lebih sempit.
- Parent method harus inheritable; `private` tidak dioverride.

#trap[`static` method tidak dioverride secara dynamic dispatch. Itu *method hiding*.]

```java
class P { static void show(){ System.out.println("P"); } }
class C extends P { static void show(){ System.out.println("C"); } }
P x = new C();
x.show(); // P, bukan C
```

== Overloading

Signature = nama method + jumlah, tipe, urutan parameter. Return type tidak dihitung.

```java
class Calc {
  int sum(int a, int b) { return a + b; }
  int sum(int a, int b, int c) { return a+b+c; }
  double sum(double a, double b) { return a+b; }
}
```

```java
int f(int x) { return x; }
double f(int x) { return x; } // compile error
```

#box[
  *Overriding*: parent-child, signature sama, runtime.  \
  *Overloading*: signature beda, compile-time.
]

== `super.method()`

```java
class Emoney { int balance; void topup(int a){ balance += a; } }
class Flazzy extends Emoney {
  @Override void topup(int a) {
    super.topup(a);      // parent behavior
    balance += a * 0.1;  // child bonus
  }
}
```

== Casting

```java
Animal a = new Dog();       // upcast: aman
if (a instanceof Dog d) {   // safe downcast
  d.bark();
}
```

#trap[Salah downcast -> `ClassCastException`.]

= Exception & Error Handling

== Error type

#box[
  *Compile-time error*: ketahuan compiler; syntax/type salah, kurang `;`.  \
  *Runtime exception*: compile sukses, gagal saat jalan.  \
  *Exception*: abnormal event yang bisa ditangani.  \
  *Error*: masalah serius/JVM/resource; umumnya jangan ditangkap untuk recovery normal.
]

Contoh exception umum:

- `NullPointerException`: akses object `null`.
- `ArithmeticException`: misal `/ 0`.
- `ArrayIndexOutOfBoundsException`: index di luar batas.
- `ClassCastException`: downcast salah.
- `IOException`: masalah I/O, checked.

Contoh `Error`: `StackOverflowError`, `OutOfMemoryError`, `VirtualMachineError`, `LinkageError`, `AssertionError`.

== Hierarchy

```text
Throwable
├─ Error                  // usually unrecoverable
└─ Exception
   ├─ RuntimeException    // unchecked
   └─ checked exceptions  // IOException, etc.
```

#box[
  *Checked*: compiler memaksa `try-catch` atau `throws`.  \
  *Unchecked*: tidak dipaksa compiler; biasanya bug logic/input.
]

== `try-catch-finally`

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
  `try`: area rawan exception.  \
  `catch`: respon jika exception cocok.  \
  `finally`: cleanup; tetap jalan saat `try` exit, kecuali kasus ekstrem seperti JVM stop/crash.
]

Urutan catch: spesifik -> umum.

```java
try { risky(); }
catch (IOException e) {}
catch (Exception e) {}
```

```java
catch (Exception e) {}
catch (IOException e) {} // compile error: unreachable
```

== Multi-catch

```java
try { risky(); }
catch (NullPointerException | ArithmeticException e) {
  System.out.println(e.getMessage());
}
```

== `throw` vs `throws`

#box[
  `throw`: aksi melempar exception object.  \
  `throws`: deklarasi method bisa melempar exception.
]

```java
void withdraw(int amount) throws Exception {
  if (amount <= 0) throw new Exception("Invalid");
}

try { withdraw(-10); }
catch (Exception e) { System.out.println(e.getMessage()); }
```

== Custom exception

```java
class InsufficientBalanceException extends Exception {
  InsufficientBalanceException(String msg) { super(msg); }
}

void pay(int amount) throws InsufficientBalanceException {
  if (amount > balance)
    throw new InsufficientBalanceException("Saldo kurang");
  balance -= amount;
}
```

Pattern essay exception:

1. Buat class exception extends `Exception`.
2. Validasi kondisi.
3. `throw new ...` saat invalid.
4. Tambahkan `throws` jika checked.
5. Pemanggil pakai `try-catch`.

= Package

== Definisi & guna

Package = namespace/kelompok class/interface.

#box[
  Guna: organisasi class, hindari konflik nama, access protection, reuse kode.  \
  Dua class boleh bernama sama jika package berbeda: `com.views.Profile` vs `com.controllers.Profile`.
]

== Deklarasi

File: `src/com/app/model/User.java`

```java
package com.app.model;  // paling atas

public class User { }
```

Rule praktis:

- `package` sebelum `import` dan class.
- Folder biasanya mengikuti nama package.
- Satu `public class` umumnya satu file dengan nama sama.
- Nama package lowercase; lazim reverse domain: `id.ac.ugm.pbo.model`.

== Import & FQN

```java
import com.app.model.User; // satu class
import com.app.model.*;    // class langsung di package itu
```

#trap[`import com.app.*` tidak otomatis import `com.app.model.*`. Subpackage harus di-import sendiri.]

Jika ambigu, pakai fully qualified name (FQN):

```java
import com.controllers.*;
import com.views.*;

com.views.Profile p1 = new com.views.Profile();
com.controllers.Profile p2 = new com.controllers.Profile();
```

== Package + access

#box[
  `(default)`: visible hanya package sama.  \
  `protected`: package sama + subclass di package lain.  \
  `public`: bisa dipakai dari package lain jika di-import/FQN.  \
  `private`: tidak keluar class.
]

= Pola Essay Studi Kasus

== Desain inheritance

Format jawaban aman:

1. Identifikasi common attributes/methods.
2. Taruh di superclass.
3. Taruh fitur khusus di subclass.
4. Jelaskan relasi *is-a*.
5. Tunjukkan `extends`; pakai `abstract` jika parent konseptual.

```java
abstract class Room {
  int roomNo; double price, length, width;
  abstract double calculatePrice();
}
class RegularRoom extends Room {
  boolean bikeParking;
  @Override double calculatePrice(){ return price; }
}
class SpecialRoom extends Room {
  boolean toiletInside, carPark;
  @Override double calculatePrice(){ return price * 1.25; }
}
```

== Desain polymorphism

```java
class Emoney {
  int balance;
  void topup(int amount){ balance += amount; }
  void pay(int amount){ balance -= amount; }
}
class Flazzy extends Emoney {
  @Override void topup(int amount){ balance += amount * 1.10; }
}
class Opalo extends Emoney {
  void topup(int amount, boolean promo) { // overload
    balance += promo ? amount * 1.20 : amount;
  }
  @Override void pay(int amount){ balance -= amount * 0.90; }
}
```

Essay note: `Flazzy.topup` dan `Opalo.pay` = overriding. `Opalo.topup(int, boolean)` = overloading.

== Jawab output kode

Urutan mikir:

1. Ada compile error? cek signature, access, checked exception, unreachable catch.
2. Kalau compile, cek tipe referensi vs actual object.
3. Instance method override -> actual object.
4. Static method -> tipe referensi/class.
5. Overload -> dipilih compile-time dari parameter.
6. Exception -> match catch pertama yang paling atas.

= Trap PG Wajib Hafal

#box[
  1. `private` method parent bukan target overriding polymorphic.  \
  2. `static` method = hiding, bukan runtime overriding.  \
  3. Overloading tidak ditentukan return type saja.  \
  4. `super(...)` harus first statement constructor child.  \
  5. Access override tidak boleh lebih sempit.  \
  6. Checked exception wajib `try-catch` atau `throws`.  \
  7. `catch (Exception)` sebelum child exception -> unreachable.  \
  8. `finally` untuk cleanup, bukan business logic utama.  \
  9. `Error` != `Exception`; jangan asal `catch Error`.  \
  10. `import *` tidak import subpackage.  \
  11. Konflik nama package -> pakai FQN.  \
  12. `has-a` lebih cocok composition, bukan inheritance.
]

= Fast Decision

#box[
  Ada common field/method? -> inheritance candidate.  \
  Parent cuma konsep? -> `abstract class`.  \
  Child ubah method parent? -> overriding.  \
  Nama sama, parameter beda? -> overloading.  \
  Parent ref ke child object? -> dynamic dispatch untuk instance method.  \
  Compile sukses tapi crash? -> runtime exception/error.  \
  Compiler paksa handle? -> checked exception.  \
  Nama class bentrok? -> package/FQN.
]

#align(center)[#text(size: 5.8pt)[Refs: materi PBO + Oracle Java Tutorial/JLS. Fokus: jawab cepat, bukan textbook lengkap.]]
