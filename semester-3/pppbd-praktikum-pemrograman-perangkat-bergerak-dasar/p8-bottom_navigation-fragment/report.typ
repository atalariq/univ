#import "lab-report.typ": *

#show: report.with(
  font: "Arial", mono-font: "Fira Code", font-size: 11pt,
  margin: (x: 2.5cm, y: 2.5cm),
  bib: bibliography("references.bib"),
)
#set document(title: "Bottom Navigation View dan Fragment - Codelab MyShop", author: "Atalariq Barra Hadinugraha")
#set par(justify: true, leading: 0.65em, spacing: 0.9em)
#set heading(numbering: none)
#show heading: set block(above: 1.4em, below: 0.75em)
#show link: underline
#set list(indent: 1em)
#set enum(indent: 1em)
#set page(footer: context align(right, text(size: 9pt, fill: luma(100))[
  MyShop · #counter(page).display("1 / 1", both: true)
]))
#let code(body, title, lang: "kotlin") = {
  let source = if type(body) == str { body } else { body.text }
  let lines = source.split("\n")
  let start = 0
  while start < lines.len() {
    let stop = calc.min(start + 18, lines.len())
    if stop < lines.len() {
      for i in range(start + 10, stop).rev() {
        if lines.at(i).trim() == "" { stop = i + 1; break }
      }
    }
    // Keep a short tail with its preceding chunk instead of orphaning braces.
    if lines.len() - stop <= 4 { stop = lines.len() }
    block(breakable: false)[
      #set par(leading: 0.25em, spacing: 0pt)
      #code-figure(
        lines.slice(start, stop).join("\n"), lang: lang,
        header: text(size: 8pt)[#title#if start > 0 { [ (lanjutan)] }],
        font: "Fira Code", font-size: 8.5pt, number-start: start + 1,
      )
    ]
    start = stop
  }
}
#let src(rel, ..args) = {
  let path = if rel.ends-with(".kt") { "java/com/example/myshop/" + rel } else { rel }
  let source = read("snippets/app/src/main/" + path)
  // Only line breaks for print; the files in snippets remain byte-identical.
  source = source.replace(
    "HomeFragmentDirections.actionHomeFragmentToCheckoutFragment(txtProduct.text.toString())",
    "HomeFragmentDirections.actionHomeFragmentToCheckoutFragment(\n                txtProduct.text.toString()\n            )",
  ).replace(
    "CheckoutFragmentDirections.actionCheckoutFragmentToAddressFragment()",
    "CheckoutFragmentDirections\n                        .actionCheckoutFragmentToAddressFragment()",
  ).replace(
    "adapterProvinces.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)",
    "adapterProvinces.setDropDownViewResource(\n                android.R.layout.simple_spinner_dropdown_item\n            )",
  )
  code(source, rel, lang: if rel.ends-with(".kt") { "kotlin" } else { "xml" })
}
#let config(rel) = code(read("snippets/" + rel), rel)
#let result(name, page, caption, height: 7cm) = img(
  image("assets/" + name, height: height),
  caption: [#caption. Contoh tampilan dari modul, hlm. #page.],
)
#let check(body) = block(inset: 9pt, fill: luma(247), stroke: (left: 2pt + rgb("2457a7")), width: 100%)[*Periksa hasilnya.* #body]

#text(size: 24pt, weight: "bold")[Bottom Navigation View dan Fragment]

#text(size: 16pt, fill: luma(100))[Codelab: MyShop]

Atalariq Barra Hadinugraha · 25/557554/SV/26192 · B2

Praktikum Pemrograman Perangkat Bergerak Dasar · Pertemuan 8

#tbl(columns: (auto, 1fr),
  [Nama project], [MyShop],
  [Bahasa dan antarmuka], [Kotlin dan XML Android Views],
  [Minimum SDK], [API 24],
  [Compile / target SDK pada kode], [API 37 / API 37],
)

Repository: #link("https://github.com/atalariq/pppbd-p8")

= Sebelum mulai

Codelab ini membuat aplikasi dengan tiga menu bawah: *Home*, *Keranjang*, dan *Profile*. Pada Home terdapat satu produk, Samsung M22. Tombol *Beli Sekarang* membuka Checkout sambil membawa nama produk. Dari Checkout, pengguna membuka Address, memilih provinsi, lalu kembali dengan alamat yang sudah terisi.

Setelah selesai, Anda dapat menampilkan fragment di dalam activity, menghubungkannya dengan bottom navigation, dan mengirim data ke halaman berikutnya maupun mengembalikan hasil ke halaman sebelumnya. Keranjang dan Profile tetap berupa halaman bawaan fragment, sesuai cakupan latihan. Tombol *Selesai* di Checkout kembali ke Home; tombol ini belum membuat pesanan.

Urutan kerja mengikuti modul *Bottom Navigation View dan Fragment*. Bagian *Ringkasan penugasan* diletakkan setelah seluruh langkah praktikum. @module-p8

Siapkan Android Studio, Android SDK, koneksi internet untuk sinkronisasi pertama, serta emulator atau perangkat dengan API 24 ke atas. Codelab menggunakan *Empty Views Activity*, sehingga layout ditulis dalam XML. Pilih Kotlin, bukan template Jetpack Compose.

*Tentang kode dan gambar.* Kode akhir mengacu pada commit `f2ce2a1` di repository. Riwayatnya memuat project awal pada `46b05cc`, lalu implementasi praktikum pada `f2ce2a1`. Karena commit kedua memuat banyak langkah sekaligus, tahapan di bawah disusun mengikuti modul. Semua gambar tampilan dalam laporan berasal dari modul dan diberi nomor halaman sumber; gambar tersebut bukan screenshot pengujian ulang aplikasi. @myshop-source

== Buat project

Di Android Studio, pilih *New Project → Empty Views Activity*. Isi *Name* dengan `MyShop`, *Package name* dengan `com.example.myshop`, *Language* dengan *Kotlin*, dan *Minimum SDK* dengan *API 24*. Gunakan Kotlin DSL untuk konfigurasi build. Klik *Finish* dan tunggu project selesai dibuat.

Kode repository memakai Android Gradle Plugin 9.3.3, Gradle Wrapper 9.8.0, dan JDK 25 untuk menjalankan Gradle. Nilai kompatibilitas source/target Java tetap 11. Minimum SDK 24 menentukan perangkat paling lama yang didukung; compile/target SDK pada repository adalah 37. Cocokkan konfigurasi dengan repository jika template Android Studio Anda berbeda.

= 1. Aktifkan Safe Args dan View Binding

Safe Args membuat kelas untuk action dan argumen berdasarkan navigation graph. Dengan kelas tersebut, nama argumen dan tipe datanya diperiksa saat build. View Binding membuat kelas akses view dari nama file layout. @android-safe-args

Buka `settings.gradle.kts`. Tambahkan deklarasi plugin berikut *di dalam* `pluginManagement`, setelah blok `repositories`. Jangan membuat blok `pluginManagement` kedua.

#code(```kotlin
plugins {
    id("androidx.navigation.safeargs.kotlin") version "2.10.2"
}
```, [settings.gradle.kts - di dalam pluginManagement])

Buka `app/build.gradle.kts`. Tambahkan plugin pada blok `plugins`, aktifkan View Binding dalam `android`, dan tambahkan dependency pada `dependencies`.

#code(```kotlin
// Di dalam plugins:
id("androidx.navigation.safeargs.kotlin") version "2.10.2"

// Di dalam android:
buildFeatures {
    viewBinding = true
}

// Di dalam dependencies:
val nav_version = "2.10.2"
implementation("androidx.navigation:navigation-fragment-ktx:$nav_version")
implementation("androidx.navigation:navigation-ui-ktx:$nav_version")
```, [app/build.gradle.kts - tambahan pada masing-masing blok])

Pertahankan dependency bawaan untuk AppCompat, ConstraintLayout, dan Material Components. Modul mencontohkan Navigation 2.9.4; repository memakai 2.10.2. Codelab ini mengikuti versi repository untuk plugin dan kedua library. Dua cara penulisan dependency dalam modul adalah alternatif; cukup pakai deklarasi langsung di atas.

Klik *Sync Now*. Kelas binding akan dibuat setelah layout tersedia. Kelas Safe Args seperti `HomeFragmentDirections` baru muncul setelah action dibuat dan project dibuild. Anda tidak perlu mengetik kelas hasil generate tersebut sendiri.

#check[Gradle Sync selesai. File konfigurasi tidak menampilkan kesalahan plugin atau dependency.]

= 2. Buat navigation graph dan tiga fragment

Klik kanan folder `res`, pilih *New → Android Resource File*. Isi nama `bottom_navigation` dan pilih *Resource type: Navigation*. File akan berada di `res/navigation/bottom_navigation.xml`.

Klik kanan package `com.example.myshop`, pilih *New → Fragment → Fragment (Blank)*. Buat `HomeFragment`, `CartFragment`, dan `ProfileFragment` satu per satu. Android Studio membuat kelas Kotlin dan layout untuk setiap fragment. Pertahankan layout bawaan terlebih dahulu.

Buka navigation graph pada tab *Design*. Klik tombol *New Destination* atau tanda plus, lalu tambahkan ketiga fragment. Pilih Home sebagai *Start Destination*. Pada tab *Code*, pastikan graph berisi konfigurasi berikut.

#code(```xml
<?xml version="1.0" encoding="utf-8"?>
<navigation xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/bottom_navigation"
    app:startDestination="@id/homeFragment">

    <fragment
        android:id="@+id/homeFragment"
        android:name="com.example.myshop.HomeFragment"
        android:label="fragment_home"
        tools:layout="@layout/fragment_home" />
    <fragment
        android:id="@+id/cartFragment"
        android:name="com.example.myshop.CartFragment"
        android:label="fragment_chart"
        tools:layout="@layout/fragment_cart" />
    <fragment
        android:id="@+id/profileFragment"
        android:name="com.example.myshop.ProfileFragment"
        android:label="fragment_profile"
        tools:layout="@layout/fragment_profile" />
</navigation>
```, [res/navigation/bottom_navigation.xml - tiga destination awal], lang: "xml")

`android:name` menunjuk kelas fragment yang akan dibuat oleh Navigation. `tools:layout` membantu pratinjau di editor; atribut itu tidak memasang layout saat aplikasi berjalan. Label `fragment_chart` pada Cart mengikuti kode repository, tetapi ID destination-nya tetap `cartFragment`.

#result("module-navigation-graph.png", 3, [Tiga fragment terdaftar pada navigation graph], height: 6.7cm)

#check[Graph memiliki Home, Cart, dan Profile. Home ditandai sebagai tujuan awal.]

= 3. Buat menu bottom navigation

Klik kanan `res`, pilih *New → Android Resource File*. Isi nama `bottom_navigation_menu` dan pilih *Resource type: Menu*.

Siapkan ikon melalui klik kanan `res/drawable → New → Vector Asset`. Pilih *Clip Art*, cari ikon `home`, `shopping_cart`, dan `person`, lalu simpan dengan nama `home_24`, `shopping_cart_24`, dan `person_24`. Gunakan ikon terisi agar serupa dengan contoh modul. Jika ingin bentuk yang sama dengan repository, salin XML ikon dari folder `res/drawable` pada repository.

Isi file menu dengan kode berikut.

#src("res/menu/bottom_navigation_menu.xml")

ID menu harus sama dengan ID destination: `homeFragment`, `cartFragment`, dan `profileFragment`. Judul boleh berbeda dari nama kelas. Misalnya, judul *Keranjang* tetap menggunakan ID `cartFragment`. Ketika menu dihubungkan ke controller, ID inilah yang digunakan untuk menemukan tujuan. @android-navigation-ui

#check[Tidak ada resource ikon yang belum ditemukan. Ketiga ID menu sama persis dengan ID di graph.]

= 4. Pasang NavHost dan hubungkan menu

Buka `res/layout/activity_main.xml`. Ganti isinya dengan layout berikut.

#src("res/layout/activity_main.xml")

`NavHostFragment` adalah tempat Navigation menampilkan fragment tujuan. Tingginya `0dp` karena ukuran ditentukan oleh constraint: dari atas layar sampai bagian atas bottom navigation. Atribut `app:navGraph` memilih graph, sedangkan `app:defaultNavHost="true"` membuat host menangani tombol Back sistem dalam alur navigasi. @android-return-result

`BottomNavigationView` berada di bawah layar dan membaca item dari `bottom_navigation_menu.xml`. Selanjutnya, ganti seluruh isi `MainActivity.kt` berikut.

#src("MainActivity.kt")

`setContentView(binding.root)` memasang layout activity terlebih dahulu. Setelah itu, `findNavController(R.id.nav_host_fragment)` mendapatkan controller milik host. `setupWithNavController()` menghubungkan pilihan menu dan destination. Anda tidak perlu menulis listener yang mengganti fragment satu per satu. @android-navigation-ui

Jalankan aplikasi, lalu ketuk Home, Keranjang, dan Profile. Pada tahap ini, isi fragment masih bawaan. Tujuannya memeriksa perpindahan tiga menu sebelum menambahkan halaman produk.

#check[Bottom navigation tampil dan ketiga menu dapat dipilih. Jika halaman tidak berganti, periksa kesamaan ID menu dengan destination serta `app:navGraph` pada host.]

= 5. Susun tampilan produk di Home

Buat satu vector asset lagi: cari ikon `smartphone`, lalu simpan sebagai `mobile_24`. Ganti `res/layout/fragment_home.xml` dengan kode berikut.

#src("res/layout/fragment_home.xml")

`LinearLayout` menyusun ikon, nama produk, dan tombol secara vertikal. `gravity="center"` menempatkan seluruh isi di tengah. ID `txt_product` diperlukan untuk mengambil nama produk pada tahap pengiriman data nanti. ID ini melengkapi contoh awal modul yang belum memberi ID pada `TextView` nama produk.

Jalankan kembali aplikasi dan buka Home. Tombol belum diberi listener; pada tahap ini tombol belum membuka Checkout.

#result("module-home.png", 8, [Home menampilkan produk dan tombol Beli Sekarang])

#check[Home menampilkan ikon telepon, teks Samsung M22, dan tombol Beli Sekarang. Keranjang serta Profile tetap seperti sebelumnya.]

= 6. Buat Checkout dan navigasi dari Home

Buat *Fragment (Blank)* bernama `CheckoutFragment`. Buka `res/layout/fragment_checkout.xml` dan ganti seluruh isinya.

#src("res/layout/fragment_checkout.xml")

`tools:text="Nama Produk"` hanya muncul pada pratinjau editor. Saat aplikasi berjalan, `txt_product_name` masih kosong sampai diisi melalui kode. Kolom alamat dibuat tidak menerima pengetikan; nanti ketukan pada kolom akan membuka pemilihan provinsi.

Untuk tahap awal, ganti isi `CheckoutFragment.kt` dengan kelas berikut. Import binding berasal dari package aplikasi.

#code(```kotlin
package com.example.myshop

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.example.myshop.databinding.FragmentCheckoutBinding

class CheckoutFragment : Fragment() {
    private var _binding: FragmentCheckoutBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentCheckoutBinding.inflate(inflater, container, false)
        return binding.root
    }
}
```, [CheckoutFragment.kt - sebelum menerima argumen])

Buka navigation graph. Tambahkan Checkout sebagai destination, lalu tarik panah dari Home ke Checkout. Jika mengedit XML, ubah tag penutup Home dari `/>` menjadi `>`, tambahkan action di dalamnya, lalu tutup dengan `</fragment>`. Tambahkan juga destination Checkout sebelum `</navigation>`.

#code(```xml
<!-- Di dalam destination homeFragment: -->
<action
    android:id="@+id/action_homeFragment_to_checkoutFragment"
    app:destination="@id/checkoutFragment" />

<!-- Destination baru, sejajar dengan Home, Cart, dan Profile: -->
<fragment
    android:id="@+id/checkoutFragment"
    android:name="com.example.myshop.CheckoutFragment"
    android:label="fragment_checkout"
    tools:layout="@layout/fragment_checkout" />
```, [res/navigation/bottom_navigation.xml - tambahan Checkout], lang: "xml")

Build project supaya Safe Args menghasilkan `HomeFragmentDirections`. Ganti seluruh isi `HomeFragment.kt` berikut.

#code(```kotlin
package com.example.myshop

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import com.example.myshop.databinding.FragmentHomeBinding

class HomeFragment : Fragment() {
    private var _binding: FragmentHomeBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        _binding = FragmentHomeBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        with(binding) {
            val action =
                HomeFragmentDirections.actionHomeFragmentToCheckoutFragment()
            btnBuy.setOnClickListener {
                findNavController().navigate(action)
            }
        }
    }
}
```, [HomeFragment.kt - navigasi tanpa data])

Objek `action` menyimpan tujuan perpindahan. Ketukan pada `btnBuy` memanggil `navigate(action)`, lalu host mengganti tampilan Home dengan Checkout. Pemanggilan tanpa parameter benar untuk tahap ini, karena Checkout belum mempunyai argumen wajib. @android-safe-args

#result("module-checkout-empty.png", 11, [Checkout sudah terbuka, tetapi nama produk belum terisi])

#check[Ketuk Beli Sekarang. Checkout terbuka dengan kolom Alamat dan tombol Selesai. Nama produk masih kosong; pengiriman namanya ditambahkan pada langkah berikut.]

= 7. Kirim nama produk dengan Safe Args

Pada navigation graph, pilih Checkout. Di panel *Arguments*, tekan plus, isi nama `productName`, pilih tipe *String*, dan biarkan tanpa nilai default. Padanan XML-nya adalah elemen berikut, *di dalam* destination Checkout.

#code(```xml
<argument
    android:name="productName"
    app:argType="string" />
```, [res/navigation/bottom_navigation.xml - argumen Checkout], lang: "xml")

Jika Checkout masih memakai tag `/>`, ubah menjadi pasangan tag pembuka dan penutup agar elemen `argument` dapat diletakkan di dalamnya.

#result("module-product-argument.png", 12, [Penambahan argumen productName pada Checkout], height: 5.8cm)

Di `HomeFragment.kt`, ganti deklarasi `action` dengan kode berikut. Jangan menambahkan listener kedua.

#code(```kotlin
val action = HomeFragmentDirections.actionHomeFragmentToCheckoutFragment(
    txtProduct.text.toString()
)
```, [HomeFragment.kt - ganti deklarasi action])

`txtProduct` berasal dari ID `txt_product` di layout. Nilainya dibaca sebagai teks, diubah menjadi `String`, lalu dimasukkan sebagai argumen action. Setelah argumen wajib dibuat, pemanggilan lama tanpa parameter perlu diganti agar sesuai dengan kelas hasil generate. @android-safe-args

Di Checkout, tambahkan import berikut.

#code(```kotlin
import androidx.navigation.fragment.navArgs
```, [CheckoutFragment.kt - import tambahan])

Tambahkan method `onViewCreated` berikut di dalam kelas, setelah `onCreateView`.

#code(```kotlin
override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    super.onViewCreated(view, savedInstanceState)
    with(binding) {
        val args: CheckoutFragmentArgs by navArgs()
        txtProductName.setText(args.productName)
    }
}
```, [CheckoutFragment.kt - menerima productName])

`CheckoutFragmentArgs` adalah kelas hasil Safe Args. `navArgs()` membacakan argumen milik destination ini, lalu `args.productName` mengakses nama produk dengan tipe yang sudah ditentukan pada graph. @android-safe-args

#check[Build dan jalankan kembali. Tekan Beli Sekarang dari Home. Teks Samsung M22 kini tampil di atas kolom Alamat pada Checkout.]

= 8. Buat Address dan buka dari Checkout

Buat *Fragment (Blank)* bernama `AddressFragment`. Ganti isi `res/layout/fragment_address.xml` berikut.

#src("res/layout/fragment_address.xml")

Layout memuat sebuah `TextView`, spinner, dan tombol Selesai. `tools:text="Name"` hanya untuk pratinjau; nama pengguna tidak akan muncul saat aplikasi berjalan karena tidak ada kode yang mengisinya. Latihan ini menggunakan spinner untuk memilih provinsi.

Ganti isi `AddressFragment.kt` dengan kelas awal berikut. Spinner belum mempunyai adapter pada tahap ini.

#code(```kotlin
package com.example.myshop

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.example.myshop.databinding.FragmentAddressBinding

class AddressFragment : Fragment() {
    private var _binding: FragmentAddressBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentAddressBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}
```, [AddressFragment.kt - sebelum mengisi spinner])

Daftarkan Address pada graph, lalu tarik panah dari Checkout ke Address. Pada XML, tambahkan action berikut di dalam destination Checkout, setelah elemen `argument`. Destination Address diletakkan sejajar dengan destination lainnya.

#code(```xml
<!-- Di dalam destination checkoutFragment: -->
<action
    android:id="@+id/action_checkoutFragment_to_addressFragment"
    app:destination="@id/addressFragment" />

<!-- Destination baru: -->
<fragment
    android:id="@+id/addressFragment"
    android:name="com.example.myshop.AddressFragment"
    android:label="fragment_address"
    tools:layout="@layout/fragment_address" />
```, [res/navigation/bottom_navigation.xml - tambahan Address], lang: "xml")

#result("module-address-graph.png", 15, [Action dari Checkout menuju Address], height: 5.4cm)

Tambahkan import `androidx.navigation.fragment.findNavController` pada Checkout. Di dalam `with(binding)` pada `onViewCreated`, setelah pengisian nama produk, tambahkan listener berikut.

#code(```kotlin
edtAddress.setOnClickListener {
    val action =
        CheckoutFragmentDirections.actionCheckoutFragmentToAddressFragment()
    findNavController().navigate(action)
}
```, [CheckoutFragment.kt - membuka Address])

Nama fungsi mengikuti ID action pada graph. Modul menampilkan contoh nama yang berakhiran `AddressFragment3`; codelab ini memakai nama tanpa angka, sesuai action dalam repository. Jangan menambahkan angka jika graph Anda menggunakan ID di atas.

#check[Dari Checkout, ketuk kolom Alamat. Address terbuka, tetapi spinner belum berisi pilihan. Tombol Selesai belum mengembalikan nilai.]

= 9. Isi spinner dengan daftar provinsi

Buka `res/values/strings.xml`. Tambahkan resource `provinces` *di dalam* elemen `resources`, bukan setelah tag penutupnya. Isi akhir file pada repository adalah berikut.

#src("res/values/strings.xml")

Daftar ini berisi sepuluh contoh dari modul. Daftar tersebut tidak dimaksudkan sebagai daftar lengkap seluruh provinsi Indonesia.

Di `AddressFragment.kt`, tambahkan import berikut.

#code(```kotlin
import android.widget.ArrayAdapter
```, [AddressFragment.kt - import adapter])

Tambahkan `onViewCreated` berikut di dalam kelas, sebelum `onDestroyView`.

#code(```kotlin
override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
    super.onViewCreated(view, savedInstanceState)
    with(binding) {
        val provinces = resources.getStringArray(R.array.provinces)
        val adapterProvinces = ArrayAdapter(
            requireContext(),
            android.R.layout.simple_spinner_item,
            provinces
        )
        adapterProvinces.setDropDownViewResource(
            android.R.layout.simple_spinner_dropdown_item
        )
        spinnerProvinces.adapter = adapterProvinces
    }
}
```, [AddressFragment.kt - mengisi spinner])

`resources.getStringArray()` membaca pilihan dari resource. `ArrayAdapter` menghubungkan array dengan spinner. Layout baris memakai `android.R.layout` karena berasal dari Android; `R.array.provinces` berasal dari aplikasi sendiri. Tidak perlu memakai package contoh `com.example.botttomnavkotlin` yang tercantum pada modul.

#result("module-address.png", 17, [Spinner Address sudah menampilkan pilihan provinsi])

#check[Buka Address, lalu ketuk spinner. Sepuluh provinsi tampil sebagai pilihan. Pilihan awal adalah Aceh, sesuai urutan array.]

= 10. Kembalikan provinsi ke Checkout

Address akan menulis hasil pada entry Checkout yang masih berada di back stack, kemudian menutup dirinya. Checkout mengamati nilai pada entry miliknya sendiri. Keduanya menggunakan key yang sama: `address`. @android-return-result

Tambahkan import `androidx.navigation.fragment.findNavController` pada Address. Di dalam `with(binding)` pada `onViewCreated`, setelah pemasangan adapter, tambahkan listener berikut.

#code(```kotlin
btnDone.setOnClickListener {
    findNavController().apply {
        previousBackStackEntry
            ?.savedStateHandle?.set(
                "address",
                spinnerProvinces.selectedItem.toString()
            )
    }.navigateUp()
}
```, [AddressFragment.kt - mengirim hasil])

Pada saat kode ini berjalan, entry aktif adalah Address. `previousBackStackEntry` menunjuk Checkout yang membukanya. Provinsi disimpan *sebelum* `navigateUp()` dipanggil. Tanda `?.` membuat akses berikutnya dilewati jika entry tidak tersedia. Dalam alur praktikum, Address selalu dibuka dari Checkout.

Di Checkout, tambahkan observer berikut di dalam `with(binding)`, setelah listener kolom alamat.

#code(```kotlin
findNavController().currentBackStackEntry
    ?.savedStateHandle?.let { handle ->
        handle.getLiveData<String>("address")
            .observe(viewLifecycleOwner) { res ->
                edtAddress.setText(res)
            }
    }
```, [CheckoutFragment.kt - menerima hasil alamat])

Observer dipasang saat Checkout menyiapkan view-nya. `currentBackStackEntry` pada saat itu adalah entry Checkout. Setelah hasil ditulis oleh Address dan Checkout kembali aktif, observer mengisi kolom alamat. `viewLifecycleOwner` membatasi pengamatan mengikuti umur view Checkout. @android-return-result

#grid(columns: (1fr, 1fr), gutter: 1em,
  result("module-address-selected.png", 19, [Pilihan Bengkulu pada Address], height: 6cm),
  result("module-checkout-result.png", 19, [Bengkulu diterima pada Checkout], height: 6cm),
)

#check[Pilih Bali di Address, lalu tekan Selesai. Anda kembali ke Checkout, nama produk tetap Samsung M22, dan kolom Alamat menampilkan Bali. Ulangi dengan provinsi lain untuk memeriksa pembaruan nilainya.]

= 11. Kembali ke Home dari Checkout

Di Checkout, tambahkan listener berikut di dalam `with(binding)`, setelah observer alamat.

#code(```kotlin
btnDone.setOnClickListener {
    findNavController().navigateUp()
}
```, [CheckoutFragment.kt - tombol Selesai])

Karena Checkout dibuka dari Home, `navigateUp()` mengembalikan pengguna ke Home. Kode ini tidak menyimpan pesanan maupun mengirim transaksi.

Setelah tombol ditekan, Home semestinya kembali menampilkan produk seperti pada langkah 5. Modul memberikan kode untuk perpindahan ini tanpa gambar hasil Home yang terpisah.

#check[Ikuti alur Home → Checkout → Address → Checkout → Home. Setelah itu, pilih Keranjang dan Profile untuk memastikan menu utama tetap dapat dibuka.]

== Cocokkan kode akhir

Graph akhir memiliki lima destination, dua action, dan satu argumen. Gunakan kode berikut untuk memeriksa letak setiap elemen XML setelah seluruh penambahan.

#src("res/navigation/bottom_navigation.xml")

Berikut isi akhir Home, Checkout, dan Address dari repository. Beberapa baris panjang dipenggal pada batas ekspresi agar muat di halaman; isi file asli tetap tersedia dalam snapshot pendamping. Potongan ini membantu memeriksa penempatan listener, observer, serta import setelah perubahan bertahap.

*Catatan lifecycle.* Source praktikum Home dan Checkout belum mengosongkan `_binding` pada `onDestroyView()`. Address sudah melakukannya. Saat mengembangkan latihan ini, pola pelepasan binding pada Address perlu diterapkan pada fragment lain yang menyimpan binding. Laporan ini mempertahankan kode repository dan tidak mengklaim bahwa binding kedua fragment tersebut sudah dilepas.

#src("HomeFragment.kt")
#src("CheckoutFragment.kt")
#src("AddressFragment.kt")

#pagebreak()
= Ringkasan penugasan

== 1. Apa itu fragment?

Fragment adalah bagian antarmuka yang memiliki layout, lifecycle, dan penanganan interaksi sendiri. Fragment harus ditampung oleh activity atau fragment lain. Pemisahan ini memungkinkan beberapa halaman berada di bawah satu activity tanpa menaruh seluruh kode tampilan dalam activity tersebut. @android-fragments

Pada MyShop, `MainActivity` menampung navigasi utama, sedangkan Home, Cart, Profile, Checkout, dan Address menangani isi halamannya masing-masing. `onCreateView()` membuat view fragment; `onViewCreated()` digunakan untuk menyiapkan interaksi setelah view tersedia.

Umur instance fragment dan umur view-nya tidak selalu sama. Karena itu, referensi view seperti binding perlu dilepas saat `onDestroyView()`, sebagaimana dilakukan Address. Observer yang mengubah view memakai `viewLifecycleOwner` agar tidak terus terhubung setelah view tersebut dihancurkan.

== 2. Bagaimana menampilkan fragment di dalam activity?

MyShop menggunakan `NavHostFragment` pada layout activity. Host membaca `res/navigation/bottom_navigation.xml`, lalu menampilkan destination awal yang ditentukan oleh `app:startDestination`. Pada graph ini, tujuan awalnya adalah Home.

Bagian yang menghubungkannya adalah:

#code(```xml
<!-- Pada NavHostFragment di activity_main.xml: -->
app:navGraph="@navigation/bottom_navigation"
app:defaultNavHost="true"

<!-- Pada elemen navigation di bottom_navigation.xml: -->
app:startDestination="@id/homeFragment"
```, [Hubungan layout activity dan navigation graph], lang: "xml")

Pada activity, `ActivityMainBinding.inflate(layoutInflater)` membuat layout dan `setContentView(binding.root)` memasangnya. Di dalam layout tersebut, host menampilkan Home. Nama kelas pada destination harus sesuai package dan kelas Kotlin, misalnya `com.example.myshop.HomeFragment`.

Fragment juga dapat dikelola melalui transaksi `FragmentManager`, tetapi praktikum ini memakai Navigation Component agar host, graph, action, dan back stack bekerja dalam satu alur. @android-fragments @android-return-result

== 3. Bagaimana menambahkan bottom navigation?

Siapkan tiga bagian: resource menu, `BottomNavigationView` dalam layout activity, dan penghubung ke `NavController`. Setiap item menu diberi ID yang sama dengan destination yang akan dibuka. Layout view menunjuk menu melalui `app:menu="@menu/bottom_navigation_menu"`.

Setelah layout activity terpasang, jalankan:

#code(```kotlin
val navController = findNavController(R.id.nav_host_fragment)
bottomNavigationView.setupWithNavController(navController)
```, [MainActivity.kt - penghubung menu dan graph])

Saat pengguna mengetuk Keranjang, item dengan ID `cartFragment` dipetakan ke destination dengan ID yang sama. Label *Keranjang* adalah teks tampilan, sedangkan ID merupakan penghubung teknisnya. `setupWithNavController()` juga memperbarui pilihan menu mengikuti perubahan destination yang sesuai. @android-navigation-ui

== 4. Bagaimana berpindah dari satu fragment ke fragment lain?

Daftarkan fragment tujuan pada graph, lalu buat action pada fragment asal. Untuk Home menuju Checkout, action-nya adalah `action_homeFragment_to_checkoutFragment`. Safe Args menghasilkan fungsi yang dapat dipanggil dari Home. @android-safe-args

#code(```kotlin
val action = HomeFragmentDirections.actionHomeFragmentToCheckoutFragment(
    txtProduct.text.toString()
)
btnBuy.setOnClickListener {
    findNavController().navigate(action)
}
```, [HomeFragment.kt - menuju Checkout])

Pemanggilan tersebut membawa nama produk karena Checkout mempunyai argumen wajib `productName`. `findNavController()` mengambil controller yang menaungi fragment, lalu `navigate(action)` membuka destination yang ditentukan action.

Checkout menuju Address menggunakan pola yang sama melalui `CheckoutFragmentDirections.actionCheckoutFragmentToAddressFragment()`. Action ini tidak membawa argumen. Untuk kembali pada alur praktikum, tombol Selesai memanggil `findNavController().navigateUp()`.

Alur back stack-nya dapat dibaca sebagai berikut:

#tbl(columns: (1fr, 1fr),
  [Tindakan], [Urutan halaman dalam alur],
  [Buka aplikasi], [Home],
  [Beli Sekarang], [Home → Checkout],
  [Ketuk Alamat], [Home → Checkout → Address],
  [Selesai di Address], [Home → Checkout],
  [Selesai di Checkout], [Home],
)

`navigateUp()` pada contoh ini memakai riwayat navigasi yang sudah terbentuk. Tidak diperlukan action baru dari Address ke Checkout hanya untuk mengembalikan hasil. @android-return-result

== 5. Bagaimana fragment saling berkomunikasi?

MyShop memperlihatkan dua kebutuhan: mengirim input ke destination berikutnya dan mengembalikan hasil ke destination sebelumnya. Nama produk dikirim lewat Safe Args; provinsi dikembalikan lewat `SavedStateHandle` pada back stack.

*Input Home → Checkout.* Definisikan argumen string bernama `productName` di Checkout. Home memasukkan teks produk ke fungsi action, seperti pada jawaban sebelumnya. Checkout kemudian membacanya:

#code(```kotlin
val args: CheckoutFragmentArgs by navArgs()
txtProductName.setText(args.productName)
```, [CheckoutFragment.kt - membaca input])

Safe Args menyelaraskan nama dan tipe argumen antara graph dan kelas hasil generate. Mengirim argumen berupa nama produk sudah cukup untuk contoh ini. Untuk objek yang besar, dokumentasi Android menyarankan mengirim data minimum, misalnya ID untuk mengambil data tujuan. @android-safe-args

*Hasil Address → Checkout.* Address menulis provinsi pada entry sebelumnya sebelum kembali:

#code(```kotlin
findNavController().previousBackStackEntry
    ?.savedStateHandle
    ?.set("address", spinnerProvinces.selectedItem.toString())
findNavController().navigateUp()
```, [AddressFragment.kt - inti pengembalian hasil])

Checkout mengamati key yang sama pada entry miliknya:

#code(```kotlin
findNavController().currentBackStackEntry
    ?.savedStateHandle
    ?.getLiveData<String>("address")
    ?.observe(viewLifecycleOwner) { address ->
        edtAddress.setText(address)
    }
```, [CheckoutFragment.kt - inti penerimaan hasil])

`previousBackStackEntry` dipakai oleh pengirim karena saat itu entry aktif adalah Address. `currentBackStackEntry` dipakai oleh penerima ketika Checkout memasang observer-nya. Keduanya merujuk entry Checkout pada waktu pemanggilan masing-masing. Key `address` harus sama persis dan tipe nilainya sama-sama `String`. @android-return-result

Nilai pada handle tetap tersedia sampai dihapus atau entry-nya dilepas dari back stack. Implementasi ini tidak menghapus key setelah menerima hasil, sehingga nilai alamat dapat ditampilkan lagi saat view Checkout dibuat kembali selama entry yang sama masih ada. Untuk hasil yang memang hanya boleh dikonsumsi sekali, dokumentasi menyarankan menghapus key setelah ditangani. @android-return-result

== Batas hasil praktikum

Kode repository memuat alur navigasi dan pertukaran data yang diminta modul. Gambar pada laporan menunjukkan hasil rujukan modul. Laporan ini tidak menjadikan gambar tersebut sebagai bukti aplikasi telah diuji ulang di perangkat. Keranjang dan Profile masih berupa halaman bawaan; pemilihan alamat baru sebatas provinsi; tombol Selesai belum melakukan transaksi. Bagian tersebut menjadi batas latihan saat ini.
