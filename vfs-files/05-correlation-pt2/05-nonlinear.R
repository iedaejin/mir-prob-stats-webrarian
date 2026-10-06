# Auto-extracted from 05-nonlinear.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
ci |> summarise(
  r_level = cor(gdp_per_capita, life_expectancy),
  r_log = cor(log(gdp_per_capita), life_expectancy)
)

ggplot(ci, aes(gdp_per_capita, life_expectancy)) +
  geom_point() + geom_smooth(se = FALSE)

ggplot(ci, aes(log(gdp_per_capita), life_expectancy)) +
  geom_point() + geom_smooth(method = "lm", se = FALSE)

