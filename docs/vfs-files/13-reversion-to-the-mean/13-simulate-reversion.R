# Auto-extracted from 13-simulate-reversion.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
set.seed(321)
n <- 500
stable_support <- rnorm(n, mean = 50, sd = 10)

sim <- tibble(
  wave1 = stable_support + rnorm(n, 0, 8),
  wave2 = stable_support + rnorm(n, 0, 8)
)

ggplot(sim, aes(x = wave1, y = wave2)) +
  geom_point(alpha = 0.4) +
  geom_abline(slope = 1, intercept = 0, linetype = 2) +
  labs(
    title = "Repeated measurements (no treatment effect)",
    x = "Wave 1",
    y = "Wave 2"
  )

