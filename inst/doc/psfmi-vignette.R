## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "Function", "JobControl",
  "JobDemands", "SocialSupport"), method="D1")
  pool_lr$RR_Model
  pool_lr$multiparm_p
  

## ------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "Function", "JobControl",
  "JobDemands", "SocialSupport"), keep.predictors = "Smoking",
  p.crit = 0.05, method="D3")
  pool_lr$RR_Model
  pool_lr$multiparm_p


## ------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "Function", "JobControl", "JobDemands",
  "SocialSupport"), p.crit = 0.05, cat.predictors = c("Carrying", "Satisfaction"),
  int.predictors = c("Carrying:Smoking", "Gender:Smoking"), method="D2")
  pool_lr$RR_Model
  pool_lr$multiparm_p


## ------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "Function", "JobControl", "JobDemands",
  "SocialSupport"), p.crit = 0.05, cat.predictors = c("Carrying", "Satisfaction"),
  int.predictors = c("Carrying:Smoking", "Gender:Smoking"),
  keep.predictors = c("Smoking:Carrying", "JobControl"), method="D1")
  pool_lr$RR_Model
  pool_lr$multiparm_p


## ------------------------------------------------------------------------

  library(psfmi)
  pool_lr <- psfmi_lr(data=lbpmilr, nimp=5, impvar="Impnr", Outcome="Chronic",
  predictors=c("Gender", "Smoking", "JobControl", "JobDemands",
  "SocialSupport"), p.crit = 0.05, cat.predictors = c("Carrying", "Satisfaction"),
  spline.predictors=c("Function"), int.predictors = c("Carrying:Smoking"), 
  knots=3, method="D1")
  pool_lr$RR_Model
  pool_lr$multiparm_p


## ------------------------------------------------------------------------

  library(psfmi)
  pool_coxr <- psfmi_coxr(data=lbpmicox, nimp=5, impvar="Impnr", time="Time", status="Status",
  predictors=c("Duration", "Radiation", "Onset", "Function", "Age",
  "Previous", "Tampascale", "JobControl", "JobDemand", "Social"), p.crit=1,
  cat.predictors=c("Expect_cat"), method="D1")
  pool_coxr$RR_Model
  pool_coxr$multiparm_p


## ------------------------------------------------------------------------

  library(psfmi)
  pool_coxr <- psfmi_coxr(data=lbpmicox, nimp=5, impvar="Impnr", time="Time", status="Status",
  predictors=c("Duration", "Radiation", "Onset", "Function", "Age",
  "Previous", "Tampascale", "JobControl", "JobDemand", "Social"), p.crit=0.05,
  cat.predictors=c("Expect_cat"), method="MPR")
  pool_coxr$RR_Model
  pool_coxr$multiparm_p
  

## ------------------------------------------------------------------------

  library(psfmi)
  pool_coxr <- psfmi_coxr(data=lbpmicox, nimp=5, impvar="Impnr", time="Time", status="Status",
  predictors=c("Duration", "Previous",  "Radiation", "Onset",
  "Function", "Tampascale" ), p.crit=0.05, cat.predictors=c("Satisfaction",
  "Expect_cat"), int.predictors=c("Tampascale:Radiation",
  "Expect_cat:Tampascale"), keep.predictors = "Tampascale", method="D2" )
  pool_coxr$RR_Model
  pool_coxr$multiparm_p
  

## ------------------------------------------------------------------------

  library(psfmi)
  pool_coxr <- psfmi_coxr(data=lbpmicox, nimp=5, impvar="Impnr", time="Time", status="Status",
  predictors=c("Duration", "Previous",  "Radiation", "Onset", "Function"), 
  p.crit=0.05, cat.predictors=c("Satisfaction"), spline.predictors=c("Tampascale"),
  int.predictors=c("Tampascale:Radiation"), keep.predictors = "Tampascale", 
  knots=3, method="D1")
  pool_coxr$RR_Model
  pool_coxr$multiparm_p
  

