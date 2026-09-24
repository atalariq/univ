# Kuliah

Repositori materi perkuliahan [Software Engineering TRPL](https://trpl.sv.ugm.ac.id/) UGM. Berisi slide dosen, catatan pribadi, tugas, laporan praktikum, bank soal, dan referensi — diorganisasi per mata kuliah, bukan per semester.

> **Language Disclaimer**: Konten di repositori ini campur Bahasa Indonesia dan Inggris. Gue nulis pakai bahasa yang paling enak buat mencerna konsep saat itu.

## Struktur

Setiap folder _top-level_ merepresentasikan satu mata kuliah dengan pola penamaan:

```
<singkatan>-<nama-mata-kuliah-dalam-kebab-case>/
```

Contoh:

```
pbo-pemrograman-berorientasi-objek/
aasd-analisis-algoritma-dan-struktur-data/
ppw1-praktikum-pemrograman-web-1/
```

### Kenapa bukan per semester?

- Banyak mata kuliah saling terkait lintas semester (misalnya Basis Data teori dan praktikum).
- Lebih mudah mencari semua materi satu topik dalam satu tempat.
- Semester bisa berubah, materi tetap relevan.

## Konvensi Penamaan

### Folder

| Pola | Contoh Baik | Contoh Buruk |
|------|-------------|--------------|
| `singkatan-nama-kebab-case/` | `pbo-pemrograman-berorientasi-objek/` | `Pemrograman_Berorientasi_Objek/` |
| Subfolder: `p01-nama/` untuk materi berurutan | `p01-pengantar/` | `P1-Pengantar/` |

### File

| Pola | Contoh Baik | Contoh Buruk |
|------|-------------|--------------|
| `##-nama-topik.ext` (materi berurutan) | `01-pengantar-oop.pdf` | `1. Introduction to OOP.pdf` |
| `yyyy-mm-dd-nama.ext` (berbasis tanggal) | `2025-06-07-normalisasi.pdf` | `20250607 - Normalization.pdf` |
| `p##-nama.ext` (slide dari dosen) | `p01-pengantar-k3.pptx` | `P1 - Pengantar K3.pptx` |
| `nama.local.ext` (file lokal/rekaman) | `rekaman-kuliah.local.mp4` | `Rekaman Kuliah.local.mp4` |
| `nama.private.ext` (buku referensi pribadi) | `buku-aljabar.private.pdf` | `Elementary Linear Algebra...private.pdf` |

### Aturan umum

- **lowercase** — semua nama file dan folder
- **kebab-case** — tanda hubung (`-`) untuk spasi
- **tanpa spasi** — ganti dengan `-`
- **tanpa tanda kurung** — hapus `()` dari nama
- **prefix numerik zero-padded** — `01`, `02`, ..., `10`, `11` (bukan `1`, `2`)
- **ISO 8601 untuk tanggal** — `yyyy-mm-dd`
- **ekstensi lowercase** — `.pdf`, bukan `.PDF`
- **preserve judul asli** — untuk buku/referensi pihak ketiga, pertahankan makna judul
- **underscore hanya untuk ekosistem** — `snake_case` dipakai khusus di file code ecosystem (Python, SQL, dsb)

## Daftar Mata Kuliah

| Singkatan | Folder | Nama |
|-----------|--------|------|
| AASD | `aasd-analisis-algoritma-dan-struktur-data/` | Analisis Algoritma dan Struktur Data |
| ALPRO | `alpro-algoritma-dan-pemrograman/` | Algoritma dan Pemrograman |
| AVM | `avm-aljabar-vektor-dan-matriks/` | Aljabar Vektor dan Matriks |
| — | `bahasa-indonesia/` | Bahasa Indonesia |
| — | `basis-data/` | Basis Data |
| — | `english-1/` | English I |
| — | `english-2/` | English II |
| K3 | `k3-keselamatan-dan-kesehatan-kerja/` | Keselamatan dan Kesehatan Kerja |
| MATDIS | `matdis-matematika-diskrit/` | Matematika Diskrit |
| MATTEK | `mattek-matematika-teknik/` | Matematika Teknik |
| PBO | `pbo-pemrograman-berorientasi-objek/` | Pemrograman Berorientasi Objek |
| PTI | `pti-pengantar-teknologi-informasi/` | Pengantar Teknologi Informasi |
| PBD | `pbd-praktikum-basis-data/` | Praktikum Basis Data |
| PDE | `pde-praktikum-desain-elementer/` | Praktikum Desain Elementer |
| PPBO | `ppbo-praktikum-pemrograman-berorientasi-objek/` | Praktikum PBO |
| PPK | `ppk-praktikum-pemrograman-komputer/` | Praktikum Pemrograman Komputer |
| PPW1 | `ppw1-praktikum-pemrograman-web-1/` | Praktikum Pemrograman Web 1 |
| PSD | `psd-praktikum-struktur-data/` | Praktikum Struktur Data |
| PTIIK | `ptiik-praktikum-teknologi-informasi-dan-instalasi-komputer/` | Praktikum TI dan Instalasi Komputer |
| — | `statistika/` | Statistika |

## License

Dual-license: kode di bawah MIT, catatan pribadi di bawah CC BY-NC-SA 4.0. Lihat `LICENSE` untuk detail.
