// Diagram asli untuk laporan. Digambar dengan elemen Typst agar tidak
// bergantung pada gambar eksternal.

#let ink = rgb("#1f3a5f")
#let soft = rgb("#eef3fb")

#let node(title, sub: none) = block(
  width: 100%,
  inset: (x: 4pt, y: 5pt),
  radius: 3pt,
  fill: soft,
  stroke: 0.6pt + ink,
  align(center)[
    #text(size: 8.5pt, weight: "bold", title)
    #if sub != none {
      linebreak()
      text(size: 7.5pt, fill: luma(70), sub)
    }
  ],
)

#let rarrow = align(center + horizon, text(size: 13pt, fill: ink)[→])
#let darrow = align(center, text(size: 13pt, fill: ink)[↓])

#let request-flow() = grid(
  columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr, auto, 1fr),
  align: horizon,
  node("Browser", sub: "GET /projects?search=laravel"),
  rarrow,
  node("Router", sub: "routes/web.php"),
  rarrow,
  node("Controller", sub: "publicIndex()"),
  rarrow,
  node("Model", sub: "scope + whereHas"),
  rarrow,
  node("Database", sub: "MariaDB"),
)

#let erd() = stack(
  dir: ttb,
  spacing: 6pt,
  grid(
    columns: (1fr, auto, 1fr, auto, 1fr),
    align: horizon,
    node("categories", sub: "id, name, slug"),
    align(center + horizon, text(size: 8pt)[1 ─── N]),
    node("projects", sub: "id, category_id, title, slug"),
    align(center + horizon, text(size: 8pt)[N ─── M]),
    node("technologies", sub: "id, name, slug"),
  ),
  align(center, text(size: 8pt, fill: luma(70))[
    `project_technology`: `project_id` + `technology_id`
  ]),
)

#let query-pipeline() = stack(
  dir: ttb,
  spacing: 3pt,
  node("Project::query()"),
  darrow,
  node("search($keyword)", sub: "LIKE pada title, short_description, description"),
  darrow,
  node("categorySlug($slug) / technologySlug($slug)", sub: "whereHas() pada relasi"),
  darrow,
  node("sorted($sort)", sub: "orderBy() atau orderByDesc()"),
  darrow,
  node("paginate(9)", sub: "links() + withQueryString()"),
)
