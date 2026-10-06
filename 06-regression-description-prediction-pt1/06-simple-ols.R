# Auto-extracted from 06-simple-ols.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
fit <- lm(life_expectancy ~ gdp_per_capita, data = ci)
summary(fit)$coefficients
summary(fit)$r.squared

ci <- ci |> mutate(gdp_10k = gdp_per_capita / 10000)
fit2 <- lm(life_expectancy ~ gdp_10k, data = ci)
coef(fit2)

ggplot(ci, aes(gdp_per_capita, life_expectancy)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

