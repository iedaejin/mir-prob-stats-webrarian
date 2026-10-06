# Auto-extracted from 05-ir-examples.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
vars <- c("gdp_per_capita", "life_expectancy", "democracy_score",
          "trade_openness", "un_voting_alignment", "military_spending_pct_gdp")
round(cor(ci[vars]), 2)

ci |>
  select(life_expectancy, gdp_per_capita, democracy_score, trade_openness) |>
  pivot_longer(-life_expectancy) |>
  ggplot(aes(value, life_expectancy)) +
  geom_point(alpha = 0.75) +
  facet_wrap(~ name, scales = "free_x") +
  labs(x = NULL, y = "Life expectancy")

