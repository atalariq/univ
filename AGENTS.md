# AGENTS.md — Instructions for AI agents working in this repository

## General rules

- Use `git mv` for all renames; fall back to `mv` only for untracked files.
- **Do not delete any file.** Ever.
- Do not modify academic content (PDFs, slides, source code from dosen) unless explicitly asked.
- Preserve file extensions exactly.
- Preserve semantic meaning when renaming; ask before ambiguous renames.
- Preserve third-party/book/reference titles when the original title carries meaning (e.g., ITB Algeo modules, Oracle Academy PDFs).

## Naming convention

### Folders

- **Top-level**: `<abbr>-<full-name-kebab-case>/` (e.g., `pbo-pemrograman-berorientasi-objek/`).
- **Subfolders**: lowercase, kebab-case, zero-padded numeric prefixes where ordering matters (e.g., `p01-pengantar/`, `semester-1/`).

### Files

- **Ordered materials**: `##-topic-name.ext` — zero-padded (e.g., `01-introduction-to-oop.pdf`, `p01-pengantar-k3.pptx`).
- **Date-based files**: `yyyy-mm-dd-topic-name.ext` — ISO 8601.
- **Local/private files**: keep `.local` or `.private` suffix before extension, normalize the rest (e.g., `rekaman-kuliah.local.mp4`, `buku-aljabar.private.pdf`).

### General conventions

- **lowercase** for all names.
- **kebab-case** (hyphens for spaces).
- **No spaces** in filenames.
- **No parentheses** — remove `()` from names.
- **No underscores** unless the file is in a code ecosystem that requires them (Python, SQL, etc.).
- **Extensions lowercase** — `.pdf` not `.PDF`.
- **ISO dates** for date-based filenames.

## After changes

- Run `git status --short` and report:
  - What was renamed.
  - What was skipped and why.
  - Any items needing manual decision.

## Lokasi kode praktikum

Kode praktikum tidak disimpan di repo ini. Lokasinya dideklarasikan di `AGENTS.md` tiap mata kuliah:

- `semester-3/ppwl-praktikum-pemrograman-web-lanjut/AGENTS.md`
- `semester-3/pppbd-praktikum-pemrograman-perangkat-bergerak-dasar/AGENTS.md`

Baca file itu sebelum menyentuh kode. Jangan menyalin kode ke repo ini.

## Kebijakan repo publik

Repo ini disiapkan untuk dipublikasikan. Materi pihak ketiga, soal ujian, dan dokumen hasil kompilasi tidak boleh masuk git. Aturannya ada di `.gitignore` dan ditegakkan `.pre-commit-config.yaml`. Pasang dengan `pre-commit install` setelah clone.
