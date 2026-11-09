# Likely questions

## Why CAPM and not Fama-French?

Fama-French contains size and value. Those are factors under test, so the benchmark absorbs part of the answer.

## How can this paper find 82 percent when other papers find 35?

The other papers test raw returns. This paper tests CAPM alpha. Risk adjustment moves the rate by about 27 points.

## Does shrinkage throw away real factors?

It shrinks by precision. A precise estimate keeps most of its alpha. The simulation shows that the power loss is small when real factors are common.

## Why do returns fall after publication?

Part of the in-sample alpha comes from search. Investors also trade away part of the rest. A Bayesian expects the estimate to fall toward the prior.

## What is the false discovery rate?

It is the expected share of reported discoveries that are false. At 5 percent, one in twenty reported factors is false on average.

## Where are the data and code?

The data are at jkpfactors.com. The code is at github.com/bkelly-lab/jkp-data. The code runs through WRDS, so the raw CRSP and Compustat data stay licensed.

## What is the 2025 test?

A working paper asks whether a standard six-factor model can explain each factor. It explains 132 of the 153 factors, so 21 remain.

## Is the result sensitive to the prior?

Yes. Card 12 shows the table. At a 1 percent share of true factors, the Bayesian false discovery rate is 56.4 percent.
