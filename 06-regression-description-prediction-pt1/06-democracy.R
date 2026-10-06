# Auto-extracted from 06-democracy.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
fit_d <- lm(life_expectancy ~ democracy_score, data = ci)
coef(fit_d)
summary(fit_d)$r.squared

# Binary X link
fit_c <- lm(life_expectancy ~ recent_internal_conflict, data = ci)
coef(fit_c)
ci |>
  group_by(recent_internal_conflict) |>
  summarise(mean_le = mean(life_expectancy), .groups = "drop")

