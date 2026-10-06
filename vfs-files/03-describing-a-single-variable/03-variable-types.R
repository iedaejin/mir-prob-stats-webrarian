# Auto-extracted from 03-variable-types.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
ci <- read_csv("data/country_indicators.csv")
glimpse(ci)


## -----------------------------------------------------------------------------
ci |> count(region, sort = TRUE)

ci |> count(recent_internal_conflict) |>
  mutate(share = n / sum(n))

