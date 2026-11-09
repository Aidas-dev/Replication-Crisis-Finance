# 4 / 14 The model

Time: 70 seconds.

Goal: alpha is the part of the return that the market cannot explain.

Say:
- Each factor return splits into three parts. The market return, a constant alpha, and noise.
- Alpha is the object of the test.
- The prior says alpha is zero on average. A factor can deviate, but the model expects that most do not.
- The estimate shrinks by kappa. Kappa is below one, and it moves toward one when the sample is long or the estimate is precise.
- A short noisy backtest gets shrunk hard. A long precise one keeps most of its alpha.

Point at: the three equations.

Next: "That is why the paper prefers shrinkage to a p-value penalty."

If asked "Why not a normal t-test?": a t-test treats each factor alone. The model borrows evidence across all 153 factors.
