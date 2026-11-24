#set document(
  title: "Tutorial Instapro: Activity dan Intent",
  author: "Atalariq Barra H.",
)
#set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm))
#set text(size: 11pt, lang: "id")
#set heading(numbering: "1.")
#set par(justify: true, leading: 0.65em)
#show raw.where(block: true): it => block(
  fill: rgb("#1e1e1e"),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
  text(fill: rgb("#e8e8e8"), size: 8pt, it),
)
#show link: underline

#align(center)[
  #text(
    size: 20pt,
    weight: "bold",
  )[Tutorial Instapro -- Instagram Profile Page Clone]\
  #text(size: 14pt)[Activity dan Intent: Edit Profile dan Lihat Foto Profil]
]

#grid(
  columns: (auto, 1fr),
  column-gutter: 8pt,
  row-gutter: 4pt,
  [*Nama:*], [Atalariq Barra Hadinugraha],
  [*NIM:*], [25/557554/SV/26192],
  [*Repository:*], link("https://github.com/atalariq/pppbd-instapro"),
)

= Pengenalan

Instapro adalah aplikasi profil sederhana. Tampilannya meniru Instagram. Ada tiga layar. Layar utama menampilkan foto, username, nama, pronoun, bio, link, dan grid 9 postingan. Layar kedua dipakai untuk mengedit profil. Layar ketiga menampilkan foto profil dalam ukuran besar.

Satu layar dipegang satu Activity. `MainActivity` memegang layar utama. `EditProfileActivity` memegang layar edit. `PhotoProfileActivity` memegang layar foto.

Intent menghubungkan Activity. Explicit Intent menyebut nama kelas tujuan. Contohnya pindah dari `MainActivity` ke `EditProfileActivity`. Implicit Intent menyebut aksi dan data. Contohnya membuka browser atau galeri tanpa menyebut nama kelas.

= Hasil akhir

Setelah mengikuti tutorial ini, aplikasi bisa melakukan dua tugas berikut.

1. Tombol Edit Profile membuka halaman edit berisi username, nama, pronoun, bio, link, dan foto. Tombol Save menutup halaman dan data baru langsung tampil di halaman utama. Data tetap ada setelah aplikasi ditutup.
2. Foto profil di halaman utama bisa diketuk dan membuka halaman baru yang menampilkan foto dan nama akun. Teks link di bio bisa diketuk dan membuka browser.

= Persiapan proyek

Buat project baru di Android Studio. Pilih Empty Views Activity. Isi Name dengan Instapro, Package name dengan `com.example.instapro`, Minimum SDK dengan API 24, Language dengan Kotlin, Build configuration language dengan Kotlin DSL.

Tutorial ini mengasumsikan gambar `pp`, latar lingkaran `bg_circle`, dan ikon link `ic_link` sudah ada di folder `drawable`. Itu bawaan dari tugas layouting sebelumnya. Kalau belum ada, pakai warna atau ikon lain. ID yang dipakai tutorial harus tetap sama.

Aktifkan View Binding di `app/build.gradle.kts`. Tambahkan blok `buildFeatures` di dalam blok `android`:

```kotlin
android {
    namespace = "com.example.instapro"
    // ... compileSdk, defaultConfig, buildTypes, compileOptions ...

    buildFeatures {
        viewBinding = true
    }
}
```

Sync Gradle setelah mengedit. Setiap file layout lalu punya kelas binding. `activity_main.xml` dibaca lewat `ActivityMainBinding`, `activity_edit_profile.xml` lewat `ActivityEditProfileBinding`, dan `activity_photo_profile.xml` lewat `ActivityPhotoProfileBinding`.

= Strings

Semua teks ditulis di `app/src/main/res/values/strings.xml`. Cara ini membuat teks mudah diubah dan dipakai ulang. Salin seluruh isi berikut:

```xml
<resources>
    <!-- App Info -->
    <string name="app_name">INSTAPRO</string>

    <!-- User Info (Default Value) -->
    <string name="user_name">atalariq__</string>
    <string name="bio">Software Engineering Student | UGM \'25 | vimmer</string>
    <string name="full_name">Atalariq Barra H.</string>
    <string name="pronoun">he/him</string>
    <string name="social_link">atalariq.dev</string>

    <!-- Screen Titles & Labels -->
    <string name="title_edit_profile">Edit Profile</string>
    <string name="label_username">Username</string>
    <string name="label_name">Name</string>
    <string name="label_pronoun">Pronouns</string>
    <string name="label_bio">Bio</string>
    <string name="label_link">Links</string>

    <!-- Buttons & Actions -->
    <string name="action_edit_profile">Edit Profile</string>
    <string name="action_share_profile">Share Profile</string>
    <string name="action_save">Save</string>
    <string name="action_back">Back</string>
    <string name="action_change_photo">Change profile picture</string>

    <!-- Dynamic Profile Stats Formats -->
    <string name="stats_posts_format">%1$d\npost</string>
    <string name="stats_followers_format">%1$d\nfollowers</string>
    <string name="stats_following_format">%1$d\nfollowing</string>

    <!-- Content Descriptions for Accessibility -->
    <string name="cd_profile_picture">Profile Picture</string>
    <string name="cd_link_icon">Link Icon</string>
    <string name="cd_post_image">Post Image</string>
    <string name="cd_username">User Name</string>
    <string name="cd_full_name">Display Name</string>
</resources>
```

Bagian format statistik memakai `%1$d`. Angka postingan, followers, dan following dimasukkan dari kode Kotlin. Bagian `cd_*` dipakai untuk `contentDescription` agar pembaca layar bisa menjelaskan gambar.

= Manifest

Daftarkan ketiga Activity di `app/src/main/AndroidManifest.xml`:

```xml
<activity
    android:name=".MainActivity"
    android:exported="true"
    android:windowSoftInputMode="adjustResize">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity>
<activity
    android:name=".EditProfileActivity"
    android:exported="false"
    android:windowSoftInputMode="adjustResize" />
<activity
    android:name=".PhotoProfileActivity"
    android:exported="false"
    android:windowSoftInputMode="adjustResize" />
```

Hanya `MainActivity` yang punya filter MAIN dan LAUNCHER. Itu artinya hanya layar utama yang muncul sebagai pintu masuk aplikasi. Dua Activity lain memakai `exported="false"` sehingga aplikasi lain tidak bisa membukanya. Opsi `adjustResize` menggeser layout ke atas saat keyboard muncul. Opsi ini penting di layar edit yang penuh `EditText`.

Buat dua Activity baru lewat File, New, Activity, Empty Views Activity. Beri nama `EditProfileActivity` dan `PhotoProfileActivity`. Android Studio otomatis menambahkan entri di Manifest. Cocokkan dengan kode di atas.

= Layout utama

File `app/src/main/res/layout/activity_main.xml` memakai `ConstraintLayout`. ID yang wajib ada: `tvAppName`, `ivProfilePicture`, `tvUsername`, `tvStatsPosts`, `tvStatsFollowers`, `tvStatsFollowing`, `tvFullName`, `tvPronoun`, `tvBio`, `ivLinkIcon`, `tvLink`, `btnEditProfile`, `btnShareProfile`, dan `ivPost1` sampai `ivPost9`. Kode Kotlin di bab berikut membaca ID tersebut. Salah satu huruf saja membuat binding gagal.

Bagian atas berisi judul, foto, username, dan statistik:

```xml
<TextView
    android:id="@+id/tvAppName"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:text="@string/app_name"
    android:textStyle="bold"
    android:textSize="28sp"
    android:gravity="center"
    app:layout_constraintTop_toTopOf="parent"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toEndOf="parent" />

<ImageView
    android:id="@+id/ivProfilePicture"
    android:layout_width="80dp"
    android:layout_height="80dp"
    android:layout_marginTop="20dp"
    android:src="@drawable/pp"
    android:scaleType="centerCrop"
    android:clipToOutline="true"
    android:background="@drawable/bg_circle"
    android:contentDescription="@string/cd_profile_picture"
    app:layout_constraintTop_toBottomOf="@id/tvAppName"
    app:layout_constraintStart_toStartOf="parent" />

<TextView
    android:id="@+id/tvUsername"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginStart="16dp"
    android:text="@string/user_name"
    android:textStyle="bold"
    android:textSize="18sp"
    app:layout_constraintTop_toTopOf="@id/ivProfilePicture"
    app:layout_constraintStart_toEndOf="@id/ivProfilePicture"
    app:layout_constraintEnd_toEndOf="parent" />

<TextView
    android:id="@+id/tvStatsPosts"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:gravity="center"
    tools:text="1\npost"
    app:layout_constraintTop_toBottomOf="@id/tvUsername"
    app:layout_constraintStart_toEndOf="@id/ivProfilePicture"
    app:layout_constraintEnd_toStartOf="@id/tvStatsFollowers"
    app:layout_constraintHorizontal_chainStyle="spread_inside" />

<TextView
    android:id="@+id/tvStatsFollowers"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:gravity="center"
    tools:text="434\nfollowers"
    app:layout_constraintTop_toTopOf="@id/tvStatsPosts"
    app:layout_constraintStart_toEndOf="@id/tvStatsPosts"
    app:layout_constraintEnd_toStartOf="@id/tvStatsFollowing" />

<TextView
    android:id="@+id/tvStatsFollowing"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:gravity="center"
    tools:text="728\nfollowing"
    app:layout_constraintTop_toTopOf="@id/tvStatsPosts"
    app:layout_constraintStart_toEndOf="@id/tvStatsFollowers"
    app:layout_constraintEnd_toEndOf="parent" />
```

Atribut `tools:text` hanya tampil di pratinjau Android Studio. Isi aslinya diisi dari kode lewat fungsi `updateStatsUI()`.

Bagian tengah berisi nama, bio, link, dan tombol:

```xml
<TextView
    android:id="@+id/tvFullName"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_marginTop="16dp"
    android:text="@string/full_name"
    android:textStyle="bold"
    app:layout_constraintTop_toBottomOf="@id/ivProfilePicture"
    app:layout_constraintStart_toStartOf="parent" />

<TextView
    android:id="@+id/tvPronoun"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_marginStart="6dp"
    android:text="@string/pronoun"
    android:textColor="#8D6E63"
    app:layout_constraintStart_toEndOf="@id/tvFullName"
    app:layout_constraintTop_toTopOf="@id/tvFullName" />

<TextView
    android:id="@+id/tvBio"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_marginTop="8dp"
    android:text="@string/bio"
    app:layout_constraintTop_toBottomOf="@id/tvFullName"
    app:layout_constraintStart_toStartOf="parent" />

<ImageView
    android:id="@+id/ivLinkIcon"
    android:layout_width="20dp"
    android:layout_height="20dp"
    android:layout_marginTop="12dp"
    android:src="@drawable/ic_link"
    android:contentDescription="@string/cd_link_icon"
    app:layout_constraintTop_toBottomOf="@id/tvBio"
    app:layout_constraintStart_toStartOf="parent" />

<TextView
    android:id="@+id/tvLink"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:layout_marginStart="4dp"
    android:text="@string/social_link"
    android:textStyle="bold"
    app:layout_constraintTop_toTopOf="@id/ivLinkIcon"
    app:layout_constraintStart_toEndOf="@id/ivLinkIcon" />

<Button
    android:id="@+id/btnEditProfile"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginTop="16dp"
    android:text="@string/action_edit_profile"
    android:textAllCaps="false"
    android:backgroundTint="#EFEFEF"
    android:textColor="@android:color/black"
    app:layout_constraintTop_toBottomOf="@id/tvLink"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toStartOf="@id/btnShareProfile"
    app:layout_constraintHorizontal_chainStyle="spread_inside" />

<Button
    android:id="@+id/btnShareProfile"
    android:layout_width="0dp"
    android:layout_height="wrap_content"
    android:layout_marginStart="4dp"
    android:text="@string/action_share_profile"
    android:textAllCaps="false"
    android:backgroundTint="#EFEFEF"
    android:textColor="@android:color/black"
    app:layout_constraintTop_toTopOf="@id/btnEditProfile"
    app:layout_constraintStart_toEndOf="@id/btnEditProfile"
    app:layout_constraintEnd_toEndOf="parent" />
```

Bagian bawah berisi grid 3 kolom. Dua `Guideline` vertikal di 33 persen dan 66 persen membagi layar. Setiap postingan memakai rasio 4:5. Contoh baris pertama:

```xml
<androidx.constraintlayout.widget.Guideline
    android:id="@+id/guidelineV1"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:orientation="vertical"
    app:layout_constraintGuide_percent="0.333" />

<androidx.constraintlayout.widget.Guideline
    android:id="@+id/guidelineV2"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:orientation="vertical"
    app:layout_constraintGuide_percent="0.666" />

<ImageView
    android:id="@+id/ivPost1"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:layout_margin="1dp"
    android:background="#ACB"
    android:scaleType="centerCrop"
    android:contentDescription="@string/cd_post_image"
    app:layout_constraintDimensionRatio="4:5"
    app:layout_constraintTop_toBottomOf="@id/btnEditProfile"
    app:layout_constraintStart_toStartOf="parent"
    app:layout_constraintEnd_toStartOf="@id/guidelineV1" />

<ImageView
    android:id="@+id/ivPost2"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:layout_margin="1dp"
    android:background="#CAB"
    android:scaleType="centerCrop"
    android:contentDescription="@string/cd_post_image"
    app:layout_constraintDimensionRatio="4:5"
    app:layout_constraintTop_toTopOf="@id/ivPost1"
    app:layout_constraintStart_toEndOf="@id/guidelineV1"
    app:layout_constraintEnd_toStartOf="@id/guidelineV2" />

<ImageView
    android:id="@+id/ivPost3"
    android:layout_width="0dp"
    android:layout_height="0dp"
    android:layout_margin="1dp"
    android:background="#ABC"
    android:scaleType="centerCrop"
    android:contentDescription="@string/cd_post_image"
    app:layout_constraintDimensionRatio="4:5"
    app:layout_constraintTop_toTopOf="@id/ivPost1"
    app:layout_constraintStart_toEndOf="@id/guidelineV2"
    app:layout_constraintEnd_toEndOf="parent" />
```

Ulangi pola yang sama untuk `ivPost4` sampai `ivPost9`. Baris kedua menempel ke bawah `ivPost1`, baris ketiga menempel ke bawah `ivPost4`. Ganti `background` dengan warna lain bila perlu. Grid ini statis dan tidak membaca Intent.

= Layout edit profile

File `app/src/main/res/layout/activity_edit_profile.xml` memakai `ScrollView` di luar `ConstraintLayout`. Susunan ini membuat layar bisa digulir saat keyboard terbuka. ID yang wajib ada: `ivProfilePicture`, `tvChangePhoto`, `etUsername`, `etName`, `etPronoun`, `etBio`, `etLink`, dan `btnSave`.

Bagian foto dan tiga field pertama:

```xml
<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:fillViewport="true"
    tools:context=".EditProfileActivity">

    <androidx.constraintlayout.widget.ConstraintLayout
        android:id="@+id/main"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:padding="16dp">

        <TextView
            android:id="@+id/tvAppName"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:gravity="center"
            android:text="@string/app_name"
            android:textSize="28sp"
            android:textStyle="bold"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toTopOf="parent" />

        <TextView
            android:id="@+id/tvTitle"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="12dp"
            android:text="@string/title_edit_profile"
            android:textSize="24sp"
            android:textStyle="bold"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/tvAppName" />

        <ImageView
            android:id="@+id/ivProfilePicture"
            android:layout_width="80dp"
            android:layout_height="80dp"
            android:layout_marginTop="16dp"
            android:background="@drawable/bg_circle"
            android:clipToOutline="true"
            android:contentDescription="@string/cd_profile_picture"
            android:scaleType="centerCrop"
            android:src="@drawable/pp"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/tvTitle" />

        <TextView
            android:id="@+id/tvChangePhoto"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="8dp"
            android:text="@string/action_change_photo"
            android:textColor="#0095F6"
            android:textStyle="bold"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/ivProfilePicture" />

        <TextView
            android:id="@+id/tvUsernameLabel"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="16dp"
            android:text="@string/label_username"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/tvChangePhoto" />

        <EditText
            android:id="@+id/etUsername"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:autofillHints="username"
            android:ems="10"
            android:hint="@string/user_name"
            android:inputType="text"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/tvUsernameLabel" />

        <EditText
            android:id="@+id/etName"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:autofillHints="name"
            android:ems="10"
            android:hint="@string/full_name"
            android:inputType="text"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/tvNameLabel" />
```

Bagian bio, link, dan tombol Save:

```xml
        <EditText
            android:id="@+id/etBio"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:ems="10"
            android:gravity="start|top"
            android:hint="@string/bio"
            android:importantForAutofill="no"
            android:inputType="textMultiLine"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/tvBioLabel" />

        <TextView
            android:id="@+id/tvLinkLabel"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_marginTop="12dp"
            android:text="@string/label_link"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/etBio" />

        <EditText
            android:id="@+id/etLink"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:autofillHints="no"
            android:ems="10"
            android:hint="@string/social_link"
            android:inputType="textUri"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/tvLinkLabel" />

        <Button
            android:id="@+id/btnSave"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_marginTop="24dp"
            android:layout_marginBottom="16dp"
            android:text="@string/action_save"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toBottomOf="@+id/etLink" />
    </androidx.constraintlayout.widget.ConstraintLayout>
</ScrollView>
```

Field pronoun memakai pola yang sama seperti username. Beri label `tvPronounLabel` dan input `etPronoun` dengan `inputType="text"`. Setiap label memakai string dari bab Strings agar konsisten.

= Layout foto profil

File `app/src/main/res/layout/activity_photo_profile.xml` paling kecil. Salin seluruh isi berikut:

```xml
<?xml version="1.0" encoding="utf-8"?>
<androidx.constraintlayout.widget.ConstraintLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:id="@+id/main"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:padding="8dp"
    tools:context=".PhotoProfileActivity">

    <LinearLayout
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent"
        app:layout_constraintTop_toTopOf="parent">

        <ImageView
            android:id="@+id/ivProfilePicture"
            android:layout_width="280dp"
            android:layout_height="280dp"
            android:background="@drawable/bg_circle"
            android:clipToOutline="true"
            android:contentDescription="@string/cd_profile_picture"
            android:scaleType="centerCrop"
            app:srcCompat="@drawable/pp"/>

        <TextView
            android:id="@+id/tvUserName"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:layout_marginTop="12dp"
            android:text="@string/user_name"
            android:textSize="32sp"
            android:textStyle="bold"/>

        <TextView
            android:id="@+id/tvFullName"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:layout_gravity="center"
            android:layout_marginTop="4dp"
            android:text="@string/full_name" />
    </LinearLayout>

    <Button
        android:id="@+id/btnBack"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginBottom="16dp"
        android:text="@string/action_back"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintEnd_toEndOf="parent"
        app:layout_constraintStart_toStartOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>
```

Foto 280dp cukup besar untuk pratinjau. Tombol Back menempel di bawah layar.

= MainActivity

File `app/src/main/java/com/example/instapro/MainActivity.kt` mengatur semua navigasi dari layar utama. Bagian awal mendeklarasikan binding, penyimpanan, dan kunci Intent:

```kotlin
package com.example.instapro

import android.content.Intent
import android.os.Bundle
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.edit
import androidx.core.net.toUri
import com.example.instapro.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    private val sharedPref by lazy {
        getSharedPreferences(PREF_NAME, MODE_PRIVATE)
    }

    private var postsCount = 9
    private var followersCount = 434
    private var followingCount = 728
    private var profileImageUriString: String? = null
```

Kunci `EXTRA_*` dipakai untuk Intent. Kunci `KEY_*` dipakai untuk `SharedPreferences`:

```kotlin
    companion object {
        const val PREF_NAME = "UserProfilePref"
        const val KEY_USERNAME = "key_username"
        const val KEY_NAME = "key_name"
        const val KEY_PRONOUN = "key_pronoun"
        const val KEY_BIO = "key_bio"
        const val KEY_LINK = "key_link"
        const val KEY_IMAGE_URI = "key_image_uri"
        const val KEY_FOLLOWERS = "key_followers"
        const val KEY_POSTS = "key_posts"
        const val KEY_FOLLOWING = "key_following"

        const val EXTRA_USERNAME = "extra_username"
        const val EXTRA_NAME = "extra_name"
        const val EXTRA_PRONOUN = "extra_pronoun"
        const val EXTRA_BIO = "extra_bio"
        const val EXTRA_LINK = "extra_link"
        const val EXTRA_IMAGE_URI = "extra_image_uri"
    }
```

Launcher untuk Edit Profile memakai kontrak `StartActivityForResult`. Callback hanya jalan kalau hasilnya `RESULT_OK`:

```kotlin
    private val editProfileLauncher = registerForActivityResult(
        ActivityResultContracts.StartActivityForResult()
    ) { result ->
        if (result.resultCode == RESULT_OK) {
            val data = result.data ?: return@registerForActivityResult

            val updatedUsername = data.getStringExtra(EXTRA_USERNAME)
            val updatedName = data.getStringExtra(EXTRA_NAME)
            val updatedPronoun = data.getStringExtra(EXTRA_PRONOUN)
            val updatedBio = data.getStringExtra(EXTRA_BIO)
            val updatedLink = data.getStringExtra(EXTRA_LINK)
            val updatedImageUri = data.getStringExtra(EXTRA_IMAGE_URI)

            sharedPref.edit {
                updatedUsername?.let { putString(KEY_USERNAME, it) }
                updatedName?.let { putString(KEY_NAME, it) }
                updatedPronoun?.let { putString(KEY_PRONOUN, it) }
                updatedBio?.let { putString(KEY_BIO, it) }
                updatedLink?.let { putString(KEY_LINK, it) }
                updatedImageUri?.let { putString(KEY_IMAGE_URI, it) }
            }

            loadProfileData()
        }
    }
```

Fungsi `onCreate` mengikat layout, memuat data, dan memasang tiga listener:

```kotlin
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        loadProfileData()
        updateStatsUI()

        with(binding) {
            btnEditProfile.setOnClickListener {
                val intentEditProfile =
                    Intent(this@MainActivity, EditProfileActivity::class.java).apply {
                        putExtra(EXTRA_USERNAME, tvUsername.text.toString())
                        putExtra(EXTRA_NAME, tvFullName.text.toString())
                        putExtra(EXTRA_PRONOUN, tvPronoun.text.toString())
                        putExtra(EXTRA_BIO, tvBio.text.toString())
                        putExtra(EXTRA_LINK, tvLink.text.toString())
                        putExtra(EXTRA_IMAGE_URI, profileImageUriString)
                    }
                editProfileLauncher.launch(intentEditProfile)
            }

            ivProfilePicture.setOnClickListener {
                val intentPhotoProfile =
                    Intent(this@MainActivity, PhotoProfileActivity::class.java).apply {
                        putExtra(EXTRA_USERNAME, tvUsername.text.toString())
                        putExtra(EXTRA_NAME, tvFullName.text.toString())
                        putExtra(EXTRA_IMAGE_URI, profileImageUriString)
                    }
                startActivity(intentPhotoProfile)
            }

            tvLink.setOnClickListener {
                val intent = Intent(Intent.ACTION_VIEW).apply {
                    data = ("https://" + tvLink.text.toString()).toUri()
                }
                startActivity(intent)
            }
        }
    }
```

Tiga pola Intent terlihat di sini. Tombol Edit memakai launcher karena menunggu hasil kembali. Foto profil memakai `startActivity` biasa karena hanya berangkat dan tidak membawa pulang data. Teks link memakai `ACTION_VIEW` sehingga Android membuka browser.

Dua fungsi pembantu memuat dan menampilkan data:

```kotlin
    private fun loadProfileData() {
        val username = sharedPref.getString(KEY_USERNAME, getString(R.string.user_name))
        val name = sharedPref.getString(KEY_NAME, getString(R.string.full_name))
        val pronoun = sharedPref.getString(KEY_PRONOUN, getString(R.string.pronoun))
        val bio = sharedPref.getString(KEY_BIO, getString(R.string.bio))
        val link = sharedPref.getString(KEY_LINK, getString(R.string.social_link))
        profileImageUriString = sharedPref.getString(KEY_IMAGE_URI, null)

        followersCount = sharedPref.getInt(KEY_FOLLOWERS, 434)
        postsCount = sharedPref.getInt(KEY_POSTS, 9)
        followingCount = sharedPref.getInt(KEY_FOLLOWING, 728)

        with(binding) {
            tvUsername.text = username
            tvFullName.text = name
            tvPronoun.text = pronoun
            tvBio.text = bio
            tvLink.text = link

            profileImageUriString?.let {
                ivProfilePicture.setImageURI(it.toUri())
            }
        }
    }

    fun updateStatsUI() {
        binding.tvStatsPosts.text = getString(R.string.stats_posts_format, postsCount)
        binding.tvStatsFollowers.text = getString(R.string.stats_followers_format, followersCount)
        binding.tvStatsFollowing.text = getString(R.string.stats_following_format, followingCount)
    }
}
```

`loadProfileData` dipanggil tiap aplikasi dibuka dan tiap edit selesai. Kalau belum ada simpanan, nilai default dari `strings.xml` yang tampil. Foto khusus: kalau URI tersimpan ada, foto dari galeri yang tampil. Kalau tidak ada, gambar `pp` bawaan yang tampil.

= EditProfileActivity

File `app/src/main/java/com/example/instapro/EditProfileActivity.kt` menerima data, mengizinkan ganti foto dari galeri, dan mengembalikan hasil. Salin seluruh isi berikut:

```kotlin
package com.example.instapro

import android.content.Intent
import android.os.Bundle
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AppCompatActivity
import androidx.core.net.toUri
import com.example.instapro.databinding.ActivityEditProfileBinding

class EditProfileActivity : AppCompatActivity() {

    private lateinit var binding: ActivityEditProfileBinding
    private var selectedImageUriString: String? = null

    private val pickImageLauncher = registerForActivityResult(
        ActivityResultContracts.GetContent()
    ) { uri ->
        uri?.let {
            try {
                contentResolver.takePersistableUriPermission(
                    it,
                    Intent.FLAG_GRANT_READ_URI_PERMISSION
                )
            } catch (_: Exception) {
            }
            selectedImageUriString = it.toString()
            binding.ivProfilePicture.setImageURI(it)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityEditProfileBinding.inflate(layoutInflater)
        setContentView(binding.root)

        with(intent) {
            binding.etUsername.setText(getStringExtra(MainActivity.EXTRA_USERNAME))
            binding.etName.setText(getStringExtra(MainActivity.EXTRA_NAME))
            binding.etPronoun.setText(getStringExtra(MainActivity.EXTRA_PRONOUN))
            binding.etBio.setText(getStringExtra(MainActivity.EXTRA_BIO))
            binding.etLink.setText(getStringExtra(MainActivity.EXTRA_LINK))

            selectedImageUriString = getStringExtra(MainActivity.EXTRA_IMAGE_URI)
            selectedImageUriString?.let {
                binding.ivProfilePicture.setImageURI(it.toUri())
            }
        }

        with(binding) {
            val openGalleryListener = { pickImageLauncher.launch("image/*") }
            ivProfilePicture.setOnClickListener { openGalleryListener() }
            tvChangePhoto.setOnClickListener { openGalleryListener() }

            btnSave.setOnClickListener {
                val resultIntent = Intent().apply {
                    putExtra(MainActivity.EXTRA_USERNAME, etUsername.text.toString())
                    putExtra(MainActivity.EXTRA_NAME, etName.text.toString())
                    putExtra(MainActivity.EXTRA_PRONOUN, etPronoun.text.toString())
                    putExtra(MainActivity.EXTRA_BIO, etBio.text.toString())
                    putExtra(MainActivity.EXTRA_LINK, etLink.text.toString())
                    putExtra(MainActivity.EXTRA_IMAGE_URI, selectedImageUriString)
                }

                setResult(RESULT_OK, resultIntent)
                finish()
            }
        }
    }
}
```

Cara bacanya dari atas ke bawah. `onCreate` mengisi setiap `EditText` dengan nilai dari Intent pengirim, jadi pengguna mengedit teks yang sudah ada, bukan form kosong. Ketuk foto atau teks Change profile picture membuka galeri lewat kontrak `GetContent` dengan filter `image/*`. URI yang dipilih disimpan sebagai string dan langsung tampil sebagai pratinjau. Tombol Save membungkus semua field ke Intent kosong, menandai hasil `RESULT_OK`, lalu memanggil `finish()` untuk kembali.

= PhotoProfileActivity

File `app/src/main/java/com/example/instapro/PhotoProfileActivity.kt` hanya menampilkan data. Salin seluruh isi berikut:

```kotlin
package com.example.instapro

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.core.net.toUri
import com.example.instapro.databinding.ActivityPhotoProfileBinding

class PhotoProfileActivity : AppCompatActivity() {
    private lateinit var binding: ActivityPhotoProfileBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityPhotoProfileBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val username = intent.getStringExtra(MainActivity.EXTRA_USERNAME)
        val fullName = intent.getStringExtra(MainActivity.EXTRA_NAME)
        val imageUriString = intent.getStringExtra(MainActivity.EXTRA_IMAGE_URI)

        with(binding) {
            if (!username.isNullOrEmpty()) {
                tvUserName.text = username
            }
            if (!fullName.isNullOrEmpty()) {
                tvFullName.text = fullName
            }
            if (!imageUriString.isNullOrEmpty()) {
                ivProfilePicture.setImageURI(imageUriString.toUri())
            }

            btnBack.setOnClickListener {
                finish()
            }
        }
    }
}
```

Pemeriksaan `isNullOrEmpty` menjaga teks default di layout tetap tampil kalau pengirim tidak mengirim nilai. Tombol Back hanya memanggil `finish()` dan kembali ke layar utama.

= Cara menguji

1. Jalankan aplikasi di emulator atau HP. Halaman utama menampilkan profil default.
2. Ketuk Edit Profile. Ubah nama dan bio. Ketuk Save. Pastikan halaman utama langsung menampilkan teks baru. Tutup aplikasi dan buka lagi. Pastikan teks baru masih ada.
3. Ketuk foto profil di halaman utama. Pastikan halaman foto menampilkan foto dan nama yang sama dengan halaman utama. Ketuk Back.
4. Ketuk teks link di bio. Pastikan browser membuka alamat tersebut.
5. Buka Edit Profile lagi. Ketuk foto atau Change profile picture. Pilih gambar dari galeri. Ketuk Save. Pastikan foto di halaman utama dan halaman foto ikut berubah.

Kalau foto galeri tidak tampil setelah aplikasi dibuka ulang, periksa izin URI dan pastikan string URI tersimpan di `SharedPreferences`. Kalau teks tidak kembali, periksa ejaan kunci `EXTRA_*` di pengirim dan penerima. Kunci harus sama persis.

= Referensi

Tim Praktikum. Modul Praktikum. Diakses dari materi yang diberikan di Google Classroom.

Android Developers. Activities. Diakses dari https://developer.android.com/guide/components/activities/intro-activities.

Android Developers. Getting a result from an activity. Diakses dari https://developer.android.com/training/basics/intents/result.
