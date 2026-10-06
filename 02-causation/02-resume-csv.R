# Session 2 — resume callbacks from the lab CSV (no qss package in the browser).
# Knit / run from this folder, or setwd("02-causation") in the webR Files pane.

library(tidyverse)

resume <- read_csv("data/resume.csv", show_col_types = FALSE)

resume |>
  group_by(race) |>
  summarise(
    n = n(),
    callback_rate = mean(call),
    .groups = "drop"
  )
