# Auto-extracted from 01-unpop.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)
library(qss)


## -----------------------------------------------------------------------------
data("UNpop", package = "qss")
class(UNpop)
names(UNpop)
dim(UNpop)
summary(UNpop)

UNpop <- as_tibble(UNpop)
UNpop

UNpop$world.pop
UNpop[1:3, ]


## -----------------------------------------------------------------------------
UNpop <- UNpop |>
  mutate(
    world.pop.millions = world.pop / 1000,
    decade_index = row_number()
  )

UNpop |>
  summarise(
    n = n(),
    mean_pop = mean(world.pop),
    min_year = min(year),
    max_year = max(year)
  )

UNpop |>
  arrange(year) |>
  mutate(
    pop_increase = world.pop - lag(world.pop),
    percent_increase = 100 * pop_increase / lag(world.pop)
  )

