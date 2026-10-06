# Session 3 — quick univariate description
# Prof. Dae-Jin Lee (daelee@faculty.ie.edu)

library(tidyverse)
ci <- read_csv("data/country_indicators.csv", show_col_types = FALSE)

summary(ci$life_expectancy)
summary(ci$gdp_per_capita)

ci |>
  summarise(across(c(life_expectancy, gdp_per_capita, democracy_score),
                   list(mean = mean, median = median, sd = sd, IQR = IQR)))
