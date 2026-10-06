# Auto-extracted from 10-survey-rv.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
survey <- read_csv("data/survey_attitudes.csv")
x <- survey$support_international_cooperation

c(mean = mean(x), sd = sd(x), var = var(x))
mean(x >= 7)


## -----------------------------------------------------------------------------
tibble(x = x) |>
  ggplot(aes(x = x)) +
  geom_histogram(bins = 15) +
  labs(
    title = "Empirical distribution of cooperation support",
    x = "Support score",
    y = "Count"
  )

