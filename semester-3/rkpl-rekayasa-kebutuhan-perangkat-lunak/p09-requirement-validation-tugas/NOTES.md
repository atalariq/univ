# Pertemuan 9: Requirement Validation (Tugas)

Folder ini berisi tugas kelompok, bukan materi kuliah baru. Studi kasusnya sistem booking klinik kampus yang menggantikan antrean kertas, dengan draf requirements v1.0 berisi sepuluh butir CL-01 sampai CL-10 yang sudah dinegosiasikan dengan kepala klinik dan siap divalidasi sebelum desain (hlm. 1). Lima stakeholder dipetakan: kepala klinik sebagai domain expert, resepsionis dan perawat sebagai pengguna harian, mahasiswa dan staf sebagai end-user, divisi IT, serta bagian hukum (hlm. 1).

Pengetahuan organisasi yang menjadi input validasi memuat jam buka Senin sampai Jumat pukul 08.00-16.00 dengan empat dokter, kebijakan bahwa rekam medis hanya boleh dilihat dokter yang menangani, data asuransi yang dikirim sebagai berkas harian tanpa koneksi live, dan standar dokumen yang mewajibkan ID unik, source, serta priority High/Medium/Low pada setiap requirement (hlm. 1). Drafnya sendiri memang dibuat bercacat: CL-02 memakai "user-friendly" yang tidak terukur, CL-01 dan CL-04 duplikat, CL-08 bertabrakan dengan kebijakan rekam medis, CL-09 bertabrakan dengan ketiadaan koneksi live, dan CL-10 memakai "peak hours" tanpa definisi (hlm. 1).

Lima bagian tugasnya berurutan. Bagian A meminta pre-review check terhadap standar dokumen dan keputusan apakah dokumen dikembalikan atau review dilanjutkan. Bagian B meminta review mandiri dengan delapan butir checklist (understandability, redundancy, completeness, ambiguity, consistency, organisation, conformance to standards, traceability), lalu mencatat minimal tujuh masalah dalam problem list tanpa memperbaikinya. Bagian C meminta agreed actions berisi jenis action, stakeholder yang dilibatkan, dan requirement hasil revisi yang testable. Bagian D meminta requirements test untuk minimal tiga requirement hasil revisi dengan lima field, dan Bagian E meminta refleksi tentang biaya penemuan masalah yang terlambat, pilihan prototype versus model analysis untuk CL-10, serta susunan tim reviewer (hlm. 1-3).

Berkas `draft-report.local.md` adalah draf laporan kelompok untuk tugas ini. Isinya sudah memuat Bagian A sampai E, daftar temuan pre-review A-1 sampai A-7, konvensi penandaan angka usulan yang belum dikonfirmasi, lampiran glosarium, matriks keterlacakan, dan daftar pertanyaan terbuka; identitas anggota kelompok masih kosong.

## Poin kunci

- Tugas berperan sebagai tim reviewer, bukan membuat sistem booking (hlm. 1).
- Input validasi: draf requirements, pengetahuan organisasi, dan standar dokumen (hlm. 1).
- Standar dokumen mewajibkan ID unik, source, dan priority pada tiap requirement (hlm. 1).
- Cacat draf meliputi duplikasi CL-01/CL-04, ambiguitas CL-02, dan konflik CL-08 serta CL-09 (hlm. 1).
- Problem list minimal tujuh masalah memakai delapan butir checklist reviewer (hlm. 2).
- Requirements test minimal tiga, masing-masing lima field (hlm. 3).

## Istilah

- Pre-review check: pemeriksaan awal untuk masalah mudah sebelum review penuh.
- Problem list: daftar masalah yang ditemukan tanpa langsung diperbaiki.
- Agreed action: kesepakatan tindakan perbaikan beserta stakeholder yang terlibat.
- Requirements test: skenario uji untuk membuktikan requirement dapat diverifikasi.
- Traceability matrix: tabel yang menghubungkan requirement dengan sumber dan turunannya.
- Domain expert: pihak yang menguasai aturan dan praktik di bidang terkait.

## Sumber

- `case-study.local.pdf`, hlm. 1-3.
- `draft-report.local.md`, draf laporan Bagian A sampai E.
