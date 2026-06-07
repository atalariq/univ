You are working in my university course materials repository.

Task: rename folders/files to a consistent Linux/macOS-friendly naming convention, then document the convention.

## Goals

1. Rename top-level course folders using this pattern:

```txt
<abbreviation>-<full-course-name-in-kebab-case>/
````

Examples:

```txt
pbo-pemrograman-berorientasi-objek/
aasd-analisis-algoritma-dan-struktur-data/
matdis-matematika-diskrit/
```

2. Rename common folders/files to:

* lowercase
* kebab-case
* no spaces
* no underscores, except when the source is code/data ecosystem-specific
* no random parentheses
* zero-padded numeric prefixes where ordering matters

3. Create or update:

* `AGENTS.md`
* `README.md`

Both files must explain the repository naming convention clearly.

## Important constraints

* Do not delete any file.
* Do not modify file contents unless creating/updating `AGENTS.md` and `README.md`.
* Preserve file extensions exactly.
* Preserve semantic meaning.
* Avoid over-renaming third-party/book/reference files if the original title matters.
* Use `git mv` for all renames when possible.
* Before making changes, produce a rename plan.
* After renaming, show `git status --short`.
* If a rename is ambiguous, ask before changing it.
* Do not touch hidden/system files unless needed.

## Naming convention

### Top-level folders

Use:

```txt
<abbr>-<full-name-kebab-case>/
```

Preferred mappings:

```txt
00_Bank_Soal                                      -> 00-bank-soal
Algoritma_dan_Pemrograman                        -> alpro-algoritma-dan-pemrograman
Aljabar_Vektor_dan_Matrik                        -> avm-aljabar-vektor-dan-matriks
Analisis_Algoritma_dan_Struktur_Data             -> aasd-analisis-algoritma-dan-struktur-data
Bahasa_Indonesia                                 -> bahasa-indonesia
Basis_Data                                       -> basis-data
English_I                                        -> english-1
English_II                                       -> english-2
Keselamatan_dan_Kesehatan_Kerja                  -> k3-keselamatan-dan-kesehatan-kerja
Matematika_Diskrit                               -> matdis-matematika-diskrit
Matematika_Teknik                                -> mattek-matematika-teknik
Pemrograman_Berorientasi_Objek                   -> pbo-pemrograman-berorientasi-objek
Pengantar_Teknologi_informasi                    -> pti-pengantar-teknologi-informasi
Praktikum_Basis_Data                             -> pbd-praktikum-basis-data
Praktikum_Desain_Elementer                       -> pde-praktikum-desain-elementer
Praktikum_Pemrograman_Berorientasi_Objek         -> ppbo-praktikum-pemrograman-berorientasi-objek
Praktikum_Pemrograman_Komputer                   -> ppk-praktikum-pemrograman-komputer
Praktikum_Pemrograman_Web_1                      -> ppw1-praktikum-pemrograman-web-1
Praktikum_Struktur_Data                          -> psd-praktikum-struktur-data
Praktikum_Teknologi_Informasi_dan_Instalasi_Komputer -> ptiik-praktikum-teknologi-informasi-dan-instalasi-komputer
Statistika                                       -> statistika
```

### Ordered lecture/material files

Use:

```txt
01-topic-name.pdf
02-topic-name.pptx
03-topic-name.md
```

Examples:

```txt
1. Introduction to OOP.pdf -> 01-introduction-to-oop.pdf
2. ClassObject.pdf         -> 02-class-object.pdf
P1 - Pengantar K3.pptx     -> p01-pengantar-k3.pptx
P10 - Javascript.pdf       -> p10-javascript.pdf
```

### Date-based files

Use ISO date:

```txt
yyyy-mm-dd-topic-name.ext
```

Examples:

```txt
20250607 - Normalization.pdf -> 2025-06-07-normalization.pdf
20250213-Aljabar_Vektor_Matriks.md -> 2025-02-13-aljabar-vektor-matriks.md
```

### Local/private files

Keep suffixes, but normalize the rest:

```txt
rekaman-kuliah.local.mp4
discrete-mathematics-with-applications.local.pdf
book-title.private.pdf
```

## Documentation requirements

### `README.md`

Rewrite entire file. Current is obsolute from previous structure.

Include:

* what this repository is
* high-level structure
* how course folder names work
* examples of good names
* examples of bad names
* short note that files are organized by course/domain, not primarily by semester

### `AGENTS.md`

Include agent-specific instructions:

* use `git mv` for renames
* do not delete files
* ask before ambiguous renames
* preserve extensions
* preserve third-party titles when useful
* prefer kebab-case
* prefer ISO dates
* do not modify academic content unless explicitly asked
* after changes, report rename summary and `git status --short`

## Workflow

1. Inspect the tree.
2. Produce a rename plan grouped by:
   * top-level folders
   * subfolders
   * files
   * skipped/ambiguous items
3. Apply safe renames with `git mv`.
4. Create/update `README.md`.
5. Create/update `AGENTS.md`.
6. Run:
   ```bash
   git status --short
   ```
7. Report:
   * what changed
   * what was skipped
   * what needs manual decision
