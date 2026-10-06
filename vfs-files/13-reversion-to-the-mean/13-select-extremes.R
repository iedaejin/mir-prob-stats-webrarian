# Auto-extracted from 13-select-extremes.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
set.seed(321)
n <- 500
stable_support <- rnorm(n, 50, 10)
sim <- tibble(
  wave1 = stable_support + rnorm(n, 0, 8),
  wave2 = stable_support + rnorm(n, 0, 8)
)

extreme_high <- sim |> filter(wave1 >= quantile(wave1, 0.90))
extreme_low  <- sim |> filter(wave1 <= quantile(wave1, 0.10))

extreme_high |> summarise(mean_wave1 = mean(wave1), mean_wave2 = mean(wave2))
extreme_low  |> summarise(mean_wave1 = mean(wave1), mean_wave2 = mean(wave2))

