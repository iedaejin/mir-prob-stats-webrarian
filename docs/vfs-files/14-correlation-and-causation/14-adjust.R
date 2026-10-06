# Auto-extracted from 14-adjust.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
world <- read_csv("data/country_indicators.csv")

m_naive <- lm(life_expectancy ~ democracy_score, data = world)
m_adjusted <- lm(
  life_expectancy ~ democracy_score + log(gdp_per_capita),
  data = world
)

summary(m_naive)$coefficients
summary(m_adjusted)$coefficients

