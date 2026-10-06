## Session 2 — Causality examples from the QSS package
## Based on vignette("causality", package = "qss")
## Syllabus: QSS 2.1–2.3 (resume experiment + counterfactual language)
##
## Datasets:
##   resume  — racial discrimination audit study (Bertrand & Mullainathan style)
##   social  — social-pressure GOTV randomized experiment
##
## Local copy of vignette script:
##   References/QSS/upstream/causality-vignette.R
##
## We keep TCWD potential-outcomes language in comments; estimation here
## follows the QSS chapter code (tidyverse wrappers around the same calculations).
##
## MIR Probability and Statistics | Fall 2026
## Faculty: Prof. Dae-Jin Lee <daelee@faculty.ie.edu>

library(tidyverse)
library(qss)

# =============================================================================
# QSS 2.1 — Resume experiment (vignette("causality") opening block)
# =============================================================================
data("resume", package = "qss")

dim(resume)
head(resume)
summary(resume)

resume <- as_tibble(resume)

# Callback rates by race (QSS table / means)
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

# Overall callback rate (vignette)
mean(resume$call)

# Racial gap in callback rates (naive difference in means)
rates <- resume |>
  group_by(race) |>
  summarise(callback_rate = mean(call), .groups = "drop")

rates
rates$callback_rate[rates$race == "white"] -
  rates$callback_rate[rates$race == "black"]

# =============================================================================
# QSS 2.2 — Subsetting (vignette logicals / subset)
# tidyverse equivalents of resumeB, resumeBf, ...
# =============================================================================
# Callback rate for black-sounding names (vignette)
mean(resume$call[resume$race == "black"])

resumeB <- resume |> filter(race == "black")
mean(resumeB$call)

resumeBf <- resume |>
  filter(race == "black", sex == "female") |>
  select(call, firstname)
head(resumeBf)

# Gaps among women and among men (vignette)
resume |>
  group_by(sex, race) |>
  summarise(callback_rate = mean(call), .groups = "drop") |>
  tidyr::pivot_wider(names_from = race, values_from = callback_rate) |>
  mutate(white_minus_black = white - black)

# Factor / type variable (vignette), then mean callback by type
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

# =============================================================================
# QSS 2.3 / TCWD link — potential outcomes reading of the design
# =============================================================================
# In the resume experiment, race on the resume is the randomized treatment.
# For each (fictional) employer contact:
#   Y(black), Y(white) = potential callback outcomes
# We observe only Y(race assigned). The difference in mean(call) by race
# estimates the average effect of race-sounding names on callbacks
# under random assignment (QSS RCT logic; see also social experiment below).

# =============================================================================
# QSS — Social-pressure GOTV experiment (vignette("causality"))
# =============================================================================
data("social", package = "qss")
social <- as_tibble(social)
summary(social)

# Turnout by message (vignette uses tapply)
social |>
  group_by(messages) |>
  summarise(
    n = n(),
    turnout_2006 = mean(primary2006),
    .groups = "drop"
  )

control_turnout <- mean(social$primary2006[social$messages == "Control"])
control_turnout

# Effect relative to Control (vignette)
social |>
  group_by(messages) |>
  summarise(turnout_2006 = mean(primary2006), .groups = "drop") |>
  mutate(effect_vs_control = turnout_2006 - control_turnout)

# Balance checks (age, prior turnout) — vignette
social <- social |> mutate(age = 2006 - yearofbirth)
social |>
  group_by(messages) |>
  summarise(
    mean_age = mean(age),
    mean_primary2004 = mean(primary2004),
    mean_hhsize = mean(hhsize),
    .groups = "drop"
  )

# =============================================================================
# Try on your own
# =============================================================================
# 1. vignette("causality", package = "qss") — re-run the resume block in base R.
# 2. data(minwage, package = "qss") — observational contrast (QSS later in Ch. 2).
# 3. For one resume row, write Y(black) and Y(white) in TCWD notation; which is observed?
