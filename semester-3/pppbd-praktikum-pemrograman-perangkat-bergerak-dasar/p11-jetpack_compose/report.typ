#import "@atalariq/codelab:1.0.0": *

#let src(path, lang: "kotlin") = codeblock(
  read(path),
  file: path.split("/").last(),
  lang: lang,
  breakable: true,
)

#show: codelab.with(
  footer-center: context align(
    right,
    text(size: 9pt, fill: luma(100))[Counter Compose · #counter(page).display("1 / 1", both: true)],
  ),
  bib: bibliography("references.yaml", style: "ieee"),
  bib-title: [Daftar Pustaka],
)

#text(size: 24pt, weight: "bold")[Jetpack Compose: Layout, State, dan Data Diri]

#text(size: 16pt, fill: luma(100))[Codelab: Counter Compose]

#metadata(
  [Nama project], [MyComposeApp / pppbd-p11],
  [Bahasa dan antarmuka], [Kotlin dan Jetpack Compose],
  [Minimum SDK], [API 24],
  [Compile / target SDK], [API 37 / API 37],
  [Android Gradle Plugin / Gradle], [9.5.1 / 9.6.0],
  [Kotlin / Compose BOM], [2.4.21 / 2026.09.00],
  [Repository], [#link("https://github.com/atalariq/pppbd-p11")],
)

= Sebelum mulai

Codelab ini membangun aplikasi counter dengan Jetpack Compose, lalu menambahkan
layar data diri. Counter memiliki tombol KURANG, TAMBAH, RESET, dan ABOUT ME.
Tombol ABOUT ME membuka `MyDataScreen`; di sana pengguna mengisi nama dan umur,
dan ringkasan muncul di bawah form. Nilai counter disimpan di `ViewModel` dan
`SharedPreferences`, sehingga bertahan saat rotasi dan saat aplikasi dibuka
kembali.

Titik awal adalah project `MyComposeApp` dari template Empty Activity. Project
memakai Kotlin, Compose BOM 2026.09.00, Navigation Compose 2.10.2, dan Lifecycle
2.11.0. Modul P11 menjadi acuan langkah; repository `pppbd-p11` menjadi acuan
kode akhir pada commit `6b7be3b`. @module_p11 @repo_p11

Siapkan Android Studio, JDK 25, Gradle 9.6.0, dan emulator API 24 atau lebih.
Koneksi internet dibutuhkan untuk sinkronisasi Gradle pertama.

= 1. Menyiapkan project dan dependensi

Di Android Studio, pilih *New Project → Empty Activity*. Isi nama
`MyComposeApp`, package `com.example.mycomposeapp`, bahasa Kotlin, dan minimum
SDK API 24. Gunakan Kotlin DSL untuk konfigurasi build. Template ini sudah
menyiapkan Compose dan Material 3.

Tambahkan dependency ViewModel Compose dan Navigation Compose. Compose BOM
menentukan versi library Compose sekaligus, sehingga `ui`, `material3`, dan
`tooling-preview` tidak perlu versi sendiri.

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

Versi library berada di `gradle/libs.versions.toml`: AGP 9.5.1, Gradle 9.6.0,
Kotlin 2.4.21, Compose BOM 2026.09.00, Navigation 2.10.2, dan Lifecycle 2.11.0.
Jika Android Studio memakai versi template yang berbeda, samakan dengan
repository sebelum melanjutkan.

#check[Gradle Sync selesai tanpa kesalahan dependency.]

#result(
  image("assets/module-p5-0-Im3.png", width: 60%),
  caption: [Template Empty Activity pada Android Studio. Contoh dari modul, hlm. 5.],
)



= 2. Menyusun layout counter

`CounterScreen` memakai tiga layout dasar Compose. `Column` menyusun judul,
area angka, dan tombol dari atas ke bawah; `Box` menumpuk label dan angka di
area yang sama; `Row` menempatkan tombol KURANG dan TAMBAH berdampingan.

Buka `CounterScreen.kt` dan tulis `CounterScreen` seperti potongan berikut.
`weight(1f)` memberi area angka seluruh sisa tinggi layar, sedangkan
`fillMaxWidth()` membuat area itu memenuhi lebar parent.

#codeblock(
  breakable: true,
  ```kotlin
  @Composable
  fun CounterScreen(
      counter: Int,
      onIncrement: () -> Unit,
      onDecrement: () -> Unit,
      onReset: () -> Unit,
      onNavigate: () -> Unit,
      modifier: Modifier = Modifier
  ) {
      Column(
          modifier = modifier.fillMaxSize().padding(16.dp),
          horizontalAlignment = Alignment.CenterHorizontally
      ) {
          Text("Counter App", fontSize = 24.sp, fontWeight = FontWeight.Bold)
          Spacer(Modifier.height(16.dp))
          CounterDisplay(
              value = counter,
              modifier = Modifier.fillMaxWidth().weight(1f)
          )
          Spacer(Modifier.height(16.dp))
          CounterButtons(
              onDecrement = onDecrement,
              onIncrement = onIncrement,
              onReset = onReset,
              onNavigate = onNavigate
          )
      }
  }
  ```,
  file: "CounterScreen.kt",
)

`CounterDisplay` memakai `Box` dengan `contentAlignment = Alignment.Center`.
Label “Nilai Counter” ditempatkan di `TopCenter`, sedangkan angka besar berada
di tengah. Latar abu-abu dan sudut membulat dibuat dengan `Modifier.background`.

#codeblock(
  breakable: true,
  ```kotlin
  @Composable
  fun CounterDisplay(value: Int, modifier: Modifier = Modifier) {
      Box(
          modifier = modifier.background(
              color = Color(0xFFF5F5F5),
              shape = RoundedCornerShape(16.dp)
          ),
          contentAlignment = Alignment.Center
      ) {
          Text(
              "Nilai Counter",
              fontSize = 14.sp,
              color = Color.Gray,
              modifier = Modifier.align(Alignment.TopCenter).padding(top = 16.dp)
          )
          Text(value.toString(), fontSize = 120.sp, fontWeight = FontWeight.Bold)
      }
  }
  ```,
  file: "CounterScreen.kt",
)

`CounterButtons` memakai `Row` untuk KURANG dan TAMBAH, lalu `Column` untuk
RESET dan ABOUT ME. `Arrangement.spacedBy(8.dp)` memberi jarak antartombol;
`Modifier.weight(1f)` membagi lebar KURANG dan TAMBAH sama besar.

#codeblock(
  breakable: true,
  ```kotlin
  Row(
      modifier = Modifier.fillMaxWidth(),
      horizontalArrangement = Arrangement.spacedBy(8.dp)
  ) {
      Button(
          onClick = onDecrement,
          modifier = Modifier.weight(1f),
          colors = ButtonDefaults.buttonColors(containerColor = Color(0xFFF44336))
      ) { Text("KURANG") }
      Button(
          onClick = onIncrement,
          modifier = Modifier.weight(1f),
          colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF4CAF50))
      ) { Text("TAMBAH") }
  }
  ```,
  file: "CounterScreen.kt",
)

#result(
  image("assets/module-p2-0-Im1.png", width: 70%),
  caption: [Column, Row, dan Box. Contoh dari modul, hlm. 2.],
)

#result(
  image("assets/module-p10-0-Im5.png", width: 75%),
  caption: [Pemetaan Column, Box, dan Row pada layar counter. Contoh dari modul, hlm. 10.],
)

#check[Layar menampilkan “Counter App”, “Nilai Counter”, angka 0, tombol KURANG, TAMBAH, dan RESET.]

= 3. Mengelola state counter

Angka counter harus berubah saat tombol diklik. Compose membaca state dan
menjalankan ulang composable yang memakainya; proses ini disebut
recomposition. `mutableIntStateOf` menyimpan nilai `Int`, sedangkan `remember`
menjaga state agar tidak dibuat ulang pada setiap recomposition.

#result(
  image("assets/module-p4-0-Im2.png", width: 70%),
  caption: [Siklus event, state, dan recomposition. Contoh dari modul, hlm. 4.],
)

#codeblock(
  breakable: true,
  ```kotlin
  var counter by remember { mutableIntStateOf(0) }

  CounterScreen(
      counter = counter,
      onIncrement = { counter++ },
      onDecrement = { counter-- },
      onReset = { counter = 0 },
      onNavigate = {}
  )
  ```,
  file: "CounterScreen.kt",
)

`remember` bertahan saat recomposition, tetapi hilang ketika Activity dibuat
ulang karena rotasi. `rememberSaveable` menyimpan nilai ke saved instance
state, sehingga angka tetap ada setelah rotasi.

#codeblock(
  breakable: true,
  ```kotlin
  var counter by rememberSaveable { mutableIntStateOf(0) }
  ```,
  file: "CounterScreen.kt",
)

#check[Angka berubah saat tombol diklik. Setelah rotasi, nilai tetap dengan `rememberSaveable`; dengan `remember` nilai kembali 0.]

= 4. Memindahkan state ke ViewModel dan SharedPreferences

`rememberSaveable` menyelesaikan rotasi, tetapi belum menyimpan nilai saat
aplikasi ditutup dan masih mencampur logika counter dengan UI. `ViewModel`
memisahkan state dan logika dari composable, sedangkan `SharedPreferences`
menyimpan nilai ke file XML di internal storage.

`CounterViewModel` membaca nilai awal dari SharedPreferences, menyimpan state
sebagai `State<Int>`, dan menulis setiap perubahan lewat `prefs.edit`. UI hanya
membaca `counter` dan meneruskan event klik.

#src("snippets/CounterViewModel.kt")

`CounterApp` mengambil ViewModel dengan `viewModel()`, membaca state, dan
meneruskan event ke `CounterScreen`. Karena `CounterScreen` tidak lagi memiliki
state sendiri, preview dapat mengisi nilai apa pun tanpa ViewModel. Pola ini
disebut state hoisting.

#codeblock(
  breakable: true,
  ```kotlin
  @Composable
  fun CounterApp(
      modifier: Modifier = Modifier,
      onNavigate: () -> Unit,
      viewModel: CounterViewModel = viewModel()
  ) {
      val counter by viewModel.counter

      CounterScreen(
          counter = counter,
          onIncrement = { viewModel.increment() },
          onDecrement = { viewModel.decrement() },
          onReset = { viewModel.reset() },
          onNavigate = onNavigate,
          modifier = modifier
      )
  }
  ```,
  file: "CounterScreen.kt",
)

#result(
  image("assets/module-p13-0-Im9.png", width: 80%),
  caption: [UI, ViewModel, dan SharedPreferences. Contoh dari modul, hlm. 13.],
)

Setelah aplikasi dijalankan, file `counter_prefs.xml` di
`/data/data/com.example.mycomposeapp/shared_prefs/` berisi pasangan
`counter_value`. Nilai ini dibaca kembali saat ViewModel dibuat.

#codeblock(
  breakable: true,
  ```xml
  <?xml version='1.0' encoding='utf-8' standalone='yes' ?>
  <map>
      <int name="counter_value" value="7" />
  </map>
  ```,
  file: "counter_prefs.xml",
)

#check[Counter bertambah dan berkurang. Setelah rotasi dan setelah aplikasi ditutup lalu dibuka kembali, nilai terakhir tetap tampil.]

= 5. Menambahkan tombol ABOUT ME dan navigasi

Tombol ABOUT ME berada di bawah RESET. Tombol ini memanggil `onNavigate`, yang
diteruskan dari `CounterApp` ke `CounterButtons`. Navigasi memakai Navigation
Compose: `rememberNavController` membuat controller, `NavHost` mendaftarkan
dua tujuan, dan `composable` menghubungkan route dengan layar.

`MainActivity` hanya memanggil `setContent { AppNavigation() }`; seluruh
konfigurasi navigasi berada di `AppNavigation`.

#codeblock(
  breakable: true,
  ```kotlin
  @Composable
  fun AppNavigation() {
      val navController = rememberNavController()

      NavHost(navController = navController, startDestination = "counter_screen") {
          composable("counter_screen") {
              CounterApp(onNavigate = {
                  navController.navigate("data_diri_screen")
              })
          }
          composable("data_diri_screen") {
              MyDataScreen()
          }
      }
  }
  ```,
  file: "MainActivity.kt",
)

Tombol ABOUT ME memakai ikon `ic_person` dan warna abu-abu agar berbeda dari
tombol operasi counter. Ikon dibuat melalui *Vector Asset* dan disimpan di
`res/drawable/ic_person.xml`.

#codeblock(
  breakable: true,
  ```kotlin
  Button(
      onClick = onNavigate,
      modifier = Modifier.fillMaxWidth(),
      colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF9A9A9A))
  ) {
      Icon(
          painter = painterResource(R.drawable.ic_person),
          contentDescription = null,
          modifier = Modifier.size(ButtonDefaults.IconSize)
      )
      Spacer(Modifier.width(ButtonDefaults.IconSpacing))
      Text("ABOUT ME")
  }
  ```,
  file: "CounterScreen.kt",
)

#check[Tombol ABOUT ME tampil di bawah RESET. Klik membuka `MyDataScreen`; tombol Back kembali ke counter.]

= 6. Membuat MyDataScreen

`MyDataViewModel` menyimpan nama dan umur dalam `MyData`. `MutableStateFlow`
menampung state, `StateFlow` membuka versi read-only, dan `copy()` membuat
salinan dengan satu field yang berubah. `MyDataScreen` mengumpulkan state
dengan `collectAsState`, sehingga setiap perubahan langsung memperbarui form
dan ringkasan.

#src("snippets/MyDataViewModel.kt")

`MyDataScreen` mengambil ViewModel yang sama, mengumpulkan state dengan
`collectAsState`, lalu menyusun form di dalam `Column`. `Arrangement.spacedBy`
memberi jarak 16 dp antarelemen, sehingga tidak perlu `Spacer` di antara setiap
komponen.

#codeblock(
  breakable: true,
  ```kotlin
  @Composable
  fun MyDataScreen(
      viewModel: MyDataViewModel = viewModel()
  ) {
      val uiState by viewModel.uiState.collectAsState()

      Column(
          modifier = Modifier
              .fillMaxSize()
              .padding(24.dp),
          horizontalAlignment = Alignment.CenterHorizontally,
          verticalArrangement = Arrangement.spacedBy(16.dp)
      ) {
          Text(
              text = "Form Data Diri",
              style = MaterialTheme.typography.headlineMedium
          )
  ```,
  file: "MyDataScreen.kt",
)

Dua `OutlinedTextField` membaca `uiState` dan memanggil `onNameChange` atau
`onAgeChange` pada setiap ketikan. Field umur memakai `KeyboardType.Number`
agar emulator menampilkan keyboard angka. `Card` di bawah form menampilkan
ringkasan yang dibentuk dari state yang sama, sehingga teksnya berubah tanpa
logika tambahan.

#codeblock(
  breakable: true,
  ```kotlin
  OutlinedTextField(
      value = uiState.name,
      onValueChange = { viewModel.onNameChange(it) },
      label = { Text("Masukkan Nama") },
      modifier = Modifier.fillMaxWidth(),
      singleLine = true
  )

  OutlinedTextField(
      value = uiState.age,
      onValueChange = { viewModel.onAgeChange(it) },
      label = { Text("Masukkan Umur") },
      keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
      modifier = Modifier.fillMaxWidth(),
      singleLine = true
  )

  Card(
      modifier = Modifier.fillMaxWidth(),
      colors = CardDefaults.cardColors(
          containerColor = MaterialTheme.colorScheme.primaryContainer
      )
  ) {
      Text(
          text = "Nama saya \"${uiState.name}\" dan umur saya \"${uiState.age}\", Salam kenal!",
          modifier = Modifier.padding(16.dp),
          style = MaterialTheme.typography.bodyLarge
      )
  }
  ```,
  file: "MyDataScreen.kt",
)

`viewModel()` mengembalikan instance yang sama selama Activity hidup, sehingga
rotasi tidak menghapus nama dan umur.

#result(
  rect(width: 7cm, height: 10cm, fill: luma(240))[
    #align(center + horizon)[Screenshot `MyDataScreen`]
  ],
  caption: [Placeholder screenshot `MyDataScreen`. Ganti dengan tangkapan layar yang menampilkan nama dan umur Anda.],
)

#check[Form nama dan umur tampil. Ringkasan berubah saat input diisi, dan nilainya tetap setelah rotasi.]

= 7. Menguji dan mendokumentasikan hasil

Jalankan aplikasi di emulator. Naikkan counter, putar layar, lalu tutup aplikasi
dari Recents dan buka kembali. Empat teknik state memiliki daya tahan yang
berbeda:

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
`SharedPreferences` untuk pengaturan atau data kecil yang harus bertahan
setelah aplikasi ditutup. Pada aplikasi ini, `ViewModel` mengelola counter
selama aplikasi berjalan dan `SharedPreferences` menyimpan nilainya secara
permanen.

#check[Counter tetap 7 setelah rotasi dan setelah aplikasi dibuka kembali. Screenshot `MyDataScreen` menampilkan nama dan umur yang diisi.]

= 8. XML dan Jetpack Compose

XML dan Compose membangun layar dengan cara berbeda. XML memisahkan layout di
file `res/layout` dan menghubungkannya ke Kotlin melalui View Binding;
Compose menulis layout sebagai fungsi Kotlin yang diberi anotasi
`@Composable`. XML bersifat imperative: kode mencari view lalu mengubah
nilainya. Compose bersifat declarative: kode mengubah state, lalu Compose
menjalankan ulang UI yang membaca state tersebut. @android_compose @slides_p11

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
sudah ada, dan tim yang belum bermigrasi. Preferensi saya adalah Compose,
karena alur state pada aplikasi ini lebih mudah dibaca dan diuji.

= Ringkasan penugasan

#tbl(
  caption: [Pemenuhan item penugasan P11.],
  columns: (1.5fr, 1.2fr, 2.4fr),
  header: ([Item], [Langkah], [Bukti]),
  [Tombol ABOUT ME], [5], [Kode navigasi dan tombol],
  [`MyDataScreen`], [6], [`MyDataScreen.kt`],
  [Form nama dan umur], [6], [`OutlinedTextField`],
  [Ringkasan nama dan umur], [6], [String ringkasan],
  [State atau ViewModel], [6], [`MyDataViewModel`],
  [Screenshot `MyDataScreen`], [7], [Gambar 6 atau tangkapan layar sendiri],
  [XML vs Compose], [8], [Tabel dan paragraf],
  [Repository], [Metadata], [#link("https://github.com/atalariq/pppbd-p11")],
  align: (left, center, left),
  size: 9pt,
)

= Batas hasil praktikum

Gradle dan emulator tidak dijalankan di sandbox sesi ini; karena itu, build,
lint, dan tangkapan layar `MyDataScreen` belum diverifikasi dari perangkat.
Gambar 1–5 berasal dari modul dan diberi nomor halaman; Gambar 6 adalah
placeholder yang harus diganti dengan tangkapan layar hasil menjalankan
aplikasi. Versi AGP, Gradle, Kotlin, Compose BOM, Navigation, dan Lifecycle
diambil dari repository pada commit `6b7be3b`. Jika Gradle Sync gagal, periksa
JDK 25, Gradle 9.6.0, dan versi library di `gradle/libs.versions.toml`.
