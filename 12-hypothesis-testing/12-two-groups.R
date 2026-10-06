# Auto-extracted from 12-two-groups.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
survey <- read_csv("data/survey_attitudes.csv")

two <- survey |>
  filter(education %in% c("Bachelor", "Postgraduate"))

two |>
  group_by(education) |>
  summarise(n = n(), mean_support = mean(support_international_cooperation),
            .groups = "drop")

tt <- t.test(support_international_cooperation ~ education, data = two)
tt

