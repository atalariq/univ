# Expert Brief Kelompok 5: Feature Driven Development (FDD)

Kelompok 5 / FDD

Anggota:

1. Atalariq Barra Hadinugraha (25/557554/SV/26192)
2. Given Gerald Chandra (25/560235/SV/26410)
3. Pavel Efram Sukagunas (25/565845/SV/26998)
4. Fahmi Hasan (25/566255/SV/27049)
5. Gayuh Mukti Aji (25/566296/SV/27058)

## Overview and purpose

Feature Driven Development (FDD) adalah framework agile dari 1999, diperkenalkan lewat buku Java Modeling In Color with UML setelah dipakai pada 1997 di sebuah bank besar Singapura dalam proyek 15 bulan dengan 50 orang. FDD bersifat client-centric, architecture-centric, dan pragmatis: kemajuan diukur dari fitur yang nilainya bisa dilihat, dicoba, atau diuji langsung oleh klien.

Tujuannya memecah sistem menjadi bagian kecil yang dikirim bertahap sesuai prioritas, memberi klien cara memantau progres tiap fitur, dan menyelaraskan bahasa bisnis dengan bahasa developer. FDD lahir karena framework agile lain sulit menangani proyek besar: tanpa gambaran arsitektur di awal, iterasi cepat menghasilkan struktur tambal sulam.

## Key characteristics

- Fitur adalah fungsi kecil bernilai klien dengan pola nama "action result object", misalnya "Calculate the total of a sale". Satu fitur dijaga maksimal dua minggu; bila lebih, fitur dipecah.
- Fitur masuk ke feature list, dikelompokkan menurut subject area dan business activity, lalu diprioritaskan menurut business value.
- Domain expert terlibat langsung lewat domain walkthrough.
- Model domain dan skema database sudah ada sebelum fitur dibangun karena fase awal menetapkan struktur dasar sistem.
- Progres dikoordinasikan lewat laporan mingguan chief programmer berisi persentase penyelesaian fitur.
- Setiap class punya class owner, dan fitur dikerjakan oleh feature team yang dibentuk per fitur.

## Proses inti

FDD punya lima proses. Tiga proses pertama membentuk gambaran besar di awal inisiatif, sedangkan proses keempat dan kelima berulang untuk setiap fitur.

### 1. Develop an Overall Model

Masukannya penjelasan scope dan konteks sistem dari domain expert. Chief architect memandu walkthrough singkat, lalu beberapa kelompok kecil membuat model domain rinci untuk satu subject area, mempresentasikannya untuk peer review, dan memilih model terbaik untuk digabung ke overall model. Keluarannya adalah model domain per subject area ditambah struktur dasar sistem: pembagian layer user interface, problem domain, data management, dan system interface, beserta rancangan awal basis data berupa entitas, tabel, dan relasi antar tabel. Milestone-nya adalah overall model yang disepakati sebagai acuan fitur berikutnya.

### 2. Build a Features List

Masukannya model domain dan hasil fase sebelumnya. Tim melakukan dekomposisi fungsional: domain dipecah menjadi subject area, tiap subject area berisi business activity, dan langkah di dalam tiap business activity menjadi dasar sebuah fitur. Keluarannya feature list berjenjang (major feature set, feature set, feature) dengan prioritas business value. Milestone-nya adalah feature list yang sudah ditinjau domain expert dan siap dipakai sebagai dasar perencanaan.

### 3. Plan by Feature

Masukannya feature list dan komposisi tim. Chief programmer menyusun urutan pengerjaan berdasarkan business value dan ketergantungan teknis, lalu menetapkan feature set owner dan class owner. Keluarannya development plan berisi urutan fitur, pemilik, dan perkiraan jadwal. Milestone-nya adalah rencana yang disetujui, dengan setiap fitur sudah punya pemilik jelas.

### 4. Design by Feature

Masukannya sekumpulan kecil fitur yang ditargetkan selesai dalam siklus pendek maksimal dua minggu, ditambah model domain. Chief programmer membentuk feature team, memandu domain walkthrough bersama domain expert, lalu tim menulis sequence diagram, memperbaiki model bila perlu, dan menyiapkan class serta method prologue. Keluarannya adalah design package. Milestone-nya adalah design inspection yang lulus, saat fitur dihitung sekitar 44 persen selesai.

### 5. Build by Feature

Masukannya design package yang sudah disetujui. Class owner mengimplementasikan class miliknya, menulis unit test, lalu kode diperiksa lewat code inspection sebelum dipromosikan ke main build. Keluarannya fitur yang berjalan dan terintegrasi di build utama, dengan milestone feature complete. Design by Feature dan Build by Feature berjalan dalam siklus pendek per fitur, dan Build by Feature ditutup code inspection.

## Strength and limitation

Kelebihan:

- Fitur dengan business value tertinggi bisa dikirim lebih cepat karena prioritas terlihat.
- Struktur besar ditetapkan di awal, sehingga arsitektur dan skema database cenderung konsisten meski fitur terus ditambah.
- Progres mudah dipantau secara objektif lewat persentase penyelesaian per fitur.
- Design inspection dan code inspection menjaga kualitas, sementara class ownership membuat satu orang bertanggung jawab atas tiap class.

Batasan:

- Butuh buy-in dan waktu pemilik bisnis serta domain expert; tanpa mereka domain walkthrough kehilangan isi.
- Overhead peran dan inspection terasa berlebihan untuk tim kecil.
- Kurang lentur bila kebutuhan berubah besar di tengah jalan, karena model dan struktur sudah ditetapkan lebih dulu.
- Bergantung pada beberapa individu kunci, terutama chief architect dan chief programmer, dan class ownership bisa memunculkan silo pengetahuan.

## When should we use this framework/model

FDD masuk akal untuk proyek besar dan kompleks, umumnya 15 sampai 50 developer, dengan domain kaya aturan bisnis seperti perbankan, asuransi, dan aplikasi enterprise. Kondisi lain yang mendukung: kebutuhan sudah dipahami di awal, manajemen menuntut laporan progres terukur, dan tim punya arsitek kuat serta akses rutin ke domain expert.

FDD sebaiknya dihindari untuk tim kecil, produk baru dengan kebutuhan yang berubah cepat, atau organisasi tanpa domain expert.

## Comparison with other models

| Aspek | FDD | Scrum | Kanban | XP |
| --- | --- | --- | --- | --- |
| Unit kerja | Feature, maksimal 2 minggu | Item kerja per sprint | Item sesuai kapasitas | User story per iterasi |
| Perencanaan | Feature list, plan by feature | Sprint planning | Just in time, WIP limit | Planning game |
| Irama | Siklus per fitur, 2 sampai 10 hari | Sprint 2 sampai 4 minggu | Continuous flow | Iterasi 1 sampai 2 minggu |
| Desain | Upfront domain model, lalu per fitur | Emergent | Tidak diatur | Simple design, refactoring |
| Struktur tim | Hierarkis: chief architect, class owner | Self-organizing, kolektif | Peran yang ada | Cross-functional, kolektif |
| Kualitas | Inspection, persentase fitur | Review, retrospective, DoD | Lead time, CFD | Pair programming, TDD, CI |
| Cocok untuk | Proyek besar, domain kompleks | Tim kecil, kebutuhan berubah | Maintenance, support | Tim kecil, perubahan cepat |

## Alur menjelaskan 5 menit

Mulai dari masalahnya: proyek besar dan aturan bisnis rumit membuat iterasi cepat kehilangan arah. Tunjukkan posisi FDD yang tetap memodelkan gambaran besar di awal, lalu jelaskan lima proses berurutan dengan penekanan bahwa tiga proses pertama membentuk fondasi dan dua terakhir berulang per fitur. Tutup dengan batasan dan kapan FDD masuk akal dipakai.

Lima analogi satu baris:

1. Develop an Overall Model: seperti membuat peta kota sebelum menentukan rute.
2. Build a Features List: seperti memecah daftar belanja besar menjadi item yang bisa dibawa satu tangan.
3. Plan by Feature: seperti menentukan urutan masak dan siapa koki untuk tiap hidangan.
4. Design by Feature: seperti menulis resep rinci dan memeriksanya bersama sebelum kompor dinyalakan.
5. Build by Feature: seperti memasak satu porsi, mencicipi, lalu menyajikannya ke meja.

Sketsa peta lima proses:

```text
[1] Develop an Overall Model
        model domain per subject area
        + struktur dasar sistem + rancangan basis data
                    |
                    v
[2] Build a Features List
        subject area -> business activity -> feature ("action result object")
                    |
                    v
[3] Plan by Feature
        urutan fitur, feature set owner, class owner
                    |
                    v
    +-------- siklus per fitur (maksimal 2 minggu) --------+
    |  [4] Design by Feature                               |
    |        domain walkthrough, sequence diagram,         |
    |        design inspection -> design package           |
    |                    |                                 |
    |                    v                                 |
    |  [5] Build by Feature                                |
    |        coding, unit test, code inspection,           |
    |        promote to build -> feature complete          |
    +------------------------------------------------------+
                    |
                    v
        laporan progres mingguan chief programmer
```

## Referensi

- Feature Driven Development and Agile Modeling: <https://agilemodeling.com/essays/fdd.htm>
- Situs komunitas FDD: <https://featuredrivendevelopment.com/>
- Diskusi Jeff De Luca dan Paul Szego soal layer PD, UI, DM, SI: <https://featuredrivendevelopment.com/threads/582.html>
- Wikipedia, Feature-driven development: <https://en.wikipedia.org/wiki/Feature-driven_development>
- Planview, What is FDD in Agile: <https://www.planview.com/resources/articles/fdd-agile/>
- monday.com, Feature driven development: <https://monday.com/blog/rnd/feature-driven-development-fdd/>
- Harness, Getting started with Feature Driven Development: <https://www.harness.io/harness-devops-academy/getting-started-with-feature-driven-development-a-comprehensive-guide>
