# Session 5 companion
library(tidyverse)
ci <- read_csv("data/country_indicators.csv", show_col_types = FALSE)
cor(ci$gdp_per_capita, ci$life_expectancy)
cor(log(ci$gdp_per_capita), ci$life_expectancy)
summary(lm(life_expectancy ~ gdp_per_capita, ci))
