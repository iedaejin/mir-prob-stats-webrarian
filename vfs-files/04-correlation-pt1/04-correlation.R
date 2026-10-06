# Auto-extracted from 04-correlation.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
ci |> summarise(
  r_gdp_le = cor(gdp_per_capita, life_expectancy),
  r_dem_le = cor(democracy_score, life_expectancy),
  r_trade_gdp = cor(trade_openness, gdp_per_capita),
  r_mil_le = cor(military_spending_pct_gdp, life_expectancy),
  r_un_dem = cor(un_voting_alignment, democracy_score)
)

ci |>
  select(gdp_per_capita, life_expectancy, democracy_score,
         trade_openness, military_spending_pct_gdp) |>
  cor() |>
  round(2)

