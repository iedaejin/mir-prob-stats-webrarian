# Session 4 companion script
library(tidyverse)
ci <- read_csv("data/country_indicators.csv", show_col_types = FALSE)
cor(ci$gdp_per_capita, ci$life_expectancy)
plot(ci$gdp_per_capita, ci$life_expectancy,
     xlab = "GDP per capita", ylab = "Life expectancy")
