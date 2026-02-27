#let report(
  // Metadata
  author: "<name>",
  id: "<ID>",
  class: "<class-name>",
  course: "<course-name>",
  course-code: "<course-code>",
  lecturer: "<lecturer-name>",
  meeting: "<meeting>",
  title: "<report-title>",
  // Document setting
  paper: "a4",
  font: "Times New Roman",
  font-size: 12pt,
  title-font-size: 14pt,
  lang: "id",
  body,
) = {
  set document(author: author, title: title)

  set text(
    font: font,
    size: font-size,
    lang: lang,
    ligatures: false,
  )

  set page(paper: paper, margin: 2.54cm)

  // #1 Cover
  align(center)[
    #if lang == "id" {
      [
        #upper(
          text(size: title-font-size, weight: 500)[
            LAPORAN PRAKTIKUM \
            #course \
            PERTEMUAN #meeting \
            #title
          ],
        )
      ]
    }

    #v(1fr)

    #image(
      "assets/logo.png",
      width: 6cm,
    )

    #v(1fr)

    #if lang == "id" {
      [
        Disusun oleh:
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

    #v(1fr)

    #if lang == "id" {
      [
        #upper(
          text(size: title-font-size, weight: 500)[
            PROGRAM STUDI D-IV TEKNOLOGI REKAYASA PERANGKAT LUNAK \
            DEPARTEMEN TEKNIK ELEKTRO DAN INFORMATIKA \
            SEKOLAH VOKASI \
            UNIVERSITAS GADJAH MADA \
            YOGYAKARTA \
            2026
          ],
        )
      ]
    }
  ]

  pagebreak()

  set par(
    justify: true,
  )

  body
}

#let img(path, caption: "", width: 12cm) = {
  [
    #figure(
      image(path, width: width),
      caption: caption,
    )
  ]
}

