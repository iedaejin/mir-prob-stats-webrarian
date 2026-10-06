# Auto-extracted from 18-confounding-intro.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, message=FALSE, warning=FALSE--------------------------------------
library(tidyverse)
aid <- read_csv("data/aid_observational.csv")


## -----------------------------------------------------------------------------
ggplot(aid, aes(aid_per_capita, economic_growth_pct)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Aid and growth (observational)",
    x = "Aid per capita",
    y = "Economic growth (%)"
  )

m1 <- lm(economic_growth_pct ~ aid_per_capita, data = aid)
summary(m1)

