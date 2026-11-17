// Diagram asli untuk laporan P12. Digambar dengan elemen Typst agar tidak
// bergantung pada gambar eksternal.

#let ink = rgb("#1f3a5f")
#let soft = rgb("#eef3fb")

#let node(title, sub: none) = block(
  width: 100%,
  inset: (x: 5pt, y: 5pt),
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

#let api-flow() = stack(
  dir: ttb,
  spacing: 3pt,
  grid(
    columns: (1fr, auto, 1fr, auto, 1fr),
    align: horizon,
    node("Client", sub: "curl / browser"),
    rarrow,
    node("routes/api.php", sub: "prefix /api"),
    rarrow,
    node("throttle:portfolio-api", sub: "60 request/menit"),
  ),
  darrow,
  grid(
    columns: (1fr, auto, 1fr, auto, 1fr),
    align: horizon,
    node("Api/ProjectController", sub: "index / show"),
    rarrow,
    node("ProjectResource", sub: "field terpilih"),
    rarrow,
    node("JSON", sub: "data, links, meta"),
  ),
)

#let rate-limit() = stack(
  dir: ttb,
  spacing: 3pt,
  node("Request masuk"),
  darrow,
  node("Key: IP client", sub: "atau user id jika login"),
  darrow,
  node("Counter cache + 1", sub: "CACHE_STORE=database"),
  darrow,
  node("Counter > 60?", sub: "fixed window satu menit"),
  darrow,
  grid(
    columns: (1fr, auto, 1fr),
    align: horizon,
    node("Tidak", sub: "lanjut ke controller"),
    align(center + horizon, text(size: 10pt, fill: ink)[→]),
    node("Ya", sub: "HTTP 429 + Retry-After"),
  ),
)

#let resource-shape() = stack(
  dir: ttb,
  spacing: 3pt,
  node("Model Project", sub: "kolom internal + relasi"),
  darrow,
  node("ProjectResource", sub: "title, slug, summary, thumbnail, category, technologies"),
  darrow,
  node("Response JSON", sub: "data[] + links + meta"),
)

#let message-flow() = stack(
  dir: ttb,
  spacing: 3pt,
  grid(
    columns: (1fr, auto, 1fr, auto, 1fr),
    align: horizon,
    node("Form /contact", sub: "GET"),
    rarrow,
    node("Validasi", sub: "nama, email, pesan"),
    rarrow,
    node("contact_messages", sub: "is_read = false"),
  ),
  darrow,
  grid(
    columns: (1fr, auto, 1fr),
    align: horizon,
    node("Admin messages", sub: "index + pagination"),
    rarrow,
    node("Detail pesan", sub: "is_read = true"),
  ),
)
