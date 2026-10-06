# Auto-extracted from 02-subsetting.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
library(qss)
data("resume", package = "qss")
resume <- as_tibble(resume)


## -----------------------------------------------------------------------------
mean(resume$call[resume$race == "black"])

resumeB <- resume |> filter(race == "black")
mean(resumeB$call)

resumeBf <- resume |>
  filter(race == "black", sex == "female") |>
  select(call, firstname)
head(resumeBf)


## -----------------------------------------------------------------------------
resume |>
  group_by(sex, race) |>
  summarise(callback_rate = mean(call), .groups = "drop") |>
  tidyr::pivot_wider(names_from = race, values_from = callback_rate) |>
  mutate(white_minus_black = white - black)


## -----------------------------------------------------------------------------
resume <- resume |>
  mutate(
    type = case_when(
      race == "black" & sex == "female" ~ "BlackFemale",
      race == "black" & sex == "male"   ~ "BlackMale",
      race == "white" & sex == "female" ~ "WhiteFemale",
      race == "white" & sex == "male"   ~ "WhiteMale"
    ),
    type = factor(type)
  )

resume |>
  group_by(type) |>
  summarise(n = n(), callback_rate = mean(call), .groups = "drop")

