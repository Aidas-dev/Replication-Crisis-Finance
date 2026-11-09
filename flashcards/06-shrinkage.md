# 5 / 14 Why shrinkage wins

Time: 60 seconds.

Goal: the Bayesian correction keeps power that a p-value correction loses.

Say:
- Benjamini-Yekutieli raises every p-value. It controls false discoveries and loses power everywhere.
- The Bayesian posterior learns how much to shrink from the same data.
- It shrinks hard when true alphas are rare, and little when they are common.
- In a simulation of 130 factors, the uncorrected test lets the false discovery rate reach 25 percent.
- Both corrections fix that. Only the Bayesian one keeps the power to find real factors.

Point at: 25 percent.

Next: "Now the data."

If asked "What is a false discovery?": a factor reported as real that is truly zero.
