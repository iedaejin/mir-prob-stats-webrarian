# Auto-extracted from 12-fishing.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
survey <- read_csv("data/survey_attitudes.csv") |>
  mutate(ideo_bin = ntile(ideology_0_left_10_right, 10))

pvals <- map_dbl(1:10, function(b) {
  d <- survey |> mutate(in_bin = ideo_bin == b)
  tryCatch(
    t.test(support_international_cooperation ~ in_bin, data = d)$p.value,
    error = function(e) NA_real_
  )
})

tibble(bin = 1:10, p_value = pvals) |>
  mutate(star = p_value < 0.05)

