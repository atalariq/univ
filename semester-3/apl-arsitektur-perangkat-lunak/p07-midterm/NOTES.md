# Pertemuan 7: Ujian Tengah Semester

Pertemuan 7 tidak berisi materi baru. Sesi ini dipakai untuk UTS, dan seluruh bahan ujian berasal dari slide dosen pertemuan 1 sampai 6. Folder `uts.local/` menyimpan hasil persiapan: audit soal, tiga versi cheatsheet Typst, dan PDF gabungan slide serta handout.

## Cakupan

Enam pertemuan yang diujikan, sesuai sebaran di `CSSE6400-audit-30-MCQ.md`:

1. P1 Introduction: definisi software architecture, level of design (system, software, detailed), functional dan non-functional requirements, akibat arsitektur terlalu sederhana atau terlalu rumit.
2. P2 Layered: lima prinsip layered, layer isolation, downward dependency, upward notification, peran PCBMER (Presentation, Controller, Bean, Mediator, Entity, Resource), dan pembagian tier pada diagram J2EE.
3. P3 Architectural Patterns: beda architecture dan design, sifat strategic dan long-term, broker pattern, MVC, serta pengertian pattern sebagai solusi umum yang belum berupa kode.
4. P4 Security: CIA, symmetric dan asymmetric encryption, salted hash, failover, empat prinsip secure software design, small TCB, dan Top 10 design flaws.
5. P5 Containers: image, container, engine, registry, timeline Linux namespaces, VM versus container, flag `docker build`, `docker run`, `docker exec`, serta `docker compose exec`.
6. P6 Infrastructure as Code: definisi resources (compute, networking, storage), lima good coding practices dan benefit masing-masing, automation mapping, IaC test pyramid, dan contoh test Terraform.

Bobot soal condong ke P4 dan P5, masing-masing enam dari tiga puluh soal.

## Bahan yang sudah disiapkan

Semua ada di `../uts.local/`.

- `CSSE6400-audit-30-MCQ.md`: 30 soal pilihan ganda beserta kunci, sumber slide per soal, status cakupan awal dan final, matriks audit, dan daftar perbaikan.
- `CSSE6400-cheatsheet-draft.v1.typ`: draf Typst pertama, versi sebelum audit.
- `CSSE6400-cheatsheet-draft.v2.typ`: draf kedua, perbaikan isi sebelum audit.
- `CSSE6400-cheatsheet-final.typ`: sumber Typst final, 2 halaman A4 landscape, 3 kolom.
- `cheatsheet.pdf`: hasil compile cheatsheet final, dipakai saat ujian.
- `merged.pdf`: gabungan 261 halaman slide dosen P1 sampai P6 dalam rasio 16:9.
- `ilovepdf_merged.pdf`: gabungan 280 halaman handout A4 sebagai pendalaman.

## Yang perlu diulang

Lima topik ini tercatat sebagai gap pada audit awal, artinya jawabannya belum lengkap di draf dan baru ditambahkan setelah revisi.

1. Architecture concerns di P1 slide 6. Daftar lengkapnya sempat terlewat, termasuk aesthetic concerns. Soal 4 menguji item yang tidak ada di draf.
2. Komponen Integration Tier pada diagram J2EE P2 slide 22. Draf mencampur istilah handout dengan figur dosen yang berbeda. Soal 9 menanyakan daftar dari diagram.
3. Timeline Linux namespace di P5 slide 33. Draf hanya mencantumkan tahun awal 2002, padahal soal 21 menanyakan tahun Network namespace (2009). Tahun tiap jenis namespace perlu dihafal sebagai pasangan.
4. Flag `docker exec` dan `docker compose exec` di P5 slide 77 dan 101. Soal 22 menyentuh `-t` untuk pseudo-TTY, soal 23 menanyakan `-T` huruf besar untuk menonaktifkannya. Dua flag ini mudah tertukar karena beda satu huruf.
5. HTTP test pada contoh IaC P6 slide 52. Soal 30 menanyakan status 200 dan body berisi `hextris`, sementara draf memotong contohnya. Rangkaian `InitAndApply` dan `Destroy` juga perlu dilihat ulang.

Satu catatan dari audit: angka "30 Ya" hanya berlaku untuk sampel 30 soal itu, bukan jaminan cakupan seluruh UTS.
