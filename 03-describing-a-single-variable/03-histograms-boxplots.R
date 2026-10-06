# Auto-extracted from 03-histograms-boxplots.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
ci <- read_csv("data/country_indicators.csv")


## -----------------------------------------------------------------------------
ggplot(ci, aes(life_expectancy)) +
  geom_histogram(bins = 10, colour = "white") +
  labs(title = "Life expectancy", x = "Years", y = "Count")

ggplot(ci, aes(gdp_per_capita)) +
  geom_histogram(bins = 12, colour = "white") +
  labs(title = "GDP per capita", x = "USD", y = "Count")


## -----------------------------------------------------------------------------
ggplot(ci, aes(x = "", y = life_expectancy)) +
  geom_boxplot() +
  labs(x = NULL, y = "Life expectancy")

ggplot(ci, aes(x = factor(recent_internal_conflict),
               y = life_expectancy)) +
  geom_boxplot() +
  labs(x = "Recent internal conflict (0/1)", y = "Life expectancy")

