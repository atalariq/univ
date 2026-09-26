# PDPL Pertemuan 6 - User Interface Development

> Written in chronological order based on what speaker said during class.

## Atomic Design

1. Atoms
2. Molecules
3. Organisms
4. Template / Wireframe (Low Fidelity)
5. Screen/Page (High Fidelity)

## Design System

- Wajib ada untuk proyek besar (melibatkan banyak orang) seperti _superapp_ semacam Gojek, Google, Apple, Facebook, dsb.
- Untuk level entry, biasa disebut **Component Library**
- Why?
  Tim butuh kontrak/kesepakatan (**guideline**) bersama agar tampilan **konsisten**
  Efeknya:
  - meminimalisir **bottleneck** -> workflow lebih efisien -> kerjaan cepat selesai
  - designer & programmer bisa kerja secara parallel
- Kalau udah ada Design System, designer kerjaannya cuma perlu iterasi Wireframe ke Stakeholder
- Q: Kenapa ada tech company yang membuka design system (open to public)?
  A: Memungkinkan pengembangan aplikasi pihak ke tiga
     Contohnya Google dengan Material Design-nya[^m3], Apple dengan Human Interface Guideline[^hig], dsb.

## AI Usage

### Principle

Desginer menentukan:
- Hal yg dibutuhkan pengguna
- Masalah yang paling layak untuk diselesaikan
- Alur/Flow desain yg masuk akal
- Alur alternative di luar dugaan
- Menilai desain benar-benar berfungsi dengan baik di dunia nyata

### Best Practice

1. Merancang `User Persona`                                           | 80-20 (Human to AI ratio)
2. Merancang draft `BRD`                                              | 20-80
3. Merancang draft `Informational Architecture / User Flow / SItemap` | 50-50
4. Merancang draft `Wireframe`                                        | 50-50
5. Merancang draft `UI`                                               | 30-70

Poin 1-4 wajib dilampirkan untuk nge-prompt[^prompt].

Struktur prompt:
1. Context -> Yang harus diperbuat/diperkaya
2. Tasks

## Question to Ask

- Sejak AI masuk ke workflow bapak, bagian mana yang terasa lebih ringan, dan adakah bagian yang bapak rasa hilang atau berkurang maknanya?
- Waktu bapak belajar dulu, apa yang paling berpengaruh membentuk taste desain bapak?
- Dalam proyek nyata, keputusan desain apa yang tidak pernah bapak serahkan ke AI?
- Seperti apa portofolio junior yang menarik perhatian bapak sekarang, ketika semua orang bisa generate UI yang terlihat rapi?

<!-- Footnotes -->
[^m3]: https://m3.material.io/
[^hig]: https://developer.apple.com/design/human-interface-guidelines
[^prompt]: https://drive.google.com/drive/folders/1O92AV_751MEgQvRCrvJ1X5saPqAcsIB_
