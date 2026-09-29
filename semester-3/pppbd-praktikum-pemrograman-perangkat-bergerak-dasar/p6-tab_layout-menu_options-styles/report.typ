#import "@atalariq/lab-report:3.0.0": *

// ── Komposisi dari komponen (tanpa preset full / minimal) ────────────────────

#show: report.with(
  font: "Arial",
  mono-font: "Fira Code",
  font-size: 11pt,
  margin: (x: 2.5cm, y: 2.5cm),
)

#set document(
  title: "Tab Layout, Options Menu, Fragment, dan Custom Styles",
  author: "Atalariq Barra Hadinugraha",
)
#set par(justify: true, leading: 0.7em, spacing: 1.1em)
#set heading(numbering: none)
#show heading: set block(above: 1.6em, below: 0.9em)
#show link: underline
#set list(indent: 1em)
#set enum(indent: 1em)

// ── Helper ──────────────────────────────────────────────────────────────────

// Kode diambil langsung dari repository agar tutorial selalu sama dengan
// aplikasi. `rel` relatif terhadap app/src/main/.
#let app-src = "code.local/app/src/main/"
#let src(rel, ..args) = code-figure(
  read(app-src + rel),
  lang: if rel.ends-with(".kt") { "kotlin" } else { "xml" },
  header: [#rel.replace("java/com/example/mycourse/", "")],
  ..args,
)

// ── Header ──────────────────────────────────────────────────────────────────

#text(size: 24pt)[Tab Layout, Options Menu & Custom Styles]

#text(size: 16pt, fill: luma(110))[Codelab: My Course]

#v(0.6em)

#tbl(
  columns: (1fr, 1fr),
  [Nama Project],
  [My Course],
  [Target & Minimum Target SDK],
  [Phone and Tablet, API level 24],
  [Language],
  [Kotlin],
)

#v(0.4em)

Repository: #link("https://github.com/atalariq/pppbd-p6")

// ── Pengantar ───────────────────────────────────────────────────────────────

= Pengantar

Codelab ini membangun aplikasi *My Course* dari awal sampai selesai. Aplikasi memiliki tiga halaman yang ditampilkan sebagai tab: *Home* (deskripsi kelas praktikum), *Material* (daftar materi yang sudah diajarkan), dan *Quiz* (keterangan bahwa quiz belum dilaksanakan). Halaman-halaman tersebut adalah `Fragment` yang dikelola oleh `ViewPager2` dan dihubungkan ke `TabLayout` melalui `SectionsPagerAdapter`. Selain itu, aplikasi memiliki Options Menu untuk berpindah tab dan custom style untuk teks dan tombol.

Setelah mengikuti seluruh langkah, Anda akan memiliki:

+ tema aplikasi dengan ActionBar,
+ tiga fragment (`HomeFragment`, `MaterialFragment`, `QuizFragment`),
+ `SectionsPagerAdapter` yang menghubungkan fragment ke `ViewPager2`,
+ `TabLayout` yang tersinkron dengan `ViewPager2`,
+ Options Menu yang memindahkan tab, dan
+ custom style tombol rounded (`CustomRoundedButton`) dan teks (`CustomTextView18Bold`).

Seluruh kode pada codelab ini sama dengan repository di bagian atas dokumen. Salin kode sesuai nama file yang tertera pada header setiap blok kode.

// ── Persiapan ───────────────────────────────────────────────────────────────

= Persiapan Project

Buka Android Studio, lalu pilih *New Project* → *Empty Views Activity*. Isi konfigurasi berikut.

#tbl(
  columns: (auto, 1fr),
  [Name],
  [My Course],
  [Package name],
  [`com.example.mycourse`],
  [Minimum SDK],
  [API 24],
  [Language],
  [Kotlin],
  [Build configuration language],
  [Kotlin DSL (build.gradle.kts)],
)

Klik *Finish* dan tunggu Gradle selesai sinkronisasi. Package name harus sama persis karena kode pada codelab ini memakai `package com.example.mycourse`.

== Dependency dan View Binding

`TabLayout` berasal dari library Material Components, sedangkan `ViewPager2` berasal dari library AndroidX. Keduanya perlu ditambahkan.

Buka `app/build.gradle.kts`. Aktifkan View Binding di dalam blok `android`, lalu daftarkan kedua library di blok `dependencies`

#code-figure(
  ```kotlin
  android {
      // ... namespace, compileSdk, defaultConfig, buildTypes, compileOptions ...

      buildFeatures {
          viewBinding = true
      }
  }

  dependencies {
      // ... dependency bawaan project ...
      implementation(libs.material)
      implementation(libs.androidx.viewpager2)
  }
  ```,
  header: [app/build.gradle.kts (tambahan)],
)

Klik *Sync Now* di pojok kanan atas supaya library terunduh. View Binding membuat satu kelas untuk setiap file layout. Contohnya `activity_main.xml` menghasilkan `ActivityMainBinding` dan `fragment_home.xml` menghasilkan `FragmentHomeBinding`. Dengan kelas ini, view diakses lewat properti (`binding.viewPager`) sehingga `findViewById` tidak diperlukan lagi.

// ── Theme ───────────────────────────────────────────────────────────────────

= Application Theme

Application Theme mengatur tampilan dan gaya aplikasi, seperti warna, font, dan ikon. Template project membuat tema tanpa ActionBar (`NoActionBar`). Options Menu tampil di ActionBar, sehingga project ini membutuhkan tema kedua yang memiliki ActionBar.

Ganti seluruh isi `res/values/themes.xml` dengan kode berikut.

#src("res/values/themes.xml")

Lakukan hal yang sama pada `res/values-night/themes.xml`. File ini dipakai ketika perangkat berada pada dark mode.

#src("res/values-night/themes.xml")

Sekarang ada dua tema:

+ `Base.Theme.MyCourse` — tanpa ActionBar.
+ `Base.Theme.MyCourse.WithActionBar` — dengan ActionBar.

Tema dipilih pada `AndroidManifest.xml`, baik untuk seluruh aplikasi (tag `<application>`) maupun untuk activity tertentu (tag `<activity>`). Codelab ini memakai ActionBar di seluruh aplikasi. Ubah atribut `android:theme` pada tag `<application>`:

#code-figure(
  ```xml
  <application
      ...
      android:theme="@style/Theme.MyCourse.WithActionBar">
      ...
  </application>
  ```,
  lang: "xml",
  header: [AndroidManifest.xml (perubahan)],
)

// ── Strings ─────────────────────────────────────────────────────────────────

= Strings

Semua teks dikumpulkan di `res/values/strings.xml`. Cara ini memudahkan perubahan teks dan penggunaan ulang, misalnya judul tab dan judul menu memakai string yang sama. Ganti seluruh isi file dengan kode berikut.

#src("res/values/strings.xml")

Beberapa hal yang perlu diperhatikan:

- `tab_home_text`, `tab_material_text`, dan `tab_quiz_text` dipakai sebagai judul tab sekaligus judul item menu.
- `material_list` adalah `string-array`, yaitu daftar string dengan satu nama. Daftar ini menjadi sumber data `ListView` pada halaman Material.
- `home_lecturer`, `home_class`, dan `home_schedule` berisi data kelas praktikum. Sesuaikan dengan data kelas Anda.

// ── Custom Style ────────────────────────────────────────────────────────────

= Custom Style

Custom Style memungkinkan Anda mendefinisikan sekumpulan atribut sekali, lalu memakainya di banyak elemen UI. Style dapat mewarisi style lain (atribut `parent`) sehingga duplikasi kode dapat dihindari.

== Bentuk tombol (selector)

Buat file drawable baru: klik kanan folder `res/drawable` → *New* → *Drawable Resource File*. Beri nama `rounded_button`, ubah *Root element* menjadi `selector`, lalu isi dengan kode berikut.

#src("res/drawable/rounded_button.xml")

`selector` memilih satu bentuk sesuai state tombol. Setiap `item` memiliki `shape` yang menentukan bentuk, warna (`solid`), dan sudut (`corners`, radius 8dp). Ada tiga state:

- `state_enabled="false"` — tombol nonaktif, berwarna abu-abu.
- `state_pressed="true"` — tombol sedang ditekan, berwarna biru tua.
- `item` tanpa state — kondisi normal, berwarna biru.

Android memakai *item pertama yang cocok* dari atas ke bawah. Karena itu, state nonaktif dan state ditekan harus ditulis sebelum item default. Jika item default ditulis lebih dulu, item tersebut selalu cocok dan state lain tidak pernah dipakai.

== Style tombol dan teks

Buat file `res/values/styles.xml`: klik kanan folder `res/values` → *New* → *Values Resource File*. Isi dengan kode berikut.

#src("res/values/styles.xml")

Dua style didefinisikan di sini:

- `CustomRoundedButton` mewarisi `Widget.AppCompat.Button`. Style ini memakai `rounded_button` sebagai latar, teks putih, dan padding 10dp.
- `CustomTextView18Bold` mewarisi `Widget.AppCompat.TextView`. Style ini membuat teks berukuran 18sp, tebal, dan rata tengah.

Style dipakai pada elemen layout dengan atribut `style="@style/NamaStyle"`. Penggunaannya muncul pada langkah berikutnya.

// ── Drawable ────────────────────────────────────────────────────────────────

= Gambar dan Ikon

Halaman Home memakai gambar, dan Options Menu memakai ikon. Keduanya berupa vector drawable.

*Ikon menu.* Klik kanan folder `res/drawable` → *New* → *Vector Asset*. Pada *Clip Art*, cari `home` dan pilih gaya *Outlined*. Beri nama `outline_home_24`, lalu klik *Next* dan *Finish*.

*Gambar Home.* Ulangi langkah yang sama: klik kanan folder `res/drawable` → *New* → *Vector Asset*. Pada *Clip Art*, cari `android` dan pilih gaya *Outlined*. Ubah *Color* menjadi `A4C639` (hijau logo Android), beri nama `outline_android_24`, lalu klik *Next* dan *Finish*. Hasilnya adalah file berikut (komentar lisensi di bagian atas file dapat diabaikan).

#src("res/drawable/outline_android_24.xml", line-range: (16, 21))

Warna hijau ditanam pada atribut `android:tint`, dan bentuk gambar berada pada `pathData`. `viewportWidth` dan `viewportHeight` menentukan ukuran kanvas gambar, sedangkan `width` dan `height` menentukan ukuran bawaan (24dp). Ukuran bawaan ini akan diperbesar menjadi 120dp oleh `ImageView` pada layout Home. Gambar tidak pecah karena berupa vector.

// ── Fragment ────────────────────────────────────────────────────────────────

= Fragment

Fragment adalah bagian UI yang dapat dipakai ulang di dalam activity. Setiap tab akan menampilkan satu fragment. Buat tiga fragment: `HomeFragment`, `MaterialFragment`, dan `QuizFragment`.

Untuk setiap fragment, klik kanan package `com.example.mycourse` → *New* → *Fragment* → *Fragment (Blank)*. Isi *Fragment Name* sesuai nama di atas. Android Studio otomatis membuat file kelas dan file layout (`fragment_home.xml`, `fragment_material.xml`, `fragment_quiz.xml`). Pastikan opsi *Include fragment factory methods* dan *Include interface callbacks* tidak dicentang.

Kode bawaan Android Studio akan ditimpa pada langkah berikut, sehingga isi awalnya tidak perlu diperhatikan.

== HomeFragment

Halaman Home berisi gambar, judul, deskripsi kelas praktikum, dan data kelas. Judul memakai style `CustomTextView18Bold`. Isi layout dibungkus `ScrollView` agar seluruh teks tetap dapat dibaca pada layar kecil.

#src("res/layout/fragment_home.xml")

Atribut `android:justificationMode="inter_word"` pada deskripsi membuat teks rata kiri dan kanan. Atribut ini berlaku mulai API 26. Pada API 24 dan 25 atribut diabaikan tanpa error, sehingga teks tampil rata kiri.

Ganti isi `HomeFragment.kt` dengan kode berikut.

#src("java/com/example/mycourse/HomeFragment.kt")

Pola pada kelas ini dipakai di ketiga fragment:

- `_binding` menyimpan objek binding dan boleh bernilai `null`. Properti `binding` mengembalikan `_binding` tanpa tanda tanya untuk kemudahan pemakaian.
- `onCreateView` membuat binding dengan `FragmentHomeBinding.inflate(...)` dan mengembalikan `binding.root` sebagai tampilan fragment.
- `onDestroyView` mengisi `_binding` dengan `null`. Fragment dapat tetap hidup setelah tampilannya dihancurkan. Jika binding tidak dilepas, referensi ke view tetap tersimpan dan menyebabkan memory leak.

== MaterialFragment

Halaman Material menampilkan daftar materi. Layout-nya cukup sebuah `ListView`.

#src("res/layout/fragment_material.xml")

Ganti isi `MaterialFragment.kt` dengan kode berikut.

#src("java/com/example/mycourse/MaterialFragment.kt")

Di `onViewCreated`, `resources.getStringArray(R.array.material_list)` mengambil daftar dari `strings.xml`. `ArrayAdapter` menghubungkan daftar tersebut ke `ListView`. Layout baris `android.R.layout.simple_list_item_1` adalah layout bawaan Android berisi satu `TextView`, sehingga tidak perlu membuat layout baris sendiri.

== QuizFragment

Quiz belum dilaksanakan, jadi halaman ini menampilkan keterangan dan tombol *Start Quiz* yang dinonaktifkan. Di sinilah custom style `CustomRoundedButton` dipakai. Atribut `android:enabled="false"` membuat tombol memakai state nonaktif pada `rounded_button.xml` (abu-abu).

#src("res/layout/fragment_quiz.xml")

Ganti isi `QuizFragment.kt` dengan kode berikut.

#src("java/com/example/mycourse/QuizFragment.kt")

// ── SectionsPagerAdapter ────────────────────────────────────────────────────

= SectionsPagerAdapter

Selanjutnya buat kelas yang mengatur `ViewPager2`. Klik kanan package `com.example.mycourse` → *New* → *Kotlin Class/File*. Beri nama `SectionsPagerAdapter`, lalu tulis konstruktornya terlebih dahulu.

#code-figure(
  ```kotlin
  class SectionsPagerAdapter(activity: AppCompatActivity) : FragmentStateAdapter(activity) {

  }
  ```,
  lang: "kotlin",
  header: [SectionsPagerAdapter.kt],
)

Garis merah akan muncul. Arahkan kursor ke `SectionsPagerAdapter`, tekan *Alt+Enter* (macOS: *Option+Enter*), lalu pilih *Implement members*. Pilih kedua method (`getItemCount` dan `createFragment`) dan klik *OK*. Ubah isinya sehingga keseluruhan file menjadi seperti berikut.

#src("java/com/example/mycourse/SectionsPagerAdapter.kt")

`FragmentStateAdapter` adalah base adapter untuk `ViewPager2`. Kelas abstrak ini mewajibkan dua fungsi:

- `createFragment(position)` mengembalikan fragment sesuai posisi tab: 0 untuk `HomeFragment`, 1 untuk `MaterialFragment`, dan 2 untuk `QuizFragment`.
- `getItemCount()` menentukan jumlah tab. Nilainya harus sama dengan jumlah fragment pada `createFragment`. Jika jumlah tab lebih banyak dari fragment yang didefinisikan, tab tambahan menampilkan fragment yang salah (pada kode ini `QuizFragment` dari cabang `else`).

Konstruktor menerima `AppCompatActivity` karena adapter dipasang di activity. Jika adapter dipasang di dalam fragment, gunakan `Fragment` sebagai parameter.

// ── Layout utama dan TabLayout ──────────────────────────────────────────────

= Tab Layout

`TabLayout` menampilkan tab, dan `ViewPager2` menampilkan isi tab. Keduanya diletakkan di `activity_main.xml`. Ganti seluruh isinya dengan kode berikut.

#src("res/layout/activity_main.xml")

`TabLayout` diletakkan di bagian atas layar dengan jarak atas 16dp (`layout_marginTop`) agar tidak menempel pada ActionBar. `ViewPager2` memakai tinggi `0dp` dengan constraint ke bawah `TabLayout` dan ke bawah layar sehingga mengisi sisa layar.

Selanjutnya hubungkan `SectionsPagerAdapter`, `ViewPager2`, dan `TabLayout` di `MainActivity`. Ganti seluruh isi `MainActivity.kt` dengan kode berikut. Bagian menu ditambahkan pada langkah berikutnya.

#code-figure(
  ```kotlin
  package com.example.mycourse

  import android.os.Bundle
  import androidx.annotation.StringRes
  import androidx.appcompat.app.AppCompatActivity
  import com.example.mycourse.databinding.ActivityMainBinding
  import com.google.android.material.tabs.TabLayoutMediator

  class MainActivity : AppCompatActivity() {
      companion object {
          @StringRes
          private val TAB_TITLES = intArrayOf(
              R.string.tab_home_text,
              R.string.tab_material_text,
              R.string.tab_quiz_text
          )
      }

      private lateinit var binding: ActivityMainBinding

      override fun onCreate(savedInstanceState: Bundle?) {
          super.onCreate(savedInstanceState)
          binding = ActivityMainBinding.inflate(layoutInflater)
          setContentView(binding.root)

          binding.viewPager.adapter = SectionsPagerAdapter(this)
          TabLayoutMediator(binding.tabLayout, binding.viewPager) { tab, position ->
              tab.text = resources.getString(TAB_TITLES[position])
          }.attach()
          supportActionBar?.elevation = 0f
      }
  }
  ```,
  lang: "kotlin",
  header: [MainActivity.kt],
)

Penjelasan kode:

- `ActivityMainBinding.inflate(layoutInflater)` membuat binding, lalu `setContentView(binding.root)` menampilkannya. View diakses lewat `binding.viewPager` dan `binding.tabLayout` (dari id `view_pager` dan `tab_layout`).
- `viewPager.adapter = SectionsPagerAdapter(this)` memasang adapter sehingga `ViewPager2` menampilkan fragment sesuai posisinya.
- `TabLayoutMediator` menghubungkan `TabLayout` dan `ViewPager2`. Menggeser halaman mengubah tab terpilih, dan mengetuk tab memindahkan halaman. Judul setiap tab diambil dari `TAB_TITLES` sesuai posisi.
- `@StringRes` memberi tahu compiler bahwa isi array adalah id string resource.
- `supportActionBar?.elevation = 0f` menghilangkan bayangan ActionBar sehingga menyatu dengan tab.

Jalankan aplikasi. Tiga tab sudah dapat dibuka dan digeser.

// ── Options Menu ────────────────────────────────────────────────────────────

= Options Menu

Options Menu adalah menu yang ditampilkan di ActionBar. Menu ini dibuat dari file XML yang mendefinisikan item menu, lalu dua method di activity menampilkannya (`onCreateOptionsMenu`) dan menangani pilihan pengguna (`onOptionsItemSelected`).

Klik kanan folder `res` → *New* → *Android Resource File*. Isi *File name* dengan `menu_options` dan *Resource type* dengan *Menu*. Klik *OK*, lalu isi file dengan kode berikut.

#src("res/menu/menu_options.xml")

Penjelasan atribut:

- `android:id` — id unik item menu, dipakai untuk mengenali item di kode.
- `android:title` — teks item pada overflow menu.
- `android:icon` — ikon item. Ikon harus berada di folder `drawable`.
- `android:orderInCategory` — urutan item. Nilai lebih kecil tampil lebih awal.
- `app:showAsAction` — cara item ditampilkan di ActionBar. Nilai `ifRoom` menampilkan item sebagai ikon jika ruang cukup, sedangkan `never` memasukkan item ke overflow menu (titik tiga).

Kemudian tambahkan dua method menu pada `MainActivity`. Tambahkan juga import `android.view.Menu` dan `android.view.MenuItem`. Keseluruhan `MainActivity.kt` menjadi seperti berikut.

#src("java/com/example/mycourse/MainActivity.kt")

- `onCreateOptionsMenu(menu)` dipanggil saat activity dibuat. `menuInflater.inflate` mengubah `menu_options.xml` menjadi objek `Menu`. Nilai `true` menandakan menu siap ditampilkan.
- `onOptionsItemSelected(item)` dipanggil saat pengguna memilih item menu. Ekspresi `when` memeriksa `item.itemId`, lalu mengubah `binding.viewPager.currentItem` ke posisi tab yang sesuai (0 untuk Home, 1 untuk Material, 2 untuk Quiz). Nilai `true` menandakan aksi sudah ditangani. Untuk id lain, pemanggilan diteruskan ke `super.onOptionsItemSelected(item)` agar sistem menanganinya.

#pagebreak()

// ── Hasil ───────────────────────────────────────────────────────────────────

= Hasil

Jalankan aplikasi di emulator atau perangkat. Hasil setiap halaman adalah sebagai berikut.

#grid(
  columns: (1fr, 1fr),
  row-gutter: 1em,
  img(image("assets/home.png", height: 8cm), caption: [Tab Home]),
  img(image("assets/material.png", height: 8cm), caption: [Tab Material]),

  img(image("assets/quiz.png", height: 8cm), caption: [Tab Quiz]),
  img(image("assets/menu_options.png", height: 8cm), caption: [Options Menu]),
)

Untuk menguji, geser antar tab dan ketuk judul tab. Kemudian ketuk ikon rumah di ActionBar untuk kembali ke Home. Buka overflow menu (titik tiga) dan pilih *Material* atau *Quiz*. Tab akan berpindah sesuai pilihan.
