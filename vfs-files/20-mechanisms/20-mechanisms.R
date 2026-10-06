# Auto-extracted from 20-mechanisms.Rmd for the browser workspace (webrarian).
# Run this .R file in the console. Knitting the .Rmd needs RStudio / Posit Cloud.
# Open this session folder first so read_csv("data/...") works.

## ----setup, message=FALSE, warning=FALSE--------------------------------------
library(tidyverse)
mech <- read_csv("data/mechanism_diplomatic_contact.csv")


## -----------------------------------------------------------------------------
m_total <- lm(support_for_cooperation ~ diplomatic_contact, data = mech)
m_mech <- lm(trust_in_foreign_partner ~ diplomatic_contact, data = mech)
m_both <- lm(
  support_for_cooperation ~ diplomatic_contact + trust_in_foreign_partner,
  data = mech
)

summary(m_total)
summary(m_mech)
summary(m_both)

