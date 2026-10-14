# Reading notes — JF 2023, "Is There a Replication Crisis in Finance?" (group task: Typst paper report)

Source: `/home/aidas/Downloads/The Journal of Finance - 2023 - JENSEN - Is There a Replication Crisis in Finance.pdf`
-> `jf_raw.txt` (pdftotext, spaces preserved) -> `jf_clean.txt` (de-hyphenated). Read in full 2026-10-14.

## Bibliographic
- Theis Ingerslev Jensen (CBS), Bryan Kelly (Yale SOM, AQR, NBER), Lasse Heje Pedersen (AQR, CBS, CEPR).
- The Journal of Finance, Vol. LXXVIII, No. 5, October 2023, pp. 2465–2518. DOI 10.1111/jofi.13249. Open access (CC-BY).
- Initial submission 2021-05-28 (approx, per paper footer "Initial submission: ..."); Accepted 2023-01-... — see PDF for exact dates (footer lists both).
- Editors: Stefan Nagel, Philip Bond, Amit Seru, Wei Xiong.
- Data: https://jkpfactors.com ; code: https://github.com/bkelly-lab/ReplicationCrisis ; also via WRDS. Global data set will be updated.
- Acknowledgements mention discussants Cam Harvey and Neil Shephard.

## The two challenges the paper attacks
1. **No internal validity** — most studies cannot be replicated with the same data or are not robust to slightly different methods/data. Representative quote: Hou, Xue, and Zhang (2020): "Most anomalies fail to hold up to currently acceptable standards for empirical finance."
2. **No external validity** — results are spurious, driven by p-hacking / multiple testing without FDR control. Cochrane (2011) "factor zoo"; Harvey, Liu, and Zhu (2016): "most claimed research findings in financial economics are likely false." Also Linnainmaa & Roberts (2018) on accounting anomalies.

Terminology: Hamermesh (2007) pure replication ("reproduction", Welch 2019) vs scientific replication. Chen & Zimmermann (2022) do pure replication and reproduce ~100% of factors.

## Figure 1 — the ladder of replication rates (memorise this for the report)
| Step | Rate | What changes |
|---|---|---|
| HXZ (2020) baseline | **35%** | their raw-return, decile-based test |
| JKP US baseline OLS | **55.6%** | longer sample, +15 factors, more conservative construction |
| excl. 34 factors insignificant in the original papers | **61.3%** | — |
| **CAPM alpha** instead of raw return | **82.4%** | theory dictates risk-adjusted returns |
| Benjamini–Yekutieli (BY) MT correction | **75.6%** | critical t ≈ 2.7 (HXZ drop 35% -> 18% post-MT) |
| **Bayesian / empirical Bayes (EB)** | **82.4%** | their model; shrinkage and precision offset |
| Global sample (153 factors, 93 countries) | **82.4%** | external validity across countries |

## Data construction
- Starting point: HXZ's 202 characteristic signals -> 452 factor portfolios (1/6/12-month holding; annual & quarterly updates). JKP keep only 1-month holding and the most recent accounting version -> 180 feasible global factors; drop industry/analyst factors (short samples) -> 138; add 15 factors from the literature -> **153 factors**.
- Per country/month: sort stocks into characteristic **terciles**; breakpoints from **non-micro stocks** (larger than NYSE 20th percentile), then distribute micro caps by the same breakpoints; **capped value weights** (market equity winsorized at NYSE 80th percentile); factor = high tercile minus low tercile, signed per the original paper.
- Require ≥5 stocks per leg; ≥60 non-missing monthly observations; MSCI classification (as of 2021) for regions (23 developed, 27 emerging; remaining 43 in "world" only); cap-weighted aggregation across countries, ≥3 countries per region factor.
- All factors scaled so monthly idiosyncratic volatility = 10%/√12 (10% annualized). α from CAPM regression on own region's market.
- Data: CRSP (US, from 1926), Compustat (foreign, mostly from 1986). Delisting: US uses CRSP delisting returns, performance-based missing set to −30%; globally all performance-based delistings set to −30%. Winsorize Compustat returns at 0.1%/99.9%. Accounting data assumed available 4 months after period end; quarterly income/cash-flow aggregated over 4 quarters.
- **13 themes** via hierarchical agglomerative clustering (distance = 1 − correlation, Ward linkage) on CAPM-residual US returns: Accruals*, Debt Issuance*, Investment*, Leverage*, Low Risk, Momentum, Profit Growth, Profitability, Quality, Seasonality, Size*, Short-Term Reversal, Value (* = bets against the characteristic, e.g. low accruals long). Average within-cluster correlation > 0.5 in 9 of 13 clusters.

## Theory (Section I) — the Bayesian model
- Factor: f_t = α + β r_m,t + ε_t, CAPM benchmark (not mechanically related to size/value like Fama–French).
- Prior α ~ N(0, τ²): mean zero = "CAPM holds on average"; τ = potential deviations. Estimate α̂ from T periods; α̂ ~ N(α, σ²/T).
- Posterior mean **E(α|α̂) = κ α̂**, shrinkage **κ = 1 / (1 + σ²/(Tτ²)) ∈ (0,1)**; posterior variance = κ σ²/T.
- Interpretation: prior τ is equivalent to σ²/τ² periods of zero-alpha evidence; more data (T) -> less shrinkage; stronger prior (lower τ) -> more shrinkage.
- Key interpretive claim: **out-of-sample attenuation is the Bayesian prediction, not evidence of non-replicability**.
- **Proposition 1 (alpha-hacking)**: E(α|α̂) = −κ₀ + κ_hacking α̂, with κ_hacking ≤ κ and κ₀ = κ_hacking ε̄ ≥ 0. Testable signatures: a slope below the Bayesian benchmark (~0.9) and a **negative intercept** in a regression of OOS alpha on in-sample alpha.
- **Proposition 2 (shared evidence)** / **Proposition 3 (hierarchical alphas)**: pooling domestic+global evidence (Proposition 2) and partially shared alphas (Proposition 3) tighten posteriors; Var(α_i | all α̂) < Var(α_i | α̂_i); as N→∞ the average alpha and idiosyncratic outperformance are shrunk separately. **Many factors are a strength, not a weakness.**
- **Proposition 4 (multilevel model)**: α_i = α_o + c_j + s_n + w_i with c_j (cluster) ~ N(0, τ_c²), s_n (signal, shared across regions) ~ N(0, τ_s²), w_i (idiosyncratic) ~ N(0, τ_w²); α_o fixed at 0 (conservative). Posterior E(α|α̂) = (Ω⁻¹ + T Σ⁻¹)⁻¹(Ω⁻¹ 1 α₀ + T Σ⁻¹ α̂), Var = (Ω⁻¹ + T Σ⁻¹)⁻¹.
- **Empirical Bayes (EB)**: hyperparameters (τ_c, τ_s, τ_w) estimated by MLE of the marginal likelihood α̂ ~ N(0, Ω(τ) + Σ̂/T); Σ̂ uses **block equicorrelation** structure + 10,000 bootstrap samples to handle the unbalanced panel. EB is closed form, hence more replicable than full Bayes.
- **Proposition 5 (Bayesian FDR)**: FDR_Bayes = (1/#discoveries) Σ_{i∈discoveries} p-null_i and is **bounded by 2.5%** (discovery = posterior probability alpha ≤ 0 is below 2.5%, equivalent to z > 1.96 with a one-sided twist).

## Simulation (Figure 3)
- 130 factors, 13 clusters of 10, 70 years monthly; cluster correlation 0.58 within / 0.02 across; residual vol 10%/yr; 10,000 simulations; vary τ_c, τ_w.
- When true alphas are small: OLS FDR up to 25%; BY and EB both control it. BY pays a **large power cost**; EB keeps much better power and, when discoveries are plentiful, approaches uncorrected OLS performance.
- Takeaway: EB **adapts** — behaves like BY when discoveries are rare, like OLS when they are common. Frequentist corrections impose an implicit, often unreasonable cost on false positives; in finance that cost is measurable in dollars (Section III.C.1).

## Internal validity (Section III.A)
- OLS replication rate **82.4%** = 98 significant-in-both / 119 (98 solid blue, 21 dashed red; 34 extra dotted green factors insignificant in originals).
- BY: critical t ≈ **2.7** -> **75.6%**.
- EB (US-only data): **82.4%** — the conservative shrinkage and the improved precision "exactly offset".
- EB using **global** data for US factors: **81.5%** (some posterior means fall, e.g. US change-in-book-equity alpha 0.22% US-only -> 0.13% with global data, with tighter CI 0.095% -> 0.077%).
- Size subsamples (EB): mega **77.3%**, large **79.8%**, small **85.7%**, micro **85.7%**, nano **68.1%** -> replies directly to the "micro-cap artifacts" criticism.
- Themes: **11 of 13 replicate at ≥50%**; exceptions **low leverage** and **size** (size is stronger in emerging markets and among micro/nano stocks; theory = illiquidity/liquidity-risk premia). Low-leverage factors have insignificant CAPM alphas but become one of the most important themes once other factors are controlled.

## External validity (Section III.B)
- Global (Figure 6): four methods — OLS, BY, EB-Region, EB-All. OLS rates lower outside the US (shorter samples), BY hurts most, EB-Region just below OLS, **EB-All highest**; world EB replication rate **82.4%**.
- Figure 7: US alpha vs world-ex-US alpha lines up with the 45° line — similar magnitudes, wider foreign CIs.
- **Time series** (Figure 8): in-sample alpha 0.49%/month vs out-of-sample 0.26%/month = −47% (McLean–Pontiff report −58%). Positive pre-original 82.6%, post-original 83.3%, combined 87.4%. GLS slopes of OOS on in-sample: **0.57 (pre), 0.26 (post), 0.35 (combined)**, t = 3.5–5.3; Bayesian benchmark slope ≈0.9 -> slope too low and dots concave => can reject **pure** alpha-hacking, but the very top in-sample alphas look partly data-mined or arbitraged.
- Figure 9: real-time posterior of average alpha on a world equal-weighted portfolio of factors available since 1955; alpha stabilises around **0.4%/month** from the mid-1980s; posterior CI narrows from ≈0.16% (1960) to ≈0.10% (2020). Illustrative example: 10y with α̂=10% and prior equally informative -> posterior 5%; if 5% then realises for 10 more years, κ becomes 2/3, posterior stays 5% but CI shrinks from [0.5%,9.5%] to [1.3%,8.7%].
- **Bayesian FDR = 0.1%** (posterior SE 0.3%, 95% CI [0%,1%]); **Bayesian FWER = 5.5%** (with a t>2.78 threshold it falls to 0.8%); **expected fraction of true factors = 94%** (SE 1.3%) — higher than the replication rate by construction.

## Prior sensitivity, publication bias, unobserved factors (Section III.C.2, Figure 10)
- Replication rate rises only modestly with τ_c: from data τ_c = 0.35% -> 82.4%; HXZ baseline scenario (M = 1,297 factors, 39.6% zero-alpha) -> τ_c = 0.28% -> **81.5%**; HXZ conservative scenario (M = 2,458, 68.3% zero) -> τ_c = 0.20% -> **79.8%**; prior estimated on out-of-sample data only (τ_c = 0.27%, τ_w = 0.22%) -> **81.5%**.
- Table I hyperparameters: World τ_c 0.37% / τ_w 0.23% / τ_s 0.10%; US 0.35/0.21; Developed 0.24/0.18; Emerging 0.32/0.24; US mega 0.29/0.16; large 0.26/0.18; small 0.31/0.26; micro 0.44/0.32; nano 0.48/0.28.

## Economic significance (Section III.D)
- Factors discovered by EB but rejected by BY: US alpha **0.35%/month (t = 5.1)**; developed ex-US 0.24% (t = 5.3); emerging 0.27% (t = 3.7). IR **0.93** US and **1.10** ex-US, t > 5 (Figure 2, cumulative CAPM alpha; sample 1990–2020, post-HLZ sub-sample 2013–2020). => BY is **too conservative** and destroys real profit.
- t-stat / Sharpe link: t = SR·√T, so a factor with SR 0.5 crosses t = 1.96 after ~15 years but t = 2.78 only after ~31 years.
- Cluster alphas: world alphas typically >0.3%/month and significant in most clusters; exception low leverage.
- Size/region: Spearman rank correlation of cluster alphas mega vs micro 73%; mega vs nano 36%; US vs developed ex-US 62%; US vs emerging 43%.
- Tangency portfolio (Figure 13, US, weights from Britten-Jones with non-negativity, 90% bootstrap CIs): **10 of 13 themes have significantly positive weights**; displaced = **profitability, investment, size**. Value becomes stronger when controlling (hedges momentum, quality, low leverage); low leverage becomes one of the heaviest weights as a hedge.
- Figure 14: ex-post tangency Sharpe ratio rises from market 0.13 to 0.80 (1972–2020 US balanced sample; 0.56 in a pseudo-out-of-sample cross-validation); Sloan (1996) operating accruals raised it 0.43 -> 0.56; Heston–Sadka (2008) seasonality 0.65 -> 0.74. Bottom panel: number of published factors grows over time.

## Conclusion (near-verbatim key claims)
- "U.S. equity factors have a high degree of internal validity" — over 80% remain significant after construction changes and MT adjustment.
- "highly similar qualitative and quantitative behavior in a large sample of 153 factors across 93 countries".
- "some out-of-sample factor decay is to be expected in light of Bayesian posteriors based on publication evidence."
- Framework also useful for: interpreting OOS evidence, detecting alpha-hacking, computing expected false discoveries, portfolio choice under estimation uncertainty, evaluating asset-pricing models. Aim: "promote credible finance research."

## Appendix highlights
- Proposition A.1: with in-sample alpha-hacking and an out-of-sample period, E(α|α̂, α̂ᵒᵒˢ) = κᵒᵒˢ[w(α̂ − ε̄) + (1−w)αᵒᵒˢ] — formalises "10y backtest + 10y live" ≠ "20y backtest".
- Appendix A.2: proofs (Jensen's inequality lemma; matrix inverse lemma for equicorrelation; Woodbury identity for Proposition 4).
- Appendix B: EB implementation, block equicorrelation Σ̂, 10,000 bootstrap samples, MLE hyperparameters.

## Documented critique / counter-evidence (for the report's discussion)
- **Harvey** (Duke slide decks 2022, 2025; discussion of JKP): results hinge on the prior fraction of true anomalies λ₁ = 50%. Holding FDR target 5% and varying λ₁: λ₁=50% -> EB FDR 5.7% (BH 2.6%, OLS 7.0%); λ₁=25% -> EB 14.0%; λ₁=5% -> EB 33.6%; λ₁=1% -> EB 56.4%, OLS 77.0%. Frequentist BH stays ~2.6–4.7%. Conclusion: EB degrades badly for small λ₁. "The first step toward the resolution of the replication crisis in finance is to acknowledge it."
- **Hou, Xue & Zhang (2020)**: 447 anomaly variables; with NYSE breakpoints + value weights, 286 (64%) insignificant at 5%, 380 (85%) insignificant at t>3; mean high-minus-low alpha 0.26%/month. JKP rebuttal: HXZ test raw returns where theory dictates CAPM alpha (low-beta example: HXZ's "failure" actually supports the theory).
- **McLean & Pontiff (2016)**: post-publication decay −58% (JKP find −47%).
- **Peking University HSBC 2025 counter-paper**: reverses the null (discovery = anomaly spanned by the factor set); Bayesian sequential EFDR (q=0.2) applied to JKP's own 153-factor US data with FF6 benchmark -> 132 of 153 spanned; claims consistency with a broader replication crisis.
- Practitioner reception: FT Alphaville (Wigglesworth) "The financial replication crisis revisited"; Alpha Architect supportive summary; Portfolio123 sceptical of the 13-theme taxonomy; Evidence Investor (Powell).
- Popular framing useful for the report: the debate is not "is there a crisis" but "which statistical lens (frequentist MT correction vs Bayesian hierarchical shrinkage) should govern replication".
