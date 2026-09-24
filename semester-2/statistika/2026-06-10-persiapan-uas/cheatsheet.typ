#set document(
  title: "Cheatsheet UAS Statistika Inferensial",
  author: "Atalariq Barra Hadinugraha",
)

#set page(
  paper: "a4",
  flipped: true,
  margin: (x: 0.5cm, y: 0.5cm),
  numbering: none,
)
#set text(font: "Times New Roman", size: 7.5pt, lang: "id")
#set par(justify: false, leading: 0.64em, spacing: 0.32em)
#set list(indent: 0.85em, body-indent: 0.35em, spacing: 0.6em)
#set enum(indent: 0.85em, body-indent: 0.35em, spacing: 0.6em)
#set table(
  stroke: 0.25pt + rgb("#777777"),
  inset: (x: 2.4pt, y: 1.7pt),
  align: left + horizon,
)

#show math.equation: math.display
#show math.equation: set text(size: 7.3pt, font: "New Computer Modern Math")
#show math.equation.where(block: true): it => block(
  width: 100%,
  inset: (x: 2pt, y: 1.8pt),
  above: 1.6pt,
  below: 1.6pt,
  fill: rgb("#f5f5f5"),
  stroke: (left: 1.1pt + black),
  it,
)

#let ink = black
#let blue = black
#let teal = black
#let amber = black
#let red = black
#let pale-blue = white
#let pale-teal = white
#let pale-amber = white
#let pale-red = white

#let side-label(kicker) = block(
  width: 100%,
  inset: (x: 1pt, y: 1.5pt),
  below: 3pt,
  stroke: (bottom: 0.5pt + black),
)[
  #text(size: 8.2pt, weight: "bold")[#kicker]
]

#let section(title, color: blue, fill: pale-blue, body) = block(
  width: 100%,
  breakable: true,
  stroke: 0.15pt + rgb("#777777"),
  inset: 3.6pt,
  fill: white,
  above: 3pt,
  below: 3pt,
)[
  #block(
    width: 100%,
    fill: rgb("#e8e8e8"),
    inset: (x: 3pt, y: 2pt),
    stroke: (bottom: 0.25pt + black),
  )[#text(fill: black, weight: "bold", size: 8pt)[#title]]
  #v(2pt)
  #body
]

#let mini(title, body) = [
  #text(weight: "bold", fill: ink)[#title] #body
]

#let airy-list(..items) = list(
  indent: 0.9em,
  body-indent: 0.45em,
  spacing: 0.38em,
  ..items,
)

#let key(body, color: red) = box(
  fill: rgb("#eeeeee"),
  stroke: 0.15pt + black,
  inset: (x: 2.4pt, y: 2pt),
)[#text(weight: "bold", fill: black)[#body]]

#let dense-table(..args) = table(
  width: 100%,
  text(size: 6.7pt)[#args.pos().join()],
)

#columns(3, gutter: 7pt)[
  #section(
    "A1 • Fondasi probabilitas",
    color: blue,
    fill: pale-blue,
  )[
    - Ruang sampel $Omega$: semua hasil mungkin.
    - Kejadian $A subset.eq Omega$.
    - Variabel acak: $X: Omega arrow RR$.
    - Rentang peluang: $0 <= P(A) <= 1$.

    #mini("Aksioma:")[]
    #airy-list(
      [$P(Omega)=1$ dan $P(A)>=0$.],
      [Jika $A_i$ saling lepas:
        $ P(union_i A_i)=sum_i P(A_i) $
      ],
    )

    #mini("Aturan inti:")[]
    #airy-list(
      [Komplemen: $P(A^c)=1-P(A)$.],
      [Gabungan:
        $ P(A union B)=P(A)+P(B)-P(A inter B) $
      ],
      [Kondisional:
        $ P(A|B)=P(A inter B)/P(B), quad P(B)>0 $
      ],
      [Independen:
        $ P(A inter B)=P(A)P(B) $
      ],
      [Bayes:
        $ P(A|B)=(P(B|A)P(A))/P(B) $
      ],
    )

    #key([*Kata kunci:* AND $arrow inter$; OR $arrow union$; NOT $arrow^c$; GIVEN $arrow |$])
  ]

  #section(
    "A2 • Diskrit vs kontinu",
    color: blue,
    fill: pale-blue,
  )[
    #table(
      columns: (0.55fr, 1fr, 1fr),
      table.header([*Aspek*], [*Diskrit*], [*Kontinu*]),
      [Nilai], [terhitung], [interval],
      [Fungsi], [*PMF* $p(x)$], [*PDF* $f(x)$],
      [Titik], [$P(X=x)>0$], [$P(X=x)=0$],
      [Peluang], [$sum p(x)$], [$integral f(x) dif x$],
    )

    #mini("Syarat sah:")[
      $p(x)>=0, sum_x p(x)=1$ \
      $f(x)>=0, integral_(-oo)^oo f(x) dif x=1$
    ]

    #mini("Interval kontinu:")[
      $P(a<=X<=b)=integral_a^b f(x) dif x$.
      Tanda $<$ atau $<=$ memberi hasil sama.
    ]

    #mini("CDF:")[
      $F(x)=P(X<=x)$. \
      Diskrit: $F(x)=sum_(t<=x)p(t)$. \
      Kontinu: $F(x)=integral_(-oo)^x f(t) dif t$. \
      $P(a<X<=b)=F(b)-F(a)$.
    ]

    #key([*BLACKBOX:* *PMF* = massa; *PDF* = densitas; *CDF* = kumulatif])
  ]

  #section(
    "A3 • Tabel distribusi & momen",
    color: blue,
    fill: pale-blue,
  )[
    #table(
      columns: (0.55fr, 0.65fr, 0.75fr, 0.85fr),
      table.header([$x_i$], [$p_i$], [$x_i p_i$], [$x_i^2 p_i$]),
      [$x_1$], [$p_1$], [$x_1p_1$], [$x_1^2p_1$],
      [$dots$], [$dots$], [$dots$], [$dots$],
      [*Total*], [*1*], [$E[X]$], [$E[X^2]$],
    )

    #mini("Ekspektasi / EV:")[
      $E[X]=sum_i x_i p_i$ atau $integral x f(x) dif x$.
    ]\
    #mini("Linearitas:")[
      $E[a X+b]=a E[X]+b$.
    ]\
    #mini("Varians / VAR:")[
      $"Var"(X)=E[(X-mu)^2]=E[X^2]-E[X]^2$.
    ]\
    #mini("Standar deviasi / SD:")[
      $sigma=sqrt("Var"(X))$; satuan kembali ke satuan $X$.
    ]\
    #mini("Transformasi:")[
      $"Var"(a X+b)=a^2 "Var"(X)$.
    ]\
    #mini("Jika independen:")[
      $"Var"(X+Y)="Var"(X)+"Var"(Y)$.
    ]

    #key([*EV* = pusat; *VAR/SD* = risiko/sebaran. EV sama belum tentu risiko sama.])
  ]

  #section(
    "A3a • Konsep & trik peluang",
    color: blue,
    fill: pale-blue,
  )[
    #airy-list(
      [*Saling lepas:*
        $ A inter B=emptyset arrow P(A inter B)=0 $
      ],
      [*Independen:*
        $ P(A inter B)=P(A)P(B) $
      ],
      [Jika $P(A),P(B)>0$, kejadian saling lepas *tidak* independen.],
      [*Aturan perkalian:*
        $ P(A inter B)=P(A|B)P(B)=P(B|A)P(A) $
      ],
      [*LLN:* $overline(X)$ mendekati $E[X]$ saat pengulangan membesar.],
      [*Notasi:* populasi $mu,sigma$; sampel $overline(x),s$.],
    )
  ]

  #section(
    "A3b • Bayes & probabilitas total",
    color: blue,
    fill: pale-blue,
  )[
    Jika $A_1,dots,A_m$ partisi $Omega$:
    $
      P(B)=sum_i P(B|A_i)P(A_i)
    $
    $
      P(A_j|B)=
      (P(B|A_j)P(A_j))/(sum_i P(B|A_i)P(A_i))
    $
    #mini("Contoh tes:")[
      prevalensi 1%, sensitivitas 90%, false positive 5%.
    ]
    $
      P(+)=0.90(0.01)+0.05(0.99)=0.0585
    $
    $
      P("sakit"|+)=0.009/0.0585 approx bold(0.1538)
    $
    Walau tes positif, peluang sakit hanya *15,38%*: base rate penting.
  ]

  #section(
    "A4 • Contoh tabel: dadu & hadiah",
    color: blue,
    fill: pale-blue,
  )[
    #mini("Dadu adil:")[
      $x in {1,2,3,4,5,6}$, $p(x)=1/6$.
    ]
    $
      E[X]=sum_(x=1)^6 x/6=3.5
    $
    $
      E[X^2]=91/6;quad "Var"(X)=91/6-3.5^2=35/12
    $
    $
      sigma=sqrt(35/12) approx 1.708
    $

    #mini("Permainan hadiah:")[
      Genap $arrow "Rp"10.000$, ganjil $arrow "Rp"20.000$.
    ]
    $
      E[H]=10.000(3/6)+20.000(3/6)=15.000
    $
    *Makna:* rata-rata jangka panjang, bukan hadiah yang pasti diterima.

    #mini("Trik komplemen:")[
      “minimal satu” hampir selalu lebih cepat:
      $P(X>=1)=1-P(X=0)$.
    ]
  ]

  #section(
    "B1 • Pilih keluarga distribusi",
    color: teal,
    fill: pale-teal,
  )[
    #table(
      columns: (0.55fr, 1.35fr),
      table.header([*Model*], [*Kenali prosesnya*]),
      [*Binomial*], [$n$ tetap; 2 hasil; independen; $p$ tetap],
      [*Poisson*], [cacah kejadian per waktu/ruang; laju $lambda$ tetap],
      [*Normal*], [kontinu; simetris; agregasi banyak faktor],
      [Eksponensial], [waktu tunggu antar-kejadian Poisson],
      [Uniform], [semua nilai pada interval sama padat],
    )

    #mini("Decision shortcut:")[
      - “tepat $k$ sukses dari $n$” $arrow$ *BIN*.
      - “$k$ kejadian per jam/meter” $arrow$ *POI*.
      - “tinggi/nilai/error kontinu” $arrow$ *NORM*.
      - “berapa lama menunggu” $arrow$ *EXP*.
    ]

    #key([*Jangan otomatis Normal.* Cek histogram/Q-Q plot dan proses pembentuk data.])
  ]

  #colbreak()

  #section(
    "B2 • Binomial",
    color: teal,
    fill: pale-teal,
  )[
    $X tilde "Bin"(n,p), quad q=1-p$
    $
      P(X=k)=binom(n, k)p^k q^(n-k)
    $
    $
      binom(n, k)=n!/(k!(n-k)!)
    $
    $
      E[X]=n p, quad "Var"(X)=n p q, quad sigma=sqrt(n p q)
    $

    #mini("Bahasa soal:")[
      - tepat $k$: $P(X=k)$
      - paling banyak $k$: $P(X<=k)$
      - paling sedikit $k$: $P(X>=k)$
      - lebih dari $k$: $P(X>k)=1-P(X<=k)$
    ]

    #mini([Contoh latihan: cacat 5%, $n=20$, tepat 2.])[
      $
        P(X=2)=binom(20, 2)(0.05)^2(0.95)^18
      $
      $
        =190(0.0025)(0.3972) approx bold(0.1887)
      $
      Jadi peluang $approx$ *18,87%*.
    ]

    #mini("Aproksimasi:")[
      Binomial $approx$ Poisson jika $n$ besar, $p$ kecil, $lambda=n p$.
    ]
  ]

  #section(
    "B3 • Poisson",
    color: teal,
    fill: pale-teal,
  )[
    $X tilde "Pois"(lambda)$
    $
      P(X=k)=(lambda^k e^(-lambda))/(k!),quad k=0,1,dots
    $
    $
      E[X]="Var"(X)=lambda, quad sigma=sqrt(lambda)
    $
    #mini("Skala interval:")[
      Jika laju 4/jam, maka 30 menit $lambda=2$; 2 jam $lambda=8$.
    ] \
    #mini("Contoh latihan: 4 panggilan/jam, tepat 6.")[
      $
        P(X=6)=(4^6 e^(-4))/(6!)
      $
      $
        =(4096(0.01832))/720 approx bold(0.1042)
      $
      Jadi peluang $approx$ *10,42%*.
    ]
    \
    #mini("Cek kecocokan:")[
      Poisson ideal: mean $approx$ varians. Jika varians jauh lebih besar dari mean:
      *overdispersi*; pertimbangkan Binomial Negatif.
    ]
  ]

  #section(
    "B4 • Normal, Z-score, tabel Z",
    color: teal,
    fill: pale-teal,
  )[
    $X tilde cal(N)(mu,sigma^2)$
    $
      f(x)=1/(sigma sqrt(2pi)) exp(-((x-mu)^2)/(2sigma^2))
    $
    *Simetris:* mean = median = modus = $mu$.

    #key(
      [Aturan empiris: *68%* di $mu plus.minus sigma$; *95%* di $mu plus.minus 2sigma$; *99,7%* di $mu plus.minus 3sigma$.],
      color: teal,
    )

    #mini("Standardisasi:")[
      $Z=(X-mu)/sigma tilde cal(N)(0,1)$; balik: $x=mu+z sigma$.
    ]

    #mini([Baca tabel CDF $Phi(z)=P(Z<=z)$:])[
      $P(Z>z)=1-Phi(z)$ \
      $P(a<Z<b)=Phi(b)-Phi(a)$ \
      Simetri: $Phi(-z)=1-Phi(z)$.
    ]

    #mini("Patokan:")[
      $z=0 arrow$ mean; $z>0 arrow$ di atas mean; $|z|>2 arrow$ tidak biasa;
      $|z|>3 arrow$ outlier potensial.
    ]

    #mini([Contoh latihan: $mu=70$, $sigma=10$, $x=90$.])[
      $z=(90-70)/10=bold(2)$.
      $Phi(2) approx bold(0.9772)$: nilai lebih tinggi dari sekitar *97,72%*
      peserta; sekitar *2,28%* di atasnya.
    ]

    #mini("Batas 10% teratas:")[
      $z_(0.90)=1.2816$; jika $mu=75,sigma=10$:
      $x=75+1.2816(10)=bold(87.82)$.
    ]
    #mini("Nilai kritis dua sisi:")[
      90% $arrow 1.645$; 95% $arrow 1.96$; 99% $arrow 2.576$.
    ]
  ]

  #section(
    "B5 • Mengapa Normal penting & AI/ML",
    color: teal,
    fill: pale-teal,
  )[
    #mini("Normal penting karena:")[
      *CLT* menormalkan distribusi rata-rata sampel; banyak fenomena adalah
      agregasi faktor kecil; Normal mendasari interval, uji $t/F$, dan regresi.
    ]
    #mini("Probabilitas dalam AI/ML:")[
      Naive Bayes dan regresi logistik memakai probabilitas kelas;
      Z-score menyetarakan skala; distribusi prediktif mengukur ketidakpastian.
    ]
  ]

]

#pagebreak()

#columns(3, gutter: 7pt)[
  #section(
    "C1 • Peta konsep regresi",
    color: amber,
    fill: pale-amber,
  )[
    - $Y$: dependen/respons; ingin dijelaskan atau diprediksi.
    - $X$: independen/prediktor; input penjelas.
    - $epsilon$: error populasi; $e_i=y_i-hat(y)_i$: residual sampel.
    - Tujuan: *deskripsi, prediksi, eksplanasi, kontrol*.

    $
      Y=f(X_1,dots,X_p)+epsilon,quad E[epsilon|X]=0
    $
    $
      y_i=hat(y)_i+e_i
    $

    #mini("Korelasi:")[
      $r=("Cov"(X,Y))/(sigma_X sigma_Y)$, $-1<=r<=1$.
      Simetris; hanya kekuatan hubungan linear.
    ]
    #mini("Regresi:")[
      Asimetris; membentuk $hat(Y)=f(X)$ untuk prediksi/estimasi.
    ]
    #key([*Korelasi $!=$ kausalitas.* Waspadai confounder, reverse causation, kebetulan.], color: red)
  ]

  #section(
    "C2 • Regresi linear sederhana",
    color: amber,
    fill: pale-amber,
  )[
    $
      Y_i=a+b X_i+epsilon_i
    $
    $
      hat(Y)_i=a+b X_i
    $
    #mini([Intercept $a$:])[
      prediksi $Y$ saat $X=0$; jangan paksa interpretasi jika 0 di luar konteks.
    ]\
    #mini([Slope $b$:])[
      perubahan rata-rata $Y$ untuk kenaikan *1 unit* $X$.
      Tanda $+$ naik; tanda $-$ turun.
    ]\
    #mini("Residual:")[
      $e_i=Y_i-hat(Y)_i$. Positif: aktual di atas prediksi.
    ]\
    #mini("OLS:")[
      pilih $a,b$ yang meminimalkan
      $"SSE"=sum_i(Y_i-a-b X_i)^2$.
    ]\
    #mini("Bahaya:")[
      Prediksi di luar $[min(X),max(X)]$ = *ekstrapolasi*; pola linear bisa gagal.
    ]
  ]

  #section(
    "C3 • Rumus koefisien OLS",
    color: amber,
    fill: pale-amber,
  )[
    $
      b=(sum_i(X_i-overline(X))(Y_i-overline(Y)))/
      (sum_i(X_i-overline(X))^2)
    $
    $
      a=overline(Y)-b overline(X)
    $
    Garis OLS selalu melalui $(overline(X),overline(Y))$.

    #mini("Bentuk ekuivalen:")[
      $b=("Cov"(X,Y))/("Var"(X))$ untuk definisi pembagi konsisten.
    ]\
    #mini("Prediksi titik:")[
      $hat(y)_0=a+b x_0$.
    ]\
    #mini("Standard error slope:")[
      $"SE"(b)=s/sqrt(sum(X_i-overline(X))^2)$,
      $s^2="SSE"/(n-2)$.
    ]\
    #mini("Uji slope:")[
      $H_0:b=0$; $t=b/"SE"(b)$, df $=n-2$.
    ]
  ]

  #section(
    "C4 • Contoh interpretasi & prediksi",
    color: amber,
    fill: pale-amber,
  )[
    #mini("Model:")[
      $"Nilai"=45+3.5("Jam belajar")$.
    ]
    - *45*: prediksi nilai saat belajar 0 jam.
    - *3,5*: tiap tambahan 1 jam belajar berkaitan dengan kenaikan rata-rata
      *3,5 poin*.
    - Kata aman: “*berkaitan/diprediksi*”, bukan otomatis “menyebabkan”.

    #mini("Prediksi:")[
      Jika $Y=20+5X$, saat $X=8$:
    ]
    $
      hat(Y)=20+5(8)=bold(60)
    $

    #mini("Contoh OLS 5 mahasiswa:")[\
      $overline(X)=3$, $overline(Y)=66$,\
      $sum(X_i-overline(X))(Y_i-overline(Y))=58$,\
      $sum(X_i-overline(X))^2=10$.
    ]
    $
      b=58/10=5.8;quad a=66-5.8(3)=48.6
    $
    Model: $hat(Y)=48.6+5.8X$.
  ]

  #section(
    "C4b • Bank kalimat interpretasi",
    color: amber,
    fill: pale-amber,
  )[
    - *Intercept:* “Saat $X=0$, model memprediksi $Y=a$.”
    - *Slope:* “Setiap $X$ naik 1 unit, rata-rata prediksi $Y$ berubah $b$ unit.”
    - *Residual:* “Aktual lebih tinggi/rendah dari prediksi sebesar $|e_i|$.”
    - *Korelasi:* “$r$ menunjukkan arah dan kekuatan hubungan *linear*.”
    - Hindari kata “menyebabkan” tanpa desain kausal.
  ]

  #section(
    "C5 • Sederhana vs berganda",
    color: amber,
    fill: pale-amber,
  )[
    #mini("Sederhana:")[
      $Y=a+b X+epsilon$; 1 prediktor.
    ]\
    #mini("Berganda:")[
      $Y=beta_0+beta_1 X_1+dots+beta_p X_p+epsilon$.
    ]\
    #mini([Interpretasi $beta_j$:])[
      perubahan rata-rata $Y$ saat $X_j$ naik 1 unit, *semua $X$ lain konstan*
      (*ceteris paribus*).
    ]\
    #mini("Matriks OLS:")[
      $hat(bold(beta))=(bold(X)^T bold(X))^(-1)bold(X)^T bold(Y)$.
    ]\
    #mini("Contoh model IPK:")[
      $"IPK"=beta_0+beta_1 "Jam"+beta_2 "Kehadiran"+beta_3 "Nilai masuk"+epsilon$.
    ]
    Evaluasi: $R^2$, $R_"adj"^2$, RMSE/MAE test, uji $t/F$, diagnostik residual.
  ]

  #section(
    "C6 • Interval & ketidakpastian",
    color: amber,
    fill: pale-amber,
  )[
    #mini("Confidence interval mean:")[
      rentang untuk $E[Y|X=x_0]$.
    ]
    #mini("Prediction interval individu:")[
      rentang untuk satu $Y_"new"|X=x_0$; *selalu lebih lebar*.
    ]
    $
      "PI": hat(y)_0 plus.minus t^*s sqrt(1+1/n+(x_0-overline(X))^2/sum(X_i-overline(X))^2)
    $
    Ketidakpastian minimum dekat $overline(X)$; melebar saat $x_0$ jauh dari
    pusat data.
  ]

  #section(
    "D1 • Dekomposisi & R-squared",
    color: red,
    fill: pale-red,
  )[
    $
      underbrace(sum(Y_i-overline(Y))^2, "SST")
      =
      underbrace(sum(hat(Y)_i-overline(Y))^2, "SSR")
      +
      underbrace(sum(Y_i-hat(Y)_i)^2, "SSE")
    $
    $
      R^2="SSR"/"SST"=1-"SSE"/"SST"
    $
    - $R^2=0$: setara baseline mean.
    - $R^2=1$: fit sempurna pada data tersebut.
    - $R^2=0.85$: *85% variasi $Y$* dijelaskan model; 15% tersisa.

    #mini("Adjusted:")[
      $
        R_"adj"^2=1-
        ("SSE"/(n-p-1))/("SST"/(n-1))
      $
      Menghukum prediktor tambahan yang tidak berguna.
    ]
    #key([$R^2$ tinggi *bukan* bukti kausalitas, asumsi benar, atau prediksi test bagus.], color: red)
  ]

  #section(
    "D2 • BLUE / Gauss-Markov",
    color: red,
    fill: pale-red,
  )[
    *BLUE* = *Best Linear Unbiased Estimator*.
    “Best” = varians minimum di antara estimator linear tak bias.

    #mini("Asumsi inti:")[\
      *L* Linearitas: $E[Y|X]=X beta$. \
      *E* Eksogenitas: $E[epsilon|X]=0$. \
      *H* Homoskedastisitas: $"Var"(epsilon|X)=sigma^2$. \
      *N* No autocorrelation: $"Cov"(epsilon_i,epsilon_j)=0$. \
      *N* No perfect multicollinearity.
    ]
    #key([Mnemonic: *LEHNN*. Normalitas bukan syarat BLUE.], color: red)

    #mini("Tambahan inferensi sampel kecil:")[
      $epsilon_i tilde cal(N)(0,sigma^2)$ untuk uji $t/F$ eksak.
    ]
  ]

  #section(
    "D3 • Pelanggaran & diagnostik",
    color: red,
    fill: pale-red,
  )[
    #table(
      columns: (0.72fr, 1.28fr),
      table.header([*Masalah*], [*Akibat / respons*]),
      [Nonlinear], [bias pola; transformasi/tambah bentuk nonlinear],
      [Endogen], [koefisien bias; perbaiki desain/variabel/IV],
      [Heterosk.], [SE salah; robust SE/transformasi],
      [Autokorelasi], [SE salah; model time-series/Newey-West],
      [Multikolin.], [koefisien labil; buang/gabung/Ridge],
      [Non-normal], [uji kecil-sampel terganggu; bootstrap/robust],
    )

    #mini("Plot cepat:")[
      - residual vs fitted: linearitas + homoskedastisitas
      - Q-Q residual: normalitas
      - residual vs waktu: autokorelasi
      - residual vs leverage: outlier berpengaruh
    ]
    #mini("VIF:")[
      $"VIF"_j=1/(1-R_j^2)$; *VIF > 10* sering dianggap serius.
    ]
  ]

  #section(
    "D4 • Error prediksi",
    color: red,
    fill: pale-red,
  )[
    $
      "MAE"=1/n sum_i |y_i-hat(y)_i|
    $
    $
      "MSE"=1/n sum_i(y_i-hat(y)_i)^2
    $
    $
      "RMSE"=sqrt("MSE")
    $
    - MAE: lebih tahan outlier.
    - RMSE: menghukum error besar; satuan sama dengan $Y$.
    - Bandingkan pada *validation/test*, bukan hanya training.
    - $R_"test"^2<0$: lebih buruk daripada prediksi mean test.
    \
    #mini("Bias-variance:")[
      $"MSE" approx "Bias"^2+"Variance"+sigma^2$.
      Underfit: bias tinggi. Overfit: varians tinggi.
    ]
  ]

  #section(
    "D5 • Overfitting & generalisasi",
    color: red,
    fill: pale-red,
  )[
    *Overfitting:* model menghafal noise training; gagal pada data baru.

    #mini("Tanda:")[
      #airy-list(
        [$"RMSE"_"train" << "RMSE"_"test"$.],
        [$R_"train"^2$ sangat tinggi; $R_"test"^2$ rendah.],
        [Koefisien ekstrem atau tidak stabil.],
        [Validation error naik saat kompleksitas naik.],
        [$R_"adj"^2$ jauh di bawah $R^2$.],
      )
    ]\

    #mini("Cegah:")[
      #airy-list(
        [Train/validation/test split.],
        [$k$-fold cross-validation.],
        [Seleksi fitur berbasis teori; tambah data.],
        [Sederhanakan model; Ridge (L2) atau Lasso (L1).],
      )
    ]

    #key([Model terbaik meminimalkan *error data baru*, bukan training error.], color: red)
  ]

  #section(
    "D6 • Regularisasi & seleksi",
    color: red,
    fill: pale-red,
  )[
    #mini("Ridge / L2:")[
      $"min" "SSE"+lambda sum_j beta_j^2$.
      Menyusutkan koefisien; biasanya tidak menjadi tepat 0.
    ]\
    #mini("Lasso / L1:")[
      $"min" "SSE"+lambda sum_j |beta_j|$.
      Menyusutkan dan dapat menyeleksi fitur ($beta_j=0$).
    ]\
    #mini([Pilih $lambda$:])[
      cross-validation; makin besar $lambda$, model makin sederhana.
    ]\
    #mini("AIC/BIC:")[
      $"AIC"=-2 log L+2 k$; $"BIC"=-2 log L+k log n$.
      Nilai lebih kecil lebih disukai; BIC menghukum kompleksitas lebih berat.
    ]
  ]

  #section(
    "D7 • BLACKBOX menjawab soal",
    color: red,
    fill: pale-red,
  )[
    #mini("Soal hitung")[
      *Diketahui* $arrow$ *Kata kunci/model* $arrow$ *Rumus*
      $arrow$ *Hitung* $arrow$ *Interpretasi*.
    ]\
    #mini("Soal konsep")[
      *Definisi* $arrow$ *Tujuan/pentingnya* $arrow$ *Ciri/rumus*
      $arrow$ *Batasan + contoh*.
    ]
    - Regresi: “setiap $X$ naik *1 unit*, $Y$ diprediksi berubah $b$ unit,
      *ceteris paribus*.”
    - $R^2$: “*persentase variasi* $Y$ dijelaskan model”, bukan akurasi.
    - Asosiasi $!=$ kausalitas; sebut confounder/asumsi bila relevan.
    - Overfitting: bandingkan train dengan validation/test.
    #key([*Sanity:* $0<=P<=1$; SD $>=0$; slope = unit $Y$/unit $X$; bulatkan di akhir.], color: red)
  ]

  // #section(
  //   "D8 • Peta soal dosen 1–22",
  //   color: red,
  //   fill: pale-red,
  // )[
  //   - *1–5:* definisi peluang, diskrit/kontinu, tabel, EV, VAR/SD.
  //   - *6–10:* Binomial, Poisson, Normal, pemilihan distribusi, Z-score.
  //   - *11:* probabilitas pada AI/ML.
  //   - *12–17:* konsep regresi, $X/Y$, korelasi, $a/b$, prediksi.
  //   - *18–22:* $R^2$, asumsi, berganda, rancangan IPK, overfitting.
  //   #key([Semua butir soal dosen memiliki pasangan blok pada lembar ini.])
  // ]

]
