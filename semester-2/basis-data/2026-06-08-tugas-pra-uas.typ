#set page(paper: "a4", margin: (x: 2cm, y: 2cm))
#set text(font: "Times New Roman", size: 11pt)

#set enum(numbering: "1.a.")
#set table(align: left + horizon)
#show table.cell.where(y: 0): set text(weight: "bold")
#show table.cell.where(x: 0): set text(weight: "bold")

= Soal Review Pra-UAS Basis Data

+ Lakukan normalisasi, sekaligus menyebutkan syarat untuk setiap bentuk normalnya, pada tabel di bawah hingga bentuk normal 3 (3NF)!
  #set table(stroke: 0.5pt + luma(120))
  #table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto),
    fill: (x, y) => if y == 0 { rgb("e0e0e0") } else { none },
    [product_id], [product_name], [quantity], [order_date], [cust_id], [cust_name], [order_id], [Price],
    [s01, s02, s04], [Cheetos, Chiki, Lays], [1, 2, 5], [12-03-21], [c001], [Sarah], [Or001], [500, 400, 500],
    [s03], [JetZ], [10], [22-03-21], [c002], [David], [Or002], [700],
    [s05, s01], [Pringles, Cheetos], [5, 4], [12-04-20], [c001], [Sarah], [Or000], [900, 500]
  )
+ Berdasarkan hasil akhir normalisasi soal no 1, buatlah aljabar relasional untuk:
  + Menampilkan siapa dan nama produk yang dibelinya!
  + Menampilkan siapa dan kapan melakukan pembelian produk!
  + Menampilkan siapa yang pernah membeli Cheetos dan Lays (keduanya)!
  + Menampilkan kapan saja dilakukan pembelian produk JetZ atau Lays!
