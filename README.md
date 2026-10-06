# MIR Prob and Stats — browser R examples (webrarian)

Live workspace: <https://iedaejin.github.io/mir-prob-stats-webrarian/>

File list (download / knit in RStudio): <https://iedaejin.github.io/mir-prob-stats-r-examples/>

**Course:** Probability and Statistics (for Policy Analysis), MIR, SPEGA, IE University, Term 1, SEP-2026 S-2.  
**Faculty:** Prof. Dae-Jin Lee, daelee@faculty.ie.edu, IE University — Scitech.

Built with [webrarian](https://github.com/coatless-wasm/webrarian) / webR. Open a session folder so `read_csv("data/...")` works. Sessions 1–2 use the CSV scripts (`01-unpop-csv.R`, `02-resume-csv.R`), not `library(qss)`. Sessions 8, 15, and 21–22 are exams and have no files.

Posit Cloud labs: <https://github.com/iedaejin/mir-prob-stats>

## Rebuild locally

```r
install.packages("pak")
pak::pak("coatless-wasm/webrarian")
install.packages("httpuv")
webrarian::bind(".")
webrarian::reading_room(".")
```

## Publishing

GitHub Pages serves the built site from the `gh-pages` branch (copy of `_site/` / `docs/`). After changing the collection:

```r
webrarian::bind(".")
```

Then refresh `docs/` from `_site/`, commit on `main`, and update `gh-pages` (for example `git subtree split --prefix docs -b gh-pages` and push).
