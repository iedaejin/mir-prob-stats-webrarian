# Auto-extracted from 13-countries.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
world <- read_csv("data/country_indicators.csv")
glimpse(world)

world |>
  summarise(
    mean_democracy = mean(democracy_score, na.rm = TRUE),
    mean_life_exp = mean(life_expectancy, na.rm = TRUE)
  )

