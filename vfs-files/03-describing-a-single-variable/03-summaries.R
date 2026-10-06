# Auto-extracted from 03-summaries.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
ci |> summarise(
  n = n(),
  mean = mean(life_expectancy),
  median = median(life_expectancy),
  sd = sd(life_expectancy),
  IQR = IQR(life_expectancy),
  .groups = "drop"
)


## -----------------------------------------------------------------------------
ci |> summarise(
  mean = mean(gdp_per_capita),
  median = median(gdp_per_capita),
  sd = sd(gdp_per_capita),
  IQR = IQR(gdp_per_capita)
)


## -----------------------------------------------------------------------------
ci |>
  group_by(recent_internal_conflict) |>
  summarise(
    n = n(),
    mean_le = mean(life_expectancy),
    median_le = median(life_expectancy),
    .groups = "drop"
  )

