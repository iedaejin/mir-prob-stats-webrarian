# Auto-extracted from 02-social.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
library(qss)


## -----------------------------------------------------------------------------
data("social", package = "qss")
social <- as_tibble(social)
summary(social)


## -----------------------------------------------------------------------------
social |>
  group_by(messages) |>
  summarise(
    n = n(),
    turnout_2006 = mean(primary2006),
    .groups = "drop"
  )

control_turnout <- mean(social$primary2006[social$messages == "Control"])
control_turnout


## -----------------------------------------------------------------------------
social |>
  group_by(messages) |>
  summarise(turnout_2006 = mean(primary2006), .groups = "drop") |>
  mutate(effect_vs_control = turnout_2006 - control_turnout)


## -----------------------------------------------------------------------------
social <- social |> mutate(age = 2006 - yearofbirth)
social |>
  group_by(messages) |>
  summarise(
    mean_age = mean(age),
    mean_primary2004 = mean(primary2004),
    mean_hhsize = mean(hhsize),
    .groups = "drop"
  )

