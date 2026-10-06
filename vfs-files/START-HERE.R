# MIR Probability and Statistics — browser R workspace (webrarian / webR)
# Prof. Dae-Jin Lee · daelee@faculty.ie.edu · IE University — Scitech
#
# This workspace runs .R scripts. It does not knit .Rmd files.
# For each notebook, open the matching .R file (same name) and run it.
# Example: 03-summaries.Rmd -> 03-summaries.R
#
# Open / setwd() to a session folder so read_csv("data/...") works.
# Sessions 1–2: prefer 01-unpop-csv.R and 02-resume-csv.R (no qss package here).
# Sessions 8, 15, and 21–22 are exams and have no files.
# Knit / download the .Rmd list: https://iedaejin.github.io/mir-prob-stats-r-examples/
# Posit Cloud labs: https://github.com/iedaejin/mir-prob-stats

library(tidyverse)
message("tidyverse ready. Open a session folder, then run the .R script (not the .Rmd).")
list.dirs(".", recursive = FALSE)
