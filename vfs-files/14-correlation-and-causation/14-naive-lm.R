# Auto-extracted from 14-naive-lm.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
world <- read_csv("data/country_indicators.csv")

ggplot(world, aes(x = democracy_score, y = life_expectancy)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Association — not automatically causation",
    x = "Democracy score",
    y = "Life expectancy"
  )

m_naive <- lm(life_expectancy ~ democracy_score, data = world)
summary(m_naive)

