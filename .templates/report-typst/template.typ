#import "@preview/zebraw:0.6.1": zebraw

#let CONTENT = (
  cover: (
    title: "LAPORAN PERTEMUAN",
    alt-title: "Tugas",
    meeting: "Pertemuan",
  ),
  reported-by: (
    title: "Disusun Oleh:",
    name: "Nama",
    id: "NIM",
    class: "Kelas",
    lecturer: "Dosen Pengampu",
  ),
  supplement: (
    image: "Gambar",
    table: "Tabel",
    raw: "Kode",
  ),
  toc: "Daftar Isi",
  tof: "Daftar Gambar",
  tot: "Daftar Tabel",
  bibliography: "Daftar Pustaka",
  references: "Referensi",
)

#let report(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "<course-name>",
  course-code: "<course-code>",
  lecturer: "<lecturer-name>",
  meeting: "<meeting>",
  title: "<report-title>",
  year: datetime.today().year(),
  association: (
    program: "D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK",
    department: "DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA",
    faculty: "SEKOLAH VOKASI",
    university: "UNIVERSITAS GADJAH MADA",
    city: "YOGYAKARTA",
  ),
  lang: "id",
  use-cover: true,
  bib: none,
  font: "Times New Roman",
  code-font: "Fira Code",
  font-size: 12pt,
  body,
) = {
  //? Document
  set document(author: author, title: title)
  set page(paper: "a4", margin: 1in)

  //? Font
  set text(font: font, size: font-size, lang: "id", region: "id")
  show raw: set text(font: code-font, size: font-size * 0.8)
  show raw.where(block: false): set text(weight: "semibold")
  show raw.where(block: true): set text(size: font-size * 0.85)

  //? Paragraph
  set par(leading: 0.65em, spacing: 2em, linebreaks: "optimized")

  //? Heading
  show heading: set block(above: 1.4em, below: 1em)
  set heading(numbering: (..nums) => {
    nums = nums.pos()
    if nums.len() == 1 {
      return numbering("A.", nums.first())
    } else if nums.len() == 2 {
      return numbering("1.", nums.last())
    } else if nums.len() == 3 {
      return numbering("1.1", ..nums.slice(1))
    } else if nums.len() == 4 {
      return numbering("1.1.1", ..nums.slice(1))
    } else {
      return numbering("1.", nums.last())
    }
  })

  //? Table
  show figure.where(kind: table): set figure.caption(position: top)

  //? Figure
  set figure(supplement: it => {
    if it.func() == image { [#CONTENT.supplement.image] } else if it.func() == table { [#CONTENT.supplement.table] } else if (
      it.func() == raw
    ) { [#CONTENT.supplement.raw] }
  })

  //? Term List
  show terms: it => {
    let rows = ()
    for item in it.children {
      rows.push([#strong(item.term):])
      rows.push(item.description)
    }
    table(
      columns: (auto, 1fr),
      stroke: none,
      column-gutter: 0.5em,
      row-gutter: 0.4em,
      ..rows,
    )
  }

  //? Bib
  set bibliography(style: "ieee", title: none, full: true)

  //? BEGIN OF CONTENT
  [#metadata(none)#label("report:begin")]

  //? Cover
  if not use-cover {
    // Just a simple header
    align(center)[
      #text(1.25em, weight: "bold")[
        #CONTENT.cover.alt-title #course \
        #CONTENT.cover.meeting #meeting \
        #title
      ]
    ]
    line(length: 100%)
  } else {
    // Full cover
    align(center)[
      #upper(
        text(size: 1.25em, weight: "bold")[
          #CONTENT.cover.title \
          #course \
          #CONTENT.cover.meeting #meeting \
          #title
        ],
      )

      #v(1fr)

      #image("assets/logo.png", width: 6cm)

      #v(1fr)

      #CONTENT.reported-by.title
      #table(
        columns: 3,
        align: left,
        stroke: none,
        [#CONTENT.reported-by.name], [:], [#author],
        [#CONTENT.reported-by.id], [:], [#id],
        [#CONTENT.reported-by.class], [:], [#course-code\-#class],
        [#CONTENT.reported-by.lecturer], [:], [#lecturer],
      )

      #v(0.5fr)

      #v(0.5fr)
      #text(weight: "bold")[
        #upper(association.program) \
        #upper(association.department) \
        #upper(association.faculty) \
        #upper(association.university) \
        #upper(association.city) \
        #year
      ]
    ]
    pagebreak()
  }

  //? Content (./main.typ)
  body

  //? References
  if bib != none {
    let resolved-title = if use-cover { CONTENT.bibliography } else { CONTENT.references }
    if use-cover { pagebreak() }
    align(center)[
      #heading(level: 1, numbering: none)[#resolved-title]
    ]
    set text(size: 0.9em)
    bib
  }

  //? END OF CONTENT
  [#metadata(none)#label("report:end")]
}


//? Internal: Outline wrapper
#let _outline(break-page: true, ..args) = {
  show outline: it => {
    show heading: set align(center)
    it
  }
  set outline.entry(fill: repeat([.], gap: 0.15em))
  show outline.entry: set block(above: 1.1em)
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.inner()),
  )
  outline(..args)
  if break-page { pagebreak() }
}

// ─────────────────────────────────────────────
// Public helpers: outlines
// ─────────────────────────────────────────────

//? Daftar Isi
#let daftar-isi(break-page: true) = context {
  let n = query(heading.where(outlined: true)).len()
  if n > 0 { _outline(break-page: break-page, title: CONTENT.toc) }
}

//? Daftar Gambar
#let daftar-gambar(break-page: true) = context {
  let n = query(figure.where(kind: image, outlined: true)).len()
  if n > 0 { _outline(break-page: break-page, title: CONTENT.tof, target: figure.where(kind: image)) }
}

//? Daftar Tabel
#let daftar-tabel(break-page: true) = context {
  let n = query(figure.where(kind: table, outlined: true)).len()
  if n > 0 { _outline(break-page: break-page, title: CONTENT.tot, target: figure.where(kind: table)) }
}

// ─────────────────────────────────────────────
// Public helpers: content
// ─────────────────────────────────────────────

//? Image
//  width: length or ratio (e.g. 10cm, 80%)
#let img(path, alt: none, caption: none, width: 100%) = {
  let _image = image(path, alt: alt, width: width)
  if caption == none {
    align(center)[#_image]
  } else {
    figure(_image, caption: caption, kind: image, supplement: [#CONTENT.supplement.image])
  }
}


//? Table
//  columns: int  → that many equal (1fr) columns
//           array → used as-is  e.g. (auto, 1fr, 2fr)
//           auto  → passed to table() directly (each col sized to content)
#let tbl(
  caption: none,
  columns: auto,
  align-item: left,
  stroke: 0.5pt,
  ..rows,
) = {
  let cols = if type(columns) == int {
    (1fr,) * columns
  } else {
    columns
  }

  let table-content = table(
    columns: cols,
    align: align-item,
    stroke: stroke,
    ..rows,
  )

  if caption == none {
    table-content
  } else {
    figure(
      table-content,
      caption: caption,
      supplement: [#CONTENT.supplement.table],
      kind: table,
    )
  }
}


//? Code block
#let code(
  caption: none,
  numbering: true,
  indentation: none,
  numbering-offset: 0,
  footer: none,
  header: none,
  lang: false,
  comment-color: luma(240),
  background-color: (luma(245), luma(248), luma(252), luma(248)),
  line-range: (1, none),
  highlight-lines: (),
  raw-code,
) = {
  let block-content = zebraw(
    extend: true,
    footer: footer,
    header: header,
    background-color: background-color,
    comment-color: comment-color,
    highlight-lines: highlight-lines,
    line-range: line-range,
    indentation: indentation,
    numbering: numbering,
    numbering-offset: numbering-offset,
    numbering-separator: indentation == none,
    hanging-indent: indentation != none,
    lang: lang,
    raw-code,
  )

  if caption == none {
    block-content
  } else {
    figure(
      block-content,
      caption: caption,
      supplement: [#CONTENT.supplement.raw],
      kind: raw,
    )
  }
}


//? n-column layout
//  ratio: array of fr/length values e.g. (2fr, 1fr)
//         if none, equal columns
#let col(gutter: 1em, ratio: none, ..contents) = {
  let cols = if ratio != none {
    ratio
  } else {
    (1fr,) * contents.pos().len()
  }
  grid(
    columns: cols,
    gutter: gutter,
    ..contents.pos(),
  )
}
