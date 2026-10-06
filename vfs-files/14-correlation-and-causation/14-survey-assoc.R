# Auto-extracted from 14-survey-assoc.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
survey <- read_csv("data/survey_attitudes.csv")

cor(
  survey$support_international_cooperation,
  survey$perceived_security_threat,
  use = "complete.obs"
)

ggplot(survey, aes(x = perceived_security_threat,
                   y = support_international_cooperation)) +
  geom_point(alpha = 0.35) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Association in survey attitudes",
    x = "Perceived security threat",
    y = "Support for international cooperation"
  )

