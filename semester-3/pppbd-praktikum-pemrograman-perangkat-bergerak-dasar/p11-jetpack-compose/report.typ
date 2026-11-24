#import "@atalariq/codelab:1.0.0": *

#let src(path, lang: "kotlin") = codeblock(
  read(path),
  file: path.split("/").last(),
  lang: lang,
  breakable: true,
)

#let group(title) = table.cell(
  colspan: 2,
  fill: luma(238),
  inset: (x: 6pt, y: 4pt),
)[#text(weight: "bold", size: 9pt)[#title]]

#let spec(..rows) = table(
  columns: (1.15fr, 2.85fr),
  stroke: none,
  inset: (x: 6pt, y: 4pt),
  align: (left, left),
  table.hline(stroke: 0.8pt),
  ..rows,
  table.hline(stroke: 0.8pt),
)

#let ink = rgb("#1f3a5f")
#let layer(title, sub) = block(
  width: 100%,
  inset: (x: 5pt, y: 5pt),
  radius: 3pt,
  fill: rgb("#eef3fb"),
  stroke: 0.6pt + ink,
  align(center)[
    #text(size: 9pt, weight: "bold", title)
    #linebreak()
    #text(size: 8pt, fill: luma(70), sub)
  ],
)
#let rarrow = align(center + horizon, text(size: 14pt, fill: ink)[→])
#let state-layers() = grid(
  columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr),
  align: horizon,
  layer("Composable", "membaca state"),
  rarrow,
  layer("State", "remember / collectAsState"),
  rarrow,
  layer("ViewModel", "logika dan StateFlow"),
  rarrow,
  layer("SharedPreferences", "penyimpanan permanen"),
)

#show: codelab.with(
  bib: bibliography("references.yaml", style: "ieee"),
  bib-title: [Daftar Pustaka],
)

#block(width: 100%)[
  #set par(justify: false)
  #text(size: 21pt, weight: "bold")[
    Jetpack Compose: Layout, State Management, ViewModel, dan SharedPreferences
  ]
]

#text(size: 13pt, fill: luma(90))[Aplikasi Counter dan Form Data Diri]

#v(4pt)

#spec(
  group("Aplikasi"),
  [Nama project], [MyComposeApp],
  [Package], [`com.example.mycomposeapp`],
  [Bahasa dan UI], [Kotlin dan Jetpack Compose, Material 3],
  group("Build"),
  [Minimum SDK], [API 24],
  [Compile / target SDK], [API 37 / API 37],
  [AGP / Gradle], [9.5.1 / 9.9.0],
  [JDK], [25],
  group("Library"),
  [Kotlin / Compose BOM], [2.4.21 / 2026.09.00],
  [Navigation / Lifecycle], [2.10.2 / 2.11.0],
  [Repository], [#link("https://github.com/atalariq/pppbd-p11")],
  [Commit], [`c7223a8`],
)

= Dasar Teori

== Jetpack Compose dan UI deklaratif

Jetpack Compose adalah toolkit antarmuka untuk Android yang menulis UI sebagai
fungsi Kotlin. Sebuah fungsi yang diberi anotasi `@Composable` mendeskripsikan
tampilan untuk satu keadaan data; ketika data berubah, Compose menjalankan
kembali fungsi yang membaca data tersebut. Model ini disebut UI deklaratif:
pengembang tidak mencari view lalu mengubah propertinya, tetapi menyatakan
bagaimana UI seharusnya terlihat untuk state saat ini @android_compose.

Pendekatan deklaratif mengubah cara berpikir tentang layar. Pada XML Views,
layout didefinisikan di `res/layout`, lalu kode Kotlin mencari view melalui
`findViewById` atau View Binding dan mengubah nilainya. Pada Compose, layout
dan perilaku berada dalam satu bahasa, sehingga sebuah komponen dapat dibaca
sebagai satu kesatuan: parameter masuk, state yang dibaca, dan aksi yang
dipanggil. Perubahan state menjadi satu-satunya jalur untuk memperbarui layar.

Compose tidak menghapus View. `ComposeView` menempatkan Compose di dalam
layout XML, sedangkan `AndroidView` menempatkan View lama di dalam Compose.
Interoperabilitas ini penting untuk aplikasi yang sudah besar dan tidak dapat
ditulis ulang sekaligus.

== Layout: Column, Row, dan Box

Tiga layout dasar menyusun hampir seluruh layar aplikasi ini. `Column`
menempatkan anak secara vertikal dari atas ke bawah; `Row` menempatkannya
secara horizontal dari kiri ke kanan; `Box` menumpuk anak pada area yang sama.
Kombinasi ketiganya cukup untuk membangun layar counter tanpa XML.

Ukuran diatur melalui `Modifier`. `fillMaxSize()` membuat komponen memenuhi
ruang yang tersedia, `fillMaxWidth()` memenuhi lebar parent, `weight(1f)`
membagi sisa ruang di dalam `Row` atau `Column`, dan `padding()` memberi jarak
di dalam batas komponen. `Arrangement.spacedBy(8.dp)` memberi jarak tetap
antaranak, sehingga tidak perlu `Spacer` di antara setiap tombol.

Satuan `dp` dipakai untuk ukuran layout karena tidak bergantung pada kepadatan
layar, sedangkan `sp` dipakai untuk ukuran teks karena mengikuti preferensi
ukuran font pengguna. Pada layar counter, angka besar memakai `120.sp`,
sedangkan tombol dan label memakai ukuran default Material 3.

== State dan recomposition

State adalah data yang dapat berubah dan memengaruhi tampilan. Pada Compose,
state dibaca di dalam composable; ketika nilainya berubah, Compose menandai
composable yang membacanya untuk dijalankan ulang. Proses ini disebut
recomposition. Recompose bukan membuat ulang seluruh layar, tetapi hanya
bagian yang membaca state tersebut @android_state.

`mutableStateOf` membuat state yang dapat diamati, sedangkan `remember`
menyimpannya agar tidak dibuat ulang pada setiap recomposition. Untuk nilai
primitif, `mutableIntStateOf` menghindari boxing. `remember` bertahan selama
composable berada di composition, tetapi hilang ketika Activity dibuat ulang,
misalnya saat layar diputar.

`rememberSaveable` menyimpan nilai ke saved instance state, sehingga nilai
bertahan setelah rotasi. Mekanisme ini cocok untuk input form dan pilihan tab,
tetapi tidak menyimpan data setelah aplikasi ditutup dan tidak memisahkan
logika dari UI.

== State hoisting, ViewModel, dan StateFlow

State hoisting memindahkan state ke pemanggil composable. Composable anak
menerima nilai dan callback, sehingga menjadi stateless dan mudah diuji.
Pemanggil menyimpan state dan menangani perubahan. Pola ini terlihat pada
`CounterScreen`: layar hanya menerima `counter` dan callback, sedangkan
`CounterApp` menghubungkannya dengan `CounterViewModel`.

`ViewModel` menyimpan state dan logika yang bertahan melewati perubahan
konfigurasi. ViewModel tidak menyimpan referensi ke Activity atau View,
sehingga tidak bocor saat layar dibuat ulang @android_viewmodel. Pada Compose,
`viewModel()` mengambil instance yang sama selama pemiliknya hidup.

`StateFlow` adalah aliran state yang selalu memiliki nilai terakhir. ViewModel
menyimpan `MutableStateFlow` secara privat dan membuka `StateFlow` read-only;
UI mengumpulkannya dengan `collectAsState()`. Setiap perubahan nilai memicu
recomposition pada composable yang membaca state tersebut @kotlin_flow.
Dibandingkan `State`, `StateFlow` lebih cocok untuk state yang terdiri atas
beberapa field, karena satu objek data dapat diperbarui dengan `copy()`.

#result(
  state-layers(),
  caption: [Lapisan state pada aplikasi: composable membaca state, ViewModel mengelola logika, SharedPreferences menyimpan data.],
)

== SharedPreferences

SharedPreferences menyimpan pasangan key-value ke file XML di internal
storage aplikasi. Penyimpanan ini cocok untuk data kecil seperti pengaturan,
nilai counter, atau data diri sederhana; data besar dan terstruktur sebaiknya
memakai Room @android_sharedprefs. Penulisan dilakukan melalui `edit { ... }`
yang menjalankan perubahan secara atomik.

Pada aplikasi ini, `CounterViewModel` menyimpan nilai counter ke
`counter_prefs.xml`, sedangkan `MyDataViewModel` menyimpan nama dan umur ke
`my_data_prefs.xml`. Keduanya membaca nilai awal saat ViewModel dibuat, lalu
menulis setiap perubahan. Dengan cara ini nilai bertahan setelah rotasi dan
setelah aplikasi ditutup.

SharedPreferences bukan pengganti ViewModel. ViewModel mengatur kapan data
berubah dan bagaimana UI bereaksi; SharedPreferences hanya menyimpan hasil
akhir. Pemisahan ini menjaga composable tetap sederhana dan logika penyimpanan
tetap di satu tempat.

== Navigation Compose

Navigation Compose menyediakan `NavHost`, `composable`, dan `NavController`
untuk berpindah antar-layar tanpa Fragment. Setiap tujuan memiliki route
berupa string; `navigate()` menambah tujuan ke back stack, dan
`popBackStack()` kembali ke tujuan sebelumnya @android_navigation.

Pada aplikasi ini, `counter_screen` adalah tujuan awal. Tombol ABOUT ME
memanggil `navigate("my_data_screen")`, sedangkan tombol BACK memanggil
`popBackStack()`. Karena setiap layar adalah composable, state layar tetap
dikelola ViewModel masing-masing dan tidak bergantung pada Fragment manager.

== Material 3 dan struktur aplikasi

Material 3 menyediakan komponen seperti `Button`, `OutlinedTextField`, `Card`,
dan `Scaffold`, serta skema warna yang konsisten @material3. Aplikasi ini
memakai `MaterialTheme.colorScheme.primaryContainer` untuk kartu ringkasan dan
warna eksplisit untuk tombol operasi counter agar perannya mudah dibedakan.

Struktur akhir aplikasi memisahkan empat lapisan: `MainActivity` sebagai
entry point, `AppNavigation` sebagai pengatur rute, layar Compose sebagai UI,
dan ViewModel sebagai pengelola state. SharedPreferences berada di balik
ViewModel, sehingga UI tidak perlu mengetahui detail penyimpanan.

= Langkah Praktikum

== 1. Menyiapkan project dan dependensi

Buat project *Empty Activity* dengan nama `MyComposeApp`, package
`com.example.mycomposeapp`, bahasa Kotlin, dan minimum SDK API 24. Template
menyediakan Compose dan Material 3; tambahkan ViewModel Compose dan Navigation
Compose melalui version catalog.

#codeblock(
  breakable: true,
  ```kotlin
  dependencies {
      implementation(platform(libs.androidx.compose.bom))
      implementation(libs.androidx.activity.compose)
      implementation(libs.androidx.compose.material3)
      implementation(libs.androidx.compose.ui)
      implementation(libs.androidx.compose.ui.tooling.preview)
      implementation(libs.androidx.lifecycle.runtime.ktx)
      implementation(libs.androidx.lifecycle.viewmodel.compose)
      implementation(libs.androidx.navigation.compose)
  }
  ```,
  file: "build.gradle.kts",
)

Versi library berada di `gradle/libs.versions.toml`: AGP 9.5.1, Gradle 9.9.0,
Kotlin 2.4.21, Compose BOM 2026.09.00, Navigation 2.10.2, dan Lifecycle 2.11.0.
Compose BOM menentukan versi `ui`, `material3`, dan `tooling-preview` sekaligus,
sehingga ketiganya tidak perlu versi sendiri.

#check[Gradle Sync selesai tanpa kesalahan dependency.]

== 2. Menyusun layout counter

`CounterScreen` menerima nilai counter dan empat callback. `Column` menyusun
judul, area angka, dan tombol; `weight(1f)` memberi area angka seluruh sisa
tinggi layar. Layar ini tidak menyimpan state sendiri, sehingga dapat
ditampilkan di preview dengan nilai apa pun.

#src("snippets/CounterScreen.kt")

`CounterDisplay` memakai `Box` dengan `contentAlignment = Alignment.Center`.
Label “Nilai Counter” ditempatkan di `TopCenter`, sedangkan angka besar berada
di tengah. Latar abu-abu dan sudut membulat dibuat dengan `Modifier.background`.

`CounterButtons` memakai `Row` untuk KURANG dan TAMBAH, lalu `Column` untuk
RESET dan ABOUT ME. Tombol ABOUT ME berwarna ungu agar berbeda dari tombol
operasi counter, dan ikonnya berasal dari `res/drawable/ic_person.xml`.

#check[Layar menampilkan “Counter App”, “Nilai Counter”, angka 0, serta tombol KURANG, TAMBAH, RESET, dan ABOUT ME.]

== 3. Mengelola state counter

State counter disimpan di `CounterApp` melalui ViewModel. Composable membaca
`counter` dan meneruskan event klik; setiap event mengubah state, lalu Compose
menjalankan ulang bagian yang membaca nilai tersebut. Pola ini menjaga
`CounterScreen` tetap stateless dan memudahkan pengujian.

#codeblock(
  breakable: true,
  ```kotlin
  @Composable
  fun CounterApp(
      modifier: Modifier = Modifier,
      onNavigateToMyData: () -> Unit,
      viewModel: CounterViewModel = viewModel()
  ) {
      val counter by viewModel.counter

      CounterScreen(
          counter = counter,
          onIncrement = { viewModel.increment() },
          onDecrement = { viewModel.decrement() },
          onReset = { viewModel.reset() },
          onNavigateToMyData = onNavigateToMyData,
          modifier = modifier
      )
  }
  ```,
  file: "CounterScreen.kt",
)

#check[Angka berubah saat tombol diklik. Setelah rotasi, nilai tetap karena state berada di ViewModel.]

== 4. Memindahkan state ke ViewModel dan SharedPreferences

`CounterViewModel` adalah `AndroidViewModel` karena membutuhkan `Application`
untuk membuka SharedPreferences. Nilai awal dibaca dari `counter_prefs.xml`;
setiap perubahan ditulis kembali melalui `prefs.edit`.

#src("snippets/CounterViewModel.kt")

Setelah aplikasi dijalankan, file `counter_prefs.xml` di
`/data/data/com.example.mycomposeapp/shared_prefs/` berisi pasangan
`counter_value`. Nilai ini dibaca kembali saat ViewModel dibuat, sehingga
counter tetap sama setelah rotasi dan setelah aplikasi ditutup.

#check[Counter bertambah dan berkurang. Setelah rotasi dan setelah aplikasi ditutup lalu dibuka kembali, nilai terakhir tetap tampil.]

== 5. Menambahkan navigasi dan tombol ABOUT ME

`MainActivity` memanggil `setContent { AppNavigation() }`. `AppNavigation`
mendaftarkan dua tujuan: `counter_screen` dan `my_data_screen`. Tombol ABOUT ME
memanggil `navigate("my_data_screen")`, sedangkan tombol BACK di layar data
memanggil `popBackStack()`.

#src("snippets/MainActivity.kt")

#result(
  image("assets/Screenshot_20261117_161538.png", width: 36%),
  caption: [Layar counter dengan tombol ABOUT ME. Tangkapan layar dari aplikasi yang dijalankan pada emulator.],
)

#check[Tombol ABOUT ME tampil di bawah RESET. Klik membuka form data diri; tombol BACK kembali ke counter.]

== 6. Membuat MyDataScreen dan menyimpan data diri

`MyDataViewModel` menyimpan nama dan umur dalam `MyData`. `MutableStateFlow`
menampung state, `StateFlow` membuka versi read-only, dan `copy()` membuat
salinan dengan satu field yang berubah. Setiap perubahan juga ditulis ke
`my_data_prefs.xml`, sehingga data diri bertahan setelah aplikasi ditutup.

#src("snippets/MyDataViewModel.kt")

`MyDataScreen` stateless: ia menerima `uiState` dan callback, lalu menampilkan
dua `OutlinedTextField` dan satu `Card` ringkasan. `MyDataApp` menjadi pembungkus
yang mengambil ViewModel dan meneruskan aksi.

#src("snippets/MyDataScreen.kt")

Ringkasan di bawah form dibentuk dari state yang sama:

#codeblock(
  breakable: true,
  ```kotlin
  Text(
      text = "Nama saya ${uiState.name} dan umur saya ${uiState.age}, Salam kenal!",
      modifier = Modifier.padding(16.dp),
      style = MaterialTheme.typography.bodyLarge
  )
  ```,
  file: "MyDataScreen.kt",
)

#result(
  image("assets/Screenshot_20261117_161611.png", width: 36%),
  caption: [Form data diri dengan ringkasan nama dan umur. Tangkapan layar dari aplikasi yang dijalankan pada emulator.],
)

#check[Form nama dan umur tampil. Ringkasan berubah saat input diisi, dan nilainya tetap setelah rotasi serta setelah aplikasi dibuka kembali.]

== 7. Menguji perilaku state dan navigasi

Jalankan aplikasi di emulator. Naikkan counter, putar layar, lalu tutup
aplikasi dari Recents dan buka kembali. Empat teknik state memiliki daya tahan
yang berbeda:

#tbl(
  caption: [Daya tahan state pada empat teknik penyimpanan.],
  columns: (1.2fr, 1fr, 1.2fr, 1fr, 1.4fr),
  header: ([Aspek], [remember], [rememberSaveable], [ViewModel], [SharedPreferences]),
  [Recomposition], [Ya], [Ya], [Ya], [Ya],
  [Rotasi layar], [Tidak], [Ya], [Ya], [Ya],
  [Aplikasi ditutup], [Tidak], [Tidak], [Tidak], [Ya],
  [Lokasi data], [Composition], [Bundle], [ViewModelStore], [XML internal],
  align: (left, center, center, center, left),
  size: 8.5pt,
)

`remember` cocok untuk state UI sementara, `rememberSaveable` untuk input form
dan pilihan tab, `ViewModel` untuk state layar dan logika bisnis, dan
`SharedPreferences` untuk data kecil yang harus bertahan setelah aplikasi
ditutup. Pada aplikasi ini, ViewModel mengelola counter dan data diri selama
aplikasi berjalan, sedangkan SharedPreferences menyimpan nilainya secara
permanen.

#check[Counter tetap setelah rotasi dan setelah aplikasi dibuka kembali. Data diri juga tetap, dan tombol BACK mengembalikan pengguna ke counter.]

= Ringkasan

== Arsitektur akhir

Aplikasi terdiri atas dua layar dan dua ViewModel. `CounterViewModel`
mengelola nilai counter, `MyDataViewModel` mengelola nama dan umur, dan
`AppNavigation` menghubungkan keduanya. Setiap layar Compose bersifat stateless
dan menerima state serta callback dari pembungkusnya.

Pemisahan ini membuat alur data satu arah: event dari UI masuk ke ViewModel,
ViewModel mengubah state dan menyimpannya, lalu UI membaca state baru dan
melakukan recomposition. Tidak ada komponen yang mengubah UI secara langsung.

== XML Views dan Jetpack Compose

XML dan Compose membangun layar dengan cara berbeda. XML memisahkan layout di
file `res/layout` dan menghubungkannya ke Kotlin melalui View Binding; Compose
menulis layout sebagai fungsi Kotlin yang diberi anotasi `@Composable`.

#tbl(
  caption: [Perbandingan XML Views dan Jetpack Compose.],
  columns: (1.1fr, 2.1fr, 2.1fr),
  header: ([Topik], [XML Views], [Jetpack Compose]),
  [Bahasa], [XML + Kotlin/Java], [Kotlin],
  [Gaya], [Imperative], [Declarative],
  [Update UI], [Cari view, set nilai], [Ubah state, UI otomatis],
  [Daftar], [RecyclerView + Adapter], [LazyColumn],
  [Preview], [Layout Editor], [Fungsi \@Preview],
  [Satu layar], [XML + Activity], [Satu file Kotlin],
  align: (left, left, left),
  size: 9pt,
)

Keduanya dapat dipakai bersama: `ComposeView` menempatkan Compose di dalam XML,
sedangkan `AndroidView` menempatkan View lama di dalam Compose. Untuk aplikasi
baru, Compose lebih nyaman karena UI dan state berada dalam satu bahasa,
preview berjalan tanpa emulator, dan Google menjadikannya toolkit yang
direkomendasikan. XML tetap relevan untuk aplikasi lama, komponen View yang
sudah ada, dan tim yang belum bermigrasi. Pada aplikasi ini, Compose membuat
alur state lebih mudah dibaca karena layar, state, dan aksi berada berdekatan.

= Lampiran

== Lingkungan dan perintah build

#codeblock(
  breakable: true,
  ```bash
  git clone https://github.com/atalariq/pppbd-p11.git
  cd pppbd-p11
  git checkout c7223a8
  ./gradlew :app:assembleDebug
  adb install -r app/build/outputs/apk/debug/app-debug.apk
  ```,
  file: "terminal",
)

Kode acuan pada commit `c7223a8` @repo_p11. Versi yang dipakai: JDK 25, Gradle 9.9.0, AGP 9.5.1, Kotlin 2.4.21, Compose BOM
2026.09.00, Navigation 2.10.2, dan Lifecycle 2.11.0. Proyek dapat dibuka di
Android Studio dan dijalankan pada emulator API 24 atau lebih.

== Catatan verifikasi

Aplikasi dijalankan pada emulator; dua tangkapan layar pada laporan berasal
dari aplikasi tersebut. Perilaku yang diperiksa: counter berubah saat tombol
diklik, nilai bertahan setelah rotasi dan setelah aplikasi dibuka kembali, form
data diri menampilkan ringkasan yang mengikuti input, dan tombol BACK kembali
ke layar counter. Build dari command line mengikuti perintah di atas; jika
Gradle Sync gagal, periksa JDK 25 dan versi library di
`gradle/libs.versions.toml`.
