# Auto-extracted from 09-conditional.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
survey <- read_csv("data/survey_attitudes.csv") |>
  mutate(
    high_support = support_international_cooperation >= 7,
    high_threat = perceived_security_threat >= 6
  )


## -----------------------------------------------------------------------------
p_high <- mean(survey$high_support)
p_high

survey |>
  filter(education == "Postgraduate") |>
  summarise(p_high_given_postgrad = mean(high_support))


## -----------------------------------------------------------------------------
survey |>
  filter(high_threat) |>
  summarise(
    n = n(),
    p_high_support = mean(high_support)
  )


## -----------------------------------------------------------------------------
p_both <- mean(survey$high_support & survey$high_threat)
p_threat <- mean(survey$high_threat)
p_both / p_threat


## -----------------------------------------------------------------------------
p_high * p_threat
p_both

