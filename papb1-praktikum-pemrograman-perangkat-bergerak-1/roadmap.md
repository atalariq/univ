# Praktikum Pemrograman Perangkat Bergerak 1 — Roadmap Curi Start

## Overview

Roadmap ini diasumsikan menggunakan stack **Android + Kotlin** dengan UI toolkit **Jetpack Compose**
(beberapa kampus masih pakai XML layout — keduanya dicantumkan). Asumsi ini didasarkan pada
tren mayoritas program studi D-IV TRPL di Indonesia yang mengikuti rekomendasi resmi Google
sejak 2019 (Kotlin sebagai bahasa utama Android) dan adopsi Jetpack Compose yang semakin luas
sejak 2022.

> **Verifikasi dulu ke silabus atau dosen sebelum mulai.** Tanyakan: bahasa apa (Kotlin/Java)?
> UI toolkit apa (Compose/XML)? Ada framework tambahan (Firebase, Retrofit)? Kalau jawabannya
> beda dari asumsi di sini, sesuaikan topik yang diprioritaskan.

---

## Prasyarat

Sebelum masuk materi inti, pastikan konsep berikut sudah tidak asing — ini semua sudah dibahas
di semester 1–2:

- **OOP dasar**: class, object, inheritance, encapsulation, polymorphism (dari mata kuliah PBO/PPBO)
- **Struktur data dasar**: list, map, fungsi rekursif (dari ALPRO/ASD)
- **Version control Git**: clone, commit, push, branch — karena praktikum biasanya submit via repo
- **Logika kondisional dan loop**: sudah jelas, tapi Kotlin punya sintaks berbeda dari Java/C++

Kalau OOP masih fuzzy, luangkan 2–3 hari untuk review sebelum lanjut ke Kotlin. Kotlin sangat
OOP-centric dan kesulitan di OOP akan terasa terus sepanjang matkul.

---

## Topik Inti (urutan belajar)

Urutan ini disusun dari dasar ke atas — jangan lompat karena tiap topik jadi fondasi topik berikutnya.

1. **Setup Android Studio & emulator** — install Android Studio Hedgehog atau lebih baru, buat
   project pertama Hello World, jalankan di emulator atau device fisik.

2. **Kotlin basics** — variabel (`val`/`var`), tipe data, null safety, control flow (`when`, `if`),
   fungsi, lambda, dan extension function; ini fondasi semua kode Android yang akan ditulis.

3. **Kotlin OOP** — class, data class, object, companion object, interface, dan sealed class yang
   sangat umum dipakai di Android architecture.

4. **UI dengan Jetpack Compose** (atau XML layout jika kurikulum minta) — composable function,
   modifier, layout dasar (`Column`, `Row`, `Box`), Text, Button, Image; atau kalau XML:
   ConstraintLayout, ViewBinding.

5. **Activity & Fragment lifecycle** — pahami siklus hidup `onCreate`/`onStart`/`onResume`/`onPause`
   dst., karena salah kelola lifecycle = bug memory leak yang susah debug.

6. **State management** — `remember`, `mutableStateOf`, `State Hoisting` di Compose; atau
   `LiveData`/`StateFlow` dengan ViewModel untuk arsitektur yang lebih proper.

7. **Navigation** — Jetpack Navigation Compose untuk berpindah antar screen + passing data antar
   destination.

8. **Networking dengan Retrofit** — integrasi REST API sederhana, Gson/Kotlinx Serialization untuk
   parse JSON, dan Kotlin Coroutines untuk async non-blocking.

9. **Local data dengan Room** — database lokal SQLite lewat Room DAO, Entity, Database class;
   cocok untuk app yang butuh offline support.

10. **Build simple app** — gabungkan semua topik di atas jadi satu app utuh (contoh: Notes app,
    Todo list, Weather app), terapkan MVVM architecture pattern sederhana.

---

## Resource Kurasi

### Kanonik

Resource resmi dan standar industri — selalu prioritaskan ini karena selalu up-to-date.

| Resource                           | Format                | Bahasa | Biaya  | URL                                                                                                                                |
| ---------------------------------- | --------------------- | ------ | ------ | ---------------------------------------------------------------------------------------------------------------------------------- |
| Android Basics with Compose        | Course + Codelabs     | [EN]   | Gratis | [developer.android.com/courses/android-basics-compose/course](https://developer.android.com/courses/android-basics-compose/course) |
| Kotlin Official Docs               | Dokumentasi           | [EN]   | Gratis | [kotlinlang.org/docs](https://kotlinlang.org/docs/home.html)                                                                       |
| Android Developer Docs             | Dokumentasi           | [EN]   | Gratis | [developer.android.com](https://developer.android.com)                                                                             |
| Kotlin for Android (campaign page) | Landing page resource | [EN]   | Gratis | [developer.android.com/kotlin/campaign/learn](https://developer.android.com/kotlin/campaign/learn)                                 |
| Google Codelabs — Android          | Codelabs hands-on     | [EN]   | Gratis | [codelabs.developers.google.com](https://codelabs.developers.google.com/?cat=Android)                                              |
| Android Developers YouTube         | Video                 | [EN]   | Gratis | [youtube.com/@AndroidDevelopers](https://www.youtube.com/@AndroidDevelopers)                                                       |

**Catatan penggunaan:**

- **Android Basics with Compose** adalah entry point paling terstruktur untuk pemula — ikuti urutan
  unit-nya, jangan loncat.
- **Kotlin Official Docs** bagus untuk referensi cepat, bukan untuk dibaca linear dari awal.
- **Google Codelabs** selalu punya hands-on lab per topik spesifik — search topik yang lagi dipelajari.

---

### Hidden Gems (verified by experts)

Resource di bawah ini kurang terkenal dibanding "search YouTube Android tutorial", tapi kualitasnya
diakui oleh dev Android yang sudah berpengalaman. Setiap entry disertai siapa yang merekomendasikan
dan mengapa.

---

**1. Philipp Lackner — YouTube Channel**

- URL: [youtube.com/@PhilippLackner](https://www.youtube.com/@PhilippLackner)
- Format: Video YouTube | Bahasa: [EN] | Biaya: Gratis (ada paid courses di pl-coding.com)
- Kenapa masuk hidden gem: Bukan channel terbesar, tapi konsisten direkomendasikan di komunitas
  r/androiddev dan oleh pengajar Android karena pendekatannya menjelaskan _mengapa_ suatu pattern
  dipakai, bukan sekadar _bagaimana_. Class Central menempatkan Lackner di top 22% educator
  Web/Mobile development. Playlist "Android Basics 2024"-nya cover Jetpack Compose end-to-end.
- Siapa yang rekomendasikan: Komunitas r/androiddev, Class Central reviewers, dan developer
  community di Kotlin Slack.
- Cocok untuk: Mahasiswa yang butuh penjelasan konsep dalam format video dengan proyek nyata.

---

**2. skydoves/android-developer-roadmap (GitHub)**

- URL: [github.com/skydoves/android-developer-roadmap](https://github.com/skydoves/android-developer-roadmap)
- Format: Visual roadmap + blog series | Bahasa: [EN] + tersedia README Bahasa Indonesia | Biaya: Gratis
- Kenapa masuk hidden gem: Bukan sekadar daftar topik — dilengkapi blog series 5 bagian yang
  menjelaskan tiap layer dari Android platform, app components, Jetpack, architecture, sampai
  Compose. Roadmap-nya visual dan bisa di-filter sesuai level.
- Siapa yang membuat: **Jaewoong Eum** (GitHub: skydoves), **Google Developer Expert** untuk
  Android. Repo ini punya 7.5K+ GitHub stars dan digunakan sebagai referensi roadmap di berbagai
  program belajar Android.
- Cocok untuk: Orientasi awal — pakai ini untuk mapping "aku sekarang ada di mana dan mau ke
  mana" sebelum mulai belajar.

---

**3. Now in Android — Official Google Sample App (GitHub)**

- URL: [github.com/android/nowinandroid](https://github.com/android/nowinandroid)
- Format: Source code + dokumentasi arsitektur | Bahasa: [EN] | Biaya: Gratis
- Kenapa masuk hidden gem: Ini bukan tutorial — ini production-quality app dari tim Android
  Google yang sengaja dibuat sebagai referensi best practices. Ada dokumentasi architecture
  learning journey dan modularization guide yang sangat berharga untuk memahami "Android yang
  benar" versus "Android yang asal jalan". Kebanyakan tutorial tidak mengajarkan ini.
- Siapa yang merekomendasikan: **Tim Android Developer Relations Google** secara resmi sebagai
  referensi arsitektur di developer.android.com/get-started/overview.
- Cocok untuk: Setelah bisa bikin app sederhana, baca ini untuk tahu gap antara "bisa bikin" dan
  "bikin dengan benar".

---

**4. Kotlin in Action, 2nd Edition — Manning Publications**

- URL: [manning.com/books/kotlin-in-action-second-edition](https://www.manning.com/books/kotlin-in-action-second-edition)
- Format: Buku | Bahasa: [EN] | Biaya: Berbayar (~$50, ada MEAP early access)
- Kenapa masuk hidden gem: Satu-satunya buku Kotlin yang ditulis langsung oleh orang-orang yang
  merancang bahasanya. Edisi kedua (2024) ditulis oleh **Sebastian Aigner**, **Roman Elizarov**
  (Lead Designer bahasa Kotlin), **Svetlana Isakova**, dan **Dmitry Jemerov** — semuanya dari
  tim inti JetBrains/Kotlin. Bukan tutorial step-by-step, tapi explains _why_ Kotlin dirancang
  seperti itu.
- Siapa yang merekomendasikan: **Roman Elizarov** (Lead Designer Kotlin), **Sebastian Aigner**
  (JetBrains Developer Advocate, host Talking Kotlin podcast) sebagai co-author; diakui sebagai
  referensi definitif oleh komunitas Android dan JVM developer.
- Cocok untuk: Yang mau paham Kotlin secara mendalam, bukan sekadar tahu sintaksnya.

---

**5. Talking Kotlin — Podcast by JetBrains**

- URL: [talkingkotlin.com](https://talkingkotlin.com) / tersedia di Apple Podcasts & Spotify
- Format: Podcast bimonthly | Bahasa: [EN] | Biaya: Gratis
- Kenapa masuk hidden gem: Podcast teknis tentang Kotlin yang dihost oleh **Sebastian Aigner**
  dan **Márton Braun** (keduanya JetBrains Developer Advocates). Cover topik dari coroutines
  internals, KMP, sampai wawancara dengan dev Android dari perusahaan besar. Bukan untuk pemula
  mutlak, tapi bagus untuk membangun intuisi "cara berpikir Kotlin" sambil commute atau olahraga.
- Siapa yang merekomendasikan: **Sebastian Aigner** (JetBrains), yang juga menyebutnya di
  berbagai conference talk sebagai sumber belajar ekosistem Kotlin.
- Cocok untuk: Setelah punya dasar Kotlin, dengerin saat perjalanan untuk exposure ke topik
  lanjutan secara pasif.

---

**6. Stevdza-San — YouTube Channel**

- URL: [youtube.com/c/StevdzaSan](https://www.youtube.com/c/StevdzaSan)
- Format: Video YouTube | Bahasa: [EN] | Biaya: Gratis (ada paid courses di stevdza-san.com)
- Kenapa masuk hidden gem: **Stefan Jovanovic** dikenal spesifik untuk tutorial Room Database,
  Jetpack Compose, dan Kotlin Coroutines — topik-topik yang tutorial gratisnya seringkali
  dangkal. Tutorialnya detail dan langsung ke implementasi nyata. Disebutkan di Class Central
  dan placementpreparation.io sebagai salah satu channel Android terbaik untuk topik-topik ini.
- Siapa yang merekomendasikan: Komunitas Kotlin Slack dan Class Central reviewers menyebutnya
  bersamaan dengan Philipp Lackner sebagai channel yang komplementer.
- Cocok untuk: Topik spesifik Room Database dan Coroutines yang penjelasannya lebih baik dari
  channel umum.

---

## Fokus Bank-Soal

Belum ada bank-soal untuk matkul ini di repo.

---

## Estimasi Waktu

Estimasi di bawah ini untuk mahasiswa yang belum pernah Android sama sekali, dengan OOP sudah
oke dari mata kuliah sebelumnya. Waktu per minggu diasumsikan ~10–15 jam (termasuk praktikum
terjadwal).

| Topik                                         | Estimasi Jam    |
| --------------------------------------------- | --------------- |
| Setup Android Studio + Hello World            | 2–3 jam         |
| Kotlin basics (variabel, fungsi, null safety) | 8–12 jam        |
| Kotlin OOP (class, data class, sealed class)  | 6–10 jam        |
| UI Jetpack Compose (layout, state dasar)      | 10–15 jam       |
| Activity & Fragment lifecycle                 | 5–8 jam         |
| State management + ViewModel                  | 8–12 jam        |
| Navigation (Compose Navigation)               | 4–6 jam         |
| Networking dengan Retrofit + Coroutines       | 8–12 jam        |
| Local data dengan Room Database               | 8–12 jam        |
| Build full simple app (integrasi semua topik) | 15–20 jam       |
| **Total**                                     | **~74–110 jam** |

Kalau praktikum berlangsung 14–16 minggu, ini masuk akal dengan ~5–7 jam belajar mandiri per
minggu di luar jam praktikum. Prioritaskan topik yang muncul di modul praktikum — baca silabus
tiap minggu sebelum pertemuan, bukan setelah.
