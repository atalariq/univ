#set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm))
#set text(font: "New Computer Modern", size: 11pt, lang: "id")
#set par(justify: true)

#align(center)[
  #text(size: 14pt, weight: "bold")[
    Laporan Repository Submission\
    Praktikum Pemrograman Web 1
  ]
  #v(0.5em)
  #text(size: 11pt)[Pertemuan 13]
]

#v(1.5em)
#line(length: 100%)
#v(0.5em)

= Identitas

#grid(
  columns: (auto, 1fr),
  gutter: 0.5em,
  [*Nama*], [: Atalariq Barra Hadinugraha],
  [*NIM*],  [: 25/557554/SV/26192],
)

#v(1.5em)

= Repository & Deployment

== Pertemuan 1–10

Berisi source code HTML, CSS, JavaScript, Bootstrap, dan jQuery dari pertemuan 1 hingga 10.

#grid(
  columns: (auto, 1fr),
  gutter: 0.5em,
  [*Repository*], [: #link("https://github.com/atalariq/PPW1")[github.com/atalariq/PPW1]],
  [*Live Demo*],  [: #link("https://atalariq.dev/PPW1")[atalariq.dev/PPW1]],
)

#v(1em)

== Pertemuan 11–12

Berisi source code PHP native dengan fitur CRUD mahasiswa menggunakan MySQL 8.

#grid(
  columns: (auto, 1fr),
  gutter: 0.5em,
  [*Repository*], [: #link("https://github.com/atalariq/PPW1-PHP")[github.com/atalariq/PPW1-PHP]],
  [*Live Demo*],  [: —],
)

#v(1.5em)

= Ringkasan Commit

#table(
  columns: (auto, 1fr, auto),
  align: (center, left, center),
  stroke: 0.5pt,
  table.header(
    [*Repo*], [*Deskripsi*], [*Jumlah Commit*],
  ),
  [`PPW1`],     [Source code pertemuan 1–10 (HTML, CSS, JS, Bootstrap, jQuery)], [6],
  [`PPW1-PHP`], [Source code pertemuan 11–12 (PHP native, MySQL, CRUD)],         [5],
  table.cell(colspan: 2)[*Total*], [*11*],
)
