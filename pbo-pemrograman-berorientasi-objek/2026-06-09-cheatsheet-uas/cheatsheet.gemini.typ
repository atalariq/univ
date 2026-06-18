// CHEATSHEET PBO / OOP JAVA (UAS) - FINAL MERGED VERSION
// Target: 1 lembar HVS A4 bolak-balik (Landscape, 3 Kolom)
// Bobot: 75% PG, 25% Essay.

#set document(title: [Cheatsheet PBO UAS])
#set page(
  paper: "a4",
  flipped: true,
  margin: (top: 5mm, bottom: 5mm, left: 5mm, right: 5mm),
  columns: 3,
)

#set text(font: ("Times New Roman", "Noto Serif"), size: 7.5pt, hyphenate: true)
#set par(justify: true, leading: 0.38em, spacing: 0.4em)
#set list(indent: 5pt, body-indent: 3pt)

#show heading.where(level: 1): it => block(spacing: 0.4em)[
  #set text(size: 9pt, weight: "bold")
  #it.body
  #line(length: 100%, stroke: 0.5pt + black)
]
#show heading.where(level: 2): it => block(spacing: 0.25em)[
  #set text(size: 8pt, weight: "bold")
  #it.body
]

#show raw: set text(font: ("Fira Code", "DejaVu Sans Mono"), size: 6.5pt)
#show raw.where(block: true): block.with(inset: 3pt, stroke: 0.25pt + black, breakable: true)

#let cbox(body) = block(stroke: 0.4pt + black, inset: 3.5pt, breakable: true, width: 100%, body)
#let trap(body) = block(stroke: 0.4pt + black, fill: luma(240), inset: 3.5pt, breakable: true, width: 100%, [*⚠ TRAP PG:* #body])

#align(center)[
  #text(size: 11pt, weight: "bold")[CHEATSHEET PBO / OOP JAVA (UAS)] \
  #text(size: 7.5pt)[Inheritance • Polymorphism • Exception/Error • Package | 75 Menit]
]

= 1. INHERITANCE (PEWARISAN)
== Konsep & Relasi
Mekanisme class mewarisi atribut & method dari class lain (Common features). Menghindari duplikasi kode.
- *Relasi Benar:* **is-a** (`Manager` is an `Employee`).
- *Relasi Salah:* **has-a** (`Car` has an `Engine` -> ini Komposisi, bukan Inheritance).

#cbox[
  *Superclass/Parent:* Menyimpan atribut & behavior umum.
  *Subclass/Child:* Perluasan parent; mewarisi seluruh isi parent + atribut spesifiknya sendiri.
]
*Contoh Hirarki Dosen:* `Person` -> diturunkan ke `Customer` & `Employee`. `Employee` diturunkan ke `Manager` & `Salesman`.

== Syntax & `super` Keyword
```java
class Person {
  String name;
  Person(String name) { this.name = name; }
}
class Employee extends Person {
  int salary;
  Employee(String n, int s) {
    super(n); // WAJIB BARIS PERTAMA
    this.salary = s;
  }
}
```

#trap[`super(...)` memanggil constructor parent. Ia HARUS ditulis di *baris pertama* constructor child. Jika tidak ditulis, Java memanggil `super()` tanpa argumen (no-arg). Jika parent tak punya no-arg constructor, maka *Compile Error*!]

== Access Modifier & Visibilitas

* `public`: Bebas diakses dari mana saja.
* `protected`: Diakses dari *package sama* & *subclass* (meski beda package).
* `(default)`: Hanya dalam *package sama*.
* `private`: Hanya di dalam class itu sendiri.
#trap[Atribut `private` parent *tetap diwariskan* ke memori child secara konseptual, tapi *tidak bisa diakses langsung*. Harus pakai public getter/setter. Constructor tidak diwariskan, tapi di-invoke.]

= 2. POLYMORPHISM
== Definisi
*Poly* (banyak), *Morphism* (bentuk). *One name, many forms*.

== Overriding (Runtime Polymorphism)
Subclass mendefinisikan ulang method dari parent. Penentuan method terjadi saat *runtime* (Dynamic Dispatch).

* *Syarat:* Nama method, jumlah/tipe parameter, dan return type wajib *SAMA* (atau covariant).
* Akses modifier *TIDAK BOLEH* dipersempit (misal parent `protected`, child harus `protected` atau `public`).

```java
class Animal { void sound() { print("Baa"); } }
class Dog extends Animal {
  @Override
  void sound() { print("Woof"); }
}
// Upcasting (Dynamic Dispatch)
Animal a = new Dog();
a.sound(); // Output: "Woof" (Dipanggil dari aktual Dog)

```

#trap[Method `private`, `static`, atau `final` di parent *TIDAK BISA dioverride*. Jika di child ada method `private` bernama sama, itu namanya *Hiding*, BUKAN polymorphism overriding.]

== Overloading (Compile-time Polymorphism)
Dua method atau lebih dalam satu class dengan *nama sama*, tetapi *signature berbeda* (jumlah, tipe, atau urutan parameter).

```java
void pay(int amount) { ... }
void pay(int amount, boolean isPromo) { ... }

```

#trap[Hanya mengubah *return type* tanpa mengubah parameter TIDAK TERMASUK overloading -> *Compile Error*!]

= 3. EXCEPTION & ERROR HANDLING
== Jenis Kesalahan (Slide Dosen)

1. *Compile-time Error:* Dideteksi compiler (syntax error). Contoh: Kurang `;` pada `robot.disposeMoney()`.
2. *Runtime Error:* Lolos compile, crash saat eksekusi. Ada tulisan merah exception di thread main (contoh: `int j = 10 / 0`).

== Hirarki: Error vs Exception
`Throwable` adalah akar. Dibagi dua:

1. *Error:* Masalah hardware, memori, atau sistem JVM. Tidak bisa dipulihkan, *jangan ditangkap (catch)*.
   *Contoh:* `StackOverflowError`, `OutOfMemoryError` (Memori melebihi izin).


2. *Exception:* Kesalahan logika/input, *harus/bisa* ditangani dengan `try-catch`.

== Checked vs Unchecked Exception
#cbox[

* *Checked Exception:* Terdeteksi compiler. Wajib di-`try-catch` atau di-`throws`.
*(Contoh: `FileNotFoundException`, `IOException`)*
* *Unchecked Exception (Runtime):* Tidak dideteksi compiler. Terjadi saat program jalan.
*(Contoh: `NullPointerException` (akses objek yg belum ada), `ArithmeticException` (dibagi 0), `IndexOutOfBoundsException` (akses array di luar batas)).*
]

== `try-catch-finally`

```java
try {
  int arr[] = {1, 2};
  print(arr[5]); // Bahaya
} catch (IndexOutOfBoundsException e) {
  print("Lewat batas array!");
} catch (Exception e) {
  print("Tangkap error general"); // Berjenjang
} finally {
  print("Pasti jalan, walau sukses/error!");
}

```

#trap[Blok `catch` harus urut dari Child (terspesifik) ke Parent (general). Jika `catch(Exception)` di taruh dipaling atas, catch spesifik di bawahnya akan kena *Unreachable code* error!]

== Custom Exception (Throw & Throws)

* `throw`: Melempar objek exception baru.
* `throws`: Dideklarasikan di nama fungsi, melempar tanggung jawab ke yang memanggil fungsi.

```java
class SaldoKurang extends Throwable {}
void bayar(int jml) throws SaldoKurang {
  if(jml > saldo) throw new SaldoKurang();
}

```

= 4. PACKAGE
== Fungsi & Konsep
Kompiler Java tidak mengizinkan dua class dengan nama persis sama di satu file/package. Package digunakan untuk:

1. Hindari *naming collision* (konflik nama class).
2. Kategorisasi class agar mudah dikelola.
3. Access protection & reusable code.

== Import & Solusi Ambiguitas

```java
import package.name.Class; // 1 class saja
import package.name.*;     // Seluruh class dlm package

```

#trap[`import *` *TIDAK* memuat sub-package di bawahnya.]

Jika menggunakan *import* dari dua package yang punya class bernama sama (misal `Profile`), akan terjadi *Ambiguitas*.
Solusinya wajib gunakan *Fully Qualified Name (FQN)*:

```java
com.views.Profile p1 = new com.views.Profile();
com.controllers.Profile p2 = new com.controllers.Profile();

```

= 5. TRAP PG & FAST DECISION
#cbox[

1. *Ada common field/method?* -> Pertimbangkan Inheritance.
2. *Bikin child class lupa manggil `super()`?* -> Otomatis panggil constructor default parent. Kalau di parent gak ada -> ERROR.
3. *Overload vs Override:* Override pakai `@Override` dan param/return persis sama. Overload param-nya yang WAJIB beda.
4. *Polymorphism method call:* Tipe referensi menentukan apa yang bisa dipanggil, Objek aktual menentukan *implementasi* mana yang jalan.
5. *`finally`* selalu eksekusi meskipun di dalam `try` ada `return`.
]

= 6. POLA ESSAY (STUDI KASUS E-MONEY)
*Deskripsi Slide:* Buat sistem E-Money dengan method default `topup`. `Flazzy` menambah saldo 10% setiap topup. `Opalo` menambah 20% jika sedang periode promo, dan 5% jika tidak.
*(Sering diminta mana yg Overriding & mana yg Overloading!)*

```java
class EMoney {
  double balance;
  void topup(int amount) { balance += amount; }
}

class FlazzyCard extends EMoney {
  @Override // <--- OVERRIDING
  void topup(int amount) {
    balance += amount + (amount * 0.10);
  }
}

class Opalo extends EMoney {
  // <--- OVERLOADING (Beda Parameter)
  void topup(int amount, boolean isPromo) {
    double bns = isPromo ? 0.20 : 0.05;
    balance += amount + (amount * bns);
  }

  @Override // <--- OVERRIDING
  void topup(int amount) {
    this.topup(amount, false); // Panggil method overload
  }
}
```
