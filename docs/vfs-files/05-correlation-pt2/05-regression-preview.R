# Auto-extracted from 05-regression-preview.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
fit <- lm(life_expectancy ~ gdp_per_capita, data = ci)
coef(fit)
# years associated with +10000 GDP/capita
coef(fit)[2] * 10000

ggplot(ci, aes(gdp_per_capita, life_expectancy)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

