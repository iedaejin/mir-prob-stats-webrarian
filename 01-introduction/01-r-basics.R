## Session 1 — R basics from the QSS package (Introduction vignette)
## Adapted to tidyverse style used in QSS: An Introduction in tidyverse
## MIR Probability and Statistics | Fall 2026
## Faculty: Prof. Dae-Jin Lee <daelee@faculty.ie.edu>
##
## Primary sources:
##   vignette("intro", package = "qss")          # qss package
##   data("UNpop", package = "qss")              # Ch. 1 dataset
##   INTRO/UNpop-tidy.R on github.com/kosukeimai/qss
##
## Local copy of vignette script:
##   References/QSS/upstream/intro-vignette.R
##
## MIR Probability and Statistics | Fall 2026

library(tidyverse)
library(qss)

# =============================================================================
# QSS 1.3.1 — Arithmetic operations (vignette("intro"))
# =============================================================================
5 + 3
5 - 3
5 / 3
5^3
5 * (10 - 3)
sqrt(4)

# =============================================================================
# QSS 1.3.4 — Objects
# =============================================================================
result <- 5 + 3
result
print(result)

daejin <- "instructor"
daejin
class(result)
class(sqrt)

# =============================================================================
# QSS 1.3.5 — Vectors (world population series from the vignette)
# =============================================================================
world.pop <- c(2525779, 3026003, 3691173, 4449049, 5320817, 6127700, 6916183)
world.pop

world.pop[2]
world.pop[c(2, 4)]
pop.million <- world.pop / 1000
pop.rate <- world.pop / world.pop[1]

pop.increase <- world.pop[-1] - world.pop[-7]
percent.increase <- (pop.increase / world.pop[-7]) * 100
percent.increase

length(world.pop)
min(world.pop)
max(world.pop)
range(world.pop)
mean(world.pop)

year <- seq(from = 1950, to = 2010, by = 10)
names(world.pop) <- year
world.pop

# =============================================================================
# QSS 1.3.6 — A simple function (from the vignette)
# =============================================================================
my.summary <- function(x) {
  s.out <- sum(x)
  l.out <- length(x)
  m.out <- s.out / l.out
  out <- c(s.out, l.out, m.out)
  names(out) <- c("sum", "length", "mean")
  return(out)
}
my.summary(1:10)
my.summary(world.pop)

# =============================================================================
# QSS 1.3.7 — Data files: load UNpop from the qss package
# =============================================================================
data("UNpop", package = "qss")
class(UNpop)
names(UNpop)
dim(UNpop)
summary(UNpop)

UNpop <- as_tibble(UNpop)
UNpop

# Base-R style access (as in vignette)
UNpop$world.pop
UNpop[1:3, ]

# =============================================================================
# Tidyverse edition extras (UNpop-tidy.R pattern)
# =============================================================================
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

# Growth between successive decades (tidyverse)
UNpop |>
  arrange(year) |>
  mutate(
    pop_increase = world.pop - lag(world.pop),
    percent_increase = 100 * pop_increase / lag(world.pop)
  )

# Optional: other formats shipped with qss (vignette section on foreign files)
# library(foreign)
# read.csv(system.file("extdata", "data_files", "UNpop.csv", package = "qss"))

# =============================================================================
# Try on your own (QSS exercises spirit)
# =============================================================================
# 1. Open vignette("intro", package = "qss") and re-run the calculator block.
# 2. data(turnout, package = "qss"); glimpse(as_tibble(turnout))
# 3. Using UNpop, plot year vs world.pop.millions with ggplot2.
