# Session 6 companion OLS
library(tidyverse)
ci <- read_csv("data/country_indicators.csv", show_col_types = FALSE)
fit <- lm(life_expectancy ~ gdp_per_capita, ci)
print(coef(fit))
print(coef(fit)[2] * 10000)
