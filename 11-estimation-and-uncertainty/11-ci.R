# Auto-extracted from 11-ci.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
survey <- read_csv("data/survey_attitudes.csv")
set.seed(11)
samp <- survey |> slice_sample(n = 40)

t.test(samp$support_international_cooperation)
t.test(samp$support_international_cooperation)$conf.int

