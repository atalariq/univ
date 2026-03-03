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

#let _title-page(
  author,
  id,
  class,
  course,
  course-code,
  lecturer,
  meeting,
  title,
  lang,
) = {
  align(center)[
    #if lang == "id" {
      [
        #upper(
          text(size: 1.5em, weight: "bold")[
            #_const.title-page.title \
            #course \
            PERTEMUAN #meeting \
            #title
          ],
        )
      ]
    }

    #v(1fr)

    #image("assets/logo.png", width: 6cm)

    #v(1fr)

    #if lang == "id" {
      [
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
      ]
    }

    #v(0.5fr)

    #if lang == "id" {
      [
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

#let report(
  author: "<name>",
  id: "<ID>",
  class: "<class-name>",
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
  lang: "id",
  paper: "a4",
  font-size: 12pt,
  font: "New Computer Modern",
  body,
) = {
  set document(author: author, title: title)
  set page(paper: paper, margin: 1in)
  set text(
    font: font,
    size: font-size,
    lang: lang,
    ligatures: false,
  )
  set par(
    spacing: 1.5em,
    leading: 1.0em,
    justify: true,
    first-line-indent: (amount: 0.5in, all: true)
  )

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
      lang,
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

#let img(path, caption: "", width: 10cm) = {
  [
    #figure(
      image(path, width: width),
      caption: caption,
    )
  ]
}

#let code(
  lang: "python",
  caption: "",
  numbering: true,
  show-line-numbers: true,
  code,
) = {
  [
    #figure(
      zebraw(
        numbering: numbering,
        numbering-separator: show-line-numbers,
        code,
      ),
      caption: caption,
      kind: image,
    )
  ]
}

#let tbl(
  columns: auto,
  caption: "",
  align: left,
  stroke: none,
  ..rows
) = {
  let cols = if columns == auto { (auto,) * rows.pos().len() } else { columns }
  [
    #figure(
      table(
        columns: cols,
        align: align,
        stroke: stroke,
        ..rows
      ),
      caption: caption,
    )
  ]
}

#let eq(formula, caption: "", numbered: false) = {
  if numbered {
    [
      #figure(
        math.equation(block: true, numbering: "(1)", formula),
        caption: caption,
      )
    ]
  } else {
    math.equation(block: true, formula)
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
    info: "ℹ️",
    warning: "⚠️",
    error: "❌",
    success: "✅",
  ).at(type)

  block(
    fill: bg-color,
    inset: 12pt,
    radius: 4pt,
    [#icon #text]
  )
}
