# Pertemuan 5: Container

## Ringkasan

Deck `arpl-p5-containers.pdf` berisi 104 slide dan dibuka dengan pertanyaan: apa itu container. Jawabannya di slide 3, yaitu cara memaket software beserta dependencies-nya supaya bisa dijalankan di banyak environment. Sepuluh slide berikutnya memperlihatkan kenapa itu tidak sepele: `program.py` yang jalan di laptop dosen gagal di mesin lain karena `python3` tidak terpasang, lalu karena interpreternya masih 3.5 dan tidak mengenal f-string, lalu karena `numpy` tidak ada (slide 4 sampai 13).

Urutan kegagalan itu yang membuat container jadi keputusan arsitektural. Kalau satu aplikasi hanya hidup pada kombinasi OS, interpreter, dan library tertentu, kombinasi itu bagian dari kontrak deploy. Container memindahkan kontrak itu ke artefak yang bisa diuji, diberi versi, dan dipromosikan antar environment, sehingga cara sistem dipecah, cara state disimpan, dan cara rilis berubah.

## Konsep kunci

Image dan layer. Container adalah proses yang berjalan dari container image (slide 38); image adalah kumpulan file untuk membuat container (slide 39). Layer memakai teknik layered filesystem Plan 9 dengan projection on read dan copy on write (slide 26). File di layer bawah tidak pernah diubah, penulisan membuat salinan di layer atas (slide 28). Dockerfile mencatat instruksi pembuatan layer (slide 45), dan deck membandingkan `RUN` terpisah dengan satu `RUN` berantai `&&` (slide 50 sampai 52). Pilihan itu mengubah jumlah layer dan isi cache, jadi urutan instruksi berpengaruh.

Container versus virtual machine. VM menumpuk guest OS di atas hypervisor (slide 57), container berbagi kernel host dan hanya memisahkan file system serta proses (slide 58). VM memberi machine isolation, container memberi process isolation (slide 59). Untuk sepuluh instance Flask, deck menghitung 65.6GB pada VM dan 6.56GB pada container karena layer Ubuntu dipakai bersama (slide 60). VM tetap dipilih kalau butuh OS lain, emulasi hardware, atau isolasi lebih kuat (slide 62).

Isolasi proses. Isolasi datang dari Linux namespaces, yang masuk kernel sejak 2002 dan bertambah cakupannya: mount 2002, PID 2008, network 2009, user 2013 (slide 33). chroot hanya mengisolasi file system; proses dan network masih terlihat dari dalam (slide 24). Namespace saja tidak cukup; shell dan binary tetap harus ada di dalam lingkungan yang dikurung.

Registry. Registry adalah platform berbagi file yang menyimpan image; image di-pull dari sana (slide 55). `FROM ubuntu` berarti mengambil image dari registry, dan dari situ muncul pertanyaan asal usul base image (slide 53).

Orkestrasi. Deck tidak membahasnya sebagai topik tersendiri. Yang muncul hanya kebutuhan scaling (slide 70) dan catatan bahwa container di Google Kubernetes Engine berjalan di dalam VM (slide 65). Docker Compose menangani banyak container di satu host (slide 94 sampai 96), bukan penjadwalan lintas mesin.

## Apa yang container selesaikan dan apa yang tidak

Yang selesai:

* Dependency drift. Versi interpreter dan library dibekukan di dalam image (slide 67).
* Selisih environment. Developer bisa mereplikasi environment tes yang sama dengan CI (slide 68).
* Deploy lintas lingkungan. Image yang sama dipasang di cloud atau server on premises dengan konfigurasi minimal (slide 69).
* Scaling. Instance baru dijalankan dari image yang sama tanpa instalasi ulang (slide 70).

Yang tidak selesai:

* State. Container sementara; data yang harus bertahan perlu volume, dan volume pun bisa terhapus oleh `docker rm -v` (slide 79).
* Konfigurasi. Kredensial dan alamat database tetap diberikan lewat flag `-e` atau file Compose, jadi tidak ikut terpaket (slide 75).
* Observability. Log keluar ke stdout container dan dipanen dari luar, misalnya `docker compose logs` (slide 99). Metrik, tracing, dan alert tetap pekerjaan terpisah.
* Keamanan. Untuk isolasi kuat, deck menunjuk VM (slide 62).

## Implikasi arsitektural

Satu container satu tanggung jawab. Deck menyebut container menjalankan satu aplikasi (slide 64), dan itu memaksa batas proses terlihat di repo serta pipeline.

Batas state harus eksplisit. Apa pun yang tidak boleh hilang saat restart harus keluar dari container, lewat volume atau layanan data terpisah.

Health check dan urutan start jadi bagian desain saat container saling bergantung. Compose mengurutkan start, tetapi belum tentu siap menerima koneksi.

Konfigurasi lewat environment. Image yang sama dipakai untuk dev, staging, dan produksi; yang berbeda hanya nilai yang disuntikkan (slide 75).

Immutable deployment. Image diberi tag, dibangun sekali, lalu dipromosikan. Perbaikan berarti membangun image baru, bukan mengubah container yang sedang jalan.

## Kekuatan dan biaya

Kekuatannya: reproducibility, startup cepat, kepadatan tinggi di satu mesin (slide 64), dan jalur deploy yang sama dari laptop ke cluster.

Biayanya: registry, tag, dan masa hidup image harus dikelola. Dockerfile jadi kode yang perlu dirawat, layer gemuk memperlambat build dan pull, dan container menambah lapisan yang harus diamati. Base image perlu diperbarui untuk patch keamanan, yang berarti rebuild berkala meski kode aplikasi tidak berubah.

## Kapan dipakai

Sinyal yang mengarah ke container: lebih dari satu service, dependency yang sering bentrok antar project, kebutuhan parity lokal dan CI, serta rencana scaling horizontal.

Sinyal berlebihan: binary statis tanpa dependency, aplikasi desktop, atau sistem yang menuntut isolasi hardware. Untuk kasus terakhir, VM lebih tepat (slide 62), dan keduanya sering digabung (slide 65).

## Kaitan dengan pertemuan lain

Pertemuan 6 soal infrastructure as code mengambil bagian yang tidak diselesaikan container: siapa yang membuat cluster, bagaimana image dideploy, dan bagaimana konfigurasi dicatat sebagai kode. Catatan ada di `../p6-infrastructure-as-code/NOTES.md`.

Pertemuan 12 soal monolith dan microservices memakai container sebagai alat, bukan tujuan. Deck menyebut container memudahkan deploy service terpisah (slide 71), tetapi memecah sistem tetap keputusan desain. Catatan ada di `../p12-monolith-microservices/NOTES.md`.

## Sumber

* `from-elok.local/arpl-p5-containers.pdf`, Brae Webb dan Richard Thomas, 104 slide. Rujukan utama.
* `csse.uq.local/w3a-containers.pdf`, catatan kuliah 6 halaman, bagian 2.1 dan 2.2 untuk namespaces dan layered filesystem.
