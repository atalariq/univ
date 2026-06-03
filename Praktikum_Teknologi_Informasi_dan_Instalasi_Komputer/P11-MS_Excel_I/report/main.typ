#let vars = (
  nama: "Atalariq Barra Hadinugraha",
  nim: "25/557554/SV/26192",
  kelas: "B2 TRPL 2025",
  mata-kuliah: "Praktikum Teknologi Informasi dan Instalasi Komputer",
  kode-mata-kuliah: "PTIIK",
  nama-dosen-pengampu: "Imam Fahrurrozi, S.T., M.Cs.",
  no-pertemuan: "11",
  judul-praktikum: "Microsoft Excel",
)

#set page(
  paper: "a4",
  margin: 2.54cm,
)

#set document(
  title: vars.judul-praktikum,
  author: vars.nama,
)

#set text(
  font: "Times New Roman",
  size: 12pt,
)

// #1 Cover
#align(center)[
  #upper(
    text(size: 14pt, weight: "bold")[
      LAPORAN PRAKTIKUM \
      #vars.mata-kuliah  \
      PERTEMUAN #vars.no-pertemuan \
      #vars.judul-praktikum
    ],
  )

  #v(1fr)

  #image(
    "assets/logo-UGM.png",
    width: 6cm,
  )

  #v(1fr)

  Disusun oleh:
  #table(
    columns: 3,
    align: left,
    stroke: none,
    [Nama], [:], [#vars.nama],
    [NIM], [:], [#vars.nim],
    [Kelas], [:], [#vars.kode-mata-kuliah\-#vars.kelas],
    [Dosen Pengampu], [:], [#vars.nama-dosen-pengampu],
  )

  #v(0.5fr)

  #upper(
    text(weight: "bold")[
      PROGRAM STUDI D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK \
      DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA \
      SEKOLAH VOKASI \
      UNIVERSITAS GADJAH MADA \
      YOGYAKARTA \
      2025
    ],
  )
]

#pagebreak()

// #2 Content

#set par(
  spacing: 1.5em,
  leading: 1.0em,
  justify: true,
)

#set par(first-line-indent: (amount: 2em, all: true))

#show outline: it => {
  show heading: set align(center)
  it
}

// Table of Contents
#outline(title: "Daftar Isi")
#pagebreak()

// Table of Image Figures
#set figure(
  supplement: "Gambar",
  numbering: "1.1",
)
#show figure.caption: set text(size: 0.8em)

#outline(title: "Daftar Gambar", target: figure.where(kind: image))
#pagebreak()

#show heading.where(level: 1): set heading(numbering: "1.")
#show heading.where(level: 2): set heading(numbering: "1.1")
#show heading.where(level: 3): set heading(numbering: "1.1.1")
// #set heading(numbering: "1.1")
// #set heading(numbering: "1.1.1.1")
#show heading: set block(below: 1em)

#include "content.typ"

#pagebreak()

// #3 Bibliography/References

#show bibliography: it => {
  show heading: set align(center)
  show heading.where(level: 1): set heading(numbering: none)
  it
}

#bibliography(
  "references.bib",
  title: "Daftar Pustaka",
  style: "ieee",
  full: true,
)
