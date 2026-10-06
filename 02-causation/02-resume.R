# Auto-extracted from 02-resume.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
library(qss)


## -----------------------------------------------------------------------------
data("resume", package = "qss")

dim(resume)
head(resume)
summary(resume)

resume <- as_tibble(resume)


## -----------------------------------------------------------------------------
resume |>
  count(race, call) |>
  group_by(race) |>
  mutate(share = n / sum(n))

resume |>
  group_by(race) |>
  summarise(
    n = n(),
    callback_rate = mean(call),
    .groups = "drop"
  )

mean(resume$call)


## -----------------------------------------------------------------------------
rates <- resume |>
  group_by(race) |>
  summarise(callback_rate = mean(call), .groups = "drop")

rates
rates$callback_rate[rates$race == "white"] -
  rates$callback_rate[rates$race == "black"]

