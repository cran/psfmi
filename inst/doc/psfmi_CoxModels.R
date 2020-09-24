## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------

  library(psfmi)
  pool_coxr <- psfmi_coxr(data=lbpmicox, nimp=5, impvar="Impnr", time="Time", status="Status",
  predictors=c("Duration", "Radiation", "Onset", "Function", "Age",
  "Previous", "Tampascale", "JobControl", "JobDemand", "Social"), p.crit=1,
  cat.predictors=c("Expect_cat"), method="D1", direction = "BW")
  
  pool_coxr$RR_model
  

## ---- eval=TRUE---------------------------------------------------------------

  library(psfmi)
  pool_coxr <- psfmi_coxr(data=lbpmicox, nimp=5, impvar="Impnr", time="Time", status="Status",
  predictors=c("Duration", "Radiation", "Onset", "Function", "Age",
  "Previous", "Tampascale"), p.crit=0.05,
  cat.predictors=c("Expect_cat"), method="MPR", direction = "FW")
  
  pool_coxr$RR_model_final
  
  pool_coxr$predictors_in
  

## -----------------------------------------------------------------------------

  library(psfmi)
  pool_coxr <- psfmi_coxr(data=lbpmicox, nimp=5, impvar="Impnr", time="Time", status="Status",
  predictors=c("Duration", "Previous",  "Radiation", "Onset",
  "Function", "Tampascale" ), p.crit=0.05, cat.predictors=c("Satisfaction",
  "Expect_cat"), int.predictors=c("Tampascale:Radiation",
  "Expect_cat:Tampascale"), keep.predictors = "Tampascale", method="D1", direction = "FW")
  
  pool_coxr$RR_model_final
  
  pool_coxr$predictors_in
  

## -----------------------------------------------------------------------------

  library(psfmi)
  pool_coxr <- psfmi_coxr(data=lbpmicox, nimp=5, impvar="Impnr", time="Time", status="Status",
  predictors=c("Duration", "Previous",  "Radiation", "Onset", "Function"), 
  p.crit=0.05, cat.predictors=c("Satisfaction"), spline.predictors=c("Tampascale"),
  int.predictors=c("Tampascale:Radiation"), keep.predictors = "Tampascale", 
  nknots=3, method="D1", direction = "BW")
  
  pool_coxr$RR_model_final
  
  pool_coxr$predictors_out
  

## -----------------------------------------------------------------------------

  library(psfmi)
  pool_coxr <- psfmi_coxr(data=lbpmicox, nimp=5, impvar="Impnr", time="Time", status="Status",
  predictors=c("Duration", "Previous",  "Radiation", "Onset", "Function"), 
  p.crit=0.05, cat.predictors=c("Satisfaction"), spline.predictors=c("Tampascale"),
  int.predictors=c("Tampascale:Radiation"), keep.predictors = "Tampascale", 
  nknots=3, method="D1", direction = "MPR")
  
  pool_coxr$RR_model_final
  
  pool_coxr$predictors_in
  

