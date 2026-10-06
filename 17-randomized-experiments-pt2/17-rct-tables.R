# Auto-extracted from 17-rct-tables.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, message=FALSE, warning=FALSE--------------------------------------
library(tidyverse)
exp <- read_csv("data/diplomacy_experiment.csv")


## -----------------------------------------------------------------------------
m0 <- lm(
  post_support_diplomatic_cooperation ~ treatment_message,
  data = exp
)
m1 <- lm(
  post_support_diplomatic_cooperation ~ treatment_message + prior_support,
  data = exp
)

summary(m0)
summary(m1)
confint(m0)
confint(m1)

