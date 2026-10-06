# Auto-extracted from 06-prediction.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")
fit <- lm(life_expectancy ~ gdp_per_capita, data = ci)


## -----------------------------------------------------------------------------
ci |>
  mutate(yhat = fitted(fit), resid = resid(fit)) |>
  select(country, gdp_per_capita, life_expectancy, yhat, resid) |>
  arrange(desc(abs(resid))) |>
  head(8)

# Predict at selected GDP levels
new_x <- tibble(gdp_per_capita = c(5000, 20000, 40000))
predict(fit, newdata = new_x)

