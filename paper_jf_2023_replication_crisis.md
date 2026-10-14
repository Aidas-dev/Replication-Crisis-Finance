THEJOURNALOFFINANCE•VOL.LXXVIII,NO.5•OCTOBER2023
Is There a Replication Crisis in Finance?
THEISINGERSLEVJENSEN,*BRYANKELLY,andLASSEHEJEPEDERSEN
ABSTRACT
Severalpapersarguethatfinancialeconomicsfacesareplicationcrisisbecausethe
majority of studies cannot be replicated or are the result of multiple testing of too
manyfactors.WedevelopandestimateaBayesianmodeloffactorreplicationthat
leadstodifferentconclusions.Themajorityofassetpricingfactors(i)canberepli-
cated;(ii)canbeclusteredinto13themes,themajorityofwhicharesignificantparts
ofthetangencyportfolio;(iii)workout-of-sampleinanewlargedatasetcovering93
countries;and(iv)haveevidencethatisstrengthened(notweakened)bythelarge
numberofobservedfactors.
SEVERALRESEARCHFIELDSFACEREPLICATIONCRISES(orcredibilitycrises),
including medicine (Ioannidis (2005)), psychology (Nosek, Spies, and Motyl
(2012)), management (Bettis (2012)), experimental economics (Maniadis, Tu-
fano, and List (2017)), and now also financial economics. Challenges to the
replicabilityoffinanceresearchtaketwobasicforms:
1. No internal validity. Most studies cannot be replicated with the same
data (e.g., because of coding errors or faulty statistics) or are not robust
in the sense that the main results cannot be replicated using slightly
*Theis Ingerslev Jensen is at Copenhagen Business School. Bryan Kelly is at Yale School of
Management, AQR Capital Management, and NBER. Lasse Heje Pedersen is at AQR Capital
Management, Copenhagen Business School, and CEPR. We are grateful for helpful comments
fromNickBarberis;AndreaFrazzini;CamHarvey(discussant);AnttiIlmanen;RonenIsrael;An-
drewKarolyi;JohnLiew;TobyMoskowitz;StefanNagel;ScottRichardson;AndersRønn-Nielsen;
NeilShephard(discussant);andseminarandconferenceparticipantsatAFA2022,NBER2021,
AQR, GeorgetownVirtual FintechSeminar, TisvildelejeSummer Workshop2020, Yale, and the
CFA Institute European Investment Conference 2020. We thank Tyler Gwinn for excellent re-
searchassistance.JensenandPedersengratefullyacknowledgesupportfromtheCenterforBig
DatainFinance(grantno.DNRF167).AQRCapitalManagementisaglobalinvestmentmanage-
mentfirm,whichmayormaynotapplysimilarinvestmenttechniquesormethodsofanalysisas
describedherein.Theviewsexpressedherearethoseoftheauthorsandnotnecessarilythoseof
AQR.AconflictofinterestdisclosurestatementcanbefoundonTheJournalofFinancewebsite.
Correspondence:TheisIngerslevJensen,DepartmentofFinance,CopenhagenBusinessSchool,
SolbjergPlads3,A4.15,DK-2000Frederiksberg,Denmark;e-mail:tij.fi@cbs.dk.
ThisisanopenaccessarticleunderthetermsoftheCreativeCommonsAttributionLicense,which
permitsuse,distributionandreproductioninanymedium,providedtheoriginalworkisproperly
cited.
DOI:10.1111/jofi.13249
© 2023 The Authors. The Journal of Finance published by Wiley Periodicals LLC on behalf of
AmericanFinanceAssociation.
2465

2466 TheJournalofFinance®
differentmethodologiesand/orslightlydifferentdata.1Forexample,Hou,
Xue,andZhang(2020)statethat:
“Mostanomaliesfailtoholduptocurrentlyacceptablestandardsforem-
piricalfinance.”
2. No external validity. Most studies may be robustly replicated, but are
spurious and driven by “p-hacking,” that is, find significant results by
testing multiple hypotheses without controlling the false discovery rate
(FDR). Such spurious results are not expected to replicate in other sam-
plesortimeperiods,inpartbecausethesheernumberoffactorsissimply
too large, and too fast growing, to be believable. For example, Cochrane
(2011) asks for a consolidation of the “factor zoo,” and Harvey, Liu, and
Zhu(2016)statethat:
“mostclaimedresearchfindingsinfinancialeconomicsarelikelyfalse.”2
In this paper, we examine these two challenges both theoretically and em-
pirically.Weconcludethatneithercriticismistenable.Themajorityoffactors
doreplicate,dosurvivejointmodelingofallfactors,doholdupout-of-sample,
arestrengthened(notweakened)bythelargenumberofobservedfactors,are
furtherstrengthenedbyglobalevidence,andthenumberoffactorscanbeun-
derstoodasmultipleversionsofasmallernumberofthemes.
These conclusions rely on new theory and data. First, we show that factors
must be understood in light of economic theory, and we develop a Bayesian
modelthatoffersaverydifferentinterpretationoftheevidenceonfactorrepli-
cation. Second, we construct a new global data set of 153 factors across 93
countries. To help advance replication in finance, we have made this data set
easily accessible to researchers by making our code and data publically avail-
able.3
Replicationresults.Figure1illustratesourmainresultsandhowtheyrelate
to the literature in a sequence of steps. It presents the “replication rate,” that
is,thepercent offactorswithastatisticallysignificantaverage excessreturn.
1Hamermesh(2007)contrasts“purereplication”and“scientificreplication.”Purereplication
is “checking on others’ published papers using their data,” also called “reproduction” by Welch
(2019),whilescientificreplicationusesa“differentsample,differentpopulationandperhapssimi-
lar,butnotidenticalmodel.”Wefocusonscientificreplication.Weproposeanewmodelingframe-
worktojointlyestimatefactoralphas,weuserobustfactorconstructionmethodsthatareapplied
uniformlytoallfactors,andwetestbothinternalandexternalvalidityofpriorfactorresearch
alongseveraldimensions,includingout-of-sampletime-seriesreplicationandinternationalsam-
ple replication. In complementary and contemporaneous work, Chen and Zimmermann (2022)
consider pure replication, attempting to use the same data and methods as the original papers
foralargenumberoffactors.Theyareabletoreproducenearly100%offactors,butHou,Xue,
andZhang(2020)challengethescientificreplicationandHarvey,Liu,andZhu(2016)challenge
validityduetomultipletesting(MT).
2Similarly,LinnainmaaandRoberts(2018)statethat:“themajorityofaccounting-basedreturn
anomalies,includinginvestment,aremostlikelyanartifactofdatasnooping.”
3Thedataareavailableathttps://jkpfactors.com.Thedatawillbeupdatedovertimeandwill
alsobeavailablethroughWhartonResearchDataServices(WRDS).Thecodeisavailableathttps:
//github.com/bkelly-lab/ReplicationCrisis.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2467
Figure1. Replicationratesversustheliterature.Thisfiguresummarizesanalysesthrough-
outthepaper.RefertoSectionIIIforestimationdetails.(Colorfigurecanbeviewedatwileyon-
linelibrary.com)
The starting point of Figure 1—the first bar on the left—is the 35% replica-
tion rate reported in the expansive factor replication study of Hou, Xue, and
Zhang (2020). The second bar in Figure 1 shows a 55.6% baseline replication
rateinourmainsampleofU.S.factors.Itisbasedonsignificantordinaryleast
squares(OLS)t-statisticsforaveragerawfactorreturns,indirectcomparabil-
ity to the 35% calculation from Hou, Xue, and Zhang (2020). This difference
arisesbecauseoursampleislonger,weadd15factorstooursamplethatcome
frompriorliteraturebutarenotstudiedbyHou,Xue,andZhang(2020),and,
webelieve,minorconservativefactorconstructiondetailsthatrobustifyfactor
behavior.4 WediscussthisdecompositionfurtherinSectionII,wherewedetail
ourfactorconstructionchoicesanddiscusswhywepreferthem.
The Hou, Xue, and Zhang (2020) sample includes a number of factors that
theoriginalstudiesfindtobeinsignificant.5Weexcludethesewhencalculating
thereplicationrate.Aftermakingthisadjustment,thereplicationraterisesto
61.3%,asshowninthethirdbarinFigure1.
4Inparticular,weusetercilespreadswhiletheyusedeciles,weusetercilebreakpointsfrom
all stocks above the NYSE 20th percentile (i.e., non-micro-caps) while they use straight NYSE
breakpoints, we always lag accounting data four months while they use a mixture of updating
schemes,weexcludefactorsbasedonIBESdataduetoitsrelativelyshorthistory,weusecapped
value-weightingwhiletheyusestraightvalue-weights,andwelookatreturnsoveraone-month
holdingperiodwhiletheyuseone,six,and12months.InSectionIoftheInternetAppendix,we
detailhoweachchangeaffectsthereplicationrate.TheInternetAppendixmaybefoundinthe
onlineversionofthisarticle.
5Weidentify34factorsfromHou,Xue,andZhang(2020)forwhichtheoriginalpaperdidnot
findasignificantalphaordidnotstudyfactorreturns(seeTableIA.IIoftheInternetAppendix).
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2468 TheJournalofFinance®
Alpha, not raw return. Hou, Xue, and Zhang (2020) analyze and test fac-
tors’ raw returns, but if we wish to learn about “anomalies,” economic theory
dictates the use of risk-adjusted returns. The raw return can lead to incor-
rectinferencesforafactorifthisreturndiffersfromthealpha.Whentheraw
return is significant but the alpha is not, this simply means that the factor
is taking risk exposure and the risk premium is significant, which does not
indicate anomalous factor returns. Likewise, when the raw return is insignif-
icant but the alpha is significant, the factor’s efficacy is masked by its risk
exposure.Anexampleofthisisthelow-betaanomaly,wherebytheorypredicts
that the alpha of a dollar-neutral low-beta factor is positive but its raw re-
turn is negative or close to zero (Frazzini and Pedersen (2014)). In this case,
the “failure to replicate” of Hou, Xue, and Zhang (2020) actually supports the
betting-against-beta theory. We analyze the alpha to the capital asset pricing
model (CAPM), which is the clearest theoretical benchmark model that is not
mechanically linked to other so-called anomalies in the list of replicated fac-
tors. The fourth bar inFigure 1 shows that the replication rate rises to82.4%
basedontestsoffactors’CAPMalpha.
MT and our Bayesian model. The first four bars in Figure 1 are based on
individual OLS t-statistics for each factor. But Harvey, Liu, and Zhu (2016)
rightlypointoutthatthistypeofanalysissuffersfromanMTproblem.Harvey,
Liu, and Zhu (2016) recommend MT adjustments that raise the threshold for
a t-statistic to be considered statistically significant. We report one such MT
correctionusingaleadingmethodproposedbyBenjaminiandYekutieli(2001).
Accounting for MT in this manner, we find that the replication rate drops to
75.6%(thefifthbarofFigure1).Forcomparison,Hou,Xue,andZhang(2020)
consider a similar adjustment and find that their replication rate drops from
35%withOLSto18%afterMTcorrection.
However, common frequentist MT corrections can be unnecessarily crude.
Our handling of the MT problem is different. We propose a Bayesian frame-
work for the joint behavior of all factors, resulting in an MT correction that
sacrifices much less power than its frequentist counterpart, which we demon-
strate via simulation.6 To understand the benefits of our approach, note first
that we impose a prior that all alphas are expected to be zero. The role of the
BayesianpriorisconceptuallysimilartothatoffrequentistMTcorrections—it
imposes conservatism on statistical inference and controls the FDR. Second,
our joint factor model allows us to conduct inference for all factor alphas si-
multaneously. The joint structure among factors leverages dependence in the
data to draw more informative statistical inferences (relative to conducting
independent individual tests). Our zero-alpha prior shrinks alpha estimates
6A large statistics literature (see Gelman et al. (2013) and references therein) explains how
BayesianestimationnaturallyaddressesMTproblemsandGelman,Hill,andYajima(2012)con-
cludethat“theproblemofmultiplecomparisonscandisappearentirelywhenviewedfromahi-
erarchicalBayesianperspective.”Chinco,Neuhierl,andWeber(2021)useaBayesianestimation
frameworksimilartooursforadifferent(butconceptuallyrelated)problem.Theyinferthedis-
tributionofcoefficientsinastockreturnpredictionmodeltocalculatewhattheyrefertoasthe
“anomalybaserate.”
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2469
of all factors, leading to fewer discoveries (i.e., a lower replication rate), with
similar conservatism as a frequentist MT correction. At the same time, how-
ever, the model allows us to learn more about the alpha of any individual fac-
tor, borrowing estimation strength across all factors, and the improved pre-
cision of alpha estimates for all factors can increase the number of discover-
ies.WhicheffectdominateswhenweconstructourfinalBayesianmodel—the
conservativeshrinkagetothepriorortheimprovedprecisionofalphas—isan
empiricalquestion.
In our sample, we find that the two effects exactly offset on average, which
is why the Bayesian MT view delivers a replication rate identical to the OLS-
basedrate.Specifically,ourestimatedreplicationraterisesto82.4%(thesixth
bar of Figure 1) using our Bayesian approach to the MT problem.7 The intu-
itionbehindthissurprisingresultissimplythathavingmanyfactors(a“factor
zoo”)canbeastrengthratherthanaweaknesswhenassessingthereplicabil-
ity of factor research. It is obvious that our posterior is tighter when a factor
hasperformedbetterandhasalongertimeseries.Buttheposteriorisfurther
tightened if similar factors have also performed well and if additional data
showthatthesefactorshaveperformedwellinmanyothercountries.8
Benefits of our model beyond the replication rate. One of the key benefits of
Bayesianstatisticsisthatonerecoversnotjustapointestimatebutratherthe
entire posterior distribution of parameters. The posterior allows us to make
any possible probability calculation about parameters. For example, in addi-
tion to the replication rate, we calculate the posterior probability of false dis-
coveries (FDR) and the posterior expected fraction of true factors. Moreover,
we calculate Bayesian confidence intervals (also called credibility intervals)
foreachoftheseestimates.Wefindthatour82.4%replicationratehasatight
posterior standard error of 2.8%. The posterior Bayesian FDR is only 0.1%
witha95%confidenceintervalof[0.0%,1.0%],demonstratingthesmallriskof
falsediscoveries.Theexpectedfractionoftruefactorsis94.0%withaposterior
standarderrorof1.3%.
Global replication. Having found a high degree of internal validity of prior
research, we next consider external validity across countries and over time.
Regarding the former, we investigate how our conclusions are affected when
weextendthedatatoincludeallfactorsinalargeglobalpanelof93countries.
ThelastbarinFigure1showsthatbasedontheglobalsample,thefinalrepli-
cation rate is 82.4%. This estimate is based on the Bayesian model applied to
a sample of global factors that weights country-specific factors in proportion
to the country’s total market capitalization. The model continues to account
for MT. The global result shows that factor performance in the United States
7OurBayesianapproachleadstoanevenlargerincreaseinthereplicationratewhenusing
pure value-weighted returns (see Figure IA.1 of the Internet Appendix) and when considering
globalevidenceoutsidetheUnitedStates(asweshowlater,inFigure6).
8Taking this intuition further, we can obtain additional information from studying whether
factorsworkinotherassetclasses,ashasbeendoneforvalueandmomentum(Asness,Moskowitz,
andPedersen(2013)),bettingagainstbeta(FrazziniandPedersen(2014)),time-seriesmomentum
(Moskowitz,Ooi,andPedersen(2012)),andcarry(Koijenetal.(2018)).
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2470 TheJournalofFinance®
replicates well in an extensive cross section of countries. Serving as our fi-
nalestimate,theglobalfactorreplicationratemorethandoublesthatofHou,
Xue,andZhang(2020)bygroundingourtestsineconomictheoryandmodern
Bayesian statistics. We conclude from the global analysis that factor research
demonstratesexternalvalidityinthecrosssectionofcountries.
Postpublication performance. McLean and Pontiff (2016) find that U.S. fac-
tor returns “are 26% lower out-of-sample and 58% lower post-publication.”9
OurBayesianframework showsthat,given apriorbelief ofzeroalpha butan
OLSalpha(αˆ)thatispositive,ourposteriorbeliefaboutalphaliessomewhere
betweenzeroandαˆ.Hence,apositivebutattenuatedpostpublicationalphais
theexpectedoutcomebasedonBayesianlearning,ratherthanasignofnonre-
producibility.Further,whencomparingfactorscross-sectionally,theprediction
oftheBayesianframeworkisthathigherprepublicationalphas,ifreal,should
be associated with higher postpublication alphas on average. This is what we
find.Wepresentnewandsignificantcross-sectionalevidencethatfactorswith
higherin-samplealphagenerallyhavehigherout-of-samplealpha.Theatten-
uationinthedataissomewhatstrongerthanpredictedbyourBayesianmodel.
Weconcludethatfactorresearchdemonstratesexternalvalidityinthetimese-
ries, but there appears to be some decay of the strongest factors that could be
duetoarbitrageordatamining.10
Publication bias. We also address the issue that factors with strong in-
sample performance are more likely to be published while poorly performing
factorsaremorelikelytobeunobservedintheliterature.Publicationbiascan
influenceourfull-sampleBayesianevidencethroughtheempiricalBayes(EB)
estimationofpriorhyperparameters.Toaccountforthisbias,weshowhowto
pick a prior distribution that is unaffected by publication bias by using only
out-of-sampledataorestimatesfromHarvey,Liu,andZhu(2016).Usingsuch
priors, the full-sample alphas are shrunk more heavily toward zero. The re-
sult is a slight drop in the U.S. replication rate to 81.5%. If we add an extra
degree of conservatism to the prior, the replication rate drops to 79.8%. Fur-
ther, our out-of-sample evidence over time and across countries is not subject
topublicationbias.
Multidimensionalchallenge:ADarwinianviewofthefactorzoo.Harvey,Liu,
andZhu(2016)challengethesheernumberoffactors,whichCochrane (2011)
refers to as “the multidimensional challenge.” We argue that the factor uni-
verse should not be viewed as hundreds of distinct factors. Instead, factors
cluster into a relatively small number of highly correlated themes. This prop-
ertyfeaturesprominentlyinourBayesianmodelingapproach.Specifically,we
proposeafactortaxonomythatalgorithmicallyclassifiesfactorsinto13themes
9Extendingtheevidencetoglobalstockmarkets,JacobsandMüller(2020)findthat“theUnited
Statesistheonlycountrywithareliablepost-publicationdeclineinlong-shortreturns.”Chenand
Zimmermann (2020b) use Bayesian methods to estimate bias-corrected postpublication perfor-
manceandfindthataveragereturnsdropbyonly12%afterpublicationinU.S.data.
10Datapriortothesampleusedinoriginalstudiesalsoconstituteout-of-sampleevidence(Lin-
nainmaaandRoberts(2018),Ilmanenetal.(2021)).Ourexternalvalidityconclusionsholdwhen
wealsoincludepre–original-studyout-of-sampleevidence.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2471
possessingahighdegreeofwithin-themereturncorrelationandeconomiccon-
ceptsimilarity,andlowacross-themecorrelation.Theemergenceofthemesin
whichfactorsareminorvariationsonarelatedideaisintuitive.Forexample,
each value factor is defined by a specific valuation ratio, but there are many
plausible ratios. Considering their variations is not spurious alpha-hacking,
particularlywhenthe“correct”valuesignalconstructionisdebatable.
We estimate a replication rate greater than 50% in 11 of the 13 themes
(basedontheBayesianmodelincludingMTadjustment),theexceptionsbeing
“lowleverage”and“size”factorthemes.Wealsoanalyzewhichthemesmatter
when simultaneously controlling for all other themes. To do so, we estimate
the ex post tangency portfolio of 13 theme-representative portfolios. We find
that 10 of the 13 themes enter into the tangency portfolio with significantly
positiveweights,wherethethreedisplacedthemesare“profitability,”“invest-
ment,”and“size.”
Why, the profession asks, have we arrived at a “factor zoo”?11 Evidently the
answer is because the risk-return trade-off is complex and difficult to mea-
sure.Thecomplexitymanifestsinourinabilitytoisolateasinglesilver-bullet
characteristicthatpinsdowntherisk-returntrade-off.Classifyingfactorsinto
themes, we trace the economic culprits to roughly a dozen concepts. This is
already a multidimensional challenge, but it is compounded by the fact that
within a theme there are many detailed choices for how to configure the eco-
nomic concept, which results in highly correlated within-theme factors. To-
gether, the themes (and the factors in them) each make slightly different con-
tributionstoourcollectiveunderstandingofmarkets.Amorepositivetakeon
thefactorzooisnotasacollectiveexerciseindataminingandfalsediscovery,
butratherasanaturaloutcomeofadecentralizedeffortinwhichresearchers
make contributions that are correlated with, but incrementally improve on,
thebodyofknowledge.
Economicimplications.Ourfindingshavebroadimplicationsforfinancere-
searchersandpractitioners.Weconfirmthatthebodyoffinanceresearchcon-
tainsamultitudeofreplicableinformationaboutthedeterminantsofexpected
returns. Further, we show that investors would have profited from factors
deemed significant by our Bayesian method but insignificant by the frequen-
tist MT method proposed by Harvey, Liu, and Zhu (2016). Figure 2 plots the
out-of-sample returns of the subset of factors discovered by our method but
discardedbythefrequentistmethod.Ascanbeseen,thesefactorsproducean
annualizedinformationratio(IR)of0.93intheUnitesStatesand1.10globally
(ex-U.S.) over the full sample, with t-statistics above five. If we restrict anal-
ysis to the sample after that of Harvey, Liu, and Zhu (2016), the performance
11See Bryzgalova, Huang, and Julliard (2023), Kelly, Pruitt, and Su (2019), Chordia, Goyal,
andSaretto(2020),Kozak,Nagel,andSantosh(2020),Green,Hand,andZhang(2017),andFeng,
Giglio, and Xiu (2020) for other perspectives on high-dimensional asset pricing problems, and
Chen(2021)foranargumentregardingwhyp-hackingcannotexplaintheexistenceofsomany
significantfactors.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2472 TheJournalofFinance®
Figure2. Out-of-sampleperformanceofmarginallysignificantfactors.Thefigureshows
thecumulativeCAPMalphaofanaverageoffactorssignificantunderourempiricalBayesframe-
work,butnotwiththeBenjamini-YekutieliadjustmentsuggestedbyHarvey,Liu,andZhu(2016).
Thesignificancecutoffsarereestimatedeachyearwiththeavailabledata.Factorsareeligiblefor
inclusionafterthesampleperiodintheoriginalpaper,soallreturnsareout-of-sample.Thetable
showstheIR(alphadividedbyresidualvolatility)forthefullsample(1990to2020)andthepost–
Harvey,Liu,andZhu(2016)sample(2013to2020)witht-statisticsinparentheses.Thevertical
dottedlineisatDecember2012.(Colorfigurecanbeviewedatwileyonlinelibrary.com)
differential remains large and significant.12 These findings show strong ex-
ternal validity (postoriginal publications, post–Harvey, Liu, and Zhu (2016),
differentcountries)andsignificanteconomicbenefitsofexploitingthejointin-
formation in all factor returns rather than simply applying a high cutoff for
t-statistics. We also show that the optimal risk-return profile has improved
over time as factors have been discovered. In other words, the Sharpe ratio
of the tangency portfolio has meaningfully increased over time as truly novel
determinantsofreturnshavebeendiscovered.Thesefindingscanhelpinform
assetpricingtheory.
The paper proceeds as follows. Section I describes our Bayesian model of
factor replication. Section II presents our new public data set of global fac-
tors. Section III contains our empirical assessment of factor replicability. Sec-
tionIVconcludes.
I. ABayesianModelofFactorReplication
This section presents our Bayesian model for assessing factor replicability.
WefirstdrawoutsomebasicimplicationsoftheBayesianframeworkforinter-
preting evidence on individual factor alphas. We then present a hierarchical
structure for simultaneously modeling factors in a variety themes and across
manycountries.
12Theout-of-sampleperformanceacrossallsignificantfactorsunderEBisalsohighlysignifi-
cantasshowninFigureIA.2oftheInternetAppendix.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
|     | IsThereaReplicationCrisisinFinance? |     |     |     |     |     |     | 2473 |
| --- | ----------------------------------- | --- | --- | --- | --- | --- | --- | ---- |
A. LearningaboutAlpha:TheBayesCase
A.1. PosteriorAlpha
We begin by considering an excess return factor, f . A study of “anomalous”
t
factor returns requires a risk benchmark, without which we cannot separate
distinctivefactorbehaviorfromrun-of-the-millriskcompensation.Weassume
a CAPM benchmark due to its history as a factor research benchmark for
decades, and because it is not mechanically related to any of the factors that
we attempt to replicate (in contrast to, say, the model of Fama and French
(1993), which by construction explains size and value factors). A factor’s net
performanceversustheexcessmarketfactor(rm)isitsα,
t
|     |     |     | =α+βrm+ε |     | .   |     |     |     |
| --- | --- | --- | -------- | --- | --- | --- | --- | --- |
|     |     |     | f t      |     | t   |     |     | (1) |
t
Our Bayesian prior is that the alpha is normally distributed with mean zero
τ2, α ∼N(0,τ2).
| and variance | or  |     | The | mean | of zero | implies | that CAPM | holds |
| ------------ | --- | --- | --- | ---- | ------- | ------- | --------- | ----- |
τ
on average, and governs potential deviations from CAPM. Intuitively, the
highertheconfidenceintheprior,thelowerisτ.Theerrorterm,ε ∼N(0,σ2),
t
σ
has volatility and is independent and identically distributed over time, and
σ andβ areobservable.13
The risk-adjusted return, α, is estimated as the average market-adjusted
| factorreturnfromT | periodsofdata, |                |        |         |     |         |     |     |
| ----------------- | -------------- | -------------- | ------ | ------- | --- | ------- | --- | --- |
|                   |                | (cid:2)(cid:3) |        | (cid:4) |     | (cid:2) |     |     |
|                   |                | 1              |        |         | 1   |         |     |     |
|                   | αˆ             | =              | f −βrm |         | =α+ | ε       | .   | (2) |
|                   |                |                | t      | t       |     | t       |     |     |
|                   |                | T              |        |         | T   |         |     |     |
|                   |                |                | t      |         |     | t       |     |     |
This observed OLS estimate αˆ is distributed N(α,σ2/T) given the true alpha,
α. From Bayes’ rule, we can compute the posterior distribution of the true
alpha given the empirical evidence and prior. The posterior exhaustively de-
scribes the Bayesian’s beliefs about alpha at a future time t >T given past
experience,includingtheposteriorexpectedfactorperformance,
|     |     |     |     | (cid:5) | (cid:6) (cid:7) |     |     |     |
| --- | --- | --- | --- | ------- | --------------- | --- | --- | --- |
(cid:6)
m(cid:6)
|     |     | E(α|αˆ)=E |     | f −βr | αˆ        | .   |     | (3) |
| --- | --- | --------- | --- | ----- | --------- | --- | --- | --- |
|     |     |           |     | t     | t (cid:6) |     |     |     |
We derive the posterior alpha distribution via Bayes’ rule (the derivation,
which is standard, is shown in Appendix A). The posterior alpha is normal
withmean
|     |     |     | E(α|αˆ)= |     | καˆ, |     |     | (4) |
| --- | --- | --- | -------- | --- | ---- | --- | --- | --- |
13Here, we seek to derive some simple expressions that illustrate the economic implications
ofBayesianlogic.Intheempiricalimplementation,weuseaslightlyrichermodel,asdiscussed
furtherbelow.Theempiricalimplementationnormalizesfactorssothatσ isgivenat10%forall
factors,whileβ mustbeestimated,butthisdoesnotaffecttheeconomicpointsthatwemakein
thissection.

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
TheJournalofFinance®
2474
whereκ isashrinkagefactorgivenby
τ2
1
|     | κ   | =       | =   | ∈ (0,1) |     | (5) |
| --- | --- | ------- | --- | ------- | --- | --- |
|     |     | τ2+σ2/T | σ2  |         |     |     |
1+
τ2T
andtheposteriorvarianceis
σ2
1
|     |     | Var(α|αˆ)=κ | =    | .   |     | (6) |
| --- | --- | ----------- | ---- | --- | --- | --- |
|     |     |             | T 1  | + 1 |     |     |
|     |     |             | σ2/T | τ2  |     |     |
The first insight from this posterior is that a Bayesian predicts that future
returns will have smaller alpha (in absolute value) than the OLS estimate αˆ,
becausetheposteriormean(καˆ)mustliebetweenαˆ
andthepriormeanofzero.
Put differently, a large observed alpha might be due to luck. Given the prior,
weexpectthatatleastpartofthisperformanceisindeedluck.Themoredata
wehave(higherT),thelessshrinkagethereis(i.e.,κ
closertoone),whilethe
stronger is the prior of zero alpha (i.e., lower τ), the heavier is the shrinkage.
Wecanthinkofthepriorτ
intermsofthenumberoftimeperiodsofevidence
thatitcorrespondsto.Thatis,theposteriormean,E(α|αˆ),correspondstofirst
observingσ2/τ2timeperiodswithanaveragealphaofzero,followedbyT time
periodswithaaveragealphaofαˆ.
Whenevaluatingout-of-sampleevidence,apositivebutloweralphaissome-
times interpreted as a sign of replication failure. But this is the expected out-
comefromtheBayesianperspective(i.e.,basedonthelatestposterior)andcan
be fully consistent with a high degree of replicability. In fact, postpublication
results(asalsostudiedbyMcLeanandPontiff(2016))havetendedtoconfirm
the Bayesian’s beliefs and as a result the Bayesian posterior alpha estimate
hasbeenextraordinarilystableovertime(seeSectionIII.B.2).
A.2. Alpha-Hacking
Because out-of-sample alpha attenuation is not generally a sign of repli-
cation failure, we may want a more direct probe for nonreplicability. We can
buildsuchatestintoourBayesianframeworkbyembeddingscopefor“alpha-
hacking,”orselectivelyreportingormanipulatingdatatoartificiallymakethe
alpha seem larger. We represent this idea using the following distribution of
| factorreturnsinthein-sampleperiodt |     |           | =1,...,T:                 |          |     |     |
| ---------------------------------- | --- | --------- | ------------------------- | -------- | --- | --- |
|                                    |     | =α+βrm+ε˜ | +u.                       |          |     |     |
|                                    |     | f         |                           |          |     | (7) |
|                                    |     | t         | t (cid:8)t(cid:9)(cid:10) | (cid:11) |     |     |
ε
t
| ε˜ ∼N(0,σ2) |          |       |               | u∼N(ε¯,σ2) |            |     |
| ----------- | -------- | ----- | ------------- | ---------- | ---------- | --- |
| Here, t     | captures | usual | return shocks | and        | represents |     |
u
return inflation due to alpha-hacking. The total in-sample return shock ε is
t
normally distributed, N(ε¯,σ¯2),where ε¯≥0 isthe alpha-hacking bias, and the
σ¯2 =σ2+σ2 ≥σ2
| variance |     | is elevated | due to | the artificial noise | created | by  |
| -------- | --- | ----------- | ------ | -------------------- | ------- | --- |
u

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
|     |     | IsThereaReplicationCrisisinFinance? |     |     |     | 2475 |
| --- | --- | ----------------------------------- | --- | --- | --- | ---- |
alpha-hacking.14 Naturally, the false benefits of alpha-hacking disappear in
|               |       |             | ε ∼N(0,σ2) |     | >T.   |          |
| ------------- | ----- | ----------- | ---------- | --- | ----- | -------- |
| out-of-sample | data, | or in other | words,     | for | t The | Bayesian |
t
accountsforalpha-hackingasfollows.
PROPOSITION 1 (Alpha-Hacking): The posterior alpha with alpha-hacking is
givenby
|     |     | E(α|αˆ)= | −κ +κhackingαˆ, |     |     | (8) |
| --- | --- | -------- | --------------- | --- | --- | --- |
0
| κhacking | =     | ≤κ    | κ =κhackingε¯≥0. |          | κhacking | →0     |
| -------- | ----- | ----- | ---------------- | -------- | -------- | ------ |
| where    |       | 1 and |                  | Further, |          | in the |
|          | 1+σ¯2 |       | 0                |          |          |        |
τ 2
|                   |     | T acking,”τ | →0orσ¯ →∞. |     |     |     |
| ----------------- | --- | ----------- | ---------- | --- | --- | --- |
| limitof“purealpha |     | - h         |            |     |     |     |
TheBayesianposterioralphaaccountsforalpha-hackingintwoways.First,
theestimatedalphaisshrunkmoreheavilytowardzerosincethefactorκhacking
is now smaller. Second, the alpha is further discounted by the intercept term
κ
0 duetothebiasintheerrorterms.
We examine alpha-hacking empirically in Section III.B in light of Propo-
sition 1. We consider a cross-sectional regression of factors’ out-of-sample
(e.g., postpublication) alphas on their in-sample alphas, looking for the sig-
natures of alpha-hacking in the form of a negative intercept term or a slope
coefficient that is too small. In addition, Section III.C.2 shows how to esti-
mate the Bayesian model in a way that is less susceptible to the effects of
alpha-hacking. Appendix A presents additional theoretical results character-
izingalpha-hacking.
B. HierarchicalBayesianModel
B.1. SharedAlphas:TheCaseofCompletePooling
We now embed a critical aspect of factor research into our Bayesian frame-
work: Factors are often correlated and conceptually related to each other. For
concreteness, we begin with a setting in which the researcher has access to
“domestic” evidence in (1) as well as “global” evidence from an international
factor, fg,withknownexposureβgtotheglobalmarketindexrg:
| t   |     |     |               |     | t   |     |
| --- | --- | --- | ------------- | --- | --- | --- |
|     |     |     | fg=α+βgrg+εg. |     |     | (9) |
|     |     |     | t t           | t   |     |     |
Here,weassumethatthetruealphaforthisglobalfactoristhesameasthedo-
mesticalpha.Inotherwords,wehavecomplete“pooling”ofinformationabout
alphaacrossthetwosamples.Asanalternativeinterpretation,theresearcher
couldhaveaccesstotworelatedfactors,say,twodifferentvaluefactorsinthe
samecountry,andassumethattheyhavethesamealphabecausetheycapture
thesameinvestmentprinciple.
14Wenotethatthiselevatedvariancecannotbedetectedbylookingatthein-samplevariance
ofresidualreturnssincethealpha-hackingtermudoesnotdependontimet.

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
TheJournalofFinance®
2476
The global shock, εg, is normally distributed N(0,σ2), and εg and ε are
|     | t   |     |     | t   | t   |
| --- | --- | --- | --- | --- | --- |
ρ.15
jointly normal with correlation The estimated alpha based on the global
evidenceissimplyitsmarket-adjustedreturn:
|     |     |     | (cid:2)(cid:3) | (cid:4) |     |
| --- | --- | --- | -------------- | ------- | --- |
1
|     |     | αˆg= | fg−βgrg | .   | (10) |
| --- | --- | ---- | ------- | --- | ---- |
|     |     |      | t       | t   |      |
T
t
To see the power of global evidence (or, more generally, the power of ob-
servingrelatedstrategies),weconsidertheposteriorwhenobservingboththe
domesticandglobalevidence.
PROPOSITION2(ThePowerofSharedEvidence):Theposterioralphagiventhe
|     | αˆ, |     |     | αˆg, |     |
| --- | --- | --- | --- | ---- | --- |
domestic estimate, and the global estimate, is normally distributed with
mean
|     |     |              | (cid:5) | (cid:7) |      |
| --- | --- | ------------ | ------- | ------- | ---- |
|     |     |              | 1       | 1       |      |
|     |     | E(α|αˆ,αˆg)= | κg αˆ   | + αˆg . | (11) |
|     |     |              | 2       | 2       |      |
Theglobalshrinkageparameteris
1
|     |     | κg= | ∈[κ,1], |     | (12) |
| --- | --- | --- | ------- | --- | ---- |
σ2 1+ρ
1+
τ2T 2
which decreases with the correlation ρ, attaining the minimum value, κg=κ,
whenρ =1.Theposteriorvarianceislowerwhenobservingbothdomesticand
globalevidence:
Var(α|αˆ)≥Var(α|αˆ,αˆg).
(13)
Naturally,theposteriordependsontheaveragealphaobserveddomestically
and globally. Furthermore, the combined alpha is shrunk toward the prior of
zero.Theshrinkagefactorκgissmaller(heaviershrinkage)ifthemarketsare
more correlated because the global evidence provides less new information.
With low correlation, the global evidence adds a lot of independent informa-
tion, shrinkage is lighter, and the Bayesian becomes more confident in the
data and less reliant on the prior. The proposition shows that if a factor has
been found to work both domestically and globally, then the Bayesian expects
strongerout-of-sampleperformancethanafactorthathasonlyworkeddomes-
tically(orhasonlybeenanalyzeddomestically).
Two important effects are at play here, and both are important for under-
standing the empirical evidence presented below: The domestic and global al-
phasareshrunkbothtowardeachotherandtowardzero.Forexample,suppose
αˆ =10%>αˆg=0%.
| that a factor | worked domestically |     | but not globally, | say, |     |
| ------------- | ------------------- | --- | ----------------- | ---- | --- |
15Theframeworkcanbegeneralizedtoasituationinwhichtheglobalshockshaveadifferent
volatilityandsamplelength.Inthiscase,theBayesianposteriorputsmoreweightonthesample
withlowervolatilityandlongerlength.

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
|     |     | IsThereaReplicationCrisisinFinance? |     |     |     |     |     | 2477 |
| --- | --- | ----------------------------------- | --- | --- | --- | --- | --- | ---- |
Then, the overall evidence points to an alpha of 1αˆ + 1αˆg=5% but shrinkage
2 2
towardthepriorresultsinalowerposterior,say,2.5%.Hence,theBayesianex-
pectsfuturefactorreturnsinbothregionsof2.5%.Thefactthatsharedalphas
areshrunktogetherisakeyfeatureofajointmodel,anditgenerallyleadsto
differentconclusionsthanwhenfactorsareevaluatedindependently.Wenext
consider a perhaps more realistic model in which factors are only partially
shrunktowardeachother.
B.2. HierarchicalAlphas:TheCaseofPartialPooling
We now consider several factors, numbered i=1,...,N. Factor i has a true
alphagivenby
|     |     |     | αi  | =c+wi. |     |     |     |     |
| --- | --- | --- | --- | ------ | --- | --- | --- | --- |
(14)
Here,cisthecommoncomponentofallalphas,whichhasapriordistribution
given by N(0,τ2). Likewise, wi is the idiosyncratic alpha component, which
c
N(0,τ2),
has a prior distribution given by independent of c and across i. Put
|     |     |     |     | w   |     |     | N(0,τ2) |     |
| --- | --- | --- | --- | --- | --- | --- | ------- | --- |
differently, we can imagine that nature first picks the overall c from
c
| andthenpicksthefactor-specificαi |     |     |     | fromN(c,τ2). |     |     |     |     |
| -------------------------------- | --- | --- | --- | ------------ | --- | --- | --- | --- |
w
This hierarchical model is a realistic compromise between assuming that
all factor alphas are completely different (using equation (4) for each alpha
separately) and assuming that they are all the same (using Proposition 2).
Rather than assuming no pooling or complete pooling, the hierarchical model
allowsfactorstohaveacommoncomponentandanidiosyncraticcomponent.
Supposeweobservefactorreturnsof
|     |     |     | fi =αi+βirm+εi, |     |     |     |     |     |
| --- | --- | --- | --------------- | --- | --- | --- | --- | --- |
(15)
|     |     |     | t   | t   | t   |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| εi  |     |     |     |     |     |     | σ2, |     |
where are normally distributed with mean zero and variance and
t
| Cor(ε i,ε j)=ρ | ≥0       |         | i, j.16   |     |              |       |           |     |
| -------------- | -------- | ------- | --------- | --- | ------------ | ----- | --------- | --- |
|                | (cid:12) | for all | Computing |     | the observed | alpha | estimates | as  |
t t
above,αˆi = 1 (fi−βirm),wederivetheposteriorinthefollowingresult.17
|     | T t | t   | t   |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
PROPOSITION3(HierarchicalAlphas):Theposterioralphaoffactorigiventhe
evidenceonallfactorsisnormallydistributedwithmean
|                    |     |        |                 |     | ⎛       |     |               | ⎞   |
| ------------------ | --- | ------ | --------------- | --- | ------- | --- | ------------- | --- |
| E(αi|αˆ1,...,αˆN)= |     |        | 1               | ·+  | 1 ⎝αˆi− |     | 1             | ·⎠, |
|                    |     |        |                 | αˆ  |         |     |               | αˆ  |
|                    |     | 1+ ρσ2 | + τ 2+(1−ρ)σ2/T | 1+  | (1−ρ)σ2 | 1+  | τ 2+(1−ρ)σ2/T |     |
|                    |     |        | w               |     |         |     | w             |     |
|                    |     | τ 2T   | τ 2N            |     | τ w 2T  |     | (τ 2+ρσ2/T)N  |     |
|                    |     | c      | c               |     |         |     | c             |     |
(16)
16Alternat ively,w√ecanwritetheerrortermsinasimilarwayaswewritethealphasin(14),
√
namely,ε i= ρε˜t + 1−ρε˜ i,whereε˜ iareidiosyncraticshocksthatareindependentacrossfac-
| t   |     |     | t t |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
torsandofthecommonshockε˜t,withVar(ε˜ i)=Var(ε˜t)=σ2.Notethatwerequire(theempiri-
t
callyrealisticcase)thatρ≥0sincewecannothaveanarbitrarilylargenumberofnormalrandom
variableswithequalnegativecorrelation(becausethecorrespondingvariance-covariancematrix
wouldnotbepositivesemidefiniteforlargeenoughN).
17Thegeneralhierarchicalmodelisusedextensivelyinthestatisticsliterature(see,e.g.,Gel-
manetal.(2013)),buttoourknowledgetheresultsinProposition3arenotintheliterature.

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
TheJournalofFinance®
2478
(cid:12)
whereαˆ· = 1 αˆj isaveragealpha.WhenthenumberoffactorsN grows,the
N j
limitis
|     |     |                    | 1   |        | 1       | (cid:3) | (cid:4) |      |
| --- | --- | ------------------ | --- | ------ | ------- | ------- | ------- | ---- |
|     |     | E(αi|αˆ1,...,αˆN)= |     | αˆ ·+  |         | αˆi−    | αˆ · .  |      |
|     |     | lim                |     |        |         |         |         | (17) |
|     | N→∞ |                    | 1+  | ρσ2 1+ | (1−ρ)σ2 |         |         |      |
|     |     |                    |     | τ2T    | τ2T     |         |         |      |
|     |     |                    |     | c      | w       |         |         |      |
The posterior variance of factor i’s alpha using the information in all factor
returns is lower than the posterior variance when looking at this factor in iso-
lation,
|     |     | Var(αi|αˆ1,...,αˆN)<Var(αi|αˆi). |     |     |     |     |     | (18) |
| --- | --- | -------------------------------- | --- | --- | --- | --- | --- | ---- |
→∞,itslimitis
| TheposteriorvarianceisdecreasinginN |                            |     |      | and,asN |     |         |     |      |
| ----------------------------------- | -------------------------- | --- | ---- | ------- | --- | ------- | --- | ---- |
|                                     |                            |     | ρσ2  | (1−ρ)σ2 |     |         |     |      |
|                                     |                            |     |      | 1       |     | 1       |     |      |
|                                     | Var(αi|αˆ1,...,αˆN)(cid:9) |     |      | +       |     |         | .   | (19) |
|                                     |                            |     |      | ρσ2     |     | (1−ρ)σ2 |     |      |
|                                     |                            |     | T 1+ |         | T   | 1+      |     |      |
|                                     |                            |     |      | τ2T     |     |         | τ2T |      |
|                                     |                            |     |      | c       |     |         | w   |      |
The main insight of this proposition is that having data on many factors is
helpful for estimating the alpha of any of them. Intuitively, the posterior for
anyindividualalphadependsonalloftheotherobservedalphasbecausethey
are all informative about the common alpha component. Put differently, the
otherobservedalphastelluswhetheralphaexistsingeneral,thatis,whether
theCAPMappearstobeviolatedingeneral.Further,thefactor’sownobserved
alphatellsuswhetherthisspecificfactorappearstobeespeciallygoodorbad.
Usingallofthefactorsjointlyreducesposteriorvarianceforallalphas.Insum-
mary, the joint model with hierarchical alphas has the dual benefits of identi-
fyingthecommoncomponentinalphasandtighteningconfidenceintervalsby
sharinginformationamongfactors.
Tounderstandthepropositioninmoredetail,considerfirstthe(unrealistic)
caseinwhichallfactorreturnshaveindependentshocks(ρ =0).Inthiscase,
weessentiallyknowtheoverallalphawhenweseemanyuncorrelatedfactors.
Indeed,theaverageobservedalphabecomesapreciseestimatoroftheoverall
alphawithmoreandmoreobservedfactors,αˆ· →c.Sinceweessentiallyknow
the overall alpha in this limit, the first term in (17) becomes 1×αˆ· when ρ =
0, meaning that we do not need any shrinkage here. The second term is the
outperformance of factor i above the average alpha, and this outperformance
isshrunktowardourpriorofzero.Indeed,theoutperformanceismultipliedby
a number less than one, and this multiplier naturally decreases in the return
| volatilityσ |     | andinourconvictionintheprior(increasesinτ |     |     |     | ).  |     |     |
| ----------- | --- | ----------------------------------------- | --- | --- | --- | --- | --- | --- |
w
Theposteriorvarianceisalsointuitiveinthecaseρ =0.Theposteriorvari-
ance is clearly lower compared to only observing the performance of factor i
itself,
σ2 σ2
|     |                     |     | 1     |      | 1        |               |     |      |
| --- | ------------------- | --- | ----- | ---- | -------- | ------------- | --- | ---- |
|     | Var(αi|αˆ1,αˆ2...)= |     |       | <    |          | =Var(αi|αˆi), |     | (20) |
|     |                     | T   | 1+ σ2 | T 1+ | σ2       |               |     |      |
|     |                     |     | τ2T   |      | (τ2+τ2)T |               |     |      |
|     |                     |     | w     |      | c w      |               |     |      |

IsThereaReplicationCrisisinFinance? 2479
basedon(19)and(6).Withpartialpooling,theposteriorvariancedecreasesbe-
causethedenominatorontheleftdoesnothaveτ2,reflectingthatuncertainty
c
aboutthegeneralalphahasbeeneliminatedbyobservingmanyfactors.
In the realistic case in which factor returns are correlated (ρ >0), we see
that both the average alpha αˆ· and factor i’s outperformance αˆi− αˆ· are
shrunk toward the prior of zero. This is because we cannot precisely esti-
mate the overall alpha even with an infinite number of correlated factors—
the correlated part never vanishes. Nevertheless, we still shrink the con-
fidence interval, Var(αi|αˆ1,...,αˆN)≤Var(αi|αˆi), since more information is
alwaysbetterthanless.
B.3. MultilevelHierarchicalModel
The model development to this point is simplified to draw out its intuition.
Our empirical implementation is based on a more realistic (and slightly more
complex) model that accounts for the fact that factors naturally belong to dif-
ferenteconomicthemesandtodifferentregions.
Inourglobalanalysis,wehaveN differentcharacteristicsignals(e.g.,book-
to-market)acrossK regions,foratotalofNK factors(e.g.,U.S.,developed,and
emerging markets versions of book-to-market). Each of the N signals belongs
to a smaller number of J theme clusters, where one cluster consists of vari-
ous value factors, another consists of various momentum factors, and so on.
One level of our hierarchical model allows for partially shared alphas among
factorsinthesamethemecluster.Anotherlevelallowsforcommonalityacross
regionsamongfactorsassociatedwiththesameunderlyingcharacteristic,cap-
turing,forexample,theconnectionsbetweenthebook-to-marketfactorsindif-
ferentmarkets.
Mathematically,thismeansthatanindividualfactorihasanalphaof
αi =αo+cj+sn+wi. (21)
Toillustrate,supposefactori∈{1,...,NK}isthebook-to-marketfactorinthe
U.S. region. Part of its alpha is driven by a component that is common to all
factors, αo, which we dogmatically fix at zero to be conservative. In addition,
this factor i belongs to the value cluster j ∈{1,...,J}, which contributes a
cluster-specific alpha cj ∼N(0,τ2). Next, since factor i is based on book-to- c
market characteristic n∈{1,...,N}, it has an incremental signal-specific al-
pha of sn ∼N(0,τ2) that is shared across regions—for example, it is the com-
s
mon behavior among book-to-market factors regardless of geography. Finally,
wi ∼N(0,τ2) is factor i’s idiosyncratic alpha, namely, the incremental alpha
w
thatisuniquetotheU.S.versionofbook-to-market.
Wewritethismodelinvectorformas18
α =αo1 +Mc+Zs+w, (22)
NK
18Thenotation1 referstoanN×1vectorofonesandI istheN×Nidentitymatrix.
N N
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2480 TheJournalofFinance®
where α = (α1,...,αNK)(cid:10), c= (c1,...,cJ)(cid:10), s= (s1,...,sN)(cid:10), w= (w1,...,wNK)(cid:10),
M is the NK×J matrix of cluster memberships, and Z is the NK×N matrix
indicating the characteristic that factor i is based on. In particular, M i,j =1
if factor i is in cluster j and M i,j =0 otherwise. Likewise, Z i,n =1 if factor i
is based on characteristic n and Z i,n =0 otherwise. This hierarchical model
impliesthatthepriorvarianceofalpha,denotedby(cid:9),is19
(cid:9)=Var(α)=MM (cid:10)τ2+ZZ (cid:10)τ2+I τ2. (23)
c s NK w
In some cases, we analyze this model within a single region, K =1 (e.g.,
in our U.S.-only analysis). In this case, there is no difference between signal-
specific alphas and idiosyncratic alphas, so we collapse one level of the model
bysettingτs =0andsn =0forn∈{1,...,N}.Inanycase,thefollowingresult
showshowtocomputetheposteriordistributionofallalphasbasedontheprior
uncertainty,(cid:9),andageneralvariance-covariancematrixofreturnshocks,(cid:10)=
Var(ε).Thisresultisattheheartofourempiricalanalysis.
PROPOSITION4: Inthemultilevelhierarchicalmodel,theposteriorofthevector
oftruealphasisnormallydistributedwithposteriormean
(cid:3) (cid:4) (cid:3) (cid:4)
E(α|αˆ)= (cid:9)−1+T(cid:10)−1 −1 (cid:9)−11 α +T(cid:10)−1αˆ (24)
NK 0
andposteriorvariance
(cid:3) (cid:4)
Var(α|αˆ)= (cid:9)−1+T(cid:10)−1 −1. (25)
Asnotedabove,wesetthemeanprioralphatozero(α =0)inourempirical
0
implementation.Thispriorisbasedoneconomictheoryandleadstoaconser-
vative shrinkage toward zero as seen in (24). We note that, in the data, the
observedalphasaremostlypositive,notcenteredaroundzero.However,these
positivealphasarerelatedtothewaythatfactorsaresigned,thatis,according
to the convention in the original paper, which almost always leads to a posi-
tivefactorreturnintheoriginalsample.Ifweviewthissigningconventionas
somewhatarbitrary,thenasymmetryargumentimpliesthatapriorofzerois
again natural. Put differently, factor means would be centered around zero if
wechangedsignsarbitrarily,soourpriorisagnosticaboutthesesigns.
C. BayesianMultipleTestingandEmpiricalBayesEstimation
Frequentist MT corrections embody a principle of conservatism that seeks
to limit false discoveries by controlling the family-wise error rate (FWER) or
19Stateddifferently,eachdiagonalelementof(cid:9)isτ2+τ2+τ2.Further,ifi(cid:11)=k,thenthe(i,k)th
c s w
element of (cid:9) is τ2+τ2 if i and k are constructed from the same signal in the same cluster in
c s
differentregions,itisτ2ifiandkareconstructedfromdifferentsignalsinthesamecluster,and
c
itiszeroifiandkareindifferentclusters.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2481
theFDR.Leadingfrequentistmethodsdosobywideningconfidenceintervals
andraising p-values,butdonotaltertheunderlyingpointestimate.
C.1. BayesianMultipleTesting
A large statistics literature shows that Bayesian modeling is effective for
makingreliableinferencesinthefaceofMT.20 Drawingonthisliterature,our
hierarchical model is a prime example of how Bayesian methods accomplish
theirMTcorrectionbasedontwokeymodelfeatures.
The first such feature is the model prior, which imposes statistical con-
servatism in analogy to frequentist MT methods. It anchors the researcher’s
beliefs to a sensible default (e.g., all alphas are zero) in case the data are
insufficiently informative about the parameters of interest. Reduction of false
discoveries is achieved first by shrinking estimates toward the prior. When
there is no information in the data, the alpha point estimate is the prior
mean and there are no false discoveries. As empirical evidence accumulates,
posteriorbeliefsmigrateawayfromthepriortowardtheOLSalphaestimate.
In the process, discoveries begin to emerge, though they remain dampened
relative to OLS. In the large-data limit, Bayesian beliefs converge on OLS
withnoMTcorrection,whichisjustifiedbecauseinthelimittherearenofalse
discoveries. In other words, the prior embodies a particularly flexible form of
conservatism—the Bayesian model decides how severe of an MT correction to
makebasedontheinformativenessofthedata.
Thesecondkeymodelfeatureisthehierarchicalstructurethatcapturesfac-
tors’ joint behavior. Modeling factors jointly means that each alpha is shrunk
toward its cluster mean (i.e., toward related factors), in addition to being
shrunktowardthepriorofzero.So,ifweobserveaclusteroffactorsinwhich
most perform poorly, then this evidence reduces the posterior alpha even for
the few factors with strong performance—another form of Bayesian MT cor-
rection.InadditiontothisBayesiandiscoverycontrolcomingthroughshrink-
age of the posterior mean alpha, the Bayesian confidence interval also plays
an important role and changes as a function of the data. Indeed, having data
onrelatedfactorsleadstoacontractionoftheconfidenceintervalsinourjoint
Bayesianmodel.Sowhilealphashrinkageoftenhastheeffectofreducingdis-
coveries, the increased precision from joint estimation has the opposite effect
ofenhancingstatisticalpowerandthusincreasesdiscoveries.
In summary, a typical implementation of frequentist MT corrections esti-
mates parameters independently for each factor and leaves these parameters
unchanged, but inflates p-values to reduce the number of discoveries. In con-
trast, our hierarchical model leverages dependence in the data to efficiently
learnaboutallalphassimultaneously.Alldatathereforehelptodeterminethe
20SeeGreenlandandRobins(1991),BerryandHochberg(1999),EfronandTibshirani(2002),
Gelman,Hill,andYajima(2012),amongothers.SeeGelman(2016)foranintuitive,informaldis-
cussionofthetopic.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2482 TheJournalofFinance®
center and width of each alpha’s confidence interval (Propositions 3 and 4).
Thisleadstomorepreciseestimateswith“built-in”BayesianMTcorrection.
C.2. EmpiricalBayesEstimation
Giventhecentralroleoftheprior,itmightseemproblematicthatthesever-
ity of the Bayesian MT adjustment is at the discretion of the researcher. A
powerful(andsomewhatsurprising)aspectofahierarchicalmodelisthatthe
prior can be learned in part from the data. This idea is formalized in the idea
of“empiricalBayes(EB)”estimation,whichhasemergedasamajortoolkitfor
navigatingMTinhigh-dimensionalstatisticalsettings(Efron(2012)).
ThegeneralapproachtoEBistospecifyamultilevelhierarchicalmodeland
then use the dispersion in estimated effects within each level to learn about
thepriorparametersforthatlevel.Inoursetting,thespecificimplementation
of EB is dictated by Proposition 4. We first compute each factor’s abnormal
return,αˆ,astheinterceptinaCAPMregressiononthemarketexcessreturn.
We then set the overall alpha prior mean, αo, to zero to enforce conservatism
inourinferences.
From here, the benefits of EB kick in. The realized dispersion in alphas
acrossfactorshelpsdeterminetheappropriatepriorbeliefs(i.e.,theappropri-
atevaluesforτ2,τ2,andτ2).Forexample,ifwecomputetheaveragealphafor
c s w
each cluster, cˆj (e.g., the average value alpha, the average (cid:12)momentum alpha),
the cross-sectional variation in cˆj suggests that τ2 ∼ = 1 J (cˆj−cˆ·)2. The c J−1 j=1
same idea applies to τ2. Likewise, variation in observed alphas after account- s (cid:12)
ing for hierarchical connections is informative about τ2 ∼ = 1 N (wˆi)2,
w NK−N−J i=1
wherewˆ =αˆ −Mcˆ−Zsˆ.
The above variances illustrate that EB can help calibrate prior variances
usingthedataitself.Butthosecalculationsaretoocrude,becausetheyignore
sampling variation coming from the noise in returns, ε, which has covariance
matrix (cid:10). EB estimates the prior variances by maximizing the prior likeli-
hood function of the observed alphas, αˆ ∼N(0,(cid:9)(τ ,τ ,τ )+(cid:10)ˆ/T), where the
c s w
notation emphasizes that (cid:9) depends on τ , τ , and τ according to (23). The
c s w
likelihoodfunctionaccountsforsamplingvariationthroughaplug-inestimate
of the covariance matrix of factor return shocks, (cid:10)ˆ.21 We collect the resulting
hyperparametersinτ,thatis,τ ,τ ,τ ,(cid:10)ˆ,andβi.
c s w
C.3. BayesianFDRandFWER
WiththeEBestimates(τ)inhand,wecancomputetheposteriordistribution
of the alphas from Proposition 4. From the posterior, we can in turn compute
BayesianversionsoftheFDRandFWER.Supposethatweconsiderafactorto
be“discovered”ifitsz-scoreisgreaterthanthecriticalvaluez¯=1.96,
√E(αi|(cid:17)α1,···,(cid:17)αN,τ) ≥z¯.
(26)
Var(αi|(cid:17)α1,···,(cid:17)αN,τ)
21WeprovidedetailsonourEBestimationprocedureinAppendixB.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2483
Equivalently,factoriisdiscoveredifp-null ≤2.5%,22 whereweusetheposte-
i
riortocompute
p-null =Pr(αi ≤0|αˆ1,···,αˆN,τ). (27)
i
In words, p-null is the posterior probability that the null hypothesis is true,
i
whichistheBayesianversionofafrequentistp-value.Putdifferently,itisthe
posteriorprobabilityofa“falsediscovery,”thatis,theprobabilitythatthetrue
alphaisactuallynonpositive.
WecanfurthercomputetheBayesianFDRas
(cid:5)(cid:12) (cid:6) (cid:7)
(cid:6)
FDRBayes =E (cid:12)i
1{ifalsediscovery}(cid:6)
(cid:6) αˆ1,...,αˆN,τ , (28)
i
1{idiscovery}
whereweconditiononthedataincludingatleastonediscovery(sothedenom-
inatorisnotzero);otherwise,FDRissettozero(seeBenjaminiandHochberg
(1995)).
The following proposition is a novel characterization of the Bayesian FDR,
and shows that it is the posterior probability of a false discovery, averaged
acrossalldiscoveries:
PROPOSITION 5 (Bayesian FDR): Conditional on the parameters of the prior
distribution τ and data with at least one discovery, the Bayesian FDR can be
computedas
(cid:12)
FDRBayes = 1 p-null (29)
#discoveries idiscovery i
andisbounded,FDRBayes ≤2.5%.
This result shows explicitly how the Bayesian framework controls the FDR
withouttheneedforadditionalMTadjustments.23Thedefinitionofadiscovery
ensuresthatatmost2.5%ofthediscoveriesarefalseaccordingtotheBayesian
posterior,whichisexactlytherightdistributionforassessingdiscoveriesfrom
theperspectiveoftheBayesian.Further,ifmanyofthediscoveredfactorsare
highlysignificant(asisthecaseinourdata),thentheBayesianFDRismuch
lowerthan2.5%.24
We can also compute a Bayesian version of the FWER, which is the proba-
bilityofmakingoneormorefalsediscoveriesintotal:
(cid:18) (cid:6) (cid:19) (cid:2) (cid:6)
FWERBayes =Pr 1{ifalsediscovery} ≥1 (cid:6) (cid:6) αˆ1,...,αˆN,τ . (30)
i
22Weuseacriticalvalueof2.5%ratherthan5%becausethe1.96cutoffcorrespondstoatwo-
sidedtest,whilefalsediscoveriesareonlyononesideintheBayesianframework.
23Efron(2007)includesrelatedanalysisbut,toourknowledge,thisparticularresultisnew.
24Proposition 5 formalizes the argument of Greenland and Robins (1991) that “from the
empirical-BayesorBayesianperspective,multiplecomparisonsarenotreallya‘problem.’Rather,
themultiplicityofcomparisonsprovidesanopportunitytoimproveourestimatesthroughjudi-
cioususeofanypriorinformation(intheformofmodelassumptions)abouttheensembleofpa-
rametersbeingestimated.”
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2484 TheJournalofFinance®
If we define a discovery as in (26) using the standard critical value z¯=1.96,
then we do not necessarily control the FWERBayes, which is a harsh criterion
thatisconcernedwiththeriskofasinglefalsediscoverywithoutregardforthe
numberofmisseddiscoveries.BecauseFWERBayes isaprobabilitythatcanbe
computedfromtheposterior,itisstraightforwardtochooseacriticalvaluez¯to
ensureFWERBayes ≤5%oranyotherleveloneprefers.Themainpointisthat
theBayesianapproachtoreplicationlendsitselftoanyinferentialcalculation
the researcher desires because the posterior is a complete characterization of
Bayesianbeliefsaboutmodelparameters.
C.4. AComparisonofFrequentistandBayesianFalseDiscoveryControl
We illustrate the benefits of Bayesian inference for our replication analysis
viasimulation.Weassumeafactor-generatingprocessbasedonthehierarchi-
cal model above and, for simplicity, consider a single region (as in our empir-
ical U.S.-only analysis), removing sn and τ2 from equations (21) and (23). We
s analyze discoveries as we vary the prior variances τ and τ . The remaining
c w
parametersarecalibratedtoourestimatesfortheU.S.regioninourempirical
analysisbelow.
Wesimulateaneconomywith130factorsin13differentclustersof10factors
each, observed monthly over 70 years. We assume that the mean alpha, αo,
is zero. We then draw a cluster alpha from cj ∼N(0,τ2) and a factor-specific
c alphaaswi ∼N(0,τ2).Basedonthesealphas,wegeneraterealizedreturnsby
w
addingGaussiannoise.25
We compute p-values separately using OLS with no adjustment or OLS ad-
justedusingtheBenjaminiandYekutieli(2001)(BY)method.WealsouseEB
to estimate the posterior alpha distribution, treating τ and τ as known to
c w
simplify simulations and focus on the Bayesian updating. For OLS and BY, a
discoveryoccurswhenthealphaestimateispositiveandthetwo-sided p-value
isbelow5%.ForEB,weconsideritadiscoverywhentheposteriorprobability
thatalphaisnegativeislessthan2.5%.Foreachτ andτ pair,wedraw10,000
c w
simulatedsamplesandreportaveragediscoveryratesoverallsimulations.
Figure3reportsalphadiscoveriesbasedontheOLS,BY,andEBapproaches.
Foreachmethod,wereportthetrueFDRinthetoppanels(weknowthetruth
sincethisisasimulation)andthe“truediscoveryrate”26 inthebottompanels.
When idiosyncratic variation in true alphas is small (left panels with τ =
w
0.01%)andthevariationinclusteralphasisalsosmall(valuesofτ nearzero
c
25Thenoisecovariancematrixhasablockstructurecalibratedtoourdata,withacorrelation
of0.58amongfactorsinthesameclusterandacorrelationof0.02acrossclusters.Theresidual
volatilityforeachfactoris10%perannum.
26Wedefinethetruediscoveryratetobethenumberofsignificantlypositivealphasaccording
to,respectively,OLS,BY,andEBdividedbythenumberoftrulypositivealphas.Givenoursim-
ulationstructure,halfofthealphasareexpectedtobepositiveinanysimulation.Someofthese
willbesmall(i.e.,economicallyinsignificant)positives,soatestingprocedurewouldrequireahigh
degreeofstatisticalpowertodetectthem.Thisiswhythetruediscoveryrateisbelowoneeven
forhighvaluesofτ c.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2485
Figure3. Simulationcomparisonoffalsediscoveryrates.Theupperpanelsshowthereal-
izedFDRcomputedastheproportionofdiscoveredfactorsforwhichthetruealphaisnegative,
averagedover10,000simulations.Thelowerpanelsshowthetruediscoveryratecomputedasthe
numberofdiscoveriesforwhichthetruealphaispositivedividedbythetotalnumberoffactorsfor
whichthetruealphaispositive.Theleftandrightpanelsuselowandhighvaluesofidiosyncratic
variationinalphas(τ w),respectively.Thex-axisvariesclusteralphadispersion,τ c.(Colorfigure
canbeviewedatwileyonlinelibrary.com)
onthehorizontalaxis),alphasareverysmallandtruediscoveriesareunlikely.
Inthiscase,theOLSFDRcanbeashighas25%asseenintheupperleftpanel.
However,bothBYandEBsuccessfullycorrectthisproblemandlowertheFDR.
ThelowerleftpanelshowsthattheBYcorrectionpaysahighpriceforitscor-
rectionintermsofstatisticalpowerwhenτ islarger.Incontrast,EBexhibits
c
much better power to detect true positives while maintaining a similar false
discovery control as BY. In fact, when there are more discoveries to be made
inthedata(asτ increases),EBbecomesevenmorelikelytoidentifytruepos-
c
itives than OLS. This is due to the joint nature of the Bayesian model, whose
estimates are especially precise compared to OLS due to EB’s ability to learn
more efficiently from dependent data. This result illustrates the observation
by Greenland and Robins (1991) that “Unlike conventional multiple compar-
isons,empirical-BayesandBayesapproacheswillalterandcanimprovepoint
estimates and can provide more powerful tests and more precise (narrower)
interval estimators.” When the idiosyncratic variation is larger (τ =0.20%),
w
there are many more true discoveries to be made, so the FDR tends to be low
even for OLS with no correction. Yet, in the lower right panel, we continue to
seethecostlylossofstatisticalpowersufferedbytheBYcorrection.
In summary, EB accomplishes a flexible MT adjustment by adapting to the
data-generating process. When discoveries are rare so that there is a compar-
ativelyhighlikelihoodoffalsediscovery,EBimposesheavyshrinkageandbe-
haves similarly to the conservative BY correction. In this case, the benefit of
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2486 TheJournalofFinance®
conservatismcostslittleintermsofpowerexactlybecausetruediscoveriesare
rare.Yet,whendiscoveriesaremorelikely,EBbehavesmorelikeuncorrected
OLS, giving it high power to detect discoveries and suffering little in terms of
falsediscoveriesbecausetruepositivesabound.
The limitations of frequentist MT corrections are well studied in the statis-
ticsliterature.BerryandHochberg(1999)notethat“theseproceduresarevery
conservative(especiallyinlargefamilies)andhavebeensubjectedtocriticism
for paying too much in terms of power for achieving (conservative) control of
selection effects.” The reason is that, while inflating confidence intervals and
p-valuesreducesthediscoveryoffalsepositives,italsoreducespowertodetect
truepositives.
Much of the discussion around MT adjustments in the finance literature
fails to consider the loss of power associated with frequentist corrections. But
as Greenland and Hofman (2019) point out, this trade-off should be a first-
order consideration for a researcher navigating MT, and frequentist MT cor-
rections tend to place an implicit cost on false positives that can be unrea-
sonably large. Unlike some medical contexts for example, there is no obvious
motivationforasymmetrictreatmentoffalsepositivesandmissedpositivesin
factor research. The finance researcher may be willing to accept the risk of a
few false discoveries to avoid missing too many true discoveries. In statistics,
thisissometimesdiscussedintermsofan(abstract)costofTypeIversusType
II errors,27 but in finance we can make this cost concrete: We can look at the
profitoftradingonthediscoveredfactors,wherethecostoffalsediscoveriesis
thentheresultingextrariskandmoneylost(SectionIII.C.1).
II. ANewPublicDataSetofGlobalFactors
We study a global data set with 153 factors in 93 countries. In this section,
weprovideabriefoverviewofourdataconstruction.Wehavepostedthedata
and code along with extensive documentation detailing each implementation
choicethatwemakeforeachfactor.28
A. Factors
The set of factors that we study is based on the exhaustive list compiled by
Hou, Xue, and Zhang (2020). They study 202 different characteristic signals
fromwhichtheybuild452factorportfolios.Theproliferationisduetotreating
one-, six-, and 12-month holding periods for a given characteristic as differ-
entfactors,andduetotheirinclusionofbothannualandquarterlyupdatesof
27AsGreenlandandRobins(1991)pointout,“Decisionanalysisrequires,inadditiontothelike-
lihoodfunction,alossfunction,whichindicatesthecostofeachactionunderthevariouspossible
valuesfortheunknownparameter(benefitswouldbeexpressedasnegativecosts).Constructionof
alossfunctionrequiresonetoquantifycostsintermsofdollars,liveslost,orsomeothercommon
scale.”
28Thedataandcodeareavailableathttps://jkpfactors.com/andhttps://github.com/bkelly-lab/
ReplicationCrisis.ThedatawillbeupdatedovertimeandwillalsobeavailableviaWRDS.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2487
some accounting-based factors. In contrast, we focus on a one-month holding
period for all factors, and we only include the version that updates with the
mostrecentaccountingdata—thiscouldbeeitherannualorquarterly.Finally,
weexcludeasmallnumberoffactorsforwhichdataarenotavailableglobally.
This gives us a set of 180 feasible global factors. For this set, we exclude fac-
torsbasedonindustryoranalystdatabecausetheyhavecomparativelyshort
samples.29 This leaves us with 138 factors. Finally, we add 15 factors stud-
ied in the literature that were not included in Hou, Xue, and Zhang (2020).
For each characteristic, we build the one-month-holding-period factor return
withineachcountryasfollows.First,ineachcountryandmonth,wesortstocks
into characteristic terciles (top/middle/bottom third) with breakpoints based
onnon-microstocksinthatcountry.30 Foreachtercile,wecomputeits“capped
value weight” return, meaning that we weight stocks by their market equity
winsorized at the NYSE 80th percentile. This construction ensures that tiny
stocks have tiny weights and any one mega stock does not dominate a portfo-
lioinanefforttocreatetradable,yetbalanced,portfolios.31 Thefactoristhen
defined as the high-tercile return minus the low-tercile return, corresponding
to the excess return of a long-short zero-net-investment strategy. The factor
is long (short) the tercile identified by the original paper to have the highest
(lowest)expectedreturn.
We√scale all factors such that their monthly idiosyncratic volatility is
10%/ 12 (i.e., 10% annualized), which ensures cross-sectional stationarity
and a prior that factors are similar in terms of their information ratio. Fi-
nally,wecomputeeachfactor’sαˆi viaanOLSregressiononaconstantandthe
correspondingregion’smarketportfolio.
For a factor return to be nonmissing, we require that it have at least five
stocksineachofthelongandshortlegs.Wealsorequireaminimumof60non-
missing monthly observations for each country-specific factor for inclusion in
oursample.Whengroupingcountriesintoregions(U.S.,developedex-U.S.,and
emerging), we use the Morgan Stanley Capital International (MSCI) develop-
ment classification as of January 7, 2021. When aggregating factors across
countries, we use capitalization-weighted averages of the country-specific fac-
tors. For the developed and emerging market factors, we require that at least
threecountrieshavenonmissingfactorreturns.
29Globalindustrycodes(GICS)areonlyavailablefrom2000.I/B/E/Sdataareavailablefrom
themid-1980sbutcoverageinearlyyearsissomewhatsparse.
30Specifically,westartwithallnonmicrostocksinacountry(i.e.,largerthanNYSE20th per-
centile)andsortthemintothreegroupsofequalnumbersofstocksbasedonthecharacteristic,say
book-to-market.Wethendistributethemicro-capstocksintothethreegroupsbasedonthesame
characteristicbreakpoints.Thisprocessensuresthatthenonmicrostocksaredistributedequally
acrossportfolios,creatingmoretradableportfolios.
31For robustness, Figure IA.1 of the Internet Appendix reports our replication results when
usingstandard,uncappedvalueweightstoconstructfactors.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2488 TheJournalofFinance®
B. Clusters
We group factors into clusters using hierarchical agglomerative clustering
(MurtaghandLegendre(2014)).Wedefinethedistancebetweenfactorsasone
minustheirpairwisecorrelationandusethelinkagecriterionofWard(1963).
The correlation is computed based on CAPM-residual returns of U.S. factors
signed as in the original paper. Figure IA.15 of the Internet Appendix shows
theresultingdendrogram,whichillustratesthehierarchicalclustersidentified
bythealgorithm.Basedonthedendrogram,wechoose13clustersthatdemon-
strate a high degree of economic and statistical similarity. The cluster names
indicatethetypesofcharacteristicsthatdominateeachgroup:Accruals∗,Debt
Issuance∗,Investment∗,Leverage∗,LowRisk,Momentum,ProfitGrowth,Prof-
itability,Quality,Seasonality,Size∗,Short-TermReversal,andValue,where(∗)
indicates that these factors bet against the corresponding characteristic (e.g.,
accrualfactorsgolongstockswithlowaccrualswhileshortingthosewithhigh
accruals). Figure IA.16 shows that the average within-cluster pairwise corre-
lation is above 0.5 for nine out of 13 clusters. Table IA.II provides details on
the cluster assignment, sign convention, and original publication source for
eachfactor.
C. DataandCharacteristics
Return data are from CRSP for the United States (beginning in 1926) and
from Compustat for all other countries (beginning in 1986 for most developed
countries).32 All accounting data are from Compustat. For international data,
allvariablesaremeasuredinU.S.dollars(basedonexchangeratesfromCom-
pustat)andexcessreturnsarerelativetotheU.S.Treasurybillrate.Toallevi-
atetheinfluenceofdataerrorsintheinternationaldata,wewinsorizereturns
fromCompustatat0.1%and99.9%eachmonth.
We restrict our focus to common stocks that are identified by Compustat
as the primary security of the underlying firm and assign stocks to countries
based on the country of their exchange.33 In the United States, we include
delistingreturnsfromCRSP.Ifadelistingreturnismissingandthedelisting
isforaperformance-basedreason,wesetthedelistingreturnto−30%follow-
ingShumway(1997).Intheglobaldata,delistingreturnsarenotavailable,so
allperformance-baseddelistingsareassignedareturnof−30%.
We build characteristics in a consistent way, that sometimes deviates from
theexactimplementationusedintheoriginalreference.Forexample,forchar-
acteristics that use book equity, we always follow the method in Fama and
French (1993). Furthermore, we always use the most recent accounting data,
whether annual or quarterly. Quarterly income and cash flow items are ag-
gregated over the previous four quarters to avoid distortions from seasonal
32TableIA.IVshowsstartdateandotherinformationforallcountriesincludedinourdataset.
33CompustatidentifiesprimarysecuritiesintheUnitedStates,Canada,andrestoftheworld.
Thismeansthatsomefirmscanhaveuptothreesecuritiesinourdataset.Inpractice,thevast
majorityoffirms(97%)onlyhaveonesecurityinoursampleatagivenpointintime.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2489
effects. We assume that accounting data are available four months after the
fiscal period end. When creating valuation ratios, we always use the most re-
centpricedatafollowingAsnessandFrazzini(2013).SectionIXintheInternet
Appendixcontainsdetaileddocumentationofourdataset.
D. EBEstimation
We estimate the hyperparameters and the posterior alpha distributions of
ourBayesianmodelviaEB.AppendixBprovidesdetailsontheEBmethodol-
ogyandtheestimatedparameters.
III. EmpiricalAssessmentofFactorReplicability
We now report replication results for our global factor sample. We first
present an internal validity analysis by studying U.S. factors over the full
sample. We then analyze external validity in the global cross section and in
thetimeseries(postpublicationfactorreturns).
A. InternalValidity
We plot the full-sample performance of U.S. factors in Figure 4. Each panel
shows the CAPM alpha point estimate of each factor corresponding to the dot
at the center of the vertical bars. Vertical bars represent the 95% confidence
intervalforeachestimate.Barcolorsandlinetypesdifferentiatebetweenthree
typesoffactors.Solidblueindicatesfactorsthataresignificantintheoriginal
study and remain significant in our full sample. Dashed red indicates factors
that are significant in the original study but insignificant in our test. Dotted
green indicates factors that are not significant in the original study but are
includedinthesampleofHou,Xue,andZhang(2020).
The four panels in Figure 4 differ in how the alphas and their confidence
intervalsareestimated.TheupperleftpanelreportsthesimpleOLSestimate
ofeachalpha,αˆ ,andthe95%confidenceintervalsbasedonunadjustedstan-
ols
dard errors, αˆ ±1.96×SE .34 The factors are sorted by OLS αˆ estimate,
ols ols
and we use this ordering for the other three panels as well. We find that the
OLS replication rate is 82.4%, computed as the number of solid blue factors
(98) divided by the sum of solid blue and dashed red factors (119). Based on
OLStests,factorsarehighlyreplicable.
TheupperrightpanelrepeatsthisanalysisusingtheMTadjustmentofBY,
which is advocated by Harvey, Liu, and Zhu (2016) and implemented by Hou,
Xue,andZhang(2020).ThismethodleavestheOLSpointestimateunchanged,
butinflatesthe p-value.Weillustratethisvisuallybywideningthealphacon-
fidence interval. Specifically, we find the BY-implied critical value35 in our
34WedefineSE asthediagonalofthealphacovariancematrix(cid:10)ˆ,whichweestimateaccord-
ols
ingtoAppendixB.
35WecomputetheBY-impliedcriticalvalueastheaverageofthet-statisticofthefactorthatis
justsignificantbasedonBY(thefactorwiththehighestBY-adjusted p-valuebelow5%)andthe
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2490 TheJournalofFinance®
Figure4. AlphadistributionsforU.S.factors.Thefigureshowspointestimatesandconfi-
denceintervalsforU.S.factors.TheupperleftpaneldepictsOLSestimates.Theupperrightpanel
usestheOLSpointestimatebutadjuststheconfidenceintervalfollowingtheBYprocedure.The
lowerleftpanelshowsourEBposteriorconfidenceintervalsusingonlyU.S.data.Thelowerright
panelcontinuestoshowEBresultsforU.S.factors,butestimatestheU.S.factorposteriorfrom
globaldataratherthanU.S.-onlydata.Solidblue(dashedred)confidenceintervalscorrespondto
factorsthatweresignificantintheoriginalstudyandthatwefindtobesignificant(insignificant)
basedonthemethodineachpanel.Dottedgreenintervalscorrespondtofactorsthattheoriginal
studyfindtobeinsignificantorthattheoriginalstudydoesnotevaluateintermsofaveragere-
turnsignificance.TheorderoffactorsisthesameinallpanelsandisarrangedfromlowestOLS
alphatohighest.TableIA.IIIliststhefactornamesarrangedinthesameorder.(Colorfigurecan
beviewedatwileyonlinelibrary.com)
sample to have a t-statistic of 2.7, and we compute the corresponding confi-
dence interval as αˆ ±2.7×SE . We deem a factor as significant according
ols ols
totheBYmethodifthisintervalliesentirelyabovezero.Naturally,thiswiden-
ingofconfidenceintervalsproducesalowerreplicationrateof75.6%.However,
the BY correction does not materially change the OLS-based conclusion that
factorsappeartobehighlyreplicable.
The lower left panel is based on our EB estimates using the full sample
of U.S. factors. For each factor, we use Proposition 4 to compute its posterior
mean, E(α|(αˆ ) ), shown as the dot at the center of the confidence
i j janyUSfactor
interval. These dots change relative to the OLS estimates, in contrast to BY
and other frequentist MT methods that only change the size of the confidence
intervals. We also compute the posterior volatility to produce Bayesian confi-
dence intervals, E(α|(αˆ ) )±1.96×σ(α|(αˆ ) ). The repli- i j janyUSfactor i j janyUSfactor
cation rate based on Bayesian model estimates is 82.4%, larger than BY and,
coincidentally,thesameastheOLSreplicationrate.Thisreplicationratehas
t-statisticofthefactorthatisjustinsignificant(thefactorwiththelowestBY-adjusted p-value
above5%).
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2491
a built-in conservatism from the zero-alpha prior, and it further accounts for
themultiplicityoffactorsbecauseeachfactor’sposteriordependsonallofthe
observedevidenceintheUnitedStates(notjustown-factorperformance).
The lower right panel again reports EB estimates for U.S. factors, but now
we allow the posterior to depend on data from all over the world, not just on
U.S. data. That is, we compute the posterior mean and variance for each U.S.
factor conditional on the alpha estimates for all factors in all regions. The re-
sulting replication rate is 81.5%, which is slightly lower than the EB replica-
tion rate using only U.S. data. Some posterior means are reduced due to the
fact that some factors have not performed as well outside the United States,
which affects posterior means for the United States through the dependence
among global alphas. For example, when the Bayesian model seeks to learn
the true alpha of the “U.S. change in book equity” factor, the Bayesian’s con-
viction regarding positive alpha is reduced by accounting for the fact that the
internationalversionofthisfactorhasunderperformedtheU.S.version.36
Tofurtherassessinternalvalidity,weinvestigatethereplicationrateforU.S.
factors when those factors are constructed from subsamples based on stock
size. One of the leading criticisms of factor research replicability is that re-
sultsaredrivenbyilliquidsmallstockswhosebehaviorlargelyreflectsmarket
frictions and microstructure as opposed to just economic fundamentals or in-
vestorpreferences.Inparticular,Hou,Xue,andZhang(2020)arguethatthey
find a low replication rate because they limit the influence of micro-caps. We
find that factors demonstrate a high replication rate throughout the size dis-
tribution. Panel A of Figure 5 summarizes replication rates for U.S. size cat-
egories shown in the five bars: mega stocks (largest 20% of stocks based on
NYSE breakpoints), large stocks (market capitalization between the 80th and
50th percentile of NYSE stocks), small stocks (between the 50th and 20th per-
centile), micro stocks (between the 20th and 1st percentile), and nano stocks
(marketcapitalizationbelowthe1st percentile).
We see that the EB replication rates in mega- and large-stock samples are
77.3% and 79.8%, respectively. This is only marginally lower than the overall
U.S. sample replication rate of 82.4%, indicating that criticisms of factor
replicability based on arguments around stock size or liquidity are largely
groundless. For comparison, small, micro, and nano stocks deliver replication
ratesof85.7%,85.7%,and68.1%,respectively.
In Panel B of Figure 5, we provide U.S. factor replication rates by theme
cluster. Eleven out of 13 themes are replicable with a rate of 50% or better,
with the exceptions being the low leverage and size themes. To understand
these exceptions, we note that size factors are stronger in emerging markets
(bottompanelofFigureIA.7)andamongmicroandnanostocks(bottompanels
of Figure IA.8). The theoretical foundation of the size effect is compensation
36Toprovideafewmoredetailsonthisexample,theU.S.factorbasedonannualchangeinbook
equity(be_gr1a)hasaposteriorvolatilityof0.095%usingU.S.dataand0.077%usingglobaldata,
leadingtoatighterconfidenceintervalwiththeglobaldata.However,theposteriormeanis0.22%
usingonlyU.S.dataand0.13%usingglobaldata.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2492 TheJournalofFinance®
Figure 5. U.S. replication rates by size group and theme cluster. Panel A summarizes
replicationratesforU.S.factorsformedfromsubsamplesdefinedbystocks’marketcapitalization
usingourEBmethod.PanelBshowsreplicationratesforU.S.factorsineachthemecluster.(Color
figurecanbeviewedatwileyonlinelibrary.com)
for market illiquidity (Amihud and Mendelson (1986)) and market liquidity
risk (Acharya and Pedersen (2005)). Theory predicts that the illiquidity (risk)
premiumshouldbethesameorderofmagnitudeasthedifferencesintrading
costs, and these differences are simply much larger in emerging markets and
amongmicrostocks.
Another reason some factors and themes appear insignificant is that we
do not account for other factors. Factors published after 1993 are routinely
benchmarked to the Fama-French three-factor model (and, more recently, to
the updated five-factor model). Some factors are insignificant in terms of raw
return or CAPM alpha, but their alpha becomes significant after controlling
forotherfactors.Indeed,thisexplanationaccountsforthelackofreplicability
for the low-leverage theme. While CAPM alphas of low-leverage factors are
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2493
Figure6. Replicationratesinglobaldata.Wesummarizereplicationratesforfactorsinthree
regions(U.S.,developedex.-U.S.,andemerging)andfortheworldasawhole.Afactorinagiven
regionisthecapitalization-weightedaveragefactorforcountriesinthatregion.WereportOLS
replicationrateswithnoadjustmentandwithMTadjustmentofBY.Wealsoreportreplication
ratesbasedontheEBposterior.WeconsidertwoEBmethods.Inbothmethods,thereplication
rate corresponds only to factors within the region of interest, but the posterior is computed by
conditioningeitherondatafromthatregionalone(“EmpiricalBayes–Region”)oronthefullglobal
sample(“EmpiricalBayes–All”).Wedeemafactorsuccessfullyreplicatedifits95%confidence
intervalexcludeszeroforagivenmethod.(Colorfigurecanbeviewedatwileyonlinelibrary.com)
insignificant, we find that it is one of the best-performing themes when we
accountformultiplefactors(seeSectionIII.D.2below).
B. ExternalValidity
We find a high replication rate in our full-sample analysis, indicating that
thelargemajorityoffactorsarereproducibleatleastin-sample.Wenextstudy
theexternalvalidityoftheseresultsininternationaldataandinpostpublica-
tionU.S.data.
B.1. GlobalReplication
Figure6showscorrespondingreplicationratesaroundtheworld.Wereport
replication rates from four testing approaches: (i) OLS with no adjustment,
(ii)OLSwithMTadjustmentofBY,(iii)theEBposteriorconditioningonlyon
factorswithinaregion(“EmpiricalBayes–Region”),and(iv)EBconditioning
on factors in all regions (“Empirical Bayes – All”). Even when using all global
data to update the posterior of all factors, the reported Bayesian replication
rateappliesonlytothefactorswithinthestatedregion.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2494 TheJournalofFinance®
The first set of bars establishes a baseline by showing replication rates for
the U.S. sample, summarizing the results from Figure 4. The next two sets of
bars correspond to the developed ex.-U.S. sample and the emerging markets
sample, respectively.37 Each region’s factor is a capitalization-weighted aver-
age of that factor among countries within a given region, and the replication
rate describes the fraction of significant CAPM alphas for these regional fac-
tors.
OLS replication rates in developed and emerging markets are generally
lower than in the United States, and the frequentist BY correction has an
especiallylargenegativeimpactonreplicationrate.Thisisacaseinwhichthe
BayesianapproachtoMTisespeciallypowerful.Eventhoughthealphasofall
regions are shrunk toward zero, the global information set helps EB achieve
a high degree of precision, narrowing the posterior distribution around the
shrunkpointestimate.Wecanseethisinincrements.First,theEBreplication
rate using region-specific data (“Empirical Bayes – Region” in the figure) is
just below the OLS replication rate but much higher than the BY rate. When
theposteriorleveragesglobaldata(“EmpiricalBayes–All”inthefigure),the
replication rate is even higher, reflecting the benefits of sharing information
across regions, as recommended by the dependence among alphas in the hier-
archicalmodel.
Finally, we use the global model to compute, for each factor, the
capitalization-weighted average alpha across all countries in our sample
(“World”inthefigure).Usingdatafromaroundtheworld,wefindaBayesian
replicationrateof82.4%.
Insummary,ourEB-Allmethodyieldsahighreplicationrateinallregions.
That said, the OLS replication rates are lower outside the U.S. than in the
U.S.,whichisprimarilyduetothefactthatforeignmarketshaveshortertime
samples—the point estimates of alphas are similar in magnitude for the U.S.
and international data. Figure 7 shows the alpha of each U.S. factor against
thealphaofthecorrespondingfactorfortheworldex.-U.S.universe.Thedata
cloudalignscloselywiththe45o line,demonstratingtheclosesimilarityofal-
phamagnitudesinthetwosamples.Butshorterinternationalsampleswiden
confidenceintervals,andthisistheprimaryreasonforthedropinOLSrepli-
cationratesoutsidetheUnitedStates.
B.2. Time-SeriesOut-of-SampleEvidence
McLeanandPontiff(2016)documenttheintriguingfactthat,followingpub-
lication,factorperformancetendstodecay.Theyestimateanaveragepostpub-
lication decline of 58% in factor returns. In our data, the average in-sample
alphais0.49%permonthandtheaverageout-of-samplealphais0.26%when
lookingpostoriginalsample,implyingadeclineof47%.
37The developed and emerging samples are defined by the MSCI development classification
andinclude23and27countries,respectively.Theremaining43countriesinoursamplethatare
classifiedasneitherdevelopednoremergingbyMSCIdonotappearinourdevelopedandemerging
regionportfolios,buttheyareincludedinthe“world”versionsofourfactorportfolios.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2495
Figure 7. U.S. factor alphas versus world ex.-U.S. The figure compares OLS alphas for
U.S.factorsversustheirinternationalcounterpart.Eachworldex.-U.S.factorisacapitalization-
weighted average of the factor in all other countries of our sample. Blue circles correspond to
factorsthatweresignificantintheoriginalstudy,whileredtrianglesarethoseforwhichtheorig-
inalpaperdidnotfindasignificanteffect(ordidnotstudythefactorintermsofaveragereturn
significance).Thedottedlineisthe45o line.Thefigurealsoshowsaregressionofworldex.-U.S.
alphaonU.S.alpha.(Colorfigurecanbeviewedatwileyonlinelibrary.com)
We gain further economic insight by looking at these findings cross-
sectionally. Figure 8 provides a cross-sectional comparison of the in-sample
andout-of-samplealphasofourU.S.factors.Thein-sampleperiodisthesam-
ple studied in the original reference. The out-of-sample period in Panel A is
theperiodbeforethestartofin-sampleperiod,whileinPanelBitistheperiod
followingthein-sampleperiod.PanelCdefinesout-of-sampleasthecombined
data from the periods before and after the originally studied sample. We find
that 82.6% of the U.S. factors that were significant in the original publication
alsohavepositivereturnsinthepreoriginalsample,83.3%arepositiveinthe
postoriginalsample,and87.4%arepositiveinthecombinedout-of-samplepe-
riod. When we regress out-of-sample alphas on in-sample alphas using gener-
alizedleastsquares(GLS),wefindaslopecoefficientof0.57,0.26,and0.35in
PanelsA,B,andC,respectively.Theslopesarehighlysignificant(rangingfrom
t =3.5 to t =5.3), indicating that in-sample alphas contain something “real”
rather than being the outcome of pure data mining, as factors that performed
betterin-samplealsotendtoperformbetterout-of-sample.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2496 TheJournalofFinance®
Figure 8. In-sample versus out-of-sample alphas for U.S. factors. The figure shows OLS
alphasforU.S.factorsduringthein-sampleperiod(i.e.,theperiodstudiedintheoriginalpubli-
cation)versusout-of-samplealphas.InPanelA,out-of-sampleistheperiodbeforethein-sample
period.InPanelB,out-of-sampleistheperiodafterthein-sampleperiod.InPanelC,out-of-sample
includesboththeperiodbeforeandtheperiodafterthein-sampleperiod.Werequireatleastfive
yearsofout-of-sampledataforafactortobeincluded,amountingto102,115,and119factorsin
PanelA,B,andC.ThefigurealsoshowsfeasibleGLSestimatesofout-of-samplealphasonin-
samplealphas.ToimplementfeasibleGLS,weassumethattheerrorvariance-covariancematrix
isproportionaltothefull-sampleCAPMresidualvariance-covariancematrix,(cid:10)ˆ/T,describedin
AppendixB.Thedottedlineisthe45oline.(Colorfigurecanbeviewedatwileyonlinelibrary.com)
The significantly positive slope allows us to reject the hypothesis of “pure
alpha-hacking,” which would imply a slope of zero, as seen in Proposition 1.
Further, the regression intercept is positive, while alpha-hacking of the form
studiedinProposition1wouldimplyanegativeintercept.Thattheslopecoef-
ficientispositiveandlessthanoneisconsistentwiththebasicBayesianlogic
ofequation(4).AsweemphasizeinSectionI,aBayesianwouldexpectatleast
someattenuationinout-of-sampleperformance.Thisisbecausethepublished
studies report the OLS estimate, while Bayesian beliefs shrink the OLS esti-
mate toward the zero-alpha prior. More specifically, with no alpha-hacking or
arbitrage,theBayesianexpectsaslopeofapproximately0.9usingequation(5)
and our EB hyperparameters (see Table I).38 Hence, the slope coefficients in
Figure 8 are too low relative to this Bayesian benchmark. In addition to the
moderate slope, there is evidence that the dots in Figure 8 have a concave
shape(asseenmoreclearlyinFigureIA.3).Theseresultsindicatethat,while
wecanruleoutpurealpha-hacking(orp-hacking),thereissomeevidencethat
thehighestin-samplealphasmaybedata-minedorarbitrageddown.
FromtheBayesianperspective,anotherinterestingevaluationoftime-series
external validity is to ask whether the new information contained in out-of-
sample data moves the posterior alpha toward zero. Imagine a Bayesian ob-
serving the arrival of factor data in real time. As new data arrive, she up-
dates her beliefs for all factors based on the information in the full cross sec-
tion of factor data. In the top panel of Figure 9, we show how the Bayesian’s
38Theslopeisκ=1/(1+σ2/(Tτ2))=0.9,whereσ2=10%2/12,theaveragein-sampleperiod
lengthisT=420months,andτ2=τ2+τ2 =(0.35%)2+(0.21%)2=(0.41%)2.
c w
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
IsThereaReplicationCrisisinFinance? 2497
TableI
HyperparametersofthePriorDistributionEstimatedbyMaximum
Likelihood
This table presents τ as the estimated dispersion in cluster alphas (e.g., the dispersion in the
c
alphaofthevalueclusteralpha,momentumcluster).Whenweestimateasingleregion,τ wisthe
idiosyncraticdispersionofalphaswithineachcluster.Whenwejointlyestimateseveralregions,
then τ is the estimated dispersion in alphas across signals within each cluster, and τ is the
| s   |     |     | w   |
| --- | --- | --- | --- |
estimatedidiosyncraticdispersioninalphasforfactorsidentifiedbytheirsignalandregion.
| Sample                 | τ     | τ     | τ     |
| ---------------------- | ----- | ----- | ----- |
|                        | c     | w     | s     |
| USA                    | 0.35% | 0.21% |       |
| Developed              | 0.24% | 0.18% |       |
| Emerging               | 0.32% | 0.24% |       |
| USA,Developed&Emerging | 0.30% | 0.19% | 0.10% |
| World                  | 0.37% | 0.23% |       |
| Worldex.-US            | 0.29% | 0.20% |       |
| USA—Mega               | 0.26% | 0.16% |       |
| USA—Large              | 0.31% | 0.18% |       |
| USA—Small              | 0.44% | 0.26% |       |
| USA—Micro              | 0.48% | 0.32% |       |
| USA—Nano               | 0.42% | 0.28% |       |
Figure9. Worldfactoralphaposteriordistributionovertime.Thetoppaneldepictsthe
CAPMalphaand95%posteriorconfidenceintervalforanequal-weightedportfolioofworldfac-
tors (cid:12)based on EB posteriors reestimated in December each year. That is, each blue circle is
E(1 αi|datauntiltimet)andtheverticallinesare±2timestheposteriorvolatility.Redtrian-
| N i | (cid:12) |     |     |
| --- | -------- | --- | --- |
glesshowaverageOLSalphaateachpointintime, 1 αˆi ,estimatedusingdatathroughdate
|     | N i ti,t |     |     |
| --- | -------- | --- | --- |
0
t.Thebottompanelreportstheaveragemonthlyalphaforallfactorsinarollingfive-yearwindow.
Theresultsarebasedonfactorsfoundtobesignificantintheoriginalpaperwithdataavailable
since1955.(Colorfigurecanbeviewedatwileyonlinelibrary.com)

2498 TheJournalofFinance®
posterior of the average alpha would have evolved in real time.39 We focus
on all the world factors that are available since at least 1955 and significant
in the original paper. Starting in 1960, we reestimate the hierarchical model
using the EB estimator in December of each year. The plot shows the CAPM
alphaandcorresponding95%confidenceintervalofanequal-weightedportfo-
liooftheavailablefactors.Theposteriormeanalphabecomesrelativelystable
from the mid-1980s, around 0.4% per month. Further, as empirical evidence
hasaccumulatedovertime,theconfidenceintervalnarrowsbyone-third,from
about0.16%in1960to0.10%in2020.
Tounderstandtheposterioralpha,Figure9alsoshowstheaverageOLSal-
pha(redtriangles)andthebottompanelinFigure9showstherollingfive-year
averagemonthlyalphaamongallthesefactors.WeseethattheEBposterioris
belowtheOLSestimate,especiallyinthebeginning,whichoccursbecausethe
Bayesian posterior is shrunk toward the zero prior. Naturally, periods of good
performanceincreasetheposteriormeanaswellastheOLSestimate,andvice
versa for poor performance. Over time, the OLS estimate moves nearer to the
Bayesianposteriormean.
To further understand why the posterior alpha is relatively stable with a
tighteningconfidenceinterval,considerthefollowingsimpleexample.Suppose
a researcher has T =10 years of da√ta for factors with an OLS alpha estimate
of αˆ =10% with standard error σ/ T. Further, assume that their√zero-alpha
priorisequallyasinformativeastheir10-yearsample(i.e.,τ =σ/ T).Then,
theshrinkagefactorisκ =1/2usingequation(5).So,afterobservingthefirst
10 years with αˆ =10%, the Bayesian expects a future alpha of E(α|αˆ)=5%
(equation(4)).WhathappensifthisBayesianbeliefisconfirmedbyadditional
data,thatis,thefactorrealizesanalphaof5%overthenext10years?Inthis
case, the full-sample OLS alpha is αˆ =7.5%, but now the shrinkage factor
becomes κ =2/3 because the sample length doubles, T =20. This results in
a posterior alpha of E(α|αˆ)=7.5%·2/3=5%. Naturally, when beliefs are
confirmed by additional data, the posterior mean does not change. Neverthe-
less, we learn something from the additional data, because our conviction
incr(cid:20)easesasthepo(cid:20)steriorvarianceisreduced.Ifσ =0.1,theposteriorvolatil-
ity Var(α|αˆ)=σ κ goes from 2.2% with 10 years of data to 1.8% with 20
T (cid:20)
years of data, and the confidence interval, [E(α|αˆ)±2 Var(α|αˆ)], decreases
from[0.5%,9.5%]to[1.3%,8.7%].
C. BayesianMT
AgreatadvantageofBayesianmethodsfortacklingchallengesinMTisthat,
from the posterior distribution, we can make explicit probability calculations
39Here,wekeepτ candτ wfixedattheirfull-samplevaluesof0.37%and0.23%tomimictheidea
ofadecisionmakerwhostartswithagivenpriorandupdatesthisviewbasedonnewdata,while
keepingthepriorfixed.FigureIA.4showsthatthefigureisalmostthesamewithrollingestimates
ofτ candτ w,andFigureIA.5showsthatthisconsistencyarisesbecausetherollingestimatesare
relativelystable.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2499
foressentiallyany inferentialquestion.Wesimulatefromour EBposterior to
investigate the FDRs and FWERs among the set of global factors that were
significant in the original study. We define a false discovery as a factor where
weclaimthatthealphaispositive,butthetruealphaisnegative.40
First,basedonProposition5,wecalculatetheBayesianFDRinoursample
as the average posterior probability of a false discovery, p-null, among all
discoveries. We find that FDRBayes =0.1%, meaning that we expect roughly
one discovery in 1,000 to be a false positive given our Bayesian hierarchical
model estimates. The posterior standard error for FDRBayes is 0.3% with a
confidence interval of [0,1%]. In other words, the model generates a highly
conservative MT adjustment in the sense that once a factor is found to be
significant,wecanberelativelyconfidentthattheeffectisgenuine.
Wecanalsousetheposteriortomakeotherinferencecalculations.Wecom-
putetheFWER,whichwedefineastheprobabilityofatleastonefalsediscov-
ery. We simulate 1,000,000 draws of the vector of alphas that were deemed to
bediscoveriesfromtheEBposteriorandcompute
1,0(cid:2)00,000
1
FWERBayes = 1,000,000 1{ns ≥1} =5.5%,
s=1
wheren isthenumberoffalsediscoveriesinsimulations.Inotherwords,the
s
probabilityofatleastonealphahavingthewrongsignis5.5%.TheFWERBayes
is naturally much higher than the FDRBayes given the extreme conservatism
built into the FWER’s definition. Whether it is too high is subjective. A nice
aspect of our approach is that a researcher can control the FWERBayes as de-
sired.Forexample,usingat-statisticthresholdof2.78ratherthan1.96leads
toFWERBayes =0.8%.
From the posterior, we can also compute the expected fraction of dis-
covered factors that are “true,” which in general is different than the
replication rate. The replication rate is the fraction of factors having
E((cid:12) α
i
|data)/σ(α
i
|data)> (cid:12)1.96, while the expected fraction of true factors is
n 1 i E(1α i >0 |data)= n 1 i Pr(α i >0|data). The replication rate gives a conser-
vativetakeonthenumberoftruefactors—theexpectedfractionoftruefactors
istypicallyhigherthanthereplicationrate.Tounderstandthisconservatism,
consider an example in which all factors have a 90% posterior probability of
being true. These would all individually be counted as “not replicated,” but
they would contribute to a high expected fraction of true factors. Indeed, we
estimatethattheexpectedfractionoffactorswithtrulypositivealphasis94%
(with a posterior standard error of 1.3%), which is notably higher than our
estimatedreplicationrate.
40Inparticular,wedefineadiscoveryasafactorforwhichtheposteriorprobabilityofthetrue
alphabeingnegativeislessthan2.5%.Withthisdefinition,westartwith153worldfactors.We
thenfocusonthe119factorsthatweresignificantintheoriginalstudies.Ofthese119factors,98
areconsidereddiscoveries.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2500 TheJournalofFinance®
C.1. EconomicBenefitsofMorePowerfulTests
MT adjustments should ultimately be evaluated by whether they lead to
better decisions. It is important to balance the relative costs of false posi-
tives versus false negatives, and the appropriate trade-off depends on the
contextoftheproblem(GreenlandandHofman(2019)).Weapplythisgeneral
principle in our context by directly measuring costs in terms of investment
performance. Specifically, we can compute the difference in out-of-sample
investment performance from investing using factors chosen with different
methods.Wecomparetwoalternatives.OneistheBYdecisionruleadvocated
by Harvey, Liu, and Zhu (2016), which is a frequentist MT method that suc-
cessfully controls false discoveries relative to OLS, but in doing so sacrifices
power (the ability to detect true positives). The second alternative is our EB
method, whose false discovery control typically lies somewhere between BY
and unadjusted OLS. EB uses the data sample itself to decide whether its
discoveriesshouldbehavemoresimilarlytoBYortounadjustedOLS.
Forinvestors,theoptimaldecisionruleistheonethatleadstothebestper-
formanceout-of-sample.Forthemostpart,thesetofdiscoveredfactorsforBY
andEBcoincide.Itisonlyinmarginalcaseswheretheydisagree,whichoccurs
inoursamplewhenEBmakesadiscoverythatBYdeemsinsignificant.There-
fore,toevaluateMTapproachesineconomicterms,wetracktheout-of-sample
performanceoffactorsincludedbyEBbutexcludedbyBY.Iftheperformance
of these is negative on average, then the BY correction is warranted and pre-
ferredbytheinvestor.
We find that the out-of-sample performance of factors discovered by EB
but not BY is positive on average and highly significant. The alpha for these
marginal cases is 0.35% per month among U.S. factors (t =5.1).41 This esti-
matesuggeststhattheBYdecisionruleistooconservative:Aninvestorusing
the rule would fail to invest in factors that subsequently have a high out-of-
sample return. Another way to see that the BY decision rule is too conser-
vative√comes from the connection between the Sharpe ratio and t-statistics:
t =SR T.IfwehaveafactorwithanannualSharperatioof0.5,aninvestor
using the 1.96 cutoff would in expectation invest in the factor after 15 years,
whereas an investor using the 2.78 cutoff would not start investing until ob-
servingthefactorfor31years.
C.2. AddressingUnobservedFactors,PublicationBias,andOtherBiases
A potential concern with our replication rate is that the set of factors that
makeitintotheliteratureisaselectedsample.Inparticular,researchersmay
havetriedmanydifferentfactors,someofwhichareobservedintheliterature,
while others are unobserved because they never got published. Unobserved
41Forthedevelopedex.-U.S.sample,themonthlyalphaformarginalcasesis0.24%permonth
(t=5.3),andfortheemergingsampleitis0.27%(t=3.7),infavoroftheEBdecisionrule.Table
IA.Ireportsadditionaldetailsforthisanalysis.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2501
Figure 10. Replication rate with prior estimated in light of unobserved factors. The
figureshowshowthereplicationrateintheUnitedStatesvarieswhenchangingtheτ cparameter.
Theτ w parameterisfixedattheestimatevalueof0.21%.Thedottedlineshowsourreplication
rateof82.4%.Thegreensquarehighlightsthevalueestimatedinthedataτ
c
=0.35%.Thered
triangleandthebluecirclehighlightvaluesthatarefoundbyestimatingtheEBmodelaccording
toassumptionsaboutunobservedfactorsfromHarvey,Liu,andZhu(2016).Thevaluesareτ
c
=
0.28%inthebaselinescenarioandτ
c
=0.20%intheconservativescenario.Adescriptionofthis
approach can be found in Section IV of the Internet Appendix. (Color figure can be viewed at
wileyonlinelibrary.com)
factors may have worse average performance if poor performance makes pub-
licationmoredifficultorlessdesirable.Alternatively,unobservedfactorscould
havestrongperformanceifpeoplechosetotradeontheminsecretratherthan
publish them. Either way, we next show how unobserved factors can be ad-
dressedinourframework.
The key insight is that the performance of factors across the universe of
observed and unobserved factors is captured in our prior parameters τ ,τ .
c w
Indeed, large values of these priors correspond to a large dispersion of alphas
(i.e.,alotoflargealphas“outthere”),whilesmallvaluesmeanthatmosttrue
alphas are close to zero. Therefore, a smaller τ leads to stronger shrinkage
toward zero for our posterior alphas, leading to fewer factor “discoveries” and
a lower replication rate. Figure 10 shows how our estimated replication rate
depends on the most important prior parameter, τ , based on the τ that we
c w
estimatefromthedata.42
In Figure 10, we show how the replication rate varies with τ in precise
c
quantitative terms. Note that while the replication rate does indeed rise with
τ , the differences are small in magnitude across a large range of τ values,
c c
demonstratingrobustnessofourconclusionsaboutreplicability.
42FigureIA.6showsthattheresultsarerobusttoalternativevaluesofτ w.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2502 TheJournalofFinance®
The stable replication rate in Figure 10 also suggests that the replication
rate among the observed factors would be similar even if we had observed
the unobserved factors. The figure highlights several key values of τ : both
c
the value of τ that we estimated from the observed data (as explained in Ap-
c
pendixB)andvaluesthatadjustforunobserveddataindifferentways.
We adjust τ for unobserved factors as follows. We simulate a data set that
c
proxies for the full set of factors in the population (including those that are
unobserved), and then estimate the τ’s that match this sample. One set of
simulations is constructed to match the baseline scenario of Harvey, Liu, and
Zhu (2016, table 5.A, row 1), which estimates that researchers have tried
M =1,297factors,ofwhich39.6%havezeroalphaandtheresthaveaSharpe
ratio of 0.44. We also consider the more conservative scenario of Harvey, Liu,
and Zhu (2016, table 5.B, row 1), which implies that researchers have tried
M =2,458factors,ofwhich68.3%havezeroalpha.SectionIVoftheInternet
Appendix provides more details on these simulations. The result, as seen in
Figure10,isthatvaluesofτ thatcorrespondtothesescenariosfromHarvey,
c
Liu, and Zhu (2016) still lead to a conclusion of a high replication rate in our
factor universe. The replication rate is 81.5%, and 79.8% for the prior hyper-
parametersimpliedbythebaselineandconservativescenario,respectively.
A closely related bias is that factors may suffer from alpha-hacking as dis-
cussed in Section I.A (Proposition 1), which makes realized in-sample factor
returns too high. To account for this bias, we estimate the prior hyperparam-
eters using only out-of-sample data. The estimated values are τ =0.27% and c
τ =0.22%. These hyperparameters are similar to those implied by the base-
w
line scenario of Harvey, Liu, and Zhu (2016) as seen in Figure 10. With these
hyperparameters,thereplicationrateis81.5%.
D. EconomicSignificanceofFactors
Which factors (and which themes) are the most impactful anomalies in eco-
nomicterms?Weshedlightonthisquestionbyidentifyingwhichfactorsmat-
termostfromaninvestmentperformancestandpoint.
Figure11showsthealphaconfidenceintervalsforallworldfactors,sortedby
the median posterior alpha within clusters. This figure is similar to Figure 4,
but now we focus on the world instead of the U.S. factors, and here we sort
factorsintoclusters.Wealsofocusonfactorsthattheoriginalstudiesconclude
are significant. We see that world factor alphas tend to be economically large,
often above 0.3% per month, and highly significant in most clusters. The ex-
ception isthelow-leverage cluster,where wealsoseealowreplication rate in
precedinganalyses.
D.1. ByRegionandBySize
We next consider which factors are most economically important across
global regions and across stock size groups. In Panel A of Figure 12, we con-
struct factors using only stocks in the five size subsamples presented earlier
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2503
Figure11. Worldalphaposteriorbyfactorandcluster.ThefigurereportstheEBposterior
95% confidence interval for the true alpha of a world factor create as a capitalization-weighted
average of all country-specific factors in our data set. We only include factors that the original
paperfindssignificant.(Colorfigurecanbeviewedatwileyonlinelibrary.com)
in Figure 5, namely, mega, large, small, micro, and nano stock samples. For
each sample, we calculate cluster-level alphas as the equal-weighted average
alpha of rank-weighted factors within the cluster.43 We see, perhaps surpris-
ingly,thattheorderingandmagnitudeofalphasisbroadlysimilaracrosssize
groups. The Spearman rank correlation of alphas for mega caps versus mi-
cro caps is 73%. Only the nano stock sample, defined as stocks below the 1st
percentile of the NYSE size distribution (which amounted to 458 out of 4,356
stocksintheUnitedStatesattheendof2020),exhibitsnotabledeviationfrom
theothergroups.TheSpearmanrankcorrelationbetweenalphasofmegacaps
andnanocapsis36%.
Panel B of Figure 12 shows cluster-level alphas across regions. Again, we
find consistency in alphas across the globe, with the obvious standout being
the size theme, which is much more important in emerging markets than in
developedmarkets.U.S.factoralphassharea62%Spearmancorrelationwith
the developed ex.-U.S. sample, and a 43% correlation with the emerging mar-
ketssample.
D.2. ControllingforOtherThemes
We have focused so far on whether factors (or clusters) possess significant
positive alpha relative to the market. The limitation of studying factors in
43Rank-weightingissimilartoequal-weightingandusedheretoillustratetheperformanceof
typicalstocksineachsizegroup.Seeequation(1)inAsness,Moskowitz,andPedersen(2013).
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2504 TheJournalofFinance®
Figure 12. Alphas by stock size group and geographic region. The figure presents aver-
age cluster-level alphas for factors formed from subsamples defined by different stock market
capitalizationgroups(PanelA)andregions(PanelB).(Colorfigurecanbeviewedatwileyonlineli-
brary.com)
terms of CAPM alpha is that it does not control for duplicate behavior other
thanthroughthemarketfactor.Economicallyimportantfactorsarethosethat
have large impact on an investor’s overall portfolio, and this requires under-
standingwhichclusterscontributealphawhilecontrollingforallothers.
To this end, we estimate cluster weights in a tangency portfolio that in-
vests jointly in all cluster-level portfolios. We test the significance of the
estimated weights using the method of Britten-Jones (1999). In addition to
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2505
Figure13. Tangencyportfolioweights.ThereturnsarefromU.S.portfolios.Wecomputethe
cluster return as the equal-weighted return of all factors with data available at a given point
intime.WefurtheraddtheU.S.marketreturn.Weestimatethetangencyweightsfollowingthe
methodofBritten-Jones(1999)withanonnegativityconstraint.Theerrorbarsare90%confidence
intervalsbasedon10,000bootstrapsamplesandthepercentilemethod.Thedatastartin1952to
ensure that all clusters have nonmissing observations. (Color figure can be viewed at wileyon-
linelibrary.com)
our 13 cluster-level factors, we also include the market portfolio as a way to
benchmark factors to the CAPM null. Lastly, we constrain all weights to be
nonnegative (because we have signed the factors to have positive expected
returnsaccordingtothefindingsoftheoriginalstudies).
Figure 13 reports the estimated tangency portfolio weights and their 90%
bootstrap confidence intervals. When a factor has a significant weight in the
tangency portfolio, it means that it matters for an investor, even controlling
for all the other factors. We see that all but three clusters are significant in
thissense.Wealsoseethatconclusionsaboutclusterimportancechangewhen
clusters are studied jointly. For example, value factors become stronger when
controlling for other effects because of their hedging benefits relative to mo-
mentum,quality,andlowleverage.Moresurprisingly,thelow-leveragecluster
becomes one of the most heavily weighted clusters, in large part due to its
ability to hedge value and low-risk factors. The hedging performance of value
and low-leverage clusters is clearly discernible in Table IA.16, which shows
the average pairwise correlations among factors within and across clusters.44
Section VI of the Internet Appendix provides further performance attribution
ofthetangencyportfolioatthefactorlevel.45
44TablesIA.9andIA.10showhowtangencyportfolioweightsvarybyregionandbysizegroup.
45Figure IA.11 shows the performance of each cluster together with the market portfo-
lio, Figure IA.12 shows how the optimal portfolio changes when one cluster is excluded, and
FigureIA.14showstheimportanceofeachfactorfortheoptimalportfolio.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2506 TheJournalofFinance®
Figure 14. The evolution of the tangency Sharpe ratio. The top panel shows the Sharpe
ratio on the ex post tangency portfolio. A factor is included in the tangency portfolio only after
theendofthesampleinwhichthefactorwasstudiedintheoriginalpublication(weonlyinclude
factorsthatwerefoundtobesignificantintheoriginalpaper).Wehighlightselectedfactorsthat
significantlyimprovetheoptimalportfolio,startingwiththemarketportfolio.Weusethelongest
availablebalancedU.S.sample,1972to2020(i.e.,whenallfactorsareavailable).
D.3. EvolutionofFinanceFactorResearch
Thenumberofpublishedfactorshasincreasedovertimeasseeninthebot-
tom panel of Figure 14. To what extent have these new factors continued to
addnewinsightsversussimplyrepackageexistinginformation?
To address this question, we consider how the optimal risk-return tradeoff
has evolved over time as factors have been discovered. Specifically, Figure 14
computesthemonthlySharperatiooftheexposttangencyportfoliothatonly
investsinfactorsdiscoveredbyacertainpointintime.46Thestartingpoint(on
the left) of the analysis is the 0.13 Sharpe ratio of the market portfolio in the
U.S.sampleover1972to2020whenallfactorsareavailable.Theendingpoint
(on the right) is the 0.80 Sharpe ratio of the tangency portfolio that invests
the optimal weights across all factors over the same U.S. sample period.47 In
between,weseehowtheSharperatioofthetangencyportfoliohasevolvedas
factors have been discovered. The improvement is gradual over time, but we
alsoseeoccasionallargeincreaseswhenresearchershavediscoveredespecially
impactful factors (usually corresponding to new themes in our classification
scheme).AnexampleistheoperatingaccrualsfactorproposedbySloan(1996),
46WeestimatetangencyportfolioweightsfollowingthemethodofPedersen,Babu,andLevine
(2021),whichoffersasensibleapproachtomean-varianceoptimizationforhigh-dimensionaldata.
EstimationdetailsareprovidedinSectionVIoftheInternetAppendix.
47ThehighSharperatiopartlyreflectsthefactthatweareconductingin-sampleoptimization.
Ifweinsteadrunapseudoout-of-sampleanalysisviacross-validation,wefindamonthlySharpe
ratioof0.56.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2507
which increased the tangency Sharpe ratio from 0.43 to 0.56. More recently,
theseasonalityfactorsofHestonandSadka(2008)haveincreasedtheSharpe
ratiofrom0.65to0.74.
IV. Conclusion:FinanceResearchPosterior
We introduce a hierarchical Bayesian model of alphas that emphasizes the
joint behavior of factors and provides a more powerful MT adjustment than
common frequentist methods. Based on this framework, we revisit the evi-
dence on replicability in factor research and come to substantially different
conclusions than prior literature. We find that U.S. equity factors have a high
degreeofinternalvalidityinthesensethatover80%offactorsremainsignifi-
cantaftermodificationsinfactorconstructionthatmakeallfactorsconsistent
andmoreimplementablewhilestillcapturingtheoriginalsignal(Hamermesh
(2007)) and after accounting for MT concerns (Harvey, Liu, and Zhu (2016),
Harvey(2017)).
We also provide new evidence demonstrating a high degree of external va-
lidity in factor research. In particular, we find highly similar qualitative and
quantitativebehaviorinalargesampleof153factorsacross93countriesaswe
findintheUnitedStates.Wealsoshowthat,withintheUnitedStates,factors
exhibitahighdegreeofconsistencybetweentheirpublishedin-sampleresults
and out-of-sample data not considered in the original studies. We show that
some out-of-sample factor decay is to be expected in light of Bayesian posteri-
orsbasedonpublicationevidence.Therefore,thenewevidencefrompostpubli-
cationdatalargelyconfirmstheBayesian’sbeliefs,whichhasledtorelatively
stableBayesianalphaestimatesovertime.
Inadditiontoprovidingapowerfultoolforreplication,ourBayesianframe-
work has several additional applications. For example, the model can be
used to correctly interpret out-of-sample evidence, look for evidence of alpha-
hacking,computetheexpectednumberoffalsediscoveriesandotherrelevant
statistics based on the posterior, analyze portfolio choice taking into account
both estimation uncertainty and return volatility, and evaluate asset pric-
ingmodels.
Finally, the code, data, and meticulous documentation for our analysis are
availableonline.Ourlargeglobalfactordatasetandtheunderlyingstock-level
characteristicsareeasilyaccessibletoresearchersbyusingourpubliclyavail-
ablecodeanditsdirectlinktoWRDS.Ourdatabasewillbeupdatedregularly
withnewdatareleasesandcodeimprovements.Wehopethatourmethodology
anddatawillhelppromotecrediblefinanceresearch.
Initialsubmission:February1,2021;Accepted:July16,2021
Editors:StefanNagel,PhilipBond,AmitSeru,andWeiXiong
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
TheJournalofFinance®
2508
|     | AppendixA: |     | AdditionalResultsandProofs |     |     |     |     |     |
| --- | ---------- | --- | -------------------------- | --- | --- | --- | --- | --- |
A.1. AdditionalResultsonAlpha-Hacking
We consider the situation where the researcher has in-sample data from
|              |                                        |     |     |     |     |     | +1toT | +Toos. |
| ------------ | -------------------------------------- | --- | --- | --- | --- | --- | ----- | ------ |
| time1totimeT | andanout-of-sample(oos)periodfromtimeT |     |     |     |     |     |       |        |
Theresearchermayhaveusedalpha-hackingduringthein-sampleperiod,but
this does not affect the out-of-sample period. The researcher is interested in
the posterior alpha based on the total evidence, in-sample and out-of-sample,
whichisusefulforpredictingfactorperformanceinafuturetimeperiod(i.e.,a
timeperiodthatisout-of-samplerelativetotheexistingout-of-sampleperiod).
PROPOSITION A.1 (Out-of-sample alpha): The posterior alpha based on in-
sampledatafromtime1toT withalpha-hacking,andanout-of-sampleperiod
| fromT +1toT | +Toos          | isgivenby |         |                     |     |         |     |      |
| ----------- | -------------- | --------- | ------- | ------------------- | --- | ------- | --- | ---- |
|             |                |           | (cid:3) |                     |     | (cid:4) |     |      |
|             | E(α|αˆ,αˆoos)= |           | κoos    | w(αˆ −ε¯)+(1−w)αoos |     | ,       |     | (A1) |
wherew= σ2/Toos ∈ (0,1)istherelativeweightonthein-sampleperiodrel-
σ¯2/T+σ2/Toos
| ativetotheout-of-sampleperiodandκoos |     |     |     | =   | 1   |     | isashrink- |     |
| ------------------------------------ | --- | --- | --- | --- | --- | --- | ---------- | --- |
1+1/(τ2([σ¯2/T]−1+[σ2/Toos]−1))
ageparameter.
We see that the more alpha-hacking the researcher has done (higher σ¯),
the less weight we put on the in-sample period relative to the out-of-sample
period.Further,thein-sampleperiodhasthenonproportionaldiscountingdue
toalpha-hacking(ε¯),whichwedonothaveforout-of-sampleevidence.
This result formalizes the idea that an in-sample backtest plus live perfor-
manceisnotthesameasalongerbacktest.Forexample,10years ofbacktest
plus10yearsofliveperformanceismoremeaningfulthat20yearsofbacktest
withnoliveperformance.Thedifferenceisthattheout-of-sampleperformance
isfreefromalpha-hacking.
A.2. ProofsandLemmas
The proofs make repeated use of the following well-known property of mul-
tivariate Normally distributed random variable. If x and y are multivariate
Normal:
|     |     | (cid:21) (cid:22) | (cid:5)(cid:21) | (cid:22) (cid:21) | (cid:22)(cid:7) |     |     |      |
| --- | --- | ----------------- | --------------- | ----------------- | --------------- | --- | --- | ---- |
|     |     | x                 | μ               | (cid:10)          | (cid:10)        |     |     |      |
|     |     |                   | ∼N              | x , xx            | yx ,            |     |     |      |
|     |     |                   | μ               | (cid:10)          | (cid:10)        |     |     | (A2) |
y
|     |     |     |     | y xy | yy  |     |     |     |
| --- | --- | --- | --- | ---- | --- | --- | --- | --- |
then the conditional distribution of x given y has the following Normal distri-
bution:
|     |       | (cid:3)     |                |     |                                       | (cid:4) |     |      |
| --- | ----- | ----------- | -------------- | --- | ------------------------------------- | ------- | --- | ---- |
|     | x|y∼N | μ +(cid:10) | (cid:10)−1(y−μ | ),  | (cid:10) −(cid:10) (cid:10)−1(cid:10) | .       |     |      |
|     |       | x           | xy             | y   | xx xy                                 | yx      |     | (A3) |
|     |       |             | yy             |     |                                       | yy      |     |      |
Theproofsalsomakeuseofthefollowingtwolemmas.

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
|     |     | IsThereaReplicationCrisisinFinance? |     |     |     |     |     | 2509 |
| --- | --- | ----------------------------------- | --- | --- | --- | --- | --- | ---- |
LEMMA A.1: For random variables x,y, and z, it holds that E(Var(x|y,z))≤
| E(Var(x|y)) |      |               |           |     |             |         | Var(x|y,z)≤ |     |
| ----------- | ---- | ------------- | --------- | --- | ----------- | ------- | ----------- | --- |
|             | and, | if the random | variables |     | are jointly | normal, | then        |     |
Var(x|y).
LetAbeanN×N
| LEMMAA.2: |     |     | matrixforwhichalldiagonalelementsequala |     |     |     |     |     |
| --------- | --- | --- | --------------------------------------- | --- | --- | --- | --- | --- |
andalloff-diagonalelementsequalb,wherea(cid:11)=banda+b(N−1)(cid:11)=0.Then
| theinverseA−1 | existsandisofthesameform: |      |                 |     |     |        |     |      |
| ------------- | ------------------------- | ---- | --------------- | --- | --- | ------ | --- | ---- |
|               |                           | ⎡    | ⎤               |     | ⎡   | ⎤      |     |      |
|               |                           | a    | b               |     |     | c d    |     |      |
|               |                           | ⎢    | ⎥               |     | ⎢   | ⎥      |     |      |
|               |                           | A=⎣  | ... ⎦           | −1  | =⎣  | ... ⎦, |     |      |
|               |                           |      |                 | A   |     |        |     | (A4) |
|               |                           | b    | a               |     |     | d c    |     |      |
|               | a+b(N−2)                  |      |                 | −b  |     |        |     |      |
| wherec=       |                           | andd | =               |     | .   |        |     |      |
|               | (a−b)(a+b(N−1))           |      | (a−b)(a+b(N−1)) |     |     |        |     |      |
PROOF OF LEMMA A.1: Usingthedefinitionofconditionalvariance,wehave
|     |     |     |     | (cid:29) | (cid:30) |     | (cid:29) | (cid:30) |
| --- | --- | --- | --- | -------- | -------- | --- | -------- | -------- |
|     |     |     |     |          | 2        |     |          | 2        |
E(Var(x|y,z))=E(E(x2|y,z))−E( E(x|y,z) )=E(x2)−E( E(x|y,z) ).
Hence,usingJensen’sinequality,wehave
|                              |     |     |     | (cid:29) | (cid:30) | (cid:29) (cid:30) |     |     |
| ---------------------------- | --- | --- | --- | -------- | -------- | ----------------- | --- | --- |
| E(Var(x|y))−E(Var(x|y,z))=E( |     |     |     | E(x|y,z) | 2 )−E(   | E(x|y) 2          |     |     |
)
|     |     |     |     | (cid:29) | (cid:30) | (cid:29)      | (cid:30) |     |
| --- | --- | --- | --- | -------- | -------- | ------------- | -------- | --- |
|     |     |     |     |          | 2        |               | 2        |     |
|     |     |     | =E( | E(x|y,z) | )−E(     | E(E(x|y,z)|y) |          | )   |
|     |     |     |     | (cid:29) | (cid:30) | (cid:29)      | (cid:30) |     |
|     |     |     | ≥E( | E(x|y,z) | 2 )−E(E( | E(x|y,z)      | 2|y))=0. |     |
The result for normal distributions follows from the fact that normal condi-
tionalvariancesarenonstochastic,thatis,Var(x|y)=E(Var(x|y)).Inthiscase,
we can also characterize the extra drop in variance due to conditioning on
|         |                |           |     | ε    |                | z=a+by+ε, |     |       |
| ------- | -------------- | --------- | --- | ---- | -------------- | --------- | --- | ----- |
| z using | its orthogonal | component |     | from | the regression |           |     | using |
similarnotationas(A2):
−
| Var(x|y,z)=Var(x|y,ε)=(cid:10) |     | x,x −(cid:10)       |          | (cid:10) 1            | (cid:10) |                                |     |                        |
| ------------------------------ | --- | ------------------- | -------- | --------------------- | -------- | ------------------------------ | --- | ---------------------- |
|                                |     |                     | x,(y,ε)  | ( y, ε),(y,ε)         | (y,ε),x  |                                |     |                        |
|                                |     | =(cid:10) −(cid:10) | (cid:10) | − 1(cid:10) −(cid:10) | (cid:10) | − 1(cid:10) =Var(x|y)−(cid:10) |     | (cid:10) − 1(cid:10) . |
|                                |     | x,x                 | x,y      | y ,y y,x              | x,ε      | ε ,ε ε,x                       | x,ε | ε ,ε ε,x               |
(cid:2)
PROOFOFLEMMAA.2: Theprooffollowsfrominspection:TheproductofAand
itsproposedinverseclearlyhasthesameformasAwithdiagonalelements
|             |     | a(a+b(N−2))−b2(N−1) |     |     | a2+ab(N−1)−ab−b2(N−1) |                 |     |     |
| ----------- | --- | ------------------- | --- | --- | --------------------- | --------------- | --- | --- |
| ac+bd(I−1)= |     |                     |     |     | =                     |                 |     | =1  |
|             |     | (a−b)(a+b(N−1))     |     |     |                       | (a−b)(a+b(N−1)) |     |     |
andoff-diagonalelements
−ab+b(a+b(N−2))−b2(N−2)
|     | ad+bc+bd(N−2)= |     |     |     |     |     | =0. |     |
| --- | -------------- | --- | --- | --- | --- | --- | --- | --- |
(a−b)2(a+b(N−1))2
Inotherwords,AA−1 equalstheidentity,provingtheresult. (cid:2)

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
TheJournalofFinance®
2510
PROOF OF EQUATIONS (4) to (6): The posterior distribution of the true alpha
giventheobservedfactorreturniscomputedusing(A3).Theconditionalmean
is
|     |            |     | Cov(α,αˆ) |          |         | τ2  |      |      |     |
| --- | ---------- | --- | --------- | -------- | ------- | --- | ---- | ---- | --- |
|     | E(α|αˆ)=0+ |     |           | (αˆ −0)= |         |     | αˆ = | καˆ, |     |
|     |            |     | Var(αˆ)   |          | τ2+σ2/T |     |      |      |     |
whereκ isgivenby(5)andtheposteriorvarianceis
|                   |     |     | (Cov(α,αˆ))2 |        |         | τ2  |         | τ2σ2/T | σ2   |
| ----------------- | --- | --- | ------------ | ------ | ------- | --- | ------- | ------ | ---- |
| Var(α|αˆ)=Var(α)− |     |     |              | =τ2−τ2 |         |     | =       |        | =κ . |
|                   |     |     | Var(αˆ)      |        | τ2+σ2/T |     | τ2+σ2/T |        | T    |
(cid:2)
PROOF PROPOSITION 1: The posterior alpha with alpha-hacking is given
OF
via(A3)as
|            |     | Cov(α,αˆ) |              |          | τ2  |             |     |              |     |
| ---------- | --- | --------- | ------------ | -------- | --- | ----------- | --- | ------------ | --- |
| E(α|αˆ)=0+ |     |           | (αˆ −E(αˆ))= |          |     | (αˆ −ε¯)=−κ |     | +κhackingαˆ, |     |
|            |     | Var(αˆ)   |              | τ2+σ¯2/T |     |             |     | 0            |     |
whereκhacking = 1 ,κ =κhackingε¯≥0,andκhacking ≤κ becauseσ¯ ≥σ. (cid:2)
0
1+σ¯2
τ2T
PROOF PROPOSITION 2: The posterior mean given αˆ and αˆg is computed
OF
via(A3)as
|     |              |     |                   | (cid:21)       |        | (cid:22) (cid:21) | (cid:22) |                           |     |
| --- | ------------ | --- | ----------------- | -------------- | ------ | ----------------- | -------- | ------------------------- | --- |
|     |              |     | (cid:29) (cid:30) |                |        | −1                |          |                           |     |
|     |              |     |                   | τ2+σ2          | τ2+ρσ2 |                   | αˆ       |                           |     |
|     | E(α|αˆ,αˆg)= |     | τ2 τ2             | T              |        | T                 |          |                           |     |
|     |              |     |                   | τ2+ρσ2         | τ2+σ2  |                   | αˆg      |                           |     |
|     |              |     |                   | (cid:21) T     |        | T                 |          | (cid:22)(cid:21) (cid:22) |     |
|     |              |     | 1 (cid:29)        | (cid:30) τ2+σ2 |        | −(τ2+ρσ2)         |          | αˆ                        |     |
|     |              |     | = τ2              | τ2             |        |                   |          |                           |     |
|     |              |     |                   | −(τ2+ρσ2)      | T      | τ2+σ2             | T        | αˆg                       |     |
det
|     |     |     |                  |           | T       |     | T   |     |     |
| --- | --- | --- | ---------------- | --------- | ------- | --- | --- | --- | --- |
|     |     |     | τ2(1−ρ)σ2(cid:3) |           | (cid:4) |     |     |     |     |
|     |     |     | =                | T αˆ +αˆg |         |     |     |     |     |
det
|     |     |     |     | τ2(1−ρ) |     | (cid:3) |         | (cid:4) |     |
| --- | --- | --- | --- | ------- | --- | ------- | ------- | ------- | --- |
|     |     |     | =   |         |     |         | αˆ +αˆg |         |     |
σ2(1−ρ)(1+ρ)+2τ2(1−ρ)
|                    |     |     | T (cid:5) | (cid:7) |     |     |     |     |     |
| ------------------ | --- | --- | --------- | ------- | --- | --- | --- | --- | --- |
|                    |     |     | 1         | 1       |     |     |     |     |     |
|                    |     |     | = κg αˆ   | + αˆg   |     |     |     |     |     |
|                    |     |     | 2         | 2       |     |     |     |     |     |
| usingthenotationσ2 |     |     | =σ2/T and |         |     |     |     |     |     |
T
|     | det= | (τ2+σ2)2−(τ2+ρσ2)2 |     | =σ2[σ2(1−ρ2)+2τ2(1−ρ)]. |     |     |     |     |     |
| --- | ---- | ------------------ | --- | ----------------------- | --- | --- | --- | --- | --- |
|     |      |                    | T   | T                       | T T |     |     |     |     |
κg [κ,1]
The global shrinkage parameter is in and decreases with the corre-
lation ρ, attaining the minimum value, κg=κ, when ρ =1 as is clearly seen
from(12).
(cid:2)
TheresultabouttheposteriorvariancefollowsfromLemmaA.1.
PROOF PROPOSITION 3: The prior joint distribution of the true and esti-
OF
mated alphas is given by the following expression, where we focus on factor 1

IsThereaReplicationCrisisinFinance? 2511
withoutlossofgenerality:
⎛ ⎡ ⎤⎞
⎡ ⎤ ⎡ ⎤ τ2+τ2 τ2+τ2 τ2 ··· τ2
⎢ ⎢ ⎢ ⎣ α αˆ . . . 1 1⎥ ⎥ ⎥ ⎦ ∼N ⎜ ⎜ ⎜ ⎜ ⎜ ⎝ ⎢ ⎢ ⎢ ⎣ 0 0 . . . ⎥ ⎥ ⎥ ⎦ , ⎢ ⎢ ⎢ ⎢ ⎢ ⎣ τ c c 2 . .
.
+ τ c 2 τ w w 2 τ c c 2+τ w w 2 +σ2/ c T ... c τ c 2+ρσ2/T ⎥ ⎥ ⎥ ⎥ ⎥ ⎦ ⎟ ⎟ ⎟ ⎟ ⎟ ⎠ .
αˆN 0
τ2 τ2+ρσ2/T τ2+τ2 +σ2/T
c c c w
(A5)
The posterior alpha of factor 1 is therefore normally distributed with a mean
derivedusingthestandardformulaforconditionalnormaldistributions(A3):
⎡ ⎤
⎢
τ
c
2+τ
w
2
⎥
(cid:13)⎡
τ2+τ2+σ2/T τ2+ρσ2/T
⎤ −1 ⎡
αˆ1
⎤
⎢ τ2 ⎥ ⎢ c w c ⎥ ⎢ ⎥
E(α1|αˆ1,...,αˆN) =⎢ ⎢ ⎣ . . . c ⎥ ⎥ ⎦ ⎢ ⎣ ... ⎥ ⎦ ⎢ ⎣ . . . ⎥ ⎦ .
τ2+ρσ2/T τ2+τ2+σ2/T αˆN
τ2 c c w
c
WenextuseLemmaA.2anditsnotation,thatis,a=τ2+τ2 +σ2/T,b=τ2+
c w c ρσ2/T,andc(cid:10),d aredefinedaccordingly,whereweusethenotationc(cid:10) toavoid
confusionwiththecinequation(14).ThisapplicationofLemmaA.2yields
⎡ ⎤
τ2+τ2 (cid:13)⎡ ⎤⎡ ⎤
⎢ c τ2 w⎥ c(cid:10) d αˆ1
E(α1|αˆ1,...,αˆN)= ⎢ ⎢ ⎣ . . c ⎥ ⎥ ⎦ ⎢ ⎣ ... ⎥ ⎦ ⎢ ⎣ . . . ⎥ ⎦
. d c(cid:10) αˆN
τ2
c
⎡ ⎤
τ2(c(cid:10)+d(N−1))+τ2c(cid:10) (cid:13)⎡ ⎤
=
⎢
⎢ ⎢ ⎣
τ c
c
2(c(cid:10)+d(N
. .
−1))+τ w
w
2d ⎥
⎥ ⎥ ⎦ ⎢ ⎣
αˆ
. . .
1
⎥ ⎦
.
αˆN
τ2(c(cid:10)+d(N−1))+τ2d
c w
= (τ2(c (cid:10)+d(N−1))+τ2d)Nαˆ ·+τ2(c (cid:10)−d)αˆ1
c w w
N bN 1
= (τ2 −τ2 )αˆ ·+τ2 αˆ1
c a+b(N−1) w(a−b)(a+b(N−1)) wa−b
(cid:18) (cid:19)
τ2 τ2 1 = c αˆ ·+ w αˆ1− αˆ ·
b+ a−b a−b 1+ a−b
N bN
⎛ ⎞
= τ c 2 αˆ ·+ τ w 2 ⎝αˆ1− 1 αˆ ·⎠
τ c 2+ρσ2/T + τ w 2+(1− N ρ)σ2/T τ w 2 +(1−ρ)σ2/T 1+ τ ( w 2 τ + 2+ (1 ρ − σ ρ 2/ )σ T 2 ) / N T ⎛ c ⎞
= 1 αˆ ·+ 1 ⎝αˆ1− 1 αˆ ·⎠.
1+ ρσ2 + τ w 2+(1−ρ)σ2/T 1+ (1−ρ)σ2 1+ τ w 2+(1−ρ)σ2/T
τ
c
2T τ
c
2N τ
w
2T (τ
c
2+ρσ2/T)N
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on [13/10/2026].
See
the Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of use; OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2512 TheJournalofFinance®
Theposteriorhasconditionalvariance
⎡ ⎤ ⎡ ⎤
τ2+τ2 (cid:13)⎡ ⎤ τ2+τ2
⎢ c τ2 w⎥ c(cid:10) d ⎢ c τ2 w⎥
⎢ ⎥ ⎢ ⎥⎢ ⎥
Var(α1|αˆ1,...,αˆN)=τ
c
2+τ
w
2 −⎢
⎣
.
.
c ⎥
⎦
⎣ ... ⎦⎢
⎣
.
.
c ⎥
⎦
. .
d c(cid:10)
τ2 τ2
c c
⎡ ⎤ ⎡ ⎤
τ2(c(cid:10)+d(N−1))+τ2c(cid:10) (cid:13) τ2+τ2
⎢
⎢
τ c 2(c(cid:10)+d(N−1))+τ w 2d ⎥
⎥
⎢
⎢
c τ2 w⎥
⎥
=τ2+τ2 −⎢ c . w ⎥ ⎢ . c ⎥
c w ⎣ . ⎦ ⎣ . ⎦
. .
τ2(c(cid:10)+d(N−1))+τ2d τ2
c w c
=τ2+τ2 −(τ2(c (cid:10)+d(N−1))+τ2c (cid:10) )(τ2+τ2)
c w c w c w
−(τ2(c (cid:10)+d(N−1))+τ2d)τ2(N−1)
c w c
1 1 1
→ τ2+τ2 −(τ2( − )+τ2 )(τ2+τ2)
c w c a−b a−b wa−b c w
1 1
−(τ2 −τ2 )τ2
c b wa−b c
(cid:5) (cid:7)
1 1
=τ2+τ2 − τ4 +τ4
c w wa−b c b
(cid:5) (cid:7)
τ4 τ4
=τ2+τ2 − w + c .
c w τ2 +(1−ρ)σ2/T τ2+ρσ2/T
w c
ThelastresultsfollowfromLemmaA.1. (cid:2)
PROOF OF PROPOSITION 4: We write the joint prior distribution of true and
observedalphasinthemultilevelhierarchicalmodelas
(cid:5) (cid:7) (cid:5) (cid:5) (cid:7)(cid:7)
α (cid:9) (cid:9)
∼N α01 , . (A6)
αˆ 2NK (cid:9)(cid:9)+(cid:10)/T
Theposteriormeanvectoroftruealphasiscomputedvia(A3):
E(α|αˆ)=1 α +(cid:9)((cid:9)+(cid:10)/T) −1(αˆ −1 α )
NK 0 NK 0
(cid:3) (cid:4) (cid:3) (cid:4)
= (cid:9)−1+T(cid:10)−1 −1 (cid:9)−11 α +T(cid:10)−1αˆ ,
NK 0
usingthefactthat ((cid:9)+(cid:10)/T)−1 =(cid:9)−1−(cid:9)−1((cid:9)−1+T(cid:10)−1)−1(cid:9)−1 bytheWood-
burymatrixidentity.Theposteriorvarianceiscomputedsimilarlyvia(A3)and
thesameapplicationoftheWoodburymatrixidentityas
(cid:3) (cid:4)
Var(α|αˆ)=(cid:9)−(cid:9)((cid:9)+(cid:10)/T) −1(cid:9)= (cid:9)−1+T(cid:10)−1 −1.
(cid:2)
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

 15406261, 2023, 5, Downloaded from https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249 by Cochrane Lithuania, Wiley Online Library on [13/10/2026]. See the Terms and Conditions (https://onlinelibrary.wiley.com/terms-and-conditions) on Wiley Online Library for rules of use; OA articles are governed by the applicable Creative Commons License
|     |     | IsThereaReplicationCrisisinFinance? |     |     |     |     |     |     | 2513 |
| --- | --- | ----------------------------------- | --- | --- | --- | --- | --- | --- | ---- |
PROOF OF PROPOSITION 5: Based on the definition of the Bayesian FDR, we
have:
|     |     |     | (cid:5)(cid:12) |     |     | (cid:6) | (cid:7) |     |     |
| --- | --- | --- | --------------- | --- | --- | ------- | ------- | --- | --- |
(cid:6)
1{ifalsediscovery}(cid:6)
|     | FDRBayes | =E  | (cid:12)i |     |     | (cid:6) αˆ1,...,αˆN,τ |     |     |     |
| --- | -------- | --- | --------- | --- | --- | --------------------- | --- | --- | --- |
1{idiscovery}
|     |     |     |     | i   | (cid:18) |     |     |     | (cid:19) |
| --- | --- | --- | --- | --- | -------- | --- | --- | --- | -------- |
(cid:6)
|     |     |     |          |           | (cid:2) |                    | (cid:6)               |     |     |
| --- | --- | --- | -------- | --------- | ------- | ------------------ | --------------------- | --- | --- |
|     |     |     | 1        |           |         |                    | (cid:6)               |     |     |
|     |     | =   | (cid:12) |           | E       | 1{ifalsediscovery} | (cid:6) αˆ1,...,αˆN,τ |     |     |
|     |     |     | 1{id     | iscovery} |         |                    |                       |     |     |
|     |     |     | i        |           | i       |                    |                       |     |     |
(cid:2)
(cid:12) 1
|     |     | =   |     |     | Pr(ifalsediscovery|αˆ1,...,αˆN,τ) |     |     |     |     |
| --- | --- | --- | --- | --- | --------------------------------- | --- | --- | --- | --- |
1{idiscovery}
i
i
|     |     |     | 1   |     | (cid:2) |     |     |     |     |
| --- | --- | --- | --- | --- | ------- | --- | --- | --- | --- |
=
p-null
|     |     |     | #discoveries |     |     | i   |     |     |     |
| --- | --- | --- | ------------ | --- | --- | --- | --- | --- | --- |
idiscovery
≤2.5%.
(cid:2)
| PROOF | PROPOSITIONA.1: |     |     | Theposteriormeanalphais |     |     |     |     |     |
| ----- | --------------- | --- | --- | ----------------------- | --- | --- | --- | --- | --- |
OF
|     |     |     |     | (cid:21) |     | (cid:22) | (cid:21) | (cid:22) |     |
| --- | --- | --- | --- | -------- | --- | -------- | -------- | -------- | --- |
−1
|     |                |     | (cid:29) | (cid:30) τ2+σ¯2 |            | τ2  | αˆ −ε¯ |     |     |
| --- | -------------- | --- | -------- | --------------- | ---------- | --- | ------ | --- | --- |
|     | E(α|αˆ,αˆoos)= |     | τ2       | τ2              |            |     |        |     |     |
|     |                |     |          |                 | τ2 T τ2+σ2 |     | αˆoos  |     |     |
oos
|     |     |     |     |          | (cid:21)       |     | (cid:22)(cid:21) | (cid:22) |     |
| --- | --- | --- | --- | -------- | -------------- | --- | ---------------- | -------- | --- |
|     |     |     |     | (cid:29) | (cid:30) τ2+σ2 | −τ2 | αˆ −ε¯           |          |     |
|     |     |     | = 1 | τ2 τ2    |                |     |                  |          |     |
oos
|     |     |     | det |     | −τ2 | τ2+σ¯2 | αˆoos |     |     |
| --- | --- | --- | --- | --- | --- | ------ | ----- | --- | --- |
T
|     |     |     |     | (cid:3) |     | (cid:4) |     |     |     |
| --- | --- | --- | --- | ------- | --- | ------- | --- | --- | --- |
τ2
|     |     |     | =   | σ2 (αˆ | −ε¯)+σ¯2αˆg |     |     |     |     |
| --- | --- | --- | --- | ------ | ----------- | --- | --- | --- | --- |
|     |     |     |     | oos    |             | T   |     |     |     |
det
|     |     |     |     | τ2(σ¯2+σ2 |     | (cid:3) |     |     | (cid:4) |
| --- | --- | --- | --- | --------- | --- | ------- | --- | --- | ------- |
)
|     |     |     | =         | T   | oos      | w(αˆ    | −ε¯)+(1−w)αoos |         |         |
| --- | --- | --- | --------- | --- | -------- | ------- | -------------- | ------- | ------- |
|     |     |     | τ2(σ¯2+σ2 |     | )+σ¯2σ2  |         |                |         |         |
|     |     |     |           | T   | oos T    | oos     |                |         |         |
|     |     |     |           |     | τ2       | (cid:3) |                |         | (cid:4) |
|     |     |     | =         |     |          | w(αˆ    | −ε¯)+(1−w)αoos |         |         |
|     |     |     | τ2+σ¯2σ2  |     | /(σ¯2+σ2 | )       |                |         |         |
|     |     |     |           | oos |          | oos     |                |         |         |
|     |     |     |           | T   | T        |         |                |         |         |
|     |     |     |           |     | (cid:3)  |         |                | (cid:4) |         |
1
|                     |      |                | =         |            | w(αˆ         | −ε¯)+(1−w)αoos |         | ,   |     |
| ------------------- | ---- | -------------- | --------- | ---------- | ------------ | -------------- | ------- | --- | --- |
|                     |      |                | 1+        | 1          |              |                |         |     |     |
|                     |      |                |           | τ2(σ¯ −2+σ | − 2)         |                |         |     |     |
|                     |      |                |           | T          | o os         |                |         |     |     |
| usingthenotationσ¯2 |      |                | =σ¯2/T,σ2 |            | =σ2/Toos,and |                |         |     |     |
|                     |      |                | T         | oos        |              |                |         |     |     |
|                     | det= | (τ2+σ¯2)(τ2+σ2 |           |            | )−τ4         | =τ2(σ¯2+σ2     | )+σ¯2σ2 |     | .   |
|                     |      |                | T         |            | oos          | T              | oos     | T   | oos |
(cid:2)

2514 TheJournalofFinance®
AppendixB: EBEstimation
Forconvenientreference,werestatethemultilevelhierarchicalmodelofSec-
tionI.Forfactoriincluster j correspondingtosignaln,thefactoris
fi =αi+βirm+εi
t t t
with
αi =αo+cj+sn+wi,
where the alpha components are αo=0, cj ∼N(0,τ2), sn ∼N(0,τ2), and wi ∼
c s
N(0,τ2).Wewritealphainvectorformas
w
α =αo1 +Mc+Zs+w, (B1)
NK
where α = (α1,...,αNK)(cid:10), c= (c1,...,cJ)(cid:10), s= (s1,...,sN)(cid:10), w= (w1,...,wNK)(cid:10),
M is the NK×J matrix of cluster memberships, and Z is the NK×N matrix
indicatingthecharacteristicthatfactoriisbasedon.Giventhehyperparame-
ters(α0,τ ,τ ,τ ),thepriormeanandcovariancematrixofalphasare
c s w
E[α]=0, (cid:9)≡Var(α)=MM (cid:10)τ2+ZZ (cid:10)τ2+I τ2. (B2) c s NK w
The vector of return shocks is ε = (ε1,...,εNK)(cid:10), which is distributed ε ∼
t t t t
N(0,(cid:10)).
Given this structure, we estimate the model as follows. The vector of factor
returns f = (f1,..., fNK)(cid:10) has marginal likelihood—that is, after integrating t t t
outtheuncertainalphacomponents—thatisdistributedas
f ∼N(0,[(cid:9)+(cid:10)]),
t
or, equivalently (treating CAPM betas as known), the estimated alphas are
distributed48
αˆ ∼N(0,[(cid:9)+(cid:10)/T]).
The matrices Z and M are given by the factor definition and cluster assign-
ment(TableIA.III),respectively.Weuseaplug-inestimateofthefactorCAPM-
residualreturncovariancematrix,denoted(cid:10)ˆ (discussedbelow).Finally,given
(cid:10)ˆ, Z, and M, we estimate the hyperparameters of the prior distribution,
(τ ,τ ,τ ),viaMLEbasedonthemarginallikelihood.
c s w
This estimation approach is an example of the EB method. It approximates
thefullyBayesianposteriorcalculation(whichrequiresintegratingoverahy-
perprior distribution of hyperparameters, usually an onerous calculation) by
settingthehyperparameterstotheirmostlikelyvaluesbasedonthemarginal
likelihood. It is particularly well suited to hierarchical Bayesian models in
which parameters for individual observations share some common structure,
48WeabstractfromuncertaintyinCAPMbetastoemphasizetheBayesianupdatingofalphas.
Ourconclusionsarequalitativelyinsensitivetoaccountingforbetauncertainty.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on [13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2515
sothattherealizedheterogeneityacrossindividualobservationsisinformative
aboutsensiblevaluesforthehyperparametersoftheprior.Ourmodelandesti-
mationapproachimplementationisaminorvariationonBayesianhierarchical
normal mean models that are common in Bayesian statistics (textbook treat-
mentsincludeEfron(2012),Gelmanetal.(2013),andMaritz(2018)).Wecon-
duct sensitivityanalysistoensure that our resultsare robust toawide range
of hyperparameters (see Figure IA.6). Also, we note that our EB methodology
is more easily replicable than a full-Bayesian setting with additional hyper-
priors as EB relies on closed-form Bayesian updating rather than numerical
integration.
To ensure cross-sectional stationarity,√we scale each factor such that their
monthly idiosyncratic volatility is 10%/ 12 (i.e., 10% annualized). To con-
struct a plug-in estimate of the factor residual return covariance matrix,
denoted (cid:10)ˆ, we face two main empirical challenges. First, the sample covari-
ance is poorly behaved due the relatively large number of factors compared
to the number of time-series observations. Second, we have an unbalanced
panel because different factors come online at different points in time. To
address the first challenge, we impose a block equicorrelation structure on
(cid:10) based on factors’ cluster membership.49 The correlation between factors
in clusters i and j is estimated as the average correlation among all pairs
such that one factor is in cluster i and the other is in j. In our global anal-
yses, blocks correspond to region-cluster pairs. To address unbalancedness,
we use the bootstrap. In particular, we generate 10,000 bootstrap samples
that resample rows of the unbalanced factor return data set. Each boot-
strap sample is, therefore, also unbalanced, and we use this to produce a
distribution of alpha estimates. From this we calculate (cid:10)ˆ/T as the covari-
ance of alphas across bootstrap samples (imposing the block equicorrelation
structure).
Table I shows the estimated hyperparameters across different samples.
While most of our analysis is based on these full-sample estimates, we also
consider rolling estimates of the hyperparameters when considering out-of-
sampleevidenceasseeninFigureIA.5.
REFERENCES
Acharya,Viral,andLasseHejePedersen,2005,Assetpricingwithliquidityrisk,JournalofFi-
nancialEconomics77,375–410.
Amihud, Yakov, and Haim Mendelson, 1986, Asset pricing and the bid-ask spread, Journal of
FinancialEconomics17,223–249.
Asness, Cliff, Tobias Moskowitz, and Lasse Heje Pedersen, 2013, Value and momentum every-
where,JournalofFinance68,929–985.
49AsadvocatedbyEngleandKelly(2012)andElton,Gruber,andSpitzer(2006),blockequicor-
relationconstrainsallpairsoffactorsinthesameblocktoshareasinglecorrelationparameter,
andlikewiseforcross-blockcorrelations.Thisstabilizescovariancematrixestimatesbydramat-
icallyreducingtheparameterizationofthecorrelationmatrix,whileleavingtheindividualvari-
anceestimatesunchanged.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2516 TheJournalofFinance®
Asness,Clifford,andAndreaFrazzini,2013,ThedevilinHML’sdetails,JournalofPortfolioMan-
agement39,49–68.
Benjamini, Yoav, and Yosef Hochberg, 1995, Controlling the false discovery rate: A practical
and powerful approach to multiple testing, Journal of the Royal Statistical Society: Series
B(Methodological)57,289–300.
Benjamini,Yoav,andDanielYekutieli,2001,Thecontrolofthefalsediscoveryrateinmultiple
testingunderdependency,AnnalsofStatistics29,1165–1188.
Berry, Donald A., and Yosef Hochberg, 1999, Bayesian perspectives on multiple comparisons,
JournalofStatisticalPlanningandInference82,215–227.
Bettis,RichardA,2012,Thesearchforasterisks:Compromisedstatisticaltestsandflawedtheo-
ries,StrategicManagementJournal33,108–113.
Britten-Jones,Mark,1999,Thesamplingerrorinestimatesofmean-varianceefficientportfolio
weights,JournalofFinance54,655–671.
Bryzgalova, Svetlana, Jiantao Huang, and Christian Julliard, 2023, Bayesian solutions for the
factorzoo:Wejustrantwoquadrillionmodels,JournalofFinance,78,487–557.
Chen,AndrewY.,2021,Thelimitsofp-hacking:Somethoughtexperiments,JournalofFinance,
76,2447–2480.
Chen,AndrewY.,andTomZimmermann,2022,Opensourcecross-sectionalassetpricing,Critical
FinanceReview,11,207–264.
Chen,AndrewY.,andTomZimmermann,2020b,Publicationbiasandthecross-sectionofstock
returns,ReviewofAssetPricingStudies10,249–289.
Chinco, Alex, Andreas Neuhierl, and Michael Weber, 2021, Estimating the anomaly base rate,
JournalofFinancialEconomics140,101–126.
Chordia,Tarun,AmitGoyal,andAlessioSaretto,2020,Anomaliesandfalserejections,Reviewof
FinancialStudies33,2134–2179.
Cochrane,JohnH.,2011,Presidentialaddress:Discountrates,JournalofFinance66,1047–1108.
Efron,Bradley,2007,Size,powerandfalsediscoveryrates,AnnalsofStatistics35,1351–1377.
Efron,Bradley,2012,Large-ScaleInference:EmpiricalBayesMethodsforEstimation,Testing,and
Prediction,volume1(CambridgeUniversityPress,Cambridge).
Efron,Bradley,andRobertTibshirani,2002,EmpiricalBayesmethodsandfalsediscoveryrates
formicroarrays,GeneticEpidemiology23,70–86.
Elton, Edwin J., Martin J. Gruber, and Jonathan Spitzer, 2006, Improved estimates of correla-
tioncoefficientsandtheirimpactonoptimumportfolios,EuropeanFinancialManagement12,
303–318.
Engle,Robert,andBryanKelly,2012,Dynamicequicorrelation,JournalofBusiness&Economic
Statistics30,212–228.
Fama,EugeneF.,andKennethR.French,1993,Commonriskfactorsinthereturnsonstocksand
bonds,JournalofFinancialEconomics33,3–56.
Feng, Guanhao, Stefano Giglio, and Dacheng Xiu, 2020, Taming the factor zoo: A test of new
factors,JournalofFinance75,1327–1370.
Frazzini,Andrea,andLasseHejePedersen,2014,Bettingagainstbeta,JournalofFinancialEco-
nomics111,1–25.
Gelman, Andrew, 2016, Bayesian inference completely solves the multiple comparisons
problem, Statistical Modeling, Causal Inference, and Social Science. Available at
https://statmodeling.stat.columbia.edu/2016/08/22/bayesian-inference-completely-solves-
the-multiple-comparisons-problem/.
Gelman, Andrew, John B. Carlin, Hal S. Stern, David B. Dunson, Aki Vehtari, and Donald B.
Rubin,2013,BayesianDataAnalysis:,thirdedition(CRCPress,NewYork).
Gelman,Andrew,JenniferHill,andMasanaoYajima,2012,Whywe(usually)don’thavetoworry
aboutmultiplecomparisons,JournalofResearchonEducationalEffectiveness5,189–211.
Green,Jeremiah,JohnR.M.Hand,andX.FrankZhang,2017,Thecharacteristicsthatprovide
independentinformationaboutaverageusmonthlystockreturns,ReviewofFinancialStudies
30,4389–4436.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

IsThereaReplicationCrisisinFinance? 2517
Greenland,Sander,andAlbertHofman,2019,Multiplecomparisonscontroversiesareaboutcon-
textandcosts,notfrequentismversusBayesianism,EuropeanJournalofEpidemiology34,
801–808.
Greenland,Sander,andJamesM.Robins,1991,Empirical-Bayesadjustmentsformultiplecom-
parisonsaresometimesuseful,Epidemiology,2,244–251.
Hamermesh, Daniel S., 2007, Replication in economics, Canadian Journal of Economics/Revue
canadienned’économique40,715–733.
Harvey, Campbell R., 2017, Presidential address: The scientific outlook in financial economics,
JournalofFinance72,1399–1440.
Harvey,CampbellR.,YanLiu,andHeqingZhu,2016,…andthecross-sectionofexpectedreturns,
ReviewofFinancialStudies29,5–68.
Heston, Steven L., and Ronnie Sadka, 2008, Seasonality in the cross-section of stock returns,
JournalofFinancialEconomics87,418–445.
Hou,Kewei,ChenXue,andLuZhang,2020,Replicatinganomalies,ReviewofFinancialStudies
33,2019–2133.
Ilmanen,Antti,RonenIsrael,TobiasJMoskowitz,RachelLee,andAshwinK.Thapar,2021,How
dofactorpremiavaryovertime?Acenturyofevidence,JournalofInvestmentManagement,
19,15–57.
Ioannidis,JohnPA.,2005,Whymostpublishedresearchfindingsarefalse,PLoSMedicine2,e124.
Jacobs, Heiko, and Sebastian Müller, 2020, Anomalies across the globe: Once public, no longer
existent?,JournalofFinancialEconomics135,213–230.
Kelly,BryanT.,SethPruitt,andYinanSu,2019,Characteristicsarecovariances:Aunifiedmodel
ofriskandreturn,JournalofFinancialEconomics134,501–524.
Koijen,RalphS.J.,TobiasJ.Moskowitz,LasseHejePedersen,andEvertB.Vrugt,2018,Carry,
JournalofFinancialEconomics127,197–225.
Kozak,Serhiy,StefanNagel,andShrihariSantosh,2020,Shrinkingthecross-section,Journalof
FinancialEconomics135,271–292.
Linnainmaa, Juhani T., and Michael R. Roberts, 2018, The history of the cross-section of stock
returns,ReviewofFinancialStudies31,2606–2649.
Maniadis,Zacharias,FabioTufano,andJohnA.List,2017,Toreplicateornottoreplicate?Explor-
ingreproducibilityineconomicsthroughthelensofamodelandapilotstudy,TheEconomic
Journal127,F209–F235.
Maritz,JohannesS.,2018,EmpiricalBayesMethodswithApplications,secondedition(CRCPress,
NewYork).
McLean, R. David, and Jeffrey Pontiff, 2016, Does academic research destroy stock return pre-
dictability?JournalofFinance71,5–32.
Moskowitz, Tobias J., Yao Hua Ooi, and Lasse Heje Pedersen, 2012, Time series momentum,
JournalofFinancialEconomics104,228–250.
Murtagh,Fionn,andPierreLegendre,2014,Ward’shierarchicalagglomerativeclusteringmethod:
WhichalgorithmsimplementWard’scriterion?JournalofClassification31,274–295.
Nosek,BrianA.,JeffreyR.Spies,andMattMotyl,2012,Scientificutopia:II.Restructuringincen-
tivesandpracticestopromotetruthoverpublishability,PerspectivesonPsychologicalScience
7,615–631.
Pedersen, Lasse Heje, Abhilash Babu, and Ari Levine, 2021, Enhanced portfolio optimization,
FinancialAnalystsJournal77,124–151.
Shumway,Tyler,1997,ThedelistingbiasinCRSPdata,JournalofFinance52,327–340.
Sloan,RichardG.,1996,Dostockpricesfullyreflectinformationinaccrualsandcashflowsabout
futureearnings?AccountingReview71,289–315.
Ward,JoeH.,1963,Hierarchicalgroupingtooptimizeanobjectivefunction,JournaloftheAmeri-
canStatisticalAssociation58,236–244.
Welch, Ivoi, 2019, Reproducing, extending, updating, replicating, reexamining, and reconciling,
CriticalFinanceReview8,301–304.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License

2518 TheJournalofFinance®
SupportingInformation
Additional Supporting Information may be found in the online version of this
articleatthepublisher’swebsite:
AppendixS1:InternetAppendix.
ReplicationCode.
15406261,
2023,
5,
Downloaded
from
https://onlinelibrary.wiley.com/doi/10.1111/jofi.13249
by
Cochrane
Lithuania,
Wiley
Online
Library
on
[13/10/2026].
See
the
Terms
and
Conditions
(https://onlinelibrary.wiley.com/terms-and-conditions)
on
Wiley
Online
Library
for
rules
of
use;
OA
articles
are
governed
by
the
applicable
Creative
Commons
License