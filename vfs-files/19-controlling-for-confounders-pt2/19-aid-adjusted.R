# Auto-extracted from 19-aid-adjusted.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, message=FALSE, warning=FALSE--------------------------------------
library(tidyverse)
aid <- read_csv("data/aid_observational.csv")


## -----------------------------------------------------------------------------
m1 <- lm(economic_growth_pct ~ aid_per_capita, data = aid)
m2 <- lm(
  economic_growth_pct ~ aid_per_capita +
    baseline_need + conflict_intensity + institutional_quality,
  data = aid
)

summary(m1)
summary(m2)

coef(m1)["aid_per_capita"]
coef(m2)["aid_per_capita"]

