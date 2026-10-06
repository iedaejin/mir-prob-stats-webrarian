# Auto-extracted from 04-variation.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
cor_all <- cor(ci$gdp_per_capita, ci$life_expectancy)

# Artificial restricted range: middle 50% of GDP
q <- quantile(ci$gdp_per_capita, c(0.25, 0.75))
# q has two values (25th and 75th percentiles): use q[1] and q[2]
mid <- ci |> filter(gdp_per_capita >= q[1], gdp_per_capita <= q[2])
cor_mid <- cor(mid$gdp_per_capita, mid$life_expectancy)

tibble(sample = c("all countries", "middle 50% GDP"),
       n = c(nrow(ci), nrow(mid)),
       r = c(cor_all, cor_mid))

