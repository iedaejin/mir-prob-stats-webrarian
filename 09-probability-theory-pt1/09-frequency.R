# Auto-extracted from 09-frequency.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
survey <- read_csv("data/survey_attitudes.csv")
glimpse(survey)


## -----------------------------------------------------------------------------
survey <- survey |>
  mutate(high_support = support_international_cooperation >= 7)

mean(survey$high_support)


## -----------------------------------------------------------------------------
survey <- survey |>
  mutate(high_threat = perceived_security_threat >= 6)

mean(survey$high_threat)


## -----------------------------------------------------------------------------
mean(survey$high_support & survey$high_threat)

