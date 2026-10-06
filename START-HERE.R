# MIR Probability and Statistics — browser R workspace (webrarian / webR)
# Prof. Dae-Jin Lee · daelee@faculty.ie.edu · IE University — Scitech
#
# This workspace runs .R scripts. It does not knit .Rmd files.
# For each notebook, open the matching .R file (same name) and run it.
# Example: 03-summaries.Rmd -> 03-summaries.R
#
# Open / setwd() to a session folder so read_csv("data/...") works.
# Sessions 1–2 here: use 01-unpop-csv.R and 02-resume-csv.R (no qss in the browser).
#
# To install qss on your laptop or Posit Cloud (not here), open INSTALL-QSS.R:
#   # if you have not installed the `devtools` package
#   # install.packages("devtools")
#   library("devtools")
#   install_github("kosukeimai/qss-package", build_vignettes = TRUE)
#
# Sessions 8, 15, and 21–22 are exams and have no files.
# Knit / download list: https://iedaejin.github.io/mir-prob-stats-r-examples/
# Posit Cloud labs: https://github.com/iedaejin/mir-prob-stats

library(tidyverse)
message("tidyverse ready. Open a session folder, then run the .R script (not the .Rmd).")
message("For library(qss) on Posit/RStudio, see INSTALL-QSS.R (do not run it in this browser).")
list.dirs(".", recursive = FALSE)
