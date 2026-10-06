# Auto-extracted from 10-binomial.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
set.seed(10)
agreements <- rbinom(10000, size = 10, prob = 0.4)
c(mean = mean(agreements), var = var(agreements))
c(theory_mean = 10 * 0.4, theory_var = 10 * 0.4 * 0.6)


## -----------------------------------------------------------------------------
tibble(agreements = agreements) |>
  ggplot(aes(x = agreements)) +
  geom_histogram(binwidth = 1, boundary = -0.5) +
  labs(
    title = "Simulated Binomial(10, 0.4)",
    x = "Number of agreements",
    y = "Frequency"
  )

