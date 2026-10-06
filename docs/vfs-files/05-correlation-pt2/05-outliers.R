# Auto-extracted from 05-outliers.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
r_all <- cor(ci$gdp_per_capita, ci$life_expectancy)

ci |>
  mutate(r_without = map_dbl(country, function(ctry) {
    d <- filter(ci, country != ctry)
    cor(d$gdp_per_capita, d$life_expectancy)
  }),
  delta = r_without - r_all) |>
  select(country, gdp_per_capita, life_expectancy, r_without, delta) |>
  arrange(delta) |>
  head(5)

