# Auto-extracted from 04-scatterplots.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
ggplot(ci, aes(gdp_per_capita, life_expectancy)) +
  geom_point() +
  labs(title = "GDP and life expectancy",
       x = "GDP per capita", y = "Life expectancy")

ggplot(ci, aes(democracy_score, life_expectancy)) +
  geom_point() +
  labs(title = "Democracy and life expectancy",
       x = "Democracy score", y = "Life expectancy")

