# Auto-extracted from 16-diplomacy-dim.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, message=FALSE, warning=FALSE--------------------------------------
library(tidyverse)
exp <- read_csv("data/diplomacy_experiment.csv")


## -----------------------------------------------------------------------------
exp |> count(treatment_message)

exp |>
  group_by(treatment_message) |>
  summarise(
    mean_age = mean(age),
    mean_prior = mean(prior_support),
    n = n(),
    .groups = "drop"
  )


## -----------------------------------------------------------------------------
exp |>
  group_by(treatment_message) |>
  summarise(
    mean_y = mean(post_support_diplomatic_cooperation),
    n = n(),
    .groups = "drop"
  )


## -----------------------------------------------------------------------------
m <- lm(
  post_support_diplomatic_cooperation ~ treatment_message,
  data = exp
)
summary(m)
confint(m)

