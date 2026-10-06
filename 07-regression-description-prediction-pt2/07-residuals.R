# Auto-extracted from 07-residuals.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
fit <- lm(life_expectancy ~ gdp_per_capita, data = ci)

ci |>
  mutate(yhat = fitted(fit), uhat = resid(fit)) |>
  select(country, gdp_per_capita, life_expectancy, yhat, uhat) |>
  arrange(desc(abs(uhat))) |>
  head(8)

ci |>
  mutate(yhat = fitted(fit), uhat = resid(fit)) |>
  ggplot(aes(yhat, uhat)) +
  geom_hline(yintercept = 0) +
  geom_point() +
  labs(x = "Fitted LE", y = "Residual")

