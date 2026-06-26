# Praktikum Animasi dan Desain Multimedia — Roadmap Curi Start

## Overview

Mata kuliah ini adalah lab pendamping teori Animasi dan Desain Multimedia. Berdasarkan analisis bank-soal UTS & UAS 2021/2022 (dosen: Yusron Fuadi, M.Sn), **satu-satunya tool yang dipakai adalah Blender** — software 3D open-source untuk modelling, texturing, rendering, dan animasi.

Alur semester kurang lebih:

- Paruh pertama (→ UTS): 3D Modelling + Texturing (individual, submit `.blend` + render)
- Paruh kedua (→ UAS): Proyek Animasi 3D Kelompok (submit `.blend` + video `.mp4`)

> **Verifikasi ke silabus:** Konfirmasi ke dosen/silabus resmi apakah ada topik tambahan di luar Blender (mis. compositing, motion graphics). Bank-soal 2021/2022 hanya memperlihatkan Blender, tapi kurikulum mungkin sudah diupdate.

---

## Prasyarat

- Bisa mengoperasikan komputer dasar (file management, shortcut keyboard)
- Tidak perlu pengalaman 3D sebelumnya — Blender bisa dipelajari dari nol
- RAM minimal 8 GB direkomendasikan untuk render; GPU dedicated membantu tapi bukan wajib
- Download Blender gratis di [blender.org](https://www.blender.org/) (versi LTS direkomendasikan untuk stabilitas)

---

## Topik Inti (urutan belajar)

1. **Instalasi & orientasi antarmuka Blender** — navigasi viewport (orbit, pan, zoom), memahami Object Mode vs Edit Mode, shortcut dasar (G/R/S, Tab, Numpad).

2. **Mesh editing dasar** — extrude (E), loop cut (Ctrl+R), bevel (Ctrl+B), inset (I); fondasi dari semua modelling.

3. **Modelling dari blueprint/referensi** — setup image reference di orthographic viewport (Numpad 1/3/7), atur opacity jadi ~0.5, modelkan objek mengikuti garis referensi.

4. **Modelling lanjutan** — penggunaan modifier (Subdivision Surface, Mirror, Boolean, Array) untuk mempercepat pembuatan objek kompleks.

5. **UV Unwrap & Texturing** — UV unwrap (U), painting material di Shader Editor (Principled BSDF), image texture node, roughness/metallic.

6. **Lighting & world environment** — setup lampu (Point, Sun, Area), HDRI world lighting untuk hasil render realistis.

7. **Render still image** — pilih render engine (EEVEE lebih cepat; Cycles lebih realistis), atur resolusi output, render ke `.jpg`/`.png`.

8. **Animasi dasar** — timeline, insert keyframe (I → Location/Rotation/Scale), Dope Sheet untuk mengatur timing antar keyframe.

9. **Animasi karakter & objek** — penggunaan Graph Editor untuk menghaluskan kurva gerak, NLA Editor untuk menyusun beberapa action.

10. **Render animasi ke video** — output format FFmpeg + H.264, render animation ke `.mp4`.

11. **Pack Resource & workflow pengumpulan** — `File → External Data → Pack Resources` wajib dilakukan sebelum menyimpan dan mengumpulkan file `.blend` agar texture tidak hilang.

---

## Resource Kurasi

### Kanonik

- **Blender Official Tutorials** — [blender.org/support/tutorials/](https://www.blender.org/support/tutorials/)
  `[EN]` `[Gratis]` — Kumpulan tutorial resmi dari tim Blender Foundation, termasuk link ke channel YouTube resmi. Titik awal terpercaya.

- **Blender Manual: Animation & Rigging** — [docs.blender.org/manual/en/latest/animation/index.html](https://docs.blender.org/manual/en/latest/animation/index.html)
  `[EN]` `[Gratis]` — Dokumentasi resmi lengkap untuk semua fitur animasi Blender. Bagus sebagai referensi saat stuck di fitur tertentu.

- **Blender Guru — Donut Tutorial (Andrew Price)** — [youtube.com/@blenderguru](https://www.youtube.com/@blenderguru) | Playlist 4.0: [youtube.com/playlist?list=PLjEaoINr3zgEPv5y--4MKpciLaoQYZB1Z](https://www.youtube.com/playlist?list=PLjEaoINr3zgEPv5y--4MKpciLaoQYZB1Z)
  `[EN]` `[Gratis]` — Serial tutorial paling ikonik untuk pemula Blender. Mencakup modelling, texturing, rendering, dan dasar animasi lewat proyek donut. Versi 5.0 tersedia di [blenderguru.com/posts/blender-donut-v5-tutorial](https://www.blenderguru.com/posts/blender-donut-v5-tutorial).

- **CG Cookie — Blender Basics (Jonathan Lampel)** — [cgcookie.com/courses/blender-basics-an-introduction-to-blender-4-x](https://cgcookie.com/courses/blender-basics-an-introduction-to-blender-4-x)
  `[EN]` `[Gratis]` — Course terstruktur yang bisa di-stream gratis. Lampel dikenal sebagai pengajar yang sangat jelas dan mudah dipahami.

---

### Hidden gems (verified by experts)

- **Blender Secrets (Jan van den Hemel)** — [youtube.com/c/BlenderSecrets](https://www.youtube.com/c/BlenderSecrets)
  `[EN]` `[Gratis]`
  Tutorial 60 detik per topik — singkat tapi padat. Jan mengemas satu trik/teknik per video, sehingga sangat efisien untuk belajar sesuatu yang spesifik (mis. "cara bevel yang bersih", "cara fix n-gon"). Direkomendasikan sebagai "hidden gem" oleh Brandon Funk di [brandon3d.com/best-free-blender-3d-tutorials/](https://brandon3d.com/best-free-blender-3d-tutorials/): _"The best channel for quick tips on almost every area of Blender... his explanations and pacing are perfect."_ Cocok banget untuk troubleshoot masalah kecil di tengah pengerjaan tugas.

- **Ian Hubert — Lazy Tutorials** — [youtube.com/playlist?list=PL4Dq5VyfewIxxjzS34k2NES_PuDUIjRcY](https://www.youtube.com/playlist?list=PL4Dq5VyfewIxxjzS34k2NES_PuDUIjRcY)
  `[EN]` `[Gratis]`
  Tiap video ~1 menit, tapi isinya teknik produksi nyata yang dipakai Ian di film sci-fi-nya sendiri (_Dynamo Dream_) yang dibuat hampir seluruhnya di Blender. Blender Artists community menyebutnya sebagai "Blender tutorial gold" karena Ian punya credit produksi sungguhan di industri 3D. Berguna untuk inspirasi dan shortcut workflow yang tidak diajarkan tutorial biasa.

---

## Fokus Bank-Soal

Berdasarkan UTS dan UAS 2021/2022 (Yusron Fuadi, M.Sn):

**UTS — Tugas berbasis proyek individual:**

- Tugas 1: **3D Modelling dari blueprint** — modelling objek berdasarkan gambar referensi/blueprint; wajib kumpul file `.blend` + render `.jpg/.png`
- Tugas 2: **Texturing** — aplikasi material/texture pada objek hasil modelling; wajib kumpul file `.blend` + render `.jpg/.png`
- Tugas Pengganti UTS: Modelling dengan referensi foto/gambar; wajib kumpul `.blend` + gambar referensi + hasil render

**UAS — Tugas Akhir Kelompok:**

- **Proyek Animasi 3D kelompok** — menghasilkan video animasi `.mp4`; 1 kelompok 1 email
- Komponen individu: PDF penilaian kinerja tiap anggota (skala 1–10 + alasan)

**Poin teknis yang PASTI keluar (berulang di UTS & UAS):**

- Workflow `File → External Data → Pack Resources` sebelum menyimpan `.blend` — ini ditekankan bold di soal keduanya, jangan sampai lupa
- Penamaan file yang tepat: format `[A3DBB_Nama_NIM6digit].rar` untuk UTS
- Render ke format yang benar: `.jpg`/`.png` untuk still, `.mp4` untuk animasi

**Topik yang paling padat di ujian:** Modelling (termasuk dari blueprint), Texturing, dan export/render video animasi.

---

## Estimasi Waktu

| Topik                                  | Estimasi       |
| -------------------------------------- | -------------- |
| Setup & orientasi antarmuka Blender    | 2–3 jam        |
| Mesh editing dasar                     | 4–6 jam        |
| Modelling dari blueprint/referensi     | 5–8 jam        |
| Modifier & modelling lanjutan          | 4–6 jam        |
| UV Unwrap & Texturing                  | 5–8 jam        |
| Lighting & environment                 | 2–4 jam        |
| Rendering still image (output JPG/PNG) | 2–3 jam        |
| Animasi dasar (keyframe, timeline)     | 4–6 jam        |
| Animasi lanjutan (Graph Editor, NLA)   | 3–5 jam        |
| Render animasi ke MP4                  | 2–3 jam        |
| Pack Resource & workflow pengumpulan   | 1 jam          |
| **Total**                              | **~34–53 jam** |

Kalau mau "curi start" sebelum semester mulai, prioritaskan topik 1–5 (interface sampai texturing) — itu yang diuji di UTS. Animasi bisa dipelajari lebih santai di paruh kedua semester.
