# Auto-extracted from 09-simulate.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
set.seed(9)
support <- rbinom(1000, size = 1, prob = 0.30)
mean(support)


## -----------------------------------------------------------------------------
set.seed(9)
c(
  n20 = mean(rbinom(20, 1, 0.30)),
  n200 = mean(rbinom(200, 1, 0.30)),
  n20000 = mean(rbinom(20000, 1, 0.30))
)


## -----------------------------------------------------------------------------
set.seed(9)
many_small <- replicate(500, mean(rbinom(20, 1, 0.30)))
tibble(est = many_small) |>
  ggplot(aes(x = est)) +
  geom_histogram(bins = 20) +
  labs(
    title = "Sampling noise with n = 20",
    x = "Estimated support share",
    y = "Count"
  )

