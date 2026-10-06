# Session 1 — UN population from the lab CSV (no qss package in the browser).
# Knit / run from this folder, or setwd("01-introduction") in the webR Files pane.

library(tidyverse)

un <- read_csv("data/UNpop.csv", show_col_types = FALSE) |>
  mutate(pop_millions = world.pop / 1000)

glimpse(un)
nrow(un)

un |>
  summarise(
    mean_millions = mean(pop_millions),
    median_millions = median(pop_millions)
  )
