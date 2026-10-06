# Auto-extracted from 07-multiple.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv") |>
  mutate(gdp_10k = gdp_per_capita / 10000)


## -----------------------------------------------------------------------------
fit1 <- lm(life_expectancy ~ gdp_10k, data = ci)
fit2 <- lm(life_expectancy ~ gdp_10k + democracy_score, data = ci)

tibble(
  model = c("GDP only", "GDP + democracy"),
  gdp_slope = c(coef(fit1)["gdp_10k"], coef(fit2)["gdp_10k"]),
  dem_slope = c(NA, coef(fit2)["democracy_score"]),
  r2 = c(summary(fit1)$r.squared, summary(fit2)$r.squared)
)

# Associational interpretation only — not causal effects.
coef(fit2)

