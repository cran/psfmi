## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(psfmi)

## -----------------------------------------------------------------------------

auc <- list(0.84, 0.78, 0.75, 0.71, 0.79)
auc_se <- list(0.04, 0.05, 0.01, 0.02, 0.03)

psfmi::pool_auc(auc, auc_se)


