## Session 1 — Software setup
## Based on QSS package + tidyverse edition Ch. 1.3.3
## Source: vignette("intro", package = "qss");
##         https://github.com/kosukeimai/qss-package
## MIR Probability and Statistics | Fall 2026
## Faculty: Prof. Dae-Jin Lee <daelee@faculty.ie.edu>

# ---------------------------------------------------------------------------
# 1. Confirm R works
# ---------------------------------------------------------------------------
R.version.string

# ---------------------------------------------------------------------------
# 2. Install (run once per computer)
# ---------------------------------------------------------------------------
# Packages required to Knit / compile course .Rmd files:
# install.packages(c("rmarkdown", "knitr"))
#
# Course analysis packages:
# install.packages(c("tidyverse", "devtools", "haven"))
# library(devtools)
# install_github("kosukeimai/qss-package", build_vignettes = TRUE)

# ---------------------------------------------------------------------------
# 3. Load packages (every session)
# ---------------------------------------------------------------------------
library(tidyverse)
library(qss)

# ---------------------------------------------------------------------------
# 4. Confirm QSS data are available (package examples)
# ---------------------------------------------------------------------------
data(package = "qss")          # list all datasets
data("UNpop", package = "qss") # Ch. 1 running example
head(UNpop)
glimpse(as_tibble(UNpop))

message("Setup complete. Proceed to 01-setup.Rmd / 01-arithmetic.Rmd")
message("Full vignette code: vignette('intro', package = 'qss')")
