# Auto-extracted from 11-sampling-dist.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------
library(tidyverse)


## -----------------------------------------------------------------------------
survey <- read_csv("data/survey_attitudes.csv")
x <- survey$support_international_cooperation

set.seed(11)
sample_means <- replicate(1000, mean(sample(x, size = 40, replace = TRUE)))

c(mean_of_means = mean(sample_means), se_approx = sd(sample_means))

tibble(sample_mean = sample_means) |>
  ggplot(aes(x = sample_mean)) +
  geom_histogram(bins = 30) +
  labs(
    title = "Sampling distribution of the mean (n = 40)",
    x = "Sample mean",
    y = "Frequency"
  )

