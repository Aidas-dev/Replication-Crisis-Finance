#import "@preview/touying:0.8.0": *
#import themes.metropolis: *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Is There a Replication Crisis in Finance?],
    subtitle: [A critical review of Jensen, Kelly and Pedersen (2023)],
    author: [Aidas Kriščiūnas],
    date: datetime(year: 2026, month: 11, day: 11),
    institution: [Applied Microeconomics: Individual Assignment],
  ),
)

#set text(size: 18pt)
#show raw: set text(size: 14pt)

// Horizontal bar for the replication-rate ladder.
#let bar(label, value, shown: none, col: rgb("#23373b")) = grid(
  columns: (2.3fr, 4fr, 0.55fr),
  align: (left + horizon, left + horizon, right + horizon),
  gutter: 0.5em,
  text(size: 0.62em)[#label],
  rect(width: value * 1%, height: 0.85em, fill: col, radius: 1.5pt),
  text(size: 0.62em)[#if shown == none { str(value) } else { shown }],
)

#title-slide(extra: [Journal of Finance 78(5), 2023, pp. 2465 to 2518])

== The claim under test

Several papers argue that financial economics faces a replication crisis.

#v(0.4em)

- Most published factors cannot be replicated with the same data, or fail once the method changes slightly.
- The factor zoo is the product of searching too many signals without controlling false discoveries.

#v(0.6em)

Jensen, Kelly and Pedersen accept the question and reject the answer. They report that *over 80 percent* of equity factors replicate.

#v(0.4em)

#text(size: 0.85em)[The disagreement is not about arithmetic. It is about which evidence counts and which prior is defensible.]

== Two challenges, not one

#grid(
  columns: (1fr, 1fr),
  gutter: 1.4em,
  [
    *Internal validity*

    - Hou, Xue and Zhang (2020): 286 of 447 anomalies insignificant at 5 percent, 380 at a t above 3.
    - Mean high-minus-low alpha of 0.26 percent per month.
    - Verdict: the literature is "infested with widespread p-hacking".
  ],
  [
    *External validity*

    - Cochrane (2011): a "zoo" of factors.
    - Harvey, Liu and Zhu (2016): a t above 3 as the threshold, because hundreds of factors were tried.
    - Verdict: most claimed findings are likely false.
  ],
)

== Three moves

#v(0.3em)

*1. A Bayesian model of factor replication.* A prior on true alphas turns multiple testing into shrinkage instead of a p-value penalty.

#v(0.6em)

*2. A new global dataset.* 153 factors in 93 countries, with construction choices documented and public.

#v(0.6em)

*3. A reassessment.* Internal validity, then external validity, then the economic value of what survives.

== The model

#v(0.2em)

#align(center)[
  #text(size: 0.95em)[
    $ f_t = alpha + beta r_(m,t) + epsilon_t $ <eq_factor>

    #v(0.3em)

    $ alpha ~ N(0, tau^2), quad hat(alpha) ~ N(alpha, sigma^2 \/ T) $
  ]
]

#v(0.4em)

Posterior mean:

#align(center)[
  #text(size: 0.95em)[$ E(alpha | hat(alpha)) = kappa hat(alpha), quad kappa = 1 / (1 + sigma^2 / (T tau^2)) $]
]

#v(0.4em)

#text(size: 0.85em)[The benchmark is CAPM, chosen because it is not mechanically tied to size and value. The shrinkage factor $kappa$ sits between zero and one, and it rises with the dispersion of true alphas.]

== Why shrinkage beats a p-value penalty

- A Bonferroni-type correction, such as Benjamini-Yekutieli, controls false discoveries by inflating every p-value. It pays a large cost in power.
- The Bayesian posterior does the same job with information: it shrinks hard when true alphas are rare and barely shrinks when they are common.
- Empirical Bayes estimates the dispersion of true alphas from the cross-section, either within a region or pooled across all regions.
- In simulation with 1,297 factors, uncorrected OLS lets the false discovery rate reach 25 percent. Both corrections control it. Only the Bayesian one keeps power.

== The data

#grid(
  columns: (1fr, 1fr),
  gutter: 1.2em,
  [
    *Construction*

    - 202 characteristic signals from Hou, Xue and Zhang
    - 452 portfolios, reduced to 180
    - 15 additional factors from the literature
    - 153 factors in total
  ],
  [
    *Rules*

    - Tercile sorts with independent breakpoints
    - At least five stocks per leg, sixty monthly observations
    - Capped value weights
    - Each factor scaled to 10 percent annualised idiosyncratic volatility
  ],
)

#v(0.6em)

#text(size: 0.85em)[93 markets: 23 developed, 27 emerging, 43 world-only. Alphas are measured against each region's own market.]

== The replication ladder

#v(0.3em)

#bar([Hou-Xue-Zhang baseline, raw returns], 35.0, shown: "35.0", col: rgb("#b0b0b0"))
#bar([This sample, raw returns], 55.6, col: rgb("#8a9a9e"))
#bar([Excluding factors insignificant originally], 61.3, col: rgb("#5f757a"))
#bar([CAPM alpha], 82.4, col: rgb("#eb811b"))
#bar([CAPM alpha, Benjamini-Yekutieli], 75.6, col: rgb("#8a9a9e"))
#bar([CAPM alpha, empirical Bayes], 82.4, col: rgb("#eb811b"))
#bar([Global sample, all specifications], 82.4, col: rgb("#eb811b"))

#v(0.5em)

#text(size: 0.8em)[Replication rates in percent. The 82.4 figure means 98 factors significant in both the original and the replication, out of 119 examined.]

== It holds across size and themes

#grid(
  columns: (1fr, 1fr),
  gutter: 1.6em,
  [
    *By size group*

    #table(
      columns: (1.4fr, 1fr),
      align: (left, right),
      inset: 6pt,
      stroke: 0.5pt + rgb("#b9c6c9"),
      fill: (x, y) => if y == 0 { rgb("#23373b") } else if calc.odd(y) { rgb("#f3f5f6") } else { white },
      table.header(text(fill: white, weight: "bold")[Group], text(fill: white, weight: "bold")[Rate]),
      [Mega], [77.3],
      [Large], [79.8],
      [Small], [85.7],
      [Micro], [85.7],
      [Nano], [68.1],
    )
  ],
  [
    *Thirteen themes*

    - 11 of 13 replicate in at least half of specifications.
    - The two failures are low leverage and size.
    - 10 of 13 enter the ex-post tangency portfolio with significantly positive weights.
    - The three displaced themes are profitability, investment and size.
  ],
)

#v(0.5em)

#text(size: 0.8em)[The micro-cap objection does not survive: replication rates are flat across the size distribution.]

== Out-of-sample, the decay is expected

- Global alpha is 0.49 percent per month in sample and 0.26 percent out of sample, a fall of 47 percent. McLean and Pontiff report 58 percent.
- 87.4 percent of factors keep a positive alpha in the combined out-of-sample period.
- The slope of out-of-sample on in-sample alpha is 0.57 before the original publication, 0.26 after it, and 0.35 pooled.
- That pattern is the alpha-hacking signature the model predicts. Attenuation after publication is what a Bayesian should expect, not evidence against replication.

#v(0.6em)

#text(size: 0.85em)[The posterior on mean alpha has been stable near 0.4 percent per month since the mid 1980s, and its confidence interval has narrowed from 0.16 to 0.10 percent.]

== Does it pay?

#grid(
  columns: (1fr, 1fr),
  gutter: 1.4em,
  [
    *Sharpe ratios, US, 1972 to 2020*

    - Market: 0.13 per month
    - Ex-post tangency portfolio: 0.80
    - Pseudo-out-of-sample cross-validation: 0.56
  ],
  [
    *Factors the Bayesian keeps*

    - Rejected by Benjamini-Yekutieli, accepted by empirical Bayes
    - 0.35 percent per month in the US, t of 5.1
    - Information ratio 0.93 in the US and 1.10 outside it
  ],
)

#v(0.6em)

#text(size: 0.85em)[The 0.80 figure uses in-sample optimisation, which is why the 0.56 cross-validated number matters more.]

== The critique

Harvey accepts the arithmetic and attacks the prior. If few anomalies are true, empirical Bayes inherits that optimism.

#v(0.5em)

#align(center)[
  #table(
    columns: (1.6fr, 1.3fr, 1.3fr),
    align: (left, right, right),
    inset: 7pt,
    stroke: 0.5pt + rgb("#b9c6c9"),
    fill: (x, y) => if y == 0 { rgb("#23373b") } else if calc.odd(y) { rgb("#f3f5f6") } else { white },
    table.header(
      text(fill: white, weight: "bold")[Assumed true share],
      text(fill: white, weight: "bold")[Bayes FDR],
      text(fill: white, weight: "bold")[Benjamini-Hochberg FDR],
    ),
    [50 percent], [5.7], [2.6],
    [25 percent], [14.0], [3.8],
    [5 percent], [33.6], [4.5],
    [1 percent], [56.4], [4.7],
  )
]

#v(0.5em)

#text(size: 0.85em)[False discovery rates in percent, holding the target at 5 percent. The frequentist correction stays near target. The Bayesian rate collapses once the true share falls.]

== Three more objections

*The benchmark choice.* Hou, Xue and Zhang test raw returns and get 35 percent. This paper tests CAPM alphas and gets 82. The defence is theoretically sound, and the loosest benchmark also produces the highest rate.

#v(0.5em)

*Decay.* Factor returns are 26 percent lower out of sample and 58 percent lower after publication. The authors answer that the model predicts this.

#v(0.5em)

*A 2025 spanning test.* On this paper's own 153 US factors, a Bayesian sequential procedure classifies 132 as spanned by a six-factor benchmark, leaving 27.

== Verdict

*What the paper settles.* Published factors do survive replication once the benchmark is a pricing model and the multiple-testing correction is Bayesian. That is a real result, on the largest sample built so far.

#v(0.5em)

*What it leaves open.* How much of the cross-section is real depends on the share of true factors, and the data give a weak signal about that share. Harvey's sensitivity table is the honest statement of the limit.

#v(0.5em)

*Net effect.* The burden of proof has shifted. A claim that replication fails now needs to beat a documented, public, global dataset. A claim that the zoo is mostly noise still has a case.

== Thank you

#align(center + horizon)[
  #text(size: 1.05em)[*Is There a Replication Crisis in Finance?*]

  #v(0.9em)

  #text(size: 0.9em)[Jensen, T. I., Kelly, B., and Pedersen, L. H. (2023). _Journal of Finance_ 78(5), 2465 to 2518.]

  #v(0.5em)

  #text(size: 0.85em)[Data and code: jkpfactors.com, github.com/bkelly-lab/ReplicationCrisis]

  #v(0.8em)

  #text(size: 0.9em)[Aidas Kriščiūnas]

  #v(0.5em)

  #text(size: 0.85em)[Questions and discussion welcome.]
]
