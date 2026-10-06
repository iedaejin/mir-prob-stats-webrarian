# Auto-extracted from 07-prediction-vs-causation.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv") |>
  mutate(gdp_10k = gdp_per_capita / 10000)
fit2 <- lm(life_expectancy ~ gdp_10k + democracy_score, data = ci)


## -----------------------------------------------------------------------------
# Predictive use: fitted values for observed countries
ci |>
  mutate(yhat = fitted(fit2)) |>
  select(country, gdp_10k, democracy_score, life_expectancy, yhat) |>
  head(6)

# Hypothetical prediction (NOT a causal forecast of an intervention)
new <- tibble(gdp_10k = 2.5, democracy_score = 6)
predict(fit2, newdata = new)

