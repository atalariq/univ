# Sistem Katalog Souvenir — Citra Production

**Project Context (Source of Truth)**

Status: `draft` | Updated: 2026-09-18 | Owner: BE

---

## 0. Cara Pakai

**Untuk manusia:** file ini kontrak tim. Kalau ada konflik antar dokumen, file ini
menang — KECUALI untuk detail yang dimiliki file lain:

| Detail | Pemilik |
|---|---|
| Tipe kolom, index, constraint | `ERD.dbml` |
| Aliran data antar proses | `DFD-0/1/2-2/2-5.mermaid` |
| Path endpoint, request/response schema | `openapi-specs/*.yaml` |
| Layout & visual | Figma / Hi-Fi |

**Untuk AI agent:** baca seluruh file ini sebelum generate apa pun. Jangan bikin
field, tabel, atau endpoint yang nggak ada dasarnya di §1–§7. Kalau ada gap,
keluarkan sebagai daftar "Assumptions" terpisah di akhir output — jangan
tambahkan diam-diam ke artefak. §8 itu bagian terpenting, bukan bagian buangan.

**Aturan ubah:** setiap perubahan yang menyentuh §2, §5, atau §6 wajib nambah
baris di §7. Jangan edit diam-diam.

---

## 1. Produk

Website katalog untuk Citra Production, usaha keluarga souvenir yang selama ini
promosi lewat mulut ke mulut. Client browse produk, harga, dan portofolio tanpa
perlu akun. Admin kelola seluruh konten lewat CMS. Konsultasi dan pemesanan
terjadi di luar sistem, lewat CTA WhatsApp.

**TIDAK dibangun:** checkout, pembayaran, keranjang, akun client, live chat
in-app, integrasi marketplace/medsos (Instagram & TikTok cuma placeholder link),
multi-bahasa.

Skala: 15–20 produk. Kecil. Jangan overengineer.

## 2. Aktor & Permission

| Aktor | Login | Boleh | Tidak boleh |
|---|---|---|---|
| **Client** | Tidak | Lihat produk & detail, search, filter kategori, lihat portofolio, lihat FAQ `approved`, lihat testimoni `approved`, dukung testimoni, ajukan pertanyaan FAQ, ajukan testimoni, klik CTA WhatsApp | Lihat konten `pending`/`rejected`, lihat harga di luar rentang publik, akses `/admin` |
| **Admin** | Ya | Semua CRUD (produk, kategori, packaging, foto, portofolio), moderasi FAQ & testimoni, input FAQ/testimoni manual, edit konten hero & about, edit kontak & social link, edit profil sendiri | — |

Hanya ada satu level admin. Tidak ada role bertingkat, tidak ada permission matrix.

## 3. Vocabulary

Satu istilah, satu makna. Kode & dokumen pakai istilah kolom kiri.

| Kanonik | Jangan pakai |
|---|---|
| Produk (`product`) | Item, Barang |
| Kategori (`category`) | Tipe, Jenis |
| Packaging (`package`) | Kemasan, Bungkus |
| Foto Produk (`product_photo`) | Galeri, Image |
| Portofolio (`portfolio`) | Karya, Project |
| FAQ (`faq`) | QnA, Tanya Jawab, Pertanyaan |
| Testimoni (`testimony`) | Review, Ulasan, Rating |
| Dukungan (`upvote`) | Like, Thumbs up |
| Konten Situs (`site_content`) | Hero, About, Setting |
| Client | Customer, Pembeli, User |

Bahasa antarmuka: **Indonesia saja**. Nama tabel/kolom/endpoint: **Inggris,
snake_case**.

## 4. Entitas Inti

Satu baris tujuan + relasi. Detail kolom ada di `ERD.dbml`.

| Entitas | Tujuan | Relasi kunci |
|---|---|---|
| `admin` | User CMS | — |
| `category` | Pengelompokan produk untuk filter & navigasi | `has_many` product |
| `package` | Jenis pilihan packaging yang tersedia | M:N ke product |
| `product` | Item katalog | `belongs_to` category, M:N package, `has_many` product_photo |
| `product_package` | Pivot pilihan packaging per produk | — |
| `product_photo` | Foto produk untuk carousel & cover card | `belongs_to` product |
| `portfolio` | Showcase hasil kerja, berdiri sendiri | — |
| `faq` | Pertanyaan + jawaban, dari publik atau input admin | `answered_by` → admin |
| `testimony` | Testimoni, dari publik atau input admin | `has_many` testimony_upvote |
| `testimony_upvote` | Satu dukungan per IP per testimoni | `belongs_to` testimony |
| `site_content` | Teks volatil (hero, about) sebagai key-value | — |
| `contact` | Alamat, telepon, nomor WhatsApp CTA, email | `has_many` contact_link |
| `contact_link` | Link sosial media (placeholder) | `belongs_to` contact |

## 5. Aturan Bisnis

Yang tidak kelihatan dari ERD. Direferensi dari ERD & OpenAPI.

**Produk & katalog**

- **BR-01** Produk baru default `hidden = true` (draft). Admin publish manual.
- **BR-02** Produk tidak pernah dihapus permanen dari sisi publik lewat `hidden`. Hard delete tetap tersedia di CMS untuk salah input.
- **BR-03** Harga ditampilkan sebagai **rentang** `price_min`–`price_max`, bukan angka tunggal. Sesuai RG.
- **BR-04** Satu produk boleh punya **banyak** pilihan packaging (M:N). Boleh juga nol.
- **BR-05** Satu produk punya banyak foto. Tepat satu ditandai `is_primary` sebagai cover di product card. Urutan carousel ikut `sort_order`.
- **BR-06** Setiap foto wajib punya alt text (`image_description`). Diminta eksplisit di RG.
- **BR-07** Kategori yang masih dipakai produk tidak bisa dihapus (restrict). Admin harus pindahkan produknya dulu.
- **BR-08** Produk bisa tanpa kategori (`category_id` nullable) supaya admin bisa simpan draft sebelum kategorinya siap.

**Moderasi (FAQ & Testimoni)**

- **BR-09** FAQ & testimoni punya dua pintu masuk: submit publik dan input manual admin. Dibedakan lewat kolom `source` (`public` | `admin`).
- **BR-10** Submission publik masuk dengan `status = pending`. Input manual admin langsung `status = approved`.
- **BR-11** Publik hanya melihat `status = approved`. `pending` dan `rejected` hanya terlihat di CMS.
- **BR-12** FAQ hanya boleh di-`approved` kalau `answer` sudah terisi. Approve tanpa jawaban = invalid.
- **BR-13** Unpublish = ubah status ke `rejected`. Tidak ada kolom `hidden` terpisah untuk FAQ & testimoni (beda dari produk & portofolio, yang tidak punya alur moderasi).
- **BR-14** Testimoni wajib punya `author_name`. Tanpa atribusi, testimoni tidak punya nilai sebagai social proof.

**Dukungan testimoni**

- **BR-15** Satu IP hanya bisa mendukung satu testimoni satu kali. Dijaga unique constraint `(testimony_id, ip_hash)`, bukan logika aplikasi.
- **BR-16** IP disimpan sebagai hash, bukan plaintext.
- **BR-17** `testimony.upvote_count` adalah cache terdenormalisasi. Sumber kebenaran tetap tabel `testimony_upvote`.
- **BR-18** Dukungan hanya bisa diberikan ke testimoni `approved`.

**Lain-lain**

- **BR-19** CTA WhatsApp membawa konteks produk (nama produk) ke pesan awal.
- **BR-20** Nomor WhatsApp CTA diambil dari `contact.whatsapp_number`, tidak di-hardcode di frontend.
- **BR-21** Teks hero & about disimpan sebagai key-value (`site_content`), bukan kolom bertipe. Alasan di D-04.

## 6. Scope

Kode fitur dari timeline PAD. Dipakai sebagai ID lintas dokumen — tiap tabel di
ERD, tiap endpoint di OpenAPI, tiap screen di Figma menempel ke kode ini.

### In — MVP

| Kode | Fitur | Modul |
|---|---|---|
| PU-01 | Hero Section / Home Page | Public |
| PU-02 | Katalog Produk (+filter & search) | Public |
| PU-03 | Detail Produk (+carousel) | Public |
| PU-04 | Portofolio | Public |
| PU-05 | FAQ (+form pertanyaan) | Public |
| PU-06 | Footer / Kontak (+CTA WhatsApp) | Public |
| AD-01 | Auth Admin (Login CMS) | Admin |
| AD-02 | Dashboard Admin | Admin |
| AD-03 | API Documentation | Dokumentasi |
| MP-01 | Kelola Produk (+multi upload foto) | Manajemen Produk |
| MP-02 | Kelola Kategori | Manajemen Produk |
| MK-01 | Kelola Portofolio, Testimoni | Manajemen Konten |
| MK-02 | Approval FAQ | Manajemen Konten |
| MK-03 | Kelola Footer / Kontak | Manajemen Konten |

Kelola Packaging belum punya kode sendiri — masuk MP-01.
Kelola Hero/About belum punya kode sendiri — masuk MK-03. Lihat Q-05.

### Out

Checkout & pembayaran, akun client, keranjang, live chat in-app, notifikasi
email/push, multi-bahasa, integrasi marketplace, role admin bertingkat,
analytics dashboard, stok/inventory.

### Non-functional

- **Mobile-first.** Mayoritas client akses dari HP. Bukan "responsive juga",
  tapi mobile duluan.
- **Deliverable termasuk Docker image.** Diminta klien di RG. Tanggung jawab BE.
- Bahasa Indonesia saja. Tidak perlu struktur i18n.
- Skala 15–20 produk. Tidak perlu search engine, cache layer, atau pagination berat.

## 7. Decisions Log

| # | Tanggal | Keputusan | Alasan | Dampak |
|---|---|---|---|---|
| D-01 | 2026-09-18 | FAQ tetap pakai alur approval | Diminta eksplisit klien di RG (Kebutuhan Fungsional no.5). FAQ = knowledge base publik, bukan pengganti chat. Chat langsung sudah ada di PU-06 via WhatsApp | BR-09..BR-13 |
| D-02 | 2026-09-18 | Testimoni punya dua pintu masuk (publik + admin manual), sama seperti FAQ | Keputusan PM. Menutup inkonsistensi IA: ada approve/reject di IA Admin tapi tidak ada form submit di IA Customer | `testimony.source`, `testimony.status` |
| D-03 | 2026-09-18 | Produk ↔ packaging jadi M:N lewat pivot | RG menyebut "jenis **pilihan** packaging" (jamak). Dikonfirmasi PM | Tabel `product_package` |
| D-04 | 2026-09-18 | Hero & about disimpan key-value di `site_content`, bukan kolom bertipe | Copywriting paling sering berubah & paling tidak pasti. Key-value = ubah teks tanpa migrasi. Trade-off sadar: kehilangan type safety | `site_content` |
| D-05 | 2026-09-18 | FAQ & testimoni pakai `status` saja, tanpa `hidden` | Dua kolom untuk satu konsep publikasi = sumber bug. Unpublish = set `rejected` | BR-13 |
| D-06 | 2026-09-18 | Semua tabel punya `created_at`/`updated_at` sejak awal | Menambahkan belakangan butuh migrasi + backfill. Murah sekarang | ERD |
| D-07 | 2026-09-18 | Produk & kategori punya `slug` | Tujuan bisnisnya ditemukan orang. URL `/produk/plakat-akrilik` bukan `/produk/17` | ERD, OpenAPI |

## 8. Open Questions

| # | Pertanyaan | Blocking | Owner | Asumsi yang dipakai sekarang |
|---|---|---|---|---|
| Q-01 | Form ajukan testimoni belum ada di IA Customer. Perlu ditambahkan UX | Tidak (BE jalan duluan) | UI/UX | Form ada, field: nama, konteks/instansi (opsional), isi testimoni |
| Q-02 | Satu entri portofolio: satu foto atau banyak? | Tidak | UI/UX | Satu foto (`file_uri` tunggal). Kalau jadi banyak, pola ikut `product_photo` |
| Q-03 | Fitur dukung/thumbs up testimoni benar-benar dipakai? Nilainya kecil untuk katalog UMKM | Tidak | PM | Dipertahankan, 1 IP = 1 dukungan |
| Q-04 | Batas panjang pertanyaan FAQ dari publik | Tidak | PM | 500 karakter |
| Q-05 | Kelola hero & about belum punya kode fitur di timeline | Tidak | PM | Masuk MK-03 |
| Q-06 | Apakah admin boleh edit isi pertanyaan FAQ dari publik (perbaiki typo) atau hanya menjawab? | Tidak | PM | Boleh edit |
| Q-07 | Stack final & Docker image: siapa yang setup CI/registry? | Tidak (belum) | Tim | BE setup Dockerfile + compose, sisanya nanti |
| Q-08 | Data produk dari klien (15–20 item) belum diterima | Ya, untuk seeding | PM ke PO | Seed pakai dummy dulu |

---

## Agent Brief

Instruksi khusus untuk AI coding agent yang diminta generate artefak dari file ini.

### Generate / revisi ERD

1. Baca §4 **dan** §5. Banyak kolom (`status`, `source`, `is_primary`, `sort_order`, `slug`) sumbernya dari §5, bukan §4.
2. Cross-check ke Hi-Fi kalau tersedia. Field yang kelihatan di UI (badge, urutan, empty state) sering tidak disebut di teks.
3. Field yang tidak ada dasarnya di §4/§5/Hi-Fi → keluarkan sebagai daftar "Assumptions", jangan ditambahkan diam-diam.
4. Wajib: PK, FK, perilaku on-delete, unique constraint, index untuk kolom yang sering difilter.
5. Output: `.dbml` + daftar assumption terpisah dari kode.

### Generate / revisi DFD

1. DFD = **data** flow diagram. Setiap panah wajib berarah dan berlabel nama data. Jangan pakai panah dua arah tanpa label.
2. External entity: Client, Admin, WhatsApp (§2 + BR-19).
3. Data store: turunan §4.
4. Proses: turunan §6, bukan CRUD generik. "Approve FAQ" itu proses sendiri, bukan "Update FAQ".
5. Level 0 = satu proses tunggal + external entity. Level 1 = per modul. Level 2 = dekomposisi satu proses. Jangan lompat level.

### Generate OpenAPI

1. Struktur path ikut modul di §6: `/products`, `/categories`, `/portfolios`, `/faqs`, `/testimonies`, `/contact`, `/site-content`, dan `/admin/*` untuk CMS.
2. Auth: endpoint di bawah aktor Admin (§2) butuh Bearer. Endpoint di bawah Client public, no-auth.
3. Response schema konsisten dengan `ERD.dbml`. Kalau ERD belum ada di sesi ini, minta dulu — jangan mengarang shape response.
4. Nilai enum (`status`, `source`) ambil dari §5. Jangan menebak.
5. Endpoint publik **tidak boleh** mengembalikan field internal: `status`, `source`, `hidden`, `ip_hash`, `password_hash`, `answered_by`.
6. Tandai endpoint yang perilakunya masih di §8 dengan komentar `# PENDING: lihat Q-0n`.
7. Tiap operation kasih `operationId` dan `tags` sesuai kode fitur §6 (misal `tags: [PU-02]`).

### Prompt siap pakai

```text
Baca PROJECT-CONTEXT.md dan ERD.dbml di root proyek ini.
Generate openapi.yaml (OpenAPI 3.1) untuk seluruh fitur di section 6.
Ikuti Agent Brief bagian "Generate OpenAPI".
Untuk hal yang tidak ada dasarnya di context, JANGAN mengarang —
keluarkan sebagai daftar "Assumptions" terpisah di akhir supaya saya review.
```
