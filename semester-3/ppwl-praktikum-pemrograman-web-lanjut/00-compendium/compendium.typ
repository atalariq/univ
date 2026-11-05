#import "@atalariq/lab-report:3.0.0": *

#set par(justify: true)
#show: report.with(bib: bibliography("references.yaml"))
#set heading(numbering: "1.1.1")

// Cover
#align(center)[
  #v(2cm)
  #text(size: 1.5em, weight: "bold")[KOMPENDIUM PRAKTIKUM]
  #v(0.4cm)
  #text(size: 1.2em)[PEMROGRAMAN WEB LANJUTAN]
  #v(0.4cm)
  #text(size: 1.4em, weight: "bold")[WEBSITE PORTFOLIO]
  #v(1.2cm)
  #image("assets/logo.png", width: 6cm)
  #v(1.2cm)
  #text(size: 1.05em)[
    Atalariq Barra Hadinugraha \
    25/557554/SV/26192 \
    Kelas B2
  ]
  #v(0.8cm)
  #text(size: 0.95em)[
    Achmad Choirudin Emcha, S.Kom., M.Eng. \
    Praktikum Pemrograman Web Lanjutan
  ]
  #v(1.5cm)
  #text(size: 0.9em)[
    PROGRAM STUDI D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK \
    DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA \
    SEKOLAH VOKASI \
    UNIVERSITAS GADJAH MADA \
    YOGYAKARTA \
    2026
  ]
]

#pagebreak()
#toc(break-page: false)
#tof(break-page: false)
#tot(break-page: false)
#pagebreak()

= Kata Pengantar

Kompendium ini merangkum seluruh instruksi praktikum yang membentuk website
portofolio, dari pertemuan 4 sampai pertemuan terakhir yang tersedia. Setiap bab
memetakan tiga hal: apa yang diminta modul, apa yang diimplementasikan pada repository,
dan bagaimana keduanya dibandingkan. Dokumen ini diperbarui setiap Kamis setelah
praktikum; laporan per pertemuan tetap menjadi bukti rinci untuk pertemuan tersebut.

Cara membaca:

- *Modul* adalah instruksi resmi dengan nomor halaman.
- *Implementasi* adalah kode pada repository beserta commit acuan.
- *Laprak* adalah laporan praktikum pertemuan terkait.
- *Status* menandai selesai, dilewati, atau akan datang.

= Gambaran Project

Website portofolio adalah aplikasi Laravel 13 dengan PHP 8.5, Tailwind 4, dan
MariaDB 11. Aplikasi memiliki halaman publik (home, about, experience, education,
projects) dan area admin `/post` (dashboard, projects, categories, technologies,
skills, profile, styleguide).

== Arsitektur

- `routes/web.php` memisahkan route publik dan area `/post`.
- `routes/auth.php` menangani login, logout, dan reset password.
- Controller publik: `PortfolioController`, `ProjectController`.
- Controller admin: `DashboardController`, `ProjectController`,
  `ProjectGalleryController`, `CategoryController`, `TechnologyController`,
  `SkillController`, `ProfileController`.
- Model: `Project`, `Category`, `Technology`, `Skill`, `ProjectImage`,
  `Experience`, `Education`, `User`.
- View publik, admin, dan auth memakai layout dan komponen UI yang sama.

== Skema data

#tbl(
  caption: [Tabel utama dan relasinya.],
  columns: (1.1fr, 1.8fr, 1.6fr),
  [Tabel], [Kolom penting], [Relasi],
  [`projects`], [`title`, `slug`, `status`, `thumbnail`, `category_id`], [belongsTo category, hasMany images, belongsToMany technologies],
  [`categories`], [`name`, `slug`], [hasMany projects],
  [`technologies`], [`name`, `slug`], [belongsToMany projects],
  [`skills`], [`name`, `level`], [mandiri],
  [`project_images`], [`project_id`, `image`, `caption`, `sort_order`], [belongsTo project],
  [`experiences`], [`role`, `organization`, `period`, `sort_order`], [mandiri],
  [`educations`], [`institution`, `program`, `period`, `details`, `sort_order`], [mandiri],
)

== Route map

#tbl(
  caption: [Route publik dan admin utama.],
  columns: (0.6fr, 1.7fr, 1.7fr),
  [Akses], [URI], [Fungsi],
  [Publik], [`/`, `/about`, `/experience`, `/education`], [Halaman informasi],
  [Publik], [`/projects`, `/projects/{slug}`], [Daftar dan detail project published],
  [Auth], [`/login`, `/logout`], [Masuk dan keluar],
  [Admin], [`/post/dashboard`], [Agregat dan ringkasan],
  [Admin], [`/post/projects`, `/post/categories`, `/post/technologies`, `/post/skills`], [CRUD],
  [Auth], [`/post/profile-saya`], [Profil dan avatar],
)

= Lingkungan dan Workflow

== Tooling

- `mise` mengelola PHP 8.5 dan Node 24.
- Podman/Docker Compose menjalankan MariaDB 11 pada `127.0.0.1:3306`.
- `mise run setup`, `mise run dev`, `mise run test`, `mise run build`.
- `.env` untuk local; `.env.prod` untuk deploy. Tidak ada `.env.local`.
- Host kanonik `http://127.0.0.1:8000`; Vite `127.0.0.1:5173`.

== Alur kerja per pertemuan

1. Baca modul pertemuan dan `TASK.md`.
2. Implementasikan pada branch `pertemuan<x>` dengan commit atomic.
3. Jalankan test, build, dan screenshot.
4. Tulis laporan pertemuan.
5. Perbarui `CHANGELOG.md` dan bab kompendium ini.
6. Push branch dan sinkronkan `main`.

= Design System

Aplikasi memakai token Tailwind 4 dan komponen Blade sendiri.

- Warna: brand, surface, border, text, muted, success, warning, danger.
- Komponen: `x-ui.button`, `x-ui.card`, `x-ui.field`, `x-ui.alert`,
  `x-ui.badge`, `x-ui.page-header`, `x-ui.empty-state`, `x-ui.stat`,
  `x-ui.avatar`, `x-ui.nav-link`, `x-ui.sidebar-link`.
- Layout: publik, admin, auth.
- Tidak ada library komponen, Alpine, atau JavaScript framework.
- Styleguide admin: `/post/styleguide`.

= Pertemuan 4 — Routing dan View

== Kontrak modul

Modul memperkenalkan route, view Blade, dan layout dasar. Halaman yang dibentuk:
home, about, education, dan projects @module_p4.

== Implementasi

- Route dan view publik di `routes/web.php` dan `resources/views/`.
- Commit `6d4bdbd` @repo_p4.

== Modul vs laprak

#tbl(
  caption: [Pertemuan 4: modul dan implementasi.],
  columns: (1.6fr, 2fr, 0.8fr),
  [Modul], [Implementasi], [Status],
  [Route dasar dan view], [Home, about, education, projects], [Selesai],
  [Layout Blade], [`layouts.app` dan komponen UI], [Selesai],
  [Navigasi], [Navbar publik dan menu mobile CSS-only], [Selesai],
)

= Pertemuan 5 — Controller dan Model

== Kontrak modul

Modul memperkenalkan controller, model Eloquent, dan form insert @module_p5.

== Implementasi

- `ProjectController` dan model `Project`.
- Form create project.
- Commit `6fa9cb2` @repo_p5.

== Modul vs laprak

#tbl(
  caption: [Pertemuan 5: modul dan implementasi.],
  columns: (1.6fr, 2fr, 0.8fr),
  [Modul], [Implementasi], [Status],
  [Controller resource], [`ProjectController`], [Selesai],
  [Model dan migration], [`Project`, tabel `projects`], [Selesai],
  [Form insert], [`post.projects.create`], [Selesai],
)

= Pertemuan 6 — CRUD

== Kontrak modul

Modul melengkapi create, read, update, delete, validasi, dan flash message
@module_p6.

== Implementasi

- CRUD project, validasi, konfirmasi hapus.
- Commit `38db3ed` @repo_p6.

== Modul vs laprak

#tbl(
  caption: [Pertemuan 6: modul dan implementasi.],
  columns: (1.6fr, 2fr, 0.8fr),
  [Modul], [Implementasi], [Status],
  [Edit dan update], [`ProjectController@edit/update`], [Selesai],
  [Hapus], [`ProjectController@destroy`], [Selesai],
  [Validasi dan pesan], [Feature test dan flash message], [Selesai],
)

= Pertemuan 7 — Eloquent ORM

== Status

Pertemuan 7 tidak memiliki slot submisi terpisah. Branch `pertemuan7` menunjuk commit
environment yang sama dengan pertemuan 8. Materi Eloquent tetap dipakai pada fitur
relasi di pertemuan 10 @module_p7.

= Pertemuan 8 — Seeder dan Pagination

== Kontrak modul

Modul meminta seeder, data contoh, pagination, pencarian, dan kontrol jumlah data per
halaman @module_p8.

== Implementasi

- `ProjectSeeder`, `ProjectTableSeeder`, scope `search`, `paginate()`.
- Commit `3b0ed22` dan `74a4feb` @repo_p8.

== Modul vs laprak

#tbl(
  caption: [Pertemuan 8: modul dan implementasi.],
  columns: (1.6fr, 2fr, 0.8fr),
  [Modul], [Implementasi], [Status],
  [Seeder], [Dua seeder idempoten], [Selesai],
  [Pagination], [`paginate()` dan `links()`], [Selesai],
  [Pencarian dan per-page], [Scope `search`, `withQueryString()`], [Selesai],
)

= Pertemuan 9 — Authentication dan Middleware

== Kontrak modul

Modul meminta Breeze, session authentication, grup route `/post`, middleware
`EnsureAdmin`, dan latihan registrasi/profil/role @module_p9.

== Implementasi

- Breeze 2.4.2, role, `EnsureAdmin`, registrasi ditutup, profil.
- Commit `cc227ab`; laporan rinci ada di `../p9-authentication/report.pdf`
  @repo_p9.

== Modul vs laprak

#tbl(
  caption: [Pertemuan 9: modul dan implementasi.],
  columns: (1.6fr, 2fr, 0.8fr),
  [Modul], [Implementasi], [Status],
  [Breeze], [Controller/request/view auth], [Selesai],
  [Login/logout], [Session regenerate, invalidate, CSRF], [Selesai],
  [`/post` + `auth`], [Grup route admin], [Selesai],
  [`EnsureAdmin`], [Role `admin`, 403 non-admin], [Selesai],
  [Latihan], [Registrasi 404, navbar, profil, role], [Selesai],
)

= Pertemuan 10 — Dashboard, Upload, dan Gallery

== Kontrak modul

Modul meminta dashboard agregat, komponen card, layout admin, upload thumbnail/avatar,
hapus file lama, gallery multiple upload, disk public, dan penugasan lanjutan
@module_p10.

== Implementasi

- Dashboard, statistik, CRUD taxonomy, upload, gallery, slug detail,
  experience/education.
- Commit fitur `43a5291` … `17a64d1`; laporan rinci ada di
  `../p10-dashboard-upload-gallery/report.pdf` @repo_p10.

== Modul vs laprak

#tbl(
  caption: [Pertemuan 10: modul dan implementasi.],
  columns: (1.7fr, 2fr, 0.8fr),
  [Modul], [Implementasi], [Status],
  [Dashboard agregat], [`DashboardController`, `x-ui.stat`], [Selesai],
  [Layout admin], [Sidebar CSS-only, topbar, menu aktif], [Selesai],
  [Upload thumbnail/avatar], [Disk public, validasi dimensi, hapus file lama], [Selesai],
  [Gallery], [`hasMany`, `images[]`, batas 10, caption PUT], [Selesai],
  [Detail publik], [`/projects/{slug}`, gallery grid, draft 404], [Selesai],
  [Pengayaan], [Published/Draft, Skill Teratas, `withCount`, experience/education], [Selesai],
)

= Roadmap Pertemuan Berikutnya

Bab ini diperbarui setiap Kamis setelah modul baru dibagikan.

#tbl(
  caption: [Rencana pertemuan berikutnya dan status kompendium.],
  columns: (0.7fr, 1.8fr, 1.2fr, 0.8fr),
  [Pertemuan], [Topik], [Rencana tanggal], [Status],
  [11], [Export/Import], [12 November 2026], [Akan datang],
  [12], [Email/Notification/Queue atau REST API], [19 November 2026], [Akan datang],
  [13], [API], [26 November 2026], [Akan datang],
  [14], [Deployment, Docker, CI/CD], [3 Desember 2026], [Akan datang],
)

= Lampiran

== Commit map

#tbl(
  caption: [Commit acuan per pertemuan.],
  columns: (0.8fr, 1.6fr, 2fr),
  [Pertemuan], [Commit], [Isi],
  [4], [`6d4bdbd`], [Routing dan view],
  [5], [`6fa9cb2`], [Model dan controller],
  [6], [`38db3ed`], [CRUD],
  [8], [`3b0ed22`, `74a4feb`], [Seeder, pagination, environment],
  [9], [`cc227ab`], [Breeze, role, middleware],
  [10], [`43a5291` … `17a64d1`], [Dashboard, upload, gallery],
  [Final], [`d78b48b`], [Design system, mise, container],
)

== Status laporan

- Laporan P9: `../p9-authentication/report.pdf`
- Laporan P10: `../p10-dashboard-upload-gallery/report.pdf`
- Laporan P4–P8: folder `../p4-*` sampai `../p8-*`

== Cara memperbarui kompendium

1. Baca modul pertemuan baru dan laporan yang sesuai.
2. Tambahkan bab dengan tabel modul vs implementasi.
3. Perbarui route map, skema, roadmap, dan commit map bila berubah.
4. Perbarui `CHANGELOG.md` kompendium.
5. Jalankan `typst compile compendium.typ compendium.pdf`.
