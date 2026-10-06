# Auto-extracted from 01-vectors.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, include=FALSE-----------------------------------------------------


## -----------------------------------------------------------------------------
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

