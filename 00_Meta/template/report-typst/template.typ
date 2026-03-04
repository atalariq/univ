#import "@preview/zebraw:0.6.1": zebraw

#let _const = (
  institution: (
    program: "D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK",
    department: "DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA",
    school: "SEKOLAH VOKASI",
    university: "UNIVERSITAS GADJAH MADA",
    city: "YOGYAKARTA",
    year: 2026,
  ),
  title-page: (
    title: "LAPORAN PRAKTIKUM",
    prepared-by: "Disusun oleh:",
  ),
  toc: (
    title: "Daftar Isi",
    figures-title: "Daftar Gambar",
    tables-title: "Daftar Tabel",
  ),
  bibliography: (
    title: "Daftar Pustaka",
    style: "ieee",
  ),
  figure: (
    supplement: "Gambar",
    numbering: "1.1",
    caption-size: 0.8em,
  ),
  table: (
    supplement: "Tabel",
    numbering: "1.1",
    caption-size: 0.8em,
  ),
  fonts: (
    body: "New Computer Modern",
    code: "Fira Code",
  ),
)

#let _line-spacing-map = (
  single: 1.0,
  "1.5": 1.5,
  double: 2.0,
)

#let _page-number-positions = (
  "bottom-center": (alignment: center, margin-bottom: 0.5in),
  "bottom-left": (alignment: left, margin-bottom: 0.5in),
  "bottom-right": (alignment: right, margin-bottom: 0.5in),
  "top-center": (alignment: center, margin-top: 0.5in),
  "top-left": (alignment: left, margin-top: 0.5in),
  "top-right": (alignment: right, margin-top: 0.5in),
)

#let _heading-numbering-presets = (
  "1.": "{1}.",
  "I.": "{1:I}.",
  "A.": "{1:A}.",
  "1.1": "{1}.{2}",
  "1.1.1": "{1}.{2}.{3}",
)

#let _export-font-adjustments = (
  screen: (
    body-weight: "regular",
    code-weight: "regular",
  ),
  print: (
    body-weight: "bold",
    code-weight: "medium",
  ),
)

#let _title-page(
  author,
  id,
  class,
  course,
  course-code,
  lecturer,
  meeting,
  title,
) = {
  align(center)[
    #upper(
      text(size: 1.5em, weight: "bold")[
        #_const.title-page.title \
        #course \
        PERTEMUAN #meeting \
        #title
      ],
    )

    #v(1fr)

    #image("assets/logo.png", width: 6cm)

    #v(1fr)

    #_const.title-page.prepared-by
    #table(
      columns: 3,
      align: left,
      stroke: none,
      [Nama], [:], [#author],
      [NIM], [:], [#id],
      [Kelas], [:], [#course-code\-#class],
      [Dosen Pengampu], [:], [#lecturer],
    )

    #v(0.5fr)

    #upper(
      text(weight: "bold")[
        #_const.institution.program \
        #_const.institution.department \
        #_const.institution.school \
        #_const.institution.university \
        #_const.institution.city \
        #_const.institution.year
      ],
    )
  ]
}

#let _minimal-title-page(
  course,
  meeting,
  title,
) = {
  align(center)[
    #text(1.5em, weight: "bold")[
      Tugas #course \
      Pertemuan #meeting - #title
    ]
  ]
  line(length: 100%)
}

#let _table-of-contents(show-figures, show-tables) = {
  show outline: it => {
    show heading: set align(center)
    it
  }

  outline(title: _const.toc.title)
  pagebreak()

  if show-figures {
    set figure(
      supplement: _const.figure.supplement,
      numbering: _const.figure.numbering,
    )
    show figure.caption: set text(size: _const.figure.caption-size)
    outline(title: _const.toc.figures-title, target: figure.where(kind: image))
    pagebreak()
  }

  if show-tables {
    set figure(
      supplement: _const.table.supplement,
      numbering: _const.table.numbering,
    )
    show figure.caption: set text(size: _const.table.caption-size)
    outline(title: _const.toc.tables-title, target: figure.where(kind: table))
    pagebreak()
  }
}

#let _bibliography-page() = {
  show bibliography: it => {
    show heading: set align(center)
    it
  }

  pagebreak()
  bibliography(
    "references.bib",
    title: _const.bibliography.title,
    style: _const.bibliography.style,
    full: true,
  )
}

#let _page-numbering(
  show-page-number,
  page-number-position,
  paper,
) = {
  if show-page-number {
    let pos = _page-number-positions.at(page-number-position)
    if "margin-top" in pos {
      set page(
        header: align(pos.alignment)[#counter(page).display()],
        header-edge: pos.margin-top,
      )
    } else {
      set page(
        footer: align(pos.alignment)[#counter(page).display()],
        footer-edge: pos.margin-bottom,
      )
    }
  }
}

#let report(
  author: "Atalariq Barra Hadinugraha",
  id: "25/557554/SV/26192",
  class: "B2",
  course: "<course-name>",
  course-code: "<course-code>",
  lecturer: "<lecturer-name>",
  meeting: "<meeting>",
  title: "<report-title>",
  minimal: true,
  show-table-of-content: true,
  show-table-of-figure: true,
  show-table-of-table: true,
  show-bibliography: true,
  paper: "a4",
  font-size: 12pt,
  font: "New Computer Modern",
  code-font: "Fira Code",
  add-indentation-every-paragraph: true,
  line-spacing: 1.5,
  heading-numbering-preset: "1.",
  show-page-number: false,
  page-number-position: "bottom-center",
  export-preset: "screen",
  body,
) = {
  let line-spacing-value = _line-spacing-map.at(str(line-spacing), default: line-spacing)
  let heading-numbering = _heading-numbering-presets.at(heading-numbering-preset, default: heading-numbering-preset)
  let export-adjustments = _export-font-adjustments.at(export-preset, default: _export-font-adjustments.screen)

  set document(author: author, title: title)
  set page(paper: paper, margin: 1in)
  set text(
    font: font,
    size: font-size,
    lang: "id",
    weight: export-adjustments.body-weight,
    ligatures: false,
  )
  let indent-value = if add-indentation-every-paragraph { (amount: 0.5in, all: true) } else { 0pt }
  set par(
    spacing: line-spacing-value * 1em,
    leading: line-spacing-value * 0.8em,
    justify: true,
    first-line-indent: indent-value
  )
  set heading(
    numbering: heading-numbering,
  )

  show heading: it => {
    v(0.5em)
    it
    v(0.5em)
  }

  _page-numbering(show-page-number, page-number-position, paper)

  if not minimal {
    _title-page(
      author,
      id,
      class,
      course,
      course-code,
      lecturer,
      meeting,
      title,
    )
    pagebreak()

    if show-table-of-content {
      _table-of-contents(
        show-table-of-figure,
        show-table-of-table,
      )
    }
  } else {
    _minimal-title-page(
      course,
      meeting,
      title,
    )
  }

  body

  if not minimal and show-bibliography {
    _bibliography-page()
  }
}

#let columns2(gutter: 1cm, ..items) = {
  let items-arr = items.pos()
  let columns-count = items-arr.len()
  columns(
    count: calc.min(columns-count, 2),
    gutter: gutter,
    ..items-arr
  )
}

#let col2(
  left,
  right,
  gutter: 1cm,
) = {
  columns(2, gutter: gutter, left, right)
}

#let img(path, caption: none, width: 10cm, align: center) = {
  if caption == none {
    align(align)[image(path, width: width)]
  } else {
    figure(image(path, width: width), caption: caption)
  }
}

#let code(
  caption: none,
  show-line-numbers: true,
  align: center,
  code,
) = {
  let code-content = zebraw(
    numbering: show-line-numbers,
    numbering-separator: show-line-numbers,
    code,
  )
  
  if caption == none {
    align(align)[code-content]
  } else {
    figure(
      code-content,
      caption: caption,
      kind: image,
    )
  }
}

#let tbl(
  columns: auto,
  caption: none,
  align: left,
  stroke: none,
  ..rows
) = {
  let cols = if columns == auto { (auto,) * rows.pos().len() } else { columns }
  
  if caption == none {
    table(
      columns: cols,
      align: align,
      stroke: stroke,
      ..rows
    )
  } else {
    figure(
      table(
        columns: cols,
        align: align,
        stroke: stroke,
        ..rows
      ),
      caption: caption,
    )
  }
}

#let eq(formula, caption: none, numbered: false, align-item: center) = {
  if numbered {
    if caption == none {
      align(align-item)[math.equation(block: true, numbering: "(1)", formula)]
    } else {
      figure(
        align(align-item)[math.equation(block: true, numbering: "(1)", formula)],
        caption: caption,
      )
    }
  } else {
    align(align-item)[math.equation(block: true, formula)]
  }
}

#let alert(
  type: "info",
  text
) = {
  let bg-color = (
    info: rgb("#e3f2fd"),
    warning: rgb("#fff3e0"),
    error: rgb("#ffebee"),
    success: rgb("#e8f5e9"),
  ).at(type)
  
  let icon = (
    info: "ℹ",
    warning: "⚠",
    error: "✕",
    success: "✓",
  ).at(type)

  block(
    fill: bg-color,
    inset: 12pt,
    radius: 4pt,
    [#icon #text]
  )
}

#let appendix(title: "Lampiran", body) = {
  pagebreak()
  heading(numbering: none, supplement: "Lampiran")[#title]
  body
}

#let appendix-section(title) = {
  heading(numbering: "A.", supplement: "Lampiran")[#title]
}
