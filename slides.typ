// Vilnius University deck in the wildcat style.
// The palette and the facet background come from wildcat/beamercolorthemewildcat.sty
// and wildcat/beamerinnerthemewildcat.sty. The deck needs no packages.

#let vu = rgb("#7D2035")
#let vu-deep = rgb("#4B1320")
#let vu-dark = rgb("#641A2A")
#let vu-90 = rgb("#91384F")
#let vu-70 = rgb("#AF667B")
#let vu-50 = rgb("#BE8C9B")
#let vu-40 = rgb("#CDB2B9")
#let vu-30 = rgb("#D9C6CB")
#let vu-20 = rgb("#E6D9DD")
#let vu-10 = rgb("#F2ECEE")
#let gold = rgb("#FFD100")
#let ink = rgb("#1A1A1A")
#let grey = rgb("#6E6E6E")

#let sans = ("TeX Gyre Adventor", "Inter", "DejaVu Sans")
#let display = ("TeX Gyre Heros", "Inter", "DejaVu Sans")

#set page(
  width: 16cm,
  height: 9cm,
  margin: (top: 1.95cm, bottom: 0.8cm, x: 0.95cm),
)
#set text(font: sans, size: 10.5pt, fill: ink)
#set par(leading: 0.62em)
#set list(
  marker: text(fill: vu, size: 0.85em)[•],
  indent: 0.55em,
  body-indent: 0.45em,
  spacing: 0.55em,
)
#set math.equation(numbering: none)

// One content slide: burgundy title, gold rule, page number in the footer.
#let slide(title, body) = page(
  header: block[
    #text(font: display, size: 16pt, fill: vu)[#title]
    #v(-4pt)
    #line(length: 1.2cm, stroke: 1.4pt + gold)
  ],
  footer: align(right, text(size: 7.5pt, fill: grey)[
    #context [#(counter(page).get().first() - 1) / #(counter(page).final().first() - 1)]
  ]),
  body,
)

// Bar for the replication-rate ladder.
#let bar(label, value, shown: none, col: vu) = grid(
  columns: (7.1cm, 5.3cm, 1.1cm),
  align: (left + horizon, left + horizon, right + horizon),
  column-gutter: 0.3em,
  text(size: 8.5pt)[#label],
  rect(width: value * 1%, height: 0.5em, fill: col),
  text(size: 8.5pt)[#if shown == none { str(value) } else { shown }],
)

// Table with a burgundy header and zebra rows.
#let vtable(columns, headers, rows) = table(
  columns: columns,
  inset: (x: 6pt, y: 4pt),
  stroke: none,
  fill: (x, y) => if y == 0 { vu } else if calc.odd(y) { vu-10 } else { white },
  align: (x, y) => if x == 0 { left } else { right },
  table.header(..headers.map(h => text(fill: white, weight: "bold", size: 9pt)[#h])),
  ..rows.map(r => r.map(c => text(size: 9pt)[#c])).flatten(),
)

// Title slide: the facet background from the wildcat theme, white logo, white text.
#page(
  margin: 0pt,
  background: image("assets/facets.svg", width: 100%, height: 100%),
)[
  #place(top + left, dx: 0.95cm, dy: 0.65cm, image("assets/vu-logo-white.png", width: 2.6cm))
  #place(bottom + left, dx: 0.95cm, dy: -0.8cm)[
    #block(width: 10.4cm)[
      #text(font: display, size: 19pt, fill: white)[Is There a Replication Crisis in Finance?]
      #v(0.28cm)
      #text(size: 9.5pt, fill: vu-20)[A critical review of Jensen, Kelly and Pedersen (2023)]
      #v(0.12cm)
      #text(size: 8pt, fill: vu-20)[Journal of Finance 78(5), 2023, pp. 2465 to 2518]
      #v(0.55cm)
      #text(size: 9pt, fill: white)[Aidas Kriščiūnas]
      #v(0.06cm)
      #text(size: 9pt, fill: vu-20)[2026-11-11]
      #v(0.35cm)
      #text(size: 7.5pt, fill: gold)[Applied Microeconomics: Individual Assignment]
    ]
  ]
]

#slide("The claim under test")[
  Several papers argue that financial economics faces a replication crisis.

  #v(0.35em)
  - Most published factors cannot be replicated with the same data. They also fail when the method changes slightly.
  - The factor zoo is the product of searching too many signals without controlling false discoveries.

  #v(0.45em)
  Jensen, Kelly and Pedersen take the question seriously. They report that
  #text(fill: vu, weight: "bold")[over 80 percent] of equity factors replicate.

  #v(0.35em)
  #text(size: 8.5pt, fill: grey)[The two sides agree on the arithmetic. They disagree about which evidence counts and how much weight to give the assumption that most factors are false.]
]

#slide("The two challenges")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.9cm,
    [
      #text(fill: vu, weight: "bold")[Internal validity]

      #v(0.2em)
      - Hou, Xue and Zhang (2020) find that 286 of 447 anomalies are insignificant at 5 percent. At a t-statistic above 3, 380 are insignificant.
      - Mean high-minus-low alpha of 0.26 percent per month.
      - Verdict: the literature is "infested with widespread p-hacking".
    ],
    [
      #text(fill: vu, weight: "bold")[External validity]

      #v(0.2em)
      - Cochrane (2011): a "zoo" of factors.
      - Harvey, Liu and Zhu (2016) set the threshold at a t-statistic above 3, because researchers tried hundreds of factors.
      - Verdict: most claimed findings are likely false.
    ],
  )
]

#slide("Three moves")[
  #text(fill: vu, weight: "bold")[1. A Bayesian model of factor replication.]
  A prior on the true alphas replaces the penalty on each p-value with shrinkage toward zero.

  #v(0.75em)
  #text(fill: vu, weight: "bold")[2. A new global dataset.]
  153 factors in 93 countries, with public construction rules.

  #v(0.75em)
  #text(fill: vu, weight: "bold")[3. A reassessment.]
  Internal validity, then external validity, then the economic value of what survives.
]

#slide("The model")[
  #align(center)[
    $ f_t = alpha + beta r_(m,t) + epsilon_t $

    #v(0.15em)
    $ alpha ~ N(0, tau^2), quad hat(alpha) ~ N(alpha, sigma^2 \/ T) $

    #v(0.15em)
    $ E(alpha | hat(alpha)) = kappa hat(alpha), quad kappa = 1 / (1 + sigma^2 \/ (T tau^2)) $
  ]

  #v(0.6em)
  #text(size: 8.5pt, fill: grey)[Jensen, Kelly and Pedersen use CAPM as the benchmark because it does not absorb size and value. The shrinkage factor $kappa$ lies between zero and one. It increases when the true alphas vary more.]
]

#slide("Why shrinkage beats a p-value penalty")[
  - A correction such as Benjamini-Yekutieli controls false discoveries by inflating every p-value. It costs much statistical power.
  - The Bayesian posterior does the same job with information. It shrinks strongly when true alphas are rare, and it shrinks little when they are common.
  - Empirical Bayes estimates the dispersion of true alphas from the cross-section, either within a region or pooled across all regions.
  - In a simulation of 130 factors, the uncorrected test lets the false discovery rate reach 25 percent. The frequentist correction and the Bayesian correction both keep the rate low. Only the Bayesian correction keeps power.
]

#slide("The data")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.9cm,
    [
      #text(fill: vu, weight: "bold")[Construction]

      #v(0.2em)
      - 202 characteristic signals from Hou, Xue and Zhang
      - 452 portfolios, reduced to 180
      - 15 additional factors from the literature
      - 153 factors in total
    ],
    [
      #text(fill: vu, weight: "bold")[Rules]

      #v(0.2em)
      - Tercile sorts with independent breakpoints
      - At least five stocks per leg, sixty monthly observations
      - Capped value weights
      - Each factor scaled to 10 percent annualized idiosyncratic volatility
    ],
  )

  #v(0.55em)
  #text(size: 8.5pt, fill: grey)[93 markets: 23 developed, 27 emerging, 43 world-only. Alphas are measured against each region's own market.]
]

#slide("The replication ladder")[
  #bar([Hou-Xue-Zhang baseline, raw returns], 35.0, shown: "35.0", col: rgb("#B4B4B4"))
  #bar([This sample, raw returns], 55.6, col: vu-40)
  #bar([Excluding factors insignificant originally], 61.3, col: vu-50)
  #bar([CAPM alpha], 82.4, col: vu)
  #bar([CAPM alpha, Benjamini-Yekutieli], 75.6, col: vu-70)
  #bar([CAPM alpha, empirical Bayes], 82.4, col: vu)
  #bar([Global sample, all specifications], 82.4, col: vu)

  #v(0.7em)
  #text(size: 8pt, fill: grey)[Replication rates in percent. The 82.4 figure means 98 factors significant in both the original and the replication, out of 119 examined.]
]

#slide("Replication across size groups and themes")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.9cm,
    [
      #text(fill: vu, weight: "bold")[By size group]

      #v(0.25em)
      #vtable(
        (1.2fr, 1fr),
        ("Group", "Rate"),
        (
          ("Mega", "77.3"),
          ("Large", "79.8"),
          ("Small", "85.7"),
          ("Micro", "85.7"),
          ("Nano", "68.1"),
        ),
      )
    ],
    [
      #text(fill: vu, weight: "bold")[Thirteen themes]

      #v(0.2em)
      - 11 of 13 replicate in at least half of specifications.
      - The two failures are low leverage and size.
      - 10 of 13 enter the ex-post tangency portfolio with significantly positive weights.
      - The three displaced themes are profitability, investment and size.
    ],
  )

  #v(0.5em)
  #text(size: 8pt, fill: grey)[Replication rates stay above 68 percent in every size group, so the result does not rest on micro-caps.]
]

#slide("Out-of-sample decay is expected")[
  - Global alpha is 0.49 percent per month in sample and 0.26 percent out of sample, a fall of 47 percent. McLean and Pontiff report a fall of 58 percent.
  - 87.4 percent of factors keep a positive alpha in the combined out-of-sample period.
  - The slope of the out-of-sample alpha on the in-sample alpha is 0.57 before the original publication, 0.26 after it, and 0.35 pooled.
  - The model predicts this pattern when authors search the data for strong results. A Bayesian expects the return after publication to fall. The fall alone does not show that the factor is false.

  #v(0.25em)
  #text(size: 8.5pt, fill: grey)[The posterior on mean alpha stayed near 0.4 percent per month from the mid-1980s. Its confidence interval narrowed from 0.16 to 0.10 percent.]
]

#slide("Economic value")[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.9cm,
    [
      #text(fill: vu, weight: "bold")[Sharpe ratios, US, 1972 to 2020]

      #v(0.2em)
      - Market: 0.13 per month
      - Ex-post tangency portfolio: 0.80
      - Pseudo-out-of-sample cross-validation: 0.56
    ],
    [
      #text(fill: vu, weight: "bold")[Factors Bayes accepts]

      #v(0.2em)
      - Benjamini-Yekutieli rejects these factors and empirical Bayes accepts them.
      - 0.35 percent per month in the US, with a t-statistic of 5.1
      - Information ratio of 0.93 in the US and 1.10 outside it
    ],
  )

  #v(0.55em)
  #text(size: 8.5pt, fill: grey)[The 0.80 figure comes from in-sample optimization. The 0.56 figure comes from cross-validation, so 0.56 is the number to trust.]
]

#slide("The main objection")[
  Harvey accepts the arithmetic and disputes the prior. If few anomalies are real, empirical Bayes reports too many discoveries.

  #v(0.65em)
  #align(center)[
    #vtable(
      (1.7fr, 1.2fr, 1.6fr),
      ("Assumed true share", "Bayes FDR", "Benjamini-Hochberg FDR"),
      (
        ("50 percent", "5.7", "2.6"),
        ("25 percent", "14.0", "3.8"),
        ("5 percent", "33.6", "4.5"),
        ("1 percent", "56.4", "4.7"),
      ),
    )
  ]

  #v(0.55em)
  #text(size: 8.5pt, fill: grey)[False discovery rates in percent, holding the target at 5 percent. The frequentist correction stays near target. When the assumed share of true factors is small, the Bayesian false discovery rate is high.]
]

#slide("Three more objections")[
  #text(fill: vu, weight: "bold")[The benchmark choice.]
  Hou, Xue and Zhang test raw returns and get 35 percent. This paper tests CAPM alphas and gets 82. The defense follows from theory. The loosest benchmark also gives the highest rate.

  #v(0.65em)
  #text(fill: vu, weight: "bold")[Decay.]
  Factor returns are 26 percent lower out of sample and 58 percent lower after publication. The authors answer that the model predicts the decay.

  #v(0.65em)
  #text(fill: vu, weight: "bold")[A 2025 test.]
  A recent working paper asks whether a standard six-factor model explains each of this paper's 153 US factors. It explains 132, so 21 remain.
]

#slide("Verdict")[
  #text(fill: vu, weight: "bold")[What the paper settles.]
  Most published factors survive replication once the benchmark is a pricing model and the correction is Bayesian. The sample is the largest built so far.

  #v(0.65em)
  #text(fill: vu, weight: "bold")[What it leaves open.]
  How much of the cross-section is real depends on the share of true factors, and the data give a weak signal about that share. Harvey's sensitivity table shows the limit.

  #v(0.65em)
  #text(fill: vu, weight: "bold")[Net effect.]
  The burden of proof moved. A claim that replication fails must now answer a public dataset that anyone can download. A claim that most factors are noise can still be argued.
]

// Closing slide: the same facet background, used for the wildcat standout frame.
#page(
  margin: 0pt,
  background: image("assets/facets.svg", width: 100%, height: 100%),
)[
  #place(top + left, dx: 0.95cm, dy: 0.65cm, image("assets/vu-logo-white.png", width: 2.2cm))
  #align(center + horizon)[
    #block(width: 11cm)[
      #text(font: display, size: 16pt, fill: white)[Is There a Replication Crisis in Finance?]
      #v(0.45cm)
      #text(size: 9pt, fill: vu-20)[Jensen, T. I., Kelly, B., and Pedersen, L. H. (2023).]
      #v(0.08cm)
      #text(size: 9pt, fill: vu-20)[_Journal of Finance_ 78(5), 2465 to 2518.]
      #v(0.4cm)
      #text(size: 8.5pt, fill: white)[Data and code: jkpfactors.com, github.com/bkelly-lab/ReplicationCrisis]
      #v(0.45cm)
      #text(size: 9pt, fill: gold)[Questions and discussion are welcome.]
      #v(0.25cm)
      #text(size: 8.5pt, fill: vu-20)[Aidas Kriščiūnas]
    ]
  ]
]
