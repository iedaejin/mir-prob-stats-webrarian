# Session 7 companion
library(tidyverse)
ci <- read_csv("data/country_indicators.csv", show_col_types = FALSE) |>
  mutate(gdp_10k = gdp_per_capita / 10000)
fit1 <- lm(life_expectancy ~ gdp_10k, ci)
fit2 <- lm(life_expectancy ~ gdp_10k + democracy_score, ci)
print(coef(fit1))
print(coef(fit2))
print(c(summary(fit1)$r.squared, summary(fit2)$r.squared))
