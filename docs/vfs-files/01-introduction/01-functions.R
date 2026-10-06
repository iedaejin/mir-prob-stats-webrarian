# Auto-extracted from 01-functions.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------


## -----------------------------------------------------------------------------
world.pop <- c(2525779, 3026003, 3691173, 4449049, 5320817, 6127700, 6916183)

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

