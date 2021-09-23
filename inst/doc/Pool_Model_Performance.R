## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(survival)
library(psfmi)

## -----------------------------------------------------------------------------

perf <- pool_performance(data=lbpmilr, nimp=5, impvar="Impnr", 
  formula = Chronic ~ Gender + Pain + Tampascale + 
  Smoking + Function + Radiation + Age + 
  Duration + BMI, 
  cal.plot=TRUE, plot.method="mean", 
  groups_cal=10, model_type="binomial")
  
perf


## -----------------------------------------------------------------------------

perf <- pool_performance(data=lbpmicox, nimp=5, impvar="Impnr", 
  formula = Surv(Time, Status) ~ Duration + Pain + Tampascale + 
  factor(Expect_cat) + Function + Radiation + Age , 
  cal.plot=FALSE, model_type="survival")
  
perf


