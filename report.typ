#import "@preview/elsearticle:3.1.0": *

#show: elsearticle.with(
  title: "Is There a Replication Crisis in Finance? A Critical Review of Jensen, Kelly, and Pedersen (2023)",
  authors: (
    (
      name: [Aidas Kriščiūnas],
      affiliations: ("a",),
      corresponding: true,
      email: "aidas.krisciunas@evaf.stud.vu.lt",
    ),
    (
      name: [Jokūbas Narvydas],
      affiliations: ("a",),
    ),
    (
      name: [Domas Pitrėnas],
      affiliations: ("a",),
    ),
  ),
  affiliations: (
    "a": [Group Assignment, Empirical Finance],
  ),
  journal: "Empirical Finance: Group Assignment",
  abstract: [
    Jensen, Kelly, and Pedersen (2023) ask whether financial economics faces a replication crisis. Two challenges motivate the question. The internal-validity challenge holds that most published asset-pricing factors fail to replicate with the same data or with slightly different methods. The external-validity challenge holds that the factors are spurious because researchers have searched too many signals without controlling the false discovery rate. The authors answer both with a Bayesian model of factor replication, empirical Bayes estimation, and a new global dataset of 153 factors in 93 countries. They report a replication rate of 82.4\% on CAPM alphas, 13 economic themes of which 11 replicate in at least half of specifications, and stable out-of-sample performance. This review examines the design, the evidence, and the main objections. Campbell Harvey's prior-sensitivity critique shows that the empirical Bayes rate depends heavily on the assumed share of true factors. Hou, Xue, and Zhang read the same evidence as a wide-spread failure, and a recent spanning test on the authors' own data classifies 132 of 153 factors as spanned by a standard benchmark. The paper settles the narrow question, whether published factors survive replication, and leaves the broad question, how much of the cross-section is real, open.
  ],
  keywords: (
    "replication crisis",
    "factor zoo",
    "multiple testing",
    "empirical Bayes",
    "asset pricing",
    "out-of-sample",
  ),
  paper: "a4",
  format: "preprint",
)

// Slightly tighter body text so the review fits the target length while
// keeping the Elsevier preprint look.
#set text(size: 10.5pt)

= Introduction

Empirical asset pricing has produced several hundred factors that appear to predict returns. That abundance has a cost: the more signals a literature tests, the easier it becomes to report a false discovery. Jensen, Kelly, and Pedersen (JKP, @jensen2023replication) confront the resulting charge of a replication crisis and defend the field. The paper rests on three pillars: a Bayesian model of factor replication that nests the multiple-testing problem inside a prior, a new global dataset of 153 factors in 93 countries, and a reassessment of roughly two decades of published anomalies through that lens.

The paper's answer is conditional, and this review argues that the condition carries the weight of the claim. JKP settle the narrow question, whether published factors survive replication, with evidence that is strong and reproducible. They leave the broad question, how much of the published cross-section is genuine, open.

= The replication debate in finance

Replication movements arrived in economics later than in medicine (@ioannidis2005why) and psychology (@nosek2012scientific). The finance version has two strands. The internal-validity strand asks whether a published factor survives small changes in construction or data. The external-validity strand asks whether the factor reflects a real risk premium or an artefact of search.

Cochrane gave the problem its image, the "factor zoo", a menagerie of predictors whose count invites data mining (@cochrane2011presidential). McLean and Pontiff supplied the first systematic decay estimate: factor returns are 26\% lower out-of-sample and 58\% lower post-publication (@mclean2016does). Hou, Xue, and Zhang (HXZ) press the internal-validity charge hardest (@hou2020replicating). Working with 452 anomaly portfolios under NYSE breakpoints and value-weighted returns, they report that 286 of 447 anomalies, 64\%, are insignificant at the 5\% level, and that 85\% fail at a t-statistic cutoff of 3. The mean high-minus-low alpha across survivors is 0.26\% per month. Their verdict is that the literature is "infested with widespread p-hacking". Harvey, Liu, and Zhu reach a related conclusion through multiple-testing reasoning and propose a threshold near t~3 (@harvey2016cross).

JKP answer at a different level. They distinguish pure replication, which reruns a study on the same data, from scientific replication, which asks whether the result holds in a new sample (@hamermesh2007viewpoint). Chen and Zimmermann show that pure replication largely succeeds when data and methods are held fixed (@chen2022open), so the dispute concerns scientific replication. JKP also dispute HXZ's test directly: HXZ screen raw returns, while asset-pricing theory prescribes risk-adjusted returns. Their low-beta example makes the point concrete, since the betting-against-beta factor fails to replicate once the market return is subtracted, exactly as the theory predicts (@frazzini2014betting).

= A Bayesian model of factor replication

JKP frame replication as inference. A factor's excess return follows a market model,

$ f_t = alpha + beta r_(m,t) + epsilon_t $ <eq:factor>

benchmarked against the CAPM rather than a Fama-French model, because the latter mechanically absorbs size and value and would prejudge the factors under study. The prior on the intercept encodes the null of no abnormal return, with a mean-zero prior that says the CAPM holds on average and a dispersion $tau$ that sets how far a genuine factor can deviate:

$ alpha ~ N(0, tau^2) $ <eq:prior>

The sample estimate is $hat(alpha) ~ N(alpha, sigma^2 / T)$, and the posterior mean shrinks it toward zero:

$ E(alpha | hat(alpha)) = kappa hat(alpha), quad kappa = 1 / (1 + sigma^2 / (T tau^2)) $ <eq:posterior>

The shrinkage factor $kappa$ lies in $(0,1)$: it approaches one when the signal is strong or the sample long, and zero when the estimate is noisy. A factor counts as a discovery when its posterior mass above zero exceeds 95\%.

The design has a practical advantage over frequentist corrections. Benjamini and Yekutieli control the false discovery rate by inflating p-values uniformly, which costs power everywhere (@benjamini2001control). The Bayesian posterior shrinks each factor according to its own precision, so it gives up little power when genuine factors are common and shrinks hard when they are rare. JKP estimate the hyperparameters by maximum likelihood from the cross-section of factors, giving EB-Region, which learns a prior within a region, and EB-All, which pools information across regions.

Table @tab:hyper reports the estimated dispersions. The world cluster dispersion is 0.37\% per month and the idiosyncratic dispersion is 0.23\%. The two dispersions combine into a prior standard deviation of $sqrt(0.37^2 + 0.23^2) = 0.44\%$ per month, which sets the scale of what counts as a plausible factor.

#figure(
  table(
    columns: 4,
    table.header([Sample], [Cluster dispersion (\%/mo)], [Idiosyncratic dispersion (\%/mo)], [Signal dispersion (\%/mo)]),
    [World], [0.37], [0.23], [],
    [United States], [0.35], [0.21], [],
    [Developed], [0.24], [0.18], [],
    [Emerging], [0.32], [0.24], [],
    [USA, developed and emerging], [0.30], [0.19], [0.10],
    [World ex-US], [0.29], [0.20], [],
    [US mega], [0.26], [0.16], [],
    [US large], [0.31], [0.18], [],
    [US small], [0.44], [0.26], [],
    [US micro], [0.48], [0.32], [],
    [US nano], [0.42], [0.28], [],
  ),
  kind: table,
  caption: [Empirical Bayes hyperparameters by sample, estimated by maximum likelihood. The signal dispersion is identified only when several regions are estimated jointly. Adapted from Table I of @jensen2023replication.],
) <tab:hyper>

Two further results follow. Proposition 1 formalises the signature of alpha-hacking: if authors mine data, the slope of out-of-sample alphas on in-sample alphas falls below the Bayesian benchmark near 0.9 and the intercept turns negative. The remaining propositions extend the framework to correlated evidence across factors and to a multilevel model that loads each alpha on cluster and theme effects.

= Data

The factor universe starts from the 202 signals catalogued by HXZ, which expand to 452 portfolios once holding periods and accounting-update frequencies vary. JKP keep the one-month holding period and the most recent accounting version, remove industry and analyst factors, and arrive at 180 factors. They add 15 factors from the wider literature for 153 in total.

Construction choices are documented and public. Factors use tercile sorts with breakpoints from independent sorts, and micro-caps are distributed by the same breakpoints rather than given a dedicated bucket. Each leg needs at least five stocks; each factor needs at least sixty monthly observations; weights are capped values. Every factor is scaled to 10\% annualised idiosyncratic volatility so that alphas are comparable across constructions. International factors use market capitalisation weights and require at least three countries, and each factor is evaluated against its own regional market index. The sample covers 93 markets, split into 23 developed, 27 emerging, and 43 countries available only through the world portfolio. JKP then group the 153 factors into 13 themes by hierarchical agglomerative clustering of CAPM residuals, using one minus the correlation as distance and Ward linkage. Some themes are bets on the characteristic and others against it, which matters for how the tangency portfolio loads on them.

= Internal validity

Does a factor survive when the researcher holds the signal fixed and changes the test? Table @tab:ladder stacks the answers, and the stack is the paper's central exhibit.

#figure(
  table(
    columns: 2,
    table.header([Specification], [Replication rate (\%)]),
    [HXZ baseline, raw returns], [35.0],
    [JKP US sample, raw returns, OLS], [55.6],
    [Excluding factors insignificant in the originals], [61.3],
    [CAPM alpha, OLS], [82.4],
    [CAPM alpha, Benjamini-Yekutieli], [75.6],
    [CAPM alpha, empirical Bayes], [82.4],
    [Global sample, all specifications pooled], [82.4],
  ),
  kind: table,
  caption: [Replication rates across specifications. The 82.4\% figure corresponds to 98 factors significant in both the original and the replication of 119 examined. Adapted from Figure 1 of @jensen2023replication.],
) <tab:ladder>

Three features stand out. The choice between raw returns and risk-adjusted alphas moves the rate by roughly 27 percentage points, from 55.6\% to 82.4\%. Corrections for multiple testing do not overturn the result: Benjamini-Yekutieli lowers the rate to 75.6\% and the Bayesian posterior returns it to 82.4\%, while the same corrections applied to the HXZ baseline drive the rate from 35\% to 18\%. And the factors hold across the size distribution, so the objection that anomalies live only among micro-caps does not survive.

#figure(
  table(
    columns: 2,
    table.header([US size group], [Empirical Bayes replication rate (\%)]),
    [Mega], [77.3],
    [Large], [79.8],
    [Small], [85.7],
    [Micro], [85.7],
    [Nano], [68.1],
  ),
  kind: table,
  caption: [Replication across US size groups under empirical Bayes. Rates stay high through the mega and large groups, so the result does not rest on micro-caps. Adapted from Figure 5 of @jensen2023replication.],
) <tab:size>

The rate is not an artefact of a generous prior. Replacing the estimated prior with one estimated on out-of-sample data alone, $tau_c = 0.27\%$ and $tau_w = 0.22\%$, leaves the US rate at 81.5\%, and a conservative simulation of 2,458 factors with 68.3\% zero alpha gives 79.8\%. The posterior implies an expected true share of 94\%, a Bayesian false discovery rate of 0.1\%, and a family-wise error rate of 5.5\%.

= Themes and economic significance

The 13 themes matter because factor-level survival says little about economic content. Eleven of the thirteen replicate in at least half of specifications; the exceptions are low leverage and size. Ten of the thirteen enter the ex-post tangency portfolio with a significantly positive weight at 90\% confidence, and the three displaced themes are profitability, investment, and size. Value strengthens its role as a hedge, and low leverage picks up a large hedging weight.

The economic magnitudes are substantial. The market portfolio earns a monthly Sharpe ratio of 0.13 in the balanced US sample from 1972 to 2020, while the ex-post tangency portfolio reaches 0.80. In-sample optimisation flatters that number, so JKP also run a pseudo-out-of-sample cross-validation, which still gives 0.56.

One result bears directly on the multiple-testing debate. Factors that empirical Bayes accepts but Benjamini-Yekutieli rejects earn an alpha of 0.35\% per month in the US with a t-statistic of 5.1, 0.24\% in developed markets outside the US, and 0.27\% in emerging markets, with information ratios of 0.93 in the US and 1.10 outside it. False discoveries would not pay out-of-sample.

= External validity

A US-only result invites the charge that the factors are local artefacts, and the global sample answers it. The ranking of methods is stable: OLS gives the highest replication rate, EB-All sits just below, EB-Region sits lower, and Benjamini-Yekutieli trails well behind. OLS replication rates are lower outside the US, which is expected given thinner data, and pooling information through EB-All recovers most of the gap.

Out-of-sample alpha declines, and the decline is informative. The global in-sample alpha averages 0.49\% per month against 0.26\% out-of-sample, a fall of 47\% that is close to the 58\% of McLean and Pontiff (@mclean2016does). JKP argue the decline is not evidence against replication but the prediction of the Bayesian posterior, which expects post-publication attenuation. The alpha-hacking test supports them: the slope of out-of-sample on in-sample alpha is 0.57 before the original sample, 0.26 after publication, and 0.35 pooled, all below the benchmark of 0.9. Positive alphas appear in 87.4\% of factors in the combined out-of-sample period, and the real-time posterior of the average alpha stabilises near 0.4\% per month from the mid-1980s.

= The critique

Campbell Harvey, discussing the paper, accepts the arithmetic and disputes the assumption beneath it (@harvey2022discussion). The empirical Bayes rate is an average over the assumed share of true factors, and JKP estimate that share from the same data that produce the factors. Harvey holds the target false discovery rate at 5\% and varies the assumed share. Table @tab:harvey reports the result.

#figure(
  table(
    columns: 4,
    table.header([Assumed share of true factors (\%)], [EB FDR (\%)], [BH FDR (\%)], [OLS FDR (\%)]),
    [50], [5.7], [2.6], [7.0],
    [25], [14.0], [3.8], [],
    [5], [33.6], [4.5], [],
    [1], [56.4], [4.7], [77.0],
  ),
  kind: table,
  caption: [Prior sensitivity of false discovery rates, holding the target at 5\%. Empirical Bayes performs well when genuine factors are common and degrades sharply when they are rare, while Benjamini-Hochberg stays near target. Reconstruction from @harvey2022discussion.],
) <tab:harvey>

The asymmetry is the substance of the objection. Empirical Bayes inherits the optimism of the data when the true share is low, and Benjamini-Hochberg does not. If half the anomalies are real, the Bayesian rate is sound; if one in a hundred is real, the Bayesian false discovery rate climbs to 56.4\%. Harvey's conclusion, that the first step toward resolving the crisis is to acknowledge it, is a claim about how much weight the evidence can bear. JKP answer that their prior is estimated rather than assumed, and that the data deliver a share near one half.

Two further criticisms shape the verdict. The raw-return versus CAPM-alpha choice produces 35\% or 82\% from overlapping data. JKP's defence is theoretically sound, since risk adjustment is the right test for a risk-based explanation, yet the choice is convenient because the loosest benchmark maximises the headline rate, and a reader who doubts the CAPM would discount the 82.4\% figure. A recent working paper inverts the test by asking whether a factor is spanned by a standard benchmark rather than whether it is significant. Using Bayesian sequential expected false discovery on JKP's own US data, it classifies 132 of 153 factors as spanned under a six-factor benchmark, leaving 27.

= Assessment and conclusion

The methodological contribution is secure. JKP place multiple testing inside a prior, make the false-discovery and lost-power trade-off explicit, supply a diagnostic for alpha-hacking, and publish a benchmark for out-of-sample decay. Their dataset is the largest replication sample assembled and will outlast the specific numbers. The empirical contribution is a careful accounting of what survives: a majority of published factors, a stable set of themes, and continued returns outside the US.

The rhetorical claim needs tempering. The title asks a binary question, while the evidence supports a conditional statement: given a prior in which a substantial share of factors are genuine, most published factors replicate and the multiple-testing corrections that worry the field do not overturn the result. The paper's own analysis supplies the reason the condition matters, because the empirical Bayes answer depends on the assumed share of true factors and the data give only a weak signal about that share. Harvey's sensitivity table is not a refutation; it is the same result read under a different prior.

The fairest reading is that JKP have shifted the burden of proof. A narrow claim of a replication crisis, that published factors fail to replicate, now carries a heavier burden, because the largest test available finds that most of them survive. A broad claim that the published cross-section overstates the number of genuine predictors remains open, and JKP's evidence does not close it. The paper will be cited for the Bayesian treatment of replication and for the dataset. Whether the cross-section is as large as the literature claims remains contested, and the paper's own evidence explains why: the answer depends on a prior that the data cannot settle.

#heading(outlined: false, level: 2)[Data and code]

Data and code are public at https://jkpfactors.com and https://github.com/bkelly-lab/ReplicationCrisis, with a WRDS mirror. The replication rates, hyperparameters, and prior-sensitivity figures here are quoted from the published Journal of Finance version of @jensen2023replication.

#heading(outlined: false, level: 2)[AI-use statement]

Generative AI was used to draft and structure this review. Every reported figure, citation, and URL was verified against the published paper and the cited sources. No AI-generated factual claim served as evidence.

#bibliography("refs.bib")
