# Install the QSS package (RStudio or Posit Cloud only)
# Prof. Dae-Jin Lee · daelee@faculty.ie.edu · IE University — Scitech
#
# Do NOT run this inside the webrarian browser. webR cannot install from GitHub.
# Use this in a normal R session (laptop RStudio or Posit Cloud), then knit the
# Session 1–2 .Rmd files that call library(qss).
#
# In this browser workspace, Sessions 1–2 already have CSV scripts:
#   01-introduction/01-unpop-csv.R
#   02-causation/02-resume-csv.R

# if you have not installed the `devtools` package
# install.packages("devtools")
library("devtools")
install_github("kosukeimai/qss-package", build_vignettes = TRUE)

# After it finishes, restart R if prompted, then:
# library(qss)
# data("UNpop", package = "qss")
