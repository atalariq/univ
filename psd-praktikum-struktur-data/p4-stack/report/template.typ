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
      text(size: 1.25em, weight: "bold")[
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
    #text(1.25em, weight: "bold")[
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
  export-preset: "screen",
  body,
) = {
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
  show raw: set text(font: code-font, weight: export-adjustments.code-weight)
  show raw.where(block: true): set text(font-size * 0.8)
  set par( justify: true)

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

#let col2(
  left,
  right,
  gutter: 1cm,
) = {
  columns(2, gutter: gutter, left, right)
}

#let img(path, caption: none, width: 10cm, align: center) = {
  if caption == none {
    align(align)[#image(path, width: width)]
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
    hanging-indent: true,
    code,
  )
  
  if caption == none {
    code-content
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
      align(align-item)[#math.equation(block: true, numbering: "(1)", formula)]
    } else {
      figure(
        align(align-item)[#math.equation(block: true, numbering: "(1)", formula)],
        caption: caption,
      )
    }
  } else {
    align(align-item)[#math.equation(block: true, formula)]
  }
}

