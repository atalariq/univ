# RKPL - Pertemuan 8 - Requirement Validation

## Basic Requirement Validation

- Requirement Validation: Quality Control of requirement
- Validation vs Verification
  - validation: build right product
    - membandingkan spec dengan tujuan stakeholder/bisnis
    - memastikan software sudah memenuhi ekspektasi
  - verification: build product right
    - cek desain dan implementasi, apakah sesuai dengan spec/plan
    - memastikan tiap 'yields' menghasilkan output yg sesuai
- analysis vs validation
  - analysis: "have we got the right requirements?" / **Raw**
  - validation: "have we got the requirements right?" / **Final Draft**
  - analisis memilih/mengumpulkan konten (dalam hal ini requirement), validasi mengecek dokumen akhir (final draft requirements).
- Apa yang dicek dari validasi:
  - Mengkonfirmasi SRS: Apakah deskripsi sistem yang akan dibuat sudah dapat diterima (acceptable)?
  - Yang dilihat reviewer:
    - Completeness & consistency
    - Follows standard
    - Konflik, memastikan tidak ada yang bentrok (hanya salah satu yg benar).
    - Kesalahan Teknis
    - Ambiguias
- Input: draft SRS; Org/business/team knowledge; Org/business/team standards
- Output: Problem list; Agreed actions for each problem

## Requirements Review

- 6 Tahapan review:
  1. Plan: pilih tim reviewer, waktu, dan tempat;
  2. Distribute: kirim dokumen ke masing-masing reviewer;
  3. Prepare: reviewer baca dokumen dan mencatat masalah;
  4. Meet: mendiskusikan dan menyepakati aksi terhadap tiap masalah;
  5. Follow up: melakukan aksi yg telah disepakati;
  6. Review: memperbarui dokumen, meyepakatinya, dan melakukan review lagi bila diperlukan.
- 4 tipe masalah yg biasa dijumpai beserta 4 aksinya:
  1. `Need Clarification`, ditulis dengan buruk; kurang spesifik/detail -> rewrite dokumen biar lebih jelas
  2. `Missing Information` -> tanyakan stakeholder
  3. `Conflict`, bentrok satu sama lain -> negosiasikan dengan stakeholder
  4. `Unrealistic`, belum bisa dibuat dengan teknologi terkini -> sepakati versi yg lebih realistis.
- Pre-review check: **Masalah-masalah yang mudah dulu**
  - Why? Mahal, butuh banyak waktu untuk melakukan review
  - How? seorang reviwer identifikasi masalah" sepele dahulu, misalnya missing information, typos, etc.
  - Then? fix lalu kirim ke reviewer lain
- Siapa yang masuk ke reviwer? Wajib dimasukkan:
  * domain experts: orang yg paham bisnis/masalah;
  * end-users: orang yg mau menyelesaikan masalah dan tahu bagaimana aplikasi seharusnya berjalan.
- Reviwer checklist:
  * Kemudahan memahami -> apakah gampang dimengerti? pastikan sudah jelas dan ringkas
  * Rendundansi / pengulangan -> jangan sampai mubazir
  * Kelengkapan -> pastikan lengkap dan tidak ada yg kurang
  * Ambiguitas -> pastikan nggak ada salah tafsir
  * Konsistensi -> pastikan nggak ada requirements yg bentrok
  - Organisation -> kelompokkkan requirements yg berkaitan
  - Standards
  - Keterlacakan / Traceability -> pastikan ada UID untuk tiap requirements; link/mention jika saling berkaitan, serta; alasan dibalik adanya tiap requirements (sumbernya mana boy?)

## Validation Techniques

- Teknik validasi
  - Prototyping
  - Model analisis
  - Inspection
  - Requirement testing
- Teknik verifikasi
  - Traceable specs
  - Testing
  - Code inspection
  - Code analysis

... (15:10 - I'm out from the class, continue this note later)

#TODO
