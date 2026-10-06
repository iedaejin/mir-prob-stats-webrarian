# Auto-extracted from 10-bernoulli.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------


## -----------------------------------------------------------------------------
set.seed(10)
x <- rbinom(5000, size = 1, prob = 0.35)
c(mean = mean(x), var = var(x))
c(theory_mean = 0.35, theory_var = 0.35 * 0.65)

